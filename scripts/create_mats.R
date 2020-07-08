## Required packages

library('here')
library('data.table')
library('purrr')
library('stringr')

## Set here the parcellation to work with
parcell <- "power264"

## Timeseries

filter_ts <- function(session, parcellation = parcell) {
  list.files(
    path = here("data", "raw", "timeseries", parcellation),
    pattern = paste(session, parcellation, "ts.1D", sep = "_"),
    full.names = T
  )
}

ts_dirs <- list(
  t0 = filter_ts("*ses-t0"),
  t1 = filter_ts("*ses-t1"),
  t14 = filter_ts("*ses-t14"),
  t2 = filter_ts("*ses-t2"),
  t3 = filter_ts("*ses-t3")
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
    "data", "processed", "correlation_matrices", parcell, names(corr_dts)[[i]]
    )
  dir.create(corr_dir, showWarnings = FALSE, recursive = TRUE)
  dirs_list <- paste(corr_dir, names(corr_mats[[i]]), sep = "/")
  walk2(corr_dts[[i]], dirs_list, 
    ~ fwrite(
      .x, file = paste0(.y, ".tsv"), sep = "\t", na = NaN, col.names = FALSE
      )
    )
}

