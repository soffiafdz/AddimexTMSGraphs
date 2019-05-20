
# Set up - dataframe --------------------------------------------------------------------------

attrNets2 <- attrNets2_tx <- attrNets2_l <- 
    swx2 <- swx2Tx <- swx2L <- vector('list', length=length(thresholds))

for (i in seq_along(thresholds)){
    swx2[[i]] <- rbindlist(list(sw2CON[threshold == i], 
                                sw2DAN[threshold == i], 
                                sw2DMN[threshold == i], 
                                sw2FPN[threshold == i], 
                                sw2SAL[threshold == i], 
                                sw2SUB[threshold == i], 
                                sw2VAN[threshold == i],
                                sw2WB[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets2[[i]] <- rbindlist(list(graph_attr_dt(g2CONt0[[1]][[i]]),
                                     graph_attr_dt(g2CONt0[[2]][[i]]),
                                     graph_attr_dt(g2CONt1[[1]][[i]]),
                                     graph_attr_dt(g2CONt1[[2]][[i]]),
                                     graph_attr_dt(g2DANt0[[1]][[i]]),
                                     graph_attr_dt(g2DANt0[[2]][[i]]),
                                     graph_attr_dt(g2DANt1[[1]][[i]]),
                                     graph_attr_dt(g2DANt1[[2]][[i]]),
                                     graph_attr_dt(g2DMNt0[[1]][[i]]),
                                     graph_attr_dt(g2DMNt0[[2]][[i]]),
                                     graph_attr_dt(g2DMNt1[[1]][[i]]),
                                     graph_attr_dt(g2DMNt1[[2]][[i]]),
                                     graph_attr_dt(g2FPNt0[[1]][[i]]),
                                     graph_attr_dt(g2FPNt0[[2]][[i]]),
                                     graph_attr_dt(g2FPNt1[[1]][[i]]),
                                     graph_attr_dt(g2FPNt1[[2]][[i]]),
                                     graph_attr_dt(g2SALt0[[1]][[i]]),
                                     graph_attr_dt(g2SALt0[[2]][[i]]),
                                     graph_attr_dt(g2SALt1[[1]][[i]]),
                                     graph_attr_dt(g2SALt1[[2]][[i]]),
                                     graph_attr_dt(g2SUBt0[[1]][[i]]),
                                     graph_attr_dt(g2SUBt0[[2]][[i]]),
                                     graph_attr_dt(g2SUBt1[[1]][[i]]),
                                     graph_attr_dt(g2SUBt1[[2]][[i]]),
                                     graph_attr_dt(g2VANt0[[1]][[i]]),
                                     graph_attr_dt(g2VANt0[[2]][[i]]),
                                     graph_attr_dt(g2VANt1[[1]][[i]]),
                                     graph_attr_dt(g2VANt1[[2]][[i]]),
                                     graph_attr_dt(g2WBt0[[1]][[i]]),
                                     graph_attr_dt(g2WBt0[[2]][[i]]),
                                     graph_attr_dt(g2WBt1[[1]][[i]]),
                                     graph_attr_dt(g2WBt1[[2]][[i]])))
    
    swx2Tx[[i]] <- rbindlist(list(sw2CONx[threshold == i], 
                                  sw2DANx[threshold == i], 
                                  sw2DMNx[threshold == i], 
                                  sw2FPNx[threshold == i], 
                                  sw2SALx[threshold == i], 
                                  sw2SUBx[threshold == i], 
                                  sw2VANx[threshold == i],
                                  sw2WBx[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets2_tx[[i]] <- rbindlist(list(graph_attr_dt(g2CONtx0[[1]][[i]]),
                                        graph_attr_dt(g2CONtx0[[2]][[i]]),
                                        graph_attr_dt(g2CONtx1[[1]][[i]]),
                                        graph_attr_dt(g2CONtx1[[2]][[i]]),
                                        graph_attr_dt(g2DANtx0[[1]][[i]]),
                                        graph_attr_dt(g2DANtx0[[2]][[i]]),
                                        graph_attr_dt(g2DANtx1[[1]][[i]]),
                                        graph_attr_dt(g2DANtx1[[2]][[i]]),
                                        graph_attr_dt(g2DMNtx0[[1]][[i]]),
                                        graph_attr_dt(g2DMNtx0[[2]][[i]]),
                                        graph_attr_dt(g2DMNtx1[[1]][[i]]),
                                        graph_attr_dt(g2DMNtx1[[2]][[i]]),
                                        graph_attr_dt(g2FPNtx0[[1]][[i]]),
                                        graph_attr_dt(g2FPNtx0[[2]][[i]]),
                                        graph_attr_dt(g2FPNtx1[[1]][[i]]),
                                        graph_attr_dt(g2FPNtx1[[2]][[i]]),
                                        graph_attr_dt(g2SALtx0[[1]][[i]]),
                                        graph_attr_dt(g2SALtx0[[2]][[i]]),
                                        graph_attr_dt(g2SALtx1[[1]][[i]]),
                                        graph_attr_dt(g2SALtx1[[2]][[i]]),
                                        graph_attr_dt(g2SUBtx0[[1]][[i]]),
                                        graph_attr_dt(g2SUBtx0[[2]][[i]]),
                                        graph_attr_dt(g2SUBtx1[[1]][[i]]),
                                        graph_attr_dt(g2SUBtx1[[2]][[i]]),
                                        graph_attr_dt(g2VANtx0[[1]][[i]]),
                                        graph_attr_dt(g2VANtx0[[2]][[i]]),
                                        graph_attr_dt(g2VANtx1[[1]][[i]]),
                                        graph_attr_dt(g2VANtx1[[2]][[i]]),
                                        graph_attr_dt(g2WBtx0[[1]][[i]]),
                                        graph_attr_dt(g2WBtx0[[2]][[i]]),
                                        graph_attr_dt(g2WBtx1[[1]][[i]]),
                                        graph_attr_dt(g2WBtx1[[2]][[i]])))
    
    swx2L[[i]] <- rbindlist(list(sw2CONl[threshold == i], 
                                 sw2DANl[threshold == i], 
                                 sw2DMNl[threshold == i], 
                                 sw2FPNl[threshold == i], 
                                 sw2SALl[threshold == i], 
                                 sw2SUBl[threshold == i], 
                                 sw2VANl[threshold == i],
                                 sw2WBl[threshold == i])) %>% 
        select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    attrNets2_l[[i]] <- rbindlist(list(graph_attr_dt(g2CONl0[[1]][[i]]),
                                       graph_attr_dt(g2CONl0[[2]][[i]]),
                                       graph_attr_dt(g2CONl1[[1]][[i]]),
                                       graph_attr_dt(g2CONl1[[2]][[i]]),
                                       graph_attr_dt(g2CONl2[[1]][[i]]),
                                       graph_attr_dt(g2CONl2[[2]][[i]]),
                                       graph_attr_dt(g2DANl0[[1]][[i]]),
                                       graph_attr_dt(g2DANl0[[2]][[i]]),
                                       graph_attr_dt(g2DANl1[[1]][[i]]),
                                       graph_attr_dt(g2DANl1[[2]][[i]]),
                                       graph_attr_dt(g2DANl2[[1]][[i]]),
                                       graph_attr_dt(g2DANl2[[2]][[i]]),
                                       graph_attr_dt(g2DMNl0[[1]][[i]]),
                                       graph_attr_dt(g2DMNl0[[2]][[i]]),
                                       graph_attr_dt(g2DMNl1[[1]][[i]]),
                                       graph_attr_dt(g2DMNl1[[2]][[i]]),
                                       graph_attr_dt(g2DMNl2[[1]][[i]]),
                                       graph_attr_dt(g2DMNl2[[2]][[i]]),
                                       graph_attr_dt(g2FPNl0[[1]][[i]]),
                                       graph_attr_dt(g2FPNl0[[2]][[i]]),
                                       graph_attr_dt(g2FPNl1[[1]][[i]]),
                                       graph_attr_dt(g2FPNl1[[2]][[i]]),
                                       graph_attr_dt(g2FPNl2[[1]][[i]]),
                                       graph_attr_dt(g2FPNl2[[2]][[i]]),
                                       graph_attr_dt(g2SALl0[[1]][[i]]),
                                       graph_attr_dt(g2SALl0[[2]][[i]]),
                                       graph_attr_dt(g2SALl1[[1]][[i]]),
                                       graph_attr_dt(g2SALl1[[2]][[i]]),
                                       graph_attr_dt(g2SALl2[[1]][[i]]),
                                       graph_attr_dt(g2SALl2[[2]][[i]]),
                                       graph_attr_dt(g2SUBl0[[1]][[i]]),
                                       graph_attr_dt(g2SUBl0[[2]][[i]]),
                                       graph_attr_dt(g2SUBl1[[1]][[i]]),
                                       graph_attr_dt(g2SUBl1[[2]][[i]]),
                                       graph_attr_dt(g2SUBl2[[1]][[i]]),
                                       graph_attr_dt(g2SUBl2[[2]][[i]]),
                                       graph_attr_dt(g2VANl0[[1]][[i]]),
                                       graph_attr_dt(g2VANl0[[2]][[i]]),
                                       graph_attr_dt(g2VANl1[[1]][[i]]),
                                       graph_attr_dt(g2VANl1[[2]][[i]]),
                                       graph_attr_dt(g2VANl2[[1]][[i]]),
                                       graph_attr_dt(g2VANl2[[2]][[i]]),
                                       graph_attr_dt(g2WBl0[[1]][[i]]),
                                       graph_attr_dt(g2WBl0[[2]][[i]]),
                                       graph_attr_dt(g2WBl1[[1]][[i]]),
                                       graph_attr_dt(g2WBl1[[2]][[i]]),
                                       graph_attr_dt(g2WBl2[[1]][[i]]),
                                       graph_attr_dt(g2WBl2[[2]][[i]])))
    
    attrNets2[[i]]$Stage <- rep.int(c(rep.int("t0", 27), rep.int("t1", 27)), 8)
    attrNets2_tx[[i]]$Stage <- rep.int(c(rep.int("t0", 23), rep.int("t1", 23)), 8)
    attrNets2_l[[i]]$Stage <- rep.int(c(rep.int("t0", 12), rep.int("t1", 12), rep.int("t2", 12)), 8)
    attrNets2[[i]] <- left_join(attrNets2[[i]], swx2[[i]])
    attrNets2_tx[[i]] <- left_join(attrNets2_tx[[i]], swx2Tx[[i]])
    attrNets2_l[[i]] <- left_join(attrNets2_l[[i]], swx2L[[i]])
    attrNets2[[i]] <- select(attrNets2[[i]], 22, 26:27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    attrNets2_tx[[i]] <- select(attrNets2_tx[[i]], 22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    attrNets2_l[[i]] <- select(attrNets2_l[[i]], 22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attrNets2[[i]])[4] <- "Network"
    names(attrNets2_tx[[i]])[3] <- "Network"
    names(attrNets2_l[[i]])[3] <- "Network"
    attrNets2[[i]]$Network <- str_replace_all(attrNets2[[i]]$Network, "power", "WB")
    attrNets2_tx[[i]]$Network <- str_replace_all(attrNets2_tx[[i]]$Network, "power", "WB")
    attrNets2_l[[i]]$Network <- str_replace_all(attrNets2_l[[i]]$Network, "power", "WB")
    attrNets2[[i]]$Network <- str_replace_all(attrNets2[[i]]$Network, "p", "")
    attrNets2_tx[[i]]$Network <- str_replace_all(attrNets2_tx[[i]]$Network, "p", "")
    attrNets2_l[[i]]$Network <- str_replace_all(attrNets2_l[[i]]$Network, "p", "")
    attrNets2[[i]] <- attrNets2[[i]] %>% 
        mutate(Study.ID = factor(Study.ID), Group = factor(Group), Stage = factor(Stage), 
               Network = factor(Network)) %>% data.table()
    attrNets2_tx[[i]] <- attrNets2_tx[[i]] %>%
        mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
               Network = factor(Network)) %>% data.table()
    attrNets2_l[[i]] <- attrNets2_l[[i]] %>%
        mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
               Network = factor(Network)) %>% data.table()
    
}


# Networks - data.tables ----------------------------------------------------------------------

attr2CON <- as.data.table(filter(attrNets2[[1]], Network == "CON"))
attr2DAN <- as.data.table(filter(attrNets2[[1]], Network == "DAN"))
attr2DMN <- as.data.table(filter(attrNets2[[1]], Network == "DMN"))
attr2FPN <- as.data.table(filter(attrNets2[[1]], Network == "FPN"))
attr2SAL <- as.data.table(filter(attrNets2[[1]], Network == "SAL"))
attr2SUB <- as.data.table(filter(attrNets2[[1]], Network == "SUB"))
attr2VAN <- as.data.table(filter(attrNets2[[1]], Network == "VAN"))
attr2WB <- as.data.table(filter(attrNets2[[1]], Network == "WB"))

attr2CONtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "CON"))
attr2DANtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "DAN"))
attr2DMNtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "DMN"))
attr2FPNtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "FPN"))
attr2SALtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "SAL"))
attr2SUBtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "SUB"))
attr2VANtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "VAN"))
attr2WBtx <- as.data.table(filter(attrNets2_tx[[1]], Network == "WB"))

attr2CONl <- as.data.table(filter(attrNets2_l[[1]], Network == "CON"))
attr2DANl <- as.data.table(filter(attrNets2_l[[1]], Network == "DAN"))
attr2DMNl <- as.data.table(filter(attrNets2_l[[1]], Network == "DMN"))
attr2FPNl <- as.data.table(filter(attrNets2_l[[1]], Network == "FPN"))
attr2SALl <- as.data.table(filter(attrNets2_l[[1]], Network == "SAL"))
attr2SUBl <- as.data.table(filter(attrNets2_l[[1]], Network == "SUB"))
attr2VANl <- as.data.table(filter(attrNets2_l[[1]], Network == "VAN"))
attr2WBl <- as.data.table(filter(attrNets2_l[[1]], Network == "WB"))



# CON2 -----------------------------------------------------------------------------------------

aovCON2 <- txCON2 <- lCON2 <- vector('list', length = 2)

aovCON2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON)
aovCON2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON)
aovCON2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON)
aovCON2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON)
aovCON2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON) 
aovCON2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON) 
aovCON2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2CON)

txCON2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2CONtx)
txCON2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2CONtx)

txCON2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2CONtx)
txCON2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2CONtx)

lCON2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2CONl))
lCON2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2CONl))
lCON2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2CONl))
lCON2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2CONl))
lCON2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2CONl))
lCON2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2CONl))
lCON2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2CONl))

lCON2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2CONl))
lCON2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2CONl))
lCON2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2CONl))
lCON2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2CONl))
lCON2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2CONl))
lCON2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2CONl))
lCON2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2CONl))


# DAN2 -----------------------------------------------------------------------------------------

aovDAN2 <- txDAN2 <- lDAN2 <- vector('list', length = 2)

aovDAN2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN)
aovDAN2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN)
aovDAN2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN)
aovDAN2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN)
aovDAN2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN) 
aovDAN2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN) 
aovDAN2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2DAN)

txDAN2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2DANtx)

txDAN2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2DANtx)
txDAN2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2DANtx)

lDAN2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2DANl))
lDAN2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2DANl))
lDAN2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2DANl))
lDAN2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2DANl))
lDAN2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2DANl))
lDAN2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2DANl))
lDAN2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2DANl))

lDAN2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2DANl))
lDAN2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2DANl))
lDAN2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2DANl))
lDAN2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2DANl))
lDAN2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2DANl))
lDAN2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2DANl))
lDAN2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2DANl))


# DMN2 -----------------------------------------------------------------------------------------

aovDMN2 <- txDMN2 <- lDMN2 <- vector('list', length = 2)

aovDMN2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN)
aovDMN2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN)
aovDMN2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN)
aovDMN2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN)
aovDMN2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN) 
aovDMN2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN) 
aovDMN2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2DMN)

txDMN2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2DMNtx)

txDMN2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2DMNtx)
txDMN2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2DMNtx)

lDMN2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2DMNl))
lDMN2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2DMNl))
lDMN2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2DMNl))
lDMN2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2DMNl))
lDMN2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2DMNl))
lDMN2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2DMNl))
lDMN2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2DMNl))

lDMN2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2DMNl))
lDMN2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2DMNl))
lDMN2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2DMNl))
lDMN2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2DMNl))
lDMN2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2DMNl))
lDMN2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2DMNl))
lDMN2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2DMNl))


# FPN2 -----------------------------------------------------------------------------------------

aovFPN2 <- txFPN2 <- lFPN2 <- vector('list', length = 2)

aovFPN2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN)
aovFPN2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN)
aovFPN2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN)
aovFPN2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN)
aovFPN2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN) 
aovFPN2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN) 
aovFPN2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2FPN)

txFPN2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2FPNtx)

txFPN2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2FPNtx)
txFPN2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2FPNtx)

lFPN2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2FPNl))
lFPN2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2FPNl))
lFPN2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2FPNl))
lFPN2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2FPNl))
lFPN2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2FPNl))
lFPN2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2FPNl))
lFPN2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2FPNl))

lFPN2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2FPNl))
lFPN2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2FPNl))
lFPN2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2FPNl))
lFPN2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2FPNl))
lFPN2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2FPNl))
lFPN2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2FPNl))
lFPN2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2FPNl))


# SAL2 -----------------------------------------------------------------------------------------

aovSAL2 <- txSAL2 <- lSAL2 <- vector('list', length = 2)

aovSAL2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL)
aovSAL2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL)
aovSAL2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL)
aovSAL2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL)
aovSAL2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL) 
aovSAL2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL) 
aovSAL2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2SAL)

txSAL2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2SALtx)

txSAL2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2SALtx)
txSAL2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2SALtx)

lSAL2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2SALl))
lSAL2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2SALl))
lSAL2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2SALl))
lSAL2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2SALl))
lSAL2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2SALl))
lSAL2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2SALl))
lSAL2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2SALl))

lSAL2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2SALl))
lSAL2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2SALl))
lSAL2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2SALl))
lSAL2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2SALl))
lSAL2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2SALl))
lSAL2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2SALl))
lSAL2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2SALl))


# SUB2 -----------------------------------------------------------------------------------------

aovSUB2 <- txSUB2 <- lSUB2 <- vector('list', length = 2)

aovSUB2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB)
aovSUB2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB)
aovSUB2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB)
aovSUB2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB)
aovSUB2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB) 
aovSUB2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB) 
aovSUB2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2SUB)

txSUB2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2SUBtx)

txSUB2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2SUBtx)
txSUB2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2SUBtx)

lSUB2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2SUBl))
lSUB2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2SUBl))
lSUB2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2SUBl))
lSUB2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2SUBl))
lSUB2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2SUBl))
lSUB2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2SUBl))
lSUB2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2SUBl))

lSUB2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2SUBl))
lSUB2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2SUBl))
lSUB2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2SUBl))
lSUB2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2SUBl))
lSUB2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2SUBl))
lSUB2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2SUBl))
lSUB2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2SUBl))


# VAN2 -----------------------------------------------------------------------------------------

aovVAN2 <- txVAN2 <- lVAN2 <- vector('list', length = 2)

aovVAN2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN)
aovVAN2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN)
aovVAN2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN)
aovVAN2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN)
aovVAN2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN) 
aovVAN2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN) 
aovVAN2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2VAN)

txVAN2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = filter(attr2VANtx, !Study.ID %in% paste0("sub-0", c("06", "08", 10, 13, 27))))

txVAN2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2VANtx)
txVAN2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = filter(attr2VANtx, !Study.ID %in% paste0("sub-0", c("06", "08", 10, 13, 27))))

lVAN2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2VANl))
lVAN2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2VANl))
lVAN2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2VANl))
lVAN2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2VANl))
lVAN2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2VANl))
lVAN2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2VANl))
lVAN2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2VANl))

lVAN2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2VANl))
lVAN2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2VANl))
lVAN2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2VANl))
lVAN2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2VANl))
lVAN2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2VANl))
lVAN2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2VANl))
lVAN2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2VANl))


# Global --------------------------------------------------------------------------------------

aovWB2 <- txWB2 <- lWB2 <- vector('list', length = 2)

aovWB2[[1]] <- aov_car(E.global ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB)
aovWB2[[2]] <- aov_car(E.local ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB)
aovWB2[[3]] <- aov_car(density ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB)
aovWB2[[4]] <- aov_car(strength ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB)
aovWB2[[5]] <- aov_car(Cp ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB) 
aovWB2[[6]] <- aov_car(Lp ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB) 
aovWB2[[7]] <- aov_car(sigma ~ Group*Stage + Error(Study.ID/Stage), data = attr2WB)

txWB2[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attr2WBtx)
txWB2[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attr2WBtx)

txWB2[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attr2WBtx)
txWB2[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attr2WBtx)

lWB2[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attr2WBl))
lWB2[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attr2WBl))
lWB2[[1]][[3]] <- summary(aov(density ~ Stage, data = attr2WBl))
lWB2[[1]][[4]] <- summary(aov(strength ~ Stage, data = attr2WBl))
lWB2[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attr2WBl))
lWB2[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attr2WBl))
lWB2[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attr2WBl))

lWB2[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attr2WBl))
lWB2[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attr2WBl))
lWB2[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attr2WBl))
lWB2[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attr2WBl))
lWB2[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attr2WBl))
lWB2[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attr2WBl))
lWB2[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attr2WBl))

