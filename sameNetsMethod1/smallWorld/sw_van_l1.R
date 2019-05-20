
# Closed label: T0 ----------------------------------------------------------------------------

rich1VANt0 <- rand1VANt0$rich
rich1VANt0 <- rich1VANt0[complete.cases(rich1VANt0)]
small1VANt0 <- rand1VANt0$small
small1VANt0$Stage <- rep.int("t0", 27)
rnets1VANt0 <- rand1VANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1VANt1 <- rand1VANt1$rich
rich1VANt1 <- rich1VANt1[complete.cases(rich1VANt1)]
small1VANt1 <- rand1VANt1$small
small1VANt1$Stage <- rep.int("t1", 27)
rnets1VANt1 <- rand1VANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1VANtx0 <- rand1VANtx0$rich
rich1VANtx0 <- rich1VANtx0[complete.cases(rich1VANtx0)]
small1VANtx0 <- rand1VANtx0$small
small1VANtx0$Stage <- rep.int("t0", 23)
rnets1VANtx0 <- rand1VANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1VANtx1 <- rand1VANtx1$rich
rich1VANtx1 <- rich1VANtx1[complete.cases(rich1VANtx1)]
small1VANtx1 <- rand1VANtx1$small
small1VANtx1$Stage <- rep.int("t1", 23)
rnets1VANtx1 <- rand1VANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1VANl0 <- rand1VANl0$rich
rich1VANl0 <- rich1VANl0[complete.cases(rich1VANl0)]
small1VANl0 <- rand1VANl0$small
small1VANl0$Stage <- rep.int("t0", 12)
rnets1VANl0 <- rand1VANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1VANl1 <- rand1VANl1$rich
rich1VANl1 <- rich1VANl1[complete.cases(rich1VANl1)]
small1VANl1 <- rand1VANl1$small
small1VANl1$Stage <- rep.int("t1", 12)
rnets1VANl1 <- rand1VANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1VANl2 <- rand1VANl2$rich
rich1VANl2 <- rich1VANl2[complete.cases(rich1VANl2)]
small1VANl2 <- rand1VANl2$small
small1VANl2$Stage <- rep.int("t2", 12)
rnets1VANl2 <- rand1VANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1VAN <- rbindlist(list(small1VANt0, small1VANt1))
sw1VANx <- rbindlist(list(small1VANtx0, small1VANtx1))
sw1VANl <- rbindlist(list(small1VANl0, small1VANl1, small1VANl2))