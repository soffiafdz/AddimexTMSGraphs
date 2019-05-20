
# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNt0$W.norm.sub
A.norm.mean <- matsFPNt0$W.norm.mean
atlas <- "pFPN"
g2GrFPNt0 <- g2FPNt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNt0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNt0[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNt0[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNt0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNt0, paste0(savedir1, 'g2FPNt0.rds'))
write_rds(g2GrFPNt0, paste0(savedir1, 'g2GrFPNt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNt1$A.norm.sub
A.norm.mean <- matsFPNt1$A.norm.mean
atlas <- "pFPN"
g2GrFPNt1 <- g2FPNt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNt1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNt1[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNt1[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNt1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    g2FPNt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNt1, paste0(savedir1, 'g2FPNt1.rds'))
write_rds(g2GrFPNt1, paste0(savedir1, 'g2GrFPNt1.rds'))


# Open label: T0 ------------------------------------------------------------------------------

A.norm.sub <- matsFPNtx0$W.norm.sub
A.norm.mean <- matsFPNtx0$W.norm.mean
atlas <- "pFPN"
g2GrFPNtx0 <- g2FPNtx0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars2[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds2[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNtx0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNtx0[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNtx0[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNtx0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNtx0[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNtx0, paste0(savedir1, 'g2FPNtx0.rds'))
write_rds(g2GrFPNtx0, paste0(savedir1, 'g2GrFPNtx0.rds'))


# Open label: T1 ------------------------------------------------------------------------------

A.norm.sub <- matsFPNtx1$A.norm.sub
A.norm.mean <- matsFPNtx1$A.norm.mean
atlas <- "pFPN"
g2GrFPNtx1 <- g2FPNtx1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds2[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars2[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds2[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNtx1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNtx1[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNtx1[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNtx1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNtx1[[i]][[1]], graph_attr, 'name'),
                   covars2[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNtx1, paste0(savedir1, 'g2FPNtx1.rds'))
write_rds(g2GrFPNtx1, paste0(savedir1, 'g2GrFPNtx1.rds'))


# Longitudinal: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNl0$W.norm.sub
A.norm.mean <- matsFPNl0$W.norm.mean
atlas <- "pFPN"
g2GrFPNl0 <- g2FPNl0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars3[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds3[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNl0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNl0[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNl0[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNl0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNl0[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNl0, paste0(savedir1, 'g2FPNl0.rds'))
write_rds(g2GrFPNl0, paste0(savedir1, 'g2GrFPNl0.rds'))


# Longitudinal: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNl1$W.norm.sub
A.norm.mean <- matsFPNl1$W.norm.mean
atlas <- "pFPN"
g2GrFPNl1 <- g2FPNl1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars3[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds3[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNl1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNl1[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNl1[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNl1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNl1[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNl1, paste0(savedir1, 'g2FPNl1.rds'))
write_rds(g2GrFPNl1, paste0(savedir1, 'g2GrFPNl1.rds'))


# Longitudinal: T2 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNl2$A.norm.sub
A.norm.mean <- matsFPNl2$A.norm.mean
atlas <- "pFPN"
g2GrFPNl2 <- g2FPNl2 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholds), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds3[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresholds[j], 
                                             subject = covars3[groups2[i], Study.ID[k]], 
                                             group = groups2[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds3[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrFPNl2[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(g2GrFPNl2[[i]][[x]])$name <- as.character(pFPN$name)}
    
    g2GrFPNl2[[i]] <- llply(seq_along(thresholds), function(x) 
        set_brainGraph_attr_sof(g2GrFPNl2[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    g2FPNl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2FPNl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(g2FPNl2[[i]][[1]], graph_attr, 'name'),
                   covars3[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(g2FPNl2, paste0(savedir1, 'g2FPNl2.rds'))
write_rds(g2GrFPNl2, paste0(savedir1, 'g2GrFPNl2.rds'))
