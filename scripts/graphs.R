#!/usr/bin/Rscript
## Set-up Parallelization
doMC::registerDoMC(8)

#library("foreach")
#library("doParallel")
#library("plyr")
suppressMessages(library("brainGraph"))
library("readr")
library("here")

## BrainGraph options
options(bg.subject_id = "participant_id",
        bg.group = "group",
        bg.session = "session",
        bg.progress = FALSE,
        bg.ncpus = 8)

## Load rds objects and schaefer parcellations
rds_dir     <- here("data/processed/rds")
covars      <- read_rds(here(rds_dir, "covars.rds"))
#inds        <- read_rds(here("data/processed/rds/inds.rds"))
thresholds  <- read_rds(here(rds_dir, "thresholds.rds"))

message(sprintf("%s - Loading matrices", Sys.time()))
mats        <- read_rds(here(rds_dir, "mats.rds"))
names(mats) <- c("raw", "density")

#grps        <- c("Sham", "Real")
#sessions    <- c("T0", "T1", "T2", "T3")

message(sprintf("%s - Loading Schaefer atlases", Sys.time()))
source(here("scripts/schaefer_atlas.R"))

tmp_dir <- file.path(rds_dir, "g_tmp")
if (!dir.exists(tmp_dir)) dir.create(tmp_dir, recursive = TRUE)

# Raw vs density
for (i in seq_along(mats)) {
  message(sprintf("%s - Threshold method: %s", Sys.time(), names(mats[i])))

  for (j in seq_along(mats[[i]])) {
    message(sprintf("%s - Global Signal: %s",
                    Sys.time(), names(mats[[i]][j])))

    # 5 diff parcellations
    for (k in seq_along(mats[[i]][[j]])) {
      atlas   <- names(mats[[i]][[j]][k])
      A_sub   <- mats[[i]][[j]][[k]]$A.norm.sub
      A_mean  <- mats[[i]][[j]][[k]]$A.norm.mean
      message(sprintf("%s - Parcellation: %s",
                      Sys.time(), names(mats[[i]][[j]][k])))

      ## Threshold/density
      for (t in seq_along(thresholds[[i]])) {
        message(sprintf("%s - Treshold: %02i/%i",
                        Sys.time(), t, length(thresholds[[i]])))

        ## Sub-level
        g_file <- here(tmp_dir, sprintf("%s_s%i%i%02i.rds", atlas, i, j, t))
        if (!file.exists(g_file)) {
          message(sprintf("%s - Creating subject-level graph", Sys.time()))
          #g[[i]][[j]][[k]][[t]] <-
          g_tmp <- make_brainGraphList(A_sub[[t]], atlas, modality = "fmri",
                                       threshold = thresholds[[i]][t],
                                       weighted = TRUE, level = "subject",
                                       weighting = "pearson",
                                       gnames = covars$participant_id,
                                       grpNames = covars$group)

          message(sprintf("%s - Compressing and writing graph", Sys.time()))
          write_rds(g_tmp, g_file, "gz", compression = 9L)
          message(sprintf("%s - Graph saved", Sys.time()))
          rm(g_tmp)
        } else {
          message(sprintf("%s - Subject graph already exists", Sys.time()))
        }

        ## Group-level
        g_file <- here(tmp_dir, sprintf("%s_g%i%i%02i.rds", atlas, i, j, t))
        if (!file.exists(g_file)) {
          message(sprintf("%s - Creating group-level graph", Sys.time()))
        #gg[[i]][[j]][[k]][[t]] <-
          g_tmp <- make_brainGraphList(A_mean[[t]], atlas, modality = "fmri",
                              threshold = thresholds[[i]][t],
                              weighted = TRUE, level = "group",
                              weighting = "pearson",
                              gnames = unique(paste(covars[, group],
                                                    covars[, session],
                                                    sep = "_")))

          message(sprintf("%s - Compressing and writing graph", Sys.time()))
          write_rds(g_tmp, g_file, "gz", compression = 9L)
          message(sprintf("%s - Graph saved", Sys.time()))
          rm(g_tmp)
        } else {
          message(sprintf("%s - Group graph already exists", Sys.time()))
        }
      }
    }
  }
}

out_dir <- here(rds_dir, "graphs")
if (!dir.exists(out_dir)  dir.create(out_dir)

for (i in seq_along(mats)) {
  lt <- length(thresholds[[i]])
  for (j in seq_along(mats[[i]])) {
    for (k in seq_along(mats[[i]][[j]])) {
      g  <- gg <- vector("list", lt)
      atlas <- names(mats[[i]][[j]][k])
      sname <- sprintf("%s_%s_%s.rds", ifelse(i == 1, "raw", "dens"),
                       ifelse(j == 1, "gs", "ngs"), atlas)
      if (!file.exists(here(out_dir, sname))) {
        fns <- length(list.files(tmp_dir, sprintf("%s_s%i%i", atlas, i, j)))
        if (fns == lt) {
          message(sprintf("%s - Reading subject graphs for %s",
                          Sys.time(), atlas))
          for (t in seq_along(thresholds[[i]])) {
            g_file <- here(tmp_dir, sprintf("%s_s%i%i%02i.rds",
                                            atlas, i, j, t))
            g[[t]] <- read_rds(g_file)
          }
          message(sprintf("%s - Saving: %s", Sys.time(), sname))
          write_rds(g, here(out_dir, sname), "gz", compression = 9L)
          rm(g)
        } else {
          message(sprintf("%s - There weren't enough subj-graphs for: %s",
                          Sys.time(), atlas))
        }
      } else {
        message(sprintf("%s - %s already exists", Sys.time(), sname))
      }

      gname <- sprintf("%s_%s_%s_group.rds", ifelse(i == 1, "raw", "dens"),
                       ifelse(j == 1, "gs", "ngs"), atlas)
      if (!file.exists(here(out_dir, gname))) {
        fng <- length(list.files(tmp_dir, sprintf("%s_g%i%i", atlas, i, j)))
        if (fng == lt) {
          message(sprintf("%s - Reading group graphs for %s",
                          Sys.time(), atlas))
          for (t in seq_along(thresholds[[i]])) {
            g_file <- here(tmp_dir, sprintf("%s_g%i%i%02i.rds",
                                            atlas, i, j, t))
            gg[[t]] <- read_rds(g_file)
          }
          message(sprintf("%s - Saving: %s", Sys.time(), gname))
          write_rds(gg, here(out_dir, gname), "gz", compression = 9L)
          rm(gg)
        } else {
          message(sprintf("%s - There weren't enough group-graphs for: %s",
                          Sys.time(), atlas))
        }
      } else {
        message(sprintf("%s - %s already exists", Sys.time(), gname))
      }
    }
  }
}
