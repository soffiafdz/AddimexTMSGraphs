
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "wb"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1WBt0 <- analysis_random_graphs(g1WBt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1WBt1 <- analysis_random_graphs(g1WBt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1WBtx0 <- analysis_random_graphs(g1WBtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1WBtx1 <- analysis_random_graphs(g1WBtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1WBl0 <- analysis_random_graphs(g1WBl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1WBl1 <- analysis_random_graphs(g1WBl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1WBl2 <- analysis_random_graphs(g1WBl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1WBt0, paste0(savedir1, 'rand1WBt0.rds'))
write_rds(rand1WBt1, paste0(savedir1, 'rand1WBt1.rds'))
write_rds(rand1WBtx0, paste0(savedir1, 'rand1WBtx0.rds'))
write_rds(rand1WBtx1, paste0(savedir1, 'rand1WBtx1.rds'))
write_rds(rand1WBl0, paste0(savedir1, 'rand1WBl0.rds'))
write_rds(rand1WBl1, paste0(savedir1, 'rand1WBl1.rds'))
write_rds(rand1WBl2, paste0(savedir1, 'rand1WBl2.rds'))
