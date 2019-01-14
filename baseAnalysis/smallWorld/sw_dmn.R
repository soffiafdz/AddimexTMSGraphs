
# Controls vs Users ---------------------------------------------------------------------------

richDMNvs <- randDMNvs$rich
richDMNvs <- richDMNvs[complete.cases(richDMNvs)]
smallDMNvs <- randDMNvs$small
rnetsDMNvs <- randDMNvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richDMNt0 <- randDMNt0$rich
richDMNt0 <- richDMNt0[complete.cases(richDMNt0)]
smallDMNt0 <- randDMNt0$small
smallDMNt0$Stage <- rep.int("t0", 27)
rnetsDMNt0 <- randDMNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richDMNt1 <- randDMNt1$rich
richDMNt1 <- richDMNt1[complete.cases(richDMNt1)]
smallDMNt1 <- randDMNt1$small
smallDMNt1$Stage <- rep.int("t1", 27)
rnetsDMNt1 <- randDMNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richDMNtx0 <- randDMNtx0$rich
richDMNtx0 <- richDMNtx0[complete.cases(richDMNtx0)]
smallDMNtx0 <- randDMNtx0$small
smallDMNtx0$Stage <- rep.int("t0", 23)
rnetsDMNtx0 <- randDMNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richDMNtx1 <- randDMNtx1$rich
richDMNtx1 <- richDMNtx1[complete.cases(richDMNtx1)]
smallDMNtx1 <- randDMNtx1$small
smallDMNtx1$Stage <- rep.int("t1", 23)
rnetsDMNtx1 <- randDMNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richDMNl0 <- randDMNl0$rich
richDMNl0 <- richDMNl0[complete.cases(richDMNl0)]
smallDMNl0 <- randDMNl0$small
smallDMNl0$Stage <- rep.int("t0", 12)
rnetsDMNl0 <- randDMNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richDMNl1 <- randDMNl1$rich
richDMNl1 <- richDMNl1[complete.cases(richDMNl1)]
smallDMNl1 <- randDMNl1$small
smallDMNl1$Stage <- rep.int("t1", 12)
rnetsDMNl1 <- randDMNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richDMNl2 <- randDMNl2$rich
richDMNl2 <- richDMNl2[complete.cases(richDMNl2)]
smallDMNl2 <- randDMNl2$small
smallDMNl2$Stage <- rep.int("t2", 12)
rnetsDMNl2 <- randDMNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swDMNvs <- smallDMNvs
swDMN <- rbindlist(list(smallDMNt0, smallDMNt1))
swDMNx <- rbindlist(list(smallDMNtx0, smallDMNtx1))
swDMNl <- rbindlist(list(smallDMNl0, smallDMNl1, smallDMNl2))