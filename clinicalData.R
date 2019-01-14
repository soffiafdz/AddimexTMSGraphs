raw_db <- read_csv("inData/tms_db_311018.csv", skip = 1) %>% 
    mutate(rid = paste0("sub-", sprintf("%03d", rid)),
           group = factor(group, labels = c("sham", "tx")),
           stage = factor(stage))

clinical <- raw_db[-c(5,9), c(1:3, 45:50, 199)] %>% 
    filter(stage %in% c("T0", "T1", "T1-4", "T2")) %>% 
    select(Study.ID = rid, Group = group, Stage = stage, B11_C = bis_11_cog, 
           B11_M = bis_11_mot, B11_NP = bis_11_nonp, B11_Tot = bis_11_tot_score, 
           CCQ_G = ccq_g, CCQ_N = ccq_n, VAS = vas) %>% 
    mutate(Study.ID = factor(Study.ID), Stage = factor(Stage, labels = c("t0", "t1", "t1-4", "t2")),
           B11_C = as.integer(B11_C), B11_Tot = as.integer(B11_Tot)) %>% 
    filter(!Study.ID %in% paste0("sub-0", c('05', 14, 28, 29)))
    

# write_rds(clinical, "outData/clin_data.RDS")


clin1 <- clinical %>% 
    filter(Stage %in% c("t1", "t0")) %>% 
    mutate(Stage = factor(Stage))

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
    select(1:2, Stage = Stage2, 4:10) %>% 
    filter(Stage != "X", !Study.ID %in% c('sub-012', 'sub-030'))

clin3 <- clinical %>%
    filter(Study.ID %in% as.character(clinical[clinical$Stage == "t2",]$Study.ID)) %>%
    mutate(Stage2 = case_when(
        Group == "tx" & Stage == "t0" ~ "t0",
        Group == "tx" & Stage == "t1" ~ "t1",
        Group == "sham" & Stage == "t0" ~ "X",
        Group == "sham" & Stage == "t1" ~ "t0",
        Group == "sham" & Stage == "t1-4" ~ "t1",
        Stage == "t2" ~ "t2")) %>%
    select(1:2, Stage = Stage2, 4:10) %>%
    filter(Stage != "X")


# write_rds(clin1, "outData/cl1.RDS")
# write_rds(clin2, "outData/cl2.RDS")
# write_rds(clin3, "outData/cl3.RDS")


# Blind stage ANOVA ---------------------------------------------------------------------------

aovClin <- vector('list', length = 7)

aovClin[[1]] <- aov_car(VAS ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[2]] <- aov_car(CCQ_N ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[3]] <- aov_car(CCQ_G ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[4]] <- aov_car(B11_C ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[5]] <- aov_car(B11_M ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[6]] <- aov_car(B11_NP ~ Group * Stage + Error(Study.ID/Stage), data = clin1)
aovClin[[7]] <- aov_car(B11_Tot ~ Group * Stage + Error(Study.ID/Stage), data = clin1)


# Open-label tTests ---------------------------------------------------------------------------

tTestClin <- vector('list', length = 2)

tTestClin[[1]][[1]] <- t.test(VAS ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[2]] <- t.test(CCQ_N ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[3]] <- t.test(CCQ_G ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[4]] <- t.test(B11_C ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[5]] <- t.test(B11_M ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[6]] <- t.test(B11_NP ~ Stage, alternative = "g", paired = T, data = clin2)
tTestClin[[1]][[7]] <- t.test(B11_Tot ~ Stage, alternative = "g", paired = T, data = clin2)

tTestClin[[2]][[1]] <- cohen.d(VAS ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[2]] <- cohen.d(CCQ_N ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[3]] <- cohen.d(CCQ_G ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[4]] <- cohen.d(B11_C ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[5]] <- cohen.d(B11_M ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[6]] <- cohen.d(B11_NP ~ Stage, paired = T, data = clin2)
tTestClin[[2]][[7]] <- cohen.d(B11_Tot ~ Stage, paired = T, data = clin2)


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

