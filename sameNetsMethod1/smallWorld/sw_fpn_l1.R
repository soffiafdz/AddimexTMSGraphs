
# Closed label: T0 ----------------------------------------------------------------------------

rich1FPNt0 <- rand1FPNt0$rich
rich1FPNt0 <- rich1FPNt0[complete.cases(rich1FPNt0)]
small1FPNt0 <- rand1FPNt0$small
small1FPNt0$Stage <- rep.int("t0", 27)
rnets1FPNt0 <- rand1FPNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1FPNt1 <- rand1FPNt1$rich
rich1FPNt1 <- rich1FPNt1[complete.cases(rich1FPNt1)]
small1FPNt1 <- rand1FPNt1$small
small1FPNt1$Stage <- rep.int("t1", 27)
rnets1FPNt1 <- rand1FPNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1FPNtx0 <- rand1FPNtx0$rich
rich1FPNtx0 <- rich1FPNtx0[complete.cases(rich1FPNtx0)]
small1FPNtx0 <- rand1FPNtx0$small
small1FPNtx0$Stage <- rep.int("t0", 23)
rnets1FPNtx0 <- rand1FPNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1FPNtx1 <- rand1FPNtx1$rich
rich1FPNtx1 <- rich1FPNtx1[complete.cases(rich1FPNtx1)]
small1FPNtx1 <- rand1FPNtx1$small
small1FPNtx1$Stage <- rep.int("t1", 23)
rnets1FPNtx1 <- rand1FPNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1FPNl0 <- rand1FPNl0$rich
rich1FPNl0 <- rich1FPNl0[complete.cases(rich1FPNl0)]
small1FPNl0 <- rand1FPNl0$small
small1FPNl0$Stage <- rep.int("t0", 12)
rnets1FPNl0 <- rand1FPNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1FPNl1 <- rand1FPNl1$rich
rich1FPNl1 <- rich1FPNl1[complete.cases(rich1FPNl1)]
small1FPNl1 <- rand1FPNl1$small
small1FPNl1$Stage <- rep.int("t1", 12)
rnets1FPNl1 <- rand1FPNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1FPNl2 <- rand1FPNl2$rich
rich1FPNl2 <- rich1FPNl2[complete.cases(rich1FPNl2)]
small1FPNl2 <- rand1FPNl2$small
small1FPNl2$Stage <- rep.int("t2", 12)
rnets1FPNl2 <- rand1FPNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1FPN <- rbindlist(list(small1FPNt0, small1FPNt1))
sw1FPNx <- rbindlist(list(small1FPNtx0, small1FPNtx1))
sw1FPNl <- rbindlist(list(small1FPNl0, small1FPNl1, small1FPNl2))