
# Closed label: T0 ----------------------------------------------------------------------------

rich1WBt0 <- rand1WBt0$rich
rich1WBt0 <- rich1WBt0[complete.cases(rich1WBt0)]
small1WBt0 <- rand1WBt0$small
small1WBt0$Stage <- rep.int("t0", 27)
rnets1WBt0 <- rand1WBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1WBt1 <- rand1WBt1$rich
rich1WBt1 <- rich1WBt1[complete.cases(rich1WBt1)]
small1WBt1 <- rand1WBt1$small
small1WBt1$Stage <- rep.int("t1", 27)
rnets1WBt1 <- rand1WBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1WBtx0 <- rand1WBtx0$rich
rich1WBtx0 <- rich1WBtx0[complete.cases(rich1WBtx0)]
small1WBtx0 <- rand1WBtx0$small
small1WBtx0$Stage <- rep.int("t0", 23)
rnets1WBtx0 <- rand1WBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1WBtx1 <- rand1WBtx1$rich
rich1WBtx1 <- rich1WBtx1[complete.cases(rich1WBtx1)]
small1WBtx1 <- rand1WBtx1$small
small1WBtx1$Stage <- rep.int("t1", 23)
rnets1WBtx1 <- rand1WBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1WBl0 <- rand1WBl0$rich
rich1WBl0 <- rich1WBl0[complete.cases(rich1WBl0)]
small1WBl0 <- rand1WBl0$small
small1WBl0$Stage <- rep.int("t0", 12)
rnets1WBl0 <- rand1WBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1WBl1 <- rand1WBl1$rich
rich1WBl1 <- rich1WBl1[complete.cases(rich1WBl1)]
small1WBl1 <- rand1WBl1$small
small1WBl1$Stage <- rep.int("t1", 12)
rnets1WBl1 <- rand1WBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1WBl2 <- rand1WBl2$rich
rich1WBl2 <- rich1WBl2[complete.cases(rich1WBl2)]
small1WBl2 <- rand1WBl2$small
small1WBl2$Stage <- rep.int("t2", 12)
rnets1WBl2 <- rand1WBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1WB <- rbindlist(list(small1WBt0, small1WBt1))
sw1WBx <- rbindlist(list(small1WBtx0, small1WBtx1))
sw1WBl <- rbindlist(list(small1WBl0, small1WBl1, small1WBl2))