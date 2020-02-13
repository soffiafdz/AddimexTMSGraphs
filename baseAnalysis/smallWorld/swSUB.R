
# Controls vs Users ---------------------------------------------------------------------------

# richSUBvs <- randSUBvs$rich
# smallSUBvs <- randSUBvs$small
# rnetsSUBvs <- randSUBvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richSUBt0 <- randSUBt0$rich
smallSUBt0 <- randSUBt0$small[, Stage := rep.int("t0", 31)]
rnetsSUBt0 <- randSUBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richSUBt1 <- randSUBt1$rich
smallSUBt1 <- randSUBt1$small[, Stage := rep.int("t1", 31)]
rnetsSUBt1 <- randSUBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richSUBpre <- randSUBpre$rich
# smallSUBpre <- randSUBpre$small[, Stage := rep.int("t0", 27)]
# rnetsSUBpre <- randSUBpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richSUBpost <- randSUBpost$rich
# smallSUBpost <- randSUBpost$small[, Stage := rep.int("t1", 27)]
# rnetsSUBpost <- randSUBpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richSUBl0 <- randSUBl0$rich
# smallSUBl0 <- randSUBl0$small[, Stage := rep.int("t0", 15)]
# rnetsSUBl0 <- randSUBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richSUBl1 <- randSUBl1$rich
# smallSUBl1 <- randSUBl1$small[, Stage := rep.int("t1", 15)]
# rnetsSUBl1 <- randSUBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richSUBl2 <- randSUBl2$rich
# smallSUBl2 <- randSUBl2$small[, Stage := rep.int("t2", 15)]
# rnetsSUBl2 <- randSUBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swSUBvs <- smallSUBvs
swSUB <- rbindlist(list(smallSUBt0, smallSUBt1))
# swSUBx <- rbindlist(list(smallSUBpre, smallSUBpost))
# swSUBl <- rbindlist(list(smallSUBl0, smallSUBl1, smallSUBl2))