# Set up - dataframe ------------------------------------------------------

# attrP <- attrT <- attrL1 <- attrL2 <-
#     swxP <- swxT <- swxL1 <- swxL2 <-
#     vector('list', length = length(thresholds))
# 
# for (i in seq_along(thresholds)){ ## Use if more than one Threshold
# 
#     ## HC vs CU
#     lSwP <- swP[threshold == thresholds[i],
#         .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)]
# 
#     laP<- list(
#         graph_attr_dt(gP[[1]][[i]]),
#         graph_attr_dt(gP[[2]][[i]])
#     )
# 
#     swxP[[i]] <- lSwP
#     attrP[[i]] <- rbindlist(laP, fill = T)
# 
#     setkey(swxP[[i]], Study.ID, Group)
#     setkey(attrP[[i]], Study.ID, Group)
# 
#     attrP[[i]] <- swxP[[i]][attrP[[i]]][, .(
#         Study.ID, Group, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
#         E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
#         diameter, diameter.wt, density, max.comp, num.tri, transitivity,
#         assortativity, strength, num.hubs, vulnerability
#     )]
# 
#     attrP[[i]] <- do.call(data.table, rapply(attrP[[i]], function(x)
#         ifelse(is.nan(x),NA_real_,x), how="replace"))
#     attrP[[i]][, `:=`(
#         Study.ID = swxP[[i]][, Study.ID],
#         Group = swxP[[i]][, Group]
#     )]
# 
# 
#     ## Closed label
#     lSwT <- swT[threshold == thresholds[i],
#         .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)]
# 
#     laT <- list(
#         graph_attr_dt(gT0[[1]][[i]]),
#         graph_attr_dt(gT0[[2]][[i]]),
#         graph_attr_dt(gT1[[1]][[i]]),
#         graph_attr_dt(gT1[[2]][[i]])
#     )
# 
#     swxT[[i]] <- lSwT
#     attrT[[i]] <- rbindlist(laT, fill = T)
#     attrT[[i]][, 
#         Stage := factor(c(
#             rep.int("T0", nrow(covars1)),
#             rep.int("T1", nrow(covars1)))
#         )
#     ]
# 
#     setkey(swxT[[i]], Study.ID, Stage, Group)
#     setkey(attrT[[i]], Study.ID, Stage, Group)
# 
#     attrT[[i]] <- swxT[[i]][attrT[[i]]][, .(
#         Study.ID, Group, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
#         E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
#         diameter, diameter.wt, density, max.comp, num.tri, transitivity,
#         assortativity, strength, num.hubs, vulnerability
#     )]
#     attrT[[i]] <- do.call(data.table, rapply(attrT[[i]], function(x)
#         ifelse(is.nan(x), NA_real_, x), how = 'replace'))
#     attrT[[i]][, `:=`(
#         Study.ID = swxT[[i]][, Study.ID],
#         Group = swxT[[i]][, Group]
#     )]
# 
# 
#     ## Longitudinal 3 months
#     lSwL1 <- swL1[threshold == thresholds[i],
#         .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Stage)]
# 
#     laL1 <- list(
#         graph_attr_dt(gL10[[1]][[i]]),
#         graph_attr_dt(gL10[[2]][[i]]),
#         graph_attr_dt(gL11[[1]][[i]]),
#         graph_attr_dt(gL11[[2]][[i]]),
#         graph_attr_dt(gL12[[1]][[i]]),
#         graph_attr_dt(gL12[[2]][[i]])
#     )
# 
#     swxL1[[i]] <- lSwL1
#     attrL1[[i]] <- rbindlist(laL1, fill = T)
#     attrL1[[i]][, 
#         Stage := factor(c(
#             rep.int("T0", nrow(covars2)),
#             rep.int("T1", nrow(covars2)),
#             rep.int("T2", nrow(covars2)))
#         )
#     ]
# 
#     setkey(swxL1[[i]], Study.ID, Stage)
#     setkey(attrL1[[i]], Study.ID, Stage)
# 
#     attrL1[[i]] <- swxL1[[i]][attrL1[[i]]][, .(
#         Study.ID, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
#         E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
#         diameter, diameter.wt, density, max.comp, num.tri, transitivity,
#         assortativity, strength, num.hubs, vulnerability
#     )]
#     attrL1[[i]] <- do.call(data.table, rapply(attrL1[[i]], function(x)
#         ifelse(is.nan(x), NA_real_, x), how = 'replace'))
#     attrL1[[i]][, Study.ID := swxL1[[i]][, Study.ID]]
# 
# 
#     ## Longitudinal 6 months
#     lSwL2 <- swL2[threshold == thresholds[i],
#         .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Stage)]
# 
#     laL2 <- list(
#         graph_attr_dt(gL20[[1]][[i]]),
#         graph_attr_dt(gL20[[2]][[i]]),
#         graph_attr_dt(gL21[[1]][[i]]),
#         graph_attr_dt(gL21[[2]][[i]]),
#         graph_attr_dt(gL22[[1]][[i]]),
#         graph_attr_dt(gL22[[2]][[i]]),
#         graph_attr_dt(gL23[[1]][[i]]),
#         graph_attr_dt(gL23[[2]][[i]])
#     )
# 
#     swxL2[[i]] <- lSwL2
#     attrL2[[i]] <- rbindlist(laL2, fill = T)
#     attrL2[[i]][, 
#         Stage := factor(c(
#             rep.int("T0", nrow(covars3)),
#             rep.int("T1", nrow(covars3)),
#             rep.int("T2", nrow(covars3)),
#             rep.int("T3", nrow(covars3)))
#         )
#     ]
#     
# 
#     setkey(swxL2[[i]], Study.ID, Stage)
#     setkey(attrL2[[i]], Study.ID, Stage)
# 
#     attrL2[[i]] <- swxL2[[i]][attrL2[[i]]][, .(
#         Study.ID, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
#         E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
#         diameter, diameter.wt, density, max.comp, num.tri, transitivity,
#         assortativity, strength, num.hubs, vulnerability
#     )]
# 
#     attrL2[[i]] <- do.call(data.table, rapply(attrL2[[i]], function(x)
#         ifelse(is.nan(x), NA_real_, x), how = 'replace'))
#     attrL2[[i]][, Study.ID := swxL2[[i]][, Study.ID]]
# }


# Write RDS objects -------------------------------------------------------

    # write_rds(attrP, "outData/RDS/attrP.RDS")
    # write_rds(attrT, "outData/RDS/attrT.RDS")
    # write_rds(attrL1, "outData/RDS/attrL1.RDS")
    # write_rds(attrL2, "outData/RDS/attrL2.RDS")


# Read RDS objects --------------------------------------------------------

    attrP <- read_rds('outData/RDS/attrP.RDS')
    attrT <- read_rds('outData/RDS/attrT.RDS')
    attrL1 <- read_rds('outData/RDS/attrL1.RDS')
    attrL2 <- read_rds('outData/RDS/attrL2.RDS')
    
# Global --------------------------------------------------------------------------------------

# aovWB <- vector('list', length = 7)
# 
# aovWB[[1]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(E.global) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[2]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(E.local) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[3]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(density) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[4]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(strength) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[5]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(Cp.norm) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[6]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(Lp.norm) ~ Group*Stage + Error(Study.ID/Stage), .SD)]
# aovWB[[7]] <- attrWB[
#     Network == "WB", 
#     aov_car(as.double(sigma) ~ Group*Stage + Error(Study.ID/Stage), .SD)]

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


