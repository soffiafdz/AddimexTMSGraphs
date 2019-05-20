
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

DeltaCON <- CON[Stage == "t1", c(..metrics, ..clinScales)] - 
    CON[Stage == "t0", c(..metrics, ..clinScales)]

DeltaCON <- DeltaCON %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDAN <- DAN[Stage == "t1", c(..metrics, ..clinScales)] - 
    DAN[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDAN <- DeltaDAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDMN <- DMN[Stage == "t1", c(..metrics, ..clinScales)] - 
    DMN[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDMN <- DeltaDMN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaFPN <- FPN[Stage == "t1", c(..metrics, ..clinScales)] - 
    FPN[Stage == "t0", c(..metrics, ..clinScales)]

DeltaFPN <- DeltaFPN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSAL <- SAL[Stage == "t1", c(..metrics, ..clinScales)] - 
    SAL[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSAL <- DeltaSAL %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSUB <- SUB[Stage == "t1", c(..metrics, ..clinScales)] - 
    SUB[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSUB <- DeltaSUB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaVAN <- VAN[Stage == "t1", c(..metrics, ..clinScales)] - 
    VAN[Stage == "t0", c(..metrics, ..clinScales)]

DeltaVAN <- DeltaVAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaWB <- WB[Stage == "t1", c(..metrics, ..clinScales)] - 
    WB[Stage == "t0", c(..metrics, ..clinScales)]

DeltaWB <- DeltaWB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

VasCON <- DeltaCON[, cor.test(Val, VAS), by = Metric]
VasDAN <- DeltaDAN[, cor.test(Val, VAS), by = Metric]
VasDMN <- DeltaDMN[, cor.test(Val, VAS), by = Metric]
VasFPN <- DeltaFPN[, cor.test(Val, VAS), by = Metric]
VasSAL <- DeltaSAL[, cor.test(Val, VAS), by = Metric]
VasSUB <- DeltaSUB[, cor.test(Val, VAS), by = Metric]
VasVAN <- DeltaVAN[, cor.test(Val, VAS), by = Metric]
VasWB <- DeltaWB[, cor.test(Val, VAS), by = Metric]


corrsVas <- rbindlist(list(VasCON, VasDAN, VasDMN, VasFPN, VasSAL, VasSUB, VasVAN, VasWB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11cCON <- DeltaCON[, cor.test(Val, B11_C), by = Metric]
B11cDAN <- DeltaDAN[, cor.test(Val, B11_C), by = Metric]
B11cDMN <- DeltaDMN[, cor.test(Val, B11_C), by = Metric]
B11cFPN <- DeltaFPN[, cor.test(Val, B11_C), by = Metric]
B11cSAL <- DeltaSAL[, cor.test(Val, B11_C), by = Metric]
B11cSUB <- DeltaSUB[, cor.test(Val, B11_C), by = Metric]
B11cVAN <- DeltaVAN[, cor.test(Val, B11_C), by = Metric]
B11cWB <- DeltaWB[, cor.test(Val, B11_C), by = Metric]

corrsB11c <- rbindlist(list(B11cCON, B11cDAN, B11cDMN, B11cFPN, 
                            B11cSAL, B11cSUB, B11cVAN, B11cWB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11mCON <- DeltaCON[, cor.test(Val, B11_M), by = Metric]
B11mDAN <- DeltaDAN[, cor.test(Val, B11_M), by = Metric]
B11mDMN <- DeltaDMN[, cor.test(Val, B11_M), by = Metric]
B11mFPN <- DeltaFPN[, cor.test(Val, B11_M), by = Metric]
B11mSAL <- DeltaSAL[, cor.test(Val, B11_M), by = Metric]
B11mSUB <- DeltaSUB[, cor.test(Val, B11_M), by = Metric]
B11mVAN <- DeltaVAN[, cor.test(Val, B11_M), by = Metric]
B11mWB <- DeltaWB[, cor.test(Val, B11_M), by = Metric]

corrsB11m <- rbindlist(list(B11mCON, B11mDAN, B11mDMN, B11mFPN, 
                            B11mSAL, B11mSUB, B11mVAN, B11mWB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11npCON <- DeltaCON[, cor.test(Val, B11_NP), by = Metric]
B11npDAN <- DeltaDAN[, cor.test(Val, B11_NP), by = Metric]
B11npDMN <- DeltaDMN[, cor.test(Val, B11_NP), by = Metric]
B11npFPN <- DeltaFPN[, cor.test(Val, B11_NP), by = Metric]
B11npSAL <- DeltaSAL[, cor.test(Val, B11_NP), by = Metric]
B11npSUB <- DeltaSUB[, cor.test(Val, B11_NP), by = Metric]
B11npVAN <- DeltaVAN[, cor.test(Val, B11_NP), by = Metric]
B11npWB <- DeltaWB[, cor.test(Val, B11_NP), by = Metric]

corrsB11np <- rbindlist(list(B11npCON, B11npDAN, B11npDMN, B11npFPN, 
                             B11npSAL, B11npSUB, B11npVAN, B11npWB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11tCON <- DeltaCON[, cor.test(Val, B11_Tot), by = Metric]
B11tDAN <- DeltaDAN[, cor.test(Val, B11_Tot), by = Metric]
B11tDMN <- DeltaDMN[, cor.test(Val, B11_Tot), by = Metric]
B11tFPN <- DeltaFPN[, cor.test(Val, B11_Tot), by = Metric]
B11tSAL <- DeltaSAL[, cor.test(Val, B11_Tot), by = Metric]
B11tSUB <- DeltaSUB[, cor.test(Val, B11_Tot), by = Metric]
B11tVAN <- DeltaVAN[, cor.test(Val, B11_Tot), by = Metric]
B11tWB <- DeltaWB[, cor.test(Val, B11_Tot), by = Metric]

corrsB11t <- rbindlist(list(B11tCON, B11tDAN, B11tDMN, B11tFPN, 
                            B11tSAL, B11tSUB, B11tVAN, B11tWB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# Save tables ---------------------------------------------------------------------------------

write_csv(corrsVas, 'outData/tables/cVAS.csv')
write_csv(corrsB11c, 'outData/tables/cB11c.csv')
write_csv(corrsB11m, 'outData/tables/cB11m.csv')
write_csv(corrsB11np, 'outData/tables/cB11n.csv')
write_csv(corrsB11t, 'outData/tables/cB11t.csv')
