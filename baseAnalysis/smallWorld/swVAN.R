
# Controls vs Users ---------------------------------------------------------------------------

# richVANvs <- randVANvs$rich
# smallVANvs <- randVANvs$small
# rnetsVANvs <- randVANvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richVANt0 <- randVANt0$rich
smallVANt0 <- randVANt0$small[, Stage := rep.int("t0", 31)]
rnetsVANt0 <- randVANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richVANt1 <- randVANt1$rich
smallVANt1 <- randVANt1$small[, Stage := rep.int("t1", 31)]
rnetsVANt1 <- randVANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richVANpre <- randVANpre$rich
# smallVANpre <- randVANpre$small[, Stage := rep.int("t0", 27)]
# rnetsVANpre <- randVANpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richVANpost <- randVANpost$rich
# smallVANpost <- randVANpost$small[, Stage := rep.int("t1", 27)]
# rnetsVANpost <- randVANpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richVANl0 <- randVANl0$rich
# smallVANl0 <- randVANl0$small[, Stage := rep.int("t0", 15)]
# rnetsVANl0 <- randVANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richVANl1 <- randVANl1$rich
# smallVANl1 <- randVANl1$small[, Stage := rep.int("t1", 15)]
# rnetsVANl1 <- randVANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richVANl2 <- randVANl2$rich
# smallVANl2 <- randVANl2$small[, Stage := rep.int("t2", 15)]
# rnetsVANl2 <- randVANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swVANvs <- smallVANvs
swVAN <- rbindlist(list(smallVANt0, smallVANt1))
# swVANx <- rbindlist(list(smallVANpre, smallVANpost))
# swVANl <- rbindlist(list(smallVANl0, smallVANl1, smallVANl2))