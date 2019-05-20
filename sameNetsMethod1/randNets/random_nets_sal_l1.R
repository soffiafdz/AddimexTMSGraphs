
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "sal"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1SALt0 <- analysis_random_graphs(g1SALt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1SALt1 <- analysis_random_graphs(g1SALt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1SALtx0 <- analysis_random_graphs(g1SALtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1SALtx1 <- analysis_random_graphs(g1SALtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1SALl0 <- analysis_random_graphs(g1SALl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1SALl1 <- analysis_random_graphs(g1SALl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1SALl2 <- analysis_random_graphs(g1SALl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1SALt0, paste0(savedir1, 'rand1SALt0.rds'))
write_rds(rand1SALt1, paste0(savedir1, 'rand1SALt1.rds'))
write_rds(rand1SALtx0, paste0(savedir1, 'rand1SALtx0.rds'))
write_rds(rand1SALtx1, paste0(savedir1, 'rand1SALtx1.rds'))
write_rds(rand1SALl0, paste0(savedir1, 'rand1SALl0.rds'))
write_rds(rand1SALl1, paste0(savedir1, 'rand1SALl1.rds'))
write_rds(rand1SALl2, paste0(savedir1, 'rand1SALl2.rds'))
