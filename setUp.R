
# Packages and functions --------------------------------------------------

pacman::p_load(
  brainGraph, data.table, tidyverse, reshape2, moonBook, xtable,
  foreach, doParallel, afex, GGally, ggpubr, effsize, WRS2, readxl, plyr
)

registerDoParallel(cores = 2)

source("customFunctions.R")


# Constants ---------------------------------------------------------------

today <- format(Sys.Date(), "%Y%m%d")

savedir <- "outData/graphs/"
savedir1 <- paste0(savedir, today, "_")

groups1 <- c("control", "user")
groups2 <- c("sham", "tx")

atlas <- "power"
modality <- "fmri"
thresholds <- 0.25
thresholdWB <- 0.5
sub.thresh <- 0.65

covars <- fread("inData/participants.txt")
setnames(covars, 1, "Study.ID")
covars[,`:=`(
  group = as.factor(group),
  sex = as.factor(sex)
)]
setkey(covars, group, Study.ID)

covars2 <- covars[-c(1, 8, 9, 13)]
covars3 <- covars2[-c(2, 4:6, 9, 10, 14, 16:17, 19, 23, 27)]

covarsP <- fread("inData/controls.txt")
setnames(covars, 1, "Study.ID")
covarsP[, sex := factor(sex, labels = c("M", "F"))]
covarsP <- rbind(covarsP, covars, fill = T)
covarsP[, `:=`(
  group = factor(rep(groups1, each = 31)),
  sex = as.factor(sex)
)]
setkey(covarsP, group, Study.ID)

indsP <- mkInds(covarsP, groups1)
inds <- mkInds(covars, groups2)
inds2 <- mkInds(covars2, groups2)
inds3 <- mkInds(covars3, groups2)
