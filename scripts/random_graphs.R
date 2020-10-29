#!/usr/bin/env Rscript

## Packages
library("readr")
library("purrr")
library("furrr")
library("brainGraph")
library("data.table")
library("here")

## Load rds graphs
sessions <- read_rds(here("./data/processed/rds/sessions.rds"))
gph <- read_rds(here("./data/processed/graphs/gph.rds"))

## No of random networks
no_rand <- 3e2

## Set up multiprocessing
future::plan(multicore, workers = 15)

## Remove linging group (T14-Real)
gph$T14$Real <- NULL

## Main
rnets <- future_map2(gph, sessions,
  ~ analysis_random_graphs(
    .x,
    N = no_rand,
    # N = 2,
    savedir = here("data", "processed", "graphs", "rand", .y),
    clustering = FALSE
  ),
  .progress = TRUE
)

## Start from extracting ALL/Read existing graphs instead of creating them...
# rgraphs_all <- function (g.list, N = 100, savedir = ".", ...) {
#   Group <- Study.ID <- threshold <- NULL
#   if (!isTRUE(dir.exists(paste0(savedir, "/ALL")))) {
#     dir.create(paste0(savedir, "/ALL/"), recursive = TRUE)
#   }
#   create.rand.dt <- function(rand, group, V1, N) {
#     rand.mod <- unlist(lapply(rand, vapply, graph_attr, numeric(1),
#       USE.NAMES = FALSE, "mod"))
#     rand.Cp <- unlist(lapply(rand, vapply, graph_attr, numeric(1),
#       USE.NAMES = FALSE, "Cp"))
#     rand.E.glob <- unlist(lapply(rand, vapply, graph_attr, numeric(1),
#       USE.NAMES = FALSE, "E.global"))
#     rand.Lp <- unlist(lapply(rand, vapply, graph_attr, numeric(1),
#       USE.NAMES = FALSE, "Lp"))
#     rand.dt <- data.table(V1 = rep(V1, each = N), Group = rep(group, N),
#       mod = rand.mod, Cp = rand.Cp, Lp = rand.Lp, E.global = rand.E.glob)
#     return(rand.dt)
#   }
#   if (!is_igraph(g.list[[1]][[1]][[1]])) stop("Not correct leveling")
#   phi.norm <- vector("list", length = length(g.list))
#   groups <- vector("character", length = length(g.list))
#   for (i in seq_along(g.list)) {
#     phi.norm[[i]] <- vector("list", length = length(g.list[[i]]))
#     groups[i] <- g.list[[i]][[1]][[1]]$Group
#     kNumSubjs <- length(g.list[[i]][[1]])
#     for (j in seq_along(g.list[[i]])) {
#       phi.norm[[i]][[j]] <- vector("list", length = kNumSubjs)
#       # print(paste0("Random graphs for group #", i, "; threshold #", j, "; ",
#       #   format(Sys.time(), "%H:%M:%S")))
#       # progbar <-
#       #   txtProgressBar(min = 0, max = length(g.list[[i]][[j]]), style = 3)
#       for (k in seq_along(g.list[[i]][[j]])) {
#         # rand <- sim.rand.graph.par(g.list[[i]][[j]][[k]], N, ...)
#         rand <- readRDS(paste0(
#           savedir, "/", sprintf("rand%i_thr%02i_subj%03i%s", i, j, k, ".rds")))
#         # saveRDS(rand, file = paste0(savedir, "/", sprintf("rand%i_thr%02i_subj%03i%s",
#         #   i, j, k, ".rds")))
#         phi.norm[[i]][[j]][[k]] <-
#           rich_club_norm(g.list[[i]][[j]][[k]], rand = rand)
#         rm(list = "rand")
#         gc()
#         # setTxtProgressBar(progbar, k)
#       }
#     }
#   }
#   rand.dt <- small.dt <- ids <- vector("list", length = length(g.list))
#   for (i in seq_along(g.list)) {
#     if ("name" %in% graph_attr_names(g.list[[i]][[1]][[1]])) {
#       ids[[i]] <- sapply(g.list[[i]][[1]], graph_attr, "name")
#     } else {
#       ids[[i]] <- seq_along(g.list[[i]][[1]])
#     }
#     rand.dt[[i]] <- small.dt[[i]] <-
#       vector("list", length = length(g.list[[i]]))
#     for (j in seq_along(g.list[[i]])) {
#       # fnames <- list.files(savedir, sprintf("rand%i_thr%02i.*", i, j),
#       #   full.names = TRUE)
#       # rand.all <- lapply(fnames, readRDS)
#       # saveRDS(rand.all, file = paste0(
#       #   savedir, "/ALL/", sprintf("rand%i_thr%02i%s", i, j, ".rds")))
#       rand.all <- readRDS(file = paste0(
#         savedir, "/ALL/", sprintf("rand%i_thr%02i%s", i, j, ".rds")))
#       small.dt[[i]][[j]] <- small.world(g.list[[i]][[j]], rand.all)
#       small.dt[[i]][[j]]$threshold <- j
#       small.dt[[i]][[j]]$Study.ID <- ids[[i]]
#       rand.dt[[i]][[j]] <- create.rand.dt(rand.all, groups[i], V1 = ids[[i]], N)
#       setnames(rand.dt[[i]][[j]], 1, "Study.ID")
#       rand.dt[[i]][[j]]$threshold <- j
#       rm(list = "rand.all")
#       gc()
#     }
#   }
#   rand.dt <- rbindlist(lapply(rand.dt, rbindlist))
#   rand.dt[, `:=`(Group, as.factor(Group))]
#   rand.dt[, `:=`(Study.ID, as.factor(Study.ID))]
#   setcolorder(rand.dt, c("threshold", "Group", "Study.ID", names(rand.dt)[3:6]))
#   setkey(rand.dt, threshold, Group, Study.ID)
#   small.dt <- rbindlist(lapply(small.dt, rbindlist))
#   kNumSubjs <- sapply(g.list, function(x) length(x[[1]]))
#   small.dt[, `:=`(Group, rep(groups, times = kNumSubjs * length(g.list[[1]])))]
#   small.dt[, `:=`(Group, as.factor(Group))]
#   small.dt[, `:=`(Study.ID, as.factor(Study.ID))]
#   setkey(small.dt, Group, threshold)
#   rich.dt <- rbindlist(lapply(phi.norm, function(x) rbindlist(lapply(x , rbindlist))))
#   return(list(rich = rich.dt, small = small.dt, rand = rand.dt))
# }
#
# rnets <- future_map2(gph, sessions,
#   ~ rgraphs_all(
#     .x,
#     N = no_rand,
#     savedir = here("data", "processed", "graphs", "rand", .y),
#     clustering = FALSE
#   ), .progress = TRUE
# )

## Save random_nets object
write_rds(rnets, here("./data/processed/graphs/rnets.rds"))
