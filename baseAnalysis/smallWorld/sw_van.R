
# Controls vs Users ---------------------------------------------------------------------------

# richVANvs <- randVANvs$rich
# richVANvs <- richVANvs[complete.cases(richVANvs)]
# smallVANvs <- randVANvs$small
# rnetsVANvs <- randVANvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richVANt0 <- randVANt0$rich
richVANt0 <- richVANt0[complete.cases(richVANt0)]
smallVANt0 <- randVANt0$small
smallVANt0$Stage <- rep.int("t0", 27)
rnetsVANt0 <- randVANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richVANt1 <- randVANt1$rich
richVANt1 <- richVANt1[complete.cases(richVANt1)]
smallVANt1 <- randVANt1$small
smallVANt1$Stage <- rep.int("t1", 27)
rnetsVANt1 <- randVANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richVANtx0 <- randVANtx0$rich
richVANtx0 <- richVANtx0[complete.cases(richVANtx0)]
smallVANtx0 <- randVANtx0$small
smallVANtx0$Stage <- rep.int("t0", 23)
rnetsVANtx0 <- randVANtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richVANtx1 <- randVANtx1$rich
richVANtx1 <- richVANtx1[complete.cases(richVANtx1)]
smallVANtx1 <- randVANtx1$small
smallVANtx1$Stage <- rep.int("t1", 23)
rnetsVANtx1 <- randVANtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richVANl0 <- randVANl0$rich
richVANl0 <- richVANl0[complete.cases(richVANl0)]
smallVANl0 <- randVANl0$small
smallVANl0$Stage <- rep.int("t0", 12)
rnetsVANl0 <- randVANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richVANl1 <- randVANl1$rich
richVANl1 <- richVANl1[complete.cases(richVANl1)]
smallVANl1 <- randVANl1$small
smallVANl1$Stage <- rep.int("t1", 12)
rnetsVANl1 <- randVANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richVANl2 <- randVANl2$rich
richVANl2 <- richVANl2[complete.cases(richVANl2)]
smallVANl2 <- randVANl2$small
smallVANl2$Stage <- rep.int("t2", 12)
rnetsVANl2 <- randVANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swVANvs <- smallVANvs
swVAN <- rbindlist(list(smallVANt0, smallVANt1))
swVANx <- rbindlist(list(smallVANtx0, smallVANtx1))
swVANl <- rbindlist(list(smallVANl0, smallVANl1, smallVANl2))