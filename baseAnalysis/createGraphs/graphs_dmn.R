
# # Controls vs Users ---------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNvs$A.norm.sub
# A.norm.mean <- matsDMNvs$A.norm.mean
# atlas <- "pDMN"
# gGrDMNvs <- gDMNvs <- fnames <- vector('list', length=length(groups1))
# 
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds_p[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds_p[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNvs[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNvs[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNvs[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gDMNvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNvs, paste0(savedir1, 'gDMNvs.rds'))
# write_rds(gGrDMNvs, paste0(savedir1, 'gGrDMNvs.rds'))
# 
# 

# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsDMNt0$A.norm.sub
A.norm.mean <- matsDMNt0$A.norm.mean
atlas <- "pDMN"
gGrDMNt0 <- gDMNt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pDMN$name)
            
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
    gGrDMNt0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrDMNt0[[i]][[x]])$name <- as.character(pDMN$name)}
    
    gGrDMNt0[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr(gGrDMNt0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gDMNt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gDMNt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gDMNt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gDMNt0, paste0(savedir1, 'gDMNt0.rds'))
write_rds(gGrDMNt0, paste0(savedir1, 'gGrDMNt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsDMNt1$A.norm.sub
A.norm.mean <- matsDMNt1$A.norm.mean
atlas <- "pDMN"
gGrDMNt1 <- gDMNt1 <- fnames <- vector('list', length=length(groups2))

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
            V(g.tmp)$name <- as.character(pDMN$name)
            
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
    gGrDMNt1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrDMNt1[[i]][[x]])$name <- as.character(pDMN$name)}
    
    gGrDMNt1[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr(gGrDMNt1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gDMNt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gDMNt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gDMNt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gDMNt1, paste0(savedir1, 'gDMNt1.rds'))
write_rds(gGrDMNt1, paste0(savedir1, 'gGrDMNt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNtx0$A.norm.sub
# A.norm.mean <- matsDMNtx0$A.norm.mean
# atlas <- "pDMN"
# gGrDMNtx0 <- gDMNtx0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNtx0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNtx0[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNtx0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDMNtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNtx0, paste0(savedir1, 'gDMNtx0.rds'))
# write_rds(gGrDMNtx0, paste0(savedir1, 'gGrDMNtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNtx1$A.norm.sub
# A.norm.mean <- matsDMNtx1$A.norm.mean
# atlas <- "pDMN"
# gGrDMNtx1 <- gDMNtx1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNtx1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNtx1[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNtx1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDMNtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNtx1, paste0(savedir1, 'gDMNtx1.rds'))
# write_rds(gGrDMNtx1, paste0(savedir1, 'gGrDMNtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNl0$A.norm.sub
# A.norm.mean <- matsDMNl0$A.norm.mean
# atlas <- "pDMN"
# gGrDMNl0 <- gDMNl0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNl0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNl0[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNl0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDMNl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNl0, paste0(savedir1, 'gDMNl0.rds'))
# write_rds(gGrDMNl0, paste0(savedir1, 'gGrDMNl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNl1$A.norm.sub
# A.norm.mean <- matsDMNl1$A.norm.mean
# atlas <- "pDMN"
# gGrDMNl1 <- gDMNl1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNl1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNl1[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNl1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDMNl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNl1, paste0(savedir1, 'gDMNl1.rds'))
# write_rds(gGrDMNl1, paste0(savedir1, 'gGrDMNl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsDMNl2$A.norm.sub
# A.norm.mean <- matsDMNl2$A.norm.mean
# atlas <- "pDMN"
# gGrDMNl2 <- gDMNl2 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pDMN$name)
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
#     gGrDMNl2[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrDMNl2[[i]][[x]])$name <- as.character(pDMN$name)}
#     
#     gGrDMNl2[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr(gGrDMNl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gDMNl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gDMNl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gDMNl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gDMNl2, paste0(savedir1, 'gDMNl2.rds'))
# write_rds(gGrDMNl2, paste0(savedir1, 'gGrDMNl2.rds'))
