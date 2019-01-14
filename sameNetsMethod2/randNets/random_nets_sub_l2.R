
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "sub"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2SUBt0 <- analysis_random_graphs(g2SUBt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

rand2SUBt1 <- analysis_random_graphs(g2SUBt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

rand2SUBtx0 <- analysis_random_graphs(g2SUBtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

rand2SUBtx1 <- analysis_random_graphs(g2SUBtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

rand2SUBl0 <- analysis_random_graphs(g2SUBl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

rand2SUBl1 <- analysis_random_graphs(g2SUBl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

rand2SUBl2 <- analysis_random_graphs(g2SUBl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2SUBt0, paste0(savedir1, 'rand2SUBt0.rds'))
write_rds(rand2SUBt1, paste0(savedir1, 'rand2SUBt1.rds'))
write_rds(rand2SUBtx0, paste0(savedir1, 'rand2SUBtx0.rds'))
write_rds(rand2SUBtx1, paste0(savedir1, 'rand2SUBtx1.rds'))
write_rds(rand2SUBl0, paste0(savedir1, 'rand2SUBl0.rds'))
write_rds(rand2SUBl1, paste0(savedir1, 'rand2SUBl1.rds'))
write_rds(rand2SUBl2, paste0(savedir1, 'rand2SUBl2.rds'))
