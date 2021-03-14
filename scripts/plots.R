#!/usr/bin/env Rscript

## Packages
library(data.table)
library(readr)
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
# ffont     <- "Sura"
ffont     <- "Merriweather"

## Colours
# #00429d,#75a5af,#ffffef,#f3737f,#93003a

# #00429d,#75a5af,#e1e1e1,#f3737f,#93003a

# "#00429d", "#35739a", "#3aa794", "#c8004c", "#93003a"

### Plots ###
## Threshold visualization
# Preproc
metrics   <- c("density", "strength", "mod.wt", "num.hubs.wt", "E.global.wt",
               "E.local.wt", "E.local", "E.global", "Cp.norm", "Lp.norm", "sigma")
dems      <- c("Study.ID", "Session", "Group", "threshold")
colms     <- c(dems, metrics)

# Reshape to Long
gdl    <- data.table::melt(gdata[Session %in% c("T0", "T1"), ..colms],
                              id.vars = dems, measure.vars = metrics,
                              variable.name = "Metric", value.name = "Val")
setkey(gdl, Metric, Group, Session)

# Extract means, mins, max and quartiles
gdmean    <- gdl[, .(Val = mean(Val)),
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
p         <- ggplot(gdmean, aes(x = threshold, y = Val, colour = Session)) +
  facet_grid(vars(Metric), vars(Group), scales = "free_y") +
  geom_ribbon(data = gdquarts,
              aes(ymin = quart1, ymax = quart2, colour = NULL),
              fill = "grey93", alpha = 0.75) +
  geom_line(size = 0.3) +
  geom_point(data = gdlabs, shape = 21, size = 1.5,
             fill = "white") +
  geom_label_repel(data = gdlabs, aes(label = Val),
                   family = ffont, size = 2, force = 1.3, label.padding = 0.1,
                   min.segment.length = 0, segment.size = .2,
                   segment.alpha = 0.7, alpha = 0.7) +
  scale_x_continuous(bquote(tau),breaks = seq(0, .4, .1)) +
  scale_y_continuous(expand = c(0.1, 0)) +
  scale_colour_manual(values = c("#00429d","#93003a")) +
  # scale_colour_viridis(discrete = TRUE, end = .8, begin = .5, option = "inferno") +
  theme(text = element_text(size = 12, family = ffont)) +
  theme_tufte(base_size = 12, base_family = ffont) +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        strip.text.y = element_text(angle = 0))
# Save to see
ggsave(here("figures/sparklines_thresholds"), device = "pdf")

## Repeated Measures with integrated thresholds
# Integrals
gdw    <- gdata[Session %in% c("T0", "T1"), ..colms]
setkey(gdw, Group, Session)

gdints    <- gdw[, lapply(.SD, auc, x = threshold, type = 'spline'),
                    by = .(Study.ID, Session, Group), .SDcols = metrics]

# Preprocessing
gdplots   <- copy(gdints)
gdplots[Session == "T0", x := 1][Session == "T1", x := 2][Group == "Sham", x := x + 2]
gdplots[, x_j  := jitter(x, amount = .09)]

# Plotting Function
repmesp1  <- function(metric_str, data = gdplots){
  p       <- ggplot(data, aes_string(y = metric_str)) +
    geom_point(data = data[Session == "T0"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#00429d") +
               # size = 1.5, alpha = .6) +
    geom_point(data = data[Session == "T1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#93003a") +
               # size = 1.5, alpha = .6) +
    geom_line(aes(x = x_j, group = Study.ID), color = "lightgray", alpha = .45) +
    geom_half_boxplot(data = data[x == 1], aes(x = x),
                      position = position_nudge(x = -.35), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 2], aes(x = x),
                      position = position_nudge(x = -1.2),
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 3], aes(x = x),
                      position = position_nudge(x = 1.3), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 4], aes(x = x),
                      position = position_nudge(x = .2), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 1], aes(x = x),
                     position = position_nudge(x = -.4), fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 2], aes(x = x),
                     position = position_nudge(x = -1.4), fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 3], aes(x = x), side = "r",
                     position = position_nudge(x = 1.45), fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 4], aes(x = x), side = "r",
                     position = position_nudge(x = .45), fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
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
purrr::walk(metrics, repmesp1)


## Repeated Measures Clinical
# Preproc
clins     <- c("BIS", "BISc", "BISm", "BISn", "VAS", "CCQn", "CCQg")
colms2    <- c(dems[-4], clins)

gdpclin   <- covars[Session %in% c("T0", "T1"), ..colms2]

gdpclin[Session == "T0", x := 1][Session == "T1", x := 2][Group == "Sham", x := x + 2]
gdpclin[, x_j  := jitter(x, amount = .09)]

# Plotting Function
repmesp2  <- function(clin_str, data = gdpclin){
  p       <- ggplot(data, aes_string(y = clin_str)) +
    geom_point(data = data[Session == "T0"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#00429d") +
               # size = 1.5, alpha = .6) +
    geom_point(data = data[Session == "T1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#93003a") +
               # size = 1.5, alpha = .6) +
    geom_line(aes(x = x_j, group = Study.ID), color = "lightgray", alpha = .45) +
    geom_half_boxplot(data = data[x == 1], aes(x = x),
                      position = position_nudge(x = -.35), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 2], aes(x = x),
                      position = position_nudge(x = -1.2),
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 3], aes(x = x),
                      position = position_nudge(x = 1.3), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_boxplot(data = data[x == 4], aes(x = x),
                      position = position_nudge(x = .2), side = "r",
                      outlier.shape = NA, center = TRUE, errorbar.draw = FALSE,
                      width = .1, fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 1], aes(x = x),
                     position = position_nudge(x = -.4), fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 2], aes(x = x),
                     position = position_nudge(x = -1.4), fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 3], aes(x = x), side = "r",
                     position = position_nudge(x = 1.45), fill = "#00429d", alpha = .6) +
                      # alpha = .6) +
    geom_half_violin(data = data[x == 4], aes(x = x), side = "r",
                     position = position_nudge(x = .45), fill = "#93003a", alpha = .6) +
                      # alpha = .6) +
    #Define additional settings
    scale_x_continuous(breaks=c(1,2,3,4), labels=c("Before", "After","Before", "After"),
                        limits=c(0, 5),
                        sec.axis = dup_axis(breaks = c(1.5, 3.5),
                                            labels = c("Real", "Sham"))) +
    # theme(text = element_text(size = 10, family = ffont)) +
    theme_tufte(base_size = 12, base_family = ffont) +
    theme(axis.title.x = element_blank(),
          # axis.text.y = element_blank(),
          axis.ticks = element_blank())
     # theme_classic()
  ggsave(here("figures", paste0("repmes_", clin_str, ".pdf")))
}

repmesp2("VAS")
repmesp2("BIS")

##  Longitudinal - Maintenance phase
gdlong <- copy(gdata)
gdlong[Group == "Sham" & Session == "T0", Session := "T-1"]
gdlong[Group == "Sham" & Session == "T1", Session := "T0"]
gdlong[Group == "Sham" & Session == "T14", Session := "T1"]
gdlong[, Session := factor(Session, levels = paste0("T", c(-1, 0, 1, 2, 3)))]

colms4 <- c(dems[-3], metrics)

# Reshape to Long
gdl2   <- data.table::melt(gdlong[, ..colms4],
                              id.vars = dems[-3], measure.vars = metrics,
                              variable.name = "Metric", value.name = "Val")
setkey(gdl2, Metric, Session)

# Extract means, mins, max and quartiles
gdmean2    <- gdl2[, .(Val = mean(Val)),
                    by = .(threshold, Metric, Session)]
setkey(gdmean2, Metric, Session)
gdmin2     <- gdmean2[, .SD[which.min(Val)], keyby = .(Metric, Session)]
gdmax2     <- gdmean2[, .SD[which.max(Val)], keyby = .(Metric, Session)]
gdmin2[, Val := round(Val, 2)]
gdmax2[, Val := round(Val, 2)]
# gdlabs3    <- unique(gdmin2, by = c("Metric", "Val"))
gdmin2[, l := "Min"]
# gdlabs4    <- unique(gdmax2, by = c("Metric", "Val"))
gdmax2[, l := "Max"]
gdlabs3    <- rbindlist(list(gdmin2, gdmax2))
gdquarts2  <- gdmean2[gdmean2[,.(quart1 = quantile(Val, 0.25),
                              quart2 = quantile(Val, 0.75)),
                            by = .(Metric)]]

# Sparklines
p <- ggplot(gdmean2, aes(x = threshold, y = Val, colour = Session)) +
  facet_wrap(vars(Metric), ncol = 4, scales = "free_y") +
  geom_ribbon(data = gdquarts2,
              aes(ymin = quart1, ymax = quart2, colour = NULL),
              fill = "grey93", alpha = 0.75) +
  geom_line(size = 0.3) +
  geom_point(data = gdlabs3, shape = 21, size = 1.5,
             fill = "white") +
  geom_label_repel(data = gdlabs3, aes(label = Val),
                   family = ffont, size = 2, force = 1.3, label.padding = 0.1,
                   min.segment.length = 0, segment.size = .2,
                   segment.alpha = 0.7, alpha = 0.7) +
  scale_x_continuous(bquote(tau),breaks = seq(0, .4, .1)) +
  scale_y_continuous(expand = c(0.1, 0)) +
  scale_colour_manual(values = c("#00429d", "#35739a", "#3aa794", "#c8004c", "#93003a")) +
  theme(text = element_text(size = 12, family = ffont)) +
  theme_tufte(base_size = 12, base_family = ffont) +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        strip.text.y = element_text(angle = 45),
        legend.position = c(.9,.15))
# Save to see
ggsave(here("figures/sparklines_thresholds-l"), device = "pdf", height = 10)


## Adapting clinical longitudinal data
colms4    <- c(dems[1:2], clins)

gdpclin2  <- gdlong[threshold == 0.2, ..colms4]

gdpclin2[
  Session == "T-1", x := 1][
  Session == "T0", x := 2][
  Session == "T1", x := 3][
  Session == "T2", x := 4][
  Session == "T3", x := 5]
gdpclin2[, x_j  := jitter(x, amount = .09)]

# Plotting Function
repmeslp1  <- function(clin_str, data = gdpclin2){
  p       <- ggplot(data, aes_string(y = clin_str)) +
    geom_point(data = data[Session == "T-1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#00429d") +
    geom_point(data = data[Session == "T0"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#35739a") +
    geom_point(data = data[Session == "T1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#3aa794") +
    geom_point(data = data[Session == "T2"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#c8004c") +
    geom_point(data = data[Session == "T3"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#93003a") +
    geom_line(aes(x = x_j, group = Study.ID), color = "lightgray", alpha = .4) +
    geom_violin(data = data[Session == "T-1"], aes(x = x),
                position = position_nudge(x = 0), fill = "#00429d",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T0"], aes(x = x),
                position = position_nudge(x = 0), fill = "#35739a",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T1"], aes(x = x),
                position = position_nudge(x = 0), fill = "#3aa794",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T2"], aes(x = x),
                position = position_nudge(x = 0), fill = "#c8004c",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T3"], aes(x = x),
                position = position_nudge(x = 0), fill = "#93003a",
                color = "white", alpha = .1, trim = FALSE) +
    #Define additional settings
    scale_x_continuous(breaks=c(1,2,3,4,5),
                       labels=c("Before sham", "Before active",
                                "2 weeks", "3 months", "6 months"),
                        limits=c(0.5, 5.5)) +
    theme_tufte(base_size = 12, base_family = ffont) +
    theme(axis.title.x = element_blank(),
          # axis.text.y = element_blank(),
          axis.ticks = element_blank())
  ggsave(here("figures", paste0("repmesl_", clin_str, ".pdf")))
}

# Plotting Function
repmeslp2  <- function(metric_str, data = gdplots2){
  ggplot(data, aes_string(y = metric_str)) +
    geom_point(data = data[Session == "T-1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#00429d") +
    geom_point(data = data[Session == "T0"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#35739a") +
    geom_point(data = data[Session == "T1"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#3aa794") +
    geom_point(data = data[Session == "T2"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#c8004c") +
    geom_point(data = data[Session == "T3"], aes(x = x_j),
               shape = 21, size = 1, fill = "white", alpha = 0.9,
               color = "#93003a") +
    geom_line(aes(x = x_j, group = Study.ID), color = "lightgray", alpha = .4) +
    geom_violin(data = data[Session == "T-1"], aes(x = x),
                position = position_nudge(x = 0), fill = "#00429d",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T0"], aes(x = x),
                position = position_nudge(x = 0), fill = "#35739a",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T1"], aes(x = x),
                position = position_nudge(x = 0), fill = "#3aa794",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T2"], aes(x = x),
                position = position_nudge(x = 0), fill = "#c8004c",
                color = "white", alpha = .1, trim = FALSE) +
    geom_violin(data = data[Session == "T3"], aes(x = x),
                position = position_nudge(x = 0), fill = "#93003a",
                color = "white", alpha = .1, trim = FALSE) +
    #Define additional settings
    scale_x_continuous(breaks=c(1,2,3,4,5),
                       labels=c("Before sham", "Before active",
                                "2 weeks", "3 months", "6 months"),
                        limits=c(0.5, 5.5)) +
    theme_tufte(base_size = 12, base_family = ffont) +
    theme(axis.title.x = element_blank(),
          # axis.text.y = element_blank(),
          axis.ticks = element_blank())
}

