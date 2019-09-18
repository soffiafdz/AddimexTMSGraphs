# source('setUp.R')
# source('clinicalData.R')
# source('sigma.R')

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


# Flatten data.tables -----------------------------------------------------

# attrP <- rbindlist(attrP)
# attrT <- rbindlist(attrT)
# attrL1 <- rbindlist(attrL1)
# attrL2 <- rbindlist(attrL2)


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
    

# Models ------------------------------------------------------------------

## VS
setkey(attrP, Group, Study.ID, threshold)
dt <- attrP[covarsP][threshold == thresholds[10]]

vsMod1 <- lm(density ~ Group + sex + age + education, dt)
vsMod2 <- lm(strength ~ Group + sex + age + education, dt)
vsMod3 <- lm(E.global ~ Group + sex + age + education, dt)
vsMod4 <- lm(E.local ~ Group + sex + age + education, dt)
vsMod5 <- lm(Lp ~ Group + sex + age + education, dt)
vsMod6 <- lm(Cp ~ Group + sex + age + education, dt)
vsMod7 <- lm(sigma ~ Group + sex + age + education, dt)

stargazer(vsMod1, vsMod2, vsMod3, vsMod4, vsMod7, 
    title = "Regresiones lineales multivariadas de la topología de red con
    sexo, edad y educación como covariantes", 
    dep.var.caption = 'Variables dependientes', 
    dep.var.labels = c("Densidad", "Fuerza", "E.Global", "E.Local", "P.Mundo"),
    covariate.labels = c("Grupo(HC)", "Sexo(F)", "Edad", "Educación"), 
    no.space = T)


## Closed-label
setkey(clin1, Study.ID, Stage)
setkey(attrT, Study.ID, Stage)
dt <- attrT[clin1][threshold == thresholds[10]]
setkey(dt, Study.ID)
setkey(covars1, Study.ID)
dt <- dt[covars1]

### Density

densT0 <- lmer(
    density ~ Stage + sex + age + education + (1|Study.ID), dt
)
densT1 <- lmer(
    density ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
densT2 <- lmer(
    density ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(densT0, densT1, densT2)
stargazer(densT0, densT1, densT2)

### Strength

strT0 <- lmer(
    strength ~ Stage + sex + age + education + (1|Study.ID), dt
)
strT1 <- lmer(
    strength ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
strT2 <- lmer(
    strength ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(strT0, strT1, strT2)
stargazer(strT0, strT1, strT2)

### Efficiency (local)

elT0 <- lmer(
    E.local ~ Stage + sex + age + education + (1|Study.ID), dt
)
elT1 <- lmer(
    E.local ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
elT2 <- lmer(
    E.local ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(elT0, elT1, elT2)
stargazer(elT0, elT1, elT2)

### Efficiency (global)

egT0 <- lmer(
    E.global ~ Stage + sex + age + education + (1|Study.ID), dt
)
egT1 <- lmer(
    E.global ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
egT2 <- lmer(
    E.global ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(egT0, egT1, egT2)
stargazer(egT0, egT1, egT2)

### Lp

lpT0 <- lmer(
    Lp ~ Stage + sex + age + education + (1|Study.ID), dt
)
lpT1 <- lmer(
    Lp ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
lpT2 <- lmer(
    Lp ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(lpT0, lpT1, lpT2)
stargazer(lpT0, lpT1, lpT2)

### Cp

cpT0 <- lmer(
    Cp ~ Stage + sex + age + education + (1|Study.ID), dt
)
cpT1 <- lmer(
    Cp ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
cpT2 <- lmer(
    Cp ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(cpT0, cpT1, cpT2)
stargazer(cpT0, cpT1, cpT2)

### Sigma

sigmaT0 <- lmer(
    sigma ~ Stage + sex + age + education + (1|Study.ID), dt
)
sigmaT1 <- lmer(
    sigma ~ Stage*Group + sex + age + education + (1|Study.ID), dt
)
sigmaT2 <- lmer(
    sigma ~ Stage*Group + VAS + B11Tot + sex + age + education +
        (1|Study.ID), dt
)
anova(sigmaT0, sigmaT1, sigmaT2)
stargazer(sigmaT0, sigmaT1, sigmaT2)

stargazer(densT2, strT2, elT2, egT2,
    title = "Regresiones lineales multivariadas de topología de red en fase cerrada de tratamiento con sexo, edad y educación como covariantes", 
    dep.var.caption = 'Variables dependientes', 
    dep.var.labels = c("Densidad", "Fuerza", "E.Local", "E.Global"),
    covariate.labels = c(
        "Fase(Post-)", "Grupo(Real)", "VAS", "B11", "Sexo(F)", "Edad", 
        "Educación", "Fase:Grupo"
    ),
    no.space = T)

stargazer(lpT2, cpT2, sigmaT2,
    title = "Regresiones lineales multivariadas de métricas de pequeño mundo en fase cerrada de tratamiento con sexo, edad y educación como covariantes", 
    dep.var.caption = 'Variables dependientes', 
    dep.var.labels = c("L.Camino", "C.Agrupamiento", "P.Mundo"),
    covariate.labels = c(
        "Fase(Post-)", "Grupo(Real)", "VAS", "B11", "Sexo(F)", "Edad", 
        "Educación", "Fase:Grupo"
    ),
    no.space = T)














l2B0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B1 <- lmer(Score ~ GroupBIS + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B3 <- lmer(Score ~ Stage + GroupBIS + (1|Study.ID), 
    grMedClinLongL2[Scale == 'B11Tot'])
anova(l2B0, l2B1, l2B2, l2B3)
summary(glht(l2B2, linfct = mcp(Stage = "Tukey"))) 

