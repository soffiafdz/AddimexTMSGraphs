#!/usr/bin/env Rscript

## Packages
library("here")
library("data.table")
library("purrr")

sessions <- c("T0", "T1", "T2", "T3")
groups <- c("Sham", "Real")

# List of subs by session (Only needed after T1)
# The strings are extracted from the available matrices in the data directory
# Will use first directory that matches session (all should be the same...)
subs_by_sess <- function(session) {
  initial_dir <- grep(session,
                      list.dirs(here("data/processed/correlation_matrices")),
                      value = TRUE)[1]
  subs <- list.files(initial_dir)
  return(stringr::str_sub(subs, end = 7))
}

subs <- map(sessions, subs_by_sess)
names(subs) <- sessions

## Covariables data.table.
# This is loaded from the participants csv of the bids database.
# In order to work with the graphs analysis, rows have to be added for
# all the sessions of each participant.
# TO-DO: Add clinical data into this csv for easier work.
# Maybe second script importing and cleaning xlsx spreadsheets.

# Read tsv
covars_base <- fread(here("./data/raw/participants.tsv"))

# Label categorical data
covars_base[, `:=`(
  group = factor(group, labels = groups),
  sex = factor(sex, labels = c("M", "F"))
  )
]

# Create multiple rows for different sessions
# Here is important for the script to calculate the number of rows
# automatically from the data for easy updates.
covars <- rbind(
  covars_base,
  covars_base[participant_id %in% subs$T1],
  covars_base[participant_id %in% subs$T2],
  covars_base[participant_id %in% subs$T3]
)

covars[, session := c(
  rep(sessions[[1]], length(subs[[1]])),
  rep(sessions[[2]], length(subs[[2]])),
  rep(sessions[[3]], length(subs[[3]])),
  rep(sessions[[4]], length(subs[[4]]))
  )
]

# Reorder and set key
setcolorder(
  covars,
  c("participant_id", "session", "group", "sex", "age", "educ", "exclusion")
)
setkey(covars, session, group, participant_id)

## INDS - Needed for BrainGraph analysis
inds <- lapply(seq_along(sessions), function(x)
  lapply(seq_along(groups), function(y)
    covars[, which(group == groups[y] & session == sessions[x])]
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
# Are these needed???
#readr::write_rds(groups, here("./data/processed/rds/groups.rds"))
#readr::write_rds(sessions, here("./data/processed/rds/sessions.rds"))
readr::write_rds(covars, here("./data/processed/rds/covars.rds"))
readr::write_rds(inds, here("./data/processed/rds/inds.rds"))
