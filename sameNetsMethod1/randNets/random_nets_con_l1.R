
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "con"

outdir2 <- paste0(savedir, "/rand1", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand1", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand1", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand1", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand1", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand1", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand1", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

rand1CONt0 <- analysis_random_graphs(g1CONt0, kNumRand, savedir = outdir2,
                                     clustering = clustering)

rand1CONt1 <- analysis_random_graphs(g1CONt1, kNumRand, savedir = outdir3,
                                     clustering = clustering)

rand1CONtx0 <- analysis_random_graphs(g1CONtx0, kNumRand, savedir = outdir4,
                                      clustering = clustering)

rand1CONtx1 <- analysis_random_graphs(g1CONtx1, kNumRand, savedir = outdir5,
                                      clustering = clustering)

rand1CONl0 <- analysis_random_graphs(g1CONl0, kNumRand, savedir = outdir6,
                                     clustering = clustering)

rand1CONl1 <- analysis_random_graphs(g1CONl1, kNumRand, savedir = outdir7,
                                     clustering = clustering)

rand1CONl2 <- analysis_random_graphs(g1CONl2, kNumRand, savedir = outdir8,
                                     clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(rand1CONt0, paste0(savedir1, 'rand1CONt0.rds'))
write_rds(rand1CONt1, paste0(savedir1, 'rand1CONt1.rds'))
write_rds(rand1CONtx0, paste0(savedir1, 'rand1CONtx0.rds'))
write_rds(rand1CONtx1, paste0(savedir1, 'rand1CONtx1.rds'))
write_rds(rand1CONl0, paste0(savedir1, 'rand1CONl0.rds'))
write_rds(rand1CONl1, paste0(savedir1, 'rand1CONl1.rds'))
write_rds(rand1CONl2, paste0(savedir1, 'rand1CONl2.rds'))
