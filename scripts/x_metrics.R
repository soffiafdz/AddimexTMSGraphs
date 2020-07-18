#! /usr/bin/Rscript

## Packages
library("data.table")
library("readr")
library("brainGraph")
library("purrr")
library("here")

## RDS objects
gph <- read_rds(here("./data/processed/graphs/gph.rds"))
rnets <- read_rds(here("./data/processed/rds/rnets.rds"))

## Graph Attributes/Metrics data.table
metrics <- map_depth(gph, 4, graph_attr_dt)
metrics <- map_depth(metrics, 3, rbindlist)
metrics <- map_depth(metrics, 2, rbindlist)
metrics <- map(metrics, rbindlist)

for (i in seq_along(names(metrics))) {
  metrics[[i]][, Session := names(metrics)[i]]
}

metrics <- rbindlist(metrics)
setkey(metrics, threshold, Session, Study.ID)

## Small.world data.tale
sworld <- map(rnets, "small")

for (i in seq_along(names(sworld))) {
  sworld[[i]][, Session := names(sworld)[i]]
}

sworld <- rbindlist(sworld)

thresh <- unique(metrics[, threshold])
for (i in seq_along(thresh)) {
  sworld[threshold == i, threshold_new := thresh[i]]
}

sworld[, threshold := NULL]
setnames(sworld, "threshold_new", "threshold")
setkey(sworld, threshold, Session, Study.ID)

## Join
gattr <- metrics[sworld]
gattr[, c("atlas", "modality", "i.density", "i.Lp", "i.Cp", "i.Group") := NULL]

## Save rds object
write_rds(gattr, here("./data/processed/rds/gph_attr.rds"))
