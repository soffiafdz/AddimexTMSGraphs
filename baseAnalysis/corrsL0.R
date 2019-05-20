
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

DeltaCONl0 <- CONl[Stage == "t2", c(..metrics, ..clinScales)] - 
    CONl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaCONl0 <- DeltaCONl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDANl0 <- DANl[Stage == "t2", c(..metrics, ..clinScales)] - 
    DANl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDANl0 <- DeltaDANl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDMNl0 <- DMNl[Stage == "t2", c(..metrics, ..clinScales)] - 
    DMNl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDMNl0 <- DeltaDMNl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaFPNl0 <- FPNl[Stage == "t2", c(..metrics, ..clinScales)] - 
    FPNl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaFPNl0 <- DeltaFPNl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSALl0 <- SALl[Stage == "t2", c(..metrics, ..clinScales)] - 
    SALl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSALl0 <- DeltaSALl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSUBl0 <- SUBl[Stage == "t2", c(..metrics, ..clinScales)] - 
    SUBl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSUBl0 <- DeltaSUBl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaVANl0 <- VANl[Stage == "t2", c(..metrics, ..clinScales)] - 
    VANl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaVANl0 <- DeltaVANl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaWBl0 <- WBl[Stage == "t2", c(..metrics, ..clinScales)] - 
    WBl[Stage == "t0", c(..metrics, ..clinScales)]

DeltaWBl0 <- DeltaWBl0 %>% 
    mutate(Study.ID = covars3$Study.ID) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

VasCONl0 <- DeltaCONl0[, cor.test(Val, VAS), by = Metric]
VasDANl0 <- DeltaDANl0[, cor.test(Val, VAS), by = Metric]
VasDMNl0 <- DeltaDMNl0[, cor.test(Val, VAS), by = Metric]
VasFPNl0 <- DeltaFPNl0[, cor.test(Val, VAS), by = Metric]
VasSALl0 <- DeltaSALl0[, cor.test(Val, VAS), by = Metric]
VasSUBl0 <- DeltaSUBl0[, cor.test(Val, VAS), by = Metric]
VasVANl0 <- DeltaVANl0[, cor.test(Val, VAS), by = Metric]
VasWBl0 <- DeltaWBl0[, cor.test(Val, VAS), by = Metric]


corrsVasL0 <- rbindlist(list(VasCONl0, VasDANl0, VasDMNl0, VasFPNl0, VasSALl0, VasSUBl0, VasVANl0, VasWBl0)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11cCONl0 <- DeltaCONl0[, cor.test(Val, B11_C), by = Metric]
B11cDANl0 <- DeltaDANl0[, cor.test(Val, B11_C), by = Metric]
B11cDMNl0 <- DeltaDMNl0[, cor.test(Val, B11_C), by = Metric]
B11cFPNl0 <- DeltaFPNl0[, cor.test(Val, B11_C), by = Metric]
B11cSALl0 <- DeltaSALl0[, cor.test(Val, B11_C), by = Metric]
B11cSUBl0 <- DeltaSUBl0[, cor.test(Val, B11_C), by = Metric]
B11cVANl0 <- DeltaVANl0[, cor.test(Val, B11_C), by = Metric]
B11cWBl0 <- DeltaWBl0[, cor.test(Val, B11_C), by = Metric]

corrsB11cL0 <- rbindlist(list(B11cCONl0, B11cDANl0, B11cDMNl0, B11cFPNl0, 
                              B11cSALl0, B11cSUBl0, B11cVANl0, B11cWBl0)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11mCONl0 <- DeltaCONl0[, cor.test(Val, B11_M), by = Metric]
B11mDANl0 <- DeltaDANl0[, cor.test(Val, B11_M), by = Metric]
B11mDMNl0 <- DeltaDMNl0[, cor.test(Val, B11_M), by = Metric]
B11mFPNl0 <- DeltaFPNl0[, cor.test(Val, B11_M), by = Metric]
B11mSALl0 <- DeltaSALl0[, cor.test(Val, B11_M), by = Metric]
B11mSUBl0 <- DeltaSUBl0[, cor.test(Val, B11_M), by = Metric]
B11mVANl0 <- DeltaVANl0[, cor.test(Val, B11_M), by = Metric]
B11mWBl0 <- DeltaWBl0[, cor.test(Val, B11_M), by = Metric]

corrsB11mL0 <- rbindlist(list(B11mCONl0, B11mDANl0, B11mDMNl0, B11mFPNl0, 
                              B11mSALl0, B11mSUBl0, B11mVANl0, B11mWBl0)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11npCONl0 <- DeltaCONl0[, cor.test(Val, B11_NP), by = Metric]
B11npDANl0 <- DeltaDANl0[, cor.test(Val, B11_NP), by = Metric]
B11npDMNl0 <- DeltaDMNl0[, cor.test(Val, B11_NP), by = Metric]
B11npFPNl0 <- DeltaFPNl0[, cor.test(Val, B11_NP), by = Metric]
B11npSALl0 <- DeltaSALl0[, cor.test(Val, B11_NP), by = Metric]
B11npSUBl0 <- DeltaSUBl0[, cor.test(Val, B11_NP), by = Metric]
B11npVANl0 <- DeltaVANl0[, cor.test(Val, B11_NP), by = Metric]
B11npWBl0 <- DeltaWBl0[, cor.test(Val, B11_NP), by = Metric]

corrsB11npL0 <- rbindlist(list(B11npCONl0, B11npDANl0, B11npDMNl0, B11npFPNl0, 
                               B11npSALl0, B11npSUBl0, B11npVANl0, B11npWBl0)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11tCONl0 <- DeltaCONl0[, cor.test(Val, B11_Tot), by = Metric]
B11tDANl0 <- DeltaDANl0[, cor.test(Val, B11_Tot), by = Metric]
B11tDMNl0 <- DeltaDMNl0[, cor.test(Val, B11_Tot), by = Metric]
B11tFPNl0 <- DeltaFPNl0[, cor.test(Val, B11_Tot), by = Metric]
B11tSALl0 <- DeltaSALl0[, cor.test(Val, B11_Tot), by = Metric]
B11tSUBl0 <- DeltaSUBl0[, cor.test(Val, B11_Tot), by = Metric]
B11tVANl0 <- DeltaVANl0[, cor.test(Val, B11_Tot), by = Metric]
B11tWBl0 <- DeltaWBl0[, cor.test(Val, B11_Tot), by = Metric]

corrsB11tL0 <- rbindlist(list(B11tCONl0, B11tDANl0, B11tDMNl0, B11tFPNl0, 
                              B11tSALl0, B11tSUBl0, B11tVANl0, B11tWBl0)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# Save tables ---------------------------------------------------------------------------------

write_csv(corrsVasL0, 'outData/tables/cVASL0.csv')
write_csv(corrsB11cL0, 'outData/tables/cB11cL0.csv')
write_csv(corrsB11mL0, 'outData/tables/cB11mL0.csv')
write_csv(corrsB11npL0, 'outData/tables/cB11nL0.csv')
write_csv(corrsB11tL0, 'outData/tables/cB11tL0.csv')
