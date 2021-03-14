#!/usr/bin/env Rscript

## Packages
library(readr)
library(data.table)
# library(table1)
library(arsenal)
library(here)

## Load data
covars <- read_rds(here("./data/processed/rds/clinical+covars.rds"))

## Demographics Table
# Change some levels
levels(covars$Sex)      <- c("Male", "Female")
levels(covars$Tx)[2:3]  <- c("Psych & Pharm", "Pharm")

# Change some labels
labels(covars) <- c(
  Age       = "Age (years)",
  Educ      = "Education (years)",
  Civ       = "Civil status",
  Empl      = "Employment (last 3 y)",
  Substance = "Main substance",
  Tobacco   = "Smoking",
  Cigs_day  = "Cigarettes/day",
  Tx        = "Treatment",
  Ystart    = "Onset age of cocaine use",
  Tcons     = "Years of cocaine use"
)

# Units
# units(covars$Age)       <- "years"
# units(covars$Educ)      <- "years"
# units(covars$Empl)      <- "last 3y"

# Table
t1 <- tableby(Group ~ Sex + Age + Educ + Civ + Empl + Tobacco + Tobacco_years +
  Cigs_day + Substance + Tx + Ystart + Tcons,
  data = covars[Session == "T0"],
  test = FALSE)

summary(t1, text = TRUE)

# table1(~ Sex + Age + Educ + Civ + Empl + Tobacco + Tobacco_years +
#          Cigs_day + Substance + Tx + Ystart + Tcons | Group,
#        data = covars[Session == "T0"], overall = "Total")

## Clinic summary table

# Labels
labels(covars)   <- c(
  BIS         = "BIS-11",
  BISc        = "BIS-11 Cognitive",
  BISm        = "BIS-11 Motor",
  BISn        = "BIS-11 Non-planning",
  VAS         = "Visual Analog Scale",
  CCQn        = "CCQ-Now",
  CCQg        = "CCQ-General",
  Cons_Freq   = "Consumption (freq)",
  Cons_Grams  = "Consumption (g)",
  FD          = "In-scanner movement (mm)"
)

# Units
# units(covars$VAS)         <- "cm"
# units(covars$FD)          <- "mm"
# units(covars$Cons_Freq)   <- "freq"
# units(covars$Cons_Grams)  <- "g"

# Table
t2 <- tableby(Session ~ Sex + Age + Cons_Freq + Cons_Grams + Relapse + Status +
  BIS + VAS + FD,
  data = covars[Session %in% c("T0", "T1")],
  strata = Group,
  total = FALSE,
  test = FALSE)

summary(t2, text = TRUE)

# table1(~ BIS + BISc + BISm + BISn + VAS + CCQn + CCQg + FD | Session*Group,
# table1(~ Sex + Age + Cons_Freq + Cons_Grams + Relapse + Status + BIS + VAS + FD | Group*Session,
#        data = covars[Session %in% c("T0", "T1")], overall = FALSE)

## Longitudinal summary data
gdlong <- copy(covars)
gdlong[Group == "Sham" & Session == "T0", Session := "T-1"]
gdlong[Group == "Sham" & Session == "T1", Session := "T0"]
gdlong[Group == "Sham" & Session == "T14", Session := "T1"]
gdlong[, Session := factor(Session, levels = paste0("T", c(-1, 0, 1, 2, 3)))]

# Table
t3 <- tableby(Session ~ Sex + Age + Cons_Freq + Cons_Grams + Relapse +
  Status + BIS + VAS + FD,
  data = gdlong,
  total = FALSE,
  test = FALSE)

summary(t3, text = TRUE)

# table1(~ Sex + Age + Cons_Freq + Cons_Grams + Relapse + Status +
#          BIS + VAS + FD | Session,
#         data = gdlong, overall = FALSE)
