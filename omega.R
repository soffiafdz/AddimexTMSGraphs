source('setUp.R')
source('createGraphs.R')

# Dependence vs Controls --------------------------------------------------

kNumRand <- 3e2

outdir <- paste0(savedir, 'rand2P_', today)

randNets2P <- analysis_random_graphs(
    gP, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2P, paste0(savedir1, 'randNets2P.RDS'))

# randNets2P <- read_rds(paste0(savedir1, 'randNets2P.RDS'))

smallClustP <- randNets2P$small

# Closed label: T0 --------------------------------------------------------

outdir <- paste0(savedir, 'rand2T0_', today)

randNets2T0 <- analysis_random_graphs(
    gT0, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2T0, paste0(savedir1, 'randNets2T0.RDS'))

# randNets2T0 <- read_rds(paste0(savedir1, 'randNets2T0.RDS'))

smallClustT0 <- randNets2T0$small

# Closed label: T1 --------------------------------------------------------

outdir <- paste0(savedir, 'rand2T1_', today)

randNets2T1 <- analysis_random_graphs(
    gT1, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2T1, paste0(savedir1, 'randNets2T1.RDS'))

# randNets2T1 <- read_rds(paste0(savedir1, 'randNets2T1.RDS'))

smallClustT1 <- randNets2T1$small


# Longitudinal 1: Baseline ------------------------------------------------

outdir <- paste0(savedir, 'rand2L10_', today)

randNets2L10 <- analysis_random_graphs(
    gL10, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L10, paste0(savedir1, 'randNets2L10.RDS'))

# randNets2L10 <- read_rds(paste0(savedir1, 'randNets2L10.RDS'))

smallClustL10 <- randNets2L10$small


# Longitudinal 1: Two weeks -----------------------------------------------

outdir <- paste0(savedir, 'rand2L11_', today)

randNets2L11 <- analysis_random_graphs(
    gL11, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L11, paste0(savedir1, 'randNets2L11.RDS'))

# randNets2L11 <- read_rds(paste0(savedir1, 'randNets2L11.RDS'))

smallClustL11 <- randNets2L11$small


# Longitudinal 1: Three months --------------------------------------------

outdir <- paste0(savedir, 'rand2L12_', today)

randNets2L12 <- analysis_random_graphs(
    gL12, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L12, paste0(savedir1, 'randNets2L12.RDS'))

# randNets2L12 <- read_rds(paste0(savedir1, 'randNets2L12.RDS'))

smallClustL12 <- randNets2L12$small


# Longitudinal 2: Baseline ------------------------------------------------

outdir <- paste0(savedir, 'rand2L20_', today)

randNets2L20 <- analysis_random_graphs(
    gL20, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L20, paste0(savedir1, 'randNets2L20.RDS'))

# randNets2L20 <- read_rds(paste0(savedir1, 'randNets2L20.RDS'))

smallClustL20 <- randNets2L20$small


# Longitudinal 2: Two weeks -----------------------------------------------

outdir <- paste0(savedir, 'rand2L21_', today)

randNets2L21 <- analysis_random_graphs(
    gL21, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L21, paste0(savedir1, 'randNets2L21.RDS'))

# randNets2L21 <- read_rds(paste0(savedir1, 'randNets2L21.RDS'))

smallClustL21 <- randNets2L21$small


# Longitudinal 2: Three months --------------------------------------------

outdir <- paste0(savedir, 'rand2L22_', today)

randNets2L22 <- analysis_random_graphs(
    gL22, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L22, paste0(savedir1, 'randNets2L22.RDS'))

# randNets2L22 <- read_rds(paste0(savedir1, 'randNets2L22.RDS'))

smallClustL22 <- randNets2L22$small


# Longitudinal 2: Six months ----------------------------------------------

outdir <- paste0(savedir, 'rand2L23_', today)

randNets2L23 <- analysis_random_graphs(
    gL23, kNumRand, savedir = outdir, clustering = T
)

write_rds(randNets2L23, paste0(savedir1, 'randNets2L23.RDS'))

# randNets2L23 <- read_rds(paste0(savedir1, 'randNets2L23.RDS'))

smallClustL23 <- randNets2L23$small



