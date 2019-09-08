
# Controls vs Users ---------------------------------------------------------------------------

# richFPNvs <- randFPNvs$rich
# smallFPNvs <- randFPNvs$small
# rnetsFPNvs <- randFPNvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richFPNt0 <- randFPNt0$rich
smallFPNt0 <- randFPNt0$small[, Stage := rep.int("t0", 33)]
rnetsFPNt0 <- randFPNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richFPNt1 <- randFPNt1$rich
smallFPNt1 <- randFPNt1$small[, Stage := rep.int("t1", 33)]
rnetsFPNt1 <- randFPNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richFPNpre <- randFPNpre$rich
# smallFPNpre <- randFPNpre$small[, Stage := rep.int("t0", 27)]
# rnetsFPNpre <- randFPNpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richFPNpost <- randFPNpost$rich
# smallFPNpost <- randFPNpost$small[, Stage := rep.int("t1", 27)]
# rnetsFPNpost <- randFPNpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richFPNl0 <- randFPNl0$rich
# smallFPNl0 <- randFPNl0$small[, Stage := rep.int("t0", 15)]
# rnetsFPNl0 <- randFPNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richFPNl1 <- randFPNl1$rich
# smallFPNl1 <- randFPNl1$small[, Stage := rep.int("t1", 15)]
# rnetsFPNl1 <- randFPNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richFPNl2 <- randFPNl2$rich
# smallFPNl2 <- randFPNl2$small[, Stage := rep.int("t2", 15)]
# rnetsFPNl2 <- randFPNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swFPNvs <- smallFPNvs
swFPN <- rbindlist(list(smallFPNt0, smallFPNt1))
# swFPNx <- rbindlist(list(smallFPNpre, smallFPNpost))
# swFPNl <- rbindlist(list(smallFPNl0, smallFPNl1, smallFPNl2))