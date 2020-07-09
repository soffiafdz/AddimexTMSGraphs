#!/usr/bin/Rscript

## Packages
library("here")
library("data.table")
library("purrr")
library("stringr")
library("brainGraph")

## Set here the parcellation to work with
atlas <- "power264"

## Check existence of correlation matrices' directory.
## If inexistent, create them from timeseries data.
if (!dir.exists(here("data", "raw", "correlation_matrices", atlas))) {
  ## Timeseries
  filter_ts <- function(session, parcellation = atlas) {
    list.files(
      path = here("data", "raw", "timeseries", parcellation),
      pattern = paste(session, parcellation, "ts.1D", sep = "_"),
      full.names = T
    )
  }

  ts_dirs <- list(
    T0 = filter_ts("*ses-t0"),
    T1 = filter_ts("*ses-t1"),
    T14 = filter_ts("*ses-t14"),
    T2 = filter_ts("*ses-t2"),
    T3 = filter_ts("*ses-t3")
  )

  # Extract subs' numbers
  ts_subs <- map_depth(ts_dirs, 2, str_extract, pattern = "(sub|ctr)-[0-9]{3}")

  # Read files
  tseries <- map_depth(ts_dirs, 2, fread)

  # Apply names
  tseries <- map2(tseries, ts_subs, set_names)

  ## Correlations
  corr_mats <- suppressWarnings(map_depth(tseries, 2, cor, method = "pearson"))
  corr_dts <- map_depth(corr_mats, 2, data.table)

  # Change NA -> NaN *Really necessary?
  # corr_mats <- modify_depth(corr_mats, 2, ~ ifelse(is.na(.), NaN, .))
  change_na <- function(DT, replacement) {
    for (n in seq_along(DT)) {
      set(DT, i = which(is.na(DT[[n]])), j = n, value = replacement)
    }
  }

  invisible(map_depth(corr_dts, 2, change_na, replacement = NaN))

  # Convert all negative correlations to 0
  neg_to_0 <- function(DT) {
    for (n in seq_along(DT)) {
      set(DT, i = which(DT[[n]] < 0), j = n, value = 0)
    }
  }

  invisible(map_depth(corr_dts, 2, neg_to_0))

  # Write correlation matrices into folder.
  for (i in seq_along(corr_dts)) {
    corr_dir <- here(
      "data", "processed", "correlation_matrices", atlas, names(corr_dts)[[i]]
    )
    dir.create(corr_dir, showWarnings = FALSE, recursive = TRUE)
    dirs_list <- paste(corr_dir, names(corr_mats[[i]]), sep = "/")
    walk2(corr_dts[[i]], dirs_list,
      ~ fwrite(
        .x, file = paste0(.y, ".tsv"), sep = "\t", na = NaN, col.names = FALSE
      )
    )
  }
}

## Load needed objects
## Confirm it's the same atlas before running!
covars <- readRDS(here("./data/processed/rds/covars.rds"))
inds <- readRDS(here("./data/processed/rds/inds.rds"))

## Matrices - BrainGraph

# Matrices files
matfiles <- list.files(
  list.dirs(
    here("data", "processed", "correlation_matrices", atlas)
  ),
  "sub-[0-9]*.tsv",
  full.names = TRUE
)

# Threshold parameters
thresholds <- rev(seq(0.4, 0.01, -0.05))
sub_threshold <- 0.5

# Finals mats
mats <- create_mats(
  matfiles,
  modality = "fmri",
  threshold.by = "consensus",
  mat.thresh = thresholds,
  sub.thresh = sub_threshold,
  inds = inds
)

## Save RDS
saveRDS(mats, here("./data/processed/rds/mats.rds"))
saveRDS(thresholds, here("./data/processed/rds/thresholds.rds"))
