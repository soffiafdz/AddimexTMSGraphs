
# Controls vs Users ---------------------------------------------------------------------------

richSUBvs <- randSUBvs$rich
richSUBvs <- richSUBvs[complete.cases(richSUBvs)]
smallSUBvs <- randSUBvs$small
rnetsSUBvs <- randSUBvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richSUBt0 <- randSUBt0$rich
richSUBt0 <- richSUBt0[complete.cases(richSUBt0)]
smallSUBt0 <- randSUBt0$small
smallSUBt0$Stage <- rep.int("t0", 27)
rnetsSUBt0 <- randSUBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richSUBt1 <- randSUBt1$rich
richSUBt1 <- richSUBt1[complete.cases(richSUBt1)]
smallSUBt1 <- randSUBt1$small
smallSUBt1$Stage <- rep.int("t1", 27)
rnetsSUBt1 <- randSUBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richSUBtx0 <- randSUBtx0$rich
richSUBtx0 <- richSUBtx0[complete.cases(richSUBtx0)]
smallSUBtx0 <- randSUBtx0$small
smallSUBtx0$Stage <- rep.int("t0", 23)
rnetsSUBtx0 <- randSUBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richSUBtx1 <- randSUBtx1$rich
richSUBtx1 <- richSUBtx1[complete.cases(richSUBtx1)]
smallSUBtx1 <- randSUBtx1$small
smallSUBtx1$Stage <- rep.int("t1", 23)
rnetsSUBtx1 <- randSUBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richSUBl0 <- randSUBl0$rich
richSUBl0 <- richSUBl0[complete.cases(richSUBl0)]
smallSUBl0 <- randSUBl0$small
smallSUBl0$Stage <- rep.int("t0", 12)
rnetsSUBl0 <- randSUBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richSUBl1 <- randSUBl1$rich
richSUBl1 <- richSUBl1[complete.cases(richSUBl1)]
smallSUBl1 <- randSUBl1$small
smallSUBl1$Stage <- rep.int("t1", 12)
rnetsSUBl1 <- randSUBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richSUBl2 <- randSUBl2$rich
richSUBl2 <- richSUBl2[complete.cases(richSUBl2)]
smallSUBl2 <- randSUBl2$small
smallSUBl2$Stage <- rep.int("t2", 12)
rnetsSUBl2 <- randSUBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swSUBvs <- smallSUBvs
swSUB <- rbindlist(list(smallSUBt0, smallSUBt1))
swSUBx <- rbindlist(list(smallSUBtx0, smallSUBtx1))
swSUBl <- rbindlist(list(smallSUBl0, smallSUBl1, smallSUBl2))