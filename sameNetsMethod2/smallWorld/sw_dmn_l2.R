
# Closed label: T0 ----------------------------------------------------------------------------

rich2DMNt0 <- rand2DMNt0$rich
rich2DMNt0 <- rich2DMNt0[complete.cases(rich2DMNt0)]
small2DMNt0 <- rand2DMNt0$small
small2DMNt0$Stage <- rep.int("t0", 27)
rnets2DMNt0 <- rand2DMNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2DMNt1 <- rand2DMNt1$rich
rich2DMNt1 <- rich2DMNt1[complete.cases(rich2DMNt1)]
small2DMNt1 <- rand2DMNt1$small
small2DMNt1$Stage <- rep.int("t1", 27)
rnets2DMNt1 <- rand2DMNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2DMNtx0 <- rand2DMNtx0$rich
rich2DMNtx0 <- rich2DMNtx0[complete.cases(rich2DMNtx0)]
small2DMNtx0 <- rand2DMNtx0$small
small2DMNtx0$Stage <- rep.int("t0", 23)
rnets2DMNtx0 <- rand2DMNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2DMNtx1 <- rand2DMNtx1$rich
rich2DMNtx1 <- rich2DMNtx1[complete.cases(rich2DMNtx1)]
small2DMNtx1 <- rand2DMNtx1$small
small2DMNtx1$Stage <- rep.int("t1", 23)
rnets2DMNtx1 <- rand2DMNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2DMNl0 <- rand2DMNl0$rich
rich2DMNl0 <- rich2DMNl0[complete.cases(rich2DMNl0)]
small2DMNl0 <- rand2DMNl0$small
small2DMNl0$Stage <- rep.int("t0", 12)
rnets2DMNl0 <- rand2DMNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2DMNl1 <- rand2DMNl1$rich
rich2DMNl1 <- rich2DMNl1[complete.cases(rich2DMNl1)]
small2DMNl1 <- rand2DMNl1$small
small2DMNl1$Stage <- rep.int("t1", 12)
rnets2DMNl1 <- rand2DMNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2DMNl2 <- rand2DMNl2$rich
rich2DMNl2 <- rich2DMNl2[complete.cases(rich2DMNl2)]
small2DMNl2 <- rand2DMNl2$small
small2DMNl2$Stage <- rep.int("t2", 12)
rnets2DMNl2 <- rand2DMNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2DMN <- rbindlist(list(small2DMNt0, small2DMNt1))
sw2DMNx <- rbindlist(list(small2DMNtx0, small2DMNtx1))
sw2DMNl <- rbindlist(list(small2DMNl0, small2DMNl1, small2DMNl2))