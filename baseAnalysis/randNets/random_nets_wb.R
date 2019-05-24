
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "WB"

# outdir1 <- paste0(savedir, "/rand", today, "VS", net)
outdir2 <- paste0(savedir, "/rand", today, "T0", net)
outdir3 <- paste0(savedir, "/rand", today, "T1", net)
# outdir4 <- paste0(savedir, "/rand", today, "Pre", net)
# outdir5 <- paste0(savedir, "/rand", today, "Post", net)
# outdir6 <- paste0(savedir, "/rand", today, "L0", net)
# outdir7 <- paste0(savedir, "/rand", today, "L1", net)
# outdir8 <- paste0(savedir, "/rand", today, "L2", net)


# Creating random nets ------------------------------------------------------------------------

# randWBvs <- analysis_random_graphs(
#     gWBvs, kNumRand, savedir = outdir1,
#     clustering = clustering
# )

randWBt0 <- analysis_random_graphs(
    gWBt0, kNumRand, savedir = outdir2,
    clustering = clustering
)

randWBt1 <- analysis_random_graphs(
    gWBt1, kNumRand, savedir = outdir3,
    clustering = clustering
)
# 
# randWBtx0 <- analysis_random_graphs(
#     gWBtx0, kNumRand, savedir = outdir4,
#     clustering = clustering
# )
# 
# randWBtx1 <- analysis_random_graphs(
#     gWBtx1, kNumRand, savedir = outdir5,
#     clustering = clustering
# )
# 
# randWBl0 <- analysis_random_graphs(
#     gWBl0, kNumRand, savedir = outdir6,
#     clustering = clustering
# )
# 
# randWBl1 <- analysis_random_graphs(
#     gWBl1, kNumRand, savedir = outdir7,
#     clustering = clustering
# )
# 
# randWBl2 <- analysis_random_graphs(
#     gWBl2, kNumRand, savedir = outdir8,
#     clustering = clustering
# )

# Saving RDS of random nets -------------------------------------------------------------------

# write_rds(randWBvs, paste0(savedir1, 'randWBvs.rds'))
write_rds(randWBt0, paste0(savedir1, 'randWBt0.rds'))
write_rds(randWBt1, paste0(savedir1, 'randWBt1.rds'))
# write_rds(randWBtx0, paste0(savedir1, 'randWBtx0.rds'))
# write_rds(randWBtx1, paste0(savedir1, 'randWBtx1.rds'))
# write_rds(randWBl0, paste0(savedir1, 'randWBl0.rds'))
# write_rds(randWBl1, paste0(savedir1, 'randWBl1.rds'))
# write_rds(randWBl2, paste0(savedir1, 'randWBl2.rds'))
