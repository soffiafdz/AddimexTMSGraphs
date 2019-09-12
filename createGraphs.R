
# Cocaine Dependent vs Healthy Controls -----------------------------------

# A.norm.sub <- matsP$A.norm.sub
# A.norm.mean <- matsP$A.norm.mean
# atlas <- "power264"
# gGrP <- gP <- fnames <- vector('list', length=length(groups1))
#
# for (i in seq_along(groups1)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(indsP[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , indsP[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covarsP[groups1[i],
#                 Study.ID[k]], group = groups1[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , indsP[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrP[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrP[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrP[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrP[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups1[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups1)) {
#     gP[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gP[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gP[[i]][[1]], graph_attr, 'name'),
#                    covarsP[groups1[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gP, paste0(savedir1, 'gP.RDS'))
# write_rds(gGrP, paste0(savedir1, 'gGrP.RDS'))
#
#
# # Closed label: T0 --------------------------------------------------------
#
# A.norm.sub <- matsT1$A.norm.sub
# A.norm.mean <- matsT1$A.norm.mean
# atlas <- "power264"
# gGrT0 <- gT0 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds1[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds1[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars1[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds1[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrT0[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrT0[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrT0[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrT0[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gT0[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gT0[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gT0[[i]][[1]], graph_attr, 'name'),
#                    covars1[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gT0, paste0(savedir1, 'gT0.RDS'))
# write_rds(gGrT0, paste0(savedir1, 'gGrT0.RDS'))
#
# # Closed label: T1 --------------------------------------------------------
#
# A.norm.sub <- matsT1$A.norm.sub
# A.norm.mean <- matsT1$A.norm.mean
# atlas <- "power264"
# gGrT1 <- gT1 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds1[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds1[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars1[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds1[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrT1[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrT1[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrT1[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrT1[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gT1[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gT1[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gT1[[i]][[1]], graph_attr, 'name'),
#                    covars1[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gT1, paste0(savedir1, 'gT1.RDS'))
# write_rds(gGrT1, paste0(savedir1, 'gGrT1.RDS'))
#
#
# # Longitudinal 1: Baseline ------------------------------------------------
#
# A.norm.sub <- matsL10$A.norm.sub
# A.norm.mean <- matsL10$A.norm.mean
# atlas <- "power264"
# gGrL10 <- gL10 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds2[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars2[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds2[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL10[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL10[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL10[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL10[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL10[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL10[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL10[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL10, paste0(savedir1, 'gL10.RDS'))
# write_rds(gGrL10, paste0(savedir1, 'gGrL10.RDS'))
#
# # Longitudinal 1: Two weeks -----------------------------------------------
#
# A.norm.sub <- matsL11$A.norm.sub
# A.norm.mean <- matsL11$A.norm.mean
# atlas <- "power264"
# gGrL11 <- gL11 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds2[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars2[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds2[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL11[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL11[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL11[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL11[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL11[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL11[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL11[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL11, paste0(savedir1, 'gL11.RDS'))
# write_rds(gGrL11, paste0(savedir1, 'gGrL11.RDS'))
#
#
# # Longitudinal 1: Three months --------------------------------------------
#
# A.norm.sub <- matsL12$A.norm.sub
# A.norm.mean <- matsL12$A.norm.mean
# atlas <- "power264"
# gGrL12 <- gL12 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds2[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds2[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars2[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds2[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL12[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL12[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL12[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL12[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL12[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL12[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL12[[i]][[1]], graph_attr, 'name'),
#                    covars2[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL12, paste0(savedir1, 'gL12.RDS'))
# write_rds(gGrL12, paste0(savedir1, 'gGrL12.RDS'))
#
#
# # Longitudinal 2: Baseline ------------------------------------------------
#
# A.norm.sub <- matsL20$A.norm.sub
# A.norm.mean <- matsL20$A.norm.mean
# atlas <- "power264"
# gGrL20 <- gL20 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds3[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars3[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds3[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL20[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL20[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL20[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL20[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL20[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL20[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL20[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL20, paste0(savedir1, 'gL20.RDS'))
# write_rds(gGrL20, paste0(savedir1, 'gGrL20.RDS'))
#
# # Longitudinal 2: Two weeks -----------------------------------------------
#
# A.norm.sub <- matsL21$A.norm.sub
# A.norm.mean <- matsL21$A.norm.mean
# atlas <- "power264"
# gGrL21 <- gL21 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds3[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars3[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds3[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL21[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL21[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL21[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL21[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL21[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL21[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL21[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL21, paste0(savedir1, 'gL21.RDS'))
# write_rds(gGrL21, paste0(savedir1, 'gGrL21.RDS'))
#
#
# # Longitudinal 2: Three months --------------------------------------------
#
# A.norm.sub <- matsL22$A.norm.sub
# A.norm.mean <- matsL22$A.norm.mean
# atlas <- "power264"
# gGrL22 <- gL22 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds3[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars3[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds3[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL22[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL22[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL22[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL22[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL22[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL22[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL22[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL22, paste0(savedir1, 'gL22.RDS'))
# write_rds(gGrL22, paste0(savedir1, 'gGrL22.RDS'))
#
#
# # Longitudinal 2: Six months ----------------------------------------------
#
# A.norm.sub <- matsL23$A.norm.sub
# A.norm.mean <- matsL23$A.norm.mean
# atlas <- "power264"
# gGrL23 <- gL23 <- fnames <- vector('list', length=length(groups2))
#
# for (i in seq_along(groups2)) {
#     for (j in seq_along(thresholds)) {
#         print(
#             paste0(
#                 'Threshold ', j, '/', length(thresholds),
#                 '; group ', i, '; ', format(Sys.time(), '%H:%M:%S')
#             )
#         )
#
#         foreach (k=seq_along(inds3[[i]])) %dopar% {
#             g.tmp <- graph_from_adjacency_matrix(
#                 A.norm.sub[[j]][, , inds3[[i]][k]],
#                 mode='undirected', diag = F, weighted = T
#             )
#             V(g.tmp)$name <- as.character(power264$name)
#             g.tmp <- setBgAttr(
#                 g.tmp, atlas, modality = 'fmri', weighting = 'sld',
#                 threshold = thresholds[j], subject = covars3[groups2[i],
#                 Study.ID[k]], group = groups2[i], use.parallel = F,
#                 A = A.norm.sub[[j]][, , inds3[[i]][k]]
#             )
#             write_rds(
#                 g.tmp, paste0(
#                     savedir1,
#                     sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.RDS')
#                 )
#             )
#         }
#     }
#
#     # group mean weighted graphs
#     print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
#     gGrL23[[i]] <- lapply(seq_along(thresholds), function(x)
#         graph_from_adjacency_matrix(
#             A.norm.mean[[x]][[i]], mode = 'undirected', diag = F, weighted = T)
#         )
#
#     for (x in seq_along(thresholds)) {
#         V(gGrL23[[i]][[x]])$name <- as.character(power264$name)
#     }
#
#     gGrL23[[i]] <- llply(seq_along(thresholds), function(x)
#         setBgAttr(
#             gGrL23[[i]][[x]], atlas, modality = 'fmri', weighting = 'sld',
#             threshold = thresholds[x], group = groups2[i],
#             A = A.norm.mean[[x]][[i]], use.parallel = F
#         ), .parallel = T
#     )
#
# }
#
# for (i in seq_along(groups2)) {
#     gL23[[i]] <- fnames[[i]] <- vector('list', length = length(thresholds))
#     for (j in seq_along(thresholds)) {
#         fnames[[i]][[j]] <- list.files(
#             savedir, sprintf('*g%i_thr%02i.*', i, j), full.names = T
#         )
#         gL23[[i]][[j]] <- lapply(fnames[[i]][[j]], readRDS)
#     }
#
#     x <- all.equal(sapply(gL23[[i]][[1]], graph_attr, 'name'),
#                    covars3[groups2[i], Study.ID])
#     if (isTRUE(x)) lapply(fnames[[i]], file.remove)
# }
#
# write_rds(gL23, paste0(savedir1, 'gL23.RDS'))
# write_rds(gGrL23, paste0(savedir1, 'gGrL23.RDS'))
#

# Read all graphs ---------------------------------------------------------

prefix <- '20190910_'

gP <- read_rds(paste0(savedir, prefix, 'gP', '.RDS'))
gT0 <- read_rds(paste0(savedir, prefix, 'gT0', '.RDS'))
gT1 <- read_rds(paste0(savedir, prefix, 'gT1', '.RDS'))
gL10 <- read_rds(paste0(savedir, prefix, 'gL10', '.RDS'))
gL11 <- read_rds(paste0(savedir, prefix, 'gL11', '.RDS'))
gL12 <- read_rds(paste0(savedir, prefix, 'gL12', '.RDS'))
gL20 <- read_rds(paste0(savedir, prefix, 'gL20', '.RDS'))
gL21 <- read_rds(paste0(savedir, prefix, 'gL21', '.RDS'))
gL22 <- read_rds(paste0(savedir, prefix, 'gL22', '.RDS'))
gL23 <- read_rds(paste0(savedir, prefix, 'gL23', '.RDS'))
