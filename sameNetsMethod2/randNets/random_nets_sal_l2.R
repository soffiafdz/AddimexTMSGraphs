
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "sal"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2SALt0 <- analysis_random_graphs(g2SALt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2SALt1 <- analysis_random_graphs(g2SALt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2SALtx0 <- analysis_random_graphs(g2SALtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2SALtx1 <- analysis_random_graphs(g2SALtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2SALl0 <- analysis_random_graphs(g2SALl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2SALl1 <- analysis_random_graphs(g2SALl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2SALl2 <- analysis_random_graphs(g2SALl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2SALt0, paste0(savedir1, 'rand2SALt0.rds'))
write_rds(rand2SALt1, paste0(savedir1, 'rand2SALt1.rds'))
write_rds(rand2SALtx0, paste0(savedir1, 'rand2SALtx0.rds'))
write_rds(rand2SALtx1, paste0(savedir1, 'rand2SALtx1.rds'))
write_rds(rand2SALl0, paste0(savedir1, 'rand2SALl0.rds'))
write_rds(rand2SALl1, paste0(savedir1, 'rand2SALl1.rds'))
write_rds(rand2SALl2, paste0(savedir1, 'rand2SALl2.rds'))
