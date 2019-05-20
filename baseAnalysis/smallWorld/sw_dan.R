
# Controls vs Users ---------------------------------------------------------------------------

richDANvs <- randDANvs$rich
richDANvs <- richDANvs[complete.cases(richDANvs)]
smallDANvs <- randDANvs$small
rnetsDANvs <- randDANvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richDANt0 <- randDANt0$rich
richDANt0 <- richDANt0[complete.cases(richDANt0)]
smallDANt0 <- randDANt0$small
smallDANt0$Stage <- rep.int("t0", 27)
rnetsDANt0 <- randDANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richDANt1 <- randDANt1$rich
richDANt1 <- richDANt1[complete.cases(richDANt1)]
smallDANt1 <- randDANt1$small
smallDANt1$Stage <- rep.int("t1", 27)
rnetsDANt1 <- randDANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richDANtx0 <- randDANtx0$rich
richDANtx0 <- richDANtx0[complete.cases(richDANtx0)]
smallDANtx0 <- randDANtx0$small
smallDANtx0$Stage <- rep.int("t0", 23)
rnetsDANtx0 <- randDANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richDANtx1 <- randDANtx1$rich
richDANtx1 <- richDANtx1[complete.cases(richDANtx1)]
smallDANtx1 <- randDANtx1$small
smallDANtx1$Stage <- rep.int("t1", 23)
rnetsDANtx1 <- randDANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richDANl0 <- randDANl0$rich
richDANl0 <- richDANl0[complete.cases(richDANl0)]
smallDANl0 <- randDANl0$small
smallDANl0$Stage <- rep.int("t0", 12)
rnetsDANl0 <- randDANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richDANl1 <- randDANl1$rich
richDANl1 <- richDANl1[complete.cases(richDANl1)]
smallDANl1 <- randDANl1$small
smallDANl1$Stage <- rep.int("t1", 12)
rnetsDANl1 <- randDANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richDANl2 <- randDANl2$rich
richDANl2 <- richDANl2[complete.cases(richDANl2)]
smallDANl2 <- randDANl2$small
smallDANl2$Stage <- rep.int("t2", 12)
rnetsDANl2 <- randDANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swDANvs <- smallDANvs
swDAN <- rbindlist(list(smallDANt0, smallDANt1))
swDANx <- rbindlist(list(smallDANtx0, smallDANtx1))
swDANl <- rbindlist(list(smallDANl0, smallDANl1, smallDANl2))