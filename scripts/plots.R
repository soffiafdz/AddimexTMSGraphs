#!/usr/bin/env Rscript

## Packages
library(data.table)
library(readr)
library(brainGraph)
library(ggplot2)
library(ggrepel)
library(gghalves)
library(here)

## Load data
covars    <- read_rds(here("./data/processed/rds/clinical+covars.rds"))
gattr     <- read_rds(here("./data/processed/rds/gph_attr.rds"))

## Join data.tables
setkey(covars, Study.ID, Session, Group)
setkey(gattr, Study.ID, Session, Group)

gdata     <- covars[gattr]

## Fonts
library("extrafont")
ffont     <- "Sura"

## Plots ##
# Threshold visualization

# Preproc
metrics   <- c("density", "strength", "mod.wt", "num.hubs.wt", "E.global.wt",
               "E.local.wt", "Cp.norm", "Lp.norm", "sigma")
dems      <- c("Study.ID", "Session", "Group", "threshold")
colms     <- c(dems, metrics)

# Reshape to Long
gdlong    <- data.table::melt(gdata[Session %in% c("T0", "T1"), ..colms],
  id.vars = dems, measure.vars = metrics,
  variable.name = "Metric", value.name = "Val")
setkey(gdlong, Metric, Group, Session)

# Extract means, mins, max and quartiles
gdmean    <- gdlong[, .(Val = mean(Val)),
                    by = .(threshold, Metric, Session, Group)]
setkey(gdmean, Metric, Group, Session)
gdmin     <- gdmean[, .SD[which.min(Val)], keyby = .(Metric, Group, Session)]
gdmax     <- gdmean[, .SD[which.max(Val)], keyby = .(Metric, Group, Session)]
gdmin[, Val := round(Val, 2)]
gdmax[, Val := round(Val, 2)]
gdlabs    <- unique(gdmin, by = c("Metric", "Val", "Group"))
gdlabs[, l := "Min"]
gdlabs2   <- unique(gdmax, by = c("Metric", "Val", "Group"))
gdlabs2[, l := "Max"]
gdlabs    <- rbindlist(list(gdlabs, gdlabs2))
gdquarts  <- gdmean[gdmean[,.(
                      quart1 = quantile(Val, 0.25),
                      quart2 = quantile(Val, 0.75)), by = .(Metric, Group)]]

## Sparklines
p         <- ggplot(gdmean, aes(x = threshold, y = Val)) +
  facet_grid(vars(Metric), vars(Group), scales = "free_y") +
  geom_ribbon(data = gdquarts,
              aes(ymin = quart1, ymax = quart2), fill = "grey93", alpha = 0.75) +
  geom_line(aes(linetype = Session), size = 0.3) +
  geom_point(data = gdlabs, shape = 21, size = 1.5, fill = "white") +
  geom_label_repel(data = gdlabs, aes(label = Val), family = ffont, size = 2, force = 1.3,
                   label.padding = 0.1, min.segment.length = 0, segment.size = .2, segment.alpha = 0.7, alpha = 0.7) +
  scale_x_continuous(bquote(tau),breaks = seq(0, .4, .1)) +
  scale_y_continuous(expand = c(0.1, 0)) +
  theme(text = element_text(size = 11, family = ffont)) +
  theme_tufte(base_size = 10, base_family = ffont) +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        strip.text.y = element_text(angle = 0))
# Save to see
ggsave(here("figures/test"), device = "pdf")

## Derivatives

gdwide    <- gdata[Session %in% c("T0", "T1"), ..colms]
setkey(gdwide, Group, Session)


