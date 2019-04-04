
# Raw data  -----------------------------------------------------------------------------------

data_amai <- read_excel('inData/clinical_data/Dic_2018/AMA INSE 8x7.xlsx', sheet = 2)
data_asip <- read_excel('inData/clinical_data/Dic_2018/ASIP.xlsx', sheet = 1, na = 'NA')
data_bis11 <- read_excel('inData/clinical_data/Dic_2018/BIS-11.xlsx', sheet = 2)
data_calendar <- read_excel('inData/clinical_data/Dic_2018/Calendar.xlsx', sheet = 2, na = 'NA')
data_cal2 <- read_excel('inData/clinical_data/Dic_2018/CalendarRelative.xlsx', sheet = 2, na = 'NA')
data_ccqg <- read_excel('inData/clinical_data/Dic_2018/CCQ-G.xlsx', sheet = 1)
data_ccqn <- read_excel('inData/clinical_data/Dic_2018/CCQ-N.xlsx', sheet = 1)
data_ehi <- read_excel('inData/clinical_data/Dic_2018/EHI-SF.xlsx', sheet = 1)
data_hars <- read_excel('inData/clinical_data/Dic_2018/HARS.xlsx', sheet = 2)
data_hdrs <- read_excel('inData/clinical_data/Dic_2018/HDRS.xlsx', sheet = 2)
data_inventory <- read_excel('inData/clinical_data/Dic_2018/Inventory.xlsx', sheet = 1, na = 'NA')
data_mini <- read_excel('inData/clinical_data/Dic_2018/MINI PLUS.xlsx', sheet = 1)
data_psqi <- read_excel('inData/clinical_data/Dic_2018/PSQI.xlsx', sheet = 1, na = 'NA')
data_scl90 <- read_excel('inData/clinical_data/Dic_2018/SCL-90-R.xlsx', sheet = 1)
data_tobacco <- read_excel('inData/clinical_data/Dic_2018/Tobacco.xlsx', sheet = 1)
data_vas <- read_excel('inData/clinical_data/Dic_2018/VAS Clinico.xlsx', sheet = 1)
data_whodas <- read_excel('inData/clinical_data/Dic_2018/WHODAS 2,0 X.xlsx', sheet = 1, na = 'NA')
data_demog <- read_excel('inData/clinical_data/Dic_2018/DEMOGRAPHIC.xlsx', sheet = 1, na = 'NA')


# Demographics --------------------------------------------------------------------------------

sd <- left_join(data_demog, data_tobacco, by = c("rid", "group", "stage")) %>% 
    select(1:2, 5:7, 16:17, 25:28) %>% 
    filter(!rid %in% c(5, 9, 14, 28:29)) %>% 
    mutate(rid = factor(rid), 
           group = factor(group, labels = c("Sham", "Tx")),
           q1_sex = factor(q1_sex, labels = c("Male", "Female")),
           consumption = factor(consumption, labels = c("No", "Yes")),
           cig_day = as.double(cig_day)) %>% 
    as.data.table()
names(sd) <- sd_names <- c("RID", "Group", "Sex", "Age", "Education_years", 
                           "Starting_age", "Years_consumption", "Tobacco_consumption", 
                           "Tobacco_start", "Tobacco_years", "Cigs_day") 


# Clinical ------------------------------------------------------------------------------------

clinical <- data_vas %>% 
    left_join(data_ccqg[c(1:3, 49)]) %>% 
    left_join(data_ccqn[c(1:3, 49)]) %>% 
    left_join(data_bis11[c(1:3, 34:37)]) %>% 
    left_join(data_inventory[c(1:2,4, 19:20, 23:24, 26, 28)]) %>% 
    left_join(data_asip[c(1:3, 68)]) %>% 
    left_join(data_cal2[c(1:3, 17)]) %>% 
    filter(stage %in% c("T0", "T1", "T1-4", "T2")) %>% 
    dplyr::rename(Study.ID = rid, Group = group, Stage = stage, B11_C = cog, 
                  B11_M = mot, B11_NP = nonp, B11_Tot = tot_score, 
                  CCQ_G = ccq_g, CCQ_N = ccq_n, VAS = vas, 
                  UT_bzd = ut_bzd, UT_coc = ut_coc, UT_thc = ut_thc, 
                  Consume = auto1, Coc_last30 = d8cc30, Grams0 = "gram_-1", 
                  Grams_month = auto3, Improvement = auto5) %>% 
    mutate(Study.ID = factor(paste0("sub-", sprintf("%03d", Study.ID))),
           Group = factor(Group, labels = c("sham", "tx")),
           Stage = factor(Stage, labels = c("t0", "t1", "t1-4", "t2")),
           VAS = as.double(VAS), 
           UT_bzd = factor(UT_bzd, labels = c("positive", "negative")),
           UT_coc = factor(UT_coc, labels = c("positive", "negative")),
           UT_thc = factor(UT_thc, labels = c("positive", "negative")),
           Consume = factor(Consume, labels = c("Yes", "No")),
           Improvement = factor(Improvement, labels = c("Better", "Moderately better", 
                                            "Slightly better", "No changes")), 
           Grams_month = as.double(Grams_month),
           Grams = case_when(
               Consume == "No" ~ 0,
               Consume == "Yes" ~ Grams_month,
               is.na(Consume) ~ Grams0),
           Grams = if_else(Coc_last30 == 0, 0, Grams)) %>% 
    select(-Grams0, -Grams_month) %>% 
    filter(!Study.ID %in% paste0("sub-0", c('05', '09', 14, 28, 29))) %>% data.table()


# write_rds(clinical, "outData/clin_data.RDS")


clin1 <- clinical %>% filter(Stage %in% c("t1", "t0")) %>% 
    mutate(Stage = factor(Stage)) %>% data.table()

clin2 <- clinical %>% 
    filter(Study.ID %in% c(
        as.character(clinical[clinical$Stage == "t1-4",]$Study.ID),
        unique(as.character(clinical[clinical$Group == "tx",]$Study.ID)))) %>% 
    mutate(Stage2 = case_when(
        Group == "tx" & Stage == "t0" ~ "t0",
        Group == "tx" & Stage == "t1" ~ "t1",
        Group == "sham" & Stage == "t0" ~ "X",
        Group == "sham" & Stage == "t1" ~ "t0",
        Group == "sham" & Stage == "t1-4" ~ "t1",
        Stage == "t2" ~ "X")) %>% 
    select(-Stage) %>% 
    select(1:2, Stage = Stage2, everything()) %>% 
    filter(Stage != "X", Study.ID != 'sub-012') %>% 
    data.table()

clin3 <- clinical %>%
    filter(Study.ID %in% as.character(clinical[clinical$Stage == "t2",]$Study.ID)) %>%
    mutate(Stage2 = case_when(
        Group == "tx" & Stage == "t0" ~ "t0",
        Group == "tx" & Stage == "t1" ~ "t1",
        Group == "sham" & Stage == "t0" ~ "X",
        Group == "sham" & Stage == "t1" ~ "t0",
        Group == "sham" & Stage == "t1-4" ~ "t1",
        Stage == "t2" ~ "t2")) %>%
    select(-Stage) %>% 
    select(1:2, Stage = Stage2, everything()) %>% 
    filter(Stage != "X") %>% 
    data.table()


write_rds(clin1, "outData/cl1.RDS")
write_rds(clin2, "outData/cl2.RDS")
write_rds(clin3, "outData/cl3.RDS")


# Blind stage ANOVA & chi2 ----------------------------------------------------------------------

aovClin <- vector('list', length = 9)

aovClin[[1]] <- aov_car(VAS ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[2]] <- aov_car(CCQ_N ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[3]] <- aov_car(CCQ_G ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[4]] <- aov_car(B11_C ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[5]] <- aov_car(B11_M ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[6]] <- aov_car(B11_NP ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[7]] <- aov_car(B11_Tot ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[8]] <- aov_car(Coc_last30 ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[9]] <- aov_car(Grams ~ Group * Stage + Error(Study.ID/Stage), data = clin1)



chiClin <- vector('list', length = 5)

chiClin[[1]] <- chisq.test(table(filter(clin1, Stage == "t1")$UT_bzd, 
                                 filter(clin1, Stage == "t1")$Group))
chiClin[[2]] <- chisq.test(table(filter(clin1, Stage == "t1")$UT_coc, 
                                 filter(clin1, Stage == "t1")$Group))
chiClin[[3]] <- chisq.test(table(filter(clin1, Stage == "t1")$UT_thc, 
                                 filter(clin1, Stage == "t1")$Group))
chiClin[[4]] <- chisq.test(table(filter(clin1, Stage == "t1")$Consume, 
                                 filter(clin1, Stage == "t1")$Group))
chiClin[[5]] <- chisq.test(table(filter(clin1, Stage == "t1")$Improvement, 
                                 filter(clin1, Stage == "t1")$Group))


write_rds(aovClin, "outData/aovClin.RDS")
write_rds(chiClin, "outData/chiClin.RDS")

# Open-label tTests ---------------------------------------------------------------------------

tTestClin <- vector('list', length = 2)

tTestClin[[1]][[1]] <- t.test(VAS ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[2]] <- t.test(CCQ_N ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[3]] <- t.test(CCQ_G ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[4]] <- t.test(B11_C ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[5]] <- t.test(B11_M ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[6]] <- t.test(B11_NP ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[7]] <- t.test(B11_Tot ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[8]] <- t.test(Coc_last30 ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[9]] <- t.test(Grams ~ Stage, alternative = "g", paired = T, data = clin2)

tTestClin[[2]][[1]] <- cohen.d(VAS ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[2]] <- cohen.d(CCQ_N ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[3]] <- cohen.d(CCQ_G ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[4]] <- cohen.d(B11_C ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[5]] <- cohen.d(B11_M ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[6]] <- cohen.d(B11_NP ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[7]] <- cohen.d(B11_Tot ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[8]] <- cohen.d(Coc_last30 ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[9]] <- cohen.d(Grams ~ Stage, paired = T, data = clin2)


chiClin2 <- vector('list', length = 3)

chiClin2[[1]] <- chisq.test(table(filter(clin2)$UT_bzd, 
                                 filter(clin2)$Stage))
chiClin2[[2]] <- chisq.test(table(filter(clin2)$UT_coc, 
                                 filter(clin2)$Stage))
chiClin2[[3]] <- chisq.test(table(filter(clin2)$UT_thc, 
                                 filter(clin2)$Stage))

write_rds(tTestClin, "outData/tTstClin.RDS")
write_rds(chiClin2, "outData/chiClin2.RDS")

# Open-label ANOVAs ---------------------------------------------------------------------------

anovaClin <- vector('list', length = 2)

anovaClin[[1]][[1]] <- summary(aov(VAS ~ Stage, data = clin3))
anovaClin[[1]][[2]] <- summary(aov(CCQ_N ~ Stage, data = clin3))
anovaClin[[1]][[3]] <- summary(aov(CCQ_G ~ Stage, data = clin3))
anovaClin[[1]][[4]] <- summary(aov(B11_C ~ Stage, data = clin3))
anovaClin[[1]][[5]] <- summary(aov(B11_M ~ Stage, data = clin3))
anovaClin[[1]][[6]] <- summary(aov(B11_NP ~ Stage, data = clin3))
anovaClin[[1]][[7]] <- summary(aov(B11_Tot ~ Stage, data = clin3))
anovaClin[[1]][[8]] <- summary(aov(Coc_last30 ~ Stage, data = clin3))
anovaClin[[1]][[9]] <- summary(aov(Grams ~ Stage, data = clin3))


anovaClin[[2]][[1]] <- TukeyHSD(aov(VAS ~ Stage, data = clin3))
anovaClin[[2]][[2]] <- TukeyHSD(aov(CCQ_N ~ Stage, data = clin3))
anovaClin[[2]][[3]] <- TukeyHSD(aov(CCQ_G ~ Stage, data = clin3))
anovaClin[[2]][[4]] <- TukeyHSD(aov(B11_C ~ Stage, data = clin3))
anovaClin[[2]][[5]] <- TukeyHSD(aov(B11_M ~ Stage, data = clin3))
anovaClin[[2]][[6]] <- TukeyHSD(aov(B11_NP ~ Stage, data = clin3))
anovaClin[[2]][[7]] <- TukeyHSD(aov(B11_Tot ~ Stage, data = clin3))
anovaClin[[2]][[8]] <- TukeyHSD(aov(Coc_last30 ~ Stage, data = clin3))
anovaClin[[2]][[9]] <- TukeyHSD(aov(Grams ~ Stage, data = clin3))


chiClin3 <- vector('list', length = 3)

chiClin3[[1]] <- chisq.test(table(filter(clin3)$UT_bzd, 
                                  filter(clin3)$Stage))
chiClin3[[2]] <- chisq.test(table(filter(clin3)$UT_coc, 
                                  filter(clin3)$Stage))
chiClin3[[3]] <- chisq.test(table(filter(clin3)$UT_thc, 
                                  filter(clin3)$Stage))

write_rds(anovaClin, "outData/anovaClin.RDS")
write_rds(chiClin3, "outData/chiClin3.RDS")

# Graph Metrics -------------------------------------------------------------------------------

CON <- attrCON %>% left_join(clinical) %>% data.table() 
DAN <- attrDAN %>% left_join(clinical) %>% data.table()
DMN <- attrDMN %>% left_join(clinical) %>% data.table()
FPN <- attrFPN %>% left_join(clinical) %>% data.table()
SAL <- attrSAL %>% left_join(clinical) %>% data.table()
SUB <- attrSUB %>% left_join(clinical) %>% data.table()
VAN <- attrVAN %>% left_join(clinical) %>% data.table()
WB <- attrWB %>% left_join(clinical) %>% data.table()


# write_rds(CON, "outData/rds/CON.rds")
# write_rds(DAN, "outData/rds/DAN.rds")
# write_rds(DMN, "outData/rds/DMN.rds")
# write_rds(FPN, "outData/rds/FPN.rds")
# write_rds(SAL, "outData/rds/SAL.rds")
# write_rds(SUB, "outData/rds/SUB.rds")
# write_rds(VAN, "outData/rds/VAN.rds")
# write_rds(VAN, "outData/rds/WB.rds")

## 2 weeks Real rTMS

CONtx <- attrCONtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table() 
DANtx <- attrDANtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
DMNtx <- attrDMNtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
FPNtx <- attrFPNtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
SALtx <- attrSALtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
SUBtx <- attrSUBtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
VANtx <- attrVANtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()
WBtx <- attrWBtx %>% left_join(clin2) %>% filter(Study.ID != 'sub-012') %>% data.table()

## 3 months maintenance

CONl <- attrCONl %>% left_join(clin3) %>% data.table() 
DANl <- attrDANl %>% left_join(clin3) %>% data.table()
DMNl <- attrDMNl %>% left_join(clin3) %>% data.table()
FPNl <- attrFPNl %>% left_join(clin3) %>% data.table()
SALl <- attrSALl %>% left_join(clin3) %>% data.table()
SUBl <- attrSUBl %>% left_join(clin3) %>% data.table()
VANl <- attrVANl %>% left_join(clin3) %>% data.table()
WBl <- attrWBl %>% left_join(clin3) %>% data.table()


# Graph metrics (anterior model) --------------------------------------------------------------

# CON1 <- attr1CON %>% left_join(clinical) %>% data.table()
# DAN1 <- attr1DAN %>% left_join(clinical) %>% data.table()
# DMN1 <- attr1DMN %>% left_join(clinical) %>% data.table()
# FPN1 <- attr1FPN %>% left_join(clinical) %>% data.table()
# SAL1 <- attr1SAL %>% left_join(clinical) %>% data.table()
# SUB1 <- attr1SUB %>% left_join(clinical) %>% data.table()
# VAN1 <- attr1VAN %>% left_join(clinical) %>% data.table()
# WB1 <- attr1WB %>% left_join(clinical) %>% data.table()


# Graph metrics (posterior model) -------------------------------------------------------------

# CON2 <- attr2CON %>% left_join(clinical) %>% data.table()
# DAN2 <- attr2DAN %>% left_join(clinical) %>% data.table()
# DMN2 <- attr2DMN %>% left_join(clinical) %>% data.table()
# FPN2 <- attr2FPN %>% left_join(clinical) %>% data.table()
# SAL2 <- attr2SAL %>% left_join(clinical) %>% data.table()
# SUB2 <- attr2SUB %>% left_join(clinical) %>% data.table()
# VAN2 <- attr2VAN %>% left_join(clinical) %>% data.table()
# WB2 <- attr2WB %>% left_join(clinical) %>% data.table()

