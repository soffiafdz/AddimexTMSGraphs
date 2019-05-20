
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "dmn"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2DMNt0 <- analysis_random_graphs(g2DMNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2DMNt1 <- analysis_random_graphs(g2DMNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2DMNtx0 <- analysis_random_graphs(g2DMNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2DMNtx1 <- analysis_random_graphs(g2DMNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2DMNl0 <- analysis_random_graphs(g2DMNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2DMNl1 <- analysis_random_graphs(g2DMNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2DMNl2 <- analysis_random_graphs(g2DMNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2DMNt0, paste0(savedir1, 'rand2DMNt0.rds'))
write_rds(rand2DMNt1, paste0(savedir1, 'rand2DMNt1.rds'))
write_rds(rand2DMNtx0, paste0(savedir1, 'rand2DMNtx0.rds'))
write_rds(rand2DMNtx1, paste0(savedir1, 'rand2DMNtx1.rds'))
write_rds(rand2DMNl0, paste0(savedir1, 'rand2DMNl0.rds'))
write_rds(rand2DMNl1, paste0(savedir1, 'rand2DMNl1.rds'))
write_rds(rand2DMNl2, paste0(savedir1, 'rand2DMNl2.rds'))
