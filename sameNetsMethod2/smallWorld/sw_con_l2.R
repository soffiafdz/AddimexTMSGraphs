
# Closed label: T0 ----------------------------------------------------------------------------

rich2CONt0 <- rand2CONt0$rich
rich2CONt0 <- rich2CONt0[complete.cases(rich2CONt0)]
small2CONt0 <- rand2CONt0$small
small2CONt0$Stage <- rep.int("t0", 27)
rnets2CONt0 <- rand2CONt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich2CONt1 <- rand2CONt1$rich
rich2CONt1 <- rich2CONt1[complete.cases(rich2CONt1)]
small2CONt1 <- rand2CONt1$small
small2CONt1$Stage <- rep.int("t1", 27)
rnets2CONt1 <- rand2CONt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich2CONtx0 <- rand2CONtx0$rich
rich2CONtx0 <- rich2CONtx0[complete.cases(rich2CONtx0)]
small2CONtx0 <- rand2CONtx0$small
small2CONtx0$Stage <- rep.int("t0", 23)
rnets2CONtx0 <- rand2CONtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich2CONtx1 <- rand2CONtx1$rich
rich2CONtx1 <- rich2CONtx1[complete.cases(rich2CONtx1)]
small2CONtx1 <- rand2CONtx1$small
small2CONtx1$Stage <- rep.int("t1", 23)
rnets2CONtx1 <- rand2CONtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich2CONl0 <- rand2CONl0$rich
rich2CONl0 <- rich2CONl0[complete.cases(rich2CONl0)]
small2CONl0 <- rand2CONl0$small
small2CONl0$Stage <- rep.int("t0", 12)
rnets2CONl0 <- rand2CONl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich2CONl1 <- rand2CONl1$rich
rich2CONl1 <- rich2CONl1[complete.cases(rich2CONl1)]
small2CONl1 <- rand2CONl1$small
small2CONl1$Stage <- rep.int("t1", 12)
rnets2CONl1 <- rand2CONl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich2CONl2 <- rand2CONl2$rich
rich2CONl2 <- rich2CONl2[complete.cases(rich2CONl2)]
small2CONl2 <- rand2CONl2$small
small2CONl2$Stage <- rep.int("t2", 12)
rnets2CONl2 <- rand2CONl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw2CON <- rbindlist(list(small2CONt0, small2CONt1))
sw2CONx <- rbindlist(list(small2CONtx0, small2CONtx1))
sw2CONl <- rbindlist(list(small2CONl0, small2CONl1, small2CONl2))