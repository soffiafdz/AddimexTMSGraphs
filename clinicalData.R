
# Raw data  ---------------------------------------------------------------

inClinDir <- 'inData/clinical_data/20190828/'

# data_amai <- read_excel(paste0(inClinDir, 'AMA INSE 8x7.xlsx'), sheet = 2)
# data_calendar <- read_excel(paste0(inClinDir, 'Calendar.xlsx'), 
#     sheet = 2, na = 'NA')
# data_ehi <- read_excel(paste0(inClinDir, 'EHI-SF.xlsx'), sheet = 1)
# data_hars <- read_excel(paste0(inClinDir, 'HARS.xlsx'), sheet = 2)
# data_hdrs <- read_excel(paste0(inClinDir, 'HDRS.xlsx'), sheet = 2)
# data_mini <- read_excel(paste0(inClinDir, 'MINI PLUS.xlsx'), sheet = 1)
# data_psqi <- read_excel(paste0(inClinDir, 'PSQI.xlsx'), sheet = 1, na = 'NA')
# data_scl90 <- read_excel(paste0(inClinDir, 'SCL-90-R.xlsx'), sheet = 1)
# data_whodas <- read_excel(paste0(inClinDir, 'WHODAS 2,0 X.xlsx'), 
#     sheet = 1, na = 'NA')

data_bis11 <- read_excel(paste0(inClinDir, 'BIS-11.xlsx'), sheet = 2)
data_ccqg <- read_excel(paste0(inClinDir, 'CCQ-G.xlsx'), sheet = 1)
data_ccqn <- read_excel(paste0(inClinDir, 'CCQ-N.xlsx'), sheet = 1)
data_vas <- read_excel(paste0(inClinDir, 'VAS Clinico.xlsx'), sheet = 1)
data_asip <- read_excel(paste0(inClinDir, 'ASIP.xlsx'), sheet = 1, na = 'NA')
data_tobacco <- read_excel(paste0(inClinDir, 'Tobacco.xlsx'), sheet = 1)
data_inventory <- read_excel(paste0(inClinDir, 'Inventory.xlsx'),
    sheet = 1, na = 'NA')
data_cal2 <- read_excel(paste0(inClinDir, 'CalendarRelative.xlsx'), 
    sheet = 2, na = 'NA')


# Master Clinical ---------------------------------------------------------

clinical <- data_vas %>% 
    left_join(data_ccqg[c(1:3, 49)]) %>%
    left_join(data_ccqn[c(1:3, 49)]) %>%
    left_join(data_bis11[c(1:3, 34:37)]) %>%
    left_join(data_inventory[c(1:3, 19:20, 23:24, 26, 28)]) %>%
    left_join(data_asip[c(1:3, 68)]) %>%
    left_join(data_cal2[c(1:3, 17)]) %>%
    mutate(stage = ifelse(
        rid == 15, ifelse(
            stage == 'T3', 'T2', ifelse(
                stage == 'T4', 'T3', stage)
            ), stage
        )
    ) %>% 
    filter(stage %in% c("T0", "T1", "T1-4", "T2", "T3")) %>%
    dplyr::rename(
        Study.ID = rid, Group = group, Stage = stage, 
        B11C = cog, B11M = mot, B11NP = nonp, B11Tot = tot_score, 
        CCQG = ccq_g, CCQN = ccq_n, VAS = vas, 
        UT_bzd = ut_bzd, UT_coc = ut_coc, UT_thc = ut_thc, 
        Consume = auto1, Grams_month = auto3, Improvement = auto5, 
        Coc_last30 = d8cc30, Grams0 = "gram_-1"
    ) %>%
    mutate(Study.ID = factor(paste0("sub-", sprintf("%03d", Study.ID))),
        Group = factor(Group, labels = c("Sham", "Tx")),
        Stage = factor(Stage, labels = c("T0", "T1", "T1-4", "T2", "T3")),
        VAS = round(as.double(VAS), digits = 2),
        UT_bzd = factor(UT_bzd, labels = c("positive", "negative")),
        UT_coc = factor(UT_coc, labels = c("positive", "negative")),
        UT_thc = factor(UT_thc, labels = c("positive", "negative")),
        Consume = factor(Consume, labels = c("Yes", "No")),
        Improvement = factor(
            Improvement, labels = c(
                "Better", "Moderately better", "Slightly better",
                "No changes", "Worse", "Moderately worse"
            )
        ),
        Grams_month = as.double(Grams_month),
        Grams = case_when(
            Consume == "No" ~ 0,
            Consume == "Yes" ~ Grams_month,
            is.na(Consume) ~ Grams0),
        Grams = if_else(Coc_last30 == 0, 0, Grams),
        Grams = if_else(is.na(Grams), 0, Grams)
    ) %>%
    dplyr::select(-Grams0, -Grams_month) %>%
    data.table()

write_rds(clinical, 'outData/RDS/clinical.RDS')


# Clinical: Closed label --------------------------------------------------

clin1 <- clinical[Stage %in% c('T0', 'T1') & Study.ID %in% covars1[,Study.ID]]

clinDelta <- melt(clin1[, 1:10], measure.vars = c(4:10))

clinDelta <- dcast(
    clinDelta, Study.ID + Group + variable ~ Stage, value.var = 'value'
)

clin1_2 <- melt(clinDelta, measure.vars = c(4:5))
clin1_2 <- dcast(clin1_2, Study.ID + Group ~ variable.1 + variable, value.var = 'value')

clinDelta <- dcast(
    clinDelta[, Delta := T1 - T0][, c(1:3, 6)], 
    Study.ID + Group ~ variable, value.var = 'Delta'
)


setkey(clin1, Stage, Group, Study.ID)
setkey(clin1_2, Group, Study.ID)

# Clinical: Longitudinal 3 months -----------------------------------------

clin2 <- rbindlist(list(
    clinical[Group == 'Sham' & 
            Stage != 'T3' & 
            Study.ID %in% covars2[, Study.ID]][Stage != 'T1'],
    clinical[Group == 'Tx' & 
            Stage != 'T3' & 
            Study.ID %in% covars2[, Study.ID]]
))

clin2[Group == 'Sham' & Stage == 'T1-4', Stage := 'T1']
clin2[, `:=`(
    Group = NULL,
    Stage = factor(Stage)
)]

setkey(clin2, Stage, Study.ID)

# Clinical: Longitudinal 6 months -----------------------------------------

clin3 <- rbindlist(list(
    clinical[Group == 'Sham' & 
            Study.ID %in% covars3[, Study.ID]][Stage != 'T1'],
    clinical[Group == 'Tx' &
            Study.ID %in% covars3[, Study.ID]]
))

clin3[Group == 'Sham' & Stage == 'T1-4', Stage := 'T1']
clin3[, `:=`(
    Group = NULL,
    Stage = factor(Stage)
)]

setkey(clin3, Stage, Study.ID)


# Write RDS objects -------------------------------------------------------

write_rds(clin1, "outData/RDS/clin1.RDS")
write_rds(clin2, "outData/RDS/clin2.RDS")
write_rds(clin3, "outData/RDS/clin3.RDS")
# fwrite(clin1Delta, "outData/clinicalDelta.csv")


# Read RDS objects --------------------------------------------------------

clin1 <- read_rds('outData/RDS/clin1.RDS')
clin2 <- read_rds('outData/RDS/clin2.RDS')
clin3 <- read_rds('outData/RDS/clin3.RDS')


# Closed label ------------------------------------------------------------

### Correlation Craving & Impulsivity 

corrClin <- melt(clin1, id.vars = c(1, 3, 10), measure.vars = 4:6, 
                 variable.name = "Craving_measure", value.name = "Craving_value")
corrClin[Stage == "T0", cor.test(Craving_value, B11Tot), by = Craving_measure][
    , c(1,5,4,10)]
corrClin[Stage == "T1", cor.test(Craving_value, B11Tot), by = Craving_measure][
    , c(1,5,4,10)]

### Baseline comparison by Urine Test

utClin <- melt(clin1, id.vars = c(1,3,12), measure.vars = c(4:6, 10),
               variable.name = "Scale", value.name = "Score")

utClin[Stage == "T0", t.test(Score ~ UT_coc), by = Scale][, c(1:2,4:5)]
utClin[Stage == "T0", cohen.d(Score ~ UT_coc), by = Scale][, c(1:2,4:7,9)]

### Median separation

grMedClin <- melt(
    clin1, id.vars = 1:3, measure.vars = c(4:6, 10), 
    variable.name = "Scale", value.name = "Score"
)

mediansClinTx <- grMedClin[
    Group == "Tx" & Stage == "T0", .(Median = median(Score)), by = Scale
]

mediansClinSham <- grMedClin[
    Group == "Sham" & Stage == "T0", .(Median = median(Score)), by = Scale
]

grMedClin[, Stage_Scale := ifelse(Stage == "T0",
                                  paste0("Pre_", Scale),
                                  paste0("Post_", Scale))]

grMedClin <- dcast.data.table(grMedClin, Study.ID + Group ~ Stage_Scale, value.var = "Score")

grMedClin[, `:=`(
    GroupVAS = as.factor(
        ifelse(Group == "Sham", "Sham", 
            ifelse(Pre_VAS < mediansClinTx[[1,2]], "real_<", "real_>")
            )
        ),
    GroupCCQG = as.factor(
        ifelse(Group == "Sham", "Sham", 
            ifelse(Pre_CCQG < mediansClinTx[[2,2]], "real_<", "real_>")
            )
        ),
    GroupCCQN = as.factor(
        ifelse(Group == "Sham", "Sham", 
            ifelse(Pre_CCQN < mediansClinTx[[3,2]], "real_<", "real_>")
            )
        ),
    GroupBIS = as.factor(
        ifelse(Group == "Sham", "Sham", 
            ifelse(Pre_B11Tot < mediansClinTx[[4,2]], "real_<", "real_>")
            )
        )
    )
]

grMedClin[, `:=`(
    GroupVAS2 = as.factor(
        case_when(GroupVAS == "real_<" ~ "r_<", 
            GroupVAS == "real_>" ~ "r_>",
            GroupVAS == "Sham" & Pre_VAS <= mediansClinSham[[1,2]] ~ "s_<",
            GroupVAS == "Sham" & Pre_VAS > mediansClinSham[[1,2]] ~ "s_>"
            )
        ),
    GroupCCQG2 = as.factor(
        case_when(GroupCCQG == "real_<" ~ "r_<",
            GroupCCQG == "real_>" ~ "r_>",
            GroupCCQG == "Sham" & Pre_CCQG <= mediansClinSham[[2,2]] ~ "s_<",
            GroupCCQG == "Sham" & Pre_CCQG > mediansClinSham[[2,2]] ~ "s_>"
            )
        ),
    GroupCCQN2 = as.factor(
        case_when(GroupCCQN == "real_<" ~ "r_<",
            GroupCCQN == "real_>" ~ "r_>",
            GroupCCQN == "Sham" & Pre_CCQN <= mediansClinSham[[3,2]] ~ "s_<",
            GroupCCQN == "Sham" & Pre_CCQN > mediansClinSham[[3,2]] ~ "s_>"
            )
        ),
    GroupBIS2 = as.factor(
        case_when(GroupBIS == "real_<" ~ "r_<",
            GroupBIS == "real_>" ~ "r_>",
            GroupBIS == "Sham" & Pre_B11Tot <= mediansClinSham[[4,2]] ~ "s_<",
            GroupBIS == "Sham" & Pre_B11Tot > mediansClinSham[[4,2]] ~ "s_>"
            )
        )
    )
]

grMedClin[, `:=`(
    GroupVAS3 = as.factor(
        ifelse(str_detect(GroupVAS2, ">"), ">", "<")
        ),
    GroupCCQG3 = as.factor(
        ifelse(str_detect(GroupCCQG2, ">"), ">", "<")
        ),
    GroupCCQN3 = as.factor(
        ifelse(str_detect(GroupCCQN2, ">"), ">", "<")
        ),
    GroupBIS3 = as.factor(
        ifelse(str_detect(GroupBIS2, ">"), ">", "<")
        )
    )
]

grMedClin[, `:=`(
    DeltaVAS = Post_VAS - Pre_VAS,
    DeltaCCQG = Post_CCQG - Pre_CCQG,
    DeltaCCQN = Post_CCQN - Pre_CCQN,
    DeltaBIS = Post_B11Tot - Pre_B11Tot,
    GroupVAS = NULL,
    GroupCCQG = NULL,
    GroupCCQN = NULL,
    GroupBIS = NULL,
    GroupVAS2 = NULL,
    GroupCCQG2 = NULL,
    GroupCCQN2 = NULL,
    GroupBIS2 = NULL
    )
]

grMedClinLong <- melt(
    grMedClin, measure.vars = 3:10, 
    variable.name = "Scale", value.name = "Score"
)

grMedClinLong[, c("Stage", "Scale") := tstrsplit(Scale, "[te]_")]
grMedClinLong[, `:=`(
    Scale = factor(Scale),
    Stage = factor(Stage, levels = c("Pr", "Pos"), labels = c("T0", "T1")),
    Delta = Score - rep(grMedClinLong[Stage == "Pr", Score],2)
    )
]

### VAS

predVAS <- lm(Post_VAS ~ Group + Pre_VAS + Pre_B11Tot, data = grMedClin)

### CCQ General

predCCQG <- lm(Post_CCQG ~ Group + Pre_CCQG + Pre_B11Tot, data = grMedClin)

### CCQ Now

predCCQN <- lm(Post_CCQN ~ Group + Pre_CCQN + Pre_B11Tot, data = grMedClin)

### Barratt's

predBIS <- lm(
    Post_B11Tot ~ Group + Pre_B11Tot + Pre_CCQN + Pre_CCQG + Pre_VAS, 
    data = grMedClin
)

stargazer(predVAS, predCCQG, predCCQN, predBIS,
    title = "Regresiones lineales multivariadas de mediciones clínicas con grupo de tratamiento como predictor y mediciones basales como covariantes",
    dep.var.caption = "Mediciones clínicas (Fase Post)",
    dep.var.labels = c("VAS", "CCQ-G", "CCQ-N", "BIS-11"),
    covariate.labels = c("Grupo(Real)", "VAS", "CCQ-G", "CCQ-N", "B11"),
    no.space = T)


#### X^2 
clin1[, Improvement := factor(Improvement)]
chisq.test(table(
    clin1[Stage == 'T1', c('Consume', 'Group')]
))
chisq.test(table(
    clin1[Stage == 'T1', c('Improvement', 'Group')]
))

# Longitudinal 1 ----------------------------------------------------------

grMedClinL1 <- melt(
    clin2, id.vars = 1:2, measure.vars = c(3:5, 9), 
    variable.name = "Scale", value.name = "Score"
)

mediansClinL1 <- grMedClinL1[
    Stage == "T0", .(Median = median(Score)), by = Scale
    ]

grMedClinL1 <- dcast.data.table(
    grMedClinL1, Study.ID ~ Stage + Scale, value.var = "Score"
)

grMedClinL1[, `:=`(
    GroupVAS = as.factor(
        ifelse(T0_VAS < mediansClinL1[[1,2]], "<", ">")
        ),
    GroupCCQG = as.factor(
        ifelse(T0_CCQG < mediansClinL1[[2,2]], "<", ">")
        ),
    GroupCCQN = as.factor(
        ifelse(T0_CCQN < mediansClinL1[[3,2]], "<", ">")
        ),
    GroupBIS = as.factor(
            ifelse(T0_B11Tot < mediansClinL1[[4,2]], "<", ">")
        )
    )
]

grMedClinLongL1 <- melt(
    grMedClinL1, measure.vars = 2:13, 
    variable.name = "Scale", value.name = "Score"
)

grMedClinLongL1[, c("Stage", "Scale") := tstrsplit(Scale, "_")]
grMedClinLongL1[, `:=`(
    Scale = factor(Scale)
)
    ]

setkey(grMedClinLongL1, Study.ID)
setkey(covars2, Study.ID)
grMedClinLongL1 <- grMedClinLongL1[covars2]

## VAS
l1V0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL1[Scale == 'VAS'])
l1V1 <- lmer(Score ~ GroupVAS + (1|Study.ID), grMedClinLongL1[Scale == 'VAS'])
l1V2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL1[Scale == 'VAS'])
l1V3 <- lmer(Score ~ Stage + GroupVAS + age + sex + education + (1|Study.ID), 
    grMedClinLongL1[Scale == 'VAS'])
anova(l1V0, l1V1, l1V2, l1V3)
summary(glht(l1V3, linfct = mcp(Stage = "Tukey")))

## CCQ Now
l1N0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL1[Scale == 'CCQN'])
l1N1 <- lmer(Score ~ GroupCCQN + (1|Study.ID), grMedClinLongL1[Scale == 'CCQN'])
l1N2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL1[Scale == 'CCQN'])
l1N3 <- lmer(Score ~ Stage + GroupCCQN + age + sex + education + (1|Study.ID), 
    grMedClinLongL1[Scale == 'CCQN'])
anova(l1N0, l1N1, l1N2, l1N3)
summary(glht(l1N3, linfct = mcp(Stage = "Tukey")))

## CCQ General
l1G0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL1[Scale == 'CCQG'])
l1G1 <- lmer(Score ~ GroupCCQN + (1|Study.ID), grMedClinLongL1[Scale == 'CCQG'])
l1G2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL1[Scale == 'CCQG'])
l1G3 <- lmer(Score ~ Stage + GroupCCQG + age + sex + education + (1|Study.ID), 
    grMedClinLongL1[Scale == 'CCQG'])
anova(l1G0, l1G1, l1G2, l1G3)
summary(glht(l1G3, linfct = mcp(Stage = "Tukey")))

## Barrat's
l1B0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL1[Scale == 'B11Tot'])
l1B1 <- lmer(Score ~ GroupBIS + (1|Study.ID), grMedClinLongL1[Scale == 'B11Tot'])
l1B2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL1[Scale == 'B11Tot'])
l1B3 <- lmer(Score ~ Stage + GroupBIS + age + sex + education + (1|Study.ID), 
    grMedClinLongL1[Scale == 'B11Tot'])
anova(l1B0, l1B1, l1B2, l1B3)
summary(glht(l1B2, linfct = mcp(Stage = "Tukey")))

stargazer(l1V3, l1N3, l1G3, l1B3,
    title = "Modelos de efectos mixtos de mediciones clínicas longitudinales (a tres meses) con grupo de puntaje basal y medidas demográficas como covariantes",
    dep.var.caption = "Mediciones clínicas ",
    dep.var.labels = c("VAS", "CCQ-N", "CCQ-G", "BIS-11"),
    covariate.labels = c("Stage(T1)", "Stage(T2)", "Mediana(VAS)", "Mediana(CCQN)", "Mediana(CCQG)", "Mediana(BIS)", "Edad", "Sexo(F)", "Educación", "Constante"),
    no.space = T)

# Longitudinal 2 ----------------------------------------------------------

grMedClinL2 <- melt(
    clin3, id.vars = 1:2, measure.vars = c(3:5, 9), 
    variable.name = "Scale", value.name = "Score"
)

mediansClinL2 <- grMedClinL2[
    Stage == "T0", .(Median = median(Score)), by = Scale
    ]

grMedClinL2 <- dcast.data.table(
    grMedClinL2, Study.ID ~ Stage + Scale, value.var = "Score"
)

grMedClinL2[, `:=`(
    GroupVAS = as.factor(
        ifelse(T0_VAS < mediansClinL2[[1,2]], "<", ">")
    ),
    GroupCCQG = as.factor(
        ifelse(T0_CCQG < mediansClinL2[[2,2]], "<", ">")
    ),
    GroupCCQN = as.factor(
        ifelse(T0_CCQN < mediansClinL2[[3,2]], "<", ">")
    ),
    GroupBIS = as.factor(
        ifelse(T0_B11Tot < mediansClinL2[[4,2]], "<", ">")
    )
)
    ]

grMedClinLongL2 <- melt(
    grMedClinL2, measure.vars = 2:17, 
    variable.name = "Scale", value.name = "Score"
)

grMedClinLongL2[, c("Stage", "Scale") := tstrsplit(Scale, "_")]
grMedClinLongL2[, `:=`(
    Scale = factor(Scale)
)
    ]

setkey(grMedClinLongL2, Study.ID)
setkey(covars3, Study.ID)
grMedClinLongL2 <- grMedClinLongL2[covars3]
## VAS
l2V0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'VAS'])
l2V1 <- lmer(Score ~ GroupVAS + (1|Study.ID), grMedClinLongL2[Scale == 'VAS'])
l2V2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'VAS'])
l2V3 <- lmer(Score ~ Stage + GroupVAS + age + sex + education + (1|Study.ID), 
    grMedClinLongL2[Scale == 'VAS'])
anova(l2V0, l2V1, l2V2, l2V3)
summary(glht(l2V3, linfct = mcp(Stage = "Tukey")))

## CCQ Now
l2N0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'CCQN'])
l2N1 <- lmer(Score ~ GroupCCQN + (1|Study.ID), grMedClinLongL2[Scale == 'CCQN'])
l2N2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'CCQN'])
l2N3 <- lmer(Score ~ Stage + GroupCCQN + age + sex + education + (1|Study.ID), 
    grMedClinLongL2[Scale == 'CCQN'])
anova(l2N0, l2N1, l2N2, l2N3)
summary(glht(l2N3, linfct = mcp(Stage = "Tukey")))

## CCQ General
l2G0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'CCQG'])
l2G1 <- lmer(Score ~ GroupCCQN + (1|Study.ID), grMedClinLongL2[Scale == 'CCQG'])
l2G2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'CCQG'])
l2G3 <- lmer(Score ~ Stage + GroupCCQG + age + sex + education + (1|Study.ID), 
    grMedClinLongL2[Scale == 'CCQG'])
anova(l2G0, l2G1, l2G2, l2G3)
summary(glht(l2G3, linfct = mcp(Stage = "Tukey")))

## Barrat's
l2B0 <- lmer(Score ~ (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B1 <- lmer(Score ~ GroupBIS + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B2 <- lmer(Score ~ Stage + (1|Study.ID), grMedClinLongL2[Scale == 'B11Tot'])
l2B3 <- lmer(Score ~ Stage + GroupBIS + age + sex + education + (1|Study.ID), 
    grMedClinLongL2[Scale == 'B11Tot'])
anova(l2B0, l2B1, l2B2, l2B3)
summary(glht(l2B2, linfct = mcp(Stage = "Tukey")))

stargazer(l2V3, l2N3, l2G3, l2B3,
    title = "Modelos de efectos mixtos de mediciones clínicas longitudinales (a seis meses) con grupo de puntaje basal y medidas demográficas como covariantes",
    dep.var.caption = "Mediciones clínicas ",
    dep.var.labels = c("VAS", "CCQ-N", "CCQ-G", "BIS-11"),
    covariate.labels = c("Fase(T1)", "Fase(T2)", "Fase(T3)", "Mediana(VAS)", "Mediana(CCQN)", "Mediana(CCQG)", "Mediana(BIS)", "Edad", "Sexo(F)", "Educación", "Constante"),
    no.space = T)

