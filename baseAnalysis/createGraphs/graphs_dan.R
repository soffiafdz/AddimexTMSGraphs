# 
# # Controls vs Users ---------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANvs$A.norm.sub
# A.norm.mean <- matsDANvs$A.norm.mean
# atlas <- "pDAN"
# gGrDANvs <- gDANvs <- fnames <- vector('list', length=length(groups1))
# 
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds_p[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds_p[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANvs[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANvs[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANvs[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gDANvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANvs, paste0(savedir1, 'gDANvs.rds'))
# write_rds(gGrDANvs, paste0(savedir1, 'gGrDANvs.rds'))
# 


# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsDANt0$A.norm.sub
A.norm.mean <- matsDANt0$A.norm.mean
atlas <- "pDAN"
gGrDANt0 <- gDANt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pDAN$name)
            
            g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
    gGrDANt0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrDANt0[[i]][[x]])$name <- as.character(pDAN$name)}
    
    gGrDANt0[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr1(gGrDANt0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gDANt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gDANt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gDANt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gDANt0, paste0(savedir1, 'gDANt0.rds'))
write_rds(gGrDANt0, paste0(savedir1, 'gGrDANt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsDANt1$A.norm.sub
A.norm.mean <- matsDANt1$A.norm.mean
atlas <- "pDAN"
gGrDANt1 <- gDANt1 <- fnames <- vector('list', length=length(groups2))

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
            V(g.tmp)$name <- as.character(pDAN$name)
            
            g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
    gGrDANt1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrDANt1[[i]][[x]])$name <- as.character(pDAN$name)}
    
    gGrDANt1[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr1(gGrDANt1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gDANt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gDANt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gDANt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gDANt1, paste0(savedir1, 'gDANt1.rds'))
write_rds(gGrDANt1, paste0(savedir1, 'gGrDANt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANtx0$A.norm.sub
# A.norm.mean <- matsDANtx0$A.norm.mean
# atlas <- "pDAN"
# gGrDANtx0 <- gDANtx0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANtx0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANtx0[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANtx0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDANtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANtx0, paste0(savedir1, 'gDANtx0.rds'))
# write_rds(gGrDANtx0, paste0(savedir1, 'gGrDANtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANtx1$A.norm.sub
# A.norm.mean <- matsDANtx1$A.norm.mean
# atlas <- "pDAN"
# gGrDANtx1 <- gDANtx1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANtx1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANtx1[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANtx1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDANtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANtx1, paste0(savedir1, 'gDANtx1.rds'))
# write_rds(gGrDANtx1, paste0(savedir1, 'gGrDANtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANl0$A.norm.sub
# A.norm.mean <- matsDANl0$A.norm.mean
# atlas <- "pDAN"
# gGrDANl0 <- gDANl0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANl0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANl0[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANl0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDANl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANl0, paste0(savedir1, 'gDANl0.rds'))
# write_rds(gGrDANl0, paste0(savedir1, 'gGrDANl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANl1$A.norm.sub
# A.norm.mean <- matsDANl1$A.norm.mean
# atlas <- "pDAN"
# gGrDANl1 <- gDANl1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANl1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANl1[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANl1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDANl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANl1, paste0(savedir1, 'gDANl1.rds'))
# write_rds(gGrDANl1, paste0(savedir1, 'gGrDANl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDANl2$A.norm.sub
# A.norm.mean <- matsDANl2$A.norm.mean
# atlas <- "pDAN"
# gGrDANl2 <- gDANl2 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDAN$name)
#             
#             
#             
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrDANl2[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDANl2[[i]][[x]])$name <- as.character(pDAN$name)}
#     
#     gGrDANl2[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrDANl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDANl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDANl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDANl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDANl2, paste0(savedir1, 'gDANl2.rds'))
# write_rds(gGrDANl2, paste0(savedir1, 'gGrDANl2.rds'))
