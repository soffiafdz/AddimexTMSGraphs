
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "WBn"

# outdir1 <- paste0(savedir, "/rand", today, "VS", net)
outdir2 <- paste0(savedir, "/rand", today, "T0", net)
outdir3 <- paste0(savedir, "/rand", today, "T1", net)
# outdir4 <- paste0(savedir, "/rand", today, "Pre", net)
# outdir5 <- paste0(savedir, "/rand", today, "Post", net)
# outdir6 <- paste0(savedir, "/rand", today, "L0", net)
# outdir7 <- paste0(savedir, "/rand", today, "L1", net)
# outdir8 <- paste0(savedir, "/rand", today, "L2", net)


# Creating random nets ------------------------------------------------------------------------

# randNegWBvs <- analysis_random_graphs(
#     gNegWBvs, kNumRand, savedir = outdir1,
#     clustering = clustering
# )

randNegWBt0 <- analysis_random_graphs(
    gNegWBt0, kNumRand, savedir = outdir2,
    clustering = clustering
)

randNegWBt1 <- analysis_random_graphs(
    gNegWBt1, kNumRand, savedir = outdir3,
    clustering = clustering
)
# 
# randNegWBtx0 <- analysis_random_graphs(
#     gNegWBtx0, kNumRand, savedir = outdir4,
#     clustering = clustering
# )
# 
# randNegWBtx1 <- analysis_random_graphs(
#     gNegWBtx1, kNumRand, savedir = outdir5,
#     clustering = clustering
# )
# 
# randNegWBl0 <- analysis_random_graphs(
#     gNegWBl0, kNumRand, savedir = outdir6,
#     clustering = clustering
# )
# 
# randNegWBl1 <- analysis_random_graphs(
#     gNegWBl1, kNumRand, savedir = outdir7,
#     clustering = clustering
# )
# 
# randNegWBl2 <- analysis_random_graphs(
#     gNegWBl2, kNumRand, savedir = outdir8,
#     clustering = clustering
# )

# Saving RDS of random nets -------------------------------------------------------------------

# write_rds(randNegWBvs, paste0(savedir1, 'randNegWBvs.rds'))
write_rds(randNegWBt0, paste0(savedir1, 'randNegWBt0.rds'))
write_rds(randNegWBt1, paste0(savedir1, 'randNegWBt1.rds'))
# write_rds(randNegWBtx0, paste0(savedir1, 'randNegWBtx0.rds'))
# write_rds(randNegWBtx1, paste0(savedir1, 'randNegWBtx1.rds'))
# write_rds(randNegWBl0, paste0(savedir1, 'randNegWBl0.rds'))
# write_rds(randNegWBl1, paste0(savedir1, 'randNegWBl1.rds'))
# write_rds(randNegWBl2, paste0(savedir1, 'randNegWBl2.rds'))
