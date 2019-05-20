
# Controls vs Users ---------------------------------------------------------------------------

richWBvs <- randWBvs$rich
richWBvs <- richWBvs[complete.cases(richWBvs)]
smallWBvs <- randWBvs$small
rnetsWBvs <- randWBvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richWBt0 <- randWBt0$rich
richWBt0 <- richWBt0[complete.cases(richWBt0)]
smallWBt0 <- randWBt0$small
smallWBt0$Stage <- rep.int("t0", 27)
rnetsWBt0 <- randWBt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richWBt1 <- randWBt1$rich
richWBt1 <- richWBt1[complete.cases(richWBt1)]
smallWBt1 <- randWBt1$small
smallWBt1$Stage <- rep.int("t1", 27)
rnetsWBt1 <- randWBt1$rand

# Open label: T0 ------------------------------------------------------------------------------

richWBtx0 <- randWBtx0$rich
richWBtx0 <- richWBtx0[complete.cases(richWBtx0)]
smallWBtx0 <- randWBtx0$small
smallWBtx0$Stage <- rep.int("t0", 23)
rnetsWBtx0 <- randWBtx0$rand

# Open label: T1 ------------------------------------------------------------------------------

richWBtx1 <- randWBtx1$rich
richWBtx1 <- richWBtx1[complete.cases(richWBtx1)]
smallWBtx1 <- randWBtx1$small
smallWBtx1$Stage <- rep.int("t1", 23)
rnetsWBtx1 <- randWBtx1$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

richWBl0 <- randWBl0$rich
richWBl0 <- richWBl0[complete.cases(richWBl0)]
smallWBl0 <- randWBl0$small
smallWBl0$Stage <- rep.int("t0", 12)
rnetsWBl0 <- randWBl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

richWBl1 <- randWBl1$rich
richWBl1 <- richWBl1[complete.cases(richWBl1)]
smallWBl1 <- randWBl1$small
smallWBl1$Stage <- rep.int("t1", 12)
rnetsWBl1 <- randWBl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

richWBl2 <- randWBl2$rich
richWBl2 <- richWBl2[complete.cases(richWBl2)]
smallWBl2 <- randWBl2$small
smallWBl2$Stage <- rep.int("t2", 12)
rnetsWBl2 <- randWBl2$rand


# Data tables of small-worldness --------------------------------------------------------------

swWBvs <- smallWBvs
swWB <- rbindlist(list(smallWBt0, smallWBt1))
swWBx <- rbindlist(list(smallWBtx0, smallWBtx1))
swWBl <- rbindlist(list(smallWBl0, smallWBl1, smallWBl2))