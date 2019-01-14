
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "fpn"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2FPNt0 <- analysis_random_graphs(g2FPNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2FPNt1 <- analysis_random_graphs(g2FPNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2FPNtx0 <- analysis_random_graphs(g2FPNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2FPNtx1 <- analysis_random_graphs(g2FPNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2FPNl0 <- analysis_random_graphs(g2FPNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2FPNl1 <- analysis_random_graphs(g2FPNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2FPNl2 <- analysis_random_graphs(g2FPNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2FPNt0, paste0(savedir1, 'rand2FPNt0.rds'))
write_rds(rand2FPNt1, paste0(savedir1, 'rand2FPNt1.rds'))
write_rds(rand2FPNtx0, paste0(savedir1, 'rand2FPNtx0.rds'))
write_rds(rand2FPNtx1, paste0(savedir1, 'rand2FPNtx1.rds'))
write_rds(rand2FPNl0, paste0(savedir1, 'rand2FPNl0.rds'))
write_rds(rand2FPNl1, paste0(savedir1, 'rand2FPNl1.rds'))
write_rds(rand2FPNl2, paste0(savedir1, 'rand2FPNl2.rds'))
