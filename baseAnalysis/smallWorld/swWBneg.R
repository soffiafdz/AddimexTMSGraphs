

# Controls vs Users --------------------------------------------------------

# richNegWBvs <- randNegWBvs$rich
# smallNegWBvs <- randNegWBvs$small
# rnetsNegWBvs <- randNegWBvs$rand

# Closed label: T0 ---------------------------------------------------------

richNegWBt0 <- na.omit(randNegWBt0$rich)
smallNegWBt0 <- randNegWBt0$small[, Stage := rep.int("t0", 31)]
rnetsNegWBt0 <- randNegWBt0$rand

# Closed label: T1 ---------------------------------------------------------

richNegWBt1 <- na.omit(randNegWBt1$rich)
smallNegWBt1 <- randNegWBt1$small[, Stage := rep.int("t1", 31)]
rnetsNegWBt1 <- randNegWBt1$rand

# Open label: T0 -----------------------------------------------------------

# richNegWBpre <- randNegWBpre$rich
# smallNegWBpre <- randNegWBpre$small[, Stage := rep.int("t0", 27)]
# rnetsNegWBpre <- randNegWBpre$rand

# Open label: T1 -----------------------------------------------------------

# richNegWBpost <- randNegWBpost$rich
# smallNegWBpost <- randNegWBpost$small[, Stage := rep.int("t1", 27)]
# rnetsNegWBpost <- randNegWBpost$rand

# Longitudinal: T0 ---------------------------------------------------------

# richNegWBl0 <- randNegWBl0$rich
# smallNegWBl0 <- randNegWBl0$small[, Stage := rep.int("t0", 15)]
# rnetsNegWBl0 <- randNegWBl0$rand

# Longitudinal: T1 ---------------------------------------------------------

# richNegWBl1 <- randNegWBl1$rich
# smallNegWBl1 <- randNegWBl1$small[, Stage := rep.int("t1", 15)]
# rnetsNegWBl1 <- randNegWBl1$rand

# Longitudinal: T2 ---------------------------------------------------------

# richNegWBl2 <- randNegWBl2$rich
# smallNegWBl2 <- randNegWBl2$small[, Stage := rep.int("t2", 15)]
# rnetsNegWBl2 <- randNegWBl2$rand


# Data tables of small-worldness -------------------------------------------

# swNegWBvs <- smallNegWBvs
swNegWB <- rbindlist(list(smallNegWBt0, smallNegWBt1))
# swNegWBx <- rbindlist(list(smallNegWBpre, smallNegWBpost))
# swNegWBl <- rbindlist(list(smallNegWBl0, smallNegWBl1, smallNegWBl2))