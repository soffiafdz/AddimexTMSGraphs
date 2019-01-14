
# Demographics --------------------------------------------------------------------------------

sd <- read_csv("inData/tms_socdem_311018.csv") %>% 
    select(1:2, 5:7, 16:17, 25:28) %>% 
    filter(rid %in% c(1:4, 6:8, 10:13, 15:27, 30:32)) %>% 
    mutate(rid = factor(rid), 
           group = factor(group, labels = c("Sham", "Tx")),
           q1_sex = factor(q1_sex, labels = c("Male", "Female")),
           consumption = factor(consumption, labels = c("No", "Yes")))
names(sd) <- sd_names <- c("RID", "Group", "Sex", "Age", "Education_years", 
                           "Starting_age", "Years_consumption", "Tobaco_consumption", 
                           "Tobaco_start", "Tobaco_years", "Cigs_day") 

sdTbl <- mytable(Group ~ . -RID, data = sd, method = 3)
mycsv(sdTbl, file = "outData/tables/sdTbl.csv")

sdCtrl <- read_csv("inData/pairing2tms.csv", na = "n/a") %>% 
    select(1, 3, 4, 6, 23, 26, 25, 24) %>% 
    mutate(sex = factor(sex, labels = c("Male", "Female")),
           tobc.lastyear = factor(tobc.lastyear, labels = c("No", "Yes")))
names(sdCtrl) <- c("RID", "Sex", "Age", "Education_years", "Tobaco_consumption", 
                   "Tobaco_start", "Tobaco_years", "Cigs_day")

sdPairing <- sd %>% 
    select(1, 3:5, 8:11) %>% 
    rbind(sdCtrl) %>% 
    mutate(Group = rep(c("User", "Control"), each = 27)) %>% 
    select(9, 2:8) %>% 
    mytable(Group ~ ., data = .)

# saveRDS(sdTbl, "outData/sdTbl.RDS")

# Clinical ------------------------------------------------------------------------------------
clinTbl <- clin1 %>% 
    mytable2(Group + Stage ~ . -Study.ID,
         data = .,
         method = 1)
mycsv(clinTbl, file = "outData/tables/clTbl.csv")

clinTbl2 <- clin2 %>% 
    select(-1, -2) %>% 
    mytable(Stage ~ .,
            data = .,
            method = 3)
# mycsv(clinTbl2, file = "outData/tables/clTbl2.csv")

# saveRDS(clinTbl, "outData/clT1.RDS")
# saveRDS(clinTbl2, "outData/clT2.RDS")
# saveRDS(clinTbl3, "outData/clT3.RDS")



# Anovas --------------------------------------------------------------------------------------

# head(aov_co_tc1[[1]][[4]][[3]]) #F
# head(aov_co_tc1[[1]][[5]][[3]]) #ges
# head(aov_co_tc1[[1]][[6]][[3]]) #p

clinScales <- c('VAS', 'CCQ-N', 'CCQ-G', 'B11C', 'B11M', 'B11Np', 'B11T')
# p <- aovs %>% map(1) %>% map(6) %>% map_dbl(3)

# map(p, p.adjust, method = "fdr")

aovClinDf <- data_frame(scales = clinScales,
                    stat = aovClin %>% map(1) %>% map(4) %>% map_dbl(3),
                    df = rep("1,22", 7),
                    ges = aovClin %>% map(1) %>% map(5) %>% map_dbl(3),
                    p = aovClin %>% map(1) %>% map(6) %>% map_dbl(3)) %>% data.table()

write_csv(aovClinDf, "outData/tables/aovClin.csv")
# saveRDS(aov_df, "~/Desktop/aov_df.RDS")



