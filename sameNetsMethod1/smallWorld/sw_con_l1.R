
# Closed label: T0 ----------------------------------------------------------------------------

rich1CONt0 <- rand1CONt0$rich
rich1CONt0 <- rich1CONt0[complete.cases(rich1CONt0)]
small1CONt0 <- rand1CONt0$small
small1CONt0$Stage <- rep.int("t0", 27)
rnets1CONt0 <- rand1CONt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

rich1CONt1 <- rand1CONt1$rich
rich1CONt1 <- rich1CONt1[complete.cases(rich1CONt1)]
small1CONt1 <- rand1CONt1$small
small1CONt1$Stage <- rep.int("t1", 27)
rnets1CONt1 <- rand1CONt1$rand

# Open label: T0 ------------------------------------------------------------------------------

rich1CONtx0 <- rand1CONtx0$rich
rich1CONtx0 <- rich1CONtx0[complete.cases(rich1CONtx0)]
small1CONtx0 <- rand1CONtx0$small
small1CONtx0$Stage <- rep.int("t0", 23)
rnets1CONtx0 <- rand1CONtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

rich1CONtx1 <- rand1CONtx1$rich
rich1CONtx1 <- rich1CONtx1[complete.cases(rich1CONtx1)]
small1CONtx1 <- rand1CONtx1$small
small1CONtx1$Stage <- rep.int("t1", 23)
rnets1CONtx1 <- rand1CONtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

rich1CONl0 <- rand1CONl0$rich
rich1CONl0 <- rich1CONl0[complete.cases(rich1CONl0)]
small1CONl0 <- rand1CONl0$small
small1CONl0$Stage <- rep.int("t0", 12)
rnets1CONl0 <- rand1CONl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

rich1CONl1 <- rand1CONl1$rich
rich1CONl1 <- rich1CONl1[complete.cases(rich1CONl1)]
small1CONl1 <- rand1CONl1$small
small1CONl1$Stage <- rep.int("t1", 12)
rnets1CONl1 <- rand1CONl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

rich1CONl2 <- rand1CONl2$rich
rich1CONl2 <- rich1CONl2[complete.cases(rich1CONl2)]
small1CONl2 <- rand1CONl2$small
small1CONl2$Stage <- rep.int("t2", 12)
rnets1CONl2 <- rand1CONl2$rand


# Data tables of small-worldness --------------------------------------------------------------

sw1CON <- rbindlist(list(small1CONt0, small1CONt1))
sw1CONx <- rbindlist(list(small1CONtx0, small1CONtx1))
sw1CONl <- rbindlist(list(small1CONl0, small1CONl1, small1CONl2))
