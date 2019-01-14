
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "con"

outdir2 <- paste0(savedir, "/rand2", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand2", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand2", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand2", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand2", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand2", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand2", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand2CONt0 <- analysis_random_graphs(g2CONt0, kNumRand, savedir = outdir2,
                                     clustering = clustering)

rand2CONt1 <- analysis_random_graphs(g2CONt1, kNumRand, savedir = outdir3,
                                     clustering = clustering)

rand2CONtx0 <- analysis_random_graphs(g2CONtx0, kNumRand, savedir = outdir4,
                                      clustering = clustering)

rand2CONtx1 <- analysis_random_graphs(g2CONtx1, kNumRand, savedir = outdir5,
                                      clustering = clustering)

rand2CONl0 <- analysis_random_graphs(g2CONl0, kNumRand, savedir = outdir6,
                                     clustering = clustering)

rand2CONl1 <- analysis_random_graphs(g2CONl1, kNumRand, savedir = outdir7,
                                     clustering = clustering)

rand2CONl2 <- analysis_random_graphs(g2CONl2, kNumRand, savedir = outdir8,
                                     clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand2CONt0, paste0(savedir1, 'rand2CONt0.rds'))
write_rds(rand2CONt1, paste0(savedir1, 'rand2CONt1.rds'))
write_rds(rand2CONtx0, paste0(savedir1, 'rand2CONtx0.rds'))
write_rds(rand2CONtx1, paste0(savedir1, 'rand2CONtx1.rds'))
write_rds(rand2CONl0, paste0(savedir1, 'rand2CONl0.rds'))
write_rds(rand2CONl1, paste0(savedir1, 'rand2CONl1.rds'))
write_rds(rand2CONl2, paste0(savedir1, 'rand2CONl2.rds'))
