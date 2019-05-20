
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "fpn"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1FPNt0 <- analysis_random_graphs(g1FPNt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1FPNt1 <- analysis_random_graphs(g1FPNt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1FPNtx0 <- analysis_random_graphs(g1FPNtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1FPNtx1 <- analysis_random_graphs(g1FPNtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1FPNl0 <- analysis_random_graphs(g1FPNl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1FPNl1 <- analysis_random_graphs(g1FPNl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1FPNl2 <- analysis_random_graphs(g1FPNl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1FPNt0, paste0(savedir1, 'rand1FPNt0.rds'))
write_rds(rand1FPNt1, paste0(savedir1, 'rand1FPNt1.rds'))
write_rds(rand1FPNtx0, paste0(savedir1, 'rand1FPNtx0.rds'))
write_rds(rand1FPNtx1, paste0(savedir1, 'rand1FPNtx1.rds'))
write_rds(rand1FPNl0, paste0(savedir1, 'rand1FPNl0.rds'))
write_rds(rand1FPNl1, paste0(savedir1, 'rand1FPNl1.rds'))
write_rds(rand1FPNl2, paste0(savedir1, 'rand1FPNl2.rds'))
