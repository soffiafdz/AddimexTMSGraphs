#!/usr/bin/env Rscript

## Packages
library("here")
library("data.table")
library("readr")
library("purrr")
library("lubridate")

## Load data
covars <- read_rds(here("./data/processed/rds/covars.rds"))
covars[Study.ID == "sub-015", Session := c("T0", "T1", "T3")]
covars[Session == "T14", Session := "T1-4"]
setkey(covars, Study.ID, Session)


## Load datasets
clin_dir <- "./data/raw/clinical"
dsets_names <- c(
  "BIS-11.csv",
  "CCQ-G.csv",
  "CCQ-N.csv",
  "DEMOGRAPHIC.csv",
  "Inventory.csv",
  "HARS.csv",
  "HDRS.csv",
  "TMS_calendar_permonth.csv",
  "Tobacco.csv",
  "VAS.csv")
dsets <- map(dsets_names, ~fread(here(clin_dir, .x)))

# Add framewise displacement
dsets[[length(dsets) + 1]] <- fread(here("./data/raw/fd.csv"))

## RID column -> sub-000
walk(dsets, ~set(., j = "rid", value = sprintf("sub-%03d", .$rid)))

# Rename RID and Stage
walk(dsets, setnames, c("rid", "stage"), c("Study.ID", "Session"))

## Clinical datasets cleaning
# BIS-11
dsets[[1]] <- dsets[[1]][, .(Study.ID, Session,
  BIS_C = cog, BIS_M = mot, BIS_N = nonp, BIS = tot_score)]
setkey(dsets[[1]], Study.ID, Session)
covars <- dsets[[1]][covars]

# CCQ-G
dsets[[2]] <- dsets[[2]][, .(Study.ID, Session, CCQG = ccq_g)]
setkey(dsets[[2]], Study.ID, Session)
covars <- dsets[[2]][covars]

# CCQ-N
dsets[[3]] <- dsets[[3]][, .(Study.ID, Session, CCQN = ccq_n)]
setkey(dsets[[3]], Study.ID, Session)
covars <- dsets[[3]][covars]

# Demographics... Not sure about keeping
dsets[[4]] <- dsets[[4]][, .(Study.ID,
  Civ = factor(q5_civ,
    levels = c(1:5),
    labels = c("Single", "Married", "Divorced", "Separated", "Widowed")),
  Empl = factor(q6_employeeyr,
    levels = c(1:8),
    labels = c("Full-time", "Half-time", "Free-lance", "Scholarized","Not-scholarized", "Retired", "Housewife", "Unemployee")),
  Sustance = factor(q6_sustance,
    levels = c(1,2),
    labels = c("Crack-cocaine","Cocaine")),
  TCons = q7_tconsume)]
setkey(dsets[[4]], Study.ID)
covars <- dsets[[4]][covars]

# Inventory ...Not sure about keeping
dsets[[5]] <- dsets[[5]][, .(Study.ID, Session,
  Date = dmy(date),
  Tx = factor(as.integer(othq3_b), levels = c(0:2),
    labels = c("None", "Psych&Pharm", "Pharm")),
  UTamph = factor(ut_amp, levels = c(1:2), labels = c("+", "-")),
  UTbzd = factor(ut_bzd, levels = c(1:2), labels = c("+", "-")),
  UTcoc = factor(ut_coc, levels = c(1:2), labels = c("+", "-")),
  UTmet = factor(ut_met, levels = c(1:2), labels = c("+", "-")),
  UTmor = factor(ut_mor, levels = c(1:2), labels = c("+", "-")),
  UTthc = factor(ut_thc, levels = c(1:2), labels = c("+", "-")),
  Use = factor(auto1, levels = c(0:2), labels = c("1Visit", "Yes", "No")),
  Relapse = factor(auto4, levels = c(0:4),
    labels = c("No-use", "Reincidence", "Relapse", "Decrease", "Equal")),
  Status = factor(auto5, levels = c(0:7),
    labels = c("1Visit", "Better", "Moderately-better", "Slightly-better",
      "No-changes", "Slightly-worse", "Moderately-worse", "Worse")))]
# Fixing mistake
dsets[[5]][Study.ID == "sub-054" & Session == "T3", Session := "T2"]
setkey(dsets[[5]], Study.ID, Session)
setkey(covars, Study.ID, Session)
covars <- dsets[[5]][covars]

# Hamilton Anxiety
dsets[[6]] <- dsets[[6]][, .(Study.ID, Session,
  HARS = hars_tot, HARS_cat = hars_categories)]
setkey(dsets[[6]], Study.ID, Session)
covars <- dsets[[6]][covars]

# Hamilton Depression
dsets[[7]] <- dsets[[7]][, .(Study.ID, Session,
  HDRS = tot_score, HDRS_cat = score_categories)]
setkey(dsets[[7]], Study.ID, Session)
covars <- dsets[[7]][covars]

# Calendar "Per_month"
dsets[[8]][month == 1, Session := "T1"]
dsets[[8]][month == 0, Session := "T0"]
dsets[[8]] <- dsets[[8]][, .(Study.ID, Session,
  Month = month,
  Date = dmy(date),
  Cons_Freq = frequency_last_month,
  Cons_Grams = grams_last_month)]
setkey(dsets[[8]], Study.ID, Session)
covars <- dsets[[8]][covars]

# Tobacco
dsets[[9]] <- dsets[[9]][, .(Study.ID, Tobacco = consumption,
  Tobacco_start = age_begin,
  Tobacco_years = years_con,
  Cigs_day = cig_day)]
setkey(dsets[[9]], Study.ID)
covars <- dsets[[9]][covars]

# VAS
dsets[[10]] <- dsets[[10]][, .(Study.ID, Session, VAS = vas)]
setkey(dsets[[10]], Study.ID, Session)
setkey(covars, Study.ID, Session)
covars <- dsets[[10]][covars]

# Framewise-displacement
# Return sub-015 back to normal
covars[Study.ID == "sub-015" & Session == "T3", Session := "T2"]
dsets[[11]] <- dsets[[11]][, .(Study.ID, Session, FD = mean_fd)]
setkey(covars, Study.ID, Session)
setkey(dsets[[11]], Study.ID, Session)
covars <- dsets[[11]][covars]


## Delete duplicate date and return keys to normal
covars[, Date := NULL]
setnames(covars, "i.Date", "Date")
covars[Session == "T1-4", Session := "T14"]
setkey(covars, Session, Group, Study.ID)

## Save RDS
write_rds(dsets, here("./data/processed/rds/clinical_datasets.rds"))
write_rds(covars, here("./data/processed/rds/clinical+covars.rds"))

