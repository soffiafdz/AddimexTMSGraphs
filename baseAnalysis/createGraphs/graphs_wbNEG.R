
# Controls vs Users ---------------------------------------------------------------------------

# A.norm.sub <- matsNgWBvs$A.norm.sub
# A.norm.mean <- matsNgWBvs$A.norm.mean
# atlas <- "power"
# gGrNegWBvs <- gNegWBvs <- fnames <- vector('list', length=length(groups1))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBvs[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBvs[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBvs[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBvs[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups1[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups1)) {
#     gNegWBvs[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBvs[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBvs[[i]][[1]], graph_attr, 'name'),
#                    covars_p[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBvs, paste0(savedir1, 'gNegWBvs.rds'))
# write_rds(gGrNegWBvs, paste0(savedir1, 'gGrNegWBvs.rds'))



# Closed label: T0 ----------------------------------------------------------------------------

A.norm.sub <- matsNgWBt0$A.norm.sub
A.norm.mean <- matsNgWBt0$A.norm.mean
atlas <- "power"
gGrNegWBt0 <- gNegWBt0 <- fnames <- vector('list', length=length(groups2))

for (i in seq_along(groups2)) {
    for (j in seq_along(thresholdWB)) {
        print(paste0('Threshold ', j, '/', length(thresholdWB), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(power$name)
            
            g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
    gGrNegWBt0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholdWB)) {V(gGrNegWBt0[[i]][[x]])$name <- as.character(power$name)}
    
    gGrNegWBt0[[i]] <- llply(seq_along(thresholdWB), function(x) 
        setBgAttr1(gGrNegWBt0[[i]][[x]], atlas, modality = 'fmri', 
                  weighting = 'sld', threshold = thresholdWB[x], 
                  group = groups2[i], A = A.norm.mean[[x]][[i]], 
                  use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups2)) {
    gNegWBt0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
    for (j in seq_along(thresholdWB)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gNegWBt0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gNegWBt0[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gNegWBt0, paste0(savedir1, 'gNegWBt0.rds'))
write_rds(gGrNegWBt0, paste0(savedir1, 'gGrNegWBt0.rds'))


# Closed label: T1 ----------------------------------------------------------------------------

A.norm.sub <- matsNgWBt1$A.norm.sub
A.norm.mean <- matsNgWBt1$A.norm.mean
atlas <- "power"
gGrNegWBt1 <- gNegWBt1 <- fnames <- vector('list', length=length(groups2))

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
            
            g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
    gGrNegWBt1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresholdWB)) {V(gGrNegWBt1[[i]][[x]])$name <- as.character(power$name)}
    
    gGrNegWBt1[[i]] <- llply(seq_along(thresholdWB), function(x) 
        setBgAttr1(gGrNegWBt1[[i]][[x]], atlas, modality = 'fmri', 
                  weighting = 'sld', threshold = thresholdWB[x], 
                  group = groups2[i], A = A.norm.mean[[x]][[i]], 
                  use.parallel = F), .parallel = T)
}

for (i in seq_along(groups2)) {
    gNegWBt1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
    for (j in seq_along(thresholdWB)) {
        fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        gNegWBt1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
    }
    
    x <- all.equal(sapply(gNegWBt1[[i]][[1]], graph_attr, 'name'),
                   covars[groups2[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}

write_rds(gNegWBt1, paste0(savedir1, 'gNegWBt1.rds'))
write_rds(gGrNegWBt1, paste0(savedir1, 'gGrNegWBt1.rds'))


# # Open label: T0 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsNgWBtx0$A.norm.sub
# A.norm.mean <- matsNgWBtx0$A.norm.mean
# atlas <- "power"
# gGrNegWBtx0 <- gNegWBtx0 <- fnames <- vector('list', length=length(groups2))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBtx0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBtx0[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBtx0[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBtx0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gNegWBtx0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBtx0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBtx0[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBtx0, paste0(savedir1, 'gNegWBtx0.rds'))
# write_rds(gGrNegWBtx0, paste0(savedir1, 'gGrNegWBtx0.rds'))
# 
# 
# # Open label: T1 ------------------------------------------------------------------------------
# 
# A.norm.sub <- matsNgWBtx1$A.norm.sub
# A.norm.mean <- matsNgWBtx1$A.norm.mean
# atlas <- "power"
# gGrNegWBtx1 <- gNegWBtx1 <- fnames <- vector('list', length=length(groups2))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBtx1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBtx1[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBtx1[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBtx1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gNegWBtx1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBtx1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBtx1[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBtx1, paste0(savedir1, 'gNegWBtx1.rds'))
# write_rds(gGrNegWBtx1, paste0(savedir1, 'gGrNegWBtx1.rds'))
# 
# 
# # Longitudinal: T0 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsNgWBl0$A.norm.sub
# A.norm.mean <- matsNgWBl0$A.norm.mean
# atlas <- "power"
# gGrNegWBl0 <- gNegWBl0 <- fnames <- vector('list', length=length(groups2))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBl0[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBl0[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBl0[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBl0[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gNegWBl0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBl0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBl0[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBl0, paste0(savedir1, 'gNegWBl0.rds'))
# write_rds(gGrNegWBl0, paste0(savedir1, 'gGrNegWBl0.rds'))
# 
# 
# # Longitudinal: T1 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsNgWBl1$A.norm.sub
# A.norm.mean <- matsNgWBl1$A.norm.mean
# atlas <- "power"
# gGrNegWBl1 <- gNegWBl1 <- fnames <- vector('list', length=length(groups2))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBl1[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBl1[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBl1[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBl1[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gNegWBl1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBl1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBl1[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBl1, paste0(savedir1, 'gNegWBl1.rds'))
# write_rds(gGrNegWBl1, paste0(savedir1, 'gGrNegWBl1.rds'))
# 
# 
# # Longitudinal: T2 ----------------------------------------------------------------------------
# 
# A.norm.sub <- matsNgWBl2$A.norm.sub
# A.norm.mean <- matsNgWBl2$A.norm.mean
# atlas <- "power"
# gGrNegWBl2 <- gNegWBl2 <- fnames <- vector('list', length=length(groups2))
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
#             g.tmp <- setBgAttr1(g.tmp, atlas, modality = 'fmri',
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
#     gGrNegWBl2[[i]] <- lapply(seq_along(thresholdWB), function(x) 
#         graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
#                                     mode = 'undirected', diag = F, weighted = T))
#     
#     for (x in seq_along(thresholdWB)) {V(gGrNegWBl2[[i]][[x]])$name <- as.character(power$name)}
#     
#     gGrNegWBl2[[i]] <- llply(seq_along(thresholdWB), function(x) 
#         setBgAttr1(gGrNegWBl2[[i]][[x]], atlas, modality = 'fmri', 
#                                 weighting = 'sld', threshold = thresholdWB[x], 
#                                 group = groups2[i], A = A.norm.mean[[x]][[i]], 
#                                 use.parallel = F), .parallel = T)
#     
# }
# 
# for (i in seq_along(groups2)) {
#     gNegWBl2[[i]] <- fnames[[i]] <- vector('list', length = length(thresholdWB))
#     for (j in seq_along(thresholdWB)) {
#         fnames[[i]][[j]] <- list.files(savedir, 
#                                        sprintf('*g%i_thr%02i.*', i, j), full.names = T)
#         gNegWBl2[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#     
#     x <- all.equal(sapply(gNegWBl2[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
# 
# write_rds(gNegWBl2, paste0(savedir1, 'gNegWBl2.rds'))
# write_rds(gGrNegWBl2, paste0(savedir1, 'gGrNegWBl2.rds'))
