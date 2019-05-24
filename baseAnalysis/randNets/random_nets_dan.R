
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "DAN"

# outdir1 <- paste0(savedir, "/rand", today, "VS", net)
outdir2 <- paste0(savedir, "/rand", today, "T0", net)
outdir3 <- paste0(savedir, "/rand", today, "T1", net)
# outdir4 <- paste0(savedir, "/rand", today, "Pre", net)
# outdir5 <- paste0(savedir, "/rand", today, "Post", net)
# outdir6 <- paste0(savedir, "/rand", today, "L0", net)
# outdir7 <- paste0(savedir, "/rand", today, "L1", net)
# outdir8 <- paste0(savedir, "/rand", today, "L2", net)


# Creating random nets ------------------------------------------------------------------------

# randDANvs <- analysis_random_graphs(
#     gDANvs, kNumRand, savedir = outdir1,
#     clustering = clustering
# )

randDANt0 <- analysis_random_graphs(
    gDANt0, kNumRand, savedir = outdir2,
    clustering = clustering
)

randDANt1 <- analysis_random_graphs(
    gDANt1, kNumRand, savedir = outdir3,
    clustering = clustering
)

# randDANtx0 <- analysis_random_graphs(
#     gDANtx0, kNumRand, savedir = outdir4,
#     clustering = clustering
# )
# 
# randDANtx1 <- analysis_random_graphs(
#     gDANtx1, kNumRand, savedir = outdir5,
#     clustering = clustering
# )
# 
# randDANl0 <- analysis_random_graphs(
#     gDANl0, kNumRand, savedir = outdir6,
#     clustering = clustering
# )
# 
# randDANl1 <- analysis_random_graphs(
#     gDANl1, kNumRand, savedir = outdir7,
#     clustering = clustering
# )
# 
# randDANl2 <- analysis_random_graphs(
#     gDANl2, kNumRand, savedir = outdir8,
#     clustering = clustering
# )

# Saving RDS of random nets -------------------------------------------------------------------

# write_rds(randDANvs, paste0(savedir1, 'randDANvs.rds'))
write_rds(randDANt0, paste0(savedir1, 'randDANt0.rds'))
write_rds(randDANt1, paste0(savedir1, 'randDANt1.rds'))
# write_rds(randDANtx0, paste0(savedir1, 'randDANtx0.rds'))
# write_rds(randDANtx1, paste0(savedir1, 'randDANtx1.rds'))
# write_rds(randDANl0, paste0(savedir1, 'randDANl0.rds'))
# write_rds(randDANl1, paste0(savedir1, 'randDANl1.rds'))
# write_rds(randDANl2, paste0(savedir1, 'randDANl2.rds'))
