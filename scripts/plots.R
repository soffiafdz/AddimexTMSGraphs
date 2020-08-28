#!/usr/bin/env Rscript

## Packages
library(data.table)
library(readr)
# library(brainGraph)
library(ggplot2)
library(ggrepel)
library(ggthemes)
library(gghalves)
library(here)
library(extrafont)
library(MESS)
library(latex2exp)

## Load data
covars    <- read_rds(here("./data/processed/rds/clinical+covars.rds"))
gattr     <- read_rds(here("./data/processed/rds/gph_attr.rds"))

## Join data.tables
setkey(covars, Study.ID, Session, Group)
setkey(gattr, Study.ID, Session, Group)

gdata     <- covars[gattr]

## Fonts
ffont     <- "Sura"

### Plots ###
## Threshold visualization
# Preproc
metrics   <- c("density", "strength", "mod.wt", "num.hubs.wt", "E.global.wt",
               "E.local.wt", "E.local", "E.global", "Cp.norm", "Lp.norm", "sigma")
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
gdquarts  <- gdmean[gdmean[,.(quart1 = quantile(Val, 0.25),
                              quart2 = quantile(Val, 0.75)),
                            by = .(Metric, Group)]]

# Sparklines
p         <- ggplot(gdmean, aes(x = threshold, y = Val)) +
  facet_grid(vars(Metric), vars(Group), scales = "free_y") +
  geom_ribbon(data = gdquarts,
              aes(ymin = quart1, ymax = quart2),
              fill = "grey93", alpha = 0.75) +
  geom_line(aes(linetype = Session), size = 0.3) +
  geom_point(data = gdlabs, shape = 21, size = 1.5, fill = "white") +
  geom_label_repel(data = gdlabs, aes(label = Val),
                   family = ffont, size = 2, force = 1.3, label.padding = 0.1,
                   min.segment.length = 0, segment.size = .2,
                   segment.alpha = 0.7, alpha = 0.7) +
  scale_x_continuous(bquote(tau),breaks = seq(0, .4, .1)) +
  scale_y_continuous(expand = c(0.1, 0)) +
  theme(text = element_text(size = 12, family = ffont)) +
  theme_tufte(base_size = 12, base_family = ffont) +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        strip.text.y = element_text(angle = 0))
# Save to see
ggsave(here("figures/sparklines_thresholds"), device = "pdf")

## Repeated Measures with integrated thresholds
# Preprocessing
# Integrals
gdwide    <- gdata[Session %in% c("T0", "T1"), ..colms]
setkey(gdwide, Group, Session)

gdints    <- gdwide[, lapply(.SD, auc, x = threshold, type = 'spline'), by = .(Study.ID, Session, Group), .SDcols = metrics]

gdplots   <- copy(gdints)
gdplots[Session == "T0", x := 1][Session == "T1", x := 2][Group == "Sham", x := x + 2]
gdplots[, x_j  := jitter(x, amount = .09)]

repmesplot <- function(metric_str, data = gdplots){
  p       <- ggplot(data, aes_string(y = metric_str)) +
    geom_point(data = data[Session == "T0"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9) +
               # color = "dodgerblue",
               # size = 1.5, alpha = .6) +
    geom_point(data = data[Session == "T1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9) +
               # color = "darkorange",
               # size = 1.5, alpha = .6) +
    geom_line(aes(x = x_j, group = Study.ID), color = "lightgray", alpha = .45) +
    geom_half_boxplot(data = data[x == 1], aes(x = x),
                      position = position_nudge(x = -.35), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1,#fill = "dodgerblue", alpha = .6) +
                      alpha = .6) +
    geom_half_boxplot(data = data[x == 2], aes(x = x),
                      position = position_nudge(x = -1.2),
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1,#fill = "darkorange", alpha = .6) +
                      alpha = .6) +
    geom_half_boxplot(data = data[x == 3], aes(x = x),
                      position = position_nudge(x = 1.3), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1,#fill = "dodgerblue", alpha = .6) +
                      alpha = .6) +
    geom_half_boxplot(data = data[x == 4], aes(x = x),
                      position = position_nudge(x = .2), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1,#fill = "darkorange", alpha = .6) +
                      alpha = .6) +
    geom_half_violin(data = data[x == 1], aes(x = x),
                     position = position_nudge(x = -.4),#fill = "dodgerblue", alpha = .6) +
                      alpha = .6) +
    geom_half_violin(data = data[x == 2], aes(x = x),
                     position = position_nudge(x = -1.4),#fill = "darkorange", alpha = .6) +
                      alpha = .6) +
    geom_half_violin(data = data[x == 3], aes(x = x), side = "r",
                     position = position_nudge(x = 1.45),#fill = "dodgerblue", alpha = .6) +
                      alpha = .6) +
    geom_half_violin(data = data[x == 4], aes(x = x), side = "r",
                     position = position_nudge(x = .45),#fill = "darkorange", alpha = .6) +
                      alpha = .6) +
    #Define additional settings
    scale_x_continuous(breaks=c(1,2,3,4), labels=c("Before", "After","Before", "After"),
                        limits=c(0, 5),
                        sec.axis = dup_axis(breaks = c(1.5, 3.5),
                                            labels = c("Real", "Sham"))) +
    ylab(TeX(paste0("$\\int_{0.02}^{0.4} ", metric_str, "(\\tau) d_{\\tau}"))) +
    # theme(text = element_text(size = 10, family = ffont)) +
    theme_tufte(base_size = 12, base_family = ffont) +
    theme(axis.title.x = element_blank(),
          # axis.text.y = element_blank(),
          axis.ticks = element_blank())
     # theme_classic()
  ggsave(here("figures", paste0("repmes_", metric_str, ".pdf")))
}

## Run all metrics and save them
# purrr::walk(metrics, repmesplot)
