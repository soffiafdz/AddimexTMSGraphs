
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

groups <- c("Sham", "Tx")
sessions <- c("T0", "T1")

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
  c("Study.ID", "Age", "Sex", "Group", "Educ", "Excl")
)
covars <- do.call("rbind", replicate(2, covars, simplify = F))
covars[, Session := c(rep("T0", nrow(covars)/2), rep("T1", nrow(covars)/2))]
setcolorder(covars, c("Study.ID", "Session", "Group", "Age", "Sex", "Educ", "Excl"))
setkey(covars, Session, Group, Study.ID)
covars <- covars[Excl == 0]

inds <- lapply(seq_along(sessions), function(x)
    lapply(seq_along(groups), function(y)
        covars[, which(Group == groups[y] & Session == sessions[x])]))

inds <- set_names(inds, sessions)
for (i in seq_along(inds)) {inds[[i]] <- set_names(inds[[i]], groups)}

indsFlat <- unlist(inds, recursive = F)


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


# Load RDS ----------------------------------------------------------------

## Matrices

mats <- read_rds('outData/RDS/mats.RDS')

## Graphs

loadDate <- 20200302

g <- read_rds(paste0(savedir, loadDate, '_g.RDS'))
gGroup <- read_rds(paste0(savedir, loadDate, '_gGroup.RDS'))
