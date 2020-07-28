# Project: Addimex_TMS - FC_Clinical 

root="/media/egarza/Elements2/projects/ADDIMEX_TMS/MAIN/3-Experiment/data/databases_07FEB2020/csv"
corr="/media/egarza/Elements2/projects/ADDIMEX_TMS/FC_CLIN/3-Experiment/derivatives/correlations"
cog="/media/egarza/Elements2/projects/ADDIMEX_TMS/MAIN/3-Experiment/data/cognitive_11MAY2020"

# Load packages

#install.packages("tidyverse")
#install.packages("psych")
library(tidyverse)
library(psych)
library(moonBook)
library(magrittr)
library(ztable)
library(sjlabelled)
library(ggpubr)
#install.packages("gt")
library(gt)
#install.packages("rlang")
library(ztable)
library(sjlabelled)
#install.packages("kableExtra")
library(knitr)
library(kableExtra)
#install.packages("papeR")
library(papeR)
#install.packages("EMT")
library(EMT)
#install.packages("rcompanion")
library(rcompanion)
library(psych)
#install.packages("vcd")
library(vcd)
library(DescTools)
library(ggpubr)
library(lme4)
library(lmerTest)
library(broom.mixed)
library(pander)
library(multcomp)
library(lubridate)
library(rstatix)
library(EMAtools)
source("~/R/RainCloudPlots/tutorial_R/R_rainclouds.R")
source("~/R/RainCloudPlots/tutorial_R/summarySE.R")
source("~/R/RainCloudPlots/tutorial_R/simulateData.R")
library(cowplot)
library(readr)
library(dplyr)

# import datasets

included <- read_csv(paste(root,"/eliminated_list.csv", sep=""))
amai <- read_csv(paste(root,"/AMAI.csv",sep=""))
asip <- read_csv(paste(root,"/ASIP.csv",sep=""))
bis11 <- read_csv(paste(root,"/BIS-11.csv",sep=""))
ccqg <- read_csv(paste(root,"/CCQ-G.csv",sep=""))
ccqn <- read_csv(paste(root,"/CCQ-N.csv",sep=""))
demographic <- read_csv(paste(root,"/DEMOGRAPHIC.csv",sep=""))
ehisf <- read_csv(paste(root,"/EHI-SF.csv",sep=""))
hars <- read_csv(paste(root,"/HARS.csv",sep=""))
hdrs <- read_csv(paste(root,"/HDRS.csv",sep=""))
inventory <- read_csv(paste(root,"/Inventory.csv",sep=""))
miniplus <- read_csv(paste(root,"/MINI.csv",sep=""))
psqi <- read_csv(paste(root,"/PSQI.csv",sep=""))
scid2 <- read_csv(paste(root,"/SCIDII.csv",sep=""))
scl90r <- read_csv(paste(root,"/SCL-90-R.csv",sep=""))
tobacco <- read_csv(paste(root,"/Tobacco.csv",sep=""))
vas <- read_csv(paste(root,"/VAS.csv",sep=""))
whodas <- read_csv(paste(root,"/WHODAS.csv",sep=""))
conn_dlpfcvm <- read_csv(paste(corr,"/dlpfc-vmpfc.csv", sep=""))
tms_adverse <- read_csv(paste(root,"/TMS_adverse symptoms_long.csv", sep =""))
tms_mt <- read_csv(paste(root,"/LONG_motor_threshold_TMS_Crack.csv", sep =""))
fd <- read_csv("fd.csv")
conn_vmpfc <- read_csv(paste(corr,"/vmpfc_conn_cluster.csv", sep=""))
tx <- read_csv("addimextms_treatment.csv")
calendar <- read_csv(paste(root,"/TMS_calendar_permonth.csv", sep = ""))
inventory_t0 <- read_csv(paste(root,"/TMS_calendar_lastmonth.csv", sep = ""))
cognitive <- read_csv(paste(cog,"/TMS_NEURODATA_2020REV.csv", sep =""))


# Code the datasets

groupfactor <- function(data) {
   factor(data$group,levels = c(1,2), labels = c("SHAM", "REAL"))
}

stagefactor <- function(data) {
  factor(data$stage, levels = c("T0","T1","T1-4","T2","T3","T4","T5"))
}

included$group <- groupfactor(included)
amai$group <- groupfactor(amai)
asip$group <- groupfactor(asip)
bis11$group <- groupfactor(bis11)
ccqg$group <- groupfactor(ccqg)
ccqn$group <- groupfactor(ccqn)
demographic$group <- groupfactor(demographic)
ehisf$group <- groupfactor(ehisf)
hars$group <- groupfactor(hars)
hdrs$group <- groupfactor(hdrs)
inventory$group <- groupfactor(inventory)
miniplus$group <- groupfactor(miniplus)
psqi$group <- groupfactor(psqi)
scid2$group <- groupfactor(scid2)
scl90r$group <- groupfactor(scl90r)
tobacco$group <- groupfactor(tobacco)
vas$group <- groupfactor(vas)
whodas$group <- groupfactor(whodas)
tms_adverse$group <- groupfactor(tms_adverse)
tx$group <- factor(tx$group, levels = c("SHAM", "REAL"))
inventory_t0$group <- groupfactor(inventory_t0)
cognitive$group <- groupfactor(cognitive)
calendar$group <- groupfactor(calendar)

included$stage <- stagefactor(included)
amai$stage <- stagefactor(amai)
asip$stage <- stagefactor(asip)
bis11$stage <- stagefactor(bis11)
ccqg$stage <- stagefactor(ccqg)
ccqn$stage <- stagefactor(ccqn)
demographic$stage <- stagefactor(demographic)
ehisf$stage <- stagefactor(ehisf)
hars$stage <- stagefactor(hars)
hdrs$stage <- stagefactor(hdrs)
inventory$stage <- stagefactor(inventory)
miniplus$stage <- stagefactor(miniplus)
psqi$stage <- stagefactor(psqi)
scid2$stage <- stagefactor(scid2)
scl90r$stage <- stagefactor(scl90r)
tobacco$stage <- stagefactor(tobacco)
vas$stage <- stagefactor(vas)
whodas$stage <- stagefactor(whodas)
conn_dlpfcvm$stage <- stagefactor(conn_dlpfcvm)
fd$stage <- stagefactor(fd)
conn_vmpfc$stage <- stagefactor(conn_vmpfc)
inventory_t0$stage <- stagefactor(inventory_t0)
cognitive$stage <- stagefactor(cognitive)
calendar$stage <- stagefactor(calendar)

# New datasets

demographic <- dplyr::select(demographic, -date) 
amai <- dplyr::select(amai,rid, group, stage, score_total, score_clasif)
asip <- as_tibble(asip)
bis11 <- dplyr::select(bis11, rid, group, stage, cog, mot, nonp, tot_score)
ccqg <- dplyr::select(ccqg, rid, group, stage, ccq_g)
ccqn <- dplyr::select(ccqn, rid, group, stage, ccq_n)
vas <- vas
hars <- dplyr::select(hars, rid, group, stage, hars_tot, hars_categories)
hdrs <- dplyr::select(hdrs, rid, group, stage, tot_score, score_categories)
inventory <- inventory
miniplus <- miniplus
psqi <- dplyr::select(psqi, rid, group, stage, pitt_score, pitt_sqs, pitt_sl, pitt_slcateg, pitt_sd, pitt_totbed, pitt_hse, pitt_hse_categ, pitt_sdis, pitt_sdiscateg, pitt_usmed, pitt_dd, pitt_dd_categ, pitt_gqs)
scid2 <- dplyr::select(scid2, rid, group,stage, evp, dep, ocp, passap, depresedp, parap, ezqtp, ezqdp, hp, np, limitp, antisp)
scl90r <- dplyr::select(scl90r, rid, group, stage, som, oc, is, dep, anx, hos, phob, par, psy, gsi, psdi, pst)
tobacco <- tobacco
whodas <- dplyr::select(whodas, rid, group, stage, total=TOTAL, tuc=TUC, tga=TGA, tsc=TSC, tgawp=TGAWP, tla=TLA,tps=TPS)

amai$score_clasif <- factor(amai$score_clasif, levels = c("AB","C+","C", "C-", "D+", "D", "E"))

## Other modifications to datasets

str(asip)
asip2 <- asip

asip2$m6dmed <- as.numeric(asip2$m6dmed)
asip2$m7troub <- as.numeric(asip2$m7troub)
asip2$m8treat <- as.numeric(asip2$m8treat)

asip2$e4drive <- as.numeric(asip2$e4drive)
asip2$e5auto <- as.numeric(asip2$e5auto)
asip2$e11 <- as.numeric(asip2$e11dpaid)
asip2$e12netin <- as.numeric(asip2$e12netin)

asip2$d1a30 <- as.numeric(asip2$d1a30)
asip2$d2atox30 <- as.numeric(asip2$d2atox30)
asip2$d26exap <- as.numeric(asip2$d26exap)
asip2$d28tap <- as.numeric(asip2$d28tap)
asip2$d31txdp <- as.numeric(asip2$d31txdp)
asip2$d23spta <- as.numeric(asip2$d23spta)

#####
asip2$d3he30d <- as.numeric(asip2$d3he30d)
asip2$d4md30 <- as.numeric(asip2$d4md30)
asip2$d5opi30 <- as.numeric(asip2$d5opi30)
asip2$d6bb30 <- as.numeric(asip2$d6bb30)
asip2$d7se30 <- as.numeric(asip2$d7se30)
asip2$d8cc30 <- as.numeric(asip2$d8cc30)

asip2$d9mth30 <- as.numeric(asip2$d9mth30)
asip2$d10cn30 <- as.numeric(asip2$d10cn30)
asip2$d11ha30 <- as.numeric(asip2$d11ha30)
asip2$d13sub30 <- as.numeric(asip2$d13sub30)
asip2$d27exdp <- as.numeric(asip2$d27exdp)
asip2$d29tdp <- as.numeric(asip2$d29tdp)
asip2$d30txap <- as.numeric(asip2$d30txap)

#####
asip2$l24trial <- as.numeric(asip2$l24trial)
asip2$l26dete <- as.numeric(asip2$l26dete)
asip2$l28legp <- as.numeric(asip2$l28legp)
asip2$l29coun <- as.numeric(asip2$l29coun)
asip2$e17illeg <- as.numeric(asip2$e17illeg)

###### Social Status 
asip2$f3sats <- as.numeric(asip2$f3sats)
asip2$f3.3stat <- as.numeric(asip2$f3.3stat)
asip2$f30faco <- as.numeric(asip2$f30faco)
asip2$f32tfam <- as.numeric(asip2$f32tfam)
asip2$f34tmfa <- as.numeric(asip2$f34tmfa)
asip2$f18xm30 <- as.numeric(asip2$f18xm30)
asip2$f19xf30 <- as.numeric(asip2$f18xm30)
asip2$f20bs30 <- as.numeric(asip2$f20bs30)
asip2$f21xs30 <- as.numeric(asip2$f21xs30)
asip2$f22xch30 <- as.numeric(asip2$f22xch30)
asip2$f23xly30 <- as.numeric(asip2$f23xly30)
asip2$f24xfd30 <- as.numeric(asip2$f24xfd30)
asip2$f25xn30 <- as.numeric(asip2$f25xn30)
asip2$f26xw30 <- as.numeric(asip2$f26xw30)


asip2$p4sd30 <- as.numeric(asip2$p4sd30)
asip2$p5ax30 <- as.numeric(asip2$p5ax30)
asip2$p6ha30 <- as.numeric(asip2$p6ha30)
asip2$p7un30 <- as.numeric(asip2$p7un30)
asip2$p8vi30 <- as.numeric(asip2$p8vi30)
asip2$p9sui30 <- as.numeric(asip2$p9sui30)
asip2$p10att30 <- as.numeric(asip2$p10att30)
asip2$p11pre <- as.numeric(asip2$p11pre)
asip2$p12pp30 <- as.numeric(asip2$p12pp30)
asip2$p13t30 <- as.numeric(asip2$p13t30)
asip2$p14txp <- as.numeric(asip2$p14txp)

asip <- asip2

asip2 <- asip2 %>% 
  dplyr::select(rid, group, stage,m6dmed, m7troub, m8treat,
         e4drive,e5auto,e11dpaid,e12netin,
         d1a30,d2atox30,d26exap,d28tap,d31txdp,d23spta,
         d3he30d,d4md30,d5opi30,d6bb30,d7se30,d8cc30,
         d9mth30,d10cn30,d11ha30, d13sub30,d27exdp,d29tdp,d30txap,
         l24trial,l26dete,l28legp,l29coun,e17illeg,
         f3sats,f30faco,f32tfam,f34tmfa,f18xm30,f19xf30,f20bs30,f21xs30,f22xch30,f23xly30,f24xfd30,f25xn30,f26xw30,
         p4sd30,p5ax30,p6ha30,p7un30,p8vi30,p9sui30,p10att30,p11pre,p12pp30, p13t30,p14txp)


asip2 <- asip2 %>% 
  mutate(
    f3.3stat = case_when(
      f3sats == 2 ~ 1,
      f3sats == 0 ~ 3
    ))

str(asip2)

asip2 <- asip2 %>%  
  mutate(Score_medical_status = (m6dmed/90 + m7troub/12 + m8treat/12),
         Score_employment_status = 1.000 - (asip2$e4drive/4 + asip2$e5auto/4 + asip2$e11dpaid/120 + log(asip2$e12netin/36)),
         Score_alcohol_use = (d13sub30/180 + d29tdp/180 + d26exap/180 + d28tap/24 + d31txdp/24 + log(d23spta/44)),
         Score_drugs_use = (d30txap/390 + d4md30/390 + d5opi30/390 + d6bb30/390 + d7se30/390 + d8cc30/390 +
                              d9mth30/390 + d10cn30/390 + d11ha30/390 + d13sub30/390 + d27exdp/390 + d29tdp/52 + d30txap/52 ),
         Score_legal_status = (l24trial/5  +  l26dete/150 + l28legp/20 + l29coun/20 +log(e17illeg/46)),
         Score_family_social_status = (f3.3stat/10 + f30faco/150 + f32tfam/20 + 
                                         f34tmfa/20 + (f18xm30 + f19xf30 + f20bs30 + f21xs30 + f22xch30 +
                                                         f23xly30 + f24xfd30 + f25xn30 + f26xw30/9/5)),
         Score_psychiatric_status = (p4sd30/11 + p5ax30/11 + p6ha30/11 + p7un30/11 +
                                       p8vi30/11 + p9sui30/11 + p10att30/11 + p11pre/11 +
                                       p12pp30/330 + p13t30/44 + p14txp/44))
asip <- asip2

asip <- asip %>%
  dplyr::select(rid, group, stage, score_med_status=Score_medical_status,score_employ_status=Score_employment_status,
         score_alcohol_use = Score_alcohol_use, score_drugs_use = Score_drugs_use,
         score_legal_status = Score_legal_status, score_familysocial_status = Score_family_social_status,
         score_psych_status = Score_psychiatric_status)

## Remove Infinate values
is.na(asip) <- sapply(asip, is.infinite)

demographic$q1_sex <- factor(demographic$q1_sex, levels = c(1,2), labels = c("M","F"))
demographic$q5_civ <- factor(demographic$q5_civ, levels = c(1,2,3,4,5), labels = c("single", "married", "divorced", "separated", "widowed"))
demographic$q6_employeedays <- factor(demographic$q6_employeedays, levels = c(1,2,3,4,5,6,7,8), labels = c("full time", "half time", "free lance", "scholarized","not scholarized", "reteired", "housewife", "unemployee"))
demographic$q6_employeeyr <- factor(demographic$q6_employeeyr, levels = c(1,2,3,4,5,6,7,8), labels = c("full time", "half time", "free lance", "scholarized","not scholarized", "reteired", "housewife", "unemployee"))
demographic$q6_sustance <- factor(demographic$q6_sustance, levels = c(1,2), labels = c("crack-cocaine","cocaine"))

hars$hars_categories <- factor(hars$hars_categories, levels = c(1,2,3), labels = c("mild severity","mild to moderate severity", "moderate-severe"))
hars$rid <- set_label(hars$rid, label = "ID")
hars$stage <- set_label(hars$stage, label = "Timepoint")
hars$group <- set_label(hars$group, label = "Group")
hars$hars_tot <- set_label(hars$hars_tot, label = "HARS score")
hars$hars_categories <- set_label(hars$hars_categories, label = "HARS categories")

hdrs$score_categories <- factor(hdrs$score_categories, levels = c(1,2,3,4,5), labels = c("normal","minor depression","less than major depressive","major depression","more than major depression"))
hdrs$rid <- set_label(hdrs$rid, label = "ID")
hdrs$stage <- set_label(hdrs$stage, label = "Timepoint")
hdrs$group <- set_label(hdrs$group, label = "Group")
hdrs$tot_score <- set_label(hdrs$tot_score, label = "HDRS score")
hdrs$score_categories <- set_label(hdrs$score_categories, label = "HDRS categories")

inventory$date <- dmy(inventory$date)
inventory <- rename(inventory, visit_date = date)
inventory$othq3_a <- factor(inventory$othq3_a, levels = c(1,2), labels = c("Yes","No"))
inventory$othq3_b <- factor(inventory$othq3_b, levels = c(1,2,3,4,5), labels = c("psychological", "pharmacological", "psychological & pharmacological", "other", "none" ))
inventory$othq3_d <- factor(inventory$othq3_d, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13), labels = c("antidepressants","gabapentin","topiramate","pregabaline","bupropion","fluoxetine","citalopram","paroxeine","sertraline","hydroxyzine","clonazepam","escitalopram","others"))
inventory$othq3_f <- factor(inventory$othq3_f, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13), labels = c("antidepressants","gabapentin","topiramate","pregabaline","bupropion","fluoxetine","citalopram","paroxeine","sertraline","hydroxyzine","clonazepam","escitalopram","others"))
inventory$othq3_h <- factor(inventory$othq3_h, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13), labels = c("antidepressants","gabapentin","topiramate","pregabaline","bupropion","fluoxetine","citalopram","paroxeine","sertraline","hydroxyzine","clonazepam","escitalopram","others"))
inventory$othq3_j <- factor(inventory$othq3_j, levels = c(1,2,3), labels = c("daily","if necessary","other"))
inventory$othq3_k <- dmy(inventory$othq3_k)
inventory$alchq1 <- factor(inventory$alchq1, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_amp <- factor(inventory$ut_amp, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_bzd <- factor(inventory$ut_bzd, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_coc <- factor(inventory$ut_coc, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_met <- factor(inventory$ut_met, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_mor <- factor(inventory$ut_mor, levels = c(1,2), labels = c("positive","negative"))
inventory$ut_thc <- factor(inventory$ut_thc, levels = c(1,2), labels = c("positive","negative"))
inventory$auto1 <- factor(inventory$auto1, levels = c(0,1,2), labels = c("1st visit","yes","no"))
inventory$auto4 <- factor(inventory$auto4, levels = c(0,1,2,3,4), labels = c("no use","reincidence", "relapse", "decrease", "equal"))
inventory$auto5 <- factor(inventory$auto5, levels = c(0,1,2,3,4,5,6,7), labels = c("1st visit","better","moderetly better","slightly better","no changes","slightly worst", "moderetly worst","worst"))

dataT0_inv <- inventory %>%
  filter(stage == "T0" | stage == "T1") %>%
  dplyr::select(rid, group, stage, auto1, auto2, auto3, auto4, auto5, ut_amp, ut_bzd, ut_coc, ut_met, ut_mor, ut_thc)


miniplus[,4:13] <- lapply(miniplus[,4:13],as.logical)
miniplus$cpas <- factor(miniplus$cpas, levels = c(0,1,2,3), labels = c("none","mild", "moderate", "severe"))
miniplus[,15:90] <- lapply(miniplus[,15:90],as.logical)

scid2factor <- function(asip2) {
  factor(asip2, levels = c(1,2), labels = c("present", "absent"))
}
scid2[,4:15] <- lapply(scid2[,4:15], scid2factor)

scl90r$rid <- set_label(scl90r$rid, label = "ID")
scl90r$stage <- set_label(scl90r$stage, label = "Timepoint")
scl90r$group <- set_label(scl90r$group, label = "Group")
scl90r$som <- set_label(scl90r$som, label = "SCL90R - Somatization")
scl90r$oc <- set_label(scl90r$oc, label = "SCL90R -Obsessive Compulsive")
scl90r$is <- set_label(scl90r$is, label = "SCL90R - Interpersonal Sensitivity")
scl90r$dep <- set_label(scl90r$dep, label = "SCL90R - Depression")
scl90r$anx <- set_label(scl90r$anx, label = "SCL90R - Anxiety")
scl90r$hos <- set_label(scl90r$hos, label = "SCL90R - Hostility")
scl90r$phob <- set_label(scl90r$phob, label = "SCL90R - Phobic Anxiety")
scl90r$par <- set_label(scl90r$par, label = "SCL90R - Paranoid Ideation")
scl90r$psy <- set_label(scl90r$psy, label = "SCL90R - Psychoticism")
scl90r$gsi <- set_label(scl90r$gsi, label = "SCL90R - Global Severity Index")
scl90r$psdi <- set_label(scl90r$psdi, label = "SCL90R - Positive Symptom Distress Index")
scl90r$pst <- set_label(scl90r$pst, label = "SCL90R - Positive Symptom Total")




tobacco$consumption <- as.logical(tobacco$consumption)

included$included <- as.logical(included$included)
included$rid <- set_label(included$rid, label = "ID")
included$stage <- set_label(included$stage, label = "Timepoint")
included$group <- set_label(included$group, label = "Group")

psqi$pitt_sqs <- factor(psqi$pitt_sqs, levels = c(4,3,2,1), labels = c("Very good", "Fairly good", "Fairly bad", "Very bad"))
psqi$pitt_slcateg <- factor(psqi$pitt_slcateg, levels = c(0,1,2,3), labels = c("0", "1-2", "3-4", "5-6"))
psqi$pitt_hse_categ <- factor(psqi$pitt_hse_categ, levels = c(0,1,2,3), labels = c("> 85%", "75-85%", "65-74%", "< 65%"))
psqi$pitt_sdiscateg <- factor(psqi$pitt_sdiscateg, levels = c(0,1,2,3), labels = c("0", "1-2", "3-4", "5-6"))
psqi$pitt_usmed <- factor(psqi$pitt_usmed, levels = c(0,1,2,3), labels = c("Not during the past month", "Less than once a week", "Once or twice a week", "Three or more times a week"))
psqi$pitt_dd_categ <- factor(psqi$pitt_dd_categ, levels = c(0,1,2,3), labels = c("0", "1-2", "3-4", "5-6"))
psqi$pitt_gqs <- factor(psqi$pitt_gqs, levels = c(1,2), labels = c("Good", "Bad"))

psqi$rid <- set_label(psqi$rid, label = "ID")
psqi$group <- set_label(psqi$group, label = "Group")
psqi$stage <- set_label(psqi$stage, label = "Timepoint")
psqi$pitt_score <- set_label(psqi$pitt_score, label = "Pittsburgh total score")
psqi$pitt_sqs <- set_label(psqi$pitt_sqs, label = "Subjective quality of sleep")
psqi$pitt_sl <- set_label(psqi$pitt_sl, label = "Sleep latency")
psqi$pitt_slcateg <- set_label(psqi$pitt_slcateg, label = "Sleep latency categories")
psqi$pitt_sd <- set_label(psqi$pitt_sd, label = "Sleep Duration")
psqi$pitt_totbed <- set_label(psqi$pitt_totbed, label = "Total hours in bed")
psqi$pitt_hse <- set_label(psqi$pitt_hse, label = "Habitual sleep efficiency")
psqi$pitt_hse_categ <- set_label(psqi$pitt_hse_categ, label = "Habitual sleep efficiency categories")
psqi$pitt_sdis <- set_label(psqi$pitt_sdis, label = "Sleep disturbances")
psqi$pitt_sdiscateg <- set_label(psqi$pitt_sdiscateg, label = "Sleep disturbances categories")
psqi$pitt_usmed <- set_label(psqi$pitt_usmed, label = "Use of sleep medications")
psqi$pitt_dd <- set_label(psqi$pitt_dd, label = "Daytime dysfunction")
psqi$pitt_dd_categ <- set_label(psqi$pitt_dd_categ, label = "Daytime dysfunction categories")
psqi$pitt_gqs <- set_label(psqi$pitt_gqs, label = "Global Quality of Sleep")


tms_adverse$measure_time <- factor(tms_adverse$measure_time, levels = c("ses1", "ses2", "ses3", "ses4", "ses5", "ses6", "ses7", "ses8", "ses9", "ses10"))
tms_adverse$rid <- set_label(tms_adverse$rid, label = "ID")
tms_adverse$group <- set_label(tms_adverse$group, label = "Group")
tms_adverse$measure_time <- set_label(tms_adverse$measure_time, label = "Session")
tms_adverse$head <- set_label(tms_adverse$head, label = "Headache")
tms_adverse$neck <- set_label(tms_adverse$neck, label = "Neck pain")
tms_adverse$scalp <- set_label(tms_adverse$scalp, label = "Scalp pain")
tms_adverse$cognitive <- set_label(tms_adverse$cognitive, label = "Cognitive decline")
tms_adverse$concentration <- set_label(tms_adverse$concentration, label = "Concentration decline")
tms_adverse$hearing <- set_label(tms_adverse$hearing, label = "Hearing decline")
tms_adverse$irritation <- set_label(tms_adverse$irritation, label = "Irritation")
tms_adverse$seizures <- set_label(tms_adverse$seizures, label = "Seizures")
tms_adverse$mood <- set_label(tms_adverse$mood, label = "Mood changes")

tx$med1 <- factor(tx$med1, labels = c("gabapentin", "sertraline", "topiramate",
                                      "fluoxetine", "citalopram", "escitalopram",
                                      "oxcarbazepine", "bupropion", "pregabaline",
                                      "mirtazapine", "valproic acid", "clonazepam",
                                      "hydroxyzine", "paroxeine", "risperidone", "venlafaxine",
                                      "quetiapine", "atomoxetine"))

cognitive <- cognitive %>%
  mutate(inhib_index = ifelse(stage == "T1", `Iowa2-in`, `igt-i`),
         inhib_trven = ifelse(stage == "T1", `Iowa2-trev`, `igt-trv`),
         inhib_trdes = ifelse(stage == "T1", `Iowa2-tred`, `igt-trd`))

calendar$month <- factor(calendar$month, levels = c(0,1,2,3,4,5,6),
                         labels = c("MONTH-PRE", "MONTH-1", "MONTH-2",
                                    "MONTH-3", "MONTH-4","MONTH-5","MONTH-6"))

# Some plots

asip2T0 %>%
  filter(stage=="T0" |  stage=="T1") %>%
  ggplot(aes(x= stage, y= vas, color=group)) + geom_boxplot()

psqi %>%
  filter(stage=="T0" |  stage=="T1") %>%
  ggplot(aes(x= stage, y= pitt_score, fill=group)) + geom_boxplot()

psqi %>%
  filter(stage=="T0" |  stage=="T1" | stage=="T2") %>%
  ggplot(aes(x= stage, y= pitt_score, fill=group)) + geom_boxplot()


dataT0 %>%
  ggplot(aes(x= group, y=score_psych_status , fill=group)) + geom_boxplot()

# Merged dataset

# T0 data for Table

## General
dataT0_gen <- merge(included, demographic, by = c("rid","group","stage"))
dataT0_gen <- dataT0_gen %>%
  filter(included == TRUE)

dataT0_gen <- merge(dataT0_gen,amai, by = c("rid","group","stage"))

dataT0_gen$group <- set_label(dataT0_gen$group, label = "Group")
dataT0_gen$q1_sex <- set_label(dataT0_gen$q1_sex, label = "Sex")
dataT0_gen$q1_age <- set_label(dataT0_gen$q1_age, label = "Age")
dataT0_gen$q2_edyears <- set_label(dataT0_gen$q2_edyears, label = "Education (years)")
dataT0_gen$q5_civ <- set_label(dataT0_gen$q5_civ, label = "Civil Status")
dataT0_gen$q6_employeeyr <- set_label(dataT0_gen$q6_employeeyr, label = "Employment Status")
dataT0_gen$q6_month <- set_label(dataT0_gen$q6_month, label = "Monthly Income (MXN)")
dataT0_gen$score_clasif <- set_label(dataT0_gen$score_clasif, label = "Socioeconomic Status")

## Clinical Psychiatric

dataT0_psych <- merge(included, hars, by = c("rid","group","stage"))
dataT0_psych <- dataT0_psych %>%
  filter(included == TRUE)
dataT0_psych <- merge(dataT0_psych, hdrs, by = c("rid","group","stage"))
dataT0_psych <- merge(dataT0_psych, scl90r, by = c("rid","group","stage"))
dataT0_psych <- merge(dataT0_psych, psqi, by = c("rid","group","stage"))
#dataT0_psych <- merge(dataT0_psych,miniplus, by = c("rid","group","stage"))
#dataT0_psych <- merge(dataT0_psych,scid2, by = c("rid","group","stage"))

dataT0_psych <- left_join(included, hars, by = c("rid","group","stage"))
dataT0_psych <- left_join(dataT0_psych, hdrs, by = c("rid","group","stage"))
dataT0_psych <- left_join(dataT0_psych, scl90r, by = c("rid","group","stage"))
dataT0_psych <- left_join(dataT0_psych, psqi, by = c("rid","group","stage"))
dataT0_psych$pitt_totbed <- as.numeric(dataT0_psych$pitt_totbed)

whodas <- whodas %>%
  select(rid, group, stage, total)

whodas$rid <- set_label(whodas$rid, label = "ID")
whodas$group <- set_label(whodas$group, label = "Group")
whodas$stage <- set_label(whodas$stage, label = "Timepoint")
whodas$total <- set_label(whodas$total, label = "WHODAS total")

dataT0_psych <- left_join(dataT0_psych, whodas, by = c("rid","group","stage"))
dataT0_psych <- dataT0_psych %>%
  filter(included == TRUE) %>%
  filter(stage == "T0")


psych_table <- mytable(group~., data=dataT0_psych)
mycsv(psych_table, file="psych_table.csv")




## Addiction

dataT0_add <- merge(included, demographic, by = c("rid","group","stage"))


dataT0_add <- merge(included,inventory, by = c("rid","group","stage"))
dataT0_add <- merge(dataT0_add,bis11, by = c("rid","group","stage"))
dataT0_add <- merge(dataT0_add,ccqg, by = c("rid","group","stage"))
dataT0_add <- merge(dataT0_add,ccqn, by = c("rid","group","stage"))
dataT0_add <- merge(dataT0_add,vas, by = c("rid","group","stage"))
dataT0_add <- merge(dataT0_add,tobacco, by = c("rid","group","stage"))
dataT0_add <- dataT0_add %>%
  filter(included == TRUE)
dataT0_add <- dataT0_add %>%
  arrange(rid)

craving_level <- vas %>%
  filter(stage == "T0") %>%
  mutate(
    craving_level = case_when(
      stage == "T0" & vas > 2.1 ~ "High",
      stage == "T0" & vas <= 2.1 ~ "Low"))

craving_level <- craving_level %>%
  select(-vas)

dataT0_add$ut_amp <- set_label(dataT0_add$ut_amp, label = "Amphetamines")
dataT0_add$ut_bzd <- set_label(dataT0_add$ut_bzd, label = "Benzodiazepines")
dataT0_add$ut_coc <- set_label(dataT0_add$ut_coc, label = "Cocaine")
dataT0_add$ut_met <- set_label(dataT0_add$ut_met, label = "Methamphetamines")
dataT0_add$ut_mor <- set_label(dataT0_add$ut_mor, label = "Opiates")
dataT0_add$ut_thc <- set_label(dataT0_add$ut_thc, label = "Cannabis")
dataT0_add$cog <- set_label(dataT0_add$cog, label = "BIS11 - Cognitive")
dataT0_add$mot <- set_label(dataT0_add$mot, label = "BIS11 - Motor")
dataT0_add$nonp <- set_label(dataT0_add$nonp, label = "BIS11 - Non-Planned")
dataT0_add$tot_score <- set_label(dataT0_add$tot_score, label = "BIS11 - Total")
dataT0_add$ccq_g <- set_label(dataT0_add$ccq_g, label = "Cocaine Craving Questionnaire - General")
dataT0_add$ccq_n <- set_label(dataT0_add$ccq_n, label = "Cocaine Craving Questionnaire - Now")
dataT0_add$vas <- set_label(dataT0_add$vas, label = "Craving VAS")
dataT0_add$consumption <- set_label(dataT0_add$consumption, label = "Tobacco current use")
dataT0_add$age_begin <- set_label(dataT0_add$age_begin, label = "Tobacco onset age")
dataT0_add$years_con <- set_label(dataT0_add$years_con, label = "Tobacco years of use")
dataT0_add$cig_day <- set_label(dataT0_add$cig_day, label = "Cigarettes per day")


addiction_table <- mytable(group~., data=dataT0_add)
mycsv(addiction_table, file = "addiction_table.csv")

# Data Tables
general_table <- mytable(group~., data=dataT0_gen)



general_table %>%
  ztable %>%
  addSigColor %>%
  print(type="html")

mycsv(general_table, file = "general_table.csv")

## Demographic Table


labels(dataT0_gen)

class(dataT0_gen)

labels(dataT0_gen, which = c("rid", "group", "stage", "q1_sex","q1_age", "q2_edyears",
                             "q5_civ", "q6_month", "q6_employeeyr", "q7_yrstart",
                             "q7_tconsume", "score_clasif")) <- c("ID", "Group", "Timepoint", "Sex", "Age",
                                                  "Years of education", "Marital status",
                                                  "Montly income (MXN)", "Employment status in the last 3 years",
                                                  "Onset age of cocaine use", "Years of cocaine use", "Socioeconomic Status")


dataT0_gen$rid <- set_label(dataT0_gen$rid, label = "ID")
dataT0_gen$group <- set_label(dataT0_gen$group, label = "Group")
dataT0_gen$stage <- set_label(dataT0_gen$stage, label = "Timepoint")
dataT0_gen$q1_sex <- set_label(dataT0_gen$q1_sex, label = "Sex")
dataT0_gen$q1_age <- set_label(dataT0_gen$q1_age, label = "Age")
dataT0_gen$q2_edyears <- set_label(dataT0_gen$q2_edyears, label = "Years of education")
dataT0_gen$q5_civ <- set_label(dataT0_gen$q5_civ, label = "Marital status")
dataT0_gen$q6_month <- set_label(dataT0_gen$q6_month, label = "Montly income (MXN)")
dataT0_gen$q6_employeeyr <- set_label(dataT0_gen$q6_employeeyr, label = "Employment (last 3 years)")
dataT0_gen$q7_yrstart <- set_label(dataT0_gen$q7_yrstart, label = "Onset age of cocaine use")
dataT0_gen$q7_tconsume <- set_label(dataT0_gen$q7_tconsume, label = "Years of cocaine use")
dataT0_gen$score_clasif <- set_label(dataT0_gen$score_clasif, label = "Socioeconomic status")   

general_table <- mytable(group~., data=dataT0_gen, use.column.label = TRUE, use.labels = TRUE)
mycsv(general_table, file = "general_table.csv")



dataT0_gen %>% 
  kable() %>%
  kable_styling()

## Addiction Table



## Clinical 

# Longitudinal data

data2week <- merge(vas, conn_dlpfcvm, by = c("rid","stage"))
data2week <- merge(data2week, demographic, by = c("rid","group"))
data2week <- merge(data2week, included, by = c("rid", "group"))
data2week <- data2week %>%
  filter(included==TRUE)
data2week <- data2week %>%
  select(rid, group, stage = stage.x, vas, conn_dlvm, sex = q1_sex, age = q1_age, educ = q2_edyears, onset_consum = q7_yrstart, years_consum = q7_tconsume)
data2week <- merge(data2week, craving_level, by = c("rid", "group"))
data2week <- data2week %>%
  select(rid, group, stage = stage.x, vas, conn_dlvm, sex, age, educ, onset_consum, years_consum, craving_level)

data2week <- data2week %>%
  select(rid, group, stage, sex, age, educ, onset_consum, years_consum, vas, craving_level, conn_dlvm)
data2week <- data2week %>%
  filter(stage == "T0"|stage == "T1")
data2week <- data2week %>%
  arrange(rid)
data2week <- merge(data2week, bis11, by = c("rid", "group", "stage"))
data2week <- data2week %>%
  select(rid, group, stage, sex, age, educ, onset_consum, years_consum, vas, craving_level, conn_dlvm, bis11_tot = tot_score, bis11_cog = cog, bis11_mot = mot, bis11_nonp = nonp)
data2week <- merge(data2week, ccqn, by = c("rid", "group", "stage"))
data2week <- arrange(data2week, rid)
data2week$craving_level <- factor(data2week$craving_level, levels = c("High", "Low"))
data2week$vasZ <- (data2week$vas - mean(data2week$vas))/(sd(data2week$vas))
data2week$bis_totZ <- (data2week$bis11_tot - mean(data2week$bis11_tot))/(sd(data2week$bis11_tot))
data2week$ccqnZ <- (data2week$ccq_n - mean(data2week$ccq_n))/(sd(data2week$ccq_n))

data2week$vas <- set_label(data2week$vas, label = "Craving VAS")

inventory <- inventory %>%
  dplyr::select(rid, group, stage, ut_amp, ut_bzd, ut_coc, ut_met, ut_mor, ut_amp, ut_thc, auto1, auto3, auto4, auto5)

data2week <- merge(data2week, inventory, by = c("rid", "group", "stage"))
data2week <- data2week %>%
  arrange(rid)

#################################################################################################################

# New Analysis 2 Weeks (17.APR.2020) Acute Phase

data2w <- ccqg %>%
  left_join(included, by = c("rid","group")) %>%
  dplyr::select(rid, group, stage = stage.x, ccq_g, included) %>%
  filter(stage == "T0" | stage == "T1") %>%
  filter(included == TRUE) %>%
  dplyr::select(-included) %>%
  left_join(demographic, by = c("rid", "group")) %>%
  dplyr::select(rid, group, stage = stage.x, sex = q1_sex, age = q1_age, educ = q2_edyears, ccq_g) %>%
  left_join(ccqn, by = c("rid","group", "stage")) %>%
  left_join(vas, by = c("rid","group", "stage")) %>%
  left_join(inventory, by = c("rid","group", "stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc) %>%
  left_join(bis11, by = c("rid","group", "stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc,bis11t = tot_score, bis11cog = cog, bis11mot = mot, bis11nonp = nonp) %>%
  left_join(hars, by = c("rid","group", "stage")) %>%
  left_join(hdrs, by = c("rid","group", "stage")) %>%
  rename(hdrs_tot = tot_score, hdrs_categories = score_categories) %>%
  left_join(psqi, by = c("rid","group", "stage")) %>%
  left_join(conn_dlpfcvm, by = c("rid", "stage")) %>%
  left_join(conn_vmpfc, by = c("rid", "stage")) %>%
  left_join(whodas, by = c("rid", "group", "stage")) %>%
  left_join(scl90r, by = c("rid", "group", "stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc,bis11t, bis11cog, bis11mot, bis11nonp, hars_tot, hars_categories,
         hdrs_tot, hdrs_categories, pitt_score, pitt_gqs, conn_dlvm, vmpfc_cluster, whodast = total, gsi, psdi, pst)

data2w$group <- factor(data2w$group, labels = c("SHAM", "ACTIVE"))

data2w$rid <- set_label(data2w$rid, label = "ID")
data2w$group <- set_label(data2w$group, label = "Group")
data2w$stage <- set_label(data2w$stage, label = "Timepoint")
data2w$sex <- set_label(data2w$sex, label = "Sex")
data2w$age <- set_label(data2w$age, label = "Age")
data2w$educ <- set_label(data2w$educ, label = "Years of education")
data2w$ccq_g <- set_label(data2w$ccq_g, label = "CCQ - General")
data2w$ccq_n <- set_label(data2w$ccq_n, label = "CCQ - Now")
data2w$vas <- set_label(data2w$vas, label = "VAS")
data2w$ut_coc <- set_label(data2w$ut_coc, label = "Urine test: Cocaine")
data2w$bis11t <- set_label(data2w$bis11t, label = "BIS11 - Total")
data2w$bis11cog <- set_label(data2w$bis11cog, label = "BIS11 - Cognitive")
data2w$bis11mot <- set_label(data2w$bis11mot, label = "BIS11 - Motor")
data2w$bis11nonp <- set_label(data2w$bis11nonp, label = "BIS11 - Non-Planned")
data2w$hars_tot <- set_label(data2w$hars_tot, label = "HARS score")
data2w$hars_categories <- set_label(data2w$hars_categories, label = "HARS categories")
data2w$hdrs_tot <- set_label(data2w$hdrs_tot, label = "HDRS score")
data2w$hdrs_categories <- set_label(data2w$hdrs_categories, label = "HDRS categories")
data2w$pitt_score <- set_label(data2w$pitt_score, label = "PSQI total score")
data2w$pitt_gqs <- set_label(data2w$pitt_gqs, label = "Global quality of sleep")
data2w$vmpfc_cluster <- set_label(data2w$vmpfc_cluster, label = "VMPFC-Ang Gyrus Conn Z")
data2w$conn_dlvm <- set_label(data2w$conn_dlvm, label = "lDLPFC - vmPFC Conn Z")

data2w$vasZ <- (data2w$vas - mean(data2w$vas))/(sd(data2w$vas))
data2w$bis11tZ <- (data2w$bis11t - mean(data2w$bis11t))/(sd(data2w$bis11t))
data2w$ccqnZ <- (data2w$ccq_n - mean(data2w$ccq_n))/(sd(data2w$ccq_n))

acute_phase_table <- mytable(stage+group ~., data = data2w)
mycsv(acute_phase_table, file = "acute_phase_table.csv")

urine_test2w <- inventory %>%
  left_join(included, by = c("rid", "group")) %>%
  filter(included == TRUE) %>%
  dplyr::select(rid,group,stage = stage.x,ut_coc,ut_amp, ut_bzd, ut_met, ut_mor, ut_thc) %>%
  filter(stage == "T0"| stage == "T1")

urine_tests2w <- mytable(stage+group ~., data = urine_test2w)
mycsv(urine_tests2w, file = "urine_tests2w.csv")

delta_vas <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vas)) %>%
  mutate(vas.diff = vas - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, vas.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, vas.diff)

delta_vasZ <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vasZ)) %>%
  mutate(vasZ.diff = vasZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, vasZ.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, vasZ.diff)

delta_vaspercent <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vas)) %>%
  mutate(vas.diff.per = ((vas - lag)/(lag)*-100)) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, vas.diff.per) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, vas.diff.per)

delta_ccqn <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(ccq_n)) %>%
  mutate(ccqn.diff = ccq_n - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, ccqn.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, ccqn.diff)

delta_ccqnZ <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(ccqnZ)) %>%
  mutate(ccqnZ.diff = ccqnZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, ccqnZ.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, ccqnZ.diff)

delta_bis11t <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(bis11t)) %>%
  mutate(bis11t.diff = bis11t - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, bis11t.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, bis11t.diff)

delta_bis11tZ <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(bis11tZ)) %>%
  mutate(bis11tZZ.diff = bis11tZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, bis11tZZ.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, bis11tZZ.diff)

delta_bis11tpercent <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(bis11t)) %>%
  mutate(bis11t.diff.per = ((bis11t - lag)/(lag))*-100) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, bis11t.diff.per) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, bis11t.diff.per)

delta_conndlvm <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(conn_dlvm)) %>%
  mutate(conn_dlvm.diff = conn_dlvm - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, conn_dlvm.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, conn_dlvm.diff)

delta_connvmpfc <- data2w %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vmpfc_cluster)) %>%
  mutate(vmpfc.diff = vmpfc_cluster - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, vmpfc.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, vmpfc.diff)

delta_data <- delta_vas %>%
  left_join(delta_vasZ, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_vaspercent, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_ccqn, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_ccqnZ, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_bis11t, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_bis11tZ, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_bis11tpercent, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_conndlvm, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_connvmpfc, by = c("rid", "group"))

delta_data$vasZ.diff <- (delta_data$vas.diff - mean(delta_data$vas.diff))/(sd(delta_data$vas.diff))
delta_data$bis11tZZ.diff <- (delta_data$bis11t.diff - mean(delta_data$bis11t.diff))/(sd(delta_data$bis11t.diff))
delta_data$ccqnZ.diff <- (delta_data$ccqn.diff - mean(delta_data$ccqn.diff))/(sd(delta_data$ccqn.diff))

## Correlation between measures

cor.test(delta_data$vas.diff, delta_data$ccqn.diff, method = "pearson")
shapiro.test(delta_data$ccqn.diff)

## Mixed model
lm_vas <- lmer(vas ~ stage * group + age + sex + (1|rid), data2w)
lm_ccqn <- lmer(ccq_n ~ stage * group + age + sex + (1|rid), data2w)

lm_bis11 <- lmer(bis11t ~ stage * group + age + sex + (1|rid), data2w)
lm_hars <- lmer(hars_tot ~ stage * group + age + sex + (1|rid), data2w)
lm_hdrs <- lmer(hdrs_tot ~ stage * group + age + sex + (1|rid), data2w)
lm_sleep <- lmer(pitt_score ~ stage * group + age + sex + (1|rid), data2w)

lm_vas <- lmer(vas ~ stage * group + age + sex + (1|rid), data2w)

summary(lm_vas)
summary(lm_ccqn)
summary(lm_bis11)
summary(lm_hars)
summary(lm_hdrs)
summary(lm_sleep)

p.adjust(c(0.0106,0.6686,0.7489,0.6495), method = "fdr", n = 4)
p.adjust(c(0.0125,0.110), method = "fdr", n = 2)


lme.dscore(lm_vas, data=data2w, type="lme4") # Effect Size
lme.dscore(lm_ccqn, data=data2w, type="lme4")
lme.dscore(lm_bis11, data=data2w, type="lme4")
lme.dscore(lm_hars, data=data2w, type="lme4")
lme.dscore(lm_hdrs, data=data2w, type="lme4")
lme.dscore(lm_sleep, data=data2w, type="lme4")

s1 = (44-3)/(44-2.25) # component 1 for the correction for small samples (n<50)
s2 = sqrt((44-2)/(44)) # component 2

vas_es = -0.8052*s1*s2 # corrected for small samples
ccqn_es = -0.50332260*s1*s2
bis11_es = -0.82609589*s1*s2
hars_es = -0.9734617*s1*s2
hdrs_es = -1.09490278*s1*s2
sleep_es = -0.84913187*s1*s2


## Urine Test 2 weeks stats

long_table <- data2w %>%
  select(rid, group, stage, ut_coc) %>%
  group_by(group) %>%
  gather(key, value = timepoint, -rid, -group, -ut_coc) %>%
  count(ut_coc, key, timepoint)

short_table <- xtabs(n ~ ut_coc + group + timepoint, data= long_table)
ftable(short_table)

## Cochran-Mantel-Haenszel test (https://rcompanion.org/handbook/H_06.html)

mantelhaen.test(short_table)

#prepare data for AFNI
dataTable_afni <- data2week
dataTable_afni <- dataTable_afni %>%
  select(Subj = rid,group,stage)
dataTable_afni$stage <- factor(dataTable_afni$stage, levels = c("T0","T1"), labels = c("t0","t1"))
dataTable_afni$InputFile <- paste("/media/egarza/Elements2/projects/ADDIMEX_TMS/FC_CLIN/3-Experiment/analysis/AFNI/Zmaps/",dataTable_afni$Subj,"_ses-",dataTable_afni$stage,"_stdlDLPFC_Z.nii.gz \\", sep ="")
write_tsv(dataTable_afni, "dataTable.txt")

## Double BLind urine tests

cochrans_table <- data2w %>%
  dplyr::select(rid, group, stage, ut_coc) %>%
  na.omit()

cochrans_table$stage <- as.numeric(cochrans_table$stage)
cochrans_table$ut_coc <- as.numeric(cochrans_table$ut_coc)
cochrans_table$group <- as.numeric(cochrans_table$group)
cochrans_table <- cochrans_table %>%
  mutate(ut_coc = ifelse(ut_coc == 2, 0, 1))

cochrans_table_sham <- xtabs(ut_coc ~ rid + stage, 
                          data=cochrans_table, subset = group == 1)

cochrans_table_active <- xtabs(ut_coc ~ rid + stage, 
                             data=cochrans_table, subset = group == 2)

cochrans_table_both <- xtabs(ut_coc ~ rid + stage + group, 
                               data=cochrans_table)
summary(cochrans_table_both)

write_csv(cochrans_table_sham, "cochrans_table_sham.csv")


## Plots

### Primary outcome measures

plot1 <- ggplot(data2w, aes(stage, ccq_n, fill = group))+
  geom_boxplot() + ylab("Craving CCQ-Now")+ xlab("") +
  scale_fill_discrete(name = "Group")

plot2 <- ggplot(data2w, aes(stage, ccq_n, color = group)) +
  geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + 
  xlab("") + ylab("") + scale_color_discrete(name = "Group") +
  facet_grid(. ~ group) + theme(strip.text.x = element_blank())


plot3 <- ggplot(data2w, aes(stage, vas, fill = group)) +
  geom_boxplot() + ylab("Craving VAS") + xlab("Time point") + guides(fill = "none") 

plot4 <- ggplot(data2w, aes(stage, vas, color = group)) +
  geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) +
  xlab("Time point") + ylab("") + scale_color_discrete(name = "Group") + guides(color = "none") +
  facet_grid(. ~ group) + theme(strip.text.x = element_blank())

# Raincloud plot
sumrepdat <- summarySE(data2w, measurevar = "vas", groupvars=c("
group", "stage"))

p1 <- ggplot(data2w, aes(x = stage, y = vas, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = vas, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = vas, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = vas_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = vas_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = vas_mean, group = group, colour = group, ymin = vas_mean-se, ymax
                                      = vas_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Craving VAS")+ xlab("")

sumrepdat <- summarySE(data2w, measurevar = "ccq_n", groupvars=c("
group", "stage"))

p2 <- ggplot(data2w, aes(x = stage, y = ccq_n, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = ccq_n, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = ccq_n, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = ccq_n_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = ccq_n_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = ccq_n_mean, group = group, colour = group, ymin = ccq_n_mean-se, ymax
                                      = ccq_n_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Craving CCQ-Now")+ xlab("")

sumrepdat <- summarySE(data2w, measurevar = "bis11t", groupvars=c("
group", "stage"))

p3 <- ggplot(data2w, aes(x = stage, y = bis11t, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = bis11t, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = bis11t, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = bis11t_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = bis11t_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = bis11t_mean, group = group, colour = group, ymin = bis11t_mean-se, ymax
                                      = bis11t_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Impulsivity")+ xlab("")

sumrepdat <- summarySE(data2w, measurevar = "hars_tot", groupvars=c("
group", "stage"))

p4 <- ggplot(data2w, aes(x = stage, y = hars_tot, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = hars_tot, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = hars_tot, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = hars_tot_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = hars_tot_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = hars_tot_mean, group = group, colour = group, ymin = hars_tot_mean-se, ymax
                                      = hars_tot_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Anxiety")+ xlab("Time point")

sumrepdat <- summarySE(data2w, measurevar = "hdrs_tot", groupvars=c("
group", "stage"))

p5 <- ggplot(data2w, aes(x = stage, y = hdrs_tot, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = hdrs_tot, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = hdrs_tot, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = hdrs_tot_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = hdrs_tot_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = hdrs_tot_mean, group = group, colour = group, ymin = hdrs_tot_mean-se, ymax
                                      = hdrs_tot_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Depression")+ xlab("Time point")

sumrepdat <- summarySE(data2w, measurevar = "pitt_score", groupvars=c("
group", "stage"))

p6 <- ggplot(data2w, aes(x = stage, y = pitt_score, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = pitt_score, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = pitt_score, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = pitt_score_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = pitt_score_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = pitt_score_mean, group = group, colour = group, ymin = pitt_score_mean-se, ymax
                                      = pitt_score_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Sleep")+ xlab("Time point")

ggarrange(p1, p2, p3,
          p4,p5,p6, labels = c("a.","b.","c.","d.","e.","f."), common.legend = TRUE, legend = "bottom")

#ggarrange(plot1 + rremove("x.text"), plot2 + rremove("x.text"), plot3, plot4, legend = "top")

### Secondary outcome measures

plot5 <- ggplot(data2w, aes(stage, bis11t, fill = group))+
  geom_boxplot() + ylab("Impulsivity")+ xlab("") +
  scale_fill_discrete(name = "Group")

plot6 <- ggplot(data2w, aes(stage, hars_tot, fill = group))+
  geom_boxplot() + ylab("Anxiety")+ xlab("") +
  scale_fill_discrete(name = "Group") + guides(fill = "none") 

plot7 <- ggplot(data2w, aes(stage, hdrs_tot, fill = group))+
  geom_boxplot() + ylab("Depression")+ xlab("") +
  scale_fill_discrete(name = "Group") + guides(fill = "none") 

plot8 <- ggplot(data2w, aes(stage, pitt_score, fill = group))+
  geom_boxplot() + ylab("Sleep")+ xlab("") +
  scale_fill_discrete(name = "Group") + guides(fill = "none") 

ggarrange(plot5, plot6, plot7, plot8, legend = "top")

## Terciary

plot1 <- ggplot(data2w, aes(stage, conn_dlvm, fill = group))+
  geom_boxplot() +
  stat_summary(
    fun = median,
    geom = 'line',
    aes(group = group, color = group),
    position = position_dodge(width = 0.9), #this has to be added
    show.legend = FALSE
  ) + ylab("Left DLPFC - vmPFC Connectivity (Z)")+ xlab("Time point") +
  scale_fill_discrete(name = "Group")

ggplot(data2w, aes(stage, conn_dlvm, color = group)) +
  geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + 
  ylab("Left DLPFC - vmPFC Connectivity (Z)")+ xlab("Time point") + scale_color_discrete(name = "Group") +
  facet_grid(. ~ group) + theme(strip.text.x = element_blank())

# Raincloud plot
sumrepdat <- summarySE(data2w, measurevar = "conn_dlvm", groupvars=c("
group", "stage"))

p11 <- ggplot(data2w, aes(x = stage, y = conn_dlvm, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = conn_dlvm, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = conn_dlvm, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = conn_dlvm_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = conn_dlvm_mean, group = group, colour = group), shape = 18,
             show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = conn_dlvm_mean, group = group, colour = group, ymin = conn_dlvm_mean-se, ymax
                                      = conn_dlvm_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name = "Group")+
  ylab("Left DLPFC - vmPFC Connectivity (Z)")+ xlab("Time point")




plot2 <- ggplot(data2w, aes(stage, vmpfc_cluster, fill = group))+
  geom_boxplot() +
  stat_summary(
    fun = median,
    geom = 'line',
    aes(group = group, color = group),
    position = position_dodge(width = 0.9) #this has to be added
  ) + ylab("vmPFC - rAnG Connectivity (Z)")+ xlab("Time point") +
  scale_fill_discrete(name = "Group")


sumrepdat <- summarySE(data2w, measurevar = "vmpfc_cluster", groupvars=c("
group", "stage"))

p12 <- ggplot(data2w, aes(x = stage, y = vmpfc_cluster, fill = group)) +
  geom_flat_violin(aes(fill = group),position = position_nudge(x = .25, y = 0),
                   adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
  geom_point(aes(x = as.numeric(stage)-.25, y = vmpfc_cluster, colour = group
  ), position = position_jitter(width = .05), size = 2, shape = 20, show.legend = FALSE) +
  geom_boxplot(aes(x = stage, y = vmpfc_cluster, fill = group), 
               outlier.shape = NA, alpha = .5, width = .25, colour = "black") +
  geom_line(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                  y = vmpfc_cluster_mean, group = group, colour = group), linetype = 3, size = .7,
            show.legend = FALSE) +
  geom_point(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                   y = vmpfc_cluster_mean, group = group, colour = group), shape = 18, show.legend = FALSE) +
  geom_errorbar(data = sumrepdat, aes(x = as.numeric(stage)+.25,
                                      y = vmpfc_cluster_mean, group = group, colour = group, ymin = vmpfc_cluster_mean-se, ymax
                                      = vmpfc_cluster_mean+se), width = .1, show.legend = FALSE)+
  scale_colour_manual(values = c('#FF3333','#3399FF'))+
  scale_fill_manual(values = c('#FF0000','#3399FF'), name="Group")+
  ylab("vmPFC - right AnG Connectivity (Z)")+ xlab("Time point")

# Other

others_table <- mytable(stage*group ~ whodast+gsi+psdi+pst, data = data2w)
mycsv(others_table, file = "others_table.csv")
  
plot1 <- ggplot(data2w, aes(stage, whodast, fill = group))+
  geom_boxplot() + ylab("WHODAS Total")+ xlab("") +
  scale_fill_discrete(name = "Group")

plot2 <- ggplot(data2w, aes(stage, gsi, fill = group))+
  geom_boxplot() + ylab("Global Severity Index")+ xlab("") +
  scale_fill_discrete(name = "Group")

plot3 <- ggplot(data2w, aes(stage, psdi, fill = group))+
  geom_boxplot() + ylab("Positive Symptom Distress Index")+ xlab("") +
  scale_fill_discrete(name = "Group")

plot4 <- ggplot(data2w, aes(stage, pst, fill = group))+
  geom_boxplot() + ylab("Positive Symptom Total")+ xlab("") +
  scale_fill_discrete(name = "Group")

ggarrange(plot1, plot2, plot3, plot4, legend = "top")

## Scatter plots matrix

upper.panel<-function(x, y){
  points(x,y, pch=19, col=c("red", "green3")[data2w$group])
  r <- round(cor(x, y), digits=2)
  txt <- paste0("R = ", r)
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  text(0.5, 0.9, txt)
}
pairs(data2w[,8:25], lower.panel = NULL, 
      upper.panel = upper.panel)


### Delta data analysis

cor.test(delta_data$vasZ.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$vasZ.diff, delta_data$vmpfc.diff)

p <- ggplot(delta_data, aes(conn_dlvm.diff, vasZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")


cor.test(delta_data$ccqnZ.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$ccqnZ.diff, delta_data$vmpfc.diff)

cor.test(delta_data$bis11tZZ.diff, delta_data$conn_dlvm.diff) # sig
cor.test(delta_data$bis11tZZ.diff, delta_data$vmpfc.diff) # sig

p <- ggplot(delta_data, aes(conn_dlvm.diff, bis11tZZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")

# New Figure for manuscript
p1 <- ggplot(delta_data, aes(conn_dlvm.diff, bis11tZZ.diff))+
  geom_point(aes(color=group)) + geom_smooth(aes(color="black"),method = "lm", linetype=3, show.legend = FALSE) +
  xlab("Δ Left DLPFC - vmPFC Connectivity (Z)") + ylab("Δ Impulsivity (Z)") +
  scale_colour_manual(breaks=c("SHAM", "ACTIVE"), values = c('#3399FF',"black",'#FF3333'), name = "Group")

p2 <- ggplot(delta_data, aes(vmpfc.diff, bis11tZZ.diff))+
  geom_point(aes(color=group)) + geom_smooth(aes(color="black"),method = "lm", linetype=3, show.legend = FALSE) +
  xlab("Δ vmPFC - right AnG Connectivity (Z)") + ylab("Δ Impulsivity (Z)") +
  scale_colour_manual(breaks=c("SHAM", "ACTIVE"), values = c('#3399FF',"black",'#FF3333'), name = "Group")

ggarrange(p1,p2,ncol = 1, labels = c("a.","b."), common.legend = TRUE, legend = "right", vjust = 1, widths = 0.5,
          font.label = list(size = 20))

p <- ggplot(delta_data, aes(vmpfc.diff, bis11tZZ.diff, fill = group))
q <- p + geom_point() + geom_smooth(method = "lm") +
  xlab("Δ vmPFC- right AnG Connectivity (Z)") + ylab("Δ Impulsivity (Z)")


## Responders
# Definition 1: If > Mean Active % - Mean Sham %
# Definition 2: If > SD (VAS > 65% & BIS > 20%)

delta_data_resp <- delta_data
is.na(delta_data_resp) <- sapply(delta_data_resp, is.infinite)
is.na(delta_data_resp) <- sapply(delta_data_resp, is.nan)

delta_data_resp %>%
  na.omit() %>%
  filter(bis11t.diff.per > 0) %>%
  group_by(group) %>%
  dplyr::summarize(Vas_Per_Mean = mean(vas.diff.per),
                   Vas_Diff_Mean = mean(vas.diff),
                   Vas_Diff_SD = sd(vas.diff),
                   BIS_Per_Mean = mean(bis11t.diff.per),
                   BIS_Per_SD = sd(bis11t.diff.per))

delta_data_resp %>%
  na.omit() %>%
  filter(vas.diff.per > 0) %>%
  group_by(group) %>%
  dplyr::summarize(Vas_Per_Mean = mean(vas.diff.per),
                   Vas_Diff_Mean = mean(vas.diff),
                   Vas_Per_SD = sd(vas.diff.per),
                   BIS_Per_Mean = mean(bis11t.diff.per),
                   BIS_Per_SD = sd(bis11t.diff.per))

  
delta_data_resp <- delta_data_resp %>%
  mutate(tms_bis_response = ifelse(bis11t.diff.per >= 20, "RESPONDER", "NON-RESPONDER"),
         tms_vas_response = ifelse(vas.diff.per >= 65, "RESPONDER", "NON-RESPONDER"))
delta_data_resp$tms_vas_response[is.na(delta_data_resp$tms_vas_response)] = "NON-RESPONDER"

delta_data_resp <- delta_data_resp %>%
  mutate(tms_both_response = ifelse(tms_vas_response =="RESPONDER" & tms_bis_response == "RESPONDER",
                                    "RESPONDER","NON-RESPONDER"))

table(delta_data_resp$tms_bis_response, delta_data_resp$group)
table(delta_data_resp$tms_vas_response, delta_data_resp$group)

responders <- delta_data_resp %>%
  dplyr::select(rid,group,tms_vas_response,tms_bis_response)

responders$tms_vas_response <- factor(responders$tms_vas_response, levels = c("RESPONDER", "NON-RESPONDER"))
responders$tms_bis_response <- factor(responders$tms_bis_response, levels = c("RESPONDER", "NON-RESPONDER"))

delta_data_resp %>%
  filter(vas.diff.per > 0 & bis11t.diff.per >0) %>%
  ggplot(aes(x = bis11t.diff.per, y = vas.diff.per, color = tms_vas_response)) +
  geom_point() + geom_hline(yintercept=65, linetype="dashed", color = "gray", size=1) +
  scale_y_continuous(breaks=seq(0,100,10))

delta_data_resp %>%
  filter(vas.diff.per > 0 & bis11t.diff.per >0) %>%
  ggplot(aes(x = vas.diff.per, y =bis11t.diff.per, color = tms_bis_response)) +
  geom_point() + geom_hline(yintercept=20, linetype="dashed", color = "gray", size=1) +
  scale_y_continuous(breaks=seq(0,100,10))

delta_data_resp %>%
  filter(vas.diff.per > 0 & bis11t.diff.per >0) %>%
  ggplot(aes(x = bis11t.diff.per, y =vas.diff.per, color = tms_both_response)) +
  geom_point() + geom_hline(yintercept=65, linetype="dashed", color = "gray", size=1) +
  geom_vline(xintercept=20, linetype="dashed", color = "gray", size=1) +
  scale_y_continuous(breaks=seq(0,100,10))

responders <- responders %>%
  mutate(tms_both_response = ifelse(tms_vas_response =="RESPONDER" & tms_bis_response == "RESPONDER",
                                    "RESPONDER","NON-RESPONDER"))

responders$tms_both_response <- factor(responders$tms_both_response, levels = c("RESPONDER", "NON-RESPONDER"))

table(responders$tms_vas_response, responders$group)
table(responders$tms_bis_response, responders$group)
table(responders$tms_both_response, responders$group)

# Responders characteristics

responders <- responders %>%
  mutate(group = ifelse(group == "ACTIVE", "REAL", "SHAM"))

responders$group <- factor(responders$group, levels = c("SHAM", "REAL"))

dataT0_all <- dataT0_gen %>%
  left_join(dataT0_psych)

dataT0_all <- dataT0_all %>%
  left_join(responders, by = c("rid", "group"))
  
dataT0_all <- dataT0_all %>%
  left_join(dataT0_add, by = c("rid","group","stage", "included"))

#dataT0_all <- dataT0_all %>%
#  left_join(dataT0_inv, by = c("rid","group","stage")) %>%
#  arrange(rid)

dataT0_all <- dataT0_all %>%
  left_join(tx, by = c("rid", "group"))

dataT0_all <- dataT0_all %>%
  dplyr::select(-included,-med1,-med2,-med3) %>%
  arrange(rid)

dataT0_all <- dataT0_all %>%
  left_join(conn_dlpfcvm, by = c("rid", "stage"))

dataT0_all <- dataT0_all %>%
  left_join(conn_vmpfc, by = c("rid", "stage"))

dataT0_all$rid <- set_label(dataT0_all$rid, label = "ID")
dataT0_all$group <- set_label(dataT0_all$group, label = "Group")
dataT0_all$stage <- set_label(dataT0_all$stage, label = "Timepoint")
dataT0_all$q1_sex <- set_label(dataT0_all$q1_sex, label = "Sex")
dataT0_all$q1_age <- set_label(dataT0_all$q1_age, label = "Age")
dataT0_all$q2_edyears <- set_label(dataT0_all$q2_edyears, label = "Years of education")
dataT0_all$q5_civ <- set_label(dataT0_all$q5_civ, label = "Marital status")
dataT0_all$q6_month <- set_label(dataT0_all$q6_month, label = "Montly income (MXN)")
dataT0_all$q6_employeeyr <- set_label(dataT0_all$q6_employeeyr, label = "Employment (last 3 years)")
dataT0_all$q7_yrstart <- set_label(dataT0_all$q7_yrstart, label = "Onset age of cocaine use")
dataT0_all$q7_tconsume <- set_label(dataT0_all$q7_tconsume, label = "Years of cocaine use")
dataT0_all$score_clasif <- set_label(dataT0_all$score_clasif, label = "Socioeconomic status")  
dataT0_all$ut_amp <- set_label(dataT0_all$ut_amp, label = "Amphetamines")
dataT0_all$ut_bzd <- set_label(dataT0_all$ut_bzd, label = "Benzodiazepines")
dataT0_all$ut_coc <- set_label(dataT0_all$ut_coc, label = "Cocaine")
dataT0_all$ut_met <- set_label(dataT0_all$ut_met, label = "Methamphetamines")
dataT0_all$ut_mor <- set_label(dataT0_all$ut_mor, label = "Opiates")
dataT0_all$ut_thc <- set_label(dataT0_all$ut_thc, label = "Cannabis")
dataT0_all$cog <- set_label(dataT0_all$cog, label = "BIS11 - Cognitive")
dataT0_all$mot <- set_label(dataT0_all$mot, label = "BIS11 - Motor")
dataT0_all$nonp <- set_label(dataT0_all$nonp, label = "BIS11 - Non-Planned")
dataT0_all$tot_score <- set_label(dataT0_all$tot_score, label = "BIS11 - Total")
dataT0_all$ccq_g <- set_label(dataT0_all$ccq_g, label = "Cocaine Craving Questionnaire - General")
dataT0_all$ccq_n <- set_label(dataT0_all$ccq_n, label = "Cocaine Craving Questionnaire - Now")
dataT0_all$vas <- set_label(dataT0_all$vas, label = "Craving VAS")
dataT0_all$consumption <- set_label(dataT0_all$consumption, label = "Tobacco current use")
dataT0_all$age_begin <- set_label(dataT0_all$age_begin, label = "Tobacco onset age")
dataT0_all$years_con <- set_label(dataT0_all$years_con, label = "Tobacco years of use")
dataT0_all$cig_day <- set_label(dataT0_all$cig_day, label = "Cigarettes per day")
dataT0_all$som <- set_label(dataT0_all$som, label = "SCL90R - Somatization")
dataT0_all$oc <- set_label(dataT0_all$oc, label = "SCL90R -Obsessive Compulsive")
dataT0_all$is <- set_label(dataT0_all$is, label = "SCL90R - Interpersonal Sensitivity")
dataT0_all$dep <- set_label(dataT0_all$dep, label = "SCL90R - Depression")
dataT0_all$anx <- set_label(dataT0_all$anx, label = "SCL90R - Anxiety")
dataT0_all$hos <- set_label(dataT0_all$hos, label = "SCL90R - Hostility")
dataT0_all$phob <- set_label(dataT0_all$phob, label = "SCL90R - Phobic Anxiety")
dataT0_all$par <- set_label(dataT0_all$par, label = "SCL90R - Paranoid Ideation")
dataT0_all$psy <- set_label(dataT0_all$psy, label = "SCL90R - Psychoticism")
dataT0_all$gsi <- set_label(dataT0_all$gsi, label = "SCL90R - Global Severity Index")
dataT0_all$psdi <- set_label(dataT0_all$psdi, label = "SCL90R - Positive Symptom Distress Index")
dataT0_all$pst <- set_label(dataT0_all$pst, label = "SCL90R - Positive Symptom Total")
dataT0_all$pitt_score <- set_label(dataT0_all$pitt_score, label = "Pittsburgh total score")
dataT0_all$pitt_sqs <- set_label(dataT0_all$pitt_sqs, label = "Subjective quality of sleep")
dataT0_all$pitt_sl <- set_label(dataT0_all$pitt_sl, label = "Sleep latency")
dataT0_all$pitt_slcateg <- set_label(dataT0_all$pitt_slcateg, label = "Sleep latency categories")
dataT0_all$pitt_sd <- set_label(dataT0_all$pitt_sd, label = "Sleep Duration")
dataT0_all$pitt_totbed <- set_label(dataT0_all$pitt_totbed, label = "Total hours in bed")
dataT0_all$pitt_hse <- set_label(dataT0_all$pitt_hse, label = "Habitual sleep efficiency")
dataT0_all$pitt_hse_categ <- set_label(dataT0_all$pitt_hse_categ, label = "Habitual sleep efficiency categories")
dataT0_all$pitt_sdis <- set_label(dataT0_all$pitt_sdis, label = "Sleep disturbances")
dataT0_all$pitt_sdiscateg <- set_label(dataT0_all$pitt_sdiscateg, label = "Sleep disturbances categories")
dataT0_all$pitt_usmed <- set_label(dataT0_all$pitt_usmed, label = "Use of sleep medications")
dataT0_all$pitt_dd <- set_label(dataT0_all$pitt_dd, label = "Daytime dysfunction")
dataT0_all$pitt_dd_categ <- set_label(dataT0_all$pitt_dd_categ, label = "Daytime dysfunction categories")
dataT0_all$pitt_gqs <- set_label(dataT0_all$pitt_gqs, label = "Global Quality of Sleep")

dataT0_all_log <- dataT0_all %>%
  filter(group == "REAL") %>%
  dplyr::select(rid,sex = q1_sex,age = q1_age, educ = q2_edyears,
                q6_employeeyr, q7_tconsume, q9_amtreat,q10_hosp, q11_grptime,
                hdrs_score = score_total, hars_score = hars_tot, amai_score = tot_score.x,
                som, oc, is, dep, anx, hos, phob, par, psy, gsi, psdi, pst, pitt_score,
                whodas_score = total, tms_vas_response, tms_bis_response, tms_both_response, ut_amp, ut_bzd,
                ut_coc, ut_met,ut_mor, ut_thc, bis11t = tot_score.y, ccq_g, ccq_n, vas,
                tobacco_con = consumption, tobacco_yrs = years_con, cig_day, tx_psych, tx_pharma, meds, conn_dlvm,
                vmpfc_cluster)

mytable(tms_vas_response ~ ., data = dataT0_all_log)

#dataT0_all_log <- na.omit(dataT0_all)
#dataT0_all_log <- dataT0_all_log %>%
#  mutate(tms_both_response = ifelse(tms_vas_response =="RESPONDER" & tms_bis_response == "RESPONDER",
 #                                       "RESPONDER","NON-RESPONDER"))

#dataT0_all_log <- dataT0_all_log %>%
#  mutate(tms_vas_response_num = ifelse(tms_vas_response == "RESPONDER", 1,0),
#         tms_bis_response_num = ifelse(tms_bis_response == "RESPONDER", 1,0),
#         tms_both_response_num = ifelse(tms_vas_response_num ==1 & tms_bis_response_num == 1,1,0))

### Logistic Regression

install.packages("mlogit")
library(mlogit)

dataT0_all_log <- na.omit(dataT0_all_log)

# Check for correlations

dataT0_all_log_num <- dataT0_all_log %>%
  dplyr::select(age,educ,q7_tconsume, hdrs_score, hars_score, amai_score,
         gsi, pitt_score, whodas_score,
         bis11t, ccq_g, vas, tobacco_yrs,
         cig_day)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(dataT0_all_log_num, 
                  method="spearman",
                  histogram=TRUE,
                  pch=16)


dataT0_all_log <- na.omit(dataT0_all_log)

#### VAS

model_null <- glm(tms_vas_response ~ 1, data = dataT0_all_log, family = binomial)
model1 <- glm(tms_vas_response ~ age + educ + q6_employeeyr + q7_tconsume +
                q9_amtreat + q10_hosp + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model2 <- glm(tms_vas_response ~ age + q7_tconsume + q9_amtreat + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model3 <- glm(tms_vas_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + cig_day,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model4 <- glm(tms_vas_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + whodas_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model5 <- glm(tms_vas_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + ut_coc + tx_psych + tx_pharma + meds,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_vas_response ~ q11_grptime + hdrs_score + meds + age +
                tx_pharma + tx_psych + ut_coc + q7_tconsume + q9_amtreat + hars_score + pitt_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_vas_response ~ q11_grptime, family = binomial(), na.action = na.omit, data = dataT0_all_log)

summary(model_null)
summary(model1)
summary(model2)
summary(model3)
summary(model6)
anova(model4)

step(model_null,
     scope = list(upper=model5),
     direction="both",
     test="Chisq",
     data=dataT0_all_log)


#### BIS

model_null <- glm(tms_bis_response ~ 1, data = dataT0_all_log, family = binomial)
model1 <- glm(tms_bis_response ~ age + educ + q6_employeeyr + q7_tconsume +
                q9_amtreat + q10_hosp + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model2 <- glm(tms_bis_response ~ age + q7_tconsume + q9_amtreat + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model3 <- glm(tms_bis_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + cig_day,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model4 <- glm(tms_bis_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + whodas_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model5 <- glm(tms_bis_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + ut_coc + tx_pharma + meds,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_bis_response ~ q11_grptime + hdrs_score + meds + age +
                tx_pharma + ut_coc + q7_tconsume + q9_amtreat + hars_score + pitt_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_bis_response ~ q11_grptime, family = binomial(), na.action = na.omit, data = dataT0_all_log)

summary(model_null)
summary(model1)
summary(model2)
summary(model3)
summary(model5)
summary(model6)
anova(model4)

step(model_null,
     scope = list(upper=model5),
     direction="both",
     test="Chisq",
     data=dataT0_all_log)

## BOTH

model_null <- glm(tms_both_response ~ 1, data = dataT0_all_log, family = binomial)
model1 <- glm(tms_both_response ~ age + educ + q6_employeeyr + q7_tconsume +
                q9_amtreat + q10_hosp + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model2 <- glm(tms_both_response ~ age + q7_tconsume + q9_amtreat + q11_grptime,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model3 <- glm(tms_both_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + cig_day,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model4 <- glm(tms_both_response ~ age + q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + whodas_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model5 <- glm(tms_both_response ~ q7_tconsume + q9_amtreat + q11_grptime +
                hdrs_score + hars_score + pitt_score + ut_coc + meds + conn_dlvm,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_both_response ~ q11_grptime + hdrs_score + meds + age +
                tx_pharma + ut_coc + q7_tconsume + q9_amtreat + hars_score + pitt_score,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)
model6 <- glm(tms_both_response ~ q11_grptime + meds,
              family = binomial(), na.action = na.omit, data = dataT0_all_log)

summary(model_null)
summary(model1)
summary(model2)
summary(model3)
summary(model4)
summary(model6)
anova(model_null,model4)

step(model_null,
     scope = list(upper=model5),
     direction="both",
     test="Chisq",
     data=dataT0_all_log)


glimpse(responders)

delta_data %>%
  filter(group == "ACTIVE") %>%
  left_join(responders, by = c("rid", "group")) %>%
  ggplot(aes(x = tms_both_response, y = vmpfc.diff, fill = tms_both_response)) +
  geom_boxplot() + geom_jitter()

model4_table <- tidy(model4, conf.int = TRUE)
write_csv(model4_table, "model4_table.csv")

tidy(model_null)
glance(model4)

## Cocaine use autoreports

data2w$stage <- stagefactor(data2w)

inventory_auto <- inventory %>%
  dplyr::select(rid,group,stage,auto2,auto3) %>%
  filter(stage != "T0") %>%
  bind_rows(inventory_t0) %>%
  arrange(rid, stage)

data2w_auto <- data2w %>%
  left_join(inventory_auto, by = c("rid", "stage"))

wilcox.test(auto2 ~ group.x, data = data2w_auto)

data6m_auto <- data6m %>%
  left_join(inventory_auto, by = c("rid", "stage")) %>%drop_na(stage_openlabel)

data2w_auto %>%
  ggplot(aes(x = stage, y = auto2, fill = group.x)) +
  geom_bar(stat="identity", position=position_dodge())

data2w_auto %>%
  ggplot(aes(x = stage, y = auto3, fill = group.x)) +
  geom_boxplot()

data2w_auto <- data2w_auto %>%
  group_by(group.x, stage) %>%
  mutate(auto3_Z = (auto3 - mean(auto3))/sd(auto3))

data2w_auto %>%
  ggplot(aes(x = stage, y = auto3_Z, fill = group.x)) +
  geom_boxplot()

p <- ggplot(data2w_auto, aes(stage, auto2, color = group.x))
q <- p + geom_line(aes(group = rid, color = group.x)) + geom_point(aes(color = group.x)) +
  xlab("Timepoint") + ylab("Consumption Frequency") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group.x)

data6m_auto %>%
  ggplot(aes(x = stage_openlabel, y = auto2)) +
  geom_bar(stat="identity", position=position_dodge())

p <- ggplot(data6m_auto, aes(stage_openlabel, auto2))
q <- p + geom_line(aes(group = rid, color = rid)) + geom_point(aes(group = rid, color = rid)) +
  xlab("Timepoint") + ylab("Consumption Frequency")

q + facet_grid(. ~ group)

data2w_auto %>%
  ggplot(aes(x = stage, y = auto3, fill = group.x)) +
  geom_boxplot()


# Cognitive

cognitive$group <- factor(cognitive$group, levels = c("SHAM", "REAL"), labels = c("SHAM", "ACTIVE"))
cognitive$rid <- set_label(cognitive$rid, label = "ID")
cognitive$group <- set_label(cognitive$group, label = "Group")

data2w_cog <- data2w %>%
  left_join(cognitive, by = c("rid", "group", "stage")) %>%
  dplyr::select(rid,group,stage,sex,age,educ,ccq_g,ccq_n,vas,ut_coc,bis11t,bis11cog,bis11mot,bis11nonp,
                hars_tot,hars_categories,hdrs_tot,hdrs_categories,pitt_score, pitt_gqs,conn_dlvm,vmpfc_cluster,
                vasZ, bis11tZ, ccqnZ, inhib_index, inhib_trven, inhib_trdes, lab_ttotal, lab_toterror)

ggplot(data2w_cog, aes(stage, inhib_index, fill = group))+
  geom_boxplot() + ylab("Impulsivity")+ xlab("") +
  scale_fill_discrete(name = "Group")

ggplot(data2w_cog, aes(stage, inhib_trven, fill = group))+
  geom_boxplot() + ylab("Impulsivity")+ xlab("") +
  scale_fill_discrete(name = "Group")

ggplot(data2w_cog, aes(stage, inhib_trdes, fill = group))+
  geom_boxplot() + ylab("Impulsivity")+ xlab("") +
  scale_fill_discrete(name = "Group")

shapiro.test(data2w_cog$inhib_index)
shapiro.test(data2w_cog$inhib_trven)
shapiro.test(data2w_cog$inhib_trdes)

lm_inhb_index <- glmer(inhib_index ~ stage * group + age + sex + (1|rid), family = gamma, data2w_cog)
lm_inhib_trven <- lmer(inhib_trven ~ stage * group + age + sex + (1|rid), data2w_cog)
lm_inhib_trdes <- lmer(inhib_trdes ~ stage * group + age + sex + (1|rid), data2w_cog)

summary(lm_inhb_index)
summary(lm_inhib_trven)
summary(lm_inhib_trdes)
summary(lm_lab_ttotal)
summary(lm_lab_toterror)

delta_inhib_index <- data2w_cog %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(inhib_index)) %>%
  mutate(inhib_index.diff = inhib_index - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, inhib_index.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, inhib_index.diff)

delta_inhib_trven <- data2w_cog %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(inhib_trven)) %>%
  mutate(inhib_trven.diff = inhib_trven - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, inhib_trven.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, inhib_trven.diff)

delta_inhib_trdes <- data2w_cog %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(inhib_trdes)) %>%
  mutate(inhib_trdes.diff = inhib_trdes - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, inhib_trdes.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, inhib_trdes.diff)

delta_data <- delta_data %>%
  left_join(delta_inhib_index, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_inhib_trven, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_inhib_trdes, by = c("rid", "group"))

shapiro.test(delta_data$inhib_index.diff)
shapiro.test(delta_data$inhib_trven.diff)
shapiro.test(delta_data$inhib_trdes.diff)

t.test(delta_data$inhib_index.diff ~ delta_data$group)
wilcox.test(delta_data$inhib_index.diff ~ delta_data$group)

cor.test(delta_data$inhib_index.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$inhib_index.diff, delta_data$vmpfc.diff)

cor.test(delta_data$inhib_trven.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$inhib_trven.diff, delta_data$vmpfc.diff)

cor.test(delta_data$inhib_trdes.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$inhib_trdes.diff, delta_data$vmpfc.diff)

p <- ggplot(delta_data, aes(conn_dlvm.diff, vasZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")


cor.test(delta_data$ccqnZ.diff, delta_data$conn_dlvm.diff)
cor.test(delta_data$ccqnZ.diff, delta_data$vmpfc.diff)

cor.test(delta_data$bis11tZZ.diff, delta_data$conn_dlvm.diff) # sig
cor.test(delta_data$bis11tZZ.diff, delta_data$vmpfc.diff) # sig

p <- ggplot(delta_data, aes(conn_dlvm.diff, bis11tZZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")

p <- ggplot(delta_data, aes(vmpfc.diff, bis11tZZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm") +
  xlab("Delta vmPFC-Angular gyrus Connectivity (Z)") + ylab("Delta Impulsivity (Z)")

#################################################################################################################

# GLM

  

# 2 x 2
lm_vas <- lmer(vas ~ stage * group + age + sex + educ + (1|rid), data2week)
lm_ccqn <- lmer(ccq_n ~ stage * group + age + sex + educ + (1|rid), data2week)
lm_bis11 <- lmer(bis11_tot ~ stage * group + age + sex + educ + (1|rid), data2week)

#lm_conn_dlvm <- lmer(conn_dlvm ~ stage * group + (1|rid), data=subset(data2week, craving_level=="High"))
#lm_conn_lput <- lmer(conn_lput ~ stage * group + age + sex + educ + (1|rid), data=subset(data2week, craving_level=="High"))

summary(lm_vas)
summary(lm_ccqn)
summary(lm_bis11)
#summary(lm_conn_dlvm)
#summary(lm_conn_lput)
tidy_lm_vas <- lm.beta::lm.beta(lm_vas)
table_obj <- tidy(lm_vas)
pander(table_obj, digits = 3)


#Vizualize changes over time ALL

p <- ggplot(data2week, aes(stage, conn_dlvm, fill = group))
q <- p + geom_boxplot()


p <- ggplot(data2week, aes(stage, vas, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Craving VAS") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group)

p <- ggplot(data2week, aes(stage, bis11_tot, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Impulsivity") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group)

p <- ggplot(data2week, aes(stage, ccq_n, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Craving CCQ Now") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group)

p <- ggplot(data2week, aes(stage, conn_dlvm, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Craving VAS") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group)

p <- ggplot(data2week, aes(stage, conn_dlvm, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Craving VAS") + scale_color_discrete(name = "Group")

q + facet_grid(craving_level ~ group)

p <- ggplot(data2week, aes(conn_dlvm, vasZ, color = group))
q <- p + geom_point() + geom_smooth(method = "lm")

q + facet_grid(. ~ craving_level)

p <- ggplot(data2week, aes(stage, ut_coc, color = group))
q <- p + geom_line(aes(group = rid, color = group)) + geom_point(aes(color = group)) + xlab("Stage") + ylab("Cocaine Grams per Month") + scale_color_discrete(name = "Group")

q + facet_grid(. ~ group)


test <- data2week %>%
  pivot_wider(names_from = stage, values_from = vas)

delta_vas <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vas)) %>%
  mutate(vas.diff = vas - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  select(rid, group, stage, vas.diff) %>%
  filter(stage == "T1") %>%
  select(rid, group, vas.diff)

delta_vasZ <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(vasZ)) %>%
  mutate(vasZ.diff = vasZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  select(rid, group, stage, vasZ.diff) %>%
  filter(stage == "T1") %>%
  select(rid, group, vasZ.diff)

delta_conndlvm <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(conn_dlvm)) %>%
  mutate(conn_dlvm.diff = conn_dlvm - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  select(rid, group, stage, conn_dlvm.diff) %>%
  filter(stage == "T1") %>%
  select(rid, group, conn_dlvm.diff)

delta_bis <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(bis11_tot)) %>%
  mutate(bis11_tot.diff = bis11_tot - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  select(rid, group, stage, bis11_tot.diff) %>%
  filter(stage == "T1") %>%
  select(rid, group, bis11_tot.diff)

delta_bisZ <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(bis_totZ)) %>%
  mutate(bis_totZ.diff = bis_totZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  select(rid, group, stage, bis_totZ.diff) %>%
  filter(stage == "T1") %>%
  select(rid, group, bis_totZ.diff)

delta_ccqnZ <- data2week %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  arrange(stage) %>%
  mutate(lag = lag(ccqnZ)) %>%
  mutate(ccqnZ.diff = ccqnZ - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage, ccqnZ.diff) %>%
  filter(stage == "T1") %>%
  dplyr::select(rid, group, ccqnZ.diff)

delta_data <- delta_vas %>%
  left_join(delta_vasZ, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_conndlvm, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_bis, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_bisZ, by = c("rid", "group"))

delta_data <- delta_data %>%
  left_join(delta_ccqnZ, by = c("rid", "group"))

craving_level <- data2week %>%
  select(rid, group, stage, craving_level) %>%
  filter(stage =="T1") %>%
  select(rid, group, craving_level)
  
delta_data <- delta_data %>%
  left_join(craving_level, by = c("rid", "group"))

# Correlation between craving and connectivity

cor.test(delta_data$vasZ.diff, delta_data$conn_dlvm.diff)

p <- ggplot(delta_data, aes(conn_dlvm.diff, vasZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")

q + facet_grid(. ~ craving_level)

cor.test(delta_data$ccqnZ.diff, delta_data$conn_dlvm.diff)

p <- ggplot(delta_data, aes(conn_dlvm.diff, ccqnZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")

q + facet_grid(. ~ craving_level)


# Correlation between impulsivity and connectivity
cor.test(delta_data$bis_totZ.diff, delta_data$conn_dlvm.diff)

p <- ggplot(delta_data, aes(conn_dlvm.diff, bis_totZ.diff))
q <- p + geom_point() + geom_smooth(method = "lm")

q + facet_grid(. ~ craving_level)

# Responders (nada)

delta_data <- delta_data %>%
  mutate(tms_response = ifelse(vas.diff < -1, "RESPONDER", "NON-RESPONDER"))

delta_data %>%
  filter(tms_response == "RESPONDER" & group == "REAL") %>%
  do(tidy(cor.test(.$vasZ.diff, .$conn_dlvm.diff)))

delta_data %>%
  filter(tms_response == "RESPONDER" & group == "REAL") %$%
  cor.test(vasZ.diff, conn_dlvm.diff)

#Correlation between craving and impulsivity
delta_data %$%
  cor.test(vasZ.diff, bis_totZ.diff)

# Mediation Analysis BIS11 on Craving and Conn

## Effect of craving on connectivity
fit.totaleffect=lm(conn_dlvm.diff ~ vasZ.diff, delta_data)
summary(fit.totaleffect)

## Effect of craving on bis11
fit.mediator=lm(bis_totZ.diff ~ vasZ.diff, delta_data)
summary(fit.mediator)

## Effect of the mediator on conn
fit.dv=lm(conn_dlvm.diff ~ vasZ.diff+bis_totZ.diff,delta_data)
summary(fit.dv)

## Final step
install.packages("mediation")
library(mediation)
mediation = mediate(fit.mediator, fit.dv, treat='vasZ.diff', mediator='bis_totZ.diff')
summary(mediation)

# Inventory

inventory <- as_tibble(inventory)

dataT0_inv <- inventory %>%
  filter(stage == "T0" | stage == "T1") %>%
  dplyr::select(rid, group, stage, auto1, auto2, auto3, auto4, auto5, ut_amp, ut_bzd, ut_coc, ut_met, ut_mor, ut_thc)
data2week$ut_coc <- factor(data2week$ut_coc, levels = c("negative", "positive"))

dataT0_inv[,4:9] <- lapply(dataT0_inv[,4:9], as.factor)

p <- ggplot(data2week,aes(stage, ut_coc))
q <- p + geom_bar(aes(fill = group),stat="identity", position = position_dodge(0.8), width = 0.7, color = "black")  
q

p <- ggplot(data2week)
q <- p + geom_col(aes(x = stage, y = ut_coc, fill = group ), position = "dodge") + scale_fill_manual(values = ut_coc)
q

names(inventory)

# print vector
data2week %>% filter(group=="SHAM") %>% .$rid
delta_data %>% .$rid
vasZ_diff <- delta_data %>%
  dplyr::select(vasZ.diff)

write_csv(vasZ_diff, "vasZ_diff.csv")

data2week %>%
  filter(craving_level == "High") %>%
  ggplot(aes(x = stage, y = vas, fill = group, color = group)) + geom_boxplot()

p <- ggplot(data2week, aes(x = stage, y = vas, fill = group, color = group)) +
  geom_point() +
  scale_shape_manual(values=c(1,10), name='Group', labels=c('Sham','Real'))+
  geom_line(aes(x = stage, y = , linetype=am)) +
  scale_linetype_discrete(name='Transmission', labels=c('Automatic','Manual'))+
  labs(x = 'Vehicle Weight', y = 'Vehicle MPG')+
  apatheme
p



#Vizualize changes over time by GROUP
  data2week %>%
    filter(group == "SHAM") %>%
    ggplot(aes(stage, vas, color = group)) +
    geom_line(aes(group = rid), color = "grey50") +
    geom_point(aes(color = group))
  
data2week %>%
  ggplot(aes(x = stage, y = conn_dlvm, fill = group)) + geom_boxplot()
data2week %>%
  ggplot(aes(x = stage, y = vas, fill = group)) + geom_boxplot()

data2week %>%
  filter(stage == "T0") %>%
  summarize(median(vas))

data2week <- data2week %>%
  mutate(
    craving_level = case_when(
      stage == "T0" & vas > 2.1 ~ "High",
      stage == "T0" & vas <= 2.1 ~ "Low",
      stage == "T1" ~ craving_level[stage == "T0"]))

#data2week <- data2week %>% 
#  pivot_wider(
    names_from = stage,
    values_from = vas
  ) %>% 
  mutate(
    craving_level = ifelse(T0 <= 2.1, "Low", "High")
  ) %>% 
  pivot_longer(
    cols = T1:T0,
    names_to = "stage",
    values_to = "vas"
  )


data2week %>%
  ggplot(aes(x = vasZ, y = conn_dlvm, color = group)) + geom_point() + geom_smooth(method = lm)

data2week <- data2week %>%
  filter(stage ==) %>%
  mutate(delta_vasZ = c(0,diff(vasZ)))

  
library(dprep)


# High low craving


#lmer(Score ~ Stage * GroupVAS + age + sex + education + (1|Study.ID), grMedClinLongL1[Scale == 'VAS'])

aov_car(Score ~ GroupVAS * Stage + Error(Study.ID/Stage), data = grMedClinLong[Scale == "VAS"])


rmarkdown::pandoc_convert("results.html", to = "pdf", output = "results.pdf")


## 3 months
craving_level_3m <- vas %>%
  mutate(craving_level = ifelse(stage == "T0" & group =="REAL" & vas > 2.1, "High",
                                ifelse(stage == "T0" & group =="REAL" & vas <= 2.1,"Low",
                                       ifelse(group == "SHAM" & stage == "T1" & vas > 2.1, "High",
                                              ifelse(group == "SHAM" & stage == "T1" & vas <= 2.1,"Low", NA)))))
          
craving_level_3m <- craving_level_3m %>%
  filter(group == "SHAM" & stage == "T1" | group == "REAL" & stage == "T0") %>%
  select(rid, group, craving_level)

data3month <- merge(vas, conn_dlpfcvm, by = c("rid","stage"))
data3month <- merge(data3month, demographic, by = c("rid","group"))
data3month <- merge(data3month, included, by = c("rid", "group"))
data3month <- data3month %>%
  filter(included==TRUE)
data3month <- merge(data3month, craving_level_3m, by = c("rid", "group"))
data3month <- data3month %>%
  select(rid, group, stage = stage.x, vas, craving_level, conn_dlvm, sex = q1_sex, age = q1_age, educ = q2_edyears, onset_consum = q7_yrstart, years_consum = q7_tconsume)
data3month <- data3month %>%
  select(rid, group, stage, sex, age, educ, onset_consum, years_consum, vas, conn_dlvm, craving_level)
data3month <- data3month %>%
  filter(stage == "T0"|stage == "T1"|stage == "T1-4"| stage == "T2")
data3month <- data3month %>%
  arrange(rid)
data3month <- data3month %>%
  mutate(stage_openlabel = ifelse(stage == "T0" & group == "REAL", "BASELINE",
                                  ifelse(stage == "T1" & group == "SHAM", "BASELINE",
                                         ifelse(stage == "T1" & group == "REAL", "2W",
                                                ifelse(stage == "T1-4", "2W",
                                                       ifelse(stage == "T2", "3M",NA))))))
data3month <- drop_na(data3month)
data3month$stage_openlabel <- factor(data3month$stage_openlabel, levels = c("BASELINE", "2W", "3M"))

# Crear base solo con sujetos con los 3 puntos.
data3month_sub <- data3month %>%
  group_by(rid) %>%
  filter(any(stage_openlabel == "3M")) %>%
  ungroup()

data3month_sub <- merge(data3month_sub, bis11, by = c("rid", "group", "stage"))
data3month_sub <- data3month_sub %>%
  select(rid, group, stage, stage_openlabel, sex, age, educ, onset_consum, years_consum, craving_level,vas, conn_dlvm, bis11_tot = tot_score, bis11_cog = cog, bis11_mot = mot, bis11_nonp = nonp)
data3month_sub <- merge(data3month_sub, ccqn, by = c("rid", "group", "stage"))
data3month_sub <- arrange(data3month_sub, rid)
#data3month_sub$craving_level <- factor(data3month_sub$craving_level, levels = c("High", "Low"))
data3month_sub$vasZ <- (data3month_sub$vas - mean(data3month_sub$vas))/(sd(data3month_sub$vas))
data3month_sub$bis_totZ <- (data3month_sub$bis11_tot - mean(data3month_sub$bis11_tot))/(sd(data3month_sub$bis11_tot))

data3month_sub$vas <- set_label(data3month_sub$vas, label = "Craving VAS")

inventory <- inventory %>%
  dplyr::select(rid, group, stage, ut_amp, ut_bzd, ut_coc, ut_met, ut_mor, ut_amp, ut_thc, auto1, auto3, auto4, auto5)

data3month_sub <- merge(data3month_sub, inventory, by = c("rid", "group", "stage"))
data3month_sub <- data3month_sub %>%
  filter(!rid == "54") %>%
  arrange(rid)

## Plots

# all
p <- ggplot(data3month_sub, aes(stage_openlabel, vas, fill = stage_openlabel))
q1 <- p + geom_boxplot(aes(fill = stage_openlabel)) + xlab("Time") + ylab("Craving VAS score") + scale_fill_discrete(name = "Time") + theme(legend.position = "top")

q1

p <- ggplot(data3month_sub, aes(stage_openlabel, ccq_n, fill = stage_openlabel))
q2 <- p + geom_boxplot(aes(fill = stage_openlabel)) + xlab("Time") + ylab("Craving CCQ Now score") + scale_fill_discrete(name = "Time") + theme(legend.position = "top")

q2

p <- ggplot(data3month_sub, aes(stage_openlabel, bis11_tot, fill = stage_openlabel))
q3 <- p + geom_boxplot(aes(fill = stage_openlabel)) + xlab("Time") + ylab("Impulsivity score") + scale_fill_discrete(name = "Time") + theme(legend.position = "top")

q3

ggarrange(q1, q2, q3)

# Summary

clinical_3m <- mytable(stage_openlabel~vas+ccq_n+bis11_tot+ut_coc+auto1+auto2+auto3+auto4+auto5, data = data3month_sub)

mycsv(clinical_3m, file = "clinical_3m.csv")

data3month_sum <- data3month_sub %>%
  dplyr::group_by(stage_openlabel) %>%
  dplyr::summarise(count = n(),
            vas_mean = mean(vas),
            vas_sd = sd(vas),
            ccq_mean = mean(ccqn),
            ccq_sd = sd(ccqn),
            bis11_mean = mean(bis11_tot), 
            bis11_sd = sd(bis11_tot))

# Analysis

lm_vas3 <- lmer(vas ~ stage_openlabel + age + sex + educ + (1|rid), data3month_sub)
lm_ccqn3 <- lmer(ccq_n ~ stage_openlabel + age + sex + educ + (1|rid), data3month_sub)
lm_bis113 <- lmer(bis11_tot ~ stage_openlabel + age + sex + educ + (1|rid), data3month_sub)


anova(lm_vas3)
anova(lm_ccqn3)
anova(lm_bis113)

summary(lm_vas3)
summary(lm_bis113)
summary(lm_ccqn3)


# TMS Measures

included_tms <- included %>%
  select(rid,group,included)

included_tms$rid <- set_label(included_tms$rid, label = "ID")
included_tms$group <- set_label(included_tms$group, label = "Group")

tms_adverse <- tms_adverse %>%
  left_join(included_tms) %>%
  filter(included == TRUE) %>%
  na.omit()

tms_adverse$head <- factor(tms_adverse$head)
tms_adverse$head <- set_label(tms_adverse$head, label = "Headache")

tms_adverse_table <- mytable(group~head+neck+scalp+cognitive+concentration+hearing+irritation+seizures+mood, data=tms_adverse)

mycsv(tms_adverse_table, file = "tms_adverse_table.csv")

##################################################################################################################

# Maintenance Phase (6 months)

data6m <- ccqg %>%
  left_join(included, by = c("rid","group")) %>%
  dplyr::select(rid, group, stage = stage.x, ccq_g, included) %>%
  filter(included == TRUE) %>%
  dplyr::select(-included) %>%
  left_join(demographic, by = c("rid", "group")) %>%
  dplyr::select(rid, group, stage = stage.x, sex = q1_sex, age = q1_age, educ = q2_edyears, ccq_g) %>%
  left_join(ccqn, by = c("rid","group", "stage")) %>%
  left_join(vas, by = c("rid","group", "stage")) %>%
  left_join(inventory, by = c("rid","group", "stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc) %>%
  left_join(bis11, by = c("rid","group", "stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc,bis11t = tot_score, bis11cog = cog, bis11mot = mot, bis11nonp = nonp) %>%
  left_join(hars, by = c("rid","group", "stage")) %>%
  left_join(hdrs, by = c("rid","group", "stage")) %>%
  rename(hdrs_tot = tot_score, hdrs_categories = score_categories) %>%
  left_join(psqi, by = c("rid","group", "stage")) %>%
  left_join(cognitive, by = c("rid","group","stage")) %>%
  left_join(whodas, by = c("rid","group","stage")) %>%
  left_join(scl90r, by = c("rid","group","stage")) %>%
  dplyr::select(rid,group,stage,sex, age, educ, ccq_g,ccq_n,vas,ut_coc,bis11t, bis11cog, bis11mot, bis11nonp, hars_tot, hars_categories,
         hdrs_tot, hdrs_categories, pitt_score, pitt_gqs, whodast = total, gsi, psdi, pst)

data6m$group <- factor(data6m$group, labels = c("SHAM", "ACTIVE"))

data6m <- data6m %>%
  mutate(stage_openlabel = ifelse(stage == "T0" & group == "ACTIVE", "BASELINE",
                                  ifelse(stage == "T1" & group == "SHAM", "BASELINE",
                                         ifelse(stage == "T1" & group == "ACTIVE", "2W",
                                                ifelse(stage == "T1-4", "2W",
                                                       ifelse(stage == "T2", "3M",
                                                              ifelse(stage == "T3", "6M",NA)))))))
#data6m <- drop_na(data6m)
data6m$stage_openlabel <- factor(data6m$stage_openlabel, levels = c("BASELINE", "2W", "3M", "6M"))
data6m <- data6m %>%
  dplyr::select(rid,group,stage,stage_openlabel,sex, age, educ, ccq_g,ccq_n,vas,ut_coc,bis11t, bis11cog, bis11mot, bis11nonp, hars_tot, hars_categories,
         hdrs_tot, hdrs_categories, pitt_score, pitt_gqs, whodast, gsi, psdi, pst)

table(data6m$stage_openlabel)

data6m$rid <- set_label(data6m$rid, label = "ID")
data6m$group <- set_label(data6m$group, label = "Group")
data6m$stage <- set_label(data6m$stage, label = "Timepoint")
data6m$stage_openlabel <- set_label(data6m$stage_openlabel, label = "Timepoint")
data6m$sex <- set_label(data6m$sex, label = "Sex")
data6m$age <- set_label(data6m$age, label = "Age")
data6m$educ <- set_label(data6m$educ, label = "Years of education")
data6m$ccq_g <- set_label(data6m$ccq_g, label = "CCQ - General")
data6m$ccq_n <- set_label(data6m$ccq_n, label = "CCQ - Now")
data6m$vas <- set_label(data6m$vas, label = "VAS")
data6m$ut_coc <- set_label(data6m$ut_coc, label = "Urine test: Cocaine")
data6m$bis11t <- set_label(data6m$bis11t, label = "BIS11 - Total")
data6m$bis11cog <- set_label(data6m$bis11cog, label = "BIS11 - Cognitive")
data6m$bis11mot <- set_label(data6m$bis11mot, label = "BIS11 - Motor")
data6m$bis11nonp <- set_label(data6m$bis11nonp, label = "BIS11 - Non-Planned")
data6m$hars_tot <- set_label(data6m$hars_tot, label = "HARS score")
data6m$hars_categories <- set_label(data6m$hars_categories, label = "HARS categories")
data6m$hdrs_tot <- set_label(data6m$hdrs_tot, label = "HDRS score")
data6m$hdrs_categories <- set_label(data6m$hdrs_categories, label = "HDRS categories")
data6m$pitt_score <- set_label(data6m$pitt_score, label = "PSQI total score")
data6m$pitt_gqs <- set_label(data6m$pitt_gqs, label = "Global quality of sleep")
data6m$whodast <- set_label(data6m$whodast, label = "WHODAS Total")

maint_phase_table <- mytable(stage_openlabel~ccq_n+vas+ut_coc+bis11t+bis11cog+bis11mot+bis11nonp+hars_tot+hars_categories+hdrs_tot+hdrs_categories+pitt_score+pitt_gqs, data = data6m)
mycsv(maint_phase_table, file = "maint_phase_table.csv")

inventory$group <- factor(inventory$group, labels = c("SHAM", "ACTIVE"))

urine_test6m <- data6m %>%
  left_join(inventory, by = c("rid", "group", "stage")) %>%
  dplyr::select(rid,stage, stage_openlabel,ut_coc = ut_coc.y,ut_amp, ut_bzd, ut_met, ut_mor, ut_thc) %>%
  na.omit()

table(urine_test6m)
urine_test6m_table <- mytable(stage_openlabel ~ ut_coc+ut_amp+ut_bzd+ut_met+ut_thc, data=urine_test6m)
mycsv(urine_test6m_table, file = "urine_tests_6m.csv")

# CCQN
lm6m_ccqn <- lmer(ccq_n ~ stage_openlabel + age + sex + (1|rid), data6m)
anova(lm6m_ccqn)
summary(lm6m_ccqn)
lm6m_ccqn_posthoc <- glht(lm6m_ccqn, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_ccqn_posthoc)  
confint(lm6m_ccqn_posthoc)

# Table for export results of multiple comparison (post hoc Tukey)
# Source: Modified from https://gist.github.com/cheuerde/3acc1879dc397a1adfb0 
# x is a ghlt object

table_glht <- function(x) {
  pq <- summary(x)$test
  mtests <- cbind(pq$coefficients, pq$sigma, pq$tstat, pq$pvalues)
  error <- attr(pq$pvalues, "error")
  pname <- switch(x$alternativ, less = paste("Pr(<", ifelse(x$df ==0, "z", "t"), ")", sep = ""), 
                  greater = paste("Pr(>", ifelse(x$df == 0, "z", "t"), ")", sep = ""), two.sided = paste("Pr(>|",ifelse(x$df == 0, "z", "t"), "|)", sep = ""))
  colnames(mtests) <- c("Estimate", "Std. Error", ifelse(x$df ==0, "z value", "t value"), pname)
  return(mtests)
  
}

lm6m_ccqn_posthoc_table <- table_glht(lm6m_ccqn_posthoc)
write.table(lm6m_ccqn_posthoc_table, file = "lm6m_ccqn_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)

write_csv(lm6m_ccqn_posthoc_table, "lm6m_ccqn_posthoc_table.csv")

tidy(lm6m_ccqn_posthoc)

# VAS

lm6m_vas <- lmer(vas ~ stage_openlabel + age + sex + (1|rid), data6m)
lm6m_vas2 <- lmer(vas ~ stage_openlabel + age + sex + (1 |stage_openlabel) + (1|rid), data6m)
anova(lm6m_vas)
summary(lm6m_vas)
lm6m_vas_posthoc <- glht(lm6m_vas, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_vas_posthoc)  
confint(lm6m_vas_posthoc)

lm6m_vas_posthoc_table <- table_glht(lm6m_vas_posthoc)
write.table(lm6m_vas_posthoc_table, file = "lm6m_vas_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)


# Impulsivity

lm6m_bis <- lmer(bis11t ~ stage_openlabel + age + sex + (1|rid), data6m)
anova(lm6m_bis)
summary(lm6m_bis)
lm6m_bis_posthoc <- glht(lm6m_bis, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_bis_posthoc)  
confint(lm6m_bis_posthoc)

lm6m_bis_posthoc_table <- table_glht(lm6m_bis_posthoc)
write.table(lm6m_bis_posthoc_table, file = "lm6m_bis_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)


# Urine Test stats

data6m_sub <- data6m %>%
  group_by(rid) %>%
  filter(any(stage_openlabel == "6M")) %>%
  ungroup()

data6m_urinecoc <- data6m_sub %>%
  filter(!is.na(stage_openlabel))

data6m_urinecoc <- data6m_urinecoc %>%
  dplyr::select(rid,stage_openlabel, ut_coc)

data6m_urinecocmytable(stage_openlabel ~ ., data = data6m_urinecoc)

long_table <- data6m_sub %>%
  dplyr::select(rid, stage_openlabel, ut_coc) %>%
  na.omit() %>%
  gather(key, value = timepoint, -rid, -ut_coc) %>%
  count(ut_coc, key, timepoint)

long_table$timepoint <- factor(long_table$timepoint, levels = c("BASELINE", "2W", "3M", "6M"))

short_table <- xtabs(n ~ timepoint + ut_coc, data= long_table)
ftable(short_table)

short_table_bar <- xtabs (n ~ ut_coc + timepoint, data= long_table)
ftable(short_table_bar)

barplot(short_table_bar, beside = TRUE,
        legend = TRUE,
        ylim = c(0,12),
        cex.names = 0.8,
        cex.axis = 0.8, 
        args.legend = list(x = "topright", 
                           cex = 0.8,
                           bty = "n"))

## Cochran's test 

install.packages("nonpar")
library(nonpar)

cochrans_table <- data6m_sub %>%
  dplyr::select(rid, stage_openlabel, ut_coc) %>%
  na.omit()

cochrans_table$stage_openlabel <- as.numeric(cochrans_table$stage_openlabel)
cochrans_table$ut_coc <- as.numeric(cochrans_table$ut_coc)
cochrans_table <- cochrans_table %>%
  mutate(ut_coc = ifelse(ut_coc == 2, 0, 1))

cochrans_table_2 <- xtabs(ut_coc ~ rid + stage_openlabel, 
      data=cochrans_table)

cochrans.q(cochrans_table_2)


# Anxiety
lm6m_hars <- lmer(hars_tot ~ stage_openlabel + age + sex + (1|rid), data6m)
anova(lm6m_hars)
summary(lm6m_hars)
lm6m_hars_posthoc <- glht(lm6m_hars, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_hars_posthoc)  
confint(lm6m_hars_posthoc)

lm6m_hars_posthoc_table <- table_glht(lm6m_hars_posthoc)
write.table(lm6m_hars_posthoc_table, file = "lm6m_hars_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)


# Depression

lm6m_hdrs <- lmer(hdrs_tot ~ stage_openlabel + age + sex + (1|rid), data6m)
anova(lm6m_hdrs)
summary(lm6m_hdrs)
lm6m_hdrs_posthoc <- glht(lm6m_hdrs, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_hdrs_posthoc)  
confint(lm6m_hdrs_posthoc)

lm6m_hdrs_posthoc_table <- table_glht(lm6m_hdrs_posthoc)
write.table(lm6m_hdrs_posthoc_table, file = "lm6m_hdrs_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)


# Sleep

lm6m_psqi <- lmer(pitt_score ~ stage_openlabel + age + sex + (1|rid), data6m)
anova(lm6m_psqi)
summary(lm6m_psqi)
lm6m_psqi_posthoc <- glht(lm6m_psqi, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_psqi_posthoc)  
confint(lm6m_psqi_posthoc)

lm6m_psqi_posthoc_table <- table_glht(lm6m_psqi_posthoc)
write.table(lm6m_psqi_posthoc_table, file = "lm6m_psqi_posthoc_table.txt", sep = ",", quote = FALSE, row.names = TRUE)



p.adjust(c(0.0002,7.656e-06), method = "fdr", n = 2)
p.adjust(c(0.0003972,0.006144,0.0008927,0.29177), method = "fdr", n = 4)


# Export LMER Tables

library(jtools)
install.packages("ggstance")
library(ggstance)
install.packages("huxtable")
library(huxtable)
library(broom.mixed)

summ(lm6m_ccqn)
plot_summs(lm6m_ccqn)
export_summs(lm6m_ccqn)

broom.mixed::tidy(lm6m_ccqn)
broom.mixed::augment(lm6m_ccqn)
broom.mixed::glance(lm6m_ccqn)


## Plots

### Primary outcome measures

library(ggpubr)

data6m_nona <- data6m[!is.na(data6m$stage_openlabel),]

is.na(data6m_nona)

plot1 <- ggplot(data6m_nona, aes(stage_openlabel, ccq_n))+
  geom_boxplot() + ylab("Craving CCQ-Now")+ xlab("") 

plot2 <- ggplot(data6m_nona, aes(stage_openlabel, vas)) +
  geom_boxplot() + ylab("Craving VAS") + xlab("Time point")

ggarrange(plot1 + rremove("x.text"), plot2, ncol = 1, nrow = 2)

### Secondary outcome measures

plot3 <- ggplot(data6m_nona, aes(stage_openlabel, bis11t))+
  geom_boxplot() + ylab("Impulsivity")+ xlab("")

plot4 <- ggplot(data6m_nona, aes(stage_openlabel, hars_tot))+
  geom_boxplot() + ylab("Anxiety")+ xlab("") 

plot5 <- ggplot(data6m_nona, aes(stage_openlabel, hdrs_tot))+
  geom_boxplot() + ylab("Depression")+ xlab("") 

plot6 <- ggplot(data6m_nona, aes(stage_openlabel, pitt_score))+
  geom_boxplot() + ylab("Sleep")+ xlab("") 

ggarrange(plot3 + rremove("x.text"), plot4 + rremove("x.text"), plot5, plot6)


ggplot(data6m, aes(stage, bis11t)) +
  geom_boxplot() + ylab("Craving VAS") + xlab("Time point")


## Raincloud plots

sumrepdat <- summarySE(data6m_nona, measurevar = "vas", groupvars="stage_openlabel")

p1 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=vas,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = vas, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = vas),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Craving VAS')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = vas_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_nona, measurevar = "ccq_n", groupvars="stage_openlabel")

p2 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=ccq_n,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = ccq_n, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = ccq_n),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Craving CCQ-Now')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = ccq_n_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_nona, measurevar = "bis11t", groupvars="stage_openlabel")

p3 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=bis11t,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = bis11t, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = bis11t),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Impulsivity')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = bis11t_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_nona, measurevar = "hars_tot", groupvars="stage_openlabel")

p4 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=hars_tot,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = hars_tot, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = hars_tot),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Anxiety')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = hars_tot_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_nona, measurevar = "hdrs_tot", groupvars="stage_openlabel")

p5 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=hdrs_tot,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = hdrs_tot, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = hdrs_tot),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Depression')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = hdrs_tot_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_nona, measurevar = "pitt_score", groupvars="stage_openlabel")

p6 <- ggplot(data6m_nona,aes(x=stage_openlabel,y=pitt_score,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = pitt_score, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = pitt_score),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Sleep')+ xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = pitt_score_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

ggarrange(p1,p2,p3,
          p4,p5,p6, labels = c("a.","b.","c.","d.","e.","f."), common.legend = TRUE, legend = "bottom",
          font.label = list(size = 20))

### Get FD

fd$rid <- set_label(fd$rid, label = "ID")
fd$stage <- set_label(fd$stage, label = "Timepoint")
fd$mean_fd <- set_label(fd$mean_fd, label = "Mean FD")
data6m <- left_join(data6m, fd, by = c("rid","stage"))

forFSL <- data6m %>%
  filter(stage_openlabel == "BASELINE" | stage_openlabel == "2W") %>%
  dplyr::select(rid,age,stage_openlabel, mean_fd) %>%
  arrange(stage_openlabel)

write_csv(forFSL, "forFSL.csv")

## Connectivity

data6m_conn <- left_join(data6m, conn_dlpfcvm, by = c("rid", "stage"))
data6m_conn <- data6m_conn %>%
  left_join(conn_vmpfc, by = c("rid", "stage"))

data6m_conn %>%
  na.omit() %>%
  ggplot(aes(x = stage_openlabel, y = conn_dlvm)) +
  geom_boxplot() + ylab("lDLPFC-VMPFC Connectivity") + xlab("")

data6m_conn %>%
  na.omit() %>%
  ggplot(aes(x = stage_openlabel, y = vmpfc_cluster)) +
  geom_boxplot() + ylab("vmPFC-Angular gyrus Connectivity") + xlab("")

lm6m_conn <- lmer(conn_dlvm ~ stage_openlabel + age + (1|rid), data6m_conn)
summary(lm6m_conn)
anova(lm6m_conn)
lm6m_conn_posthoc <- glht(lm6m_conn, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_conn_posthoc)  
confint(lm6m_conn_posthoc)

lm6m_connvm <- lmer(vmpfc_cluster ~ stage_openlabel + age + (1|rid), data6m_conn)
summary(lm6m_connvm)
anova(lm6m_connvm)
lm6m_connvm_posthoc <- glht(lm6m_connvm, linfct = mcp (stage_openlabel = "Tukey"))
summary(lm6m_connvm_posthoc)  
confint(lm6m_connvm_posthoc)

## Raincloud plots

data6m_conn <- data6m_conn %>%
  na.omit()

sumrepdat <- summarySE(data6m_conn, measurevar = "conn_dlvm", groupvars="stage_openlabel")

p1 <- ggplot(data6m_conn,aes(x=stage_openlabel,y=conn_dlvm,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = conn_dlvm, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = conn_dlvm),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Left DLPFC - vmPFC Connectivity')+
  xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = conn_dlvm_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(data6m_conn, measurevar = "vmpfc_cluster", groupvars="stage_openlabel")

p2 <- ggplot(data6m_conn,aes(x=stage_openlabel,y=vmpfc_cluster,fill=stage_openlabel,color=stage_openlabel)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = stage_openlabel, y = vmpfc_cluster, fill = stage_openlabel),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(stage_openlabel)-.35, y = vmpfc_cluster),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('vmPFC - Right AnG Connectivity')+
  xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = stage_openlabel, y = vmpfc_cluster_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

ggarrange(p1,p2, labels = c("a.","b."), ncol = 1, vjust = 1, common.legend = TRUE, legend = "top",
          font.label = list(size = 20))

### Cross-Correlation

conn <- data6m_conn %>%
  dplyr::select(rid,stage_openlabel, conn_dlvm) %>%
  na.omit()

craving <- data6m_conn %>%
  dplyr::select(rid,stage_openlabel, vas) %>%
  na.omit()

ccf(conn,craving)

### Responders

delta_vas6m <- data6m %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  filter(stage_openlabel == "BASELINE" | stage_openlabel == "2W") %>%
  arrange(stage_openlabel) %>%
  mutate(lag = lag(vas)) %>%
  mutate(vas.diff = vas - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage_openlabel, vas.diff) %>%
  filter(stage_openlabel == "2W") %>%
  dplyr::select(rid, vas.diff)

sd(delta_vas6m$vas.diff)

delta_vas6m <- delta_vas6m %>%
  mutate(
    response = ifelse(vas.diff <= -2.37, "RP",
                      ifelse(vas.diff > -2.37, "NR",NA))) %>%
  dplyr::select(rid,response)

data6m_conn <- data6m_conn %>%
  left_join(delta_vas6m, by = "rid")

data6m_conn %>%
  na.omit() %>%
  ggplot(aes(x = stage_openlabel, y = conn_dlvm, color = stage_openlabel)) +
  geom_boxplot() +
  geom_jitter(aes(color = response))

delta_bis6m <- data6m %>%
  mutate(row.order = row_number()) %>% # row numbers added to preserve original row order
  group_by(rid) %>%
  filter(stage_openlabel == "BASELINE" | stage_openlabel == "2W") %>%
  arrange(stage_openlabel) %>%
  mutate(lag = lag(bis11t)) %>%
  .$lag %>%
  mutate(bis11t.diff = bis11t - lag) %>%
  ungroup() %>%
  arrange(row.order) %>%
  dplyr::select(rid, group, stage_openlabel, bis11t.diff) %>%
  filter(stage_openlabel == "2W") %>%
  dplyr::select(rid, biss11t.diff)

sd(delta_bis6m$bis11t.diff)

delta_bis6m <- delta_bis6m %>%
  mutate(
    response = ifelse(biss11t.diff <= -2.37, "RP",
                      ifelse(biss11t.diff > -2.37, "NR",NA))) %>%
  dplyr::select(rid,response)

data6m_conn <- data6m_conn %>%
  left_join(delta_vas6m, by = "rid")

# Cognitive

ggplot(data6m_nona, aes(stage_openlabel, inhib_index))+
  geom_boxplot() + ylab("Craving CCQ-Now")+ xlab("")

ggplot(data6m_nona, aes(stage_openlabel, inhib_trven))+
  geom_boxplot() + ylab("Craving CCQ-Now")+ xlab("")

ggplot(data6m_nona, aes(stage_openlabel, inhib_trdes))+
  geom_boxplot() + ylab("Craving CCQ-Now")+ xlab("")

# Others

others_table_6m <- mytable(stage_openlabel ~ whodast+gsi+psdi+pst, data = data6m_nona)
mycsv(others_table_6m, file = "others_table_6m.csv")

plot1 <- ggplot(data6m_nona, aes(stage_openlabel, whodast))+
  geom_boxplot() + ylab("WHODAS Total")+ xlab("")
plot2 <- ggplot(data6m_nona, aes(stage_openlabel, gsi))+
  geom_boxplot() + ylab("Global Severity Index")+ xlab("")
plot3 <- ggplot(data6m_nona, aes(stage_openlabel, psdi))+
  geom_boxplot() + ylab("Positive Symptom Distress Index")+ xlab("")
plot4 <- ggplot(data6m_nona, aes(stage_openlabel, pst))+
  geom_boxplot() + ylab("Positive Symptom Total")+ xlab("")

ggarrange(plot1, plot2, plot3, plot4, legend = "top" )

# Calendar

calendar <- calendar %>%
  left_join(included, by = c("rid", "group")) %>%
  dplyr::select(rid, group, date, stage = stage.x, month, frequency_last_month, grams_last_month, included) %>%
  filter(included == TRUE)

calendar$group <- factor(calendar$group, levels = c("SHAM", "REAL"), labels = c("SHAM", "ACTIVE"))

shapiro.test(calendar$frequency_last_month)
shapiro.test(calendar$grams_last_month)

plot1 <- ggplot(calendar, aes(month, frequency_last_month, fill = group))+
  geom_boxplot() + ylab("Frequency")+ xlab("") + scale_fill_discrete(name = "Group")

plot2 <- ggplot(calendar, aes(month, grams_last_month, fill = group))+
  geom_boxplot() + ylab("Grams")+ xlab("") + scale_fill_discrete(name = "Group")

ggarrange(plot1, plot2, common.legend = TRUE, legend = "top", nrow = 2, ncol = 1)

data6m %>%
  filter(stage_openlabel == "6M") %>%
  .$rid

calendar_sub <- calendar %>%
  filter(rid == 2 | rid == 3 | rid == 4 | rid == 7 | rid == 8 | rid == 15 | rid == 20 | rid == 22 | rid == 23 | rid == 24 | rid ==25 | rid == 27 | rid == 32 | rid == 36 | rid == 41)


## Raincloud plots

sumrepdat <- summarySE(calendar_sub, measurevar = "frequency_last_month", groupvars="month")

p1 <- ggplot(calendar_sub,aes(x=month,y=frequency_last_month,fill=month,color=month)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = month, y = frequency_last_month, fill = month),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(month)-.35, y = frequency_last_month),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Frequency per month')+
  xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = month, y = frequency_last_month_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

sumrepdat <- summarySE(calendar_sub, measurevar = "grams_last_month", groupvars="month")

p2 <- ggplot(calendar_sub,aes(x=month,y=grams_last_month,fill=month,color=month)) +
  #geom_flat_violin(position = position_nudge(x = .20, y = 0), alpha = .4,adjust =4) +
  geom_boxplot(aes(x = month, y = grams_last_month, fill = month),
               outlier.shape = NA, alpha = .50, width = .25, color = "black") +
  geom_point(aes(x = as.numeric(month)-.35, y = grams_last_month),
             position=position_jitter(width = .15),size = 1, alpha = 0.4)+ylab('Grams per month')+
  xlab("Time point")+
  geom_point(data=sumrepdat, aes(x = month, y = grams_last_month_mean), shape = 17, size = 3) +
  scale_fill_brewer(palette = "Dark2")+
  scale_colour_brewer(palette = "Dark2")+
  guides(fill = FALSE, col = FALSE)

ggarrange(p1,p2, labels = c("a.","b."), ncol = 1, vjust = 1, common.legend = TRUE, legend = "top",
          font.label = list(size = 20))


plot1 <- ggplot(calendar_sub, aes(month, frequency_last_month))+
  geom_boxplot() + ylab("Frequency")+ xlab("") + scale_fill_discrete(name = "Group")

plot2 <- ggplot(calendar_sub, aes(month, grams_last_month))+
  geom_boxplot() + ylab("Grams")+ xlab("") + scale_fill_discrete(name = "Group")

ggarrange(plot1, plot2, common.legend = TRUE, legend = "top", nrow = 2, ncol = 1)

cal.fried <- calendar_sub %>%
  friedman_test(frequency_last_month ~ month | rid)

cal.fried.es <- calendar_sub %>%
  friedman_effsize(frequency_last_month ~ month | rid)

cal.pwc <- calendar_sub %>%
  wilcox_test(frequency_last_month ~ month, paired = TRUE, p.adjust.method = "fdr")

write_csv(cal.fried, "cal.fried.csv")
write_csv(cal.fried.es, "cal.fried.es.csv")
write_csv(cal.pwc, "cal.pwc.csv")

cal2.fried <- calendar_sub %>%
  friedman_test(grams_last_month ~ month | rid)

cal2.fried.es <- calendar_sub %>%
  friedman_effsize(grams_last_month ~ month | rid)

cal2.pwc <- calendar_sub %>%
  wilcox_test(grams_last_month ~ month, paired = TRUE, p.adjust.method = "fdr")

write_csv(cal2.fried, "cal2.fried.csv")
write_csv(cal2.fried.es, "cal2.fried.es.csv")
write_csv(cal2.pwc, "cal2.pwc.csv")

#################################################################################################################

# Crear base solo con sujetos con los 3 puntos.
data6month_sub <- data6month %>%
  group_by(rid) %>%
  filter(any(stage_openlabel == "3M")) %>%
  ungroup()

data6month_sub <- merge(data6month_sub, bis11, by = c("rid", "group", "stage"))
data6month_sub <- data6month_sub %>%
  select(rid, group, stage, stage_openlabel, sex, age, educ, onset_consum, years_consum, craving_level,vas, conn_dlvm, bis11_tot = tot_score, bis11_cog = cog, bis11_mot = mot, bis11_nonp = nonp)
data6month_sub <- merge(data6month_sub, ccqn, by = c("rid", "group", "stage"))
data6month_sub <- arrange(data6month_sub, rid)
#data6month_sub$craving_level <- factor(data6month_sub$craving_level, levels = c("High", "Low"))
data6month_sub$vasZ <- (data6month_sub$vas - mean(data6month_sub$vas))/(sd(data6month_sub$vas))
data6month_sub$bis_totZ <- (data6month_sub$bis11_tot - mean(data6month_sub$bis11_tot))/(sd(data6month_sub$bis11_tot))

data6month_sub$vas <- set_label(data6month_sub$vas, label = "Craving VAS")

inventory <- inventory %>%
  dplyr::select(rid, group, stage, ut_amp, ut_bzd, ut_coc, ut_met, ut_mor, ut_amp, ut_thc, auto1, auto3, auto4, auto5)

data6month_sub <- merge(data6month_sub, inventory, by = c("rid", "group", "stage"))
data6month_sub <- data6month_sub %>%
  filter(!rid == "54") %>%
  arrange(rid)

# TMS Adverse

tms_adverse_table <- mytable_sub(group ~ head+neck+scalp+cognitive+concentration+hearing+irritation+seizures+mood, data = tms_adverse, max.ylev = 6)
mycsv(tms_adverse_table, file = "tms_adverse_table.csv")
