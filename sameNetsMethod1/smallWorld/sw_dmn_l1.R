
# Closed label: T0 ----------------------------------------------------------------------------

rich1DMNt0 <- rand1DMNt0$rich
rich1DMNt0 <- rich1DMNt0[complete.cases(rich1DMNt0)]
small1DMNt0 <- rand1DMNt0$small
small1DMNt0$Stage <- rep.int("t0", 27)
rnets1DMNt0 <- rand1DMNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1DMNt1 <- rand1DMNt1$rich
rich1DMNt1 <- rich1DMNt1[complete.cases(rich1DMNt1)]
small1DMNt1 <- rand1DMNt1$small
small1DMNt1$Stage <- rep.int("t1", 27)
rnets1DMNt1 <- rand1DMNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1DMNtx0 <- rand1DMNtx0$rich
rich1DMNtx0 <- rich1DMNtx0[complete.cases(rich1DMNtx0)]
small1DMNtx0 <- rand1DMNtx0$small
small1DMNtx0$Stage <- rep.int("t0", 23)
rnets1DMNtx0 <- rand1DMNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1DMNtx1 <- rand1DMNtx1$rich
rich1DMNtx1 <- rich1DMNtx1[complete.cases(rich1DMNtx1)]
small1DMNtx1 <- rand1DMNtx1$small
small1DMNtx1$Stage <- rep.int("t1", 23)
rnets1DMNtx1 <- rand1DMNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1DMNl0 <- rand1DMNl0$rich
rich1DMNl0 <- rich1DMNl0[complete.cases(rich1DMNl0)]
small1DMNl0 <- rand1DMNl0$small
small1DMNl0$Stage <- rep.int("t0", 12)
rnets1DMNl0 <- rand1DMNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1DMNl1 <- rand1DMNl1$rich
rich1DMNl1 <- rich1DMNl1[complete.cases(rich1DMNl1)]
small1DMNl1 <- rand1DMNl1$small
small1DMNl1$Stage <- rep.int("t1", 12)
rnets1DMNl1 <- rand1DMNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1DMNl2 <- rand1DMNl2$rich
rich1DMNl2 <- rich1DMNl2[complete.cases(rich1DMNl2)]
small1DMNl2 <- rand1DMNl2$small
small1DMNl2$Stage <- rep.int("t2", 12)
rnets1DMNl2 <- rand1DMNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1DMN <- rbindlist(list(small1DMNt0, small1DMNt1))
sw1DMNx <- rbindlist(list(small1DMNtx0, small1DMNtx1))
sw1DMNl <- rbindlist(list(small1DMNl0, small1DMNl1, small1DMNl2))