## Required packages

library('here')
library('purrr')
library('data.table')
library('stringr')

## Timeseries

filter_ts <- function(session, parcellation = "power264") {
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

#Read files
tseries <- map_depth(ts_dirs, 2, fread)

#Apply names
tseries <- map2(tseries, ts_subs, set_names)

## Correlations

corr_mats <- suppressWarnings(map_depth(tseries, 2, cor, method = "pearson"))
corr_mats <- modify_depth(corr_mats, 2, ~ ifelse(is.na(.), NaN, .))

