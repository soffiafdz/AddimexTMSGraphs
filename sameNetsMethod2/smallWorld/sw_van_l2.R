
# Closed label: T0 ----------------------------------------------------------------------------

rich2VANt0 <- rand2VANt0$rich
rich2VANt0 <- rich2VANt0[complete.cases(rich2VANt0)]
small2VANt0 <- rand2VANt0$small
small2VANt0$Stage <- rep.int("t0", 27)
rnets2VANt0 <- rand2VANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2VANt1 <- rand2VANt1$rich
rich2VANt1 <- rich2VANt1[complete.cases(rich2VANt1)]
small2VANt1 <- rand2VANt1$small
small2VANt1$Stage <- rep.int("t1", 27)
rnets2VANt1 <- rand2VANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2VANtx0 <- rand2VANtx0$rich
rich2VANtx0 <- rich2VANtx0[complete.cases(rich2VANtx0)]
small2VANtx0 <- rand2VANtx0$small
small2VANtx0$Stage <- rep.int("t0", 23)
rnets2VANtx0 <- rand2VANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2VANtx1 <- rand2VANtx1$rich
rich2VANtx1 <- rich2VANtx1[complete.cases(rich2VANtx1)]
small2VANtx1 <- rand2VANtx1$small
small2VANtx1$Stage <- rep.int("t1", 23)
rnets2VANtx1 <- rand2VANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2VANl0 <- rand2VANl0$rich
rich2VANl0 <- rich2VANl0[complete.cases(rich2VANl0)]
small2VANl0 <- rand2VANl0$small
small2VANl0$Stage <- rep.int("t0", 12)
rnets2VANl0 <- rand2VANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2VANl1 <- rand2VANl1$rich
rich2VANl1 <- rich2VANl1[complete.cases(rich2VANl1)]
small2VANl1 <- rand2VANl1$small
small2VANl1$Stage <- rep.int("t1", 12)
rnets2VANl1 <- rand2VANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2VANl2 <- rand2VANl2$rich
rich2VANl2 <- rich2VANl2[complete.cases(rich2VANl2)]
small2VANl2 <- rand2VANl2$small
small2VANl2$Stage <- rep.int("t2", 12)
rnets2VANl2 <- rand2VANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2VAN <- rbindlist(list(small2VANt0, small2VANt1))
sw2VANx <- rbindlist(list(small2VANtx0, small2VANtx1))
sw2VANl <- rbindlist(list(small2VANl0, small2VANl1, small2VANl2))