
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "con"

outdir1 <- paste0(savedir, "/rand", today, "_vs_", net)
outdir2 <- paste0(savedir, "/rand", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

randCONvs <- analysis_random_graphs(gCONvs, kNumRand, savedir = outdir1,
                                      clustering = clustering)

randCONt0 <- analysis_random_graphs(gCONt0, kNumRand, savedir = outdir2,
                                     clustering = clustering)

randCONt1 <- analysis_random_graphs(gCONt1, kNumRand, savedir = outdir3,
                                     clustering = clustering)

randCONtx0 <- analysis_random_graphs(gCONtx0, kNumRand, savedir = outdir4,
                                      clustering = clustering)

randCONtx1 <- analysis_random_graphs(gCONtx1, kNumRand, savedir = outdir5,
                                      clustering = clustering)

randCONl0 <- analysis_random_graphs(gCONl0, kNumRand, savedir = outdir6,
                                     clustering = clustering)

randCONl1 <- analysis_random_graphs(gCONl1, kNumRand, savedir = outdir7,
                                     clustering = clustering)

randCONl2 <- analysis_random_graphs(gCONl2, kNumRand, savedir = outdir8,
                                     clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(randCONvs, paste0(savedir1, 'randCONvs.rds'))
write_rds(randCONt0, paste0(savedir1, 'randCONt0.rds'))
write_rds(randCONt1, paste0(savedir1, 'randCONt1.rds'))
write_rds(randCONtx0, paste0(savedir1, 'randCONtx0.rds'))
write_rds(randCONtx1, paste0(savedir1, 'randCONtx1.rds'))
write_rds(randCONl0, paste0(savedir1, 'randCONl0.rds'))
write_rds(randCONl1, paste0(savedir1, 'randCONl1.rds'))
write_rds(randCONl2, paste0(savedir1, 'randCONl2.rds'))
