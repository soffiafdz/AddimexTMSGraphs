source('setUp.R')
source('createGraphs.R')

# Dependence vs Controls --------------------------------------------------

kNumRand <- 3e2

outdir <- paste0(savedir, 'randP', today)

randNetsP <- analysis_random_graphs(
    gP, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsP, paste0(savedir1, 'randNetsP.RDS'))

# randNetsP <- read_rds(paste0(savedir1, 'randNetsP.RDS'))

richP <- na.omit(randNetsP$rich)
smallP <- randNetsP$small
rnetsP <- randNetsP$rand

# Closed label: T0 --------------------------------------------------------

outdir <- paste0(savedir, 'randT0', today)

randNetsT0 <- analysis_random_graphs(
    gT0, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsT0, paste0(savedir1, 'randNetsT0.RDS'))

# randNetsT0 <- read_rds(paste0(savedir1, 'randNetsT0.RDS'))

richT0 <- na.omit(randNetsT0$rich)
smallT0 <- randNetsT0$small
rnetsT0 <- randNetsT0$rand

# Closed label: T1 --------------------------------------------------------

outdir <- paste0(savedir, 'randT1', today)

randNetsT1 <- analysis_random_graphs(
    gT1, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsT1, paste0(savedir1, 'randNetsT1.RDS'))

# randNetsT1 <- read_rds(paste0(savedir1, 'randNetsT1.RDS'))

richT1 <- na.omit(randNetsT1$rich)
smallT1 <- randNetsT1$small
rnetsT1 <- randNetsT1$rand


# Longitudinal 1: Baseline ------------------------------------------------

outdir <- paste0(savedir, 'randL10', today)

randNetsL10 <- analysis_random_graphs(
    gL10, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL10, paste0(savedir1, 'randNetsL10.RDS'))

# randNetsL10 <- read_rds(paste0(savedir1, 'randNetsL10.RDS'))

richL10 <- na.omit(randNetsL10$rich)
smallL10 <- randNetsL10$small
rnetsL10 <- randNetsL10$rand


# Longitudinal 1: Two weeks -----------------------------------------------

outdir <- paste0(savedir, 'randL11', today)

randNetsL11 <- analysis_random_graphs(
    gL11, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL11, paste0(savedir1, 'randNetsL11.RDS'))

# randNetsL11 <- read_rds(paste0(savedir1, 'randNetsL11.RDS'))

richL11 <- na.omit(randNetsL11$rich)
smallL11 <- randNetsL11$small
rnetsL11 <- randNetsL11$rand


# Longitudinal 1: Three months --------------------------------------------

outdir <- paste0(savedir, 'randL12', today)

randNetsL12 <- analysis_random_graphs(
    gL12, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL12, paste0(savedir1, 'randNetsL12.RDS'))

# randNetsL12 <- read_rds(paste0(savedir1, 'randNetsL12.RDS'))

richL12 <- na.omit(randNetsL12$rich)
smallL12 <- randNetsL12$small
rnetsL12 <- randNetsL12$rand


# Longitudinal 2: Baseline ------------------------------------------------

outdir <- paste0(savedir, 'randL20', today)

randNetsL20 <- analysis_random_graphs(
    gL20, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL20, paste0(savedir1, 'randNetsL20.RDS'))

# randNetsL20 <- read_rds(paste0(savedir1, 'randNetsL20.RDS'))

richL20 <- na.omit(randNetsL20$rich)
smallL20 <- randNetsL20$small
rnetsL20 <- randNetsL20$rand


# Longitudinal 2: Two weeks -----------------------------------------------

outdir <- paste0(savedir, 'randL21', today)

randNetsL21 <- analysis_random_graphs(
    gL21, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL21, paste0(savedir1, 'randNetsL21.RDS'))

# randNetsL21 <- read_rds(paste0(savedir1, 'randNetsL21.RDS'))

richL21 <- na.omit(randNetsL21$rich)
smallL21 <- randNetsL21$small
rnetsL21 <- randNetsL21$rand


# Longitudinal 2: Three months --------------------------------------------

outdir <- paste0(savedir, 'randL22', today)

randNetsL22 <- analysis_random_graphs(
    gL22, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL22, paste0(savedir1, 'randNetsL22.RDS'))

# randNetsL22 <- read_rds(paste0(savedir1, 'randNetsL22.RDS'))

richL22 <- na.omit(randNetsL22$rich)
smallL22 <- randNetsL22$small
rnetsL22 <- randNetsL22$rand


# Longitudinal 2: Six months ----------------------------------------------

outdir <- paste0(savedir, 'randL23', today)

randNetsL23 <- analysis_random_graphs(
    gL23, kNumRand, savedir = outdir, clustering = F
)

write_rds(randNetsL23, paste0(savedir1, 'randNetsL23.RDS'))

# randNetsL23 <- read_rds(paste0(savedir1, 'randNetsL23.RDS'))

richL23 <- na.omit(randNetsL23$rich)
smallL23 <- randNetsL23$small
rnetsL23 <- randNetsL23$rand



