
# Controls vs Users ---------------------------------------------------------------------------

# richDANvs <- randDANvs$rich
# smallDANvs <- randDANvs$small
# rnetsDANvs <- randDANvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richDANt0 <- randDANt0$rich
smallDANt0 <- randDANt0$small[, Stage := rep.int("t0", 31)]
rnetsDANt0 <- randDANt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richDANt1 <- randDANt1$rich
smallDANt1 <- randDANt1$small[, Stage := rep.int("t1", 31)]
rnetsDANt1 <- randDANt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richDANpre <- randDANpre$rich
# smallDANpre <- randDANpre$small[, Stage := rep.int("t0", 27)]
# rnetsDANpre <- randDANpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richDANpost <- randDANpost$rich
# smallDANpost <- randDANpost$small[, Stage := rep.int("t1", 27)]
# rnetsDANpost <- randDANpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richDANl0 <- randDANl0$rich
# smallDANl0 <- randDANl0$small[, Stage := rep.int("t0", 15)]
# rnetsDANl0 <- randDANl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richDANl1 <- randDANl1$rich
# smallDANl1 <- randDANl1$small[, Stage := rep.int("t1", 15)]
# rnetsDANl1 <- randDANl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richDANl2 <- randDANl2$rich
# smallDANl2 <- randDANl2$small[, Stage := rep.int("t2", 15)]
# rnetsDANl2 <- randDANl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swDANvs <- smallDANvs
swDAN <- rbindlist(list(smallDANt0, smallDANt1))
# swDANx <- rbindlist(list(smallDANpre, smallDANpost))
# swDANl <- rbindlist(list(smallDANl0, smallDANl1, smallDANl2))