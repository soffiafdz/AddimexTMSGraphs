#!/usr/bin/Rscript
## Set-up Parallelization
doMC::registerDoMC(13)

#library("foreach")
#library("doParallel")
#library("plyr")
library("purrr")
library("brainGraph")
library("here")

## Load rds objects and schaefer parcellations
covars      <- readr::read_rds(here("data/processed/rds/covars.rds"))
#inds        <- readr::read_rds(here("data/processed/rds/inds.rds"))
thresholds  <- readr::read_rds(here("data/processed/rds/thresholds.rds"))
mats        <- readr::read_rds(here("data/processed/rds/mats.rds"))

#grps        <- c("Sham", "Real")
#sessions    <- c("T0", "T1", "T2", "T3")

source(here("scripts/schaefer_atlas.R"))

## Functions for purrr iteration
g_sub   <- function(input, thresholds) {
  A_sub  <- input$A.norm.sub
  atlas  <- names(input)

  g <- vector("list", length(thresholds))
  for (i in seq_along(thresholds)) {
    g[[i]]  <- make_brainGraphList(A_sub[[i]], atlas, modality = "fmri",
                                  threshold = thresholds[[i]],
                                  weighted = TRUE,
                                  gnames = covars$Study.ID,
                                  groups = covars$group)
  }
  return(g)
}

g_group   <- function(input, thresholds) {
  A_mean <- input$A.norm.mean
  atlas  <- names(input)

  gg <- vector("list", length(thresholds))
  for (i in seq_along(thresholds)) {
    gg[[i]] <- make_brainGraphList(A_mean[[i]], atlas, modality = "fmri",
                                   threshold = thresholds[[i]],
                                   weighted = TRUE,
                                   gnames = paste(covars[, session],
                                                  covars[, group],
                                                  sep = "_"))
  }
  return(gg)
}

## Set names to matrices for output
names(mats) <- c("raw", "dens")

## Main
g  <- map2(mats, thresholds, ~ map_depth(.x, 2, g_sub, thresholds = .y))
gg <- map2(mats, thresholds, ~ map_depth(.x, 2, g_group, thresholds = .y))

## Save rds objects (compressed)
readr::write_rds(g, here("data/processed/rds/g.rds"), "gz", compression = 9L)
readr::write_rds(gg, here("data/processed/rds/gg.rds"), "gz", compression = 9L)
