
# Metrics -------------------------------------------------------------------------------------

metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

clinScales <- c('VAS', 'CCQ_N', 'CCQ_G', 'B11_C', 'B11_M', 'B11_NP', 'B11_Tot')

# Deltas --------------------------------------------------------------------------------------

Delta1CON <- CON1[Stage == "t1", c(..metrics, ..clinScales)] - 
    CON1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1CON <- Delta1CON %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1DAN <- DAN1[Stage == "t1", c(..metrics, ..clinScales)] - 
    DAN1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1DAN <- Delta1DAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1DMN <- DMN1[Stage == "t1", c(..metrics, ..clinScales)] - 
    DMN1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1DMN <- Delta1DMN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1FPN <- FPN1[Stage == "t1", c(..metrics, ..clinScales)] - 
    FPN1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1FPN <- Delta1FPN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1SAL <- SAL1[Stage == "t1", c(..metrics, ..clinScales)] - 
    SAL1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1SAL <- Delta1SAL %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1SUB <- SUB1[Stage == "t1", c(..metrics, ..clinScales)] - 
    SUB1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1SUB <- Delta1SUB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1VAN <- VAN1[Stage == "t1", c(..metrics, ..clinScales)] - 
    VAN1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1VAN <- Delta1VAN %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


Delta1WB <- WB1[Stage == "t1", c(..metrics, ..clinScales)] - 
    WB1[Stage == "t0", c(..metrics, ..clinScales)]

Delta1WB <- Delta1WB %>% 
    mutate(Study.ID = rep(1:27), Group = c(rep.int("sham", 12), rep.int("tx", 15))) %>% 
    select(15:16, 1:14) %>% data.table() %>% 
    melt.data.table(measure.vars = metrics, variable.name = "Metric", value.name = "Val")


# VAS -----------------------------------------------------------------------------------------

Vas1CON <- Delta1CON[, cor.test(Val, VAS), by = Metric]
Vas1DAN <- Delta1DAN[, cor.test(Val, VAS), by = Metric]
Vas1DMN <- Delta1DMN[, cor.test(Val, VAS), by = Metric]
Vas1FPN <- Delta1FPN[, cor.test(Val, VAS), by = Metric]
Vas1SAL <- Delta1SAL[, cor.test(Val, VAS), by = Metric]
Vas1SUB <- Delta1SUB[, cor.test(Val, VAS), by = Metric]
Vas1VAN <- Delta1VAN[, cor.test(Val, VAS), by = Metric]
Vas1WB <- Delta1WB[, cor.test(Val, VAS), by = Metric]


corrs1Vas <- rbindlist(list(Vas1CON, Vas1DAN, Vas1DMN, Vas1FPN, 
                            Vas1SAL, Vas1SUB, Vas1VAN, Vas1WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)

# B11-Cognitive -------------------------------------------------------------------------------

B11c1CON <- Delta1CON[, cor.test(Val, B11_C), by = Metric]
B11c1DAN <- Delta1DAN[, cor.test(Val, B11_C), by = Metric]
B11c1DMN <- Delta1DMN[, cor.test(Val, B11_C), by = Metric]
B11c1FPN <- Delta1FPN[, cor.test(Val, B11_C), by = Metric]
B11c1SAL <- Delta1SAL[, cor.test(Val, B11_C), by = Metric]
B11c1SUB <- Delta1SUB[, cor.test(Val, B11_C), by = Metric]
B11c1VAN <- Delta1VAN[, cor.test(Val, B11_C), by = Metric]
B11c1WB <- Delta1WB[, cor.test(Val, B11_C), by = Metric]

corrs1B11c <- rbindlist(list(B11c1CON, B11c1DAN, B11c1DMN, B11c1FPN, 
                            B11c1SAL, B11c1SUB, B11c1VAN, B11c1WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Motor -----------------------------------------------------------------------------------

B11m1CON <- Delta1CON[, cor.test(Val, B11_M), by = Metric]
B11m1DAN <- Delta1DAN[, cor.test(Val, B11_M), by = Metric]
B11m1DMN <- Delta1DMN[, cor.test(Val, B11_M), by = Metric]
B11m1FPN <- Delta1FPN[, cor.test(Val, B11_M), by = Metric]
B11m1SAL <- Delta1SAL[, cor.test(Val, B11_M), by = Metric]
B11m1SUB <- Delta1SUB[, cor.test(Val, B11_M), by = Metric]
B11m1VAN <- Delta1VAN[, cor.test(Val, B11_M), by = Metric]
B11m1WB <- Delta1WB[, cor.test(Val, B11_M), by = Metric]

corrs1B11m <- rbindlist(list(B11m1CON, B11m1DAN, B11m1DMN, B11m1FPN, 
                            B11m1SAL, B11m1SUB, B11m1VAN, B11m1WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Non planning ----------------------------------------------------------------------------

B11np1CON <- Delta1CON[, cor.test(Val, B11_NP), by = Metric]
B11np1DAN <- Delta1DAN[, cor.test(Val, B11_NP), by = Metric]
B11np1DMN <- Delta1DMN[, cor.test(Val, B11_NP), by = Metric]
B11np1FPN <- Delta1FPN[, cor.test(Val, B11_NP), by = Metric]
B11np1SAL <- Delta1SAL[, cor.test(Val, B11_NP), by = Metric]
B11np1SUB <- Delta1SUB[, cor.test(Val, B11_NP), by = Metric]
B11np1VAN <- Delta1VAN[, cor.test(Val, B11_NP), by = Metric]
B11np1WB <- Delta1WB[, cor.test(Val, B11_NP), by = Metric]

corrs1B11np <- rbindlist(list(B11np1CON, B11np1DAN, B11np1DMN, B11np1FPN, 
                             B11np1SAL, B11np1SUB, B11np1VAN, B11np1WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)


# B11-Total -----------------------------------------------------------------------------------

B11t1CON <- Delta1CON[, cor.test(Val, B11_Tot), by = Metric]
B11t1DAN <- Delta1DAN[, cor.test(Val, B11_Tot), by = Metric]
B11t1DMN <- Delta1DMN[, cor.test(Val, B11_Tot), by = Metric]
B11t1FPN <- Delta1FPN[, cor.test(Val, B11_Tot), by = Metric]
B11t1SAL <- Delta1SAL[, cor.test(Val, B11_Tot), by = Metric]
B11t1SUB <- Delta1SUB[, cor.test(Val, B11_Tot), by = Metric]
B11t1VAN <- Delta1VAN[, cor.test(Val, B11_Tot), by = Metric]
B11t1WB <- Delta1WB[, cor.test(Val, B11_Tot), by = Metric]

corrs1B11t1 <- rbindlist(list(B11t1CON, B11t1DAN, B11t1DMN, B11t1FPN, 
                            B11t1SAL, B11t1SUB, B11t1VAN, B11t1WB)) %>% 
    mutate(Network = rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB"), each = 14),
           conf.n = rep(c("confInt1", "confInt2"), times = 56)) %>% 
    select(11, 1, r = 5, p = 4, Stat = 2, Df = 3, 10,12) %>% 
    spread(key = 8, value = 7)