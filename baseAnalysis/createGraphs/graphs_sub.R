# 
# # Controls vs Users ---------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBvs$A.norm.sub
# A.norm.mean <- matsSUBvs$A.norm.mean
# atlas <- "pSUB"
# gGrSUBvs <- gSUBvs <- fnames <- vector('list', length=length(groups1))
# 
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholds)) {
#         print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds_p[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds_p[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBvs[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBvs[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBvs[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gSUBvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBvs, paste0(savedir1, 'gSUBvs.rds'))
# write_rds(gGrSUBvs, paste0(savedir1, 'gGrSUBvs.rds'))
# 


# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsSUBt0$A.norm.sub
A.norm.mean <- matsSUBt0$A.norm.mean
atlas <- "pSUB"
gGrSUBt0 <- gSUBt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholds)) {
        print(paste0('Threshold ', j, '/', length(thresholds), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSUB$name)
            
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
    gGrSUBt0[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrSUBt0[[i]][[x]])$name <- as.character(pSUB$name)}
    
    gGrSUBt0[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr1(gGrSUBt0[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gSUBt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gSUBt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gSUBt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gSUBt0, paste0(savedir1, 'gSUBt0.rds'))
write_rds(gGrSUBt0, paste0(savedir1, 'gGrSUBt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsSUBt1$A.norm.sub
A.norm.mean <- matsSUBt1$A.norm.mean
atlas <- "pSUB"
gGrSUBt1 <- gSUBt1 <- fnames <- vector('list', length=length(groups2))

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
            V(g.tmp)$name <- as.character(pSUB$name)
            
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
    gGrSUBt1[[i]] <- lapply(seq_along(thresholds), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholds)) {V(gGrSUBt1[[i]][[x]])$name <- as.character(pSUB$name)}
    
    gGrSUBt1[[i]] <- llply(seq_along(thresholds), function(x) 
        setBgAttr1(gGrSUBt1[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresholds[x], 
                                group = groups2[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gSUBt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gSUBt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gSUBt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gSUBt1, paste0(savedir1, 'gSUBt1.rds'))
write_rds(gGrSUBt1, paste0(savedir1, 'gGrSUBt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBtx0$A.norm.sub
# A.norm.mean <- matsSUBtx0$A.norm.mean
# atlas <- "pSUB"
# gGrSUBtx0 <- gSUBtx0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBtx0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBtx0[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBtx0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gSUBtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBtx0, paste0(savedir1, 'gSUBtx0.rds'))
# write_rds(gGrSUBtx0, paste0(savedir1, 'gGrSUBtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBtx1$A.norm.sub
# A.norm.mean <- matsSUBtx1$A.norm.mean
# atlas <- "pSUB"
# gGrSUBtx1 <- gSUBtx1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBtx1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBtx1[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBtx1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gSUBtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBtx1, paste0(savedir1, 'gSUBtx1.rds'))
# write_rds(gGrSUBtx1, paste0(savedir1, 'gGrSUBtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBl0$A.norm.sub
# A.norm.mean <- matsSUBl0$A.norm.mean
# atlas <- "pSUB"
# gGrSUBl0 <- gSUBl0 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBl0[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBl0[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBl0[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gSUBl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBl0, paste0(savedir1, 'gSUBl0.rds'))
# write_rds(gGrSUBl0, paste0(savedir1, 'gGrSUBl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBl1$A.norm.sub
# A.norm.mean <- matsSUBl1$A.norm.mean
# atlas <- "pSUB"
# gGrSUBl1 <- gSUBl1 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBl1[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBl1[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBl1[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gSUBl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBl1, paste0(savedir1, 'gSUBl1.rds'))
# write_rds(gGrSUBl1, paste0(savedir1, 'gGrSUBl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsSUBl2$A.norm.sub
# A.norm.mean <- matsSUBl2$A.norm.mean
# atlas <- "pSUB"
# gGrSUBl2 <- gSUBl2 <- fnames <- vector('list', length=length(groups2))
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
#             V(g.tmp)$name <- as.character(pSUB$name)
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
#     gGrSUBl2[[i]] <- lapply(seq_along(thresholds), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholds)) {V(gGrSUBl2[[i]][[x]])$name <- as.character(pSUB$name)}
#     
#     gGrSUBl2[[i]] <- llply(seq_along(thresholds), function(x) 
#         setBgAttr1(gGrSUBl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholds[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gSUBl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gSUBl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gSUBl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gSUBl2, paste0(savedir1, 'gSUBl2.rds'))
# write_rds(gGrSUBl2, paste0(savedir1, 'gGrSUBl2.rds'))
