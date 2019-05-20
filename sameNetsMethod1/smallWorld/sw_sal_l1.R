
# Closed label: T0 ----------------------------------------------------------------------------

rich1SALt0 <- rand1SALt0$rich
rich1SALt0 <- rich1SALt0[complete.cases(rich1SALt0)]
small1SALt0 <- rand1SALt0$small
small1SALt0$Stage <- rep.int("t0", 27)
rnets1SALt0 <- rand1SALt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1SALt1 <- rand1SALt1$rich
rich1SALt1 <- rich1SALt1[complete.cases(rich1SALt1)]
small1SALt1 <- rand1SALt1$small
small1SALt1$Stage <- rep.int("t1", 27)
rnets1SALt1 <- rand1SALt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1SALtx0 <- rand1SALtx0$rich
rich1SALtx0 <- rich1SALtx0[complete.cases(rich1SALtx0)]
small1SALtx0 <- rand1SALtx0$small
small1SALtx0$Stage <- rep.int("t0", 23)
rnets1SALtx0 <- rand1SALtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1SALtx1 <- rand1SALtx1$rich
rich1SALtx1 <- rich1SALtx1[complete.cases(rich1SALtx1)]
small1SALtx1 <- rand1SALtx1$small
small1SALtx1$Stage <- rep.int("t1", 23)
rnets1SALtx1 <- rand1SALtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1SALl0 <- rand1SALl0$rich
rich1SALl0 <- rich1SALl0[complete.cases(rich1SALl0)]
small1SALl0 <- rand1SALl0$small
small1SALl0$Stage <- rep.int("t0", 12)
rnets1SALl0 <- rand1SALl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1SALl1 <- rand1SALl1$rich
rich1SALl1 <- rich1SALl1[complete.cases(rich1SALl1)]
small1SALl1 <- rand1SALl1$small
small1SALl1$Stage <- rep.int("t1", 12)
rnets1SALl1 <- rand1SALl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1SALl2 <- rand1SALl2$rich
rich1SALl2 <- rich1SALl2[complete.cases(rich1SALl2)]
small1SALl2 <- rand1SALl2$small
small1SALl2$Stage <- rep.int("t2", 12)
rnets1SALl2 <- rand1SALl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1SAL <- rbindlist(list(small1SALt0, small1SALt1))
sw1SALx <- rbindlist(list(small1SALtx0, small1SALtx1))
sw1SALl <- rbindlist(list(small1SALl0, small1SALl1, small1SALl2))