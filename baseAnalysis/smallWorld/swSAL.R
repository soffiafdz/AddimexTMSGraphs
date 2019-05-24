
# Controls vs Users ---------------------------------------------------------------------------

# richSALvs <- randSALvs$rich
# smallSALvs <- randSALvs$small
# rnetsSALvs <- randSALvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richSALt0 <- randSALt0$rich
smallSALt0 <- randSALt0$small[, Stage := rep.int("t0", 31)]
rnetsSALt0 <- randSALt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richSALt1 <- randSALt1$rich
smallSALt1 <- randSALt1$small[, Stage := rep.int("t1", 31)]
rnetsSALt1 <- randSALt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richSALpre <- randSALpre$rich
# smallSALpre <- randSALpre$small[, Stage := rep.int("t0", 27)]
# rnetsSALpre <- randSALpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richSALpost <- randSALpost$rich
# smallSALpost <- randSALpost$small[, Stage := rep.int("t1", 27)]
# rnetsSALpost <- randSALpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richSALl0 <- randSALl0$rich
# smallSALl0 <- randSALl0$small[, Stage := rep.int("t0", 15)]
# rnetsSALl0 <- randSALl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richSALl1 <- randSALl1$rich
# smallSALl1 <- randSALl1$small[, Stage := rep.int("t1", 15)]
# rnetsSALl1 <- randSALl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richSALl2 <- randSALl2$rich
# smallSALl2 <- randSALl2$small[, Stage := rep.int("t2", 15)]
# rnetsSALl2 <- randSALl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swSALvs <- smallSALvs
swSAL <- rbindlist(list(smallSALt0, smallSALt1))
# swSALx <- rbindlist(list(smallSALpre, smallSALpost))
# swSALl <- rbindlist(list(smallSALl0, smallSALl1, smallSALl2))