
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "wb"

outdir1 <- paste0(savedir, "/rand", today, "_vs_", net)
outdir2 <- paste0(savedir, "/rand", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

randWBvs <- analysis_random_graphs(gWBvs, kNumRand, savedir = outdir1,
                                      clustering = clustering)

randWBt0 <- analysis_random_graphs(gWBt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

randWBt1 <- analysis_random_graphs(gWBt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

randWBtx0 <- analysis_random_graphs(gWBtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

randWBtx1 <- analysis_random_graphs(gWBtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

randWBl0 <- analysis_random_graphs(gWBl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

randWBl1 <- analysis_random_graphs(gWBl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

randWBl2 <- analysis_random_graphs(gWBl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(randWBvs, paste0(savedir1, 'randWBvs.rds'))
write_rds(randWBt0, paste0(savedir1, 'randWBt0.rds'))
write_rds(randWBt1, paste0(savedir1, 'randWBt1.rds'))
write_rds(randWBtx0, paste0(savedir1, 'randWBtx0.rds'))
write_rds(randWBtx1, paste0(savedir1, 'randWBtx1.rds'))
write_rds(randWBl0, paste0(savedir1, 'randWBl0.rds'))
write_rds(randWBl1, paste0(savedir1, 'randWBl1.rds'))
write_rds(randWBl2, paste0(savedir1, 'randWBl2.rds'))
