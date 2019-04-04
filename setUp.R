
# Packages and functions ----------------------------------------------------------------------

pacman::p_load(brainGraph, data.table, tidyverse, reshape2, moonBook, xtable,
               foreach, doParallel, afex, GGally, ggpubr, effsize, WRS2, readxl)

registerDoParallel(cores=1)

source('customFunctions.R')


# Location dependencies -----------------------------------------------------------------------

#Tango
home <- '/run/media/sofdez/Omega/TMS/derivatives/graphs/'

#Huasteca
# home <- '/media/neuroimagen/Omega/TMS/derivatives/graphs/'

#Constants  ==========================
today <- format(Sys.Date(), '%m-%y')
savedir <- paste0(home, 'brainGraph/')
savedir1 <- paste0(savedir, today, "_")
groups1 <- c('control', 'user')
groups2 <- c('sham', 'tx')
atlas <- "power"
modality <- 'fmri'
thresholds <- 0.2
covars <- fread("inData/participants.txt")
    names(covars)[1] <- "Study.ID"
    covars[, group := as.factor(group)]
    covars[, sex := as.factor(sex)]
    setkey(covars, group, Study.ID)
    covars2 <- covars[-c(1, 8, 9, 12)]
    covars3 <- covars2[-c(2, 4:6, 12, 14:15, 17, 21:23)]
covars_p <- fread("inData/controls.txt") %>% 
    dplyr::rename(Study.ID = participant_id) %>% 
    mutate(sex = factor(sex, labels = c('M', 'F'))) %>% 
    rbind(covars, fill = T) %>% data.table()
    covars_p[, group := rep(c('control', 'user'), each = 27)]
    covars_p[, group := as.factor(group)]
    covars_p[, sex := as.factor(sex)]
    setkey(covars_p, group, Study.ID)
inds_p <- mk_inds(covars_p, groups1)
inds <- mk_inds(covars, groups2)
    inds2 <- mk_inds(covars2, groups2)
    inds3 <- mk_inds(covars3, groups2)
