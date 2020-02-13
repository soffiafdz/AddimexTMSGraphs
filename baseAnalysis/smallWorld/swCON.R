
# Controls vs Users ---------------------------------------------------------------------------

# richCONvs <- randCONvs$rich
# smallCONvs <- randCONvs$small
# rnetsCONvs <- randCONvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richCONt0 <- randCONt0$rich
smallCONt0 <- randCONt0$small[, Stage := rep.int("t0", 33)]
rnetsCONt0 <- randCONt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richCONt1 <- randCONt1$rich
smallCONt1 <- randCONt1$small[, Stage := rep.int("t1", 33)]
rnetsCONt1 <- randCONt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richCONpre <- randCONpre$rich
# smallCONpre <- randCONpre$small[, Stage := rep.int("t0", 27)]
# rnetsCONpre <- randCONpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richCONpost <- randCONpost$rich
# smallCONpost <- randCONpost$small[, Stage := rep.int("t1", 27)]
# rnetsCONpost <- randCONpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richCONl0 <- randCONl0$rich
# smallCONl0 <- randCONl0$small[, Stage := rep.int("t0", 15)]
# rnetsCONl0 <- randCONl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richCONl1 <- randCONl1$rich
# smallCONl1 <- randCONl1$small[, Stage := rep.int("t1", 15)]
# rnetsCONl1 <- randCONl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richCONl2 <- randCONl2$rich
# smallCONl2 <- randCONl2$small[, Stage := rep.int("t2", 15)]
# rnetsCONl2 <- randCONl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swCONvs <- smallCONvs
swCON <- rbindlist(list(smallCONt0, smallCONt1))
# swCONx <- rbindlist(list(smallCONpre, smallCONpost))
# swCONl <- rbindlist(list(smallCONl0, smallCONl1, smallCONl2))