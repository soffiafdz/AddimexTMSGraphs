
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

setBgAttr <- function(
  g,
  atlas = NULL,
  rand = FALSE,
  use.parallel = TRUE,
  A = NULL,
  xfm.type = c("1/w", "-log(w)", "1-w"),
  ...
) {
  name <- NULL
  stopifnot(is_igraph(g))
  if (!"degree" %in% vertex_attr_names(g)) {
    V(g)$degree <- degree(g)
  }
  g$Cp <- transitivity(g, type = "localaverage")
  g$Lp <- mean_distance(g)
  R <- lapply(1:max(V(g)$degree), function(x) rich_club_coeff(
      g,
      x
    ))
  phi <- vapply(R, with, numeric(1), phi)
  Nk <- vapply(R, with, numeric(1), Nk)
  Ek <- vapply(R, with, numeric(1), Ek)
  g$rich <- data.frame(phi = round(phi, 4), Nk = Nk, Ek = Ek)
  g$E.global <- efficiency(g, "global", weights = NA)
  comm <- cluster_louvain(g, weights = NA)
  g$mod <- max(comm$modularity)
  if (!isTRUE(rand)) {
    g$density <- round(graph.density(g), digits = 3)
    clusts <- components(g)
    comps <- rev(table(clusts$csize))
    g$conn.comp <- data.frame(
      size = as.integer(names(comps)),
      number = as.integer(comps)
    )
    g$max.comp <- g$conn.comp[1, 1]
    g$num.tri <- sum(count_triangles(g)) / 3
    g$diameter <- diameter(g, weights = NA)
    g$transitivity <- transitivity(g)
    g$assortativity <- assortativity_degree(g)
    if (is_weighted(g)) {
      V(g)$strength <- graph.strength(g)
      g$strength <- mean(V(g)$strength)
      V(g)$knn.wt <- graph.knn(g)$knn
      V(g)$s.core <- s_core(g, A)
      R <- lapply(1:max(V(g)$degree), function(x) rich_club_coeff(g,
          x,
          weighted = TRUE
        ))
      phi <- vapply(R, with, numeric(1), phi)
      Nk <- vapply(R, with, numeric(1), Nk)
      Ek <- vapply(R, with, numeric(1), Ek)
      g$rich.wt <- data.frame(
        phi = round(phi, 4), Nk = Nk,
        Ek = Ek
      )
      comm.wt <- cluster_louvain(g)
      g$mod.wt <- max(comm.wt$modularity)
      x <- comm.wt$membership
      V(g)$comm.wt <- match(x, order(table(x), decreasing = TRUE))
      g <- brainGraph:::set_vertex_color(g, "color.comm.wt", V(g)$comm.wt)
      g <- brainGraph:::set_edge_color(g, "color.comm.wt", V(g)$comm.wt)
      V(g)$GC.wt <- gateway_coeff(g, V(g)$comm.wt)
      V(g)$PC.wt <- part_coeff(g, V(g)$comm.wt)
      V(g)$z.score.wt <- within_module_deg_z_score(g, V(g)$comm.wt)
      V(g)$transitivity.wt <- transitivity(g, type = "weighted")
      xfm.type <- match.arg(xfm.type)
      g <- xfm.weights(g, xfm.type)
      V(g)$E.local.wt <- efficiency(g,
        type = "local",
        use.parallel = use.parallel, A = A
      )
      g$E.local.wt <- mean(V(g)$E.local.wt)
      V(g)$E.nodal.wt <- efficiency(g, "nodal")
      g$E.global.wt <- mean(V(g)$E.nodal.wt)
      g$diameter.wt <- diameter(g)
      Lpv.wt <- distances(g)
      Lpv.wt[is.infinite(Lpv.wt)] <- NA
      V(g)$Lp.wt <- rowMeans(Lpv.wt, na.rm = TRUE)
      g <- xfm.weights(g, xfm.type, invert = TRUE)
    }
    if (is_directed(g)) {
      hubs <- hub_score(g)
      g$hub.score <- hubs$value
      authorities <- authority_score(g)
      g$authority.score <- authorities$value
      V(g)$hub.score <- hubs$vector
      V(g)$authority.score <- authorities$vector
    }
    if (!is.null(atlas)) {
      g$atlas <- atlas
      atlas.dt <- get(atlas)
      if (!is_named(g)) {
        V(g)$name <- atlas.dt[, name]
      }
      g <- make_brainGraph(g, atlas, ...)
      g$asymm <- edge_asymmetry(g)$asymm
      V(g)$asymm <- edge_asymmetry(g, "vertex")$asymm
      g$spatial.dist <- mean(E(g)$dist)
      V(g)$dist.strength <- V(g)$dist * V(g)$degree
      if (atlas %in% c("destrieux", "destrieux.scgm")) {
        g$assortativity.class <- assortativity_nominal(
          g,
          V(g)$class
        )
      }
      if (atlas %in% c("dosenbach160")) {
        g$assortativity.network <- assortativity_nominal(
          g,
          as.integer(factor(V(g)$network))
        )
      }
    }
    V(g)$knn <- graph.knn(g, weights = NA)$knn
    Lpv <- distances(g, weights = NA)
    Lpv[is.infinite(Lpv)] <- NA
    V(g)$Lp <- rowMeans(Lpv, na.rm = TRUE)
    E(g)$btwn <- edge.betweenness(g)
    V(g)$btwn.cent <- centr_betw(g)$res
    V(g)$hubs <- 0
    V(g)$hubs[which(V(g)$btwn.cent > mean(V(g)$btwn.cent) +
      sd(V(g)$btwn.cent))] <- 1
    g$num.hubs <- sum(V(g)$hubs)
    V(g)$ev.cent <- centr_eigen(g)$vector
    V(g)$lev.cent <- centr_lev(g)
    V(g)$k.core <- coreness(g)
    V(g)$transitivity <- transitivity(g,
      type = "local",
      isolates = "zero"
    )
    V(g)$E.local <- efficiency(g,
      type = "local", weights = NA,
      use.parallel = use.parallel, A = A
    )
    V(g)$E.nodal <- efficiency(g, type = "nodal", weights = NA)
    g$E.local <- mean(V(g)$E.local)
    V(g)$vulnerability <- vulnerability(g, use.parallel = use.parallel)
    g$vulnerability <- max(V(g)$vulnerability)
    V(g)$eccentricity <- eccentricity(g)
    x <- comm$membership
    V(g)$comm <- match(x, order(table(x), decreasing = TRUE))
    g <- brainGraph:::set_vertex_color(g, "color.comm", V(g)$comm)
    g <- brainGraph:::set_edge_color(g, "color.comm", V(g)$comm)
    x <- clusts$membership
    V(g)$comp <- match(x, order(table(x), decreasing = TRUE))
    g <- brainGraph:::set_vertex_color(g, "color.comp", V(g)$comp)
    g <- brainGraph:::set_edge_color(g, "color.comp", V(g)$comp)
    V(g)$circle.layout.comm <- order(V(g)$comm, V(g)$degree)
    V(g)$GC <- gateway_coeff(g, V(g)$comm)
    V(g)$PC <- part_coeff(g, V(g)$comm)
    V(g)$z.score <- within_module_deg_z_score(g, V(g)$comm)
  }
  return(g)
}

setBgAttr1 <- function(
  g,
  atlas = NULL,
  rand = FALSE,
  use.parallel = TRUE,
  A = NULL,
  xfm.type = c("1/w", "-log(w)", "1-w"),
  ...
) {
  name <- NULL
  A[is.na(A)] <- 0
  stopifnot(is_igraph(g))
  if (!"degree" %in% vertex_attr_names(g)) {
    V(g)$degree <- degree(g)
  }
  g$Cp <- transitivity(g, type = "localaverage")
  g$Lp <- mean_distance(g)
  R <- lapply(1:max(V(g)$degree), function(x) rich_club_coeff(
      g,
      x
    ))
  phi <- vapply(R, with, numeric(1), phi)
  Nk <- vapply(R, with, numeric(1), Nk)
  Ek <- vapply(R, with, numeric(1), Ek)
  g$rich <- data.frame(phi = round(phi, 4), Nk = Nk, Ek = Ek)
  g$E.global <- efficiency(g, "global", weights = NA)
  comm <- cluster_louvain(g, weights = NA)
  g$mod <- max(comm$modularity)
  if (!isTRUE(rand)) {
    g$density <- round(graph.density(g), digits = 3)
    clusts <- components(g)
    comps <- rev(table(clusts$csize))
    g$conn.comp <- data.frame(
      size = as.integer(names(comps)),
      number = as.integer(comps)
    )
    g$max.comp <- g$conn.comp[1, 1]
    g$num.tri <- sum(count_triangles(g)) / 3
    g$diameter <- diameter(g, weights = NA)
    g$transitivity <- transitivity(g)
    g$assortativity <- assortativity_degree(g)
    if (is_weighted(g)) {
      V(g)$strength <- graph.strength(g)
      g$strength <- mean(V(g)$strength)
      V(g)$knn.wt <- graph.knn(g)$knn
      V(g)$s.core <- s_core(g, A)
      R <- lapply(1:max(V(g)$degree), function(x) rich_club_coeff(g,
          x,
          weighted = TRUE
        ))
      phi <- vapply(R, with, numeric(1), phi)
      Nk <- vapply(R, with, numeric(1), Nk)
      Ek <- vapply(R, with, numeric(1), Ek)
      g$rich.wt <- data.frame(
        phi = round(phi, 4), Nk = Nk,
        Ek = Ek
      )
      comm.wt <- cluster_louvain(g)
      g$mod.wt <- max(comm.wt$modularity)
      x <- comm.wt$membership
      V(g)$comm.wt <- match(x, order(table(x), decreasing = TRUE))
      g <- brainGraph:::set_vertex_color(g, "color.comm.wt", V(g)$comm.wt)
      # g <- brainGraph:::set_edge_color(g, "color.comm.wt", V(g)$comm.wt)
      V(g)$GC.wt <- gateway_coeff(g, V(g)$comm.wt)
      V(g)$PC.wt <- part_coeff(g, V(g)$comm.wt)
      V(g)$z.score.wt <- within_module_deg_z_score(g, V(g)$comm.wt)
      V(g)$transitivity.wt <- transitivity(g, type = "weighted")
      xfm.type <- match.arg(xfm.type)
      g <- xfm.weights(g, xfm.type)
      V(g)$E.local.wt <- efficiency(g,
        type = "local",
        use.parallel = use.parallel, A = A
      )
      g$E.local.wt <- mean(V(g)$E.local.wt)
      V(g)$E.nodal.wt <- efficiency(g, "nodal")
      g$E.global.wt <- mean(V(g)$E.nodal.wt)
      g$diameter.wt <- diameter(g)
      Lpv.wt <- distances(g)
      Lpv.wt[is.infinite(Lpv.wt)] <- NA
      V(g)$Lp.wt <- rowMeans(Lpv.wt, na.rm = TRUE)
      g <- xfm.weights(g, xfm.type, invert = TRUE)
    }
    if (is_directed(g)) {
      hubs <- hub_score(g)
      g$hub.score <- hubs$value
      authorities <- authority_score(g)
      g$authority.score <- authorities$value
      V(g)$hub.score <- hubs$vector
      V(g)$authority.score <- authorities$vector
    }
    if (!is.null(atlas)) {
      g$atlas <- atlas
      atlas.dt <- get(atlas)
      if (!is_named(g)) {
        V(g)$name <- atlas.dt[, name]
      }
      g <- make_brainGraph(g, atlas, ...)
      g$asymm <- edge_asymmetry(g)$asymm
      V(g)$asymm <- edge_asymmetry(g, "vertex")$asymm
      g$spatial.dist <- mean(E(g)$dist)
      V(g)$dist.strength <- V(g)$dist * V(g)$degree
      if (atlas %in% c("destrieux", "destrieux.scgm")) {
        g$assortativity.class <- assortativity_nominal(
          g,
          V(g)$class
        )
      }
      if (atlas %in% c("dosenbach160")) {
        g$assortativity.network <- assortativity_nominal(
          g,
          as.integer(factor(V(g)$network))
        )
      }
    }
    V(g)$knn <- graph.knn(g, weights = NA)$knn
    Lpv <- distances(g, weights = NA)
    Lpv[is.infinite(Lpv)] <- NA
    V(g)$Lp <- rowMeans(Lpv, na.rm = TRUE)
    E(g)$btwn <- edge.betweenness(g)
    V(g)$btwn.cent <- centr_betw(g)$res
    V(g)$hubs <- 0
    V(g)$hubs[which(V(g)$btwn.cent > mean(V(g)$btwn.cent) +
      sd(V(g)$btwn.cent))] <- 1
    g$num.hubs <- sum(V(g)$hubs)
    V(g)$ev.cent <- centr_eigen(g)$vector
    V(g)$lev.cent <- centr_lev(g)
    V(g)$k.core <- coreness(g)
    V(g)$transitivity <- transitivity(g,
      type = "local",
      isolates = "zero"
    )
    V(g)$E.local <- efficiency(g,
      type = "local", weights = NA,
      use.parallel = use.parallel, A = A
    )
    V(g)$E.nodal <- efficiency(g, type = "nodal", weights = NA)
    g$E.local <- mean(V(g)$E.local)
    V(g)$vulnerability <- vulnerability(g, use.parallel = use.parallel)
    g$vulnerability <- max(V(g)$vulnerability)
    V(g)$eccentricity <- eccentricity(g)
    x <- comm$membership
    V(g)$comm <- match(x, order(table(x), decreasing = TRUE))
    g <- brainGraph:::set_vertex_color(g, "color.comm", V(g)$comm)
    # g <- brainGraph:::set_edge_color(g, "color.comm", V(g)$comm)
    x <- clusts$membership
    V(g)$comp <- match(x, order(table(x), decreasing = TRUE))
    g <- brainGraph:::set_vertex_color(g, "color.comp", V(g)$comp)
    # g <- brainGraph:::set_edge_color(g, "color.comp", V(g)$comp)
    V(g)$circle.layout.comm <- order(V(g)$comm, V(g)$degree)
    V(g)$GC <- gateway_coeff(g, V(g)$comm)
    V(g)$PC <- part_coeff(g, V(g)$comm)
    V(g)$z.score <- within_module_deg_z_score(g, V(g)$comm)
  }
  return(g)
}

vertexAttrDt <- function(
  g,
  group = NULL
) {
  lobe <- name <- Group <- network <- NULL
  atlas.dt <- power
  dt.V <- setDT(as_data_frame(g, what = "vertices"))
  cols.char <- names(which(sapply(vertex_attr(g), class) == "character"))
  cols.rem <- c(
    cols.char, "x", "y", "z", "x.mni", "y.mni", "z.mni", "lobe.hemi", "lobe",
    "circle.layout", "comm", "comp", "circle.layout.comm"
  )
  if (is_weighted(g)) {
    cols.rem <- c(cols.rem, "comm.wt")
  }
  cols.rem <- setdiff(cols.rem, c("name", "hemi"))
  dt.V[, `:=`(eval(cols.rem), NULL)]
  if (isTRUE(grepl("destr", g$atlas))) {
    dt.V$class <- atlas.dt[, levels(class)][V(g)$class]
  }
  if ("network" %in% cols.char) {
    dt.V$network <- V(g)$network
  }
  dt.V$density <- g$density
  dt.V$lobe <- V(g)$lobe
  setnames(dt.V, "name", "region")
  setcolorder(dt.V, c(
    "density", "region", "lobe", "hemi",
    names(dt.V[, !c("density", "region", "lobe", "hemi"), with = F])
  ))
  if ("name" %in% graph_attr_names(g)) {
    dt.V$Study.ID <- g$name
  }
  if ("modality" %in% graph_attr_names(g)) {
    dt.V$modality <- g$modality
  }
  if ("weighting" %in% graph_attr_names(g)) {
    dt.V$weighting <- g$weighting
  }
  if ("threshold" %in% graph_attr_names(g)) {
    dt.V$threshold <- g$threshold
  }
  if ("atlas" %in% graph_attr_names(g)) {
    dt.V$atlas <- g$atlas
  }
  if (is.null(group)) {
    if ("Group" %in% graph_attr_names(g)) {
      dt.V$Group <- g$Group
    }
  }
  else {
    dt.V$Group <- group
  }
  return(dt.V)
}

makeBg <- function(
  g,
  atlas,
  rand = FALSE,
  modality = NULL,
  weighting = NULL,
  threshold = NULL,
  subject = NULL,
  group = NULL
) {
  stopifnot(is_igraph(g))
  lobe <- hemi <- name <- index <- N <- class <- network <-
    x <- y <- z <- x.mni <- y.mni <- z.mni <- NULL
  g$version <- packageVersion("brainGraph")
  g$atlas <- atlas
  DT <- get(atlas)
  nonmatches <- !V(g)$name %in% DT[, name]
  if (any(nonmatches)) {
    stop(paste(
      "Check the following vertex names: ",
      paste(V(g)$name[nonmatches], collapse = " ")
    ))
  }
  if (!is_named(g)) {
    V(g)$name <- DT[, name]
  }
  vorder <- match(V(g)$name, DT$name)
  lobe.nums <- DT[vorder, as.numeric(lobe)]
  V(g)$lobe <- DT[vorder, as.character(lobe)]
  V(g)$lobe.hemi <- as.numeric(DT[vorder, interaction(
    lobe,
    hemi
  )])
  V(g)$hemi <- DT[vorder, as.character(hemi)]
  if (isTRUE(grepl("destr", g$atlas))) {
    V(g)$class <- DT[vorder, as.numeric(class)]
  }
  if (g$atlas %in% c("dosenbach160", "power")) {
    V(g)$network <- DT[vorder, as.character(network)]
  }
  if (!isTRUE(rand)) {
    if (!is.null(modality)) {
      g$modality <- modality
    }
    if (!is.null(weighting)) {
      g$weighting <- weighting
    }
    if (!is.null(threshold)) {
      g$threshold <- threshold
    }
    if (!is.null(subject)) {
      g$name <- subject
    }
    if (!is.null(group)) {
      g$Group <- group
    }
    l.cir <- vector("integer")
    lobes <- DT[, levels(lobe)]
    V(g)$x <- V(g)$x.mni <- DT[vorder, x.mni]
    V(g)$y <- V(g)$y.mni <- DT[vorder, y.mni]
    V(g)$z <- V(g)$z.mni <- DT[vorder, z.mni]
    V(g)$color.lobe <- group.cols[lobe.nums]
    g <- set_edge_color(g, "color.lobe", lobe.nums)
    if (g$atlas %in% c("destrieux", "destrieux.scgm")) {
      V(g)$color.class <- group.cols[V(g)$class]
      g <- set_edge_color(g, "color.class", V(g)$class)
    }
    if (g$atlas %in% c("dosenbach160", "power")) {
      V(g)$color.network <- group.cols[DT[vorder, as.numeric(network)]]
      g <- set_edge_color(g, "color.network", DT[
        vorder,
        as.numeric(network)
      ])
      l.cir <- c(l.cir, which(V(g)$hemi == "B"))
    }
    l.cir <- c(
      l.cir,
      DT[lobe == "Frontal" & hemi == "L", .SD[order(-y.mni, x.mni), index]],
      DT[lobe %in% c("Insula", "Central") & hemi == "L", .SD[order(-y.mni, x.mni), index]],
      DT[lobe %in% c("Limbic", "Cingulate") & hemi == "L", .SD[order(-y.mni, x.mni), index]]
    )
    if ("SCGM" %in% lobes) {
      l.cir <- c(l.cir, DT[
        lobe == "SCGM" & hemi == "L",
        .SD[order(-y.mni, x.mni), index]
      ])
    }
    l.cir <- c(
      l.cir,
      DT[lobe == "Temporal" & hemi == "L", .SD[order(-y.mni, x.mni), index]],
      DT[lobe == "Parietal" & hemi == "L", .SD[order(-y.mni, x.mni), index]],
      DT[lobe == "Occipital" & hemi == "L", .SD[order(-y.mni, x.mni), index]],
      DT[lobe == "Occipital" & hemi == "R", .SD[order(y.mni, x.mni), index]],
      DT[lobe == "Parietal" & hemi == "R", .SD[order(y.mni, x.mni), index]],
      DT[lobe == "Temporal" & hemi == "R", .SD[order(y.mni, x.mni), index]]
    )
    if ("SCGM" %in% lobes) {
      l.cir <- c(
        l.cir,
        DT[lobe == "SCGM" & hemi == "R", .SD[order(y.mni, x.mni), index]]
      )
    }
    l.cir <- c(
      l.cir,
      DT[lobe %in% c("Limbic", "Cingulate") & hemi == "R", .SD[order(y.mni, x.mni), index]],
      DT[lobe %in% c("Insula", "Central") & hemi == "R", .SD[order(y.mni, x.mni), index]],
      DT[lobe == "Frontal" & hemi == "R", .SD[order(y.mni, x.mni), index]]
    )
    if ("Cerebellum" %in% lobes) {
      counts <- DT[order(lobe, hemi), .N, by = list(lobe, hemi)]
      mid1 <- counts[!lobe %in% c("Cerebellum", "Brainstem") & hemi != "R", sum(N)]
      mid2 <- counts[!lobe %in% c("Cerebellum", "Brainstem") & hemi == "R", sum(N)]
      l.cir <- c(
        l.cir[1:mid1], which(V(g)$lobe == "Cerebellum"),
        l.cir[(mid1 + 1):(mid2 + mid1)]
      )
    }
    if ("Brainstem" %in% lobes) {
      mid1 <- counts[lobe != "Brainstem" & hemi != "R", sum(N)]
      mid2 <- counts[lobe != "Brainstem" & hemi == "R", sum(N)]
      l.cir <- c(
        l.cir[1:mid1], which(V(g)$lobe == "Brainstem"),
        l.cir[(mid1 + 1):(mid2 + mid1)]
      )
    }
    V(g)$circle.layout <- l.cir
  }
  class(g) <- c("brainGraph", class(g))
  return(g)
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
