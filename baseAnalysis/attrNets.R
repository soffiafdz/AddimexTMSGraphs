
# Set up - dataframe ------------------------------------------------------

attrWB <- attrSubNets <- #attrNets_vs <- attrNets_tx <- attrNets_l <-
    swx <- #swxVs <- swxTx <- swxL <- 
    vector('list', length=1) #length(thresholds))

#for (i in seq_along(thresholds)){ ## Use if more than one Threshold
i <- 1
    lSW <- swWB[, #threshold = i, If >1 threshold
            .(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage,
              atlas = "WB")]
    
    lWB <- list(
        graph_attr_dt(gWBt0[[1]][[i]]),
        graph_attr_dt(gWBt0[[2]][[i]]),
        graph_attr_dt(gWBt1[[1]][[i]]),
        graph_attr_dt(gWBt1[[2]][[i]])
    )
    
    lSubNets <- list(
        graph_attr_dt(gCONt0[[1]][[i]]),
        graph_attr_dt(gCONt0[[2]][[i]]),
        graph_attr_dt(gCONt1[[1]][[i]]),
        graph_attr_dt(gCONt1[[2]][[i]]),
        graph_attr_dt(gDANt0[[1]][[i]]),
        graph_attr_dt(gDANt0[[2]][[i]]),
        graph_attr_dt(gDANt1[[1]][[i]]),
        graph_attr_dt(gDANt1[[2]][[i]]),
        graph_attr_dt(gDMNt0[[1]][[i]]),
        graph_attr_dt(gDMNt0[[2]][[i]]),
        graph_attr_dt(gDMNt1[[1]][[i]]),
        graph_attr_dt(gDMNt1[[2]][[i]]),
        graph_attr_dt(gFPNt0[[1]][[i]]),
        graph_attr_dt(gFPNt0[[2]][[i]]),
        graph_attr_dt(gFPNt1[[1]][[i]]),
        graph_attr_dt(gFPNt1[[2]][[i]]),
        graph_attr_dt(gSALt0[[1]][[i]]),
        graph_attr_dt(gSALt0[[2]][[i]]),
        graph_attr_dt(gSALt1[[1]][[i]]),
        graph_attr_dt(gSALt1[[2]][[i]]),
        graph_attr_dt(gSUBt0[[1]][[i]]),
        graph_attr_dt(gSUBt0[[2]][[i]]),
        graph_attr_dt(gSUBt1[[1]][[i]]),
        graph_attr_dt(gSUBt1[[2]][[i]]),
        graph_attr_dt(gVANt0[[1]][[i]]),
        graph_attr_dt(gVANt0[[2]][[i]]),
        graph_attr_dt(gVANt1[[1]][[i]]),
        graph_attr_dt(gVANt1[[2]][[i]])
    )
    
    # Use [[i]] if Loop
    swx <- lSW
    attrSubNets <- rbindlist(lSubNets, fill = T)
    attrWB <- rbindlist(lWB, fill = T)
    
    attrSubNets <- attrSubNets[, `:=`(
        Stage = factor(
            rep.int(
                c(rep.int("t0", 31),
                  rep.int("t1", 31)),
                7)),
        Network = factor(
            str_replace_all(
                atlas, "p", ""
            )
        ),
        Study.ID = factor(Study.ID),
        Group = factor(Group)
    )][, .(
        Study.ID, Group, Stage, Network, threshold,
        Lp, Cp, E.global, E.local, 
        mod, density, max.comp, num.tri, diameter, transitivity,
        assortativity, strength, num.hubs, vulnerability
    )]
    
    
    attrWB[, `:=`(
        Stage = factor(
            c(rep.int("t0", 31),
              rep.int("t1", 31))
        ),
        atlas = factor(
            rep.int("WB", 62)
        ),
        Study.ID = factor(Study.ID),
        Group = factor(Group)
    )]
    
    setkey(swx, Study.ID, Group, Stage, atlas)
    setkey(attrWB, Study.ID, Group, Stage, atlas)
    setkey(attrSubNets, Study.ID, Group, Stage, Network)
    
    attrWB <- swx[attrWB][, .(
        Study.ID, Group, Stage, Network = atlas, threshold,
        Lp, Lp.norm, Cp, Cp.norm, sigma, E.global, E.local, 
        mod, density, max.comp, num.tri, diameter, transitivity,
        assortativity, strength, num.hubs, vulnerability 
    )]
    
    
    
    
    # To modify ---------------------------------------------------------------
    
    
    # 
    # swxVs[[i]] <- rbindlist(list(swCONvs[threshold == i], 
    #                            swDANvs[threshold == i], 
    #                            swDMNvs[threshold == i], 
    #                            swFPNvs[threshold == i], 
    #                            swSALvs[threshold == i], 
    #                            swSUBvs[threshold == i], 
    #                            # swVANvs[threshold == i],
    #                            swWBvs[threshold == i])) %>% 
    #     select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)
    # attrNets_vs[[i]] <- rbindlist(list(graph_attr_dt(gCONvs[[1]][[i]]),
    #                                  graph_attr_dt(gCONvs[[2]][[i]]),
    #                                  graph_attr_dt(gDANvs[[1]][[i]]),
    #                                  graph_attr_dt(gDANvs[[2]][[i]]),
    #                                  graph_attr_dt(gDMNvs[[1]][[i]]),
    #                                  graph_attr_dt(gDMNvs[[2]][[i]]),
    #                                  graph_attr_dt(gFPNvs[[1]][[i]]),
    #                                  graph_attr_dt(gFPNvs[[2]][[i]]),
    #                                  graph_attr_dt(gSALvs[[1]][[i]]),
    #                                  graph_attr_dt(gSALvs[[2]][[i]]),
    #                                  graph_attr_dt(gSUBvs[[1]][[i]]),
    #                                  graph_attr_dt(gSUBvs[[2]][[i]]),
    #                                  graph_attr_dt(gVANvs[[1]][[i]]),
    #                                  graph_attr_dt(gVANvs[[2]][[i]]),
    #                                  graph_attr_dt(gWBvs[[1]][[i]]),
    #                                  graph_attr_dt(gWBvs[[2]][[i]])))
    # 
    # swxTx[[i]] <- rbindlist(list(swCONx[threshold == i], 
    #                            swDANx[threshold == i], 
    #                            swDMNx[threshold == i], 
    #                            swFPNx[threshold == i], 
    #                            swSALx[threshold == i], 
    #                            swSUBx[threshold == i], 
    #                            swVANx[threshold == i],
    #                            swWBx[threshold == i])) %>% 
    #     select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    # attrNets_tx[[i]] <- rbindlist(list(graph_attr_dt(gCONtx0[[1]][[i]]),
    #                                  graph_attr_dt(gCONtx0[[2]][[i]]),
    #                                  graph_attr_dt(gCONtx1[[1]][[i]]),
    #                                  graph_attr_dt(gCONtx1[[2]][[i]]),
    #                                  graph_attr_dt(gDANtx0[[1]][[i]]),
    #                                  graph_attr_dt(gDANtx0[[2]][[i]]),
    #                                  graph_attr_dt(gDANtx1[[1]][[i]]),
    #                                  graph_attr_dt(gDANtx1[[2]][[i]]),
    #                                  graph_attr_dt(gDMNtx0[[1]][[i]]),
    #                                  graph_attr_dt(gDMNtx0[[2]][[i]]),
    #                                  graph_attr_dt(gDMNtx1[[1]][[i]]),
    #                                  graph_attr_dt(gDMNtx1[[2]][[i]]),
    #                                  graph_attr_dt(gFPNtx0[[1]][[i]]),
    #                                  graph_attr_dt(gFPNtx0[[2]][[i]]),
    #                                  graph_attr_dt(gFPNtx1[[1]][[i]]),
    #                                  graph_attr_dt(gFPNtx1[[2]][[i]]),
    #                                  graph_attr_dt(gSALtx0[[1]][[i]]),
    #                                  graph_attr_dt(gSALtx0[[2]][[i]]),
    #                                  graph_attr_dt(gSALtx1[[1]][[i]]),
    #                                  graph_attr_dt(gSALtx1[[2]][[i]]),
    #                                  graph_attr_dt(gSUBtx0[[1]][[i]]),
    #                                  graph_attr_dt(gSUBtx0[[2]][[i]]),
    #                                  graph_attr_dt(gSUBtx1[[1]][[i]]),
    #                                  graph_attr_dt(gSUBtx1[[2]][[i]]),
    #                                  graph_attr_dt(gVANtx0[[1]][[i]]),
    #                                  graph_attr_dt(gVANtx0[[2]][[i]]),
    #                                  graph_attr_dt(gVANtx1[[1]][[i]]),
    #                                  graph_attr_dt(gVANtx1[[2]][[i]]),
    #                                  graph_attr_dt(gWBtx0[[1]][[i]]),
    #                                  graph_attr_dt(gWBtx0[[2]][[i]]),
    #                                  graph_attr_dt(gWBtx1[[1]][[i]]),
    #                                  graph_attr_dt(gWBtx1[[2]][[i]])))
    # 
    # swxL[[i]] <- rbindlist(list(swCONl[threshold == i], 
    #                            swDANl[threshold == i], 
    #                            swDMNl[threshold == i], 
    #                            swFPNl[threshold == i], 
    #                            swSALl[threshold == i], 
    #                            swSUBl[threshold == i], 
    #                            swVANl[threshold == i],
    #                            swWBl[threshold == i])) %>% 
    #     select(Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)
    # attrNets_l[[i]] <- rbindlist(list(graph_attr_dt(gCONl0[[1]][[i]]),
    #                                  graph_attr_dt(gCONl0[[2]][[i]]),
    #                                  graph_attr_dt(gCONl1[[1]][[i]]),
    #                                  graph_attr_dt(gCONl1[[2]][[i]]),
    #                                  graph_attr_dt(gCONl2[[1]][[i]]),
    #                                  graph_attr_dt(gCONl2[[2]][[i]]),
    #                                  graph_attr_dt(gDANl0[[1]][[i]]),
    #                                  graph_attr_dt(gDANl0[[2]][[i]]),
    #                                  graph_attr_dt(gDANl1[[1]][[i]]),
    #                                  graph_attr_dt(gDANl1[[2]][[i]]),
    #                                  graph_attr_dt(gDANl2[[1]][[i]]),
    #                                  graph_attr_dt(gDANl2[[2]][[i]]),
    #                                  graph_attr_dt(gDMNl0[[1]][[i]]),
    #                                  graph_attr_dt(gDMNl0[[2]][[i]]),
    #                                  graph_attr_dt(gDMNl1[[1]][[i]]),
    #                                  graph_attr_dt(gDMNl1[[2]][[i]]),
    #                                  graph_attr_dt(gDMNl2[[1]][[i]]),
    #                                  graph_attr_dt(gDMNl2[[2]][[i]]),
    #                                  graph_attr_dt(gFPNl0[[1]][[i]]),
    #                                  graph_attr_dt(gFPNl0[[2]][[i]]),
    #                                  graph_attr_dt(gFPNl1[[1]][[i]]),
    #                                  graph_attr_dt(gFPNl1[[2]][[i]]),
    #                                  graph_attr_dt(gFPNl2[[1]][[i]]),
    #                                  graph_attr_dt(gFPNl2[[2]][[i]]),
    #                                  graph_attr_dt(gSALl0[[1]][[i]]),
    #                                  graph_attr_dt(gSALl0[[2]][[i]]),
    #                                  graph_attr_dt(gSALl1[[1]][[i]]),
    #                                  graph_attr_dt(gSALl1[[2]][[i]]),
    #                                  graph_attr_dt(gSALl2[[1]][[i]]),
    #                                  graph_attr_dt(gSALl2[[2]][[i]]),
    #                                  graph_attr_dt(gSUBl0[[1]][[i]]),
    #                                  graph_attr_dt(gSUBl0[[2]][[i]]),
    #                                  graph_attr_dt(gSUBl1[[1]][[i]]),
    #                                  graph_attr_dt(gSUBl1[[2]][[i]]),
    #                                  graph_attr_dt(gSUBl2[[1]][[i]]),
    #                                  graph_attr_dt(gSUBl2[[2]][[i]]),
    #                                  graph_attr_dt(gVANl0[[1]][[i]]),
    #                                  graph_attr_dt(gVANl0[[2]][[i]]),
    #                                  graph_attr_dt(gVANl1[[1]][[i]]),
    #                                  graph_attr_dt(gVANl1[[2]][[i]]),
    #                                  graph_attr_dt(gVANl2[[1]][[i]]),
    #                                  graph_attr_dt(gVANl2[[2]][[i]]),
    #                                  graph_attr_dt(gWBl0[[1]][[i]]),
    #                                  graph_attr_dt(gWBl0[[2]][[i]]),
    #                                  graph_attr_dt(gWBl1[[1]][[i]]),
    #                                  graph_attr_dt(gWBl1[[2]][[i]]),
    #                                  graph_attr_dt(gWBl2[[1]][[i]]),
    #                                  graph_attr_dt(gWBl2[[2]][[i]])))
    # 
    
    # attrNets_tx[[i]]$Stage <- rep.int(c(rep.int("t0", 23), rep.int("t1", 23)), 8)
    # attrNets_l[[i]]$Stage <- rep.int(c(rep.int("t0", 12), rep.int("t1", 12), rep.int("t2", 12)), 8)
    
    # attrNets_vs[[i]] <- left_join(attrNets_vs[[i]], swxVs[[i]])
    # attrNets_tx[[i]] <- left_join(attrNets_tx[[i]], swxTx[[i]])
    # attrNets_l[[i]] <- left_join(attrNets_l[[i]], swxL[[i]])
    
    # attrNets_vs[[i]] <- attrNets_vs[[i]][c(22, 26, 23, 16, 2, 27, 1, 28, 29, 3, 20, 4:15, 19, 21)]
    # attrNets_tx[[i]] <- attrNets_tx[[i]][c(22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21)]
    # attrNets_l[[i]] <- attrNets_l[[i]][c(22, 27, 23, 16, 2, 28, 1, 29, 30, 3, 20, 4:15, 19, 21)]
    
    # names(attrNets_vs[[i]])[3] <- "Network"
    # names(attrNets_tx[[i]])[3] <- "Network"
    # names(attrNets_l[[i]])[3] <- "Network"
    
    # attrNets_vs[[i]]$Network <- str_replace_all(attrNets_vs[[i]]$Network, "p", "")
    # attrNets_tx[[i]]$Network <- str_replace_all(attrNets_tx[[i]]$Network, "p", "")
    # attrNets_l[[i]]$Network <- str_replace_all(attrNets_l[[i]]$Network, "p", "")
    # attrNets[[i]]$Network <- str_replace_all(attrNets[[i]]$Network, "ower", "WB")
    # attrNets_vs[[i]]$Network <- str_replace_all(attrNets_vs[[i]]$Network, "ower", "WB")
    # attrNets_tx[[i]]$Network <- str_replace_all(attrNets_tx[[i]]$Network, "ower", "WB")
    # attrNets_l[[i]]$Network <- str_replace_all(attrNets_l[[i]]$Network, "ower", "WB")
    
    # attrNets_vs[[i]] <- attrNets_vs[[i]] %>%
    #     mutate(Study.ID = factor(Study.ID), Group = factor(Group),
    #            Network = factor(Network)) %>% data.table()
    # attrNets_tx[[i]] <- attrNets_tx[[i]] %>%
    #     mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
    #            Network = factor(Network)) %>% data.table()
    # attrNets_l[[i]] <- attrNets_l[[i]] %>%
    #     mutate(Study.ID = factor(Study.ID), Stage = factor(Stage),
    #            Network = factor(Network)) %>% data.table()
    
    # }
    
    
    # Write Attributes  -------------------------------------------------------
    
    write_rds(attrWB, "outData/rds/attrWB.rds")
    write_rds(attrSubNets, "outData/rds/attrSN.rds")
    # write_rds(attrNets_l, 'outData/rds/attrNets_l.rds')
    # write_rds(attrNets_tx, 'outData/rds/attrNets_tx.rds')
    # write_rds(attrNets_vs, 'outData/rds/attrNets_vs.rds')
    
    attrWB <- read_rds("outData/rds/attrWB.rds")
    attrSubNets <- read_rds("outData/rds/attrSN.rds")
    # attrNets_vs <- read_rds('outData/rds/attrNets_vs.rds')
    # attrNets_tx <- read_rds('outData/rds/attrNets_tx.rds')
    # attrNets_l <- read_rds('outData/rds/attrNets_l.rds')
    
    # CON -----------------------------------------------------------------------------------------
    
    aovCON <- vector('list', length = 6)
    
    aovCON[[1]] <- attrSubNets[
        Network == "CON", 
        aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
    aovCON[[2]] <- attrSubNets[
        Network == "CON", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovCON[[3]] <- attrSubNets[
    Network == "CON", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovCON[[4]] <- attrSubNets[
    Network == "CON", 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovCON[[5]] <- attrSubNets[
#     Network == "CON", 
#     aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovCON[[6]] <- attrSubNets[
    Network == "CON", 
    aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]


# vsCON <- txCON <- lDAN <- vector('list', length = 2)
# 
# vsCON[[1]][[1]] <- t.test(E.global ~ Group, data = attrCONvs)
# vsCON[[1]][[2]] <- t.test(E.local ~ Group, data = attrCONvs)
# vsCON[[1]][[3]] <- t.test(density ~ Group, data = attrCONvs)
# vsCON[[1]][[4]] <- t.test(strength ~ Group, data = attrCONvs)
# vsCON[[1]][[5]] <- t.test(Cp ~ Group, data = attrCONvs)
# vsCON[[1]][[6]] <- t.test(Lp ~ Group, data = attrCONvs)
# vsCON[[1]][[7]] <- t.test(sigma ~ Group, data = attrCONvs)
# 
# vsCON[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrCONvs)
# vsCON[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrCONvs)
# vsCON[[2]][[3]] <- cohen.d(density ~ Group, data = attrCONvs)
# vsCON[[2]][[4]] <- cohen.d(strength ~ Group, data = attrCONvs)
# vsCON[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrCONvs)
# vsCON[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrCONvs)
# vsCON[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrCONvs)
# 
# txCON[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrCONtx)
# txCON[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrCONtx)
# 
# txCON[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrCONtx)
# txCON[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrCONtx)
# 
# lCON[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrCONl))
# lCON[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrCONl))
# lCON[[1]][[3]] <- summary(aov(density ~ Stage, data = attrCONl))
# lCON[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrCONl))
# lCON[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrCONl))
# lCON[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrCONl))
# lCON[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrCONl))
# 
# lCON[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrCONl))
# lCON[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrCONl))
# lCON[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrCONl))
# lCON[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrCONl))
# lCON[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrCONl))
# lCON[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrCONl))
# lCON[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrCONl))


# DAN -----------------------------------------------------------------------------------------

aovDAN <- vector('list', length = 6)

aovDAN[[1]] <- attrSubNets[
    Network == "DAN", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDAN[[2]] <- attrSubNets[
    Network == "DAN", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDAN[[3]] <- attrSubNets[
    Network == "DAN", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDAN[[4]] <- attrSubNets[
    Network == "DAN" & !Study.ID %in% sprintf("sub-%03d", c(2, 32, 33)), 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovDAN[[5]] <- attrSubNets[
#     Network == "DAN", 
#     aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDAN[[6]] <- attrSubNets[
    Network == "DAN", 
    aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsDAN <- txDAN <- lDAN <- vector('list', length = 2)
# 
# vsDAN[[1]][[1]] <- t.test(E.global ~ Group, data = attrDANvs)
# vsDAN[[1]][[2]] <- t.test(E.local ~ Group, data = attrDANvs)
# vsDAN[[1]][[3]] <- t.test(density ~ Group, data = attrDANvs)
# vsDAN[[1]][[4]] <- t.test(strength ~ Group, data = attrDANvs)
# vsDAN[[1]][[5]] <- t.test(Cp ~ Group, data = attrDANvs)
# vsDAN[[1]][[6]] <- t.test(Lp ~ Group, data = attrDANvs)
# vsDAN[[1]][[7]] <- t.test(sigma ~ Group, data = attrDANvs)
# 
# vsDAN[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrDANvs)
# vsDAN[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrDANvs)
# vsDAN[[2]][[3]] <- cohen.d(density ~ Group, data = attrDANvs)
# vsDAN[[2]][[4]] <- cohen.d(strength ~ Group, data = attrDANvs)
# vsDAN[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrDANvs)
# vsDAN[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrDANvs)
# vsDAN[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrDANvs)
# 
# txDAN[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrDANtx)
# txDAN[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrDANtx)
# 
# txDAN[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrDANtx)
# txDAN[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrDANtx)
# 
# lDAN[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrDANl))
# lDAN[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrDANl))
# lDAN[[1]][[3]] <- summary(aov(density ~ Stage, data = attrDANl))
# lDAN[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrDANl))
# lDAN[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrDANl))
# lDAN[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrDANl))
# lDAN[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrDANl))
# 
# lDAN[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrDANl))
# lDAN[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrDANl))
# lDAN[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrDANl))
# lDAN[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrDANl))
# lDAN[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrDANl))
# lDAN[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrDANl))
# lDAN[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrDANl))


# DMN -----------------------------------------------------------------------------------------

aovDMN <- vector('list', length = 6)

aovDMN[[1]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDMN[[2]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDMN[[3]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDMN[[4]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDMN[[5]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovDMN[[6]] <- attrSubNets[
    Network == "DMN", 
    aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsDMN <- txDMN <- lDMN <- vector('list', length = 2)
# 
# vsDMN[[1]][[1]] <- t.test(E.global ~ Group, data = attrDMNvs)
# vsDMN[[1]][[2]] <- t.test(E.local ~ Group, data = attrDMNvs)
# vsDMN[[1]][[3]] <- t.test(density ~ Group, data = attrDMNvs)
# vsDMN[[1]][[4]] <- t.test(strength ~ Group, data = attrDMNvs)
# vsDMN[[1]][[5]] <- t.test(Cp ~ Group, data = attrDMNvs)
# vsDMN[[1]][[6]] <- t.test(Lp ~ Group, data = attrDMNvs)
# vsDMN[[1]][[7]] <- t.test(sigma ~ Group, data = attrDMNvs)
# 
# vsDMN[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrDMNvs)
# vsDMN[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrDMNvs)
# vsDMN[[2]][[3]] <- cohen.d(density ~ Group, data = attrDMNvs)
# vsDMN[[2]][[4]] <- cohen.d(strength ~ Group, data = attrDMNvs)
# vsDMN[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrDMNvs)
# vsDMN[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrDMNvs)
# vsDMN[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrDMNvs)
# 
# txDMN[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrDMNtx)
# 
# txDMN[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrDMNtx)
# txDMN[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrDMNtx)
# 
# lDMN[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrDMNl))
# lDMN[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrDMNl))
# lDMN[[1]][[3]] <- summary(aov(density ~ Stage, data = attrDMNl))
# lDMN[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrDMNl))
# lDMN[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrDMNl))
# lDMN[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrDMNl))
# lDMN[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrDMNl))
# 
# lDMN[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrDMNl))
# lDMN[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrDMNl))
# lDMN[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrDMNl))
# lDMN[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrDMNl))
# lDMN[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrDMNl))
# lDMN[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrDMNl))
# lDMN[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrDMNl))


# FPN -----------------------------------------------------------------------------------------

aovFPN <- vector('list', length = 6)

aovFPN[[1]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovFPN[[2]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovFPN[[3]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovFPN[[4]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovFPN[[5]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovFPN[[6]] <- attrSubNets[
    Network == "FPN", 
    aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsFPN <- txFPN <- lFPN <- vector('list', length = 2)
# 
# vsFPN[[1]][[1]] <- t.test(E.global ~ Group, data = attrFPNvs)
# vsFPN[[1]][[2]] <- t.test(E.local ~ Group, data = attrFPNvs)
# vsFPN[[1]][[3]] <- t.test(density ~ Group, data = attrFPNvs)
# vsFPN[[1]][[4]] <- t.test(strength ~ Group, data = attrFPNvs)
# vsFPN[[1]][[5]] <- t.test(Cp ~ Group, data = attrFPNvs)
# vsFPN[[1]][[6]] <- t.test(Lp ~ Group, data = attrFPNvs)
# vsFPN[[1]][[7]] <- t.test(sigma ~ Group, data = attrFPNvs)
# 
# vsFPN[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrFPNvs)
# vsFPN[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrFPNvs)
# vsFPN[[2]][[3]] <- cohen.d(density ~ Group, data = attrFPNvs)
# vsFPN[[2]][[4]] <- cohen.d(strength ~ Group, data = attrFPNvs)
# vsFPN[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrFPNvs)
# vsFPN[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrFPNvs)
# vsFPN[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrFPNvs)
# 
# txFPN[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrFPNtx)
# 
# txFPN[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrFPNtx)
# txFPN[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrFPNtx)
# 
# lFPN[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrFPNl))
# lFPN[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrFPNl))
# lFPN[[1]][[3]] <- summary(aov(density ~ Stage, data = attrFPNl))
# lFPN[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrFPNl))
# lFPN[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrFPNl))
# lFPN[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrFPNl))
# lFPN[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrFPNl))
# 
# lFPN[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrFPNl))
# lFPN[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrFPNl))
# lFPN[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrFPNl))
# lFPN[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrFPNl))
# lFPN[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrFPNl))
# lFPN[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrFPNl))
# lFPN[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrFPNl))


# SAL -----------------------------------------------------------------------------------------

aovSAL <- vector('list', length = 6)

aovSAL[[1]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSAL[[2]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSAL[[3]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSAL[[4]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSAL[[5]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSAL[[6]] <- attrSubNets[
    Network == "SAL", 
    aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsSAL <- txSAL <- lSAL <- vector('list', length = 2)
# 
# vsSAL[[1]][[1]] <- t.test(E.global ~ Group, data = attrSALvs)
# vsSAL[[1]][[2]] <- t.test(E.local ~ Group, data = attrSALvs)
# vsSAL[[1]][[3]] <- t.test(density ~ Group, data = attrSALvs)
# vsSAL[[1]][[4]] <- t.test(strength ~ Group, data = attrSALvs)
# vsSAL[[1]][[5]] <- t.test(Cp ~ Group, data = attrSALvs)
# vsSAL[[1]][[6]] <- t.test(Lp ~ Group, data = attrSALvs)
# vsSAL[[1]][[7]] <- t.test(sigma ~ Group, data = attrSALvs)
# 
# vsSAL[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrSALvs)
# vsSAL[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrSALvs)
# vsSAL[[2]][[3]] <- cohen.d(density ~ Group, data = attrSALvs)
# vsSAL[[2]][[4]] <- cohen.d(strength ~ Group, data = attrSALvs)
# vsSAL[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrSALvs)
# vsSAL[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrSALvs)
# vsSAL[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrSALvs)
# 
# txSAL[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrSALtx)
# txSAL[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrSALtx)
# 
# txSAL[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrSALtx)
# txSAL[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrSALtx)
# 
# lSAL[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrSALl))
# lSAL[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrSALl))
# lSAL[[1]][[3]] <- summary(aov(density ~ Stage, data = attrSALl))
# lSAL[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrSALl))
# lSAL[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrSALl))
# lSAL[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrSALl))
# lSAL[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrSALl))
# 
# lSAL[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrSALl))
# lSAL[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrSALl))
# lSAL[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrSALl))
# lSAL[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrSALl))
# lSAL[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrSALl))
# lSAL[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrSALl))
# lSAL[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrSALl))


# SUB -----------------------------------------------------------------------------------------

aovSUB <- vector('list', length = 6)

aovSUB[[1]] <- attrSubNets[
    Network == "SUB", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSUB[[2]] <- attrSubNets[
    Network == "SUB", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovSUB[[3]] <- attrSubNets[
    Network == "SUB", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovSUB[[4]] <- attrSubNets[
#     Network == "SUB" & !Study.ID %in% sprintf(
#         "sub-%03d", 
#         c(3, 4, 7, 10, 11, 15, 16, 17, 20, 21, 23, 24, 25, 26, 31, 34, 37)
#     ), 
#     aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovSUB[[5]] <- attrSubNets[
#     Network == "SUB", 
#     aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovSUB[[6]] <- attrSubNets[
#     Network == "SUB", 
#     aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# vsSUB <- txSUB <- lSUB <- vector('list', length = 2)
# 
# vsSUB[[1]][[1]] <- t.test(E.global ~ Group, data = attrSUBvs)
# vsSUB[[1]][[2]] <- t.test(E.local ~ Group, data = attrSUBvs)
# vsSUB[[1]][[3]] <- t.test(density ~ Group, data = attrSUBvs)
# vsSUB[[1]][[4]] <- t.test(strength ~ Group, data = attrSUBvs)
# vsSUB[[1]][[5]] <- t.test(Cp ~ Group, data = attrSUBvs)
# vsSUB[[1]][[6]] <- t.test(Lp ~ Group, data = attrSUBvs)
# vsSUB[[1]][[7]] <- t.test(sigma ~ Group, data = attrSUBvs)
# 
# vsSUB[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrSUBvs)
# vsSUB[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrSUBvs)
# vsSUB[[2]][[3]] <- cohen.d(density ~ Group, data = attrSUBvs)
# vsSUB[[2]][[4]] <- cohen.d(strength ~ Group, data = attrSUBvs)
# vsSUB[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrSUBvs)
# vsSUB[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrSUBvs)
# vsSUB[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrSUBvs)
# 
# txSUB[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrSUBtx)
# 
# txSUB[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrSUBtx)
# txSUB[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrSUBtx)
# 
# lSUB[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrSUBl))
# lSUB[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrSUBl))
# lSUB[[1]][[3]] <- summary(aov(density ~ Stage, data = attrSUBl))
# lSUB[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrSUBl))
# lSUB[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrSUBl))
# lSUB[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrSUBl))
# lSUB[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrSUBl))
# 
# lSUB[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrSUBl))
# lSUB[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrSUBl))
# lSUB[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrSUBl))
# lSUB[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrSUBl))
# lSUB[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrSUBl))
# lSUB[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrSUBl))
# lSUB[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrSUBl))


# VAN -----------------------------------------------------------------------------------------

aovVAN <- vector('list', length = 6)

aovVAN[[1]] <- attrSubNets[
    Network == "VAN", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovVAN[[2]] <- attrSubNets[
    Network == "VAN", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovVAN[[3]] <- attrSubNets[
    Network == "VAN", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovVAN[[4]] <- attrSubNets[
#     Network == "VAN", 
#     aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovVAN[[5]] <- attrSubNets[
#     Network == "VAN", 
#     aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovVAN[[6]] <- attrSubNets[
#     Network == "VAN", 
#     aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsVAN <- txVAN <- lVAN <- vector('list', length = 2)
# 
# vsVAN[[1]][[1]] <- t.test(E.global ~ Group, data = attrVANvs)
# vsVAN[[1]][[2]] <- t.test(E.local ~ Group, data = attrVANvs)
# vsVAN[[1]][[3]] <- t.test(density ~ Group, data = attrVANvs)
# vsVAN[[1]][[4]] <- t.test(strength ~ Group, data = attrVANvs)
# vsVAN[[1]][[5]] <- t.test(Cp ~ Group, data = attrVANvs)
# vsVAN[[1]][[6]] <- t.test(Lp ~ Group, data = attrVANvs)
# # vsVAN[[1]][[7]] <- t.test(sigma ~ Group, data = attrVANvs)
#     vsVAN[[1]][[7]] <- NULL
# 
# vsVAN[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrVANvs)
# vsVAN[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrVANvs)
# vsVAN[[2]][[3]] <- cohen.d(density ~ Group, data = attrVANvs)
# vsVAN[[2]][[4]] <- cohen.d(strength ~ Group, data = attrVANvs)
# vsVAN[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrVANvs)
# vsVAN[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrVANvs)
# # vsVAN[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrVANvs)
#     vsVAN[[2]][[7]] <- NULL
# 
# txVAN[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrVANtx)
# txVAN[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrVANtx)
# txVAN[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrVANtx)
# txVAN[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrVANtx)
# txVAN[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrVANtx, subset = Study.ID != "sub-027")
# txVAN[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrVANtx)
# txVAN[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrVANtx)
# 
# txVAN[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrVANtx)
# txVAN[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrVANtx)
# txVAN[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrVANtx)
# txVAN[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrVANtx)
# txVAN[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = filter(attrVANtx, Study.ID != "sub-027"))
# txVAN[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrVANtx)
# txVAN[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrVANtx)
# 
# lVAN[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrVANl))
# lVAN[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrVANl))
# lVAN[[1]][[3]] <- summary(aov(density ~ Stage, data = attrVANl))
# lVAN[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrVANl))
# lVAN[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrVANl))
# lVAN[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrVANl))
# lVAN[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrVANl))
# 
# lVAN[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrVANl))
# lVAN[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrVANl))
# lVAN[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrVANl))
# lVAN[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrVANl))
# lVAN[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrVANl))
# lVAN[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrVANl))
# lVAN[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrVANl))


# Global --------------------------------------------------------------------------------------

aovWB <- vector('list', length = 7)

aovWB[[1]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[2]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[3]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[4]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[5]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(Cp.norm) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[6]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(Lp.norm) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
aovWB[[7]] <- attrWB[
    Network == "WB", 
    aov_car(as.double(sigma) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsWB <- txWB <- lWB <- vector('list', length = 2)
# 
# vsWB[[1]][[1]] <- t.test(E.global ~ Group, data = attrWBvs)
# vsWB[[1]][[2]] <- t.test(E.local ~ Group, data = attrWBvs)
# vsWB[[1]][[3]] <- t.test(density ~ Group, data = attrWBvs)
# vsWB[[1]][[4]] <- t.test(strength ~ Group, data = attrWBvs)
# vsWB[[1]][[5]] <- t.test(Cp ~ Group, data = attrWBvs)
# vsWB[[1]][[6]] <- t.test(Lp ~ Group, data = attrWBvs)
# vsWB[[1]][[7]] <- t.test(sigma ~ Group, data = attrWBvs)
# 
# vsWB[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrWBvs)
# vsWB[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrWBvs)
# vsWB[[2]][[3]] <- cohen.d(density ~ Group, data = attrWBvs)
# vsWB[[2]][[4]] <- cohen.d(strength ~ Group, data = attrWBvs)
# vsWB[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrWBvs)
# vsWB[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrWBvs)
# vsWB[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrWBvs)
# 
# txWB[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrWBtx)
# txWB[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrWBtx)
# 
# txWB[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrWBtx)
# txWB[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrWBtx)
# 
# lWB[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrWBl))
# lWB[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrWBl))
# lWB[[1]][[3]] <- summary(aov(density ~ Stage, data = attrWBl))
# lWB[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrWBl))
# lWB[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrWBl))
# lWB[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrWBl))
# lWB[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrWBl))
# 
# lWB[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrWBl))
# lWB[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrWBl))
# lWB[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrWBl))
# lWB[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrWBl))
# lWB[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrWBl))
# lWB[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrWBl))
# lWB[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrWBl))


# Global Negative ---------------------------------------------------------

# aovWBn <- vector('list', length = 6)
# 
# aovWBn[[1]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWBn[[2]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWBn[[3]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWBn[[4]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWBn[[5]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(Cp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWBn[[6]] <- attrSubNets[
#     Network == "WBn", 
#     aov_car(as.double(Lp) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

# vsWBn <- txWBn <- lWBn <- vector('list', length = 2)
# 
# vsWBn[[1]][[1]] <- t.test(E.global ~ Group, data = attrWBvs)
# vsWBn[[1]][[2]] <- t.test(E.local ~ Group, data = attrWBvs)
# vsWBn[[1]][[3]] <- t.test(density ~ Group, data = attrWBvs)
# vsWBn[[1]][[4]] <- t.test(strength ~ Group, data = attrWBvs)
# vsWBn[[1]][[5]] <- t.test(Cp ~ Group, data = attrWBvs)
# vsWBn[[1]][[6]] <- t.test(Lp ~ Group, data = attrWBvs)
# vsWBn[[1]][[7]] <- t.test(sigma ~ Group, data = attrWBvs)
# 
# vsWBn[[2]][[1]] <- cohen.d(E.global ~ Group, data = attrWBvs)
# vsWBn[[2]][[2]] <- cohen.d(E.local ~ Group, data = attrWBvs)
# vsWBn[[2]][[3]] <- cohen.d(density ~ Group, data = attrWBvs)
# vsWBn[[2]][[4]] <- cohen.d(strength ~ Group, data = attrWBvs)
# vsWBn[[2]][[5]] <- cohen.d(Cp ~ Group, data = attrWBvs)
# vsWBn[[2]][[6]] <- cohen.d(Lp ~ Group, data = attrWBvs)
# vsWBn[[2]][[7]] <- cohen.d(sigma ~ Group, data = attrWBvs)
# 
# txWBn[[1]][[1]] <- t.test(E.global ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[2]] <- t.test(E.local ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[3]] <- t.test(density ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[4]] <- t.test(strength ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[5]] <- t.test(Cp ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[6]] <- t.test(Lp ~ Stage, paired = T, data = attrWBtx)
# txWBn[[1]][[7]] <- t.test(sigma ~ Stage, paired = T, data = attrWBtx)
# 
# txWBn[[2]][[1]] <- cohen.d(E.global ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[2]] <- cohen.d(E.local ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[3]] <- cohen.d(density ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[4]] <- cohen.d(strength ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[5]] <- cohen.d(Cp ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[6]] <- cohen.d(Lp ~ Stage, paired = T, data = attrWBtx)
# txWBn[[2]][[7]] <- cohen.d(sigma ~ Stage, paired = T, data = attrWBtx)
# 
# lWBn[[1]][[1]] <- summary(aov(E.global ~ Stage, data = attrWBl))
# lWBn[[1]][[2]] <- summary(aov(E.local ~ Stage, data = attrWBl))
# lWBn[[1]][[3]] <- summary(aov(density ~ Stage, data = attrWBl))
# lWBn[[1]][[4]] <- summary(aov(strength ~ Stage, data = attrWBl))
# lWBn[[1]][[5]] <- summary(aov(Cp ~ Stage, data = attrWBl))
# lWBn[[1]][[6]] <- summary(aov(Lp ~ Stage, data = attrWBl))
# lWBn[[1]][[7]] <- summary(aov(sigma ~ Stage, data = attrWBl))
# 
# lWBn[[2]][[1]] <- TukeyHSD(aov(E.global ~ Stage, data = attrWBl))
# lWBn[[2]][[2]] <- TukeyHSD(aov(E.local ~ Stage, data = attrWBl))
# lWBn[[2]][[3]] <- TukeyHSD(aov(density ~ Stage, data = attrWBl))
# lWBn[[2]][[4]] <- TukeyHSD(aov(strength ~ Stage, data = attrWBl))
# lWBn[[2]][[5]] <- TukeyHSD(aov(Cp ~ Stage, data = attrWBl))
# lWBn[[2]][[6]] <- TukeyHSD(aov(Lp ~ Stage, data = attrWBl))
# lWBn[[2]][[7]] <- TukeyHSD(aov(sigma ~ Stage, data = attrWBl))
