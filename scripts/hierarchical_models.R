#! /usr/bin/Rscript

## Packages
library(data.table)
library(readr)
library(here)
library(lme4)
library(stargazer)
library(afex)
library(ggplot2)
library(ggthemes)
library(latex2exp)
library(extrafont)
library(viridis)

## RDS objects
covars    <- read_rds(here("./data/processed/rds/clinical+covars.rds"))
gattr <- read_rds(here("./data/processed/rds/gph_attr.rds"))

## Join data.tables
setkey(covars, Study.ID, Session, Group)
setkey(gattr, Study.ID, Session, Group)
gdata     <- covars[gattr]

# Preproc
metrics   <- c("density", "strength", "mod.wt", "num.hubs.wt", "E.global.wt",
               "E.local.wt", "E.local", "E.global", "Cp.norm", "Lp.norm", "sigma")
dems      <- c("Study.ID", "Session", "Group", "threshold")
clins     <- c("BIS", "BISc", "BISm", "BISn", "VAS", "CCQn", "CCQg")
colms     <- c(dems, metrics, clins, "FD")
gdmod    <- gdata[Session %in% c("T0", "T1"), ..colms]

## Fonts
ffont     <- "Sura"

## Colours
# #00429d,#75a5af,#ffffef,#f3737f,#93003a

## Linear Mixed Model: Base
## Not significant: num.hubs.wt; E.local.wt
mod_afex  <- mixed(sigma ~ Session*Group + FD + VAS + BIS +
                   (1 + Session|Study.ID) + (1|threshold),
                 data = gdmod, method = 'LRT')
mod_afex

summary(mod <- lme4::lmer(E.global.wt ~ Session * Group + FD +
                    (1+Session|Study.ID) + (1|threshold),
                  data = gdmod))

gdm  <- copy(gdmod)
gdm[, pred_dist := fitted(mod)]

p <- ggplot(gdm, aes(Session, E.global.wt, group = Study.ID, color = Group)) +
  geom_point(shape = 21, size = 1, stroke = .3, fill = "white") +
  geom_line(size = 0.25) +
  ylab(TeX("Metric by $\\tau$")) +
  theme_tufte(base_size = 12, base_family = ffont) +
  scale_colour_manual(values = c("#00429d","#93003a")) +
  facet_wrap(vars(threshold), scales = "free_y") +
  theme(axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())
ggsave(here("figures/test1.pdf"), )

p <- ggplot(gdm1[threshold == 0.4],
             aes(Session, pred_dist1, group = Study.ID, color = Group)) +
  geom_point(shape = 21, size = 1.5, fill = "white") +
  geom_line(size = 0.25) +
  ylab("Predicted slopes: Eff Global") +
  theme_tufte(base_size = 12, base_family = ffont) +
  scale_colour_manual(values = c("#00429d","#93003a")) +
  theme(axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())
ggsave(here("figures/test1.pdf"), )

cowplot::plot_grid()
