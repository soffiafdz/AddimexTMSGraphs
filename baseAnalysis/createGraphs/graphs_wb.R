
# Controls vs Users ---------------------------------------------------------------------------

# A.norm.sub <- matsWBvs$A.norm.sub
# A.norm.mean <- matsWBvs$A.norm.mean
# atlas <- "power"
# gGrWBvs <- gWBvs <- fnames <- vector('list', length=length(groups1))
# 
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', j, '/', length(thresholdWB), '; group ', i, '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds_p[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds_p[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBvs[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBvs[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBvs[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gWBvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBvs, paste0(savedir1, 'gWBvs.rds'))
# write_rds(gGrWBvs, paste0(savedir1, 'gGrWBvs.rds'))



# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsWBt0$A.norm.sub
A.norm.mean <- matsWBt0$A.norm.mean
atlas <- "power"
gGrWBt0 <- gWBt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdWB)) {
        print(paste0('Threshold ', j, '/', length(thresholdWB), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(power$name)
            
            g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
                               weighting = 'sld', threshold = thresholdWB[j], 
                               subject = covars[groups2[i], Study.ID[k]], 
                               group = groups2[i], 
                               use.parallel = F, 
                               A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    gGrWBt0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholdWB)) {V(gGrWBt0[[i]][[x]])$name <- as.character(power$name)}
    
    gGrWBt0[[i]] <- llply(seq_along(thresholdWB), function(x) 
        setBgAttr(gGrWBt0[[i]][[x]], atlas, modality = 'fmri', 
                  weighting = 'sld', threshold = thresholdWB[x], 
                  group = groups2[i], A = A.norm.mean[[x]][[i]], 
                  use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gWBt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
    for (j in seq_along(thresholdWB)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gWBt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gWBt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gWBt0, paste0(savedir1, 'gWBt0.rds'))
write_rds(gGrWBt0, paste0(savedir1, 'gGrWBt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsWBt1$A.norm.sub
A.norm.mean <- matsWBt1$A.norm.mean
atlas <- "power"
gGrWBt1 <- gWBt1 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdWB)) {
        print(paste0('Threshold ', 
                     j, 
                     '/', 
                     length(thresholdWB), 
                     '; group ', 
                     i, 
                     '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(power$name)
            
            g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
                               weighting = 'sld', threshold = thresholdWB[j], 
                               subject = covars[groups2[i], Study.ID[k]], 
                               group = groups2[i], 
                               use.parallel = F, 
                               A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    gGrWBt1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholdWB)) {V(gGrWBt1[[i]][[x]])$name <- as.character(power$name)}
    
    gGrWBt1[[i]] <- llply(seq_along(thresholdWB), function(x) 
        setBgAttr(gGrWBt1[[i]][[x]], atlas, modality = 'fmri', 
                  weighting = 'sld', threshold = thresholdWB[x], 
                  group = groups2[i], A = A.norm.mean[[x]][[i]], 
                  use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gWBt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
    for (j in seq_along(thresholdWB)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gWBt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gWBt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gWBt1, paste0(savedir1, 'gWBt1.rds'))
write_rds(gGrWBt1, paste0(savedir1, 'gGrWBt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsWBtx0$A.norm.sub
# A.norm.mean <- matsWBtx0$A.norm.mean
# atlas <- "power"
# gGrWBtx0 <- gWBtx0 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholdWB), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBtx0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBtx0[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBtx0[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gWBtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBtx0, paste0(savedir1, 'gWBtx0.rds'))
# write_rds(gGrWBtx0, paste0(savedir1, 'gGrWBtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsWBtx1$A.norm.sub
# A.norm.mean <- matsWBtx1$A.norm.mean
# atlas <- "power"
# gGrWBtx1 <- gWBtx1 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholdWB), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds2[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBtx1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBtx1[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBtx1[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gWBtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBtx1, paste0(savedir1, 'gWBtx1.rds'))
# write_rds(gGrWBtx1, paste0(savedir1, 'gGrWBtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsWBl0$A.norm.sub
# A.norm.mean <- matsWBl0$A.norm.mean
# atlas <- "power"
# gGrWBl0 <- gWBl0 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholdWB), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBl0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBl0[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBl0[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gWBl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBl0, paste0(savedir1, 'gWBl0.rds'))
# write_rds(gGrWBl0, paste0(savedir1, 'gGrWBl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsWBl1$A.norm.sub
# A.norm.mean <- matsWBl1$A.norm.mean
# atlas <- "power"
# gGrWBl1 <- gWBl1 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholdWB), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBl1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBl1[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBl1[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gWBl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBl1, paste0(savedir1, 'gWBl1.rds'))
# write_rds(gGrWBl1, paste0(savedir1, 'gGrWBl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsWBl2$A.norm.sub
# A.norm.mean <- matsWBl2$A.norm.mean
# atlas <- "power"
# gGrWBl2 <- gWBl2 <- fnames <- vector('list', length=length(groups2))
# 
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholdWB)) {
#         print(paste0('Threshold ', 
#                      j, 
#                      '/', 
#                      length(thresholdWB), 
#                      '; group ', 
#                      i, 
#                      '; ', 
#                      format(Sys.time(), '%H:%M:%S')))
#         
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds3[[i]][k]],
#                                                  mode='undirected', diag = F, weighted = T)
#             V(g.tmp)$name <- as.character(power$name)
#             
#             
#             
#             g.tmp <- setBgAttr(g.tmp, atlas, modality = 'fmri',
#                                              weighting = 'sld', threshold = thresholdWB[j], 
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
#     gGrWBl2[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrWBl2[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrWBl2[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr(gGrWBl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gWBl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gWBl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gWBl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gWBl2, paste0(savedir1, 'gWBl2.rds'))
# write_rds(gGrWBl2, paste0(savedir1, 'gGrWBl2.rds'))
