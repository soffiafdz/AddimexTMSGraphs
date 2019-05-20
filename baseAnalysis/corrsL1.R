
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

DeltaCONl1 <- CONl[Stage == "t2", c(..metrics, ..clinScales)] - 
    CONl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaCONl1 <- DeltaCONl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDANl1 <- DANl[Stage == "t2", c(..metrics, ..clinScales)] - 
    DANl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaDANl1 <- DeltaDANl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDMNl1 <- DMNl[Stage == "t2", c(..metrics, ..clinScales)] - 
    DMNl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaDMNl1 <- DeltaDMNl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaFPNl1 <- FPNl[Stage == "t2", c(..metrics, ..clinScales)] - 
    FPNl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaFPNl1 <- DeltaFPNl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSALl1 <- SALl[Stage == "t2", c(..metrics, ..clinScales)] - 
    SALl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaSALl1 <- DeltaSALl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSUBl1 <- SUBl[Stage == "t2", c(..metrics, ..clinScales)] - 
    SUBl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaSUBl1 <- DeltaSUBl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaVANl1 <- VANl[Stage == "t2", c(..metrics, ..clinScales)] - 
    VANl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaVANl1 <- DeltaVANl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaWBl1 <- WBl[Stage == "t2", c(..metrics, ..clinScales)] - 
    WBl[Stage == "t1", c(..metrics, ..clinScales)]

DeltaWBl1 <- DeltaWBl1 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

VasCONl1 <- DeltaCONl1[, cor.test(Val, VAS), by = Metric]
VasDANl1 <- DeltaDANl1[, cor.test(Val, VAS), by = Metric]
VasDMNl1 <- DeltaDMNl1[, cor.test(Val, VAS), by = Metric]
VasFPNl1 <- DeltaFPNl1[, cor.test(Val, VAS), by = Metric]
VasSALl1 <- DeltaSALl1[, cor.test(Val, VAS), by = Metric]
VasSUBl1 <- DeltaSUBl1[, cor.test(Val, VAS), by = Metric]
VasVANl1 <- DeltaVANl1[, cor.test(Val, VAS), by = Metric]
VasWBl1 <- DeltaWBl1[, cor.test(Val, VAS), by = Metric]


corrsVasL1 <- rbindlist(list(VasCONl1, VasDANl1, VasDMNl1, VasFPNl1, VasSALl1, VasSUBl1, VasVANl1, VasWBl1)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11cCONl1 <- DeltaCONl1[, cor.test(Val, B11_C), by = Metric]
B11cDANl1 <- DeltaDANl1[, cor.test(Val, B11_C), by = Metric]
B11cDMNl1 <- DeltaDMNl1[, cor.test(Val, B11_C), by = Metric]
B11cFPNl1 <- DeltaFPNl1[, cor.test(Val, B11_C), by = Metric]
B11cSALl1 <- DeltaSALl1[, cor.test(Val, B11_C), by = Metric]
B11cSUBl1 <- DeltaSUBl1[, cor.test(Val, B11_C), by = Metric]
B11cVANl1 <- DeltaVANl1[, cor.test(Val, B11_C), by = Metric]
B11cWBl1 <- DeltaWBl1[, cor.test(Val, B11_C), by = Metric]

corrsB11cL1 <- rbindlist(list(B11cCONl1, B11cDANl1, B11cDMNl1, B11cFPNl1, 
                              B11cSALl1, B11cSUBl1, B11cVANl1, B11cWBl1)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11mCONl1 <- DeltaCONl1[, cor.test(Val, B11_M), by = Metric]
B11mDANl1 <- DeltaDANl1[, cor.test(Val, B11_M), by = Metric]
B11mDMNl1 <- DeltaDMNl1[, cor.test(Val, B11_M), by = Metric]
B11mFPNl1 <- DeltaFPNl1[, cor.test(Val, B11_M), by = Metric]
B11mSALl1 <- DeltaSALl1[, cor.test(Val, B11_M), by = Metric]
B11mSUBl1 <- DeltaSUBl1[, cor.test(Val, B11_M), by = Metric]
B11mVANl1 <- DeltaVANl1[, cor.test(Val, B11_M), by = Metric]
B11mWBl1 <- DeltaWBl1[, cor.test(Val, B11_M), by = Metric]

corrsB11mL1 <- rbindlist(list(B11mCONl1, B11mDANl1, B11mDMNl1, B11mFPNl1, 
                              B11mSALl1, B11mSUBl1, B11mVANl1, B11mWBl1)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11npCONl1 <- DeltaCONl1[, cor.test(Val, B11_NP), by = Metric]
B11npDANl1 <- DeltaDANl1[, cor.test(Val, B11_NP), by = Metric]
B11npDMNl1 <- DeltaDMNl1[, cor.test(Val, B11_NP), by = Metric]
B11npFPNl1 <- DeltaFPNl1[, cor.test(Val, B11_NP), by = Metric]
B11npSALl1 <- DeltaSALl1[, cor.test(Val, B11_NP), by = Metric]
B11npSUBl1 <- DeltaSUBl1[, cor.test(Val, B11_NP), by = Metric]
B11npVANl1 <- DeltaVANl1[, cor.test(Val, B11_NP), by = Metric]
B11npWBl1 <- DeltaWBl1[, cor.test(Val, B11_NP), by = Metric]

corrsB11npL1 <- rbindlist(list(B11npCONl1, B11npDANl1, B11npDMNl1, B11npFPNl1, 
                               B11npSALl1, B11npSUBl1, B11npVANl1, B11npWBl1)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11tCONl1 <- DeltaCONl1[, cor.test(Val, B11_Tot), by = Metric]
B11tDANl1 <- DeltaDANl1[, cor.test(Val, B11_Tot), by = Metric]
B11tDMNl1 <- DeltaDMNl1[, cor.test(Val, B11_Tot), by = Metric]
B11tFPNl1 <- DeltaFPNl1[, cor.test(Val, B11_Tot), by = Metric]
B11tSALl1 <- DeltaSALl1[, cor.test(Val, B11_Tot), by = Metric]
B11tSUBl1 <- DeltaSUBl1[, cor.test(Val, B11_Tot), by = Metric]
B11tVANl1 <- DeltaVANl1[, cor.test(Val, B11_Tot), by = Metric]
B11tWBl1 <- DeltaWBl1[, cor.test(Val, B11_Tot), by = Metric]

corrsB11tL1 <- rbindlist(list(B11tCONl1, B11tDANl1, B11tDMNl1, B11tFPNl1, 
                              B11tSALl1, B11tSUBl1, B11tVANl1, B11tWBl1)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# Save tables ---------------------------------------------------------------------------------

write_csv(corrsVasL1, 'outData/tables/cVASL1.csv')
write_csv(corrsB11cL1, 'outData/tables/cB11cL1.csv')
write_csv(corrsB11mL1, 'outData/tables/cB11mL1.csv')
write_csv(corrsB11npL1, 'outData/tables/cB11nL1.csv')
write_csv(corrsB11tL1, 'outData/tables/cB11tL1.csv')
