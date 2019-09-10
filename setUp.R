
# Packages and functions --------------------------------------------------

pacman::p_load(
  brainGraph, data.table, tidyverse, reshape2, moonBook, xtable,
  foreach, doParallel, afex, GGally, ggpubr, effsize, WRS2, readxl, plyr
)

registerDoParallel(cores = 10)

source("customFunctions.R")


# Constants ---------------------------------------------------------------

today <- format(Sys.Date(), "%Y%m%d")

savedir <- "outData/graphs/"
savedir1 <- paste0(savedir, today, "_")

groups1 <- c("CU", "HC")
groups2 <- c("Sham", "Tx")

atlas <- "power264"
modality <- "fmri"
# thresholds <- 0.25
thresholds <- rev(seq(0.5, 0.01, -0.025))
subThresh <- 0.65

covars <- fread("inData/participants.csv", na.strings = 'NA')
setnames(covars, 1, "Study.ID")
covars[,`:=`(
  group = factor(group, labels = c("Sham", "Tx")),
  sex = factor(sex, labels = c("M", "F"))
)]
setkey(covars, group, Study.ID)

covars1 <- covars[exclusion == 0]
covars2 <- covars1[Study.ID %in% sprintf("sub-%03d",
    c(2:4,7:8,15,20,22:25,27,31,32,34,36))]
covars3 <- covars2[!Study.ID %in% sprintf("sub-%03d",
    c(15,23,25,31,34))]

covarsP <- fread("inData/participantsConn.csv", na.strings = c('n/a','NA'))
covarsP <- covarsP[group == 1 & exclusion == 0]
setnames(covars, 1, "Study.ID")
covarsP <- covarsP[, `:=`(
    sex = factor(sex, labels = c("M", "F")),
    education = educ_yr
)][,c(1:4,17,12:15)]
covarsP <- rbind(covarsP, covars, fill = T)
covarsP[, `:=`(
  group = factor(c(rep("HC", 45), rep("CU", 46))),
  sex = as.factor(sex),
    exclusion = NULL
)]
setkey(covarsP, group, Study.ID)

indsP <- lapply(seq_along(groups1), function(x)
    covarsP[, which(group == groups1[x])])
inds1 <- lapply(seq_along(groups2), function(x)
    covars1[, which(group == groups2[x])])
inds2 <- lapply(seq_along(groups2), function(x)
    covars2[, which(group == groups2[x])])
inds3 <- lapply(seq_along(groups2), function(x)
    covars3[, which(group == groups2[x])])

# Atlas -------------------------------------------------------------------

power264 <- fread('inData/atlas_power_r.csv', header = T)
power264[, `:=`(
    name = factor(name),
    lobe = factor(lobe),
    hemi = factor(hemi),
    network = factor(network),
    V9 = NULL)]

power264[network == "Cingulo-opercular Task Control", networkLabel := "CON"]
power264[network == "Dorsal attention", networkLabel := "DAN"]
power264[network == "Default mode", networkLabel := "DMN"]
power264[network == "Fronto-parietal Task Control", networkLabel := "FPN"]
power264[network == "Salience", networkLabel := "SAL"]
power264[network == "Subcortical", networkLabel := "SUB"]
power264[network == "Ventral attention", networkLabel := "VAN"]

# pCON <- power[networkLabel == "CON"]
# pDAN <- power[networkLabel == "DAN"]
# pDMN <- power[networkLabel == "DMN"]
# pFPN <- power[networkLabel == "FPN"]
# pSAL <- power[networkLabel == "SAL"]
# pSUB <- power[networkLabel == "SUB"]
# pVAN <- power[networkLabel == "VAN"]


