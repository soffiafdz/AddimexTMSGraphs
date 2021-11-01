#!/usr/bin/Rscript

## Packages
library("here")
suppressMessages(library("magrittr"))
suppressMessages(library("data.table"))
suppressMessages(library("purrr"))
suppressMessages(library("brainGraph"))

# Parsing function for timeseries files
filter_ts <- function(session, gsignal, parcellation) {
  list.files(here("data/raw/timeseries", gsignal, parcellation),
             pattern = paste(session, parcellation, "ts.1D", sep = "_"),
             full.names = TRUE)
}

# Reading timeseries function
create_ts <- function(dir_list) {
  # Extract subs' numbers
  ts_subs <- map_depth(dir_list, 2, stringr::str_extract,
                       pattern = "(sub|ctr)-[0-9]{3}")

  # Read files and apply names
  timeseries <- map_depth(dir_list, 2, fread)
  timeseries <- map2(timeseries, ts_subs, set_names)
  return(timeseries)
}

# Create matrices from timeseries function
ts2mats <- function(timeseries) {
  corr_mats <- suppressWarnings(map_depth(timeseries, 2,
                                          cor, method = "pearson"))

  corrs <- map_depth(corr_mats, 2, data.table)

  # Change NA -> NaN *Really necessary?
  # corr_mats <- modify_depth(corr_mats, 2, ~ ifelse(is.na(.), NaN, .))
  change_na <- function(DT, replacement) {
    for (n in seq_along(DT)) {
      set(DT, i = which(is.na(DT[[n]])), j = n, value = replacement)
    }
  }
  invisible(map_depth(corrs, 2, change_na, replacement = NaN))

  # Convert all negative correlations to 0
  neg_to_0 <- function(DT) {
    for (n in seq_along(DT)) {
      set(DT, i = which(DT[[n]] < 0), j = n, value = 0)
    }
  }
  invisible(map_depth(corrs, 2, neg_to_0))
  return(corrs)
}

mats2files <- function(mats, outdir) {
  for (i in seq_along(mats)) {
    corr_dir <- here(outdir, names(mats)[[i]])
    # If directory does not exist; create it
    if (!dir.exists(here(corr_dir))) {
      dir.create(corr_dir, showWarnings = F, recursive = T)
    }

    dirs_list <- paste(corr_dir, names(mats[[i]]), sep = "/")
    walk2(mats[[i]], dirs_list, ~ fwrite(.x, file = paste0(.y, ".tsv"),
                                         sep = "\t", na = NaN, col.names = F))
  }
}

## Set here the parcellation to work with
source(here("scripts/schaefer_atlas.R"))
#parcels <- c("power264", "gordon333", paste0("schaefer", c(1,2,4), "00x7"))
parcels <- c("power264", paste0("schaefer", c(1,2,4), "00x7"))
gsignal <- c("gs", "ngs")

## Check existence of correlation matrices' directory.
## If inexistent, create them from timeseries data.
for (parcel in parcels) {
  for (gs in gsignal) {
    # Global networks
    outdir <- here("data/processed/correlation_matrices", gs, parcel, "global")
    if (!dir.exists(outdir)) {
      message(sprintf("%s - Creating correlation_matrices (%s; %s)",
                      Sys.time(), parcel, gs))
      ts_dirs <- list(
        T0 = filter_ts("*ses-t0", gs, parcel),
        T1 = filter_ts("*ses-t1", gs, parcel),
        T2 = filter_ts("*ses-t2", gs, parcel),
        T3 = filter_ts("*ses-t3", gs, parcel)) %>%
        create_ts() %>%
        ts2mats() %>%
        mats2files(outdir)
        rm(ts_dirs)
    }

    # Subnetworks
    subnets <- get(parcel)[, levels(network)]

# fread(here('data/processed/correlation_matrices/gs/schaefer100x7/T0/sub-001.tsv')
    for (matfile in list.files(here(outdir), full.names = T, recursive = T)) {
      mat <- fread(matfile)
      for (subnet in subnets) {
        safename <- subnet %>%
          str_replace_all("/", "-") %>%
          str_replace_all(" ", "_") %>%
          str_to_lower()
        submatfile <- str_replace(matfile, "global", safename)
        outdir_sub <- str_remove(submatfile, "/sub-\\d{3}.tsv")
        if (!dir.exists(outdir_sub)) {
          message(sprintf("%s - Creating correlation_matrices (%s; %s; %s)",
                          Sys.time(), parcel, gs, subnet))
          dir.create(outdir_sub, showWarnings = F, recursive = T)
        }
        if (!file.exists(submatfile)) {
          index <- get(parcel)[network == subnet, index]
          mat_s <- mat[index, ..index]
          fwrite(mat_s, file = submatfile, sep = "\t", na = NaN, col.names = F)
          rm("index", "mat_s")
        }
      }
    }
  }
}

rm("parcel", "gs", "outdir", "outdir_sub", "subnets", "matfile",
   "mat", "subnet", "safename", "submatfile")

covars_file <- here("data/processed/rds/covars.rds")
if (!file.exists(covars_file)) {
  message(sprintf("%s - Running covars.R", Sys.time()))
  source(here("scripts/covars.R"))
} else {
  message(sprintf("%s - Loading covars & inds rds", Sys.time()))
  covars <- readr::read_rds(covars_file)
  inds <- readr::read_rds(here("data/processed/rds/inds.rds"))
  sessions <- c("T0", "T1", "T2", "T3")
}

rm(covars_file)

# Matrices files
message(sprintf("%s - Reading correlation_matrices filenames", Sys.time()))
matfiles <- submatfiles <- thresholds <- vector("list", length = 2)
for (i in seq_along(gsignal)) {
  matfiles[[i]] <- submatfiles[[i]] <- vector("list", length = length(parcels))
  for (j in seq_along(parcels)) {
    matfiles[[i]][[j]] <- unlist(
      map(sessions, function(x)
        map_chr(covars[x, participant_id], function(y)
          list.files(here("data/processed/correlation_matrices", gsignal[i],
                          parcels[j], "global", x),
                     y, full.names = TRUE))))

    subnets <- get(parcels[j])[, levels(network)] %>%
      str_replace_all("/", "-") %>%
      str_replace_all(" ", "_") %>%
      str_to_lower()

    submatfiles[[i]][[j]] <- vector("list", length = length(subnets))
    for (k in seq_along(subnets)) {
      submatfiles[[i]][[j]][[k]] <- unlist(
        map(sessions, function(x)
          map_chr(covars[x, participant_id], function(y)
            list.files(here("data/processed/correlation_matrices", gsignal[i],
                            parcels[j], subnets[k], x),
                       y, full.names = TRUE))))
    }
    submatfiles[[i]][[j]] <- set_names(submatfiles[[i]][[j]], subnets)
  }
}

matfiles <- set_names(matfiles, gsignal)
matfiles <- map(matfiles, set_names, parcels)

submatfiles <- set_names(submatfiles, gsignal)
submatfiles <- map(submatfiles, set_names, parcels)


rm("gsignal", "parcels")

# Threshold parameters; 1: thresholds; 2: densities
thresh_by <- c("raw", "density")
thresholds[[1]] <- rev(seq(0.4, 0.00, -0.02))
thresholds[[2]] <- seq(0.95, 0.05, -.05)

message(sprintf("%s - Writing thresholds as rds", Sys.time()))
readr::write_rds(thresholds, here("data/processed/rds/thresholds.rds"))

# Final mats
for (i in 1:2) { # Raw vs density
  matfile <- here("data/processed/rds",
                  paste0("mats_", thresh_by[[i]], ".rds"))

  if (file.exists(matfile)) {
    message(sprintf("%s - BrainGraph matrices (%s) already exist",
                    Sys.time(), thresh_by[[i]]))
  } else {
    message(sprintf("%s - Creating brainGraph matrices (%s)",
                    Sys.time(), thresh_by[[i]]))
    mats <- map_depth(matfiles, 2, create_mats,
                      modality = "fmri",
                      threshold.by = thresh_by[[i]],
                      mat.thresh = thresholds[[i]],
                      inds = unlist(inds, recursive = FALSE))
    # Save RDS
    message(sprintf("%s - Writing %s matrices as rds",
                    Sys.time(), thresh_by[[i]]))
    readr::write_rds(mats, matfile, compress = "gz", compression = 9L)
    rm("matfile", "mats")
  }

  matfile <- here("data/processed/rds",
                  paste0("mats_subnetworks_", thresh_by[[i]], ".rds"))

  if (file.exists(matfile)) {
    message(sprintf("%s - BrainGraph subnetwork matrices (%s) already exist",
                    Sys.time(), thresh_by[[i]]))
  } else {
    message(sprintf("%s - Creating brainGraph subnetwork matrices (%s)",
                    Sys.time(), thresh_by[[i]]))
    mats <- map_depth(matfiles, 3, create_mats,
                      modality = "fmri",
                      threshold.by = thresh_by[[i]],
                      mat.thresh = thresholds[[i]],
                      inds = unlist(inds, recursive = FALSE))
    # Save RDS
    message(sprintf("%s - Writing %s matrices as rds",
                    Sys.time(), thresh_by[[i]]))
    readr::write_rds(mats, matfile, compress = "gz", compression = 9L)
    rm("matfile", "mats")
  }
}

rm("matfile", "matfiles", "thresh_by", "thresholds", "mats")
