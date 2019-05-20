
# Closed label: T0 ----------------------------------------------------------------------------

rich2SALt0 <- rand2SALt0$rich
rich2SALt0 <- rich2SALt0[complete.cases(rich2SALt0)]
small2SALt0 <- rand2SALt0$small
small2SALt0$Stage <- rep.int("t0", 27)
rnets2SALt0 <- rand2SALt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2SALt1 <- rand2SALt1$rich
rich2SALt1 <- rich2SALt1[complete.cases(rich2SALt1)]
small2SALt1 <- rand2SALt1$small
small2SALt1$Stage <- rep.int("t1", 27)
rnets2SALt1 <- rand2SALt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2SALtx0 <- rand2SALtx0$rich
rich2SALtx0 <- rich2SALtx0[complete.cases(rich2SALtx0)]
small2SALtx0 <- rand2SALtx0$small
small2SALtx0$Stage <- rep.int("t0", 23)
rnets2SALtx0 <- rand2SALtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2SALtx1 <- rand2SALtx1$rich
rich2SALtx1 <- rich2SALtx1[complete.cases(rich2SALtx1)]
small2SALtx1 <- rand2SALtx1$small
small2SALtx1$Stage <- rep.int("t1", 23)
rnets2SALtx1 <- rand2SALtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2SALl0 <- rand2SALl0$rich
rich2SALl0 <- rich2SALl0[complete.cases(rich2SALl0)]
small2SALl0 <- rand2SALl0$small
small2SALl0$Stage <- rep.int("t0", 12)
rnets2SALl0 <- rand2SALl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2SALl1 <- rand2SALl1$rich
rich2SALl1 <- rich2SALl1[complete.cases(rich2SALl1)]
small2SALl1 <- rand2SALl1$small
small2SALl1$Stage <- rep.int("t1", 12)
rnets2SALl1 <- rand2SALl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2SALl2 <- rand2SALl2$rich
rich2SALl2 <- rich2SALl2[complete.cases(rich2SALl2)]
small2SALl2 <- rand2SALl2$small
small2SALl2$Stage <- rep.int("t2", 12)
rnets2SALl2 <- rand2SALl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2SAL <- rbindlist(list(small2SALt0, small2SALt1))
sw2SALx <- rbindlist(list(small2SALtx0, small2SALtx1))
sw2SALl <- rbindlist(list(small2SALl0, small2SALl1, small2SALl2))