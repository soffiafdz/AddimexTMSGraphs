
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "dan"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1DANt0 <- analysis_random_graphs(g1DANt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1DANt1 <- analysis_random_graphs(g1DANt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1DANtx0 <- analysis_random_graphs(g1DANtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1DANtx1 <- analysis_random_graphs(g1DANtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1DANl0 <- analysis_random_graphs(g1DANl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1DANl1 <- analysis_random_graphs(g1DANl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1DANl2 <- analysis_random_graphs(g1DANl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1DANt0, paste0(savedir1, 'rand1DANt0.rds'))
write_rds(rand1DANt1, paste0(savedir1, 'rand1DANt1.rds'))
write_rds(rand1DANtx0, paste0(savedir1, 'rand1DANtx0.rds'))
write_rds(rand1DANtx1, paste0(savedir1, 'rand1DANtx1.rds'))
write_rds(rand1DANl0, paste0(savedir1, 'rand1DANl0.rds'))
write_rds(rand1DANl1, paste0(savedir1, 'rand1DANl1.rds'))
write_rds(rand1DANl2, paste0(savedir1, 'rand1DANl2.rds'))
