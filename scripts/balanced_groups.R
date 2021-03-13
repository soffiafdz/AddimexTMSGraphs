#!/usr/bin/Rscript

## Packages
#library("here")
#library("data.table")
#suppressMessages(library("purrr"))
#suppressMessages(library("brainGraph"))

# Source Matrices script
source(here::here("scripts/create_mats.R"))

# Matfiles
message(sprintf("%s - Reading correlation_matrices filenames", Sys.time()))
corr_dir <- "data/processed/correlation_matrices"
matfiles <- mats_bal <- vector("list", length = 2)
for (i in seq_along(gsignal)) {
  matfiles[[i]] <- vector("list", length = length(parcels))
  for (j in seq_along(parcels)) {
    matfiles[[i]][[j]] <-
      unlist(map(sessions[1:2], function(x)
                 map_chr(covars[session == x & exclusion == 0,
                                participant_id], function(y)
                                  list.files(here(corr_dir,
                                                  gsignal[i],
                                                  parcels[j],
                                                  x),
                                             y, full.names = TRUE))))
  }
}

matfiles <- set_names(matfiles, gsignal)
matfiles <- map(matfiles, set_names, parcels)

# Mats
thresh_by  <- c("raw", "density")
thresholds <- readr::read_rds(here("data/processed/rds/thresholds.rds"))
groups     <- c("Sham", "Real")
inds_bal   <- lapply(seq_along(sessions[1:2]), function(x)
  lapply(seq_along(groups), function(y)
    covars[exclusion == 0,
           which(group == groups[y] & session == sessions[x])]))

inds_bal <- set_names(inds_bal, sessions[1:2])
inds_bal <- map(inds_bal, set_names, groups)

mats_dir <- here("data/processed/rds/mats_bal.rds")
if (file.exists(mats_dir)) {
  message(sprintf("%s - Loading matrices", Sys.time()))
  mats_bal <- readr::read_rds(mats_dir)
} else {
  message(sprintf("%s - Creating matrices", Sys.time()))
  for (i in seq_along(thresh_by)) { # Raw vs density
    mats_bal[[i]] <- map_depth(matfiles, 2, create_mats,
                           modality = "fmri",
                           threshold.by = thresh_by[[i]],
                           mat.thresh = thresholds[[i]],
                           inds = unlist(inds_bal, recursive = FALSE))
  }

  ## Save RDS
  message(sprintf("%s - Writing matrices as rds", Sys.time()))
  readr::write_rds(mats_bal, mats_dir, compress = "gz", compression = 9L)
}

## Graphs
## BrainGraph options
doMC::registerDoMC(8)
options(bg.subject_id = "participant_id",
        bg.group = "group",
        bg.session = "session",
        bg.progress = FALSE,
        bg.ncpus = 8)

rds_dir     <- here("data/processed/rds")

message(sprintf("%s - Loading Schaefer atlases", Sys.time()))
source(here("scripts/schaefer_atlas.R"))

tmp_dir <- file.path(rds_dir, "g_tmp")
if (!dir.exists(tmp_dir)) dir.create(tmp_dir, recursive = TRUE)

# Raw vs density
for (i in seq_along(mats_bal)) {
  message(sprintf("%s - Threshold method: %s", Sys.time(), names(mats_bal[i])))

  for (j in seq_along(mats_bal[[i]])) {
    message(sprintf("%s - Global Signal: %s",
                    Sys.time(), names(mats_bal[[i]][j])))

    # 5 diff parcellations
    for (k in seq_along(mats_bal[[i]][[j]])) {
      atlas   <- names(mats_bal[[i]][[j]][k])
      A_mean  <- mats_bal[[i]][[j]][[k]]$A.norm.mean
      message(sprintf("%s - Parcellation: %s",
                      Sys.time(), names(mats_bal[[i]][[j]][k])))

      ## Threshold/density
      for (t in seq_along(thresholds[[i]])) {
        message(sprintf("%s - Treshold: %02i/%i",
                        Sys.time(), t, length(thresholds[[i]])))

        ## Group-level
        g_file <- here(tmp_dir, sprintf("%s_gb%i%i%02i.rds", atlas, i, j, t))
        if (!file.exists(g_file)) {
          message(sprintf("%s - Creating group-level graph", Sys.time()))
          g_tmp <- make_brainGraphList(A_mean[[t]], atlas, modality = "fmri",
                                       threshold = thresholds[[i]][t],
                                       weighted = TRUE, level = "group",
                                       weighting = "pearson",
                                       gnames = unique(paste(covars[, group],
                                                             covars[session %in% c("T0", "T1"),
                                                                    session],
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

for (i in seq_along(mats_bal)) {
  for (j in seq_along(mats_bal[[i]])) {
    for (k in seq_along(mats_bal[[i]][[j]])) {
      lt    <- length(thresholds[[i]])
      gg    <- vector("list", lt)
      atlas <- names(mats_bal[[i]][[j]][k])
      gname <- sprintf("%s_%s_%s_group_bal.rds", ifelse(i == 1, "raw", "dens"),
                       ifelse(j == 1, "gs", "ngs"), atlas)
      if (!file.exists(here(tmp_dir, gname))) {
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
          write_rds(gg, here(tmp_dir, gname), "gz", compression = 9L)
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
