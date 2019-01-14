
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "sub"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1SUBt0 <- analysis_random_graphs(g1SUBt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand1SUBt1 <- analysis_random_graphs(g1SUBt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand1SUBtx0 <- analysis_random_graphs(g1SUBtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand1SUBtx1 <- analysis_random_graphs(g1SUBtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand1SUBl0 <- analysis_random_graphs(g1SUBl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand1SUBl1 <- analysis_random_graphs(g1SUBl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand1SUBl2 <- analysis_random_graphs(g1SUBl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1SUBt0, paste0(savedir1, 'rand1SUBt0.rds'))
write_rds(rand1SUBt1, paste0(savedir1, 'rand1SUBt1.rds'))
write_rds(rand1SUBtx0, paste0(savedir1, 'rand1SUBtx0.rds'))
write_rds(rand1SUBtx1, paste0(savedir1, 'rand1SUBtx1.rds'))
write_rds(rand1SUBl0, paste0(savedir1, 'rand1SUBl0.rds'))
write_rds(rand1SUBl1, paste0(savedir1, 'rand1SUBl1.rds'))
write_rds(rand1SUBl2, paste0(savedir1, 'rand1SUBl2.rds'))
