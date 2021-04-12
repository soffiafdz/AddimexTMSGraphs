#!/usr/bin/env Rscript

## Packages
library(here)
library(data.table)
library(readr)
library(purrr)
library(lubridate)

## Load data
covars <- read_rds(here("data/processed/rds/covars.rds"))
covars[participant_id == "sub-015", session := c("T0", "T1", "T3")]
#covars[session == "T14", session := "T1-4"]
setkey(covars, participant_id, session)


## Load datasets
csv_dir <- "data/raw/csv"
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
  "VAS.csv",
  "fd.csv")
dsets <- map(dsets_names, ~fread(here(csv_dir, .x)))

## RID column -> sub-000
walk(dsets, ~set(., j = "rid", value = sprintf("sub-%03d", .$rid)))

# Rename RID and Stage
walk(dsets, setnames, c("rid", "stage"), c("participant_id", "session"))

## Clinical datasets cleaning
# BIS-11
dsets[[1]] <- dsets[[1]][, .(participant_id, session,
  bis_c = cog, bis_m = mot, bis_n = nonp, bis = tot_score)]
setkey(dsets[[1]], participant_id, session)
covars <- dsets[[1]][covars]

# CCQ-G
dsets[[2]] <- dsets[[2]][, .(participant_id, session, ccq_g)]
setkey(dsets[[2]], participant_id, session)
covars <- dsets[[2]][covars]

# CCQ-N
dsets[[3]] <- dsets[[3]][, .(participant_id, session, ccq_n)]
setkey(dsets[[3]], participant_id, session)
covars <- dsets[[3]][covars]

# Demographics... Not sure about keeping
dsets[[4]] <- dsets[[4]][, .(participant_id,
  civ = factor(q5_civ,
    levels = c(1:5),
    labels = c("Single", "Married", "Divorced", "Separated", "Widowed")),
  employment = factor(q6_employeeyr,
    levels = c(1:8),
    labels = c("Full-time", "Half-time", "Free-lance", "Scholarized",
               "Not-scholarized", "Retired", "Housewife", "Unemployed")),
  m_income = q6_month,
  substance = factor(q6_sustance,
    levels = c(1,2),
    labels = c("Crack-cocaine","Cocaine")),
  y_start = q7_yrstart,
  t_cons = q7_tconsume)]
# Drop unused levels
dsets[[4]][, employment := droplevels(employment)]
setkey(dsets[[4]], participant_id)
covars <- dsets[[4]][covars]

# Inventory ...Not sure about keeping
dsets[[5]] <- dsets[[5]][, .(participant_id, session,
  date = dmy(date),
  tx = factor(as.integer(othq3_b), levels = c(0:2),
    labels = c("None", "Psych&Pharm", "Pharm")),
  ut_amp = factor(ut_amp, levels = c(1:2), labels = c("+", "-")),
  ut_bzd = factor(ut_bzd, levels = c(1:2), labels = c("+", "-")),
  ut_coc = factor(ut_coc, levels = c(1:2), labels = c("+", "-")),
  ut_met = factor(ut_met, levels = c(1:2), labels = c("+", "-")),
  ut_mor = factor(ut_mor, levels = c(1:2), labels = c("+", "-")),
  ut_thc = factor(ut_thc, levels = c(1:2), labels = c("+", "-")),
  use = factor(auto1, levels = c(0:2), labels = c("1Visit", "Yes", "No")),
  relapse = factor(auto4, levels = c(0:4),
    labels = c("No-use", "Reincidence", "Relapse", "Decrease", "Equal")),
  status = factor(auto5, levels = c(0:7),
    labels = c("1Visit", "Better", "Moderately-better", "Slightly-better",
      "No-changes", "Slightly-worse", "Moderately-worse", "Worse")))]
# Fixing mistake
dsets[[5]][participant_id == "sub-054" & session == "T3", session := "T2"]
setkey(dsets[[5]], participant_id, session)
setkey(covars, participant_id, session)
covars <- dsets[[5]][covars]

# Hamilton Anxiety
dsets[[6]] <- dsets[[6]][, .(participant_id, session,
  hars = hars_tot, hars_cat = hars_categories)]
setkey(dsets[[6]], participant_id, session)
covars <- dsets[[6]][covars]

# Hamilton Depression
dsets[[7]] <- dsets[[7]][, .(participant_id, session,
  hdrs = tot_score, hdrs_cat = score_categories)]
setkey(dsets[[7]], participant_id, session)
covars <- dsets[[7]][covars]

# Calendar "Per_month"
dsets[[8]][month == 1, session := "T1"]
dsets[[8]][month == 0, session := "T0"]
dsets[[8]] <- dsets[[8]][, .(participant_id, session,
  date = dmy(date),
  month = month,
  cons_freq = frequency_last_month,
  cons_grams = grams_last_month)]
setkey(dsets[[8]], participant_id, session)
covars <- dsets[[8]][covars]

# Tobacco
dsets[[9]] <- dsets[[9]][, .(participant_id,
  tobacco = factor(consumption, levels = 0:1, labels = c("No", "Yes")),
  tobacco_start = age_begin,
  tobacco_years = years_con,
  cigs_day = cig_day)]
setkey(dsets[[9]], participant_id)
covars <- dsets[[9]][covars]

# VAS
dsets[[10]] <- dsets[[10]][, .(participant_id, session, vas)]
setkey(dsets[[10]], participant_id, session)
setkey(covars, participant_id, session)
covars <- dsets[[10]][covars]

# Framewise-displacement
# Return sub-015 back to normal
covars[participant_id == "sub-015" & session == "T3", session := "T2"]
dsets[[11]] <- dsets[[11]][, .(participant_id, session, fd = mean_fd)]
setkey(covars, participant_id, session)
setkey(dsets[[11]], participant_id, session)
covars <- dsets[[11]][covars]


## Delete duplicate date and return keys to normal
covars[, date := NULL]
setnames(covars, "i.date", "date")

setcolorder(covars, c("participant_id", "session", "group", "exclusion",
  "sex", "age", "educ", "civ", "employment", "m_income", "substance",
  "tobacco", "tobacco_start", "tobacco_years", "cigs_day", "tx", "y_start",
  "t_cons", "date", "month", "use", "relapse", "cons_freq", "cons_grams",
  "status", "ut_amp", "ut_bzd", "ut_coc", "ut_met", "ut_mor", "ut_thc",
  "bis", "bis_c", "bis_m", "bis_n", "vas", "ccq_n", "ccq_g",
  "hdrs", "hdrs_cat", "hars", "hars_cat", "fd"))


#covars[session == "T1-4", session := "T14"]
setkey(covars, session, group, participant_id)

## Save RDS
write_rds(dsets, here("data/processed/rds/clean_csvs.rds"))
write_rds(covars, here("data/processed/rds/clin+covars.rds"))
