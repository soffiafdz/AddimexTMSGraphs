#! /usr/bin/Rscript

## Packages
library("data.table")
library("readr")
library("here")
library("lme4")

## RDS objects
gattr <- read_rds(here("./data/processed/rds/gph_attr.rds"))

## Add covars

## ## Linear Mixed Model: Small-worldness

summary(mod <- lmer(sigma ~ Session * Group + (1|Study.ID:threshold),
  data = gattr[Session %in% c("T0","T1")]))


mod <- lmer(sigma ~ Session + (1|Study.ID:threshold),
  data = gattr)
