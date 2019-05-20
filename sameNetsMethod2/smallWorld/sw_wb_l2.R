
# Closed label: T0 ----------------------------------------------------------------------------

rich2WBt0 <- rand2WBt0$rich
rich2WBt0 <- rich2WBt0[complete.cases(rich2WBt0)]
small2WBt0 <- rand2WBt0$small
small2WBt0$Stage <- rep.int("t0", 27)
rnets2WBt0 <- rand2WBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2WBt1 <- rand2WBt1$rich
rich2WBt1 <- rich2WBt1[complete.cases(rich2WBt1)]
small2WBt1 <- rand2WBt1$small
small2WBt1$Stage <- rep.int("t1", 27)
rnets2WBt1 <- rand2WBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2WBtx0 <- rand2WBtx0$rich
rich2WBtx0 <- rich2WBtx0[complete.cases(rich2WBtx0)]
small2WBtx0 <- rand2WBtx0$small
small2WBtx0$Stage <- rep.int("t0", 23)
rnets2WBtx0 <- rand2WBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2WBtx1 <- rand2WBtx1$rich
rich2WBtx1 <- rich2WBtx1[complete.cases(rich2WBtx1)]
small2WBtx1 <- rand2WBtx1$small
small2WBtx1$Stage <- rep.int("t1", 23)
rnets2WBtx1 <- rand2WBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2WBl0 <- rand2WBl0$rich
rich2WBl0 <- rich2WBl0[complete.cases(rich2WBl0)]
small2WBl0 <- rand2WBl0$small
small2WBl0$Stage <- rep.int("t0", 12)
rnets2WBl0 <- rand2WBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2WBl1 <- rand2WBl1$rich
rich2WBl1 <- rich2WBl1[complete.cases(rich2WBl1)]
small2WBl1 <- rand2WBl1$small
small2WBl1$Stage <- rep.int("t1", 12)
rnets2WBl1 <- rand2WBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2WBl2 <- rand2WBl2$rich
rich2WBl2 <- rich2WBl2[complete.cases(rich2WBl2)]
small2WBl2 <- rand2WBl2$small
small2WBl2$Stage <- rep.int("t2", 12)
rnets2WBl2 <- rand2WBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2WB <- rbindlist(list(small2WBt0, small2WBt1))
sw2WBx <- rbindlist(list(small2WBtx0, small2WBtx1))
sw2WBl <- rbindlist(list(small2WBl0, small2WBl1, small2WBl2))