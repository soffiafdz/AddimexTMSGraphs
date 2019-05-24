
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "SUB"

# outdir1 <- paste0(savedir, "/rand", today, "VS", net)
outdir2 <- paste0(savedir, "/rand", today, "T0", net)
outdir3 <- paste0(savedir, "/rand", today, "T1", net)
# outdir4 <- paste0(savedir, "/rand", today, "Pre", net)
# outdir5 <- paste0(savedir, "/rand", today, "Post", net)
# outdir6 <- paste0(savedir, "/rand", today, "L0", net)
# outdir7 <- paste0(savedir, "/rand", today, "L1", net)
# outdir8 <- paste0(savedir, "/rand", today, "L2", net)


# Creating random nets ------------------------------------------------------------------------

# randSUBvs <- analysis_random_graphs(
#     gSUBvs, kNumRand, savedir = outdir1,
#     clustering = clustering
# )

randSUBt0 <- analysis_random_graphs(
    gSUBt0, kNumRand, savedir = outdir2,
    clustering = clustering
)

randSUBt1 <- analysis_random_graphs(
    gSUBt1, kNumRand, savedir = outdir3,
    clustering = clustering
)

# randSUBtx0 <- analysis_random_graphs(
#     gSUBtx0, kNumRand, savedir = outdir4,
#     clustering = clustering
# )
# 
# randSUBtx1 <- analysis_random_graphs(
#     gSUBtx1, kNumRand, savedir = outdir5,
#     clustering = clustering
# )
# 
# randSUBl0 <- analysis_random_graphs(
#     gSUBl0, kNumRand, savedir = outdir6,
#     clustering = clustering
# )
# 
# randSUBl1 <- analysis_random_graphs(
#     gSUBl1, kNumRand, savedir = outdir7,
#     clustering = clustering
# )
# 
# randSUBl2 <- analysis_random_graphs(
#     gSUBl2, kNumRand, savedir = outdir8,
#     clustering = clustering
# )

# Saving RDS of random nets -------------------------------------------------------------------

# write_rds(randSUBvs, paste0(savedir1, 'randSUBvs.rds'))
write_rds(randSUBt0, paste0(savedir1, 'randSUBt0.rds'))
write_rds(randSUBt1, paste0(savedir1, 'randSUBt1.rds'))
# write_rds(randSUBtx0, paste0(savedir1, 'randSUBtx0.rds'))
# write_rds(randSUBtx1, paste0(savedir1, 'randSUBtx1.rds'))
# write_rds(randSUBl0, paste0(savedir1, 'randSUBl0.rds'))
# write_rds(randSUBl1, paste0(savedir1, 'randSUBl1.rds'))
# write_rds(randSUBl2, paste0(savedir1, 'randSUBl2.rds'))
