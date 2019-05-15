
# Closed label: T0 ----------------------------------------------------------------------------

rich1SUBt0 <- rand1SUBt0$rich
rich1SUBt0 <- rich1SUBt0[complete.cases(rich1SUBt0)]
small1SUBt0 <- rand1SUBt0$small
small1SUBt0$Stage <- rep.int("t0", 27)
rnets1SUBt0 <- rand1SUBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1SUBt1 <- rand1SUBt1$rich
rich1SUBt1 <- rich1SUBt1[complete.cases(rich1SUBt1)]
small1SUBt1 <- rand1SUBt1$small
small1SUBt1$Stage <- rep.int("t1", 27)
rnets1SUBt1 <- rand1SUBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1SUBtx0 <- rand1SUBtx0$rich
rich1SUBtx0 <- rich1SUBtx0[complete.cases(rich1SUBtx0)]
small1SUBtx0 <- rand1SUBtx0$small
small1SUBtx0$Stage <- rep.int("t0", 23)
rnets1SUBtx0 <- rand1SUBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1SUBtx1 <- rand1SUBtx1$rich
rich1SUBtx1 <- rich1SUBtx1[complete.cases(rich1SUBtx1)]
small1SUBtx1 <- rand1SUBtx1$small
small1SUBtx1$Stage <- rep.int("t1", 23)
rnets1SUBtx1 <- rand1SUBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1SUBl0 <- rand1SUBl0$rich
rich1SUBl0 <- rich1SUBl0[complete.cases(rich1SUBl0)]
small1SUBl0 <- rand1SUBl0$small
small1SUBl0$Stage <- rep.int("t0", 12)
rnets1SUBl0 <- rand1SUBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1SUBl1 <- rand1SUBl1$rich
rich1SUBl1 <- rich1SUBl1[complete.cases(rich1SUBl1)]
small1SUBl1 <- rand1SUBl1$small
small1SUBl1$Stage <- rep.int("t1", 12)
rnets1SUBl1 <- rand1SUBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1SUBl2 <- rand1SUBl2$rich
rich1SUBl2 <- rich1SUBl2[complete.cases(rich1SUBl2)]
small1SUBl2 <- rand1SUBl2$small
small1SUBl2$Stage <- rep.int("t2", 12)
rnets1SUBl2 <- rand1SUBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1SUB <- rbindlist(list(small1SUBt0, small1SUBt1))
sw1SUBx <- rbindlist(list(small1SUBtx0, small1SUBtx1))
sw1SUBl <- rbindlist(list(small1SUBl0, small1SUBl1, small1SUBl2))