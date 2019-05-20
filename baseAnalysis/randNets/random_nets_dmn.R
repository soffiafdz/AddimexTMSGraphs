
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "dmn"

outdir1 <- paste0(savedir, "/rand", today, "_vs_", net)
outdir2 <- paste0(savedir, "/rand", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

randDMNvs <- analysis_random_graphs(gDMNvs, kNumRand, savedir = outdir1,
                                      clustering = clustering)

randDMNt0 <- analysis_random_graphs(gDMNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

randDMNt1 <- analysis_random_graphs(gDMNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

randDMNtx0 <- analysis_random_graphs(gDMNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

randDMNtx1 <- analysis_random_graphs(gDMNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

randDMNl0 <- analysis_random_graphs(gDMNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

randDMNl1 <- analysis_random_graphs(gDMNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

randDMNl2 <- analysis_random_graphs(gDMNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(randDMNvs, paste0(savedir1, 'randDMNvs.rds'))
write_rds(randDMNt0, paste0(savedir1, 'randDMNt0.rds'))
write_rds(randDMNt1, paste0(savedir1, 'randDMNt1.rds'))
write_rds(randDMNtx0, paste0(savedir1, 'randDMNtx0.rds'))
write_rds(randDMNtx1, paste0(savedir1, 'randDMNtx1.rds'))
write_rds(randDMNl0, paste0(savedir1, 'randDMNl0.rds'))
write_rds(randDMNl1, paste0(savedir1, 'randDMNl1.rds'))
write_rds(randDMNl2, paste0(savedir1, 'randDMNl2.rds'))
