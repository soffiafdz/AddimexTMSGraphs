
# Controls vs Users ---------------------------------------------------------------------------

richFPNvs <- randFPNvs$rich
richFPNvs <- richFPNvs[complete.cases(richFPNvs)]
smallFPNvs <- randFPNvs$small
rnetsFPNvs <- randFPNvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richFPNt0 <- randFPNt0$rich
richFPNt0 <- richFPNt0[complete.cases(richFPNt0)]
smallFPNt0 <- randFPNt0$small
smallFPNt0$Stage <- rep.int("t0", 27)
rnetsFPNt0 <- randFPNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richFPNt1 <- randFPNt1$rich
richFPNt1 <- richFPNt1[complete.cases(richFPNt1)]
smallFPNt1 <- randFPNt1$small
smallFPNt1$Stage <- rep.int("t1", 27)
rnetsFPNt1 <- randFPNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richFPNtx0 <- randFPNtx0$rich
richFPNtx0 <- richFPNtx0[complete.cases(richFPNtx0)]
smallFPNtx0 <- randFPNtx0$small
smallFPNtx0$Stage <- rep.int("t0", 23)
rnetsFPNtx0 <- randFPNtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richFPNtx1 <- randFPNtx1$rich
richFPNtx1 <- richFPNtx1[complete.cases(richFPNtx1)]
smallFPNtx1 <- randFPNtx1$small
smallFPNtx1$Stage <- rep.int("t1", 23)
rnetsFPNtx1 <- randFPNtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richFPNl0 <- randFPNl0$rich
richFPNl0 <- richFPNl0[complete.cases(richFPNl0)]
smallFPNl0 <- randFPNl0$small
smallFPNl0$Stage <- rep.int("t0", 12)
rnetsFPNl0 <- randFPNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richFPNl1 <- randFPNl1$rich
richFPNl1 <- richFPNl1[complete.cases(richFPNl1)]
smallFPNl1 <- randFPNl1$small
smallFPNl1$Stage <- rep.int("t1", 12)
rnetsFPNl1 <- randFPNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richFPNl2 <- randFPNl2$rich
richFPNl2 <- richFPNl2[complete.cases(richFPNl2)]
smallFPNl2 <- randFPNl2$small
smallFPNl2$Stage <- rep.int("t2", 12)
rnetsFPNl2 <- randFPNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swFPNvs <- smallFPNvs
swFPN <- rbindlist(list(smallFPNt0, smallFPNt1))
swFPNx <- rbindlist(list(smallFPNtx0, smallFPNtx1))
swFPNl <- rbindlist(list(smallFPNl0, smallFPNl1, smallFPNl2))