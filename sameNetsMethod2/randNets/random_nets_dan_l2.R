
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "dan"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2DANt0 <- analysis_random_graphs(g2DANt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2DANt1 <- analysis_random_graphs(g2DANt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2DANtx0 <- analysis_random_graphs(g2DANtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2DANtx1 <- analysis_random_graphs(g2DANtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2DANl0 <- analysis_random_graphs(g2DANl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2DANl1 <- analysis_random_graphs(g2DANl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2DANl2 <- analysis_random_graphs(g2DANl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2DANt0, paste0(savedir1, 'rand2DANt0.rds'))
write_rds(rand2DANt1, paste0(savedir1, 'rand2DANt1.rds'))
write_rds(rand2DANtx0, paste0(savedir1, 'rand2DANtx0.rds'))
write_rds(rand2DANtx1, paste0(savedir1, 'rand2DANtx1.rds'))
write_rds(rand2DANl0, paste0(savedir1, 'rand2DANl0.rds'))
write_rds(rand2DANl1, paste0(savedir1, 'rand2DANl1.rds'))
write_rds(rand2DANl2, paste0(savedir1, 'rand2DANl2.rds'))
