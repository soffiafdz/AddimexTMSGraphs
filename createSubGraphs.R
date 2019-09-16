
# CON ---------------------------------------------------------------------
# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:8]
A.norm.sub <- matsCONp$A.norm.sub
A.norm.mean <- matsCONp$A.norm.mean
atlas <- "pCON"
CONGrP <- CONp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrP[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    CONp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONp, paste0(savedir1, 'CONp.RDS'))
write_rds(CONGrP, paste0(savedir1, 'CONGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsCONt0$A.norm.sub
A.norm.mean <- matsCONt0$A.norm.mean
atlas <- "pCON"
CONGrT0 <- CONt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrT0[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONt0, paste0(savedir1, 'CONt0.RDS'))
write_rds(CONGrT0, paste0(savedir1, 'CONGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsCONt1$A.norm.sub
A.norm.mean <- matsCONt1$A.norm.mean
atlas <- "pCON"
CONGrT1 <- CONt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrT1[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONt1, paste0(savedir1, 'CONt1.RDS'))
write_rds(CONGrT1, paste0(savedir1, 'CONGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsCONl10$A.norm.sub
A.norm.mean <- matsCONl10$A.norm.mean
atlas <- "pCON"
CONGrL10 <- CONl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL10[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl10, paste0(savedir1, 'CONl10.RDS'))
write_rds(CONGrL10, paste0(savedir1, 'CONGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsCONl11$A.norm.sub
A.norm.mean <- matsCONl11$A.norm.mean
atlas <- "pCON"
CONGrL11 <- CONl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL11[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl11, paste0(savedir1, 'CONl11.RDS'))
write_rds(CONGrL11, paste0(savedir1, 'CONGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsCONl12$A.norm.sub
A.norm.mean <- matsCONl12$A.norm.mean
atlas <- "pCON"
CONGrL12 <- CONl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL12[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl12, paste0(savedir1, 'CONl12.RDS'))
write_rds(CONGrL12, paste0(savedir1, 'CONGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsCONl20$A.norm.sub
A.norm.mean <- matsCONl20$A.norm.mean
atlas <- "pCON"
CONGrL20 <- CONl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL20[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl20, paste0(savedir1, 'CONl20.RDS'))
write_rds(CONGrL20, paste0(savedir1, 'CONGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsCONl21$A.norm.sub
A.norm.mean <- matsCONl21$A.norm.mean
atlas <- "pCON"
CONGrL21 <- CONl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL21[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl21, paste0(savedir1, 'CONl21.RDS'))
write_rds(CONGrL21, paste0(savedir1, 'CONGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsCONl22$A.norm.sub
A.norm.mean <- matsCONl22$A.norm.mean
atlas <- "pCON"
CONGrL22 <- CONl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL22[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl22, paste0(savedir1, 'CONl22.RDS'))
write_rds(CONGrL22, paste0(savedir1, 'CONGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsCONl23$A.norm.sub
A.norm.mean <- matsCONl23$A.norm.mean
atlas <- "pCON"
CONGrL23 <- CONl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pCON$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    CONGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(CONGrL23[[i]][[x]])$name <- as.character(pCON$name)
    }

    CONGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            CONGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    CONl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        CONl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(CONl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(CONl23, paste0(savedir1, 'CONl23.RDS'))
write_rds(CONGrL23, paste0(savedir1, 'CONGrL23.RDS'))


# DAN ---------------------------------------------------------------------

# # Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:6]
A.norm.sub <- matsDANp$A.norm.sub
A.norm.mean <- matsDANp$A.norm.mean
atlas <- "pDAN"
DANGrP <- DANp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrP[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    DANp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANp, paste0(savedir1, 'DANp.RDS'))
write_rds(DANGrP, paste0(savedir1, 'DANGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsDANt0$A.norm.sub
A.norm.mean <- matsDANt0$A.norm.mean
atlas <- "pDAN"
DANGrT0 <- DANt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrT0[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANt0, paste0(savedir1, 'DANt0.RDS'))
write_rds(DANGrT0, paste0(savedir1, 'DANGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsDANt1$A.norm.sub
A.norm.mean <- matsDANt1$A.norm.mean
atlas <- "pDAN"
DANGrT1 <- DANt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrT1[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANt1, paste0(savedir1, 'DANt1.RDS'))
write_rds(DANGrT1, paste0(savedir1, 'DANGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsDANl10$A.norm.sub
A.norm.mean <- matsDANl10$A.norm.mean
atlas <- "pDAN"
DANGrL10 <- DANl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL10[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl10, paste0(savedir1, 'DANl10.RDS'))
write_rds(DANGrL10, paste0(savedir1, 'DANGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsDANl11$A.norm.sub
A.norm.mean <- matsDANl11$A.norm.mean
atlas <- "pDAN"
DANGrL11 <- DANl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL11[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl11, paste0(savedir1, 'DANl11.RDS'))
write_rds(DANGrL11, paste0(savedir1, 'DANGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsDANl12$A.norm.sub
A.norm.mean <- matsDANl12$A.norm.mean
atlas <- "pDAN"
DANGrL12 <- DANl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL12[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl12, paste0(savedir1, 'DANl12.RDS'))
write_rds(DANGrL12, paste0(savedir1, 'DANGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsDANl20$A.norm.sub
A.norm.mean <- matsDANl20$A.norm.mean
atlas <- "pDAN"
DANGrL20 <- DANl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL20[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl20, paste0(savedir1, 'DANl20.RDS'))
write_rds(DANGrL20, paste0(savedir1, 'DANGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsDANl21$A.norm.sub
A.norm.mean <- matsDANl21$A.norm.mean
atlas <- "pDAN"
DANGrL21 <- DANl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL21[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl21, paste0(savedir1, 'DANl21.RDS'))
write_rds(DANGrL21, paste0(savedir1, 'DANGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsDANl22$A.norm.sub
A.norm.mean <- matsDANl22$A.norm.mean
atlas <- "pDAN"
DANGrL22 <- DANl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL22[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl22, paste0(savedir1, 'DANl22.RDS'))
write_rds(DANGrL22, paste0(savedir1, 'DANGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsDANl23$A.norm.sub
A.norm.mean <- matsDANl23$A.norm.mean
atlas <- "pDAN"
DANGrL23 <- DANl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DANGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DANGrL23[[i]][[x]])$name <- as.character(pDAN$name)
    }

    DANGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DANGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DANl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DANl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DANl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DANl23, paste0(savedir1, 'DANl23.RDS'))
write_rds(DANGrL23, paste0(savedir1, 'DANGrL23.RDS'))


# DMN ---------------------------------------------------------------------

# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:8]
A.norm.sub <- matsDMNp$A.norm.sub
A.norm.mean <- matsDMNp$A.norm.mean
atlas <- "pDMN"
DMNGrP <- DMNp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrP[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    DMNp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNp, paste0(savedir1, 'DMNp.RDS'))
write_rds(DMNGrP, paste0(savedir1, 'DMNGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsDMNt0$A.norm.sub
A.norm.mean <- matsDMNt0$A.norm.mean
atlas <- "pDMN"
DMNGrT0 <- DMNt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrT0[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNt0, paste0(savedir1, 'DMNt0.RDS'))
write_rds(DMNGrT0, paste0(savedir1, 'DMNGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsDMNt1$A.norm.sub
A.norm.mean <- matsDMNt1$A.norm.mean
atlas <- "pDMN"
DMNGrT1 <- DMNt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrT1[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNt1, paste0(savedir1, 'DMNt1.RDS'))
write_rds(DMNGrT1, paste0(savedir1, 'DMNGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsDMNl10$A.norm.sub
A.norm.mean <- matsDMNl10$A.norm.mean
atlas <- "pDMN"
DMNGrL10 <- DMNl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL10[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl10, paste0(savedir1, 'DMNl10.RDS'))
write_rds(DMNGrL10, paste0(savedir1, 'DMNGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsDMNl11$A.norm.sub
A.norm.mean <- matsDMNl11$A.norm.mean
atlas <- "pDMN"
DMNGrL11 <- DMNl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL11[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl11, paste0(savedir1, 'DMNl11.RDS'))
write_rds(DMNGrL11, paste0(savedir1, 'DMNGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsDMNl12$A.norm.sub
A.norm.mean <- matsDMNl12$A.norm.mean
atlas <- "pDMN"
DMNGrL12 <- DMNl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL12[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl12, paste0(savedir1, 'DMNl12.RDS'))
write_rds(DMNGrL12, paste0(savedir1, 'DMNGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsDMNl20$A.norm.sub
A.norm.mean <- matsDMNl20$A.norm.mean
atlas <- "pDMN"
DMNGrL20 <- DMNl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL20[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl20, paste0(savedir1, 'DMNl20.RDS'))
write_rds(DMNGrL20, paste0(savedir1, 'DMNGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsDMNl21$A.norm.sub
A.norm.mean <- matsDMNl21$A.norm.mean
atlas <- "pDMN"
DMNGrL21 <- DMNl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL21[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl21, paste0(savedir1, 'DMNl21.RDS'))
write_rds(DMNGrL21, paste0(savedir1, 'DMNGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsDMNl22$A.norm.sub
A.norm.mean <- matsDMNl22$A.norm.mean
atlas <- "pDMN"
DMNGrL22 <- DMNl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL22[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl22, paste0(savedir1, 'DMNl22.RDS'))
write_rds(DMNGrL22, paste0(savedir1, 'DMNGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsDMNl23$A.norm.sub
A.norm.mean <- matsDMNl23$A.norm.mean
atlas <- "pDMN"
DMNGrL23 <- DMNl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pDMN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    DMNGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(DMNGrL23[[i]][[x]])$name <- as.character(pDMN$name)
    }

    DMNGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            DMNGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    DMNl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        DMNl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(DMNl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(DMNl23, paste0(savedir1, 'DMNl23.RDS'))
write_rds(DMNGrL23, paste0(savedir1, 'DMNGrL23.RDS'))


# FPN ---------------------------------------------------------------------

# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:8]
A.norm.sub <- matsFPNp$A.norm.sub
A.norm.mean <- matsFPNp$A.norm.mean
atlas <- "pFPN"
FPNGrP <- FPNp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrP[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    FPNp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNp, paste0(savedir1, 'FPNp.RDS'))
write_rds(FPNGrP, paste0(savedir1, 'FPNGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsFPNt0$A.norm.sub
A.norm.mean <- matsFPNt0$A.norm.mean
atlas <- "pFPN"
FPNGrT0 <- FPNt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrT0[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNt0, paste0(savedir1, 'FPNt0.RDS'))
write_rds(FPNGrT0, paste0(savedir1, 'FPNGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsFPNt1$A.norm.sub
A.norm.mean <- matsFPNt1$A.norm.mean
atlas <- "pFPN"
FPNGrT1 <- FPNt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrT1[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNt1, paste0(savedir1, 'FPNt1.RDS'))
write_rds(FPNGrT1, paste0(savedir1, 'FPNGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsFPNl10$A.norm.sub
A.norm.mean <- matsFPNl10$A.norm.mean
atlas <- "pFPN"
FPNGrL10 <- FPNl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL10[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl10, paste0(savedir1, 'FPNl10.RDS'))
write_rds(FPNGrL10, paste0(savedir1, 'FPNGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsFPNl11$A.norm.sub
A.norm.mean <- matsFPNl11$A.norm.mean
atlas <- "pFPN"
FPNGrL11 <- FPNl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL11[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl11, paste0(savedir1, 'FPNl11.RDS'))
write_rds(FPNGrL11, paste0(savedir1, 'FPNGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsFPNl12$A.norm.sub
A.norm.mean <- matsFPNl12$A.norm.mean
atlas <- "pFPN"
FPNGrL12 <- FPNl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL12[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl12, paste0(savedir1, 'FPNl12.RDS'))
write_rds(FPNGrL12, paste0(savedir1, 'FPNGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsFPNl20$A.norm.sub
A.norm.mean <- matsFPNl20$A.norm.mean
atlas <- "pFPN"
FPNGrL20 <- FPNl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL20[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl20, paste0(savedir1, 'FPNl20.RDS'))
write_rds(FPNGrL20, paste0(savedir1, 'FPNGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsFPNl21$A.norm.sub
A.norm.mean <- matsFPNl21$A.norm.mean
atlas <- "pFPN"
FPNGrL21 <- FPNl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL21[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl21, paste0(savedir1, 'FPNl21.RDS'))
write_rds(FPNGrL21, paste0(savedir1, 'FPNGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsFPNl22$A.norm.sub
A.norm.mean <- matsFPNl22$A.norm.mean
atlas <- "pFPN"
FPNGrL22 <- FPNl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL22[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl22, paste0(savedir1, 'FPNl22.RDS'))
write_rds(FPNGrL22, paste0(savedir1, 'FPNGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsFPNl23$A.norm.sub
A.norm.mean <- matsFPNl23$A.norm.mean
atlas <- "pFPN"
FPNGrL23 <- FPNl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pFPN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    FPNGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(FPNGrL23[[i]][[x]])$name <- as.character(pFPN$name)
    }

    FPNGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            FPNGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    FPNl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        FPNl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(FPNl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(FPNl23, paste0(savedir1, 'FPNl23.RDS'))
write_rds(FPNGrL23, paste0(savedir1, 'FPNGrL23.RDS'))


# SAL ---------------------------------------------------------------------

# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:6]
A.norm.sub <- matsSALp$A.norm.sub
A.norm.mean <- matsSALp$A.norm.mean
atlas <- "pSAL"
SALGrP <- SALp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrP[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    SALp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALp, paste0(savedir1, 'SALp.RDS'))
write_rds(SALGrP, paste0(savedir1, 'SALGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsSALt0$A.norm.sub
A.norm.mean <- matsSALt0$A.norm.mean
atlas <- "pSAL"
SALGrT0 <- SALt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrT0[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALt0, paste0(savedir1, 'SALt0.RDS'))
write_rds(SALGrT0, paste0(savedir1, 'SALGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsSALt1$A.norm.sub
A.norm.mean <- matsSALt1$A.norm.mean
atlas <- "pSAL"
SALGrT1 <- SALt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrT1[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALt1, paste0(savedir1, 'SALt1.RDS'))
write_rds(SALGrT1, paste0(savedir1, 'SALGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsSALl10$A.norm.sub
A.norm.mean <- matsSALl10$A.norm.mean
atlas <- "pSAL"
SALGrL10 <- SALl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL10[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl10, paste0(savedir1, 'SALl10.RDS'))
write_rds(SALGrL10, paste0(savedir1, 'SALGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsSALl11$A.norm.sub
A.norm.mean <- matsSALl11$A.norm.mean
atlas <- "pSAL"
SALGrL11 <- SALl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL11[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl11, paste0(savedir1, 'SALl11.RDS'))
write_rds(SALGrL11, paste0(savedir1, 'SALGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsSALl12$A.norm.sub
A.norm.mean <- matsSALl12$A.norm.mean
atlas <- "pSAL"
SALGrL12 <- SALl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL12[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl12, paste0(savedir1, 'SALl12.RDS'))
write_rds(SALGrL12, paste0(savedir1, 'SALGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsSALl20$A.norm.sub
A.norm.mean <- matsSALl20$A.norm.mean
atlas <- "pSAL"
SALGrL20 <- SALl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL20[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl20, paste0(savedir1, 'SALl20.RDS'))
write_rds(SALGrL20, paste0(savedir1, 'SALGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsSALl21$A.norm.sub
A.norm.mean <- matsSALl21$A.norm.mean
atlas <- "pSAL"
SALGrL21 <- SALl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL21[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl21, paste0(savedir1, 'SALl21.RDS'))
write_rds(SALGrL21, paste0(savedir1, 'SALGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsSALl22$A.norm.sub
A.norm.mean <- matsSALl22$A.norm.mean
atlas <- "pSAL"
SALGrL22 <- SALl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL22[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl22, paste0(savedir1, 'SALl22.RDS'))
write_rds(SALGrL22, paste0(savedir1, 'SALGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsSALl23$A.norm.sub
A.norm.mean <- matsSALl23$A.norm.mean
atlas <- "pSAL"
SALGrL23 <- SALl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSAL$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SALGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SALGrL23[[i]][[x]])$name <- as.character(pSAL$name)
    }

    SALGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SALGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SALl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SALl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SALl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SALl23, paste0(savedir1, 'SALl23.RDS'))
write_rds(SALGrL23, paste0(savedir1, 'SALGrL23.RDS'))


# SUB ---------------------------------------------------------------------

# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:6]
A.norm.sub <- matsSUBp$A.norm.sub
A.norm.mean <- matsSUBp$A.norm.mean
atlas <- "pSUB"
SUBGrP <- SUBp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrP[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    SUBp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBp, paste0(savedir1, 'SUBp.RDS'))
write_rds(SUBGrP, paste0(savedir1, 'SUBGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsSUBT0$A.norm.sub
A.norm.mean <- matsSUBT0$A.norm.mean
atlas <- "pSUB"
SUBGrT0 <- SUBt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrT0[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBt0, paste0(savedir1, 'SUBt0.RDS'))
write_rds(SUBGrT0, paste0(savedir1, 'SUBGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsSUBT1$A.norm.sub
A.norm.mean <- matsSUBT1$A.norm.mean
atlas <- "pSUB"
SUBGrT1 <- SUBt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrT1[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBt1, paste0(savedir1, 'SUBt1.RDS'))
write_rds(SUBGrT1, paste0(savedir1, 'SUBGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsSUBl10$A.norm.sub
A.norm.mean <- matsSUBl10$A.norm.mean
atlas <- "pSUB"
SUBGrL10 <- SUBl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL10[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl10, paste0(savedir1, 'SUBl10.RDS'))
write_rds(SUBGrL10, paste0(savedir1, 'SUBGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsSUBl11$A.norm.sub
A.norm.mean <- matsSUBl11$A.norm.mean
atlas <- "pSUB"
SUBGrL11 <- SUBl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL11[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl11, paste0(savedir1, 'SUBl11.RDS'))
write_rds(SUBGrL11, paste0(savedir1, 'SUBGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsSUBl12$A.norm.sub
A.norm.mean <- matsSUBl12$A.norm.mean
atlas <- "pSUB"
SUBGrL12 <- SUBl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL12[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl12, paste0(savedir1, 'SUBl12.RDS'))
write_rds(SUBGrL12, paste0(savedir1, 'SUBGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsSUBl20$A.norm.sub
A.norm.mean <- matsSUBl20$A.norm.mean
atlas <- "pSUB"
SUBGrL20 <- SUBl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL20[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl20, paste0(savedir1, 'SUBl20.RDS'))
write_rds(SUBGrL20, paste0(savedir1, 'SUBGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsSUBl21$A.norm.sub
A.norm.mean <- matsSUBl21$A.norm.mean
atlas <- "pSUB"
SUBGrL21 <- SUBl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL21[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl21, paste0(savedir1, 'SUBl21.RDS'))
write_rds(SUBGrL21, paste0(savedir1, 'SUBGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsSUBl22$A.norm.sub
A.norm.mean <- matsSUBl22$A.norm.mean
atlas <- "pSUB"
SUBGrL22 <- SUBl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL22[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl22, paste0(savedir1, 'SUBl22.RDS'))
write_rds(SUBGrL22, paste0(savedir1, 'SUBGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsSUBl23$A.norm.sub
A.norm.mean <- matsSUBl23$A.norm.mean
atlas <- "pSUB"
SUBGrL23 <- SUBl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pSUB$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    SUBGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(SUBGrL23[[i]][[x]])$name <- as.character(pSUB$name)
    }

    SUBGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            SUBGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    SUBl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        SUBl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(SUBl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(SUBl23, paste0(savedir1, 'SUBl23.RDS'))
write_rds(SUBGrL23, paste0(savedir1, 'SUBGrL23.RDS'))


# VAN ---------------------------------------------------------------------

# Cocaine Dependent vs Healthy Controls -----------------------------------

thresholdsSubNets <- thresholds[1:6]
A.norm.sub <- matsVANp$A.norm.sub
A.norm.mean <- matsVANp$A.norm.mean
atlas <- "pVAN"
VANGrP <- VANp <- fnames <- vector('list', length=length(groups1))

for (i in seq_along(groups1)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(indsP[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , indsP[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covarsP[groups1[i],
                Study.ID[k]], group = groups1[i], use.parallel = F,
                A = A.norm.sub[[j]][, , indsP[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrP[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrP[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrP[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups1[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups1)) {
    VANp[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANp[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANp[[i]][[1]], graph_attr, 'name'),
                   covarsP[groups1[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANp, paste0(savedir1, 'VANp.RDS'))
write_rds(VANGrP, paste0(savedir1, 'VANGrP.RDS'))


# Closed label: T0 --------------------------------------------------------

thresholdsSubNets <- thresholds[1:12]
A.norm.sub <- matsVANt0$A.norm.sub
A.norm.mean <- matsVANt0$A.norm.mean
atlas <- "pVAN"
VANGrT0 <- VANt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrT0[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrT0[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrT0[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANt0[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANt0, paste0(savedir1, 'VANt0.RDS'))
write_rds(VANGrT0, paste0(savedir1, 'VANGrT0.RDS'))

# Closed label: T1 --------------------------------------------------------

A.norm.sub <- matsVANt1$A.norm.sub
A.norm.mean <- matsVANt1$A.norm.mean
atlas <- "pVAN"
VANGrT1 <- VANt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds1[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds1[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars1[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds1[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrT1[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrT1[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrT1[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANt1[[i]][[1]], graph_attr, 'name'),
                   covars1[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANt1, paste0(savedir1, 'VANt1.RDS'))
write_rds(VANGrT1, paste0(savedir1, 'VANGrT1.RDS'))


# Longitudinal 1: Baseline ------------------------------------------------

A.norm.sub <- matsVANl10$A.norm.sub
A.norm.mean <- matsVANl10$A.norm.mean
atlas <- "pVAN"
VANGrL10 <- VANl10 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL10[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL10[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL10[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl10[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl10, paste0(savedir1, 'VANl10.RDS'))
write_rds(VANGrL10, paste0(savedir1, 'VANGrL10.RDS'))

# Longitudinal 1: Two weeks -----------------------------------------------

A.norm.sub <- matsVANl11$A.norm.sub
A.norm.mean <- matsVANl11$A.norm.mean
atlas <- "pVAN"
VANGrL11 <- VANl11 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL11[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL11[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL11[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl11[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl11, paste0(savedir1, 'VANl11.RDS'))
write_rds(VANGrL11, paste0(savedir1, 'VANGrL11.RDS'))


# Longitudinal 1: Three months --------------------------------------------

A.norm.sub <- matsVANl12$A.norm.sub
A.norm.mean <- matsVANl12$A.norm.mean
atlas <- "pVAN"
VANGrL12 <- VANl12 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds2[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars2[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds2[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL12[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL12[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL12[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl12[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl12, paste0(savedir1, 'VANl12.RDS'))
write_rds(VANGrL12, paste0(savedir1, 'VANGrL12.RDS'))


# Longitudinal 2: Baseline ------------------------------------------------

A.norm.sub <- matsVANl20$A.norm.sub
A.norm.mean <- matsVANl20$A.norm.mean
atlas <- "pVAN"
VANGrL20 <- VANl20 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL20[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL20[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL20[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl20[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl20, paste0(savedir1, 'VANl20.RDS'))
write_rds(VANGrL20, paste0(savedir1, 'VANGrL20.RDS'))

# Longitudinal 2: Two weeks -----------------------------------------------

A.norm.sub <- matsVANl21$A.norm.sub
A.norm.mean <- matsVANl21$A.norm.mean
atlas <- "pVAN"
VANGrL21 <- VANl21 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL21[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL21[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL21[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl21[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl21, paste0(savedir1, 'VANl21.RDS'))
write_rds(VANGrL21, paste0(savedir1, 'VANGrL21.RDS'))


# Longitudinal 2: Three months --------------------------------------------

A.norm.sub <- matsVANl22$A.norm.sub
A.norm.mean <- matsVANl22$A.norm.mean
atlas <- "pVAN"
VANGrL22 <- VANl22 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL22[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL22[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL22[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl22[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl22, paste0(savedir1, 'VANl22.RDS'))
write_rds(VANGrL22, paste0(savedir1, 'VANGrL22.RDS'))


# Longitudinal 2: Six months ----------------------------------------------

A.norm.sub <- matsVANl23$A.norm.sub
A.norm.mean <- matsVANl23$A.norm.mean
atlas <- "pVAN"
VANGrL23 <- VANl23 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdsSubNets)) {
        print(
            paste0(
                'Threshold ', j, '/', length(thresholdsSubNets),
                '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
            )
        )

        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(
                A.norm.sub[[j]][, , inds3[[i]][k]],
                mode='undirected', diag = F, weighted = T
            )
            V(g.tmp)$name <- as.character(pVAN$name)
            g.tmp <- setBgAttr(
                g.tmp, atlas, modality = 'fmri', weighting = 'sld',
                threshold = thresholdsSubNets[j], subject = covars3[groups2[i],
                Study.ID[k]], group = groups2[i], use.parallel = F,
                A = A.norm.sub[[j]][, , inds3[[i]][k]]
            )
            write_rds(
                g.tmp, paste0(
                    savedir1,
                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
                )
            )
        }
    }

    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    VANGrL23[[i]] <- lapply(seq_along(thresholdsSubNets), function(x)
        graph_from_adjacency_matrix(
            A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
        )

    for (x in seq_along(thresholdsSubNets)) {
        V(VANGrL23[[i]][[x]])$name <- as.character(pVAN$name)
    }

    VANGrL23[[i]] <- llply(seq_along(thresholdsSubNets), function(x)
        setBgAttr(
            VANGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
            threshold = thresholdsSubNets[x], group = groups2[i],
            A = A.norm.mean[[x]][[i]], use.parallel = F
        ), .parallel = T
    )

}

for (i in seq_along(groups2)) {
    VANl23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdsSubNets))
    for (j in seq_along(thresholdsSubNets)) {
        fnames[[i]][[j]] <- list.files(
            savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
        )
        VANl23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }

    x <- all.equal(sapply(VANl23[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(VANl23, paste0(savedir1, 'VANl23.RDS'))
write_rds(VANGrL23, paste0(savedir1, 'VANGrL23.RDS'))


# Read all graphs ---------------------------------------------------------
#
# prefix <- '20190910_'
# prefix1 <- '20190913_'
#
# CONp <- read_rds(paste0(savedir, prefix, 'CONp', '.RDS'))
# CONt0 <- read_rds(paste0(savedir, prefix1, 'CONt0', '.RDS'))
# CONt1 <- read_rds(paste0(savedir, prefix1, 'CONt1', '.RDS'))
# CONl10 <- read_rds(paste0(savedir, prefix, 'CONl10', '.RDS'))
# CONl11 <- read_rds(paste0(savedir, prefix, 'CONl11', '.RDS'))
# CONl12 <- read_rds(paste0(savedir, prefix, 'CONl12', '.RDS'))
# CONl20 <- read_rds(paste0(savedir, prefix, 'CONl20', '.RDS'))
# CONl21 <- read_rds(paste0(savedir, prefix, 'CONl21', '.RDS'))
# CONl22 <- read_rds(paste0(savedir, prefix, 'CONl22', '.RDS'))
# CONl23 <- read_rds(paste0(savedir, prefix, 'CONl23', '.RDS'))
# DANp <- read_rds(paste0(savedir, prefix, 'DANp', '.RDS'))
# DANt0 <- read_rds(paste0(savedir, prefix1, 'DANt0', '.RDS'))
# DANt1 <- read_rds(paste0(savedir, prefix1, 'DANt1', '.RDS'))
# DANl10 <- read_rds(paste0(savedir, prefix, 'DANl10', '.RDS'))
# DANl11 <- read_rds(paste0(savedir, prefix, 'DANl11', '.RDS'))
# DANl12 <- read_rds(paste0(savedir, prefix, 'DANl12', '.RDS'))
# DANl20 <- read_rds(paste0(savedir, prefix, 'DANl20', '.RDS'))
# DANl21 <- read_rds(paste0(savedir, prefix, 'DANl21', '.RDS'))
# DANl22 <- read_rds(paste0(savedir, prefix, 'DANl22', '.RDS'))
# DANl23 <- read_rds(paste0(savedir, prefix, 'DANl23', '.RDS'))
# DMNp <- read_rds(paste0(savedir, prefix, 'DMNp', '.RDS'))
# DMNt0 <- read_rds(paste0(savedir, prefix1, 'DMNt0', '.RDS'))
# DMNt1 <- read_rds(paste0(savedir, prefix1, 'DMNt1', '.RDS'))
# DMNl10 <- read_rds(paste0(savedir, prefix, 'DMNl10', '.RDS'))
# DMNl11 <- read_rds(paste0(savedir, prefix, 'DMNl11', '.RDS'))
# DMNl12 <- read_rds(paste0(savedir, prefix, 'DMNl12', '.RDS'))
# DMNl20 <- read_rds(paste0(savedir, prefix, 'DMNl20', '.RDS'))
# DMNl21 <- read_rds(paste0(savedir, prefix, 'DMNl21', '.RDS'))
# DMNl22 <- read_rds(paste0(savedir, prefix, 'DMNl22', '.RDS'))
# DMNl23 <- read_rds(paste0(savedir, prefix, 'DMNl23', '.RDS'))
# FPNp <- read_rds(paste0(savedir, prefix, 'FPNp', '.RDS'))
# FPNt0 <- read_rds(paste0(savedir, prefix1, 'FPNt0', '.RDS'))
# FPNt1 <- read_rds(paste0(savedir, prefix1, 'FPNt1', '.RDS'))
# FPNl10 <- read_rds(paste0(savedir, prefix, 'FPNl10', '.RDS'))
# FPNl11 <- read_rds(paste0(savedir, prefix, 'FPNl11', '.RDS'))
# FPNl12 <- read_rds(paste0(savedir, prefix, 'FPNl12', '.RDS'))
# FPNl20 <- read_rds(paste0(savedir, prefix, 'FPNl20', '.RDS'))
# FPNl21 <- read_rds(paste0(savedir, prefix, 'FPNl21', '.RDS'))
# FPNl22 <- read_rds(paste0(savedir, prefix, 'FPNl22', '.RDS'))
# FPNl23 <- read_rds(paste0(savedir, prefix, 'FPNl23', '.RDS'))
# SALp <- read_rds(paste0(savedir, prefix, 'SALp', '.RDS'))
# SALt0 <- read_rds(paste0(savedir, prefix1, 'SALt0', '.RDS'))
# SALt1 <- read_rds(paste0(savedir, prefix1, 'SALt1', '.RDS'))
# SALl10 <- read_rds(paste0(savedir, prefix, 'SALl10', '.RDS'))
# SALl11 <- read_rds(paste0(savedir, prefix, 'SALl11', '.RDS'))
# SALl12 <- read_rds(paste0(savedir, prefix, 'SALl12', '.RDS'))
# SALl20 <- read_rds(paste0(savedir, prefix, 'SALl20', '.RDS'))
# SALl21 <- read_rds(paste0(savedir, prefix, 'SALl21', '.RDS'))
# SALl22 <- read_rds(paste0(savedir, prefix, 'SALl22', '.RDS'))
# SALl23 <- read_rds(paste0(savedir, prefix, 'SALl23', '.RDS'))
# SUBp <- read_rds(paste0(savedir, prefix, 'SUBp', '.RDS'))
# SUBt0 <- read_rds(paste0(savedir, prefix1, 'SUBt0', '.RDS'))
# SUBt1 <- read_rds(paste0(savedir, prefix1, 'SUBt1', '.RDS'))
# SUBl10 <- read_rds(paste0(savedir, prefix, 'SUBl10', '.RDS'))
# SUBl11 <- read_rds(paste0(savedir, prefix, 'SUBl11', '.RDS'))
# SUBl12 <- read_rds(paste0(savedir, prefix, 'SUBl12', '.RDS'))
# SUBl20 <- read_rds(paste0(savedir, prefix, 'SUBl20', '.RDS'))
# SUBl21 <- read_rds(paste0(savedir, prefix, 'SUBl21', '.RDS'))
# SUBl22 <- read_rds(paste0(savedir, prefix, 'SUBl22', '.RDS'))
# SUBl23 <- read_rds(paste0(savedir, prefix, 'SUBl23', '.RDS'))
# VANp <- read_rds(paste0(savedir, prefix, 'VANp', '.RDS'))
# VANt0 <- read_rds(paste0(savedir, prefix1, 'VANt0', '.RDS'))
# VANt1 <- read_rds(paste0(savedir, prefix1, 'VANt1', '.RDS'))
# VANl10 <- read_rds(paste0(savedir, prefix, 'VANl10', '.RDS'))
# VANl11 <- read_rds(paste0(savedir, prefix, 'VANl11', '.RDS'))
# VANl12 <- read_rds(paste0(savedir, prefix, 'VANl12', '.RDS'))
# VANl20 <- read_rds(paste0(savedir, prefix, 'VANl20', '.RDS'))
# VANl21 <- read_rds(paste0(savedir, prefix, 'VANl21', '.RDS'))
# VANl22 <- read_rds(paste0(savedir, prefix, 'VANl22', '.RDS'))
# VANl23 <- read_rds(paste0(savedir, prefix, 'VANl23', '.RDS'))
