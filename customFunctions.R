
# Custom Functions --------------------------------------------------------

readTimeSeries <- function(dirTMS, dirCTRL = NULL, parcellation = "power264") {
    # Applying function by groups
    dirs <- list(
                 t0 = list.files(
                                 paste(dirTMS, parcellation, sep = "/"),
                                 paste("*ses-t0", parcellation, "ts.1D", sep = "_"),
                                 full.names = T
                                 ),
                 t1 = list.files(
                                 paste(dirTMS, parcellation, sep = "/"),
                                 paste("*ses-t1", parcellation, "ts.1D", sep = "_"),
                                 full.names = T
                                 ),
                 t14 = list.files(
                                 paste(dirTMS, parcellation, sep = "/"),
                                  paste("*ses-t14", parcellation, "ts.1D", sep = "_"),
                                  full.names = T
                                  ),
                 t2 = list.files(
                                 paste(dirTMS, parcellation, sep = "/"),
                                 paste("*ses-t2", parcellation, "ts.1D", sep = "_"),
                                 full.names = T
                                 ),
                 t3 = list.files(
                                 paste(dirTMS, parcellation, sep = "/"),
                                 paste("*ses-t3", parcellation, "ts.1D", sep = "_"),
                                 full.names = T
                 )
    )
    # Conditional if there is a control group (not yet)
    if (!is.null(dirCTRL)) {
        dirs[["hc_cu"]] <- str_subset(
                                      list.files(
                                                 paste(dirCTRL, parcellation, sep = "/"),
                                                 paste("*", parcellation, "ts.1D", sep = "_"),
                                                 full.names = T
                                                 ),
                                covarsP[Group == "HC", paste(Study.ID, sep = "|")]
                                )
    }
    tsSubs <- map_depth(dirs, 2, str_extract, pattern = "(sub|ctr)-[0-9]{3}")
    tSeries <- map_depth(dirs, 2, fread)
    return(map2(tSeries, tsSubs, set_names))
}

timeSeries2Corrs <- function(timeSeriesList, method = "pearson") {
    return(suppressWarnings(map_depth(timeSeriesList, 2, cor, method = method)))
}

writeCorMats <- function(corrs, outDir, parcellation = 'power264') {
    for (i in 1:length(corrs)) {
        midDir <- names(corrs)[[i]]
        midDir  <- str_replace(midDir, fixed('.'), '/')
        dir.create(
                   paste(outDir, parcellation, midDir, sep = "/"),
                   showWarnings = F, recursive = T
        )
        fullDir <- paste(
                         parcellation,
                         midDir,
                         names(corrs[[i]]),
                         sep = "/"
        )
        walk2(corrs[[i]], fullDir,
              ~ fwrite(
                       .x,
                       file = paste0(
                                     outDir, "/", .y, ".tsv"
                                     ),
                       col.names = F,
                       sep = "\t",
                       na = 0
              )
        )
    }
}

readCorMats <- function(directory, parcellation = 'power264', Neg = F, CTRL = F, Files = F) {
    # Applying function by groups
    if (CTRL) {
        dirs  <- list(
            CU = str_subset(
                list.files(
                    list.dirs(
                        paste(directory, parcellation, "hc_cu", sep = "/"),
                        recursive = T
                    ),
                    "sub-[0-9]{3}.tsv",
                    full.names = T
                ),
                covarsP[Group == "CU", paste(Study.ID, collapse = "|")]
            ),
            HC = str_subset(
                list.files(
                    list.dirs(
                        paste(directory, parcellation, "hc_cu", sep = "/"),
                        recursive = T
                    ),
                    "ctr-[0-9]{3}.tsv",
                    full.names = T
                ),
                covarsP[Group == "HC", paste(Study.ID, collapse = "|")]
            )
        )
    } else {
        dirs  <- list(
            t0 = list(
                Sham = str_subset(
                    list.files(
                        list.dirs(
                            paste(directory, parcellation, "t0", sep = "/"),
                            recursive = T
                        ),
                        "sub-[0-9]{3}.tsv",
                        full.names = T
                    ),
                    covars[Group == "Sham", paste(Study.ID, collapse = "|")]
                ),
                Tx = str_subset(
                    list.files(
                        list.dirs(
                            paste(directory, parcellation, "t0", sep = "/"),
                            recursive = T
                        ),
                        "sub-[0-9]{3}.tsv",
                        full.names = T
                    ),
                    covars[Group == "Tx", paste(Study.ID, collapse = "|")]
                )
            ),
            t1 = list(
                Sham = str_subset(
                    list.files(
                        list.dirs(
                            paste(directory, parcellation, "t1", sep = "/"),
                            recursive = T
                        ),
                        "sub-[0-9]{3}.tsv",
                        full.names = T
                    ),
                    covars[Group == "Sham", paste(Study.ID, collapse = "|")]
                ),
                Tx = str_subset(
                    list.files(
                        list.dirs(
                            paste(directory, parcellation, "t1", sep = "/"),
                            recursive = T
                        ),
                        "sub-[0-9]{3}.tsv",
                        full.names = T
                    ),
                    covars[Group == "Tx", paste(Study.ID, collapse = "|")]
                )
            )
        )
        dirs  <- unlist(dirs, recursive = F)
    }
    subs <- map_depth(dirs, 2, str_extract, pattern = "(sub|ctr)-[0-9]{3}")
    if (Files) {
        return(dirs)
    } else {
        if (Neg) {
            # Only Negative values
            corMatsNeg <- map_depth(dirs, 2, fread)
            for (i in seq_along(corMatsNeg)) {
                for (j in seq_along(corMatsNeg[[i]])) {
                    for (k in seq_along(corMatsNeg[[i]][[j]])) {
                        set(
                            corMatsNeg[[i]][[j]],
                            j = k,
                            value = -corMatsNeg[[i]][[j]][[k]]
                        )
                        set(
                            corMatsNeg[[i]][[j]],
                            i = which(corMatsNeg[[i]][[j]][[k]] < 0),
                            j = k,
                            value = 0
                        )
                        set(
                            corMatsNeg[[i]][[j]],
                            i = k,
                            j = k,
                            value = 1
                        )
                    }
                }
            }
            return(map2(corMatsNeg, subs, set_names))
        } else {
            corMatsPos <- map_depth(dirs, 2, fread)
            # Only Positive values
            for (i in seq_along(corMatsPos)) {
                for (j in seq_along(corMatsPos[[i]])) {
                    for (k in seq_along(corMatsPos[[i]][[j]])) {
                        set(
                            corMatsPos[[i]][[j]],
                            i = which(corMatsPos[[i]][[j]][[k]] < 0),
                            j = k,
                            value = 0
                        )
                    }
                }
            }
            return(map2(corMatsPos, subs, set_names))
        }
    }
}

normDataWithin <- function(
  data = NULL,
  idvar,
  measurevar,
  betweenvars = NULL,
  na.rm = FALSE,
  .drop = TRUE
) {
  require(plyr)

  # Measure var on left, idvar + between vars on right of formula.
  data.subjMean <- ddply(data, c(idvar, betweenvars),
    .drop = .drop,
    .fun = function(xx, col, na.rm) {
      c(subjMean = mean(xx[, col], na.rm = na.rm))
    },
    measurevar,
    na.rm
  )

  # Put the subject means with original data
  data <- merge(data, data.subjMean)

  # Get the normalized data in a new column
  measureNormedVar <- paste(measurevar, "_norm", sep = "")
  data[, measureNormedVar] <- data[, measurevar] - data[, "subjMean"] +
    mean(data[, measurevar], na.rm = na.rm)

  # Remove this subject mean column
  data$subjMean <- NULL

  return(data)
}


summarySE <- function(
  data = NULL,
  measurevar,
  groupvars = NULL,
  na.rm = FALSE,
  conf.interval = .95,
  .drop = TRUE
) {
  require(plyr)

  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function(x, na.rm = FALSE) {
    if (na.rm) {
      sum(!is.na(x))
    } else {
      length(x)
    }
  }

  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars,
    .drop = .drop,
    .fun = function(xx, col) {
      c(
        N = length2(xx[[col]], na.rm = na.rm),
        mean = mean(xx[[col]], na.rm = na.rm),
        sd = sd(xx[[col]], na.rm = na.rm)
      )
    },
    measurevar
  )

  # Rename the "mean" column
  datac <- rename(datac, c("mean" = measurevar))

  datac$se <- datac$sd / sqrt(datac$N) # Calculate standard error of the mean

  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval:
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  ciMult <- qt(conf.interval / 2 + .5, datac$N - 1)
  datac$ci <- datac$se * ciMult

  return(datac)
}


summarySEwithin <- function(
  data = NULL,
  measurevar,
  betweenvars = NULL,
  withinvars = NULL,
  idvar = NULL,
  na.rm = FALSE,
  conf.interval = .95,
  .drop = TRUE
) {

  # Ensure that the betweenvars and withinvars are factors
  factorvars <- vapply(data[, c(betweenvars, withinvars), drop = FALSE],
    FUN = is.factor, FUN.VALUE = logical(1)
  )

  if (!all(factorvars)) {
    nonfactorvars <- names(factorvars)[!factorvars]
    message(
      "Automatically converting the following non-factors to factors: ",
      paste(nonfactorvars, collapse = ", ")
    )
    data[nonfactorvars] <- lapply(data[nonfactorvars], factor)
  }

  # Get the means from the un-normed data
  datac <- summarySE(data, measurevar,
    groupvars = c(betweenvars, withinvars),
    na.rm = na.rm, conf.interval = conf.interval, .drop = .drop
  )

  # Drop all the unused columns (these will be calculated with normed data)
  datac$sd <- NULL
  datac$se <- NULL
  datac$ci <- NULL

  # Norm each subject's data
  ndata <- normDataWithin(data, idvar, measurevar, betweenvars, na.rm, .drop = .drop)

  # This is the name of the new column
  measurevar_n <- paste(measurevar, "_norm", sep = "")

  # Collapse the normed data - now we can treat between and within vars the same
  ndatac <- summarySE(ndata, measurevar_n,
    groupvars = c(betweenvars, withinvars),
    na.rm = na.rm, conf.interval = conf.interval, .drop = .drop
  )

  # Apply correction from Morey (2008) to the standard error and confidence interval
  #  Get the product of the number of conditions of within-S variables
  nWithinGroups <- prod(vapply(ndatac[, withinvars, drop = FALSE],
    FUN = nlevels,
    FUN.VALUE = numeric(1)
  ))
  correctionFactor <- sqrt(nWithinGroups / (nWithinGroups - 1))

  # Apply the correction factor
  ndatac$sd <- ndatac$sd * correctionFactor
  ndatac$se <- ndatac$se * correctionFactor
  ndatac$ci <- ndatac$ci * correctionFactor

  # Combine the un-normed means with the normed results
  merge(datac, ndatac)
}



prepPlotGrw <- function(...) {
  x <- bind_rows(...)
  x %>%
    select(1:3,
      Network,
      CP = Cp,
      LP = Lp,
      SW = sigma,
      EG = E.global,
      EL = E.local,
      D = density,
      S = strength
    ) %>%
    gather(key = "Metric", value = "Val", CP:S) %>%
    summarySEwithin(
      measurevar = "Val", betweenvars = "Group",
      withinvars = c("Stage", "Network", "Metric"),
      idvar = "Study.ID", na.rm = T
    )
}

prepPlotGr <- function(...) {
  x <- bind_rows(...)
  x %>%
    select(1:2,
      Network,
      CP = Cp,
      LP = Lp,
      SW = sigma,
      EG = E.global,
      EL = E.local,
      D = density,
      S = strength
    ) %>%
    gather(key = "Metric", value = "Val", CP:S) %>%
    summarySE(
      measurevar = "Val",
      groupvars = c("Stage", "Network", "Metric"),
      na.rm = T
    )
}

prepPlotCl <- function(x, ...) {
  gather(x, key = "Scale", value = "Score", ...) %>%
    select(1:3, Scale, Score) %>%
    summarySEwithin(
      measurevar = "Score", betweenvars = "Group",
      withinvars = c("Stage", "Scale"), idvar = "Study.ID", na.rm = T
    )
}

prepPlotCl2 <- function(x, ...) {
  gather(x, key = "Scale", value = "Score", ...) %>%
    select(1:3, Scale, Score) %>%
    summarySEwithin(
      measurevar = "Score",
      withinvars = c("Stage", "Scale"), idvar = "Study.ID", na.rm = T
    )
}
