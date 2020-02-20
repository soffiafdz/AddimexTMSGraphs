
# Packages and functions --------------------------------------------------

pacman::p_load(
  brainGraph,
  data.table,
  tidyverse,
  foreach,
  doParallel,
  readxl,
  plyr,
  lme4, 
  multcomp,
  stargazer,
  effsize,
  moonBook,
  corrplot
)

registerDoParallel(cores = detectCores()/2)

source("customFunctions.R")


# Constants ---------------------------------------------------------------

today <- format(Sys.Date(), "%Y%m%d")

savedir <- "outData/graphs/"
savedir1 <- paste0(savedir, today, "_")

groups1 <- c("CU", "HC")
groups2 <- c("Sham", "Tx")

atlas <- "power264"
modality <- "fmri"
thresholds <- rev(seq(0.4, 0.01, -0.05))
subThresh <- 0.5

covars <- fread("inData/participants.tsv", na.strings = 'NA')
covars[,`:=`(
  group = factor(group, labels = c("Sham", "Tx")),
  sex = factor(sex, labels = c("M", "F"))
)]
setnames(
  covars,
  c(1:6), 
  c("Age", "Educ", "Exclusion"))
covars <- do.call("rbind", replicate(2, covars, simplify = F))
covars[, Session := c(rep("T0", nrow(covars)/2), rep("T1", nrow(covars)/2))]
setkey(covars, Session, Group, Study.ID)


covars <- covars[Exclusion == 0]

# covarsP <- fread("inData/participantsConn.tsv", na.strings = c('n/a','NA'))
# covarsP <- covarsP[group == 1 & exclusion == 0]
# setnames(covars, 1, "Study.ID")
# covarsP <- covarsP[, `:=`(
#     sex = factor(sex, labels = c("M", "F")),
#     education = educ_yr
# )][,c(1:4,17,12:15)]
# covarsP <- rbind(covarsP, covars, fill = T)
# covarsP[, `:=`(
#   Group = factor(c(rep("HC", 45), rep("CU", 51))),
#   group = NULL,
#   sex = as.factor(sex),
#     exclusion = NULL
# )]
# setkey(covarsP, Group, Study.ID)

# indsP <- lapply(seq_along(groups1), function(x)
    # covarsP[, which(Group == groups1[x])])
inds <- lapply(seq_along(groups2), function(x)
    covars[, which(Group == groups2[x])])

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

# pCON <- power264[networkLabel == "CON"]
# pDAN <- power264[networkLabel == "DAN"]
# pDMN <- power264[networkLabel == "DMN"]
# pFPN <- power264[networkLabel == "FPN"]
# pSAL <- power264[networkLabel == "SAL"]
# pSUB <- power264[networkLabel == "SUB"]
# pVAN <- power264[networkLabel == "VAN"]


