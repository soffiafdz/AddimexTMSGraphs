# Set up - dataframe ------------------------------------------------------


attrP <- attrT <- attrL1 <- attrL2 <-
    swxP <- swxT <- swxL1 <- swxL2 <-
    vector('list', length = length(thresholds))

for (i in seq_along(thresholds)){ ## Use if more than one Threshold

    ## HC vs CU
    lSwP <- swP[threshold == thresholds[i],
        .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group)]

    laP<- list(
        graph_attr_dt(gP[[1]][[i]]),
        graph_attr_dt(gP[[2]][[i]])
    )

    swxP[[i]] <- lSwP
    attrP[[i]] <- rbindlist(laP, fill = T)

    setkey(swxP[[i]], Study.ID, Group)
    setkey(attrP[[i]], Study.ID, Group)

    attrP[[i]] <- swxP[[i]][attrP[[i]]][, .(
        Study.ID, Group, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
        E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
        diameter, diameter.wt, density, max.comp, num.tri, transitivity,
        assortativity, strength, num.hubs, vulnerability
    )]

    attrP[[i]] <- do.call(data.table, rapply(attrP[[i]], function(x)
        ifelse(is.nan(x),NA_real_,x), how="replace"))
    attrP[[i]][, `:=`(
        Study.ID = swxP[[i]][, Study.ID],
        Group = swxP[[i]][, Group]
    )]


    ## Closed label
    lSwT <- swT[threshold == thresholds[i],
        .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Group, Stage)]

    laT <- list(
        graph_attr_dt(gT0[[1]][[i]]),
        graph_attr_dt(gT0[[2]][[i]]),
        graph_attr_dt(gT1[[1]][[i]]),
        graph_attr_dt(gT1[[2]][[i]])
    )

    swxT[[i]] <- lSwT
    attrT[[i]] <- rbindlist(laT, fill = T)
    attrT[[i]][,
        Stage := factor(c(
            rep.int("T0", nrow(covars1)),
            rep.int("T1", nrow(covars1)))
        )
    ]

    setkey(swxT[[i]], Study.ID, Stage, Group)
    setkey(attrT[[i]], Study.ID, Stage, Group)

    attrT[[i]] <- swxT[[i]][attrT[[i]]][, .(
        Study.ID, Group, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
        E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
        diameter, diameter.wt, density, max.comp, num.tri, transitivity,
        assortativity, strength, num.hubs, vulnerability
    )]
    attrT[[i]] <- do.call(data.table, rapply(attrT[[i]], function(x)
        ifelse(is.nan(x), NA_real_, x), how = 'replace'))
    attrT[[i]][, `:=`(
        Study.ID = swxT[[i]][, Study.ID],
        Group = swxT[[i]][, Group]
    )]


    ## Longitudinal 3 months
    lSwL1 <- swL1[threshold == thresholds[i],
        .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Stage)]

    laL1 <- list(
        graph_attr_dt(gL10[[1]][[i]]),
        graph_attr_dt(gL10[[2]][[i]]),
        graph_attr_dt(gL11[[1]][[i]]),
        graph_attr_dt(gL11[[2]][[i]]),
        graph_attr_dt(gL12[[1]][[i]]),
        graph_attr_dt(gL12[[2]][[i]])
    )

    swxL1[[i]] <- lSwL1
    attrL1[[i]] <- rbindlist(laL1, fill = T)
    attrL1[[i]][,
        Stage := factor(c(
            rep.int("T0", nrow(covars2)),
            rep.int("T1", nrow(covars2)),
            rep.int("T2", nrow(covars2)))
        )
    ]

    setkey(swxL1[[i]], Study.ID, Stage)
    setkey(attrL1[[i]], Study.ID, Stage)

    attrL1[[i]] <- swxL1[[i]][attrL1[[i]]][, .(
        Study.ID, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
        E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
        diameter, diameter.wt, density, max.comp, num.tri, transitivity,
        assortativity, strength, num.hubs, vulnerability
    )]
    attrL1[[i]] <- do.call(data.table, rapply(attrL1[[i]], function(x)
        ifelse(is.nan(x), NA_real_, x), how = 'replace'))
    attrL1[[i]][, Study.ID := swxL1[[i]][, Study.ID]]


    ## Longitudinal 6 months
    lSwL2 <- swL2[threshold == thresholds[i],
        .(threshold, Lp, Lp.norm, Cp, Cp.norm, sigma, Study.ID, Stage)]

    laL2 <- list(
        graph_attr_dt(gL20[[1]][[i]]),
        graph_attr_dt(gL20[[2]][[i]]),
        graph_attr_dt(gL21[[1]][[i]]),
        graph_attr_dt(gL21[[2]][[i]]),
        graph_attr_dt(gL22[[1]][[i]]),
        graph_attr_dt(gL22[[2]][[i]]),
        graph_attr_dt(gL23[[1]][[i]]),
        graph_attr_dt(gL23[[2]][[i]])
    )

    swxL2[[i]] <- lSwL2
    attrL2[[i]] <- rbindlist(laL2, fill = T)
    attrL2[[i]][,
        Stage := factor(c(
            rep.int("T0", nrow(covars3)),
            rep.int("T1", nrow(covars3)),
            rep.int("T2", nrow(covars3)),
            rep.int("T3", nrow(covars3)))
        )
    ]


    setkey(swxL2[[i]], Study.ID, Stage)
    setkey(attrL2[[i]], Study.ID, Stage)

    attrL2[[i]] <- swxL2[[i]][attrL2[[i]]][, .(
        Study.ID, Stage, threshold, Lp, Lp.norm, Cp, Cp.norm, sigma,
        E.global, E.global.wt, E.local, E.local.wt, mod, mod.wt,
        diameter, diameter.wt, density, max.comp, num.tri, transitivity,
        assortativity, strength, num.hubs, vulnerability
    )]

    attrL2[[i]] <- do.call(data.table, rapply(attrL2[[i]], function(x)
        ifelse(is.nan(x), NA_real_, x), how = 'replace'))
    attrL2[[i]][, Study.ID := swxL2[[i]][, Study.ID]]
}


# Flatten data.tables -----------------------------------------------------

attrP <- rbindlist(attrP)
attrT <- rbindlist(attrT)
attrL1 <- rbindlist(attrL1)
attrL2 <- rbindlist(attrL2)


# Write RDS objects -------------------------------------------------------

write_rds(attrP, "outData/RDS/attrP.RDS")
write_rds(attrT, "outData/RDS/attrT.RDS")
write_rds(attrL1, "outData/RDS/attrL1.RDS")
write_rds(attrL2, "outData/RDS/attrL2.RDS")


# Read RDS objects --------------------------------------------------------

attrP <- read_rds('outData/RDS/attrP.RDS')
attrT <- read_rds('outData/RDS/attrT.RDS')
attrL1 <- read_rds('outData/RDS/attrL1.RDS')
attrL2 <- read_rds('outData/RDS/attrL2.RDS')
    

# Models ------------------------------------------------------------------

## Closed-label
setkey(attrT, Stage, Group, Study.ID, threshold)
dt <- attrT[clin1][threshold == thresholds[12]]
### Sigma

sigmaT0 <- lmer(sigma ~ Stage + (1|Study.ID), dt)
sigmaT1 <- lmer(sigma ~ Stage*Group + (1|Study.ID), dt)
sigmaT2 <- lmer(sigma ~ Stage* Group + VAS + (1|Study.ID), dt)
sigmaT3 <- lmer(sigma ~ Stage * Group + B11Tot + (1|Study.ID), dt)
sigmaT4 <- lmer(sigma ~ Stage * Group + VAS + B11Tot + (1|Study.ID), dt)
anova(sigmaT0, sigmaT1, sigmaT2, sigmaT3, sigmaT4)
summary(sigmaT1)
    
   l2B0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B1 <- lmer(Score ~ GroupBIS + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B3 <- lmer(Score ~ Stage + GroupBIS + (1|Study.ID), 
    grMedClinLongL2[Scale == 'B11Tot'])
anova(l2B0, l2B1, l2B2, l2B3)
summary(glht(l2B2, linfct = mcp(Stage = "Tukey"))) 

