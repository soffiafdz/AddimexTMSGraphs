
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "dmn"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1DMNt0 <- analysis_random_graphs(g1DMNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1DMNt1 <- analysis_random_graphs(g1DMNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1DMNtx0 <- analysis_random_graphs(g1DMNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1DMNtx1 <- analysis_random_graphs(g1DMNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1DMNl0 <- analysis_random_graphs(g1DMNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1DMNl1 <- analysis_random_graphs(g1DMNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1DMNl2 <- analysis_random_graphs(g1DMNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1DMNt0, paste0(savedir1, 'rand1DMNt0.rds'))
write_rds(rand1DMNt1, paste0(savedir1, 'rand1DMNt1.rds'))
write_rds(rand1DMNtx0, paste0(savedir1, 'rand1DMNtx0.rds'))
write_rds(rand1DMNtx1, paste0(savedir1, 'rand1DMNtx1.rds'))
write_rds(rand1DMNl0, paste0(savedir1, 'rand1DMNl0.rds'))
write_rds(rand1DMNl1, paste0(savedir1, 'rand1DMNl1.rds'))
write_rds(rand1DMNl2, paste0(savedir1, 'rand1DMNl2.rds'))
