#!/usr/bin/env Rscript

## Packages
library(readr)
library(data.table)
library(table1)
library(here)

## Load data
covars <- read_rds(here("./data/processed/rds/clinical+covars.rds"))

## Demographics Table
# Change some levels
levels(covars$Sex)      <- c("Male", "Female")
levels(covars$Tx)[2:3]  <- c("Psych & Pharm", "Pharm")

# Change some labels
label(covars$Educ)      <- "Education"
label(covars$Civ)       <- "Civil status"
label(covars$Empl)      <- "Employment"
label(covars$Substance) <- "Main substance"
label(covars$Tobacco)   <- "Smoking"
label(covars$Cigs_day)  <- "Cigarettes/day"
label(covars$Tx)        <- "Treatment"
label(covars$Ystart)    <- "Onset age of cocaine use"
label(covars$Tcons)     <- "Years of cocaine use"

# Units
units(covars$Age)       <- "years"
units(covars$Educ)      <- "years"
units(covars$Empl)      <- "last 3y"

# Table
# table1(~ Sex + Age + Educ + Civ + Empl + Tobacco + Tobacco_years +
#          Cigs_day + Substance + Tx + Ystart + Tcons | Group,
#        data = covars[Session == "T0"], overall = "Total")

## Clinic summary table

# Labels
label(covars$BIS)         <- "BIS-11"
# label(covars$BISc)      <- "BIS-11 Cognitive"
# label(covars$BISm)      <- "BIS-11 Motor"
# label(covars$BISn)      <- "BIS-11 Non-planning"
label(covars$VAS)         <- "Visual Analog Scale"
# label(covars$CCQn)      <- "CCQ-Now"
# label(covars$CCQg)      <- "CCQ-General"
label(covars$Cons_Freq)   <- "Consumption"
label(covars$Cons_Grams)  <- "Consumption"
label(covars$FD)          <- "In-scanner Movement"

# Units
units(covars$VAS)         <- "cm"
units(covars$FD)          <- "mm"
units(covars$Cons_Freq)   <- "freq"
units(covars$Cons_Grams)  <- "g"

# Table
# table1(~ BIS + BISc + BISm + BISn + VAS + CCQn + CCQg + FD | Session*Group,
table1(~ Sex + Age + Cons_Freq + Cons_Grams + Relapse + Status +
         BIS + VAS + FD | Group*Session,
       data = covars[Session %in% c("T0", "T1")], overall = FALSE)

## Longitudinal summary data
gdlong <- copy(covars)
gdlong[Group == "Sham" & Session == "T0", Session := "T-1"]
gdlong[Group == "Sham" & Session == "T1", Session := "T0"]
gdlong[Group == "Sham" & Session == "T14", Session := "T1"]
gdlong[, Session := factor(Session, levels = paste0("T", c(-1, 0, 1, 2, 3)))]

# Table
table1(~ Sex + Age + Cons_Freq + Cons_Grams + Relapse + Status +
         BIS + VAS + FD | Session,
        data = gdlong, overall = FALSE)
