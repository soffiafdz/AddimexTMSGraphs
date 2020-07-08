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
      showWarnings = F,
      recursive = T
      )
    fullDir <- paste(parcellation, midDir, names(corrs[[i]]), sep = "/")
    walk2(corrs[[i]],
      fullDir,
      ~ fwrite(.x, file = paste0(outDir, "/", .y, ".tsv"), col.names = F,
        sep = "\t", na = 0)
      )
  }
}

readCorMats <- function(directory, parcellation = 'power264', Neg = F, CTRL = F, Files = F) {
  # Applying function by groups
  if (CTRL) {
    dirs  <- list(
      CU = str_subset(
        list.files(
          list.dirs(paste(directory, parcellation, "hc_cu", sep = "/"), recursive = T),
          "sub-[0-9]{3}.tsv",
          full.names = T
          ),
        covarsP[Group == "CU", paste(Study.ID, collapse = "|")]
        ),
      HC = str_subset(
        list.files(
          list.dirs(paste(directory, parcellation, "hc_cu", sep = "/"), recursive = T),
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
            list.dirs(paste(directory, parcellation, "t0", sep = "/"), recursive = T),
            "sub-[0-9]{3}.tsv",
            full.names = T
            ),
          covars[Group == "Sham", paste(Study.ID, collapse = "|")]
          ),
        Tx = str_subset(
          list.files(
            list.dirs(paste(directory, parcellation, "t0", sep = "/"), recursive = T),
            "sub-[0-9]{3}.tsv",
            full.names = T
            ),
          covars[Group == "Tx", paste(Study.ID, collapse = "|")]
          )
        ),
      t1 = list(
        Sham = str_subset(
          list.files(
            list.dirs(paste(directory, parcellation, "t1", sep = "/"), recursive = T),
            "sub-[0-9]{3}.tsv",
            full.names = T
            ),
          covars[Group == "Sham", paste(Study.ID, collapse = "|")]
          ),
        Tx = str_subset(
          list.files(
            list.dirs(paste(directory, parcellation, "t1", sep = "/"), recursive = T),
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
