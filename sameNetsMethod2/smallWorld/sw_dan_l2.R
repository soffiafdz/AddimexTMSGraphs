
# Closed label: T0 ----------------------------------------------------------------------------

rich2DANt0 <- rand2DANt0$rich
rich2DANt0 <- rich2DANt0[complete.cases(rich2DANt0)]
small2DANt0 <- rand2DANt0$small
small2DANt0$Stage <- rep.int("t0", 27)
rnets2DANt0 <- rand2DANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2DANt1 <- rand2DANt1$rich
rich2DANt1 <- rich2DANt1[complete.cases(rich2DANt1)]
small2DANt1 <- rand2DANt1$small
small2DANt1$Stage <- rep.int("t1", 27)
rnets2DANt1 <- rand2DANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2DANtx0 <- rand2DANtx0$rich
rich2DANtx0 <- rich2DANtx0[complete.cases(rich2DANtx0)]
small2DANtx0 <- rand2DANtx0$small
small2DANtx0$Stage <- rep.int("t0", 23)
rnets2DANtx0 <- rand2DANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2DANtx1 <- rand2DANtx1$rich
rich2DANtx1 <- rich2DANtx1[complete.cases(rich2DANtx1)]
small2DANtx1 <- rand2DANtx1$small
small2DANtx1$Stage <- rep.int("t1", 23)
rnets2DANtx1 <- rand2DANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2DANl0 <- rand2DANl0$rich
rich2DANl0 <- rich2DANl0[complete.cases(rich2DANl0)]
small2DANl0 <- rand2DANl0$small
small2DANl0$Stage <- rep.int("t0", 12)
rnets2DANl0 <- rand2DANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2DANl1 <- rand2DANl1$rich
rich2DANl1 <- rich2DANl1[complete.cases(rich2DANl1)]
small2DANl1 <- rand2DANl1$small
small2DANl1$Stage <- rep.int("t1", 12)
rnets2DANl1 <- rand2DANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2DANl2 <- rand2DANl2$rich
rich2DANl2 <- rich2DANl2[complete.cases(rich2DANl2)]
small2DANl2 <- rand2DANl2$small
small2DANl2$Stage <- rep.int("t2", 12)
rnets2DANl2 <- rand2DANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2DAN <- rbindlist(list(small2DANt0, small2DANt1))
sw2DANx <- rbindlist(list(small2DANtx0, small2DANtx1))
sw2DANl <- rbindlist(list(small2DANl0, small2DANl1, small2DANl2))