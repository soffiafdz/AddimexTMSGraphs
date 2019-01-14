
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "sal"

outdir1 <- paste0(savedir, "/rand", today, "_vs_", net)
outdir2 <- paste0(savedir, "/rand", today, "_t0_", net)
outdir3 <- paste0(savedir, "/rand", today, "_t1_", net)
outdir4 <- paste0(savedir, "/rand", today, "_tx0_", net)
outdir5 <- paste0(savedir, "/rand", today, "_tx1_", net)
outdir6 <- paste0(savedir, "/rand", today, "_l0_", net)
outdir7 <- paste0(savedir, "/rand", today, "_l1_", net)
outdir8 <- paste0(savedir, "/rand", today, "_l2_", net)


# Creating random nets ------------------------------------------------------------------------

randSALvs <- analysis_random_graphs(gSALvs, kNumRand, savedir = outdir1,
                                      clustering = clustering)

randSALt0 <- analysis_random_graphs(gSALt0, kNumRand, savedir = outdir2,
                                      clustering = clustering)

randSALt1 <- analysis_random_graphs(gSALt1, kNumRand, savedir = outdir3,
                                      clustering = clustering)

randSALtx0 <- analysis_random_graphs(gSALtx0, kNumRand, savedir = outdir4,
                                       clustering = clustering)

randSALtx1 <- analysis_random_graphs(gSALtx1, kNumRand, savedir = outdir5,
                                       clustering = clustering)

randSALl0 <- analysis_random_graphs(gSALl0, kNumRand, savedir = outdir6,
                                      clustering = clustering)

randSALl1 <- analysis_random_graphs(gSALl1, kNumRand, savedir = outdir7,
                                      clustering = clustering)

randSALl2 <- analysis_random_graphs(gSALl2, kNumRand, savedir = outdir8,
                                      clustering = clustering)

# Saving RDS of random nets -------------------------------------------------------------------

write_rds(randSALvs, paste0(savedir1, 'randSALvs.rds'))
write_rds(randSALt0, paste0(savedir1, 'randSALt0.rds'))
write_rds(randSALt1, paste0(savedir1, 'randSALt1.rds'))
write_rds(randSALtx0, paste0(savedir1, 'randSALtx0.rds'))
write_rds(randSALtx1, paste0(savedir1, 'randSALtx1.rds'))
write_rds(randSALl0, paste0(savedir1, 'randSALl0.rds'))
write_rds(randSALl1, paste0(savedir1, 'randSALl1.rds'))
write_rds(randSALl2, paste0(savedir1, 'randSALl2.rds'))
