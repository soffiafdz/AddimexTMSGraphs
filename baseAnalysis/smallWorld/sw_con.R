
# Controls vs Users ---------------------------------------------------------------------------

richCONvs <- randCONvs$rich
richCONvs <- richCONvs[complete.cases(richCONvs)]
smallCONvs <- randCONvs$small
rnetsCONvs <- randCONvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richCONt0 <- randCONt0$rich
richCONt0 <- richCONt0[complete.cases(richCONt0)]
smallCONt0 <- randCONt0$small
smallCONt0$Stage <- rep.int("t0", 27)
rnetsCONt0 <- randCONt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richCONt1 <- randCONt1$rich
richCONt1 <- richCONt1[complete.cases(richCONt1)]
smallCONt1 <- randCONt1$small
smallCONt1$Stage <- rep.int("t1", 27)
rnetsCONt1 <- randCONt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richCONtx0 <- randCONtx0$rich
richCONtx0 <- richCONtx0[complete.cases(richCONtx0)]
smallCONtx0 <- randCONtx0$small
smallCONtx0$Stage <- rep.int("t0", 23)
rnetsCONtx0 <- randCONtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richCONtx1 <- randCONtx1$rich
richCONtx1 <- richCONtx1[complete.cases(richCONtx1)]
smallCONtx1 <- randCONtx1$small
smallCONtx1$Stage <- rep.int("t1", 23)
rnetsCONtx1 <- randCONtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richCONl0 <- randCONl0$rich
richCONl0 <- richCONl0[complete.cases(richCONl0)]
smallCONl0 <- randCONl0$small
smallCONl0$Stage <- rep.int("t0", 12)
rnetsCONl0 <- randCONl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richCONl1 <- randCONl1$rich
richCONl1 <- richCONl1[complete.cases(richCONl1)]
smallCONl1 <- randCONl1$small
smallCONl1$Stage <- rep.int("t1", 12)
rnetsCONl1 <- randCONl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richCONl2 <- randCONl2$rich
richCONl2 <- richCONl2[complete.cases(richCONl2)]
smallCONl2 <- randCONl2$small
smallCONl2$Stage <- rep.int("t2", 12)
rnetsCONl2 <- randCONl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swCONvs <- smallCONvs
swCON <- rbindlist(list(smallCONt0, smallCONt1))
swCONx <- rbindlist(list(smallCONtx0, smallCONtx1))
swCONl <- rbindlist(list(smallCONl0, smallCONl1, smallCONl2))