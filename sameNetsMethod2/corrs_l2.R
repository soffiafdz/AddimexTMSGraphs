
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

Delta2CON <- CON2[Stage == "t1", c(..metrics, ..clinScales)] - 
    CON2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2CON <- Delta2CON %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2DAN <- DAN2[Stage == "t1", c(..metrics, ..clinScales)] - 
    DAN2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2DAN <- Delta2DAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2DMN <- DMN2[Stage == "t1", c(..metrics, ..clinScales)] - 
    DMN2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2DMN <- Delta2DMN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2FPN <- FPN2[Stage == "t1", c(..metrics, ..clinScales)] - 
    FPN2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2FPN <- Delta2FPN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2SAL <- SAL2[Stage == "t1", c(..metrics, ..clinScales)] - 
    SAL2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2SAL <- Delta2SAL %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2SUB <- SUB2[Stage == "t1", c(..metrics, ..clinScales)] - 
    SUB2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2SUB <- Delta2SUB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2VAN <- VAN2[Stage == "t1", c(..metrics, ..clinScales)] - 
    VAN2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2VAN <- Delta2VAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta2WB <- WB2[Stage == "t1", c(..metrics, ..clinScales)] - 
    WB2[Stage == "t0", c(..metrics, ..clinScales)]

Delta2WB <- Delta2WB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

Vas2CON <- Delta2CON[, cor.test(Val, VAS), by = Metric]
Vas2DAN <- Delta2DAN[, cor.test(Val, VAS), by = Metric]
Vas2DMN <- Delta2DMN[, cor.test(Val, VAS), by = Metric]
Vas2FPN <- Delta2FPN[, cor.test(Val, VAS), by = Metric]
Vas2SAL <- Delta2SAL[, cor.test(Val, VAS), by = Metric]
Vas2SUB <- Delta2SUB[, cor.test(Val, VAS), by = Metric]
Vas2VAN <- Delta2VAN[, cor.test(Val, VAS), by = Metric]
Vas2WB <- Delta2WB[, cor.test(Val, VAS), by = Metric]


corrs2Vas <- rbindlist(list(Vas2CON, Vas2DAN, Vas2DMN, Vas2FPN, 
                            Vas2SAL, Vas2SUB, Vas2VAN, Vas2WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11c2CON <- Delta2CON[, cor.test(Val, B11_C), by = Metric]
B11c2DAN <- Delta2DAN[, cor.test(Val, B11_C), by = Metric]
B11c2DMN <- Delta2DMN[, cor.test(Val, B11_C), by = Metric]
B11c2FPN <- Delta2FPN[, cor.test(Val, B11_C), by = Metric]
B11c2SAL <- Delta2SAL[, cor.test(Val, B11_C), by = Metric]
B11c2SUB <- Delta2SUB[, cor.test(Val, B11_C), by = Metric]
B11c2VAN <- Delta2VAN[, cor.test(Val, B11_C), by = Metric]
B11c2WB <- Delta2WB[, cor.test(Val, B11_C), by = Metric]

corrs2B11c <- rbindlist(list(B11c2CON, B11c2DAN, B11c2DMN, B11c2FPN, 
                            B11c2SAL, B11c2SUB, B11c2VAN, B11c2WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11m2CON <- Delta2CON[, cor.test(Val, B11_M), by = Metric]
B11m2DAN <- Delta2DAN[, cor.test(Val, B11_M), by = Metric]
B11m2DMN <- Delta2DMN[, cor.test(Val, B11_M), by = Metric]
B11m2FPN <- Delta2FPN[, cor.test(Val, B11_M), by = Metric]
B11m2SAL <- Delta2SAL[, cor.test(Val, B11_M), by = Metric]
B11m2SUB <- Delta2SUB[, cor.test(Val, B11_M), by = Metric]
B11m2VAN <- Delta2VAN[, cor.test(Val, B11_M), by = Metric]
B11m2WB <- Delta2WB[, cor.test(Val, B11_M), by = Metric]

corrs2B11m <- rbindlist(list(B11m2CON, B11m2DAN, B11m2DMN, B11m2FPN, 
                            B11m2SAL, B11m2SUB, B11m2VAN, B11m2WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11np2CON <- Delta2CON[, cor.test(Val, B11_NP), by = Metric]
B11np2DAN <- Delta2DAN[, cor.test(Val, B11_NP), by = Metric]
B11np2DMN <- Delta2DMN[, cor.test(Val, B11_NP), by = Metric]
B11np2FPN <- Delta2FPN[, cor.test(Val, B11_NP), by = Metric]
B11np2SAL <- Delta2SAL[, cor.test(Val, B11_NP), by = Metric]
B11np2SUB <- Delta2SUB[, cor.test(Val, B11_NP), by = Metric]
B11np2VAN <- Delta2VAN[, cor.test(Val, B11_NP), by = Metric]
B11np2WB <- Delta2WB[, cor.test(Val, B11_NP), by = Metric]

corrs2B11np <- rbindlist(list(B11np2CON, B11np2DAN, B11np2DMN, B11np2FPN, 
                             B11np2SAL, B11np2SUB, B11np2VAN, B11np2WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11t2CON <- Delta2CON[, cor.test(Val, B11_Tot), by = Metric]
B11t2DAN <- Delta2DAN[, cor.test(Val, B11_Tot), by = Metric]
B11t2DMN <- Delta2DMN[, cor.test(Val, B11_Tot), by = Metric]
B11t2FPN <- Delta2FPN[, cor.test(Val, B11_Tot), by = Metric]
B11t2SAL <- Delta2SAL[, cor.test(Val, B11_Tot), by = Metric]
B11t2SUB <- Delta2SUB[, cor.test(Val, B11_Tot), by = Metric]
B11t2VAN <- Delta2VAN[, cor.test(Val, B11_Tot), by = Metric]
B11t2WB <- Delta2WB[, cor.test(Val, B11_Tot), by = Metric]

corrs2B11t <- rbindlist(list(B11t2CON, B11t2DAN, B11t2DMN, B11t2FPN, 
                            B11t2SAL, B11t2SUB, B11t2VAN, B11t2WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)