
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "wb"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2WBt0 <- analysis_random_graphs(g2WBt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2WBt1 <- analysis_random_graphs(g2WBt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2WBtx0 <- analysis_random_graphs(g2WBtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2WBtx1 <- analysis_random_graphs(g2WBtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2WBl0 <- analysis_random_graphs(g2WBl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2WBl1 <- analysis_random_graphs(g2WBl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2WBl2 <- analysis_random_graphs(g2WBl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2WBt0, paste0(savedir1, 'rand2WBt0.rds'))
write_rds(rand2WBt1, paste0(savedir1, 'rand2WBt1.rds'))
write_rds(rand2WBtx0, paste0(savedir1, 'rand2WBtx0.rds'))
write_rds(rand2WBtx1, paste0(savedir1, 'rand2WBtx1.rds'))
write_rds(rand2WBl0, paste0(savedir1, 'rand2WBl0.rds'))
write_rds(rand2WBl1, paste0(savedir1, 'rand2WBl1.rds'))
write_rds(rand2WBl2, paste0(savedir1, 'rand2WBl2.rds'))
