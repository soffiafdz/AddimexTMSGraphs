
# Closed label: T0 ----------------------------------------------------------------------------

rich2SUBt0 <- rand2SUBt0$rich
rich2SUBt0 <- rich2SUBt0[complete.cases(rich2SUBt0)]
small2SUBt0 <- rand2SUBt0$small
small2SUBt0$Stage <- rep.int("t0", 27)
rnets2SUBt0 <- rand2SUBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2SUBt1 <- rand2SUBt1$rich
rich2SUBt1 <- rich2SUBt1[complete.cases(rich2SUBt1)]
small2SUBt1 <- rand2SUBt1$small
small2SUBt1$Stage <- rep.int("t1", 27)
rnets2SUBt1 <- rand2SUBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2SUBtx0 <- rand2SUBtx0$rich
rich2SUBtx0 <- rich2SUBtx0[complete.cases(rich2SUBtx0)]
small2SUBtx0 <- rand2SUBtx0$small
small2SUBtx0$Stage <- rep.int("t0", 23)
rnets2SUBtx0 <- rand2SUBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2SUBtx1 <- rand2SUBtx1$rich
rich2SUBtx1 <- rich2SUBtx1[complete.cases(rich2SUBtx1)]
small2SUBtx1 <- rand2SUBtx1$small
small2SUBtx1$Stage <- rep.int("t1", 23)
rnets2SUBtx1 <- rand2SUBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2SUBl0 <- rand2SUBl0$rich
rich2SUBl0 <- rich2SUBl0[complete.cases(rich2SUBl0)]
small2SUBl0 <- rand2SUBl0$small
small2SUBl0$Stage <- rep.int("t0", 12)
rnets2SUBl0 <- rand2SUBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2SUBl1 <- rand2SUBl1$rich
rich2SUBl1 <- rich2SUBl1[complete.cases(rich2SUBl1)]
small2SUBl1 <- rand2SUBl1$small
small2SUBl1$Stage <- rep.int("t1", 12)
rnets2SUBl1 <- rand2SUBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2SUBl2 <- rand2SUBl2$rich
rich2SUBl2 <- rich2SUBl2[complete.cases(rich2SUBl2)]
small2SUBl2 <- rand2SUBl2$small
small2SUBl2$Stage <- rep.int("t2", 12)
rnets2SUBl2 <- rand2SUBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2SUB <- rbindlist(list(small2SUBt0, small2SUBt1))
sw2SUBx <- rbindlist(list(small2SUBtx0, small2SUBtx1))
sw2SUBl <- rbindlist(list(small2SUBl0, small2SUBl1, small2SUBl2))