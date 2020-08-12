#!/usr/bin/env Rscript

## Packages
library("data.table")
library("readr")
library("brainGraph")
library("ggplot2")
library("here")

## Load data
covars <- read_rds(here("./data/processed/rds/clinical+covars.rds"))
gattr <- read_rds(here("./data/processed/rds/gph_attr.rds"))

## Join data.tables
setkey(covars, Study.ID, Session, Group)
setkey(gattr, Study.ID, Session, Group)

gdata <- covars[gattr]

## Plots ##
# Threshold visualization
