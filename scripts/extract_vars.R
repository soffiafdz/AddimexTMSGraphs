#! /usr/bin/env Rscript

## Packages
suppressMessages(library("data.table"))
suppressMessages(library("brainGraph"))
library("here")

## BrainGraph options
options(bg.subject_id = "participant_id",
        bg.group = "group",
        bg.session = "session",
        bg.progress = FALSE,
        bg.ncpus = 8)

## Covars; indir; and filtering parameters
covars  <- readr::read_rds(here('data/processed/rds/covars.rds'))
g_dir   <- here("data/processed/rds/graphs")
t_met   <- c("raw", "density")
gs      <- c("gs", "ngs")
parcel  <- c("power264", "gordon333", paste0("schaefer", c(1,2,4), "00x7"))

dt.G <- dt.V <- list()
for (i in t_met) {
  for (j in gs) {
    for (k in parcel) {
      gname <- sprintf("%s_%s_%s.rds", i, j, k)
      message(sprintf("%s - Reading %s rds", Sys.time(), gname))
      g <- readr::read_rds(here(g_dir, gname))

      message(sprintf("%s - Changing group attribute", Sys.time()))
      for (x in seq_along(g)) {
        for (y in seq_along(g[[x]][[10]])) {
          g[[x]][[10]][[y]]$"Group" <-
            covars[, paste(session, group, sep="_")][y]
        }
      }

      message(sprintf("%s - Extracting graph attributes", Sys.time()))
      sub.dt.G <- rbindlist(lapply(g, graph_attr_dt))

      message(sprintf("%s - Setting up extra attributes", Sys.time()))
      sub.dt.G[, session := stringr::str_extract(group, "T[:digit:]")][
                , `:=` (group = stringr::str_remove(group, "T[:digit:]_"),
                     thresh.method = i,
                     global_signal = j)]

      message(sprintf("%s - Appending to list", Sys.time()))
      dt.G <- append(dt.G, list(sub.dt.G))

      message(sprintf("%s - Extracting vertex attributes", Sys.time()))
      sub.dt.V <- rbindlist(lapply(g, graph_attr_dt))

      message(sprintf("%s - Setting up extra attributes", Sys.time()))
      sub.dt.V[, session := stringr::str_extract(group, "T[:digit:]")][
                , `:=` (group = stringr::str_remove(group, "T[:digit:]_"),
                     thresh.method = i,
                     global_signal = j)]

      message(sprintf("%s - Appending to list", Sys.time()))
      dt.V <- append(dt.V, list(sub.dt.V))
      rm(g)
    }
  }
}

## Save rds objects
readr::write_rds(dt.G, here("data/processed/rds/g_vars_G.rds"))
readr::write_rds(dt.V, here("data/processed/rds/g_vars_V.rds"))
