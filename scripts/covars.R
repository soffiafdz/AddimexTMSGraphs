#!/usr/bin/Rscript

## Packages
library("here")
library("data.table")
library("stringr")
library("purrr")
library("readr")

## Sessions
sessions <- c("T0", "T1", "T14", "T2", "T3")

# List of subs by session (Only needed after T1)
# The strings are extracted from the available matrices in the data directory
# Important to change the parcellation if changed later.
subs_by_sess <- function(session) {
  subs <- list.files(
    here("data", "processed", "correlation_matrices", "power264", session)
  )
  return(str_sub(subs, end = 7))
}

subs <- map(sessions, subs_by_sess)
names(subs) <- sessions

## Covariables data.table.
# This is loaded from the participants csv of the bids database.
# In order to work with the graphs analysis, rows have to be added for
# all the sessions of each participant.
# TO-DO: Add clinical data into this csv for easier work.
# Maybe second script importing and cleaning xlsx spreadsheets.

## Groups
groups <- c("Sham", "Real")

## Covars
# Read tsv
covars_base <- fread(here("./data/raw/participants.tsv"))

# Label categorical data
covars_base[, `:=`(
  Group = factor(Group, labels = groups),
  Sex = factor(Sex, labels = c("M", "F"))
  )
]

# Create multiple rows for different sessions
# Here is important for the script to calculate the number of rows
# automatically from the data for easy updates.
covars <- rbind(
  covars_base,
  covars_base[Study.ID %in% subs$T1],
  covars_base[Study.ID %in% subs$T14],
  covars_base[Study.ID %in% subs$T2],
  covars_base[Study.ID %in% subs$T3]
)

covars[, Session := c(
  rep(sessions[[1]], length(subs[[1]])),
  rep(sessions[[2]], length(subs[[2]])),
  rep(sessions[[3]], length(subs[[3]])),
  rep(sessions[[4]], length(subs[[4]])),
  rep(sessions[[5]], length(subs[[5]]))
  )
]

# Reorder and set key
setcolorder(
  covars,
  c("Study.ID", "Session", "Group", "Sex", "Age", "Educ", "Excl")
)
setkey(covars, Session, Group, Study.ID)

## INDS - Needed for BrainGraph analysis
inds <- lapply(seq_along(sessions), function(x)
  lapply(seq_along(groups), function(y)
    covars[, which(Group == groups[y] & Session == sessions[x])]
  )
)

# Name list for easy readability
inds <- set_names(inds, sessions)
inds <- map(inds, set_names, groups)

# Remove empty list (T14, Real)
# inds[[3]][[2]] <- NULL

# Flatten
# inds <- unlist(inds, recursive = FALSE)

## Save RDS objects
write_rds(groups, here("./data/processed/rds/groups.rds"))
write_rds(sessions, here("./data/processed/rds/sessions.rds"))
write_rds(covars, here("./data/processed/rds/covars.rds"))
write_rds(inds, here("./data/processed/rds/inds.rds"))
