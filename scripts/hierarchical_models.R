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

summary(mod <- lmer(E.global.wt ~ Session * Group + (1+Session|Study.ID) + (1|threshold),
  data = gattr[Session %in% c("T0","T1")]))

p <- ggplot(data[threshold %in% c(0.12, 0.2, 0.32, 0.4)], aes(Session, pred_dist, group = Study.ID, color = Group)) +
  geom_line(size = 0.25) +
  theme_minimal(base_size = 10) +
  facet_grid(vars(threshold))

p1 <- ggplot(data[threshold %in% c(0.12, 0.2, 0.32, 0.4)], aes(Session, E.global.wt, group = Study.ID, color = Group)) +
  geom_line(size = 0.25) +
  theme_minimal(base_size = 10) +
  facet_grid(vars(threshold))
ggsave(here("figures/test.tiff"), )

mod <- lmer(sigma ~ Session + (1|Study.ID:threshold),
  data = gattr)
