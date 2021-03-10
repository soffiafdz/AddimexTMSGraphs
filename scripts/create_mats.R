#!/usr/bin/Rscript

## Packages
library("here")
library("data.table")
library("purrr")
library("brainGraph")

# Parsing function for timeseries files
filter_ts <- function(session, gsignal, parcellation) {
  list.files(path = here("data/raw/timeseries", gsignal, parcellation),
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
      dir.create(corr_dir, showWarnings = FALSE, recursive = TRUE)
    }

    dirs_list <- paste(corr_dir, names(mats[[i]]), sep = "/")
    walk2(mats[[i]], dirs_list, ~ fwrite(.x, file = paste0(.y, ".tsv"),
                                         sep = "\t", na = NaN,
                                         col.names = FALSE))
  }
}

## Set here the parcellation to work with
source(here("scripts/schaefer_atlas.R"))
parcels <- c("power264", "gordon333", paste0("schaefer", c(1,2,4), "00x7"))
gsignal <- c("gs", "ngs")

## Check existence of correlation matrices' directory.
## If inexistent, create them from timeseries data.
for (parcel in parcels) {
  for (gs in gsignal) {
    outdir <- here("data/processed/correlation_matrices", gs, parcel)
    if (!dir.exists(outdir)) {
      ts_dirs <- list(
        T0 = filter_ts("*ses-t0", gs, parcel),
        T1 = filter_ts("*ses-t1", gs, parcel),
        T2 = filter_ts("*ses-t2", gs, parcel),
        T3 = filter_ts("*ses-t3", gs, parcel)
      )

      timeseries <- create_ts(ts_dirs)
      correlation_mats <- ts2mats(timeseries)

      # Write matrices to data directory to be read by brainGraph function;
      # Global signal output will be separated into different directories
      mats2files(correlation_mats, outdir)
    }
  }
}

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

# Threshold parameters; 1: thresholds; 2: densities
thresh_by <- c("raw", "density")
thresholds[[1]] <- rev(seq(0.4, 0.00, -0.02))
thresholds[[2]] <- seq(0.95, 0.05, -.05)
#sub_threshold <- 0.6

##FileExist test
if (file.exists()) {
  message(sprintf("%s - Loading existing matrices", Sys.time()))
  mats <- readr::read_rds(here("data/processed/rds/mats.rds"))
} else {
  # Matrices files
  message(sprintf("%s - Reading correlation_matrices filenames", Sys.time()))
  matfiles <- thresholds <- mats <- vector("list", length = 2)
  for (i in seq_along(gsignal)) {
    matfiles[[i]] <- vector("list", length = length(parcels))
    for (j in seq_along(parcels)) {
      matfiles[[i]][[j]] <- unlist(
        map(sessions, function(x)
          map_chr(covars[x, Study.ID], function(y)
            list.files(here("data/processed/correlation_matrices", gsignal[i],
                            parcels[j], x), y, full.names = TRUE))))
    }
  }

  matfiles <- set_names(matfiles, gsignal)
  matfiles <- map(matfiles, set_names, parcels)

  # Final mats
  message(sprintf("%s - Creating matrices", Sys.time()))
  for (i in 1:2) { # Raw vs density
    mats[[i]] <- map_depth(matfiles, 2, create_mats,
                           modality = "fmri",
                           threshold.by = thresh_by[[i]],
                           mat.thresh = thresholds[[i]],
                           inds = unlist(inds, recursive = FALSE))
  }

  ## Save RDS
  message(sprintf("%s - Writing matrices as rds", Sys.time()))
  readr::write_rds(mats, here("data/processed/rds/mats.rds"),
                   compress = "gz", compression = 9L)
  message(sprintf("%s - Writing thresholds as rds", Sys.time()))
  readr::write_rds(thresholds, here("data/processed/rds/thresholds.rds"))
}
