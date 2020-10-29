#!/usr/bin/Rscript
## Set-up Parallelization
doMC::registerDoMC(13)

## Packages
library("foreach")
library("doParallel")
library("plyr")
library("readr")
library("purrr")
library("brainGraph")
library("here")

## Load rds objects
groups <- read_rds(here("./data/processed/rds/groups.rds"))
sessions <- read_rds(here("./data/processed/rds/sessions.rds"))
thresholds <- read_rds(here("./data/processed/rds/thresholds.rds"))
power264 <- read_rds(here("./data/processed/rds/power264.rds"))
covars <- read_rds(here("./data/processed/rds/covars.rds"))
inds <- read_rds(here("./data/processed/rds/inds.rds"))
mats <- read_rds(here("./data/processed/rds/mats.rds"))

## Main
A_sub <- mats$A.norm.sub
A_mean <- mats$A.norm.mean
atlas <- "power264"

# Small odd/even list for hack regarding the group/session issue in
# the create_mats function.
group_session <- list(seq(1,10,2), seq(2,10,2))

# Loop
gph_group <- gph <- fnames <- vector("list", length = length(sessions))
for (s in seq_along(sessions)) {
  gph_group[[s]] <- gph[[s]] <- fnames[[s]] <-
    vector("list", length = length(groups))
  for (g in seq_along(groups)) {
    # Continue if T14-Real
    if (s == 3 && g == 2) next
    for (t in seq_along(thresholds)) {
      # Progress message
      message(sprintf(
        "Threshold: %i/%i; Group: %i; Session: %i; %s",
        t, length(thresholds), g, s, format(Sys.time(), "%H:%M:%S")
      ))

      # Parallelization
      foreach (i = seq_along(inds[[s]][[g]])) %dopar% {
        g_tmp <- graph_from_adjacency_matrix(A_sub[[t]][,, inds[[s]][[g]][i]],
          mode = "undirected", diag = FALSE, weighted = TRUE
        )
        g_tmp <- set_brainGraph_attr(g_tmp, atlas, modality = "fmri",
          threshold = thresholds[t],
          subject = covars[
            Group == groups[g] & Session == sessions[s],
            Study.ID
          ][i],
          group = groups[g],
          A = A_sub[[t]][,, inds[[s]][[g]][i]],
          use.parallel = FALSE
        )
        write_rds(g_tmp,
          here("data", "processed", "graphs",
            sprintf("s%i_g%i_thr%02i_sub%02i%s", s, g, t, i, ".rds")
          )
        )
      }
    }

    # Group mean weighted graphs
    message(sprintf("Group %i; Session %i; %s", g, s, format(Sys.time(), "%H:%M:%S")))
    gph_group[[s]][[g]] <- lapply(seq_along(thresholds), function(x)
      graph_from_adjacency_matrix(A_mean[[x]][[group_session[[g]][s]]],
        mode = "undirected", diag = FALSE, weighted = TRUE
      )
    )

    gph_group[[s]][[g]] <- llply(seq_along(thresholds), function(x)
      set_brainGraph_attr(gph_group[[s]][[g]][[x]], atlas, modality = "fmri",
        threshold = thresholds[x], group = groups[g],
        A = A_mean[[x]][[group_session[[g]][s]]], use.parallel = FALSE
      ),
      .parallel = TRUE
    )
  }
}

## Validity check and saving of graph object
for (s in seq_along(sessions)) {
  for (g in seq_along(groups)) {
    gph[[s]][[g]] <- fnames[[s]][[g]] <-
      vector("list", length = length(thresholds))
    for (t in seq_along(thresholds)) {
      fnames[[s]][[g]][[t]] <- list.files(
        here("data", "processed", "graphs"),
        sprintf("s%i_g%i_thr%02i.*", s, g, t),
        full.names = TRUE
      )
      gph[[s]][[g]][[t]] <- map(fnames[[s]][[g]][[t]], read_rds)
    }

    is_equal <- all.equal(
      map_chr(gph[[s]][[g]][[1]], graph_attr, "name"),
      covars[Group == groups[g] & Session == sessions[s], Study.ID]
    )
    if (isTRUE(is_equal)) map(fnames[[s]][[g]], file.remove)
  }
}

## Name graph object
gph <- set_names(gph, sessions)
gph <- map(gph, set_names, groups)
gph <- map_depth(gph, 2, set_names, thresholds)

## Save rds objects
write_rds(gph, here("./data/processed/graphs/gph.rds"))
write_rds(gph_group, here("./data/processed/graphs/gph_group.rds"))
