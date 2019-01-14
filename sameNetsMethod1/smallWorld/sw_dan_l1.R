
# Closed label: T0 ----------------------------------------------------------------------------

rich1DANt0 <- rand1DANt0$rich
rich1DANt0 <- rich1DANt0[complete.cases(rich1DANt0)]
small1DANt0 <- rand1DANt0$small
small1DANt0$Stage <- rep.int("t0", 27)
rnets1DANt0 <- rand1DANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1DANt1 <- rand1DANt1$rich
rich1DANt1 <- rich1DANt1[complete.cases(rich1DANt1)]
small1DANt1 <- rand1DANt1$small
small1DANt1$Stage <- rep.int("t1", 27)
rnets1DANt1 <- rand1DANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1DANtx0 <- rand1DANtx0$rich
rich1DANtx0 <- rich1DANtx0[complete.cases(rich1DANtx0)]
small1DANtx0 <- rand1DANtx0$small
small1DANtx0$Stage <- rep.int("t0", 23)
rnets1DANtx0 <- rand1DANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1DANtx1 <- rand1DANtx1$rich
rich1DANtx1 <- rich1DANtx1[complete.cases(rich1DANtx1)]
small1DANtx1 <- rand1DANtx1$small
small1DANtx1$Stage <- rep.int("t1", 23)
rnets1DANtx1 <- rand1DANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1DANl0 <- rand1DANl0$rich
rich1DANl0 <- rich1DANl0[complete.cases(rich1DANl0)]
small1DANl0 <- rand1DANl0$small
small1DANl0$Stage <- rep.int("t0", 12)
rnets1DANl0 <- rand1DANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1DANl1 <- rand1DANl1$rich
rich1DANl1 <- rich1DANl1[complete.cases(rich1DANl1)]
small1DANl1 <- rand1DANl1$small
small1DANl1$Stage <- rep.int("t1", 12)
rnets1DANl1 <- rand1DANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1DANl2 <- rand1DANl2$rich
rich1DANl2 <- rich1DANl2[complete.cases(rich1DANl2)]
small1DANl2 <- rand1DANl2$small
small1DANl2$Stage <- rep.int("t2", 12)
rnets1DANl2 <- rand1DANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1DAN <- rbindlist(list(small1DANt0, small1DANt1))
sw1DANx <- rbindlist(list(small1DANtx0, small1DANtx1))
sw1DANl <- rbindlist(list(small1DANl0, small1DANl1, small1DANl2))