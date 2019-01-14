
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "van"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1VANt0 <- analysis_random_graphs(g1VANt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1VANt1 <- analysis_random_graphs(g1VANt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1VANtx0 <- analysis_random_graphs(g1VANtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1VANtx1 <- analysis_random_graphs(g1VANtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1VANl0 <- analysis_random_graphs(g1VANl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1VANl1 <- analysis_random_graphs(g1VANl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1VANl2 <- analysis_random_graphs(g1VANl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1VANt0, paste0(savedir1, 'rand1VANt0.rds'))
write_rds(rand1VANt1, paste0(savedir1, 'rand1VANt1.rds'))
write_rds(rand1VANtx0, paste0(savedir1, 'rand1VANtx0.rds'))
write_rds(rand1VANtx1, paste0(savedir1, 'rand1VANtx1.rds'))
write_rds(rand1VANl0, paste0(savedir1, 'rand1VANl0.rds'))
write_rds(rand1VANl1, paste0(savedir1, 'rand1VANl1.rds'))
write_rds(rand1VANl2, paste0(savedir1, 'rand1VANl2.rds'))
