
# Controls vs Users ---------------------------------------------------------------------------

# richDMNvs <- randDMNvs$rich
# smallDMNvs <- randDMNvs$small
# rnetsDMNvs <- randDMNvs$rand

# Closed label: T0 ----------------------------------------------------------------------------

richDMNt0 <- randDMNt0$rich
smallDMNt0 <- randDMNt0$small[, Stage := rep.int("t0", 31)]
rnetsDMNt0 <- randDMNt0$rand

# Closed label: T1 ----------------------------------------------------------------------------

richDMNt1 <- randDMNt1$rich
smallDMNt1 <- randDMNt1$small[, Stage := rep.int("t1", 31)]
rnetsDMNt1 <- randDMNt1$rand

# Open label: T0 ------------------------------------------------------------------------------

# richDMNpre <- randDMNpre$rich
# smallDMNpre <- randDMNpre$small[, Stage := rep.int("t0", 27)]
# rnetsDMNpre <- randDMNpre$rand

# Open label: T1 ------------------------------------------------------------------------------

# richDMNpost <- randDMNpost$rich
# smallDMNpost <- randDMNpost$small[, Stage := rep.int("t1", 27)]
# rnetsDMNpost <- randDMNpost$rand

# Longitudinal: T0 ----------------------------------------------------------------------------

# richDMNl0 <- randDMNl0$rich
# smallDMNl0 <- randDMNl0$small[, Stage := rep.int("t0", 15)]
# rnetsDMNl0 <- randDMNl0$rand

# Longitudinal: T1 ----------------------------------------------------------------------------

# richDMNl1 <- randDMNl1$rich
# smallDMNl1 <- randDMNl1$small[, Stage := rep.int("t1", 15)]
# rnetsDMNl1 <- randDMNl1$rand

# Longitudinal: T2 ----------------------------------------------------------------------------

# richDMNl2 <- randDMNl2$rich
# smallDMNl2 <- randDMNl2$small[, Stage := rep.int("t2", 15)]
# rnetsDMNl2 <- randDMNl2$rand


# Data tables of small-worldness --------------------------------------------------------------

# swDMNvs <- smallDMNvs
swDMN <- rbindlist(list(smallDMNt0, smallDMNt1))
# swDMNx <- rbindlist(list(smallDMNpre, smallDMNpost))
# swDMNl <- rbindlist(list(smallDMNl0, smallDMNl1, smallDMNl2))