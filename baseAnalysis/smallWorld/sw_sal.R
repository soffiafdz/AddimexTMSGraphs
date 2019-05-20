
# Controls vs Users ---------------------------------------------------------------------------

richSALvs <- randSALvs$rich
richSALvs <- richSALvs[complete.cases(richSALvs)]
smallSALvs <- randSALvs$small
rnetsSALvs <- randSALvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richSALt0 <- randSALt0$rich
richSALt0 <- richSALt0[complete.cases(richSALt0)]
smallSALt0 <- randSALt0$small
smallSALt0$Stage <- rep.int("t0", 27)
rnetsSALt0 <- randSALt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richSALt1 <- randSALt1$rich
richSALt1 <- richSALt1[complete.cases(richSALt1)]
smallSALt1 <- randSALt1$small
smallSALt1$Stage <- rep.int("t1", 27)
rnetsSALt1 <- randSALt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richSALtx0 <- randSALtx0$rich
richSALtx0 <- richSALtx0[complete.cases(richSALtx0)]
smallSALtx0 <- randSALtx0$small
smallSALtx0$Stage <- rep.int("t0", 23)
rnetsSALtx0 <- randSALtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richSALtx1 <- randSALtx1$rich
richSALtx1 <- richSALtx1[complete.cases(richSALtx1)]
smallSALtx1 <- randSALtx1$small
smallSALtx1$Stage <- rep.int("t1", 23)
rnetsSALtx1 <- randSALtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richSALl0 <- randSALl0$rich
richSALl0 <- richSALl0[complete.cases(richSALl0)]
smallSALl0 <- randSALl0$small
smallSALl0$Stage <- rep.int("t0", 12)
rnetsSALl0 <- randSALl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richSALl1 <- randSALl1$rich
richSALl1 <- richSALl1[complete.cases(richSALl1)]
smallSALl1 <- randSALl1$small
smallSALl1$Stage <- rep.int("t1", 12)
rnetsSALl1 <- randSALl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richSALl2 <- randSALl2$rich
richSALl2 <- richSALl2[complete.cases(richSALl2)]
smallSALl2 <- randSALl2$small
smallSALl2$Stage <- rep.int("t2", 12)
rnetsSALl2 <- randSALl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swSALvs <- smallSALvs
swSAL <- rbindlist(list(smallSALt0, smallSALt1))
swSALx <- rbindlist(list(smallSALtx0, smallSALtx1))
swSALl <- rbindlist(list(smallSALl0, smallSALl1, smallSALl2))