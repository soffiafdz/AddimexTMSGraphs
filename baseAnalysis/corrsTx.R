
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

DeltaCONtx <- CONtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    CONtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaCONtx <- DeltaCONtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDANtx <- DANtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    DANtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDANtx <- DeltaDANtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaDMNtx <- DMNtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    DMNtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaDMNtx <- DeltaDMNtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaFPNtx <- FPNtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    FPNtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaFPNtx <- DeltaFPNtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSALtx <- SALtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    SALtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSALtx <- DeltaSALtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaSUBtx <- SUBtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    SUBtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaSUBtx <- DeltaSUBtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaVANtx <- VANtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    VANtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaVANtx <- DeltaVANtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


DeltaWBtx <- WBtx[Stage == "t1", c(..metrics, ..clinScales)] - 
    WBtx[Stage == "t0", c(..metrics, ..clinScales)]

DeltaWBtx <- DeltaWBtx %>% 
    mutate(Study.ID = covars2$Study.ID[-5]) %>% 
    select(15, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

VasCONtx <- DeltaCONtx[, cor.test(Val, VAS), by = Metric]
VasDANtx <- DeltaDANtx[, cor.test(Val, VAS), by = Metric]
VasDMNtx <- DeltaDMNtx[, cor.test(Val, VAS), by = Metric]
VasFPNtx <- DeltaFPNtx[, cor.test(Val, VAS), by = Metric]
VasSALtx <- DeltaSALtx[, cor.test(Val, VAS), by = Metric]
VasSUBtx <- DeltaSUBtx[, cor.test(Val, VAS), by = Metric]
VasVANtx <- DeltaVANtx[, cor.test(Val, VAS), by = Metric]
VasWBtx <- DeltaWBtx[, cor.test(Val, VAS), by = Metric]


corrsVasTx <- rbindlist(list(VasCONtx, VasDANtx, VasDMNtx, VasFPNtx, VasSALtx, VasSUBtx, VasVANtx, VasWBtx)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11cCONtx <- DeltaCONtx[, cor.test(Val, B11_C), by = Metric]
B11cDANtx <- DeltaDANtx[, cor.test(Val, B11_C), by = Metric]
B11cDMNtx <- DeltaDMNtx[, cor.test(Val, B11_C), by = Metric]
B11cFPNtx <- DeltaFPNtx[, cor.test(Val, B11_C), by = Metric]
B11cSALtx <- DeltaSALtx[, cor.test(Val, B11_C), by = Metric]
B11cSUBtx <- DeltaSUBtx[, cor.test(Val, B11_C), by = Metric]
B11cVANtx <- DeltaVANtx[, cor.test(Val, B11_C), by = Metric]
B11cWBtx <- DeltaWBtx[, cor.test(Val, B11_C), by = Metric]

corrsB11cTx <- rbindlist(list(B11cCONtx, B11cDANtx, B11cDMNtx, B11cFPNtx, 
                            B11cSALtx, B11cSUBtx, B11cVANtx, B11cWBtx)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11mCONtx <- DeltaCONtx[, cor.test(Val, B11_M), by = Metric]
B11mDANtx <- DeltaDANtx[, cor.test(Val, B11_M), by = Metric]
B11mDMNtx <- DeltaDMNtx[, cor.test(Val, B11_M), by = Metric]
B11mFPNtx <- DeltaFPNtx[, cor.test(Val, B11_M), by = Metric]
B11mSALtx <- DeltaSALtx[, cor.test(Val, B11_M), by = Metric]
B11mSUBtx <- DeltaSUBtx[, cor.test(Val, B11_M), by = Metric]
B11mVANtx <- DeltaVANtx[, cor.test(Val, B11_M), by = Metric]
B11mWBtx <- DeltaWBtx[, cor.test(Val, B11_M), by = Metric]

corrsB11mTx <- rbindlist(list(B11mCONtx, B11mDANtx, B11mDMNtx, B11mFPNtx, 
                            B11mSALtx, B11mSUBtx, B11mVANtx, B11mWBtx)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11npCONtx <- DeltaCONtx[, cor.test(Val, B11_NP), by = Metric]
B11npDANtx <- DeltaDANtx[, cor.test(Val, B11_NP), by = Metric]
B11npDMNtx <- DeltaDMNtx[, cor.test(Val, B11_NP), by = Metric]
B11npFPNtx <- DeltaFPNtx[, cor.test(Val, B11_NP), by = Metric]
B11npSALtx <- DeltaSALtx[, cor.test(Val, B11_NP), by = Metric]
B11npSUBtx <- DeltaSUBtx[, cor.test(Val, B11_NP), by = Metric]
B11npVANtx <- DeltaVANtx[, cor.test(Val, B11_NP), by = Metric]
B11npWBtx <- DeltaWBtx[, cor.test(Val, B11_NP), by = Metric]

corrsB11npTx <- rbindlist(list(B11npCONtx, B11npDANtx, B11npDMNtx, B11npFPNtx, 
                             B11npSALtx, B11npSUBtx, B11npVANtx, B11npWBtx)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11tCONtx <- DeltaCONtx[, cor.test(Val, B11_Tot), by = Metric]
B11tDANtx <- DeltaDANtx[, cor.test(Val, B11_Tot), by = Metric]
B11tDMNtx <- DeltaDMNtx[, cor.test(Val, B11_Tot), by = Metric]
B11tFPNtx <- DeltaFPNtx[, cor.test(Val, B11_Tot), by = Metric]
B11tSALtx <- DeltaSALtx[, cor.test(Val, B11_Tot), by = Metric]
B11tSUBtx <- DeltaSUBtx[, cor.test(Val, B11_Tot), by = Metric]
B11tVANtx <- DeltaVANtx[, cor.test(Val, B11_Tot), by = Metric]
B11tWBtx <- DeltaWBtx[, cor.test(Val, B11_Tot), by = Metric]

corrsB11tTx <- rbindlist(list(B11tCONtx, B11tDANtx, B11tDMNtx, B11tFPNtx, 
                            B11tSALtx, B11tSUBtx, B11tVANtx, B11tWBtx)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# Save tables ---------------------------------------------------------------------------------

write_csv(corrsVasTx, 'outData/tables/cVASTx.csv')
write_csv(corrsB11cTx, 'outData/tables/cB11cTx.csv')
write_csv(corrsB11mTx, 'outData/tables/cB11mTx.csv')
write_csv(corrsB11npTx, 'outData/tables/cB11nTx.csv')
write_csv(corrsB11tTx, 'outData/tables/cB11tTx.csv')
