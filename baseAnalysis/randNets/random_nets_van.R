
# Variables -----------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F

net <- "VAN"

# outdir1 <- paste0(savedir, "/rand", today, "VS", net)
outdir2 <- paste0(savedir, "/rand", today, "T0", net)
outdir3 <- paste0(savedir, "/rand", today, "T1", net)
# outdir4 <- paste0(savedir, "/rand", today, "Pre", net)
# outdir5 <- paste0(savedir, "/rand", today, "Post", net)
# outdir6 <- paste0(savedir, "/rand", today, "L0", net)
# outdir7 <- paste0(savedir, "/rand", today, "L1", net)
# outdir8 <- paste0(savedir, "/rand", today, "L2", net)


# Creating random nets ------------------------------------------------------------------------

# randVANvs <- analysis_random_graphs(
#     gVANvs, kNumRand, savedir = outdir1,
#     clustering = clustering
# )
# 
randVANt0 <- analysis_random_graphs(
    gVANt0, kNumRand, savedir = outdir2,
    clustering = clustering
)

randVANt1 <- analysis_random_graphs(
    gVANt1, kNumRand, savedir = outdir3,
    clustering = clustering
)

# randVANtx0 <- analysis_random_graphs(
#     gVANtx0, kNumRand, savedir = outdir4,
#     clustering = clustering
# )
# 
# randVANtx1 <- analysis_random_graphs(
#     gVANtx1, kNumRand, savedir = outdir5,
#     clustering = clustering
# )
# 
# randVANl0 <- analysis_random_graphs(
#     gVANl0, kNumRand, savedir = outdir6,
#     clustering = clustering
# )
# 
# randVANl1 <- analysis_random_graphs(
#     gVANl1, kNumRand, savedir = outdir7,
#     clustering = clustering
# )
# 
# randVANl2 <- analysis_random_graphs(
#     gVANl2, kNumRand, savedir = outdir8,
#     clustering = clustering
# )

# Saving RDS of random nets -------------------------------------------------------------------

# write_rds(randVANvs, paste0(savedir1, 'randVANvs.rds'))
# write_rds(randVANt0, paste0(savedir1, 'randVANt0.rds'))
write_rds(randVANt1, paste0(savedir1, 'randVANt1.rds'))
write_rds(randVANtx0, paste0(savedir1, 'randVANtx0.rds'))
# write_rds(randVANtx1, paste0(savedir1, 'randVANtx1.rds'))
# write_rds(randVANl0, paste0(savedir1, 'randVANl0.rds'))
# write_rds(randVANl1, paste0(savedir1, 'randVANl1.rds'))
# write_rds(randVANl2, paste0(savedir1, 'randVANl2.rds'))
