
# Controls vs Users ---------------------------------------------------------------------------

# richWBvs <- randWBvs$rich
# smallWBvs <- randWBvs$small
# rnetsWBvs <- randWBvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richWBt0 <- na.omit(randWBt0$rich)
smallWBt0 <- randWBt0$small[, Stage := rep.int("t0", 31)]
rnetsWBt0 <- randWBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richWBt1 <- na.omit(randWBt1$rich)
smallWBt1 <- randWBt1$small[, Stage := rep.int("t1", 31)]
rnetsWBt1 <- randWBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richWBpre <- randWBpre$rich
# smallWBpre <- randWBpre$small[, Stage := rep.int("t0", 27)]
# rnetsWBpre <- randWBpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richWBpost <- randWBpost$rich
# smallWBpost <- randWBpost$small[, Stage := rep.int("t1", 27)]
# rnetsWBpost <- randWBpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richWBl0 <- randWBl0$rich
# smallWBl0 <- randWBl0$small[, Stage := rep.int("t0", 15)]
# rnetsWBl0 <- randWBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richWBl1 <- randWBl1$rich
# smallWBl1 <- randWBl1$small[, Stage := rep.int("t1", 15)]
# rnetsWBl1 <- randWBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richWBl2 <- randWBl2$rich
# smallWBl2 <- randWBl2$small[, Stage := rep.int("t2", 15)]
# rnetsWBl2 <- randWBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swWBvs <- smallWBvs
swWB <- rbindlist(list(smallWBt0, smallWBt1))
# swWBx <- rbindlist(list(smallWBpre, smallWBpost))
# swWBl <- rbindlist(list(smallWBl0, smallWBl1, smallWBl2))