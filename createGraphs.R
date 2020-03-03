
A.norm.sub <- mats$A.norm.sub
A.norm.mean <- mats$A.norm.mean
gGroup <- g <- fnames <- vector('list', length = length(sessions))

for (i in seq_along(sessions)) {
    gGroup[[i]] <- g[[i]] <- fnames[[i]] <- vector('list', length = length(groups))
    for (j in seq_along(groups)) {
        for (k in seq_along(thresholds)) {
            print(
                paste0(
                    'Threshold ', k, '/', length(thresholds),
                    '; session ', i, '; group ', j, '; ',
                    format(Sys.time(), '%H:%M:%S')
                )
            )

            foreach (l=seq_along(inds[[i]][[j]])) %dopar% {
                g.tmp <- graph_from_adjacency_matrix(
                    A.norm.sub[[k]][, , inds[[i]][[j]][l]],
                    mode = 'undirected',
                    diag = FALSE,
                    weighted = TRUE
                )

                g.tmp <- set_brainGraph_attr(
                    g.tmp,
                    use.parallel = FALSE,
                    A = A.norm.sub[[k]][, , inds[[i]][[j]][l]]
                )

                V(g.tmp)$name <- as.character(power264$name)
                g.tmp$weighting <- 'Pearson'
                g.tmp$threshold <- thresholds[k]
                g.tmp$session <- sessions[i]
                g.tmp$group = groups[j]
                g.tmp$name <- covars[
                    Session == sessions[i] & Group == groups[j], Study.ID[l]
                ]

                write_rds(
                    g.tmp,
                    paste0(
                        savedir1,
                        sprintf(
                        's%i_g%i_thr%02i_subj%03i%s', i, j, k, l, '.RDS'
                        )
                    )
                )
            }
        }

        # Group mean-weighted graphs
        print(
            paste0(
                'Session ', i, '; Group ', j, '; ',
                format(Sys.time(), '%H:%M:%S')
            )
        )

        gGroup[[i]][[j]] <- lapply(seq_along(thresholds), function(x)
            graph_from_adjacency_matrix(
                A.norm.mean[[x]][[i^2-i+j]],
                mode = 'undirected',
                diag = FALSE,
                weighted = TRUE,
            )
        )

        for (x in seq_along(thresholds)) {
            V(gGroup[[i]][[j]][[x]])$name <- as.character(power264$name)
        }

        gGroup[[i]][[j]] <- llply(seq_along(thresholds), function(x)
            set_brainGraph_attr(
                gGroup[[i]][[j]][[x]],
                A = A.norm.mean[[x]][[i^2-i+j]],
                use.parallel = FALSE
            ), .parallel = TRUE
        )
    }
}

for (i in seq_along(sessions)) {
    for (j in seq_along(groups)) {
        g[[i]][[j]] <- fnames[[i]][[j]] <- vector('list', length = length(thresholds))
        for (k in seq_along(thresholds)) {
            fnames[[i]][[j]][[k]] <- list.files(
                savedir,
                sprintf('*s%i_g%i_thr%02i.*', i, j, k, '.RDS'),
                full.names = TRUE
            )
            g[[i]][[j]][[k]] <- lapply(fnames[[i]][[j]][[k]], read_rds)
        }

        x <- all.equal(
            sapply(g[[i]][[j]][[1]], graph_attr, 'name'),
            covars[
                Session == sessions[i] & Group == groups[j], Study.ID
            ]
        )

        if (isTRUE(x)) lapply(fnames[[i]][[j]], file.remove)
    }
}

write_rds(g, paste0(savedir1, 'g.RDS'))
write_rds(gGroup, paste0(savedir1, 'gGroup.RDS'))
