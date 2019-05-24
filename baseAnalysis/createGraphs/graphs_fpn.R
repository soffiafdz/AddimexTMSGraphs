# 
# # Controls vs Users ---------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNvs$A.norm.sub
# A.norm.mean <- matsFPNvs$A.norm.mean
# atlas <- "pFPN"
# gGrFPNvs <- gFPNvs <- fnames <- vector('list', length=length(groups1))
# 
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds_p[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds_p[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars_p[groups1[i], Study.ID[k]], 
#                                              group = groups1[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds_p[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNvs[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNvs[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNvs[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gFPNvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNvs, paste0(savedir1, 'gFPNvs.rds'))
# write_rds(gGrFPNvs, paste0(savedir1, 'gGrFPNvs.rds'))



# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNt0$A.norm.sub
A.norm.mean <- matsFPNt0$A.norm.mean
atlas <- "pFPN"
gGrFPNt0 <- gFPNt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pFPN$name)
            
            g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
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
    gGrFPNt0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrFPNt0[[i]][[x]])$name <- as.character(pFPN$name)}
    
    gGrFPNt0[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr(gGrFPNt0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gFPNt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gFPNt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gFPNt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gFPNt0, paste0(savedir1, 'gFPNt0.rds'))
write_rds(gGrFPNt0, paste0(savedir1, 'gGrFPNt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsFPNt1$A.norm.sub
A.norm.mean <- matsFPNt1$A.norm.mean
atlas <- "pFPN"
gGrFPNt1 <- gFPNt1 <- fnames <- vector('list', length=length(groups2))

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
            
            g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
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
    gGrFPNt1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrFPNt1[[i]][[x]])$name <- as.character(pFPN$name)}
    
    gGrFPNt1[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr(gGrFPNt1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gFPNt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gFPNt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gFPNt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gFPNt1, paste0(savedir1, 'gFPNt1.rds'))
write_rds(gGrFPNt1, paste0(savedir1, 'gGrFPNt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNtx0$A.norm.sub
# A.norm.mean <- matsFPNtx0$A.norm.mean
# atlas <- "pFPN"
# gGrFPNtx0 <- gFPNtx0 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholds), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars2[groups2[i], Study.ID[k]], 
#                                              group = groups2[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds2[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNtx0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNtx0[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNtx0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gFPNtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNtx0, paste0(savedir1, 'gFPNtx0.rds'))
# write_rds(gGrFPNtx0, paste0(savedir1, 'gGrFPNtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNtx1$A.norm.sub
# A.norm.mean <- matsFPNtx1$A.norm.mean
# atlas <- "pFPN"
# gGrFPNtx1 <- gFPNtx1 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholds), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars2[groups2[i], Study.ID[k]], 
#                                              group = groups2[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds2[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNtx1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNtx1[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNtx1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gFPNtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNtx1, paste0(savedir1, 'gFPNtx1.rds'))
# write_rds(gGrFPNtx1, paste0(savedir1, 'gGrFPNtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNl0$A.norm.sub
# A.norm.mean <- matsFPNl0$A.norm.mean
# atlas <- "pFPN"
# gGrFPNl0 <- gFPNl0 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholds), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars3[groups2[i], Study.ID[k]], 
#                                              group = groups2[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds3[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNl0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNl0[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNl0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gFPNl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNl0, paste0(savedir1, 'gFPNl0.rds'))
# write_rds(gGrFPNl0, paste0(savedir1, 'gGrFPNl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNl1$A.norm.sub
# A.norm.mean <- matsFPNl1$A.norm.mean
# atlas <- "pFPN"
# gGrFPNl1 <- gFPNl1 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholds), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars3[groups2[i], Study.ID[k]], 
#                                              group = groups2[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds3[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNl1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNl1[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNl1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gFPNl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNl1, paste0(savedir1, 'gFPNl1.rds'))
# write_rds(gGrFPNl1, paste0(savedir1, 'gGrFPNl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsFPNl2$A.norm.sub
# A.norm.mean <- matsFPNl2$A.norm.mean
# atlas <- "pFPN"
# gGrFPNl2 <- gFPNl2 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholds), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pFPN$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholds[j], 
#                                              subject = covars3[groups2[i], Study.ID[k]], 
#                                              group = groups2[i], 
#                                              use.parallel = F, 
#                                              A = A.norm.sub[[j]][, , inds3[[i]][k]])
#             write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
#         }
#     }
#     
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrFPNl2[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrFPNl2[[i]][[x]])$name <- as.character(pFPN$name)}
#     
#     gGrFPNl2[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrFPNl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gFPNl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gFPNl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gFPNl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gFPNl2, paste0(savedir1, 'gFPNl2.rds'))
# write_rds(gGrFPNl2, paste0(savedir1, 'gGrFPNl2.rds'))
