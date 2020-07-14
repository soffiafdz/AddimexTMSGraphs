#!/usr/bin/env Rscript

## Packages
library("readr")
library("purrr")
library("furrr")
library("brainGraph")
library("here")

## Load rds graphs
sessions <- read_rds(here("./data/processed/rds/sessions.rds"))
gph <- read_rds(here("./data/processed/graphs/gph.rds"))

## No of random networks
no_rand <- 5e2

## Set up multiprocessing
future::plan(multiprocess)

## Remove linging group (T14-Real)
gph$T14$Real <- NULL

## Main
rnets <- future_map2(gph, sessions,
  ~ analysis_random_graphs(
    .x,
    N = no_rand,
    # N = 2,
    savedir = here("data", "processed", "graphs", "rand", .y),
    clustering = FALSE
  ),
  .progress = TRUE
)

## Save random_nets object
write_rds(rnets, here("./data/processed/graphs/rnets.rds"))
