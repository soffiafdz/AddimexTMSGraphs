
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "van"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2VANt0 <- analysis_random_graphs(g2VANt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2VANt1 <- analysis_random_graphs(g2VANt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2VANtx0 <- analysis_random_graphs(g2VANtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2VANtx1 <- analysis_random_graphs(g2VANtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2VANl0 <- analysis_random_graphs(g2VANl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2VANl1 <- analysis_random_graphs(g2VANl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2VANl2 <- analysis_random_graphs(g2VANl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2VANt0, paste0(savedir1, 'rand2VANt0.rds'))
write_rds(rand2VANt1, paste0(savedir1, 'rand2VANt1.rds'))
write_rds(rand2VANtx0, paste0(savedir1, 'rand2VANtx0.rds'))
write_rds(rand2VANtx1, paste0(savedir1, 'rand2VANtx1.rds'))
write_rds(rand2VANl0, paste0(savedir1, 'rand2VANl0.rds'))
write_rds(rand2VANl1, paste0(savedir1, 'rand2VANl1.rds'))
write_rds(rand2VANl2, paste0(savedir1, 'rand2VANl2.rds'))
