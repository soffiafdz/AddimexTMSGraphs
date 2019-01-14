
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "fpn"

outdir1 <- paste0(savedir, "/rand", today, "_vs_", net)
outdir2 <- paste0(savedir, "/rand", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

randFPNvs <- analysis_random_graphs(gFPNvs, kNumRand, savedir = outdir1,
                                      clustering = clustering)

randFPNt0 <- analysis_random_graphs(gFPNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

randFPNt1 <- analysis_random_graphs(gFPNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

randFPNtx0 <- analysis_random_graphs(gFPNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

randFPNtx1 <- analysis_random_graphs(gFPNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

randFPNl0 <- analysis_random_graphs(gFPNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

randFPNl1 <- analysis_random_graphs(gFPNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

randFPNl2 <- analysis_random_graphs(gFPNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(randFPNvs, paste0(savedir1, 'randFPNvs.rds'))
write_rds(randFPNt0, paste0(savedir1, 'randFPNt0.rds'))
write_rds(randFPNt1, paste0(savedir1, 'randFPNt1.rds'))
write_rds(randFPNtx0, paste0(savedir1, 'randFPNtx0.rds'))
write_rds(randFPNtx1, paste0(savedir1, 'randFPNtx1.rds'))
write_rds(randFPNl0, paste0(savedir1, 'randFPNl0.rds'))
write_rds(randFPNl1, paste0(savedir1, 'randFPNl1.rds'))
write_rds(randFPNl2, paste0(savedir1, 'randFPNl2.rds'))
