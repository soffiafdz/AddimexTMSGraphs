#!/usr/bin/env Rscript

## Packages
#library("readr")
#library("purrr")
suppressMessages(library("data.table"))
suppressMessages(library("brainGraph"))
#suppressMessages(library("furrr"))
library("here")

## BrainGraph options
doMC::registerDoMC(35)
#future::plan(multicore, workers = 20)
options(bg.subject_id = "participant_id",
        #bg.group = "group",
        #bg.session = "session",
        bg.progress = FALSE,
        bg.ncpus = 35)

rds_dir <- here("data/processed/rds")
g_dir   <- here(rds_dir, "graphs")
covars  <- readr::read_rds(here('data/processed/rds/covars.rds'))
t_met   <- c("raw", "dens")
gs      <- c("gs", "ngs")
parcel  <- c("power264", "gordon333", paste0("schaefer", c(1,2,4), "00x7"))
n_rand <- 250L

## Load rds graphs
for (i in t_met) {
  for (j in gs) {
    for (k in parcel) {
      rname <- sprintf("%s_%s_%s_rand.rds", i, j, k)
      rfile <- here(g_dir, rname)
      if (file.exists(rfile)) {
        message(sprintf("%s - %s already created",
                         Sys.time(), rname))
      } else {
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

        outdir <- here(rds_dir, sprintf("rand/%s_%s_%s", i, j, k))
        message(sprintf("%s - Creating random graphs", Sys.time()))
        rand.g <- analysis_random_graphs(g, N = n_rand, savedir = outdir,
                                         clustering = FALSE)

        readr::write_rds(rand.g, rfile)
        rm(g, rand.g)
      }
    }
  }
}
