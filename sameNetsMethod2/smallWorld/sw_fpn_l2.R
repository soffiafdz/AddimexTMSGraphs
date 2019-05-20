
# Closed label: T0 ----------------------------------------------------------------------------

rich2FPNt0 <- rand2FPNt0$rich
rich2FPNt0 <- rich2FPNt0[complete.cases(rich2FPNt0)]
small2FPNt0 <- rand2FPNt0$small
small2FPNt0$Stage <- rep.int("t0", 27)
rnets2FPNt0 <- rand2FPNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2FPNt1 <- rand2FPNt1$rich
rich2FPNt1 <- rich2FPNt1[complete.cases(rich2FPNt1)]
small2FPNt1 <- rand2FPNt1$small
small2FPNt1$Stage <- rep.int("t1", 27)
rnets2FPNt1 <- rand2FPNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2FPNtx0 <- rand2FPNtx0$rich
rich2FPNtx0 <- rich2FPNtx0[complete.cases(rich2FPNtx0)]
small2FPNtx0 <- rand2FPNtx0$small
small2FPNtx0$Stage <- rep.int("t0", 23)
rnets2FPNtx0 <- rand2FPNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2FPNtx1 <- rand2FPNtx1$rich
rich2FPNtx1 <- rich2FPNtx1[complete.cases(rich2FPNtx1)]
small2FPNtx1 <- rand2FPNtx1$small
small2FPNtx1$Stage <- rep.int("t1", 23)
rnets2FPNtx1 <- rand2FPNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2FPNl0 <- rand2FPNl0$rich
rich2FPNl0 <- rich2FPNl0[complete.cases(rich2FPNl0)]
small2FPNl0 <- rand2FPNl0$small
small2FPNl0$Stage <- rep.int("t0", 12)
rnets2FPNl0 <- rand2FPNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2FPNl1 <- rand2FPNl1$rich
rich2FPNl1 <- rich2FPNl1[complete.cases(rich2FPNl1)]
small2FPNl1 <- rand2FPNl1$small
small2FPNl1$Stage <- rep.int("t1", 12)
rnets2FPNl1 <- rand2FPNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2FPNl2 <- rand2FPNl2$rich
rich2FPNl2 <- rich2FPNl2[complete.cases(rich2FPNl2)]
small2FPNl2 <- rand2FPNl2$small
small2FPNl2$Stage <- rep.int("t2", 12)
rnets2FPNl2 <- rand2FPNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2FPN <- rbindlist(list(small2FPNt0, small2FPNt1))
sw2FPNx <- rbindlist(list(small2FPNtx0, small2FPNtx1))
sw2FPNl <- rbindlist(list(small2FPNl0, small2FPNl1, small2FPNl2))