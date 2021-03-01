#!/usr/bin/Rscript
## Set-up Parallelization
doMC::registerDoMC(8)

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

g <- gg <- vector("list", length(mats))
# Raw vs density
for (i in seq_along(mats)) {
  g[[i]] <- gg[[i]] <- vector("list", length(mats[[i]]))
  # GSignal vs No GSignal
  for (j in seq_along(mats[[i]])) {
    g[[i]][[j]] <- gg[[i]][[j]] <- vector("list", length(mats[[i]][[j]]))
    # 5 diff parcellations
    for (k in seq_along(mats[[i]][[j]])) {
      g[[i]][[j]][[k]] <- gg[[i]][[j]][[k]] <-
        vector("list", length(thresholds[[i]]))
      atlas   <- names(mats[[i]][[j]][k])
      A_sub   <- mats[[i]][[j]][[k]]$A.norm.sub
      A_mean  <- mats[[i]][[j]][[k]]$A.norm.mean

      ## Threshold/density
      for (t in seq_along(thresholds[[i]])) {
        g[[i]][[j]][[k]][[t]] <-
          make_brainGraphList(A_sub[[t]], atlas, modality = "fmri",
                              threshold = thresholds[[i]][t], weighted = TRUE,
                              .progress = FALSE, gnames = covars$Study.ID,
                              groups = covars$group)

        gg[[i]][[j]][[k]][[t]] <-
          make_brainGraphList(A_mean[[t]], atlas, modality = "fmri",
                              threshold = thresholds[[i]][t], weighted = TRUE,
                              .progress = FALSE,
                              gnames = paste(covars[, session],
                                             covars[, group], sep = "_"))
      }
    }
  }
}

### Functions for purrr iteration
#g_sub   <- function(input, thresholds) {
  #A_sub  <- input$A.norm.sub
  #atlas  <- names(input)

  #g <- vector("list", length(thresholds))
  #for (i in seq_along(thresholds)) {
    #g[[i]]  <- make_brainGraphList(A_sub[[i]], atlas, modality = "fmri",
                                  #threshold = thresholds[[i]],
                                  #weighted = TRUE,
                                  #.progress = FALSE,
                                  #gnames = covars$Study.ID,
                                  #groups = covars$group)
  #}
  #return(g)
#}

#g_group   <- function(input, thresholds) {
  #A_mean <- input$A.norm.mean
  #atlas  <- names(input)

  #gg <- vector("list", length(thresholds))
  #for (i in seq_along(thresholds)) {
    #gg[[i]] <- make_brainGraphList(A_mean[[i]], atlas, modality = "fmri",
                                   #threshold = thresholds[[i]],
                                   #weighted = TRUE,
                                   #.progress = FALSE,
                                   #gnames = paste(covars[, session],
                                                  #covars[, group],
                                                  #sep = "_"))
  #}
  #return(gg)
#}

## Set names to matrices for output
#names(mats) <- c("raw", "dens")

## Main
#g  <- map2(mats, thresholds, ~ map_depth(.x, 2, g_sub, thresholds = .y))
readr::write_rds(g, here("data/processed/rds/g.rds"), "gz", compression = 9L)

#gg <- map2(mats, thresholds, ~ map_depth(.x, 2, g_group, thresholds = .y))
readr::write_rds(gg, here("data/processed/rds/gg.rds"), "gz", compression = 9L)
