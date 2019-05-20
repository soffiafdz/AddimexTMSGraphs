
# Savedir: ------------------------------------------------------------------------------------

savedir1 <- paste0(home, 'brainGraph/', today, "_")

# CON graphs ----------------------------------------------------------------------------------

gCONvs <- read_rds(paste0(savedir1, "gCONvs.rds"))
gGrCONvs <- read_rds(paste0(savedir1, "gGrCONvs.rds"))
gCONt0 <- read_rds(paste0(savedir1, "gCONt0.rds"))
gGrCONt0 <- read_rds(paste0(savedir1, 'gGrCONt0.rds'))
gCONt1 <- read_rds(paste0(savedir1, "gCONt1.rds"))
gGrCONt1 <- read_rds(paste0(savedir1, 'gGrCONt1.rds'))
gCONtx0 <- read_rds(paste0(savedir1, "gCONtx0.rds"))
gGrCONtx0 <- read_rds(paste0(savedir1, 'gGrCONtx0.rds'))
gCONtx1 <- read_rds(paste0(savedir1, "gCONtx1.rds"))
gGrCONtx1 <- read_rds(paste0(savedir1, 'gGrCONtx1.rds'))
gCONl0 <- read_rds(paste0(savedir1, 'gCONl0.rds'))
gGrCONl0 <- read_rds(paste0(savedir1, 'gGrCONl0.rds'))
gCONl1 <- read_rds(paste0(savedir1, 'gCONl1.rds'))
gGrCONl1 <- read_rds(paste0(savedir1, 'gGrCONl1.rds'))
gCONl2 <- read_rds(paste0(savedir1, 'gCONl2.rds'))
gGrCONl2 <- read_rds(paste0(savedir1, 'gGrCONl2.rds'))


# DAN graphs ----------------------------------------------------------------------------------

gDANvs <- read_rds(paste0(savedir1, "gDANvs.rds"))
gGrDANvs <- read_rds(paste0(savedir1, "gGrDANvs.rds"))
gDANt0 <- read_rds(paste0(savedir1, "gDANt0.rds"))
gGrDANt0 <- read_rds(paste0(savedir1, 'gGrDANt0.rds'))
gDANt1 <- read_rds(paste0(savedir1, "gDANt1.rds"))
gGrDANt1 <- read_rds(paste0(savedir1, 'gGrDANt1.rds'))
gDANtx0 <- read_rds(paste0(savedir1, "gDANtx0.rds"))
gGrDANtx0 <- read_rds(paste0(savedir1, 'gGrDANtx0.rds'))
gDANtx1 <- read_rds(paste0(savedir1, "gDANtx1.rds"))
gGrDANtx1 <- read_rds(paste0(savedir1, 'gGrDANtx1.rds'))
gDANl0 <- read_rds(paste0(savedir1, 'gDANl0.rds'))
gGrDANl0 <- read_rds(paste0(savedir1, 'gGrDANl0.rds'))
gDANl1 <- read_rds(paste0(savedir1, 'gDANl1.rds'))
gGrDANl1 <- read_rds(paste0(savedir1, 'gGrDANl1.rds'))
gDANl2 <- read_rds(paste0(savedir1, 'gDANl2.rds'))
gGrDANl2 <- read_rds(paste0(savedir1, 'gGrDANl2.rds'))


# DMN graphs ----------------------------------------------------------------------------------

gDMNvs <- read_rds(paste0(savedir1, "gDMNvs.rds"))
gGrDMNvs <- read_rds(paste0(savedir1, "gGrDMNvs.rds"))
gDMNt0 <- read_rds(paste0(savedir1, "gDMNt0.rds"))
gGrDMNt0 <- read_rds(paste0(savedir1, 'gGrDMNt0.rds'))
gDMNt1 <- read_rds(paste0(savedir1, "gDMNt1.rds"))
gGrDMNt1 <- read_rds(paste0(savedir1, 'gGrDMNt1.rds'))
gDMNtx0 <- read_rds(paste0(savedir1, "gDMNtx0.rds"))
gGrDMNtx0 <- read_rds(paste0(savedir1, 'gGrDMNtx0.rds'))
gDMNtx1 <- read_rds(paste0(savedir1, "gDMNtx1.rds"))
gGrDMNtx1 <- read_rds(paste0(savedir1, 'gGrDMNtx1.rds'))
gDMNl0 <- read_rds(paste0(savedir1, 'gDMNl0.rds'))
gGrDMNl0 <- read_rds(paste0(savedir1, 'gGrDMNl0.rds'))
gDMNl1 <- read_rds(paste0(savedir1, 'gDMNl1.rds'))
gGrDMNl1 <- read_rds(paste0(savedir1, 'gGrDMNl1.rds'))
gDMNl2 <- read_rds(paste0(savedir1, 'gDMNl2.rds'))
gGrDMNl2 <- read_rds(paste0(savedir1, 'gGrDMNl2.rds'))


# FPN graphs ----------------------------------------------------------------------------------

gFPNvs <- read_rds(paste0(savedir1, "gFPNvs.rds"))
gGrFPNvs <- read_rds(paste0(savedir1, "gGrFPNvs.rds"))
gFPNt0 <- read_rds(paste0(savedir1, "gFPNt0.rds"))
gGrFPNt0 <- read_rds(paste0(savedir1, 'gGrFPNt0.rds'))
gFPNt1 <- read_rds(paste0(savedir1, "gFPNt1.rds"))
gGrFPNt1 <- read_rds(paste0(savedir1, 'gGrFPNt1.rds'))
gFPNtx0 <- read_rds(paste0(savedir1, "gFPNtx0.rds"))
gGrFPNtx0 <- read_rds(paste0(savedir1, 'gGrFPNtx0.rds'))
gFPNtx1 <- read_rds(paste0(savedir1, "gFPNtx1.rds"))
gGrFPNtx1 <- read_rds(paste0(savedir1, 'gGrFPNtx1.rds'))
gFPNl0 <- read_rds(paste0(savedir1, 'gFPNl0.rds'))
gGrFPNl0 <- read_rds(paste0(savedir1, 'gGrFPNl0.rds'))
gFPNl1 <- read_rds(paste0(savedir1, 'gFPNl1.rds'))
gGrFPNl1 <- read_rds(paste0(savedir1, 'gGrFPNl1.rds'))
gFPNl2 <- read_rds(paste0(savedir1, 'gFPNl2.rds'))
gGrFPNl2 <- read_rds(paste0(savedir1, 'gGrFPNl2.rds'))


# SAL graphs ----------------------------------------------------------------------------------

gSALvs <- read_rds(paste0(savedir1, "gSALvs.rds"))
gGrSALvs <- read_rds(paste0(savedir1, "gGrSALvs.rds"))
gSALt0 <- read_rds(paste0(savedir1, "gSALt0.rds"))
gGrSALt0 <- read_rds(paste0(savedir1, 'gGrSALt0.rds'))
gSALt1 <- read_rds(paste0(savedir1, "gSALt1.rds"))
gGrSALt1 <- read_rds(paste0(savedir1, 'gGrSALt1.rds'))
gSALtx0 <- read_rds(paste0(savedir1, "gSALtx0.rds"))
gGrSALtx0 <- read_rds(paste0(savedir1, 'gGrSALtx0.rds'))
gSALtx1 <- read_rds(paste0(savedir1, "gSALtx1.rds"))
gGrSALtx1 <- read_rds(paste0(savedir1, 'gGrSALtx1.rds'))
gSALl0 <- read_rds(paste0(savedir1, 'gSALl0.rds'))
gGrSALl0 <- read_rds(paste0(savedir1, 'gGrSALl0.rds'))
gSALl1 <- read_rds(paste0(savedir1, 'gSALl1.rds'))
gGrSALl1 <- read_rds(paste0(savedir1, 'gGrSALl1.rds'))
gSALl2 <- read_rds(paste0(savedir1, 'gSALl2.rds'))
gGrSALl2 <- read_rds(paste0(savedir1, 'gGrSALl2.rds'))


# SUB graphs ----------------------------------------------------------------------------------

gSUBvs <- read_rds(paste0(savedir1, "gSUBvs.rds"))
gGrSUBvs <- read_rds(paste0(savedir1, "gGrSUBvs.rds"))
gSUBt0 <- read_rds(paste0(savedir1, "gSUBt0.rds"))
gGrSUBt0 <- read_rds(paste0(savedir1, 'gGrSUBt0.rds'))
gSUBt1 <- read_rds(paste0(savedir1, "gSUBt1.rds"))
gGrSUBt1 <- read_rds(paste0(savedir1, 'gGrSUBt1.rds'))
gSUBtx0 <- read_rds(paste0(savedir1, "gSUBtx0.rds"))
gGrSUBtx0 <- read_rds(paste0(savedir1, 'gGrSUBtx0.rds'))
gSUBtx1 <- read_rds(paste0(savedir1, "gSUBtx1.rds"))
gGrSUBtx1 <- read_rds(paste0(savedir1, 'gGrSUBtx1.rds'))
gSUBl0 <- read_rds(paste0(savedir1, 'gSUBl0.rds'))
gGrSUBl0 <- read_rds(paste0(savedir1, 'gGrSUBl0.rds'))
gSUBl1 <- read_rds(paste0(savedir1, 'gSUBl1.rds'))
gGrSUBl1 <- read_rds(paste0(savedir1, 'gGrSUBl1.rds'))
gSUBl2 <- read_rds(paste0(savedir1, 'gSUBl2.rds'))
gGrSUBl2 <- read_rds(paste0(savedir1, 'gGrSUBl2.rds'))


# VAN graphs ----------------------------------------------------------------------------------

gVANvs <- read_rds(paste0(savedir1, "gVANvs.rds"))
gGrVANvs <- read_rds(paste0(savedir1, "gGrVANvs.rds"))
gVANt0 <- read_rds(paste0(savedir1, "gVANt0.rds"))
gGrVANt0 <- read_rds(paste0(savedir1, 'gGrVANt0.rds'))
gVANt1 <- read_rds(paste0(savedir1, "gVANt1.rds"))
gGrVANt1 <- read_rds(paste0(savedir1, 'gGrVANt1.rds'))
gVANtx0 <- read_rds(paste0(savedir1, "gVANtx0.rds"))
gGrVANtx0 <- read_rds(paste0(savedir1, 'gGrVANtx0.rds'))
gVANtx1 <- read_rds(paste0(savedir1, "gVANtx1.rds"))
gGrVANtx1 <- read_rds(paste0(savedir1, 'gGrVANtx1.rds'))
gVANl0 <- read_rds(paste0(savedir1, 'gVANl0.rds'))
gGrVANl0 <- read_rds(paste0(savedir1, 'gGrVANl0.rds'))
gVANl1 <- read_rds(paste0(savedir1, 'gVANl1.rds'))
gGrVANl1 <- read_rds(paste0(savedir1, 'gGrVANl1.rds'))
gVANl2 <- read_rds(paste0(savedir1, 'gVANl2.rds'))
gGrVANl2 <- read_rds(paste0(savedir1, 'gGrVANl2.rds'))


# Global graphs -------------------------------------------------------------------------------

gWBvs <- read_rds(paste0(savedir1, "gWBvs.rds"))
gGrWBvs <- read_rds(paste0(savedir1, "gGrWBvs.rds"))
gWBt0 <- read_rds(paste0(savedir1, "gWBt0.rds"))
gGrWBt0 <- read_rds(paste0(savedir1, 'gGrWBt0.rds'))
gWBt1 <- read_rds(paste0(savedir1, "gWBt1.rds"))
gGrWBt1 <- read_rds(paste0(savedir1, 'gGrWBt1.rds'))
gWBtx0 <- read_rds(paste0(savedir1, "gWBtx0.rds"))
gGrWBtx0 <- read_rds(paste0(savedir1, 'gGrWBtx0.rds'))
gWBtx1 <- read_rds(paste0(savedir1, "gWBtx1.rds"))
gGrWBtx1 <- read_rds(paste0(savedir1, 'gGrWBtx1.rds'))
gWBl0 <- read_rds(paste0(savedir1, 'gWBl0.rds'))
gGrWBl0 <- read_rds(paste0(savedir1, 'gGrWBl0.rds'))
gWBl1 <- read_rds(paste0(savedir1, 'gWBl1.rds'))
gGrWBl1 <- read_rds(paste0(savedir1, 'gGrWBl1.rds'))
gWBl2 <- read_rds(paste0(savedir1, 'gWBl2.rds'))
gGrWBl2 <- read_rds(paste0(savedir1, 'gGrWBl2.rds'))