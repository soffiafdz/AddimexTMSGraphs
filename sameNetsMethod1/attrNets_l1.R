
# Set up - dataframe --------------------------------------------------------------------------

attrNets1 <- attrNets1_tx <- attrNets1_l <- 
    swx1 <- swx1Tx <- swx1L <- vector('list', length=length(thresholds))

for (i in seq_along(thresholds)){
    swx1[[i]] <- rbindlist(list(sw1CON[threshold == i], 
                               sw1DAN[threshold == i], 
                               sw1DMN[threshold == i], 
                               sw1FPN[threshold == i], 
                               sw1SAL[threshold == i], 
                               sw1SUB[threshold == i], 
                               sw1VAN[threshold == i],
                               sw1WB[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets1[[i]] <- rbindlist(list(graph_attr_dt(g1CONt0[[1]][[i]]),
                                    graph_attr_dt(g1CONt0[[2]][[i]]),
                                    graph_attr_dt(g1CONt1[[1]][[i]]),
                                    graph_attr_dt(g1CONt1[[2]][[i]]),
                                    graph_attr_dt(g1DANt0[[1]][[i]]),
                                    graph_attr_dt(g1DANt0[[2]][[i]]),
                                    graph_attr_dt(g1DANt1[[1]][[i]]),
                                    graph_attr_dt(g1DANt1[[2]][[i]]),
                                    graph_attr_dt(g1DMNt0[[1]][[i]]),
                                    graph_attr_dt(g1DMNt0[[2]][[i]]),
                                    graph_attr_dt(g1DMNt1[[1]][[i]]),
                                    graph_attr_dt(g1DMNt1[[2]][[i]]),
                                    graph_attr_dt(g1FPNt0[[1]][[i]]),
                                    graph_attr_dt(g1FPNt0[[2]][[i]]),
                                    graph_attr_dt(g1FPNt1[[1]][[i]]),
                                    graph_attr_dt(g1FPNt1[[2]][[i]]),
                                    graph_attr_dt(g1SALt0[[1]][[i]]),
                                    graph_attr_dt(g1SALt0[[2]][[i]]),
                                    graph_attr_dt(g1SALt1[[1]][[i]]),
                                    graph_attr_dt(g1SALt1[[2]][[i]]),
                                    graph_attr_dt(g1SUBt0[[1]][[i]]),
                                    graph_attr_dt(g1SUBt0[[2]][[i]]),
                                    graph_attr_dt(g1SUBt1[[1]][[i]]),
                                    graph_attr_dt(g1SUBt1[[2]][[i]]),
                                    graph_attr_dt(g1VANt0[[1]][[i]]),
                                    graph_attr_dt(g1VANt0[[2]][[i]]),
                                    graph_attr_dt(g1VANt1[[1]][[i]]),
                                    graph_attr_dt(g1VANt1[[2]][[i]]),
                                    graph_attr_dt(g1WBt0[[1]][[i]]),
                                    graph_attr_dt(g1WBt0[[2]][[i]]),
                                    graph_attr_dt(g1WBt1[[1]][[i]]),
                                    graph_attr_dt(g1WBt1[[2]][[i]])))
    
    swx1Tx[[i]] <- rbindlist(list(sw1CONx[threshold == i], 
                                 sw1DANx[threshold == i], 
                                 sw1DMNx[threshold == i], 
                                 sw1FPNx[threshold == i], 
                                 sw1SALx[threshold == i], 
                                 sw1SUBx[threshold == i], 
                                 sw1VANx[threshold == i],
                                 sw1WBx[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets1_tx[[i]] <- rbindlist(list(graph_attr_dt(g1CONtx0[[1]][[i]]),
                                       graph_attr_dt(g1CONtx0[[2]][[i]]),
                                       graph_attr_dt(g1CONtx1[[1]][[i]]),
                                       graph_attr_dt(g1CONtx1[[2]][[i]]),
                                       graph_attr_dt(g1DANtx0[[1]][[i]]),
                                       graph_attr_dt(g1DANtx0[[2]][[i]]),
                                       graph_attr_dt(g1DANtx1[[1]][[i]]),
                                       graph_attr_dt(g1DANtx1[[2]][[i]]),
                                       graph_attr_dt(g1DMNtx0[[1]][[i]]),
                                       graph_attr_dt(g1DMNtx0[[2]][[i]]),
                                       graph_attr_dt(g1DMNtx1[[1]][[i]]),
                                       graph_attr_dt(g1DMNtx1[[2]][[i]]),
                                       graph_attr_dt(g1FPNtx0[[1]][[i]]),
                                       graph_attr_dt(g1FPNtx0[[2]][[i]]),
                                       graph_attr_dt(g1FPNtx1[[1]][[i]]),
                                       graph_attr_dt(g1FPNtx1[[2]][[i]]),
                                       graph_attr_dt(g1SALtx0[[1]][[i]]),
                                       graph_attr_dt(g1SALtx0[[2]][[i]]),
                                       graph_attr_dt(g1SALtx1[[1]][[i]]),
                                       graph_attr_dt(g1SALtx1[[2]][[i]]),
                                       graph_attr_dt(g1SUBtx0[[1]][[i]]),
                                       graph_attr_dt(g1SUBtx0[[2]][[i]]),
                                       graph_attr_dt(g1SUBtx1[[1]][[i]]),
                                       graph_attr_dt(g1SUBtx1[[2]][[i]]),
                                       graph_attr_dt(g1VANtx0[[1]][[i]]),
                                       graph_attr_dt(g1VANtx0[[2]][[i]]),
                                       graph_attr_dt(g1VANtx1[[1]][[i]]),
                                       graph_attr_dt(g1VANtx1[[2]][[i]]),
                                       graph_attr_dt(g1WBtx0[[1]][[i]]),
                                       graph_attr_dt(g1WBtx0[[2]][[i]]),
                                       graph_attr_dt(g1WBtx1[[1]][[i]]),
                                       graph_attr_dt(g1WBtx1[[2]][[i]])))
    
    swx1L[[i]] <- rbindlist(list(sw1CONl[threshold == i], 
                                sw1DANl[threshold == i], 
                                sw1DMNl[threshold == i], 
                                sw1FPNl[threshold == i], 
                                sw1SALl[threshold == i], 
                                sw1SUBl[threshold == i], 
                                sw1VANl[threshold == i],
                                sw1WBl[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets1_l[[i]] <- rbindlist(list(graph_attr_dt(g1CONl0[[1]][[i]]),
                                      graph_attr_dt(g1CONl0[[2]][[i]]),
                                      graph_attr_dt(g1CONl1[[1]][[i]]),
                                      graph_attr_dt(g1CONl1[[2]][[i]]),
                                      graph_attr_dt(g1CONl2[[1]][[i]]),
                                      graph_attr_dt(g1CONl2[[2]][[i]]),
                                      graph_attr_dt(g1DANl0[[1]][[i]]),
                                      graph_attr_dt(g1DANl0[[2]][[i]]),
                                      graph_attr_dt(g1DANl1[[1]][[i]]),
                                      graph_attr_dt(g1DANl1[[2]][[i]]),
                                      graph_attr_dt(g1DANl2[[1]][[i]]),
                                      graph_attr_dt(g1DANl2[[2]][[i]]),
                                      graph_attr_dt(g1DMNl0[[1]][[i]]),
                                      graph_attr_dt(g1DMNl0[[2]][[i]]),
                                      graph_attr_dt(g1DMNl1[[1]][[i]]),
                                      graph_attr_dt(g1DMNl1[[2]][[i]]),
                                      graph_attr_dt(g1DMNl2[[1]][[i]]),
                                      graph_attr_dt(g1DMNl2[[2]][[i]]),
                                      graph_attr_dt(g1FPNl0[[1]][[i]]),
                                      graph_attr_dt(g1FPNl0[[2]][[i]]),
                                      graph_attr_dt(g1FPNl1[[1]][[i]]),
                                      graph_attr_dt(g1FPNl1[[2]][[i]]),
                                      graph_attr_dt(g1FPNl2[[1]][[i]]),
                                      graph_attr_dt(g1FPNl2[[2]][[i]]),
                                      graph_attr_dt(g1SALl0[[1]][[i]]),
                                      graph_attr_dt(g1SALl0[[2]][[i]]),
                                      graph_attr_dt(g1SALl1[[1]][[i]]),
                                      graph_attr_dt(g1SALl1[[2]][[i]]),
                                      graph_attr_dt(g1SALl2[[1]][[i]]),
                                      graph_attr_dt(g1SALl2[[2]][[i]]),
                                      graph_attr_dt(g1SUBl0[[1]][[i]]),
                                      graph_attr_dt(g1SUBl0[[2]][[i]]),
                                      graph_attr_dt(g1SUBl1[[1]][[i]]),
                                      graph_attr_dt(g1SUBl1[[2]][[i]]),
                                      graph_attr_dt(g1SUBl2[[1]][[i]]),
                                      graph_attr_dt(g1SUBl2[[2]][[i]]),
                                      graph_attr_dt(g1VANl0[[1]][[i]]),
                                      graph_attr_dt(g1VANl0[[2]][[i]]),
                                      graph_attr_dt(g1VANl1[[1]][[i]]),
                                      graph_attr_dt(g1VANl1[[2]][[i]]),
                                      graph_attr_dt(g1VANl2[[1]][[i]]),
                                      graph_attr_dt(g1VANl2[[2]][[i]]),
                                      graph_attr_dt(g1WBl0[[1]][[i]]),
                                      graph_attr_dt(g1WBl0[[2]][[i]]),
                                      graph_attr_dt(g1WBl1[[1]][[i]]),
                                      graph_attr_dt(g1WBl1[[2]][[i]]),
                                      graph_attr_dt(g1WBl2[[1]][[i]]),
                                      graph_attr_dt(g1WBl2[[2]][[i]])))
    
    attrNets1[[i]]$Stage <- rep.int(c(rep.int("t0", 27), rep.int("t1", 27)), 8)
    attrNets1_tx[[i]]$Stage <- rep.int(c(rep.int("t0", 23), rep.int("t1", 23)), 8)
    attrNets1_l[[i]]$Stage <- rep.int(c(rep.int("t0", 12), rep.int("t1", 12), rep.int("t2", 12)), 8)
    attrNets1[[i]] <- left_join(attrNets1[[i]], swx1[[i]])
    attrNets1_tx[[i]] <- left_join(attrNets1_tx[[i]], swx1Tx[[i]])
    attrNets1_l[[i]] <- left_join(attrNets1_l[[i]], swx1L[[i]])
    attrNets1[[i]] <- select(attrNets1[[i]], 22, 26:27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    attrNets1_tx[[i]] <- select(attrNets1_tx[[i]], 22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    attrNets1_l[[i]] <- select(attrNets1_l[[i]], 22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attrNets1[[i]])[4] <- "Network"
    names(attrNets1_tx[[i]])[3] <- "Network"
    names(attrNets1_l[[i]])[3] <- "Network"
    attrNets1[[i]]$Network <- str_replace_all(attrNets1[[i]]$Network, "power", "WB")
    attrNets1_tx[[i]]$Network <- str_replace_all(attrNets1_tx[[i]]$Network, "power", "WB")
    attrNets1_l[[i]]$Network <- str_replace_all(attrNets1_l[[i]]$Network, "power", "WB")
    attrNets1[[i]]$Network <- str_replace_all(attrNets1[[i]]$Network, "p", "")
    attrNets1_tx[[i]]$Network <- str_replace_all(attrNets1_tx[[i]]$Network, "p", "")
    attrNets1_l[[i]]$Network <- str_replace_all(attrNets1_l[[i]]$Network, "p", "")
    attrNets1[[i]] <- attrNets1[[i]] %>% 
        mutate(Study.ID = factor(Study.ID), Group = factor(Group), Stage = factor(Stage), 
               Network = factor(Network)) %>% data.table()
   attrNets1_tx[[i]] <- attrNets1_tx[[i]] %>%
        mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
               Network = factor(Network)) %>% data.table()
    attrNets1_l[[i]] <- attrNets1_l[[i]] %>%
        mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
               Network = factor(Network)) %>% data.table()
    
}


# Networks - data.tables ----------------------------------------------------------------------

attr1CON <- as.data.table(filter(attrNets1[[1]], Network == "CON"))
attr1DAN <- as.data.table(filter(attrNets1[[1]], Network == "DAN"))
attr1DMN <- as.data.table(filter(attrNets1[[1]], Network == "DMN"))
attr1FPN <- as.data.table(filter(attrNets1[[1]], Network == "FPN"))
attr1SAL <- as.data.table(filter(attrNets1[[1]], Network == "SAL"))
attr1SUB <- as.data.table(filter(attrNets1[[1]], Network == "SUB"))
attr1VAN <- as.data.table(filter(attrNets1[[1]], Network == "VAN"))
attr1WB <- as.data.table(filter(attrNets1[[1]], Network == "WB"))

attr1CONtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "CON"))
attr1DANtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "DAN"))
attr1DMNtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "DMN"))
attr1FPNtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "FPN"))
attr1SALtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "SAL"))
attr1SUBtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "SUB"))
attr1VANtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "VAN"))
attr1WBtx <- as.data.table(filter(attrNets1_tx[[1]], Network == "WB"))

attr1CONl <- as.data.table(filter(attrNets1_l[[1]], Network == "CON"))
attr1DANl <- as.data.table(filter(attrNets1_l[[1]], Network == "DAN"))
attr1DMNl <- as.data.table(filter(attrNets1_l[[1]], Network == "DMN"))
attr1FPNl <- as.data.table(filter(attrNets1_l[[1]], Network == "FPN"))
attr1SALl <- as.data.table(filter(attrNets1_l[[1]], Network == "SAL"))
attr1SUBl <- as.data.table(filter(attrNets1_l[[1]], Network == "SUB"))
attr1VANl <- as.data.table(filter(attrNets1_l[[1]], Network == "VAN"))
attr1WBl <- as.data.table(filter(attrNets1_l[[1]], Network == "WB"))



# CON1 -----------------------------------------------------------------------------------------

aovCON1 <- txCON1 <- lCON1 <- vector('list', length = 2)

aovCON1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON)
aovCON1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON)
aovCON1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON)
aovCON1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON)
aovCON1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON) 
aovCON1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON) 
aovCON1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1CON)

txCON1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1CONtx)
txCON1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1CONtx)

txCON1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1CONtx)
txCON1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1CONtx)

lCON1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1CONl))
lCON1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1CONl))
lCON1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1CONl))
lCON1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1CONl))
lCON1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1CONl))
lCON1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1CONl))
lCON1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1CONl))

lCON1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1CONl))
lCON1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1CONl))
lCON1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1CONl))
lCON1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1CONl))
lCON1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1CONl))
lCON1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1CONl))
lCON1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1CONl))


# DAN1 -----------------------------------------------------------------------------------------

aovDAN1 <- txDAN1 <- lDAN1 <- vector('list', length = 2)

aovDAN1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN)
aovDAN1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN)
aovDAN1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN)
aovDAN1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN)
aovDAN1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN) 
aovDAN1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN) 
aovDAN1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1DAN)

txDAN1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1DANtx)

txDAN1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1DANtx)
txDAN1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1DANtx)

lDAN1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1DANl))
lDAN1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1DANl))
lDAN1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1DANl))
lDAN1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1DANl))
lDAN1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1DANl))
lDAN1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1DANl))
lDAN1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1DANl))

lDAN1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1DANl))
lDAN1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1DANl))
lDAN1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1DANl))
lDAN1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1DANl))
lDAN1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1DANl))
lDAN1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1DANl))
lDAN1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1DANl))


# DMN1 -----------------------------------------------------------------------------------------

aovDMN1 <- txDMN1 <- lDMN1 <- vector('list', length = 2)

aovDMN1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN)
aovDMN1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN)
aovDMN1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN)
aovDMN1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN)
aovDMN1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN) 
aovDMN1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN) 
aovDMN1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1DMN)

txDMN1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1DMNtx)

txDMN1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1DMNtx)
txDMN1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1DMNtx)

lDMN1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1DMNl))
lDMN1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1DMNl))
lDMN1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1DMNl))
lDMN1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1DMNl))
lDMN1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1DMNl))
lDMN1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1DMNl))
lDMN1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1DMNl))

lDMN1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1DMNl))
lDMN1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1DMNl))
lDMN1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1DMNl))
lDMN1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1DMNl))
lDMN1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1DMNl))
lDMN1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1DMNl))
lDMN1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1DMNl))


# FPN1 -----------------------------------------------------------------------------------------

aovFPN1 <- txFPN1 <- lFPN1 <- vector('list', length = 2)

aovFPN1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN)
aovFPN1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN)
aovFPN1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN)
aovFPN1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN)
aovFPN1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN) 
aovFPN1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN) 
aovFPN1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1FPN)

txFPN1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1FPNtx)

txFPN1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1FPNtx)
txFPN1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1FPNtx)

lFPN1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1FPNl))
lFPN1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1FPNl))
lFPN1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1FPNl))
lFPN1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1FPNl))
lFPN1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1FPNl))
lFPN1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1FPNl))
lFPN1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1FPNl))

lFPN1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1FPNl))
lFPN1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1FPNl))
lFPN1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1FPNl))
lFPN1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1FPNl))
lFPN1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1FPNl))
lFPN1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1FPNl))
lFPN1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1FPNl))


# SAL1 -----------------------------------------------------------------------------------------

aovSAL1 <- txSAL1 <- lSAL1 <- vector('list', length = 2)

aovSAL1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL)
aovSAL1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL)
aovSAL1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL)
aovSAL1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL)
aovSAL1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL) 
aovSAL1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL) 
aovSAL1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1SAL)

txSAL1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1SALtx)

txSAL1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1SALtx)
txSAL1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1SALtx)

lSAL1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1SALl))
lSAL1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1SALl))
lSAL1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1SALl))
lSAL1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1SALl))
lSAL1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1SALl))
lSAL1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1SALl))
lSAL1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1SALl))

lSAL1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1SALl))
lSAL1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1SALl))
lSAL1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1SALl))
lSAL1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1SALl))
lSAL1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1SALl))
lSAL1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1SALl))
lSAL1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1SALl))


# SUB1 -----------------------------------------------------------------------------------------

aovSUB1 <- txSUB1 <- lSUB1 <- vector('list', length = 2)

aovSUB1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB)
aovSUB1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB)
aovSUB1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB)
aovSUB1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB)
aovSUB1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB) 
aovSUB1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB) 
aovSUB1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1SUB)

txSUB1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1SUBtx)

txSUB1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1SUBtx)
txSUB1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1SUBtx)

lSUB1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1SUBl))
lSUB1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1SUBl))
lSUB1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1SUBl))
lSUB1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1SUBl))
lSUB1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1SUBl))
lSUB1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1SUBl))
lSUB1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1SUBl))

lSUB1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1SUBl))
lSUB1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1SUBl))
lSUB1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1SUBl))
lSUB1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1SUBl))
lSUB1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1SUBl))
lSUB1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1SUBl))
lSUB1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1SUBl))


# VAN1 -----------------------------------------------------------------------------------------

aovVAN1 <- txVAN1 <- lVAN1 <- vector('list', length = 2)

aovVAN1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN)
aovVAN1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN)
aovVAN1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN)
aovVAN1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN)
aovVAN1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN) 
aovVAN1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN) 
aovVAN1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1VAN)

txVAN1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = filter(attr1VANtx, !Study.ID %in% paste0("sub-0", c(10, 22, 27))))

txVAN1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1VANtx)
txVAN1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = filter(attr1VANtx, !Study.ID %in% paste0("sub-0", c(10, 22, 27))))

lVAN1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1VANl))
lVAN1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1VANl))
lVAN1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1VANl))
lVAN1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1VANl))
lVAN1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1VANl))
lVAN1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1VANl))
lVAN1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1VANl))

lVAN1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1VANl))
lVAN1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1VANl))
lVAN1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1VANl))
lVAN1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1VANl))
lVAN1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1VANl))
lVAN1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1VANl))
lVAN1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1VANl))


# Global --------------------------------------------------------------------------------------

aovWB1 <- txWB1 <- lWB1 <- vector('list', length = 2)

aovWB1[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB)
aovWB1[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB)
aovWB1[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB)
aovWB1[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB)
aovWB1[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB) 
aovWB1[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB) 
aovWB1[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr1WB)

txWB1[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr1WBtx)
txWB1[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr1WBtx)

txWB1[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr1WBtx)
txWB1[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr1WBtx)

lWB1[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr1WBl))
lWB1[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr1WBl))
lWB1[[1]][[3]] <- summary(aov(density ~ Stage, data = attr1WBl))
lWB1[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr1WBl))
lWB1[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr1WBl))
lWB1[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr1WBl))
lWB1[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr1WBl))

lWB1[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr1WBl))
lWB1[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr1WBl))
lWB1[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr1WBl))
lWB1[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr1WBl))
lWB1[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr1WBl))
lWB1[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr1WBl))
lWB1[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr1WBl))

