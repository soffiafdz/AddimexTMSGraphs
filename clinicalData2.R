
theme_set(theme_linedraw(base_size = 13))
pd <- position_dodge(0.25)          
# Correlation BIS11 v Craving -----------------------------------------------------------------

corrClin <- melt(clin1, id.vars = c(1, 3, 10), measure.vars = 4:6, 
                             variable.name = "Craving_measure", value.name = "Craving_value")


corrClin[Stage == "t0", cor.test(Craving_value, B11_Tot), by = Craving_measure]
corrClin[Stage == "t1", cor.test(Craving_value, B11_Tot), by = Craving_measure]

ggplot(mutate(corrClin, Stage = factor(Stage, labels = c("Pre-", "Post"))),
              aes(B11_Tot, Craving_value)) +
    geom_point() + 
    geom_smooth(method = lm, alpha = .3, col = "black", linetype = 5) + 
    labs(y = "Craving score", x = "Impulsivity score", 
         title = "Clinical relationship: Craving v Impulsivity") +
    facet_grid(Craving_measure ~ Stage, scales = "free")

# t-Test Urine Test group-separated -----------------------------------------------------------

utClin <- melt(clin1, id.vars = c(1,3,12), measure.vars = c(4:6, 10),
                          variable.name = "Scale", value.name = "Score")

utClin[Stage == "t0", t.test(Score ~ UT_coc), by = Scale]
utClin[Stage == "t0", cohen.d(Score ~ UT_coc), by = Scale]

ggplot(utClin[Stage == "t0"], aes(UT_coc, Score, fill = UT_coc)) +
    geom_boxplot() +
    scale_fill_hue(name="UT results",
                   breaks=c("positive", "negative"),
                   labels=c("Pos", "Neg"),
                   l=25) +
    labs(x = NULL, title = "Clinical scores by cocaine urine testing") +
    scale_x_discrete(labels = c("Pos", "Neg")) +
    facet_wrap(Scale ~ ., scales = "free")
# Median-separated groups ---------------------------------------------------------------------

grMedClin <- melt(clin1, id.vars = 1:3, measure.vars = c(4:6, 10),
                             variable.name = "Scale", value.name = "Score")

mediansClin <- grMedClin[Group == "tx" & Stage == "t0", 
                                 .(Median = median(Score)), 
                                 by = Scale]

grMedClin[, Stage_Scale := ifelse(Stage == "t0", 
                                      paste0("Pre_", Scale),
                                      paste0("Post_", Scale))]

grMedClin %<>% dcast.data.table(Study.ID + Group ~ Stage_Scale, value.var = "Score") 

grMedClin[, `:=` (GroupVAS = as.factor(ifelse(Group == "sham", "sham", 
                                              ifelse(Pre_VAS < mediansClin[[1,2]], "real_<", 
                                                     "real_>"))),
                  GroupCCQG = as.factor(ifelse(Group == "sham", "sham", 
                                               ifelse(Pre_CCQ_G < mediansClin[[2,2]], "real_<", 
                                                      "real_>"))),
                  GroupCCQN = as.factor(ifelse(Group == "sham", "sham", 
                                               ifelse(Pre_CCQ_N < mediansClin[[3,2]], "real_<", 
                                                      "real_>"))),
                  GroupBIS = as.factor(ifelse(Group == "sham", "sham", 
                                              ifelse(Pre_B11_Tot < mediansClin[[4,2]], "real_<", 
                                                     "real_>"))),
                  DeltaVAS = Post_VAS - Pre_VAS,
                  DeltaCCQG = Post_CCQ_G - Pre_CCQ_G,
                  DeltaCCQN = Post_CCQ_N - Pre_CCQ_N,
                  DeltaBIS = Post_B11_Tot - Pre_B11_Tot)]

grMedClinLong <- melt(grMedClin, 
                      measure.vars = 3:10, 
                      variable.name = "Scale", 
                      value.name = "Score")

grMedClinLong[, c("Stage", "Scale") := tstrsplit(Scale, "[te]_")]
grMedClinLong[, `:=` (Group = NULL,
                      Scale = factor(Scale),
                      Stage = factor(Stage, levels = c("Pr", "Pos"), 
                                     labels = c("t0", "t1")),
                      Delta = Score - rep(grMedClinLong[Stage == "Pr", Score],2))]


# Contrasts -----------------------------------------------------------------------------------


contr1 <- c(1,1,-2)
contr2 <- c(1,-1,0)

contrasts(grMedClin$GroupVAS) <- cbind(contr1, contr2)
contrasts(grMedClin$GroupCCQG) <- cbind(contr1, contr2)
contrasts(grMedClin$GroupCCQN) <- cbind(contr1, contr2)
contrasts(grMedClin$GroupBIS) <- cbind(contr1, contr2)


# ANOVA deltas --------------------------------------------------------------------------------

grMedClinLong[Scale == "VAS", summary.lm(aov(Delta ~ GroupVAS))]
grMedClinLong[Scale == "CCQ_G", summary.lm(aov(Delta ~ GroupCCQG))]
grMedClinLong[Scale == "CCQ_N", summary.lm(aov(Delta ~ GroupCCQN))]
grMedClinLong[Scale == "B11_Tot", summary.lm(aov(Delta ~ GroupBIS))]



# Interaction group v stage -------------------------------------------------------------------

aov_car(Score ~ GroupVAS * Stage + Error(Study.ID/Stage), data = grMedClinLong[Scale == "VAS"])
aov_car(Score ~ GroupCCQG * Stage + Error(Study.ID/Stage), data = grMedClinLong[Scale == "CCQ_G"])
aov_car(Score ~ GroupCCQN * Stage + Error(Study.ID/Stage), data = grMedClinLong[Scale == "CCQ_N"])
aov_car(Score ~ GroupBIS * Stage + Error(Study.ID/Stage), data = grMedClinLong[Scale == "B11_Tot"])


# t Tests deltas ------------------------------------------------------------------------------

grMedClinLong[Scale == "VAS" & GroupVAS != "sham", t.test(Delta ~ GroupVAS)]
grMedClinLong[Scale == "VAS" & GroupVAS != "sham", cohen.d(Delta ~ GroupVAS)]
grMedClinLong[Scale == "VAS" & GroupVAS != "real_>", t.test(Delta ~ GroupVAS)]
grMedClinLong[Scale == "VAS" & GroupVAS != "real_>", cohen.d(Delta ~ GroupVAS)]
grMedClinLong[Scale == "VAS" & GroupVAS != "real_<", t.test(Delta ~ GroupVAS)]
grMedClinLong[Scale == "VAS" & GroupVAS != "real_<", cohen.d(Delta ~ GroupVAS)]

grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "sham", t.test(Delta ~ GroupCCQG)]
grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "sham", cohen.d(Delta ~ GroupCCQG)]
grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "real_>", t.test(Delta ~ GroupCCQG)]
grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "real_>", cohen.d(Delta ~ GroupCCQG)]
grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "real_<", t.test(Delta ~ GroupCCQG)]
grMedClinLong[Scale == "CCQ_G" & GroupCCQG != "real_<", cohen.d(Delta ~ GroupCCQG)]

grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "sham", t.test(Delta ~ GroupCCQN)]
grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "sham", cohen.d(Delta ~ GroupCCQN)]
grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "real_>", t.test(Delta ~ GroupCCQN)]
grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "real_>", cohen.d(Delta ~ GroupCCQN)]
grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "real_<", t.test(Delta ~ GroupCCQN)]
grMedClinLong[Scale == "CCQ_N" & GroupCCQN != "real_<", cohen.d(Delta ~ GroupCCQN)]

grMedClinLong[Scale == "B11_Tot" & GroupBIS != "sham", t.test(Delta ~ GroupBIS)]
grMedClinLong[Scale == "B11_Tot" & GroupBIS != "sham", cohen.d(Delta ~ GroupBIS)]
grMedClinLong[Scale == "B11_Tot" & GroupBIS != "real_>", t.test(Delta ~ GroupBIS)]
grMedClinLong[Scale == "B11_Tot" & GroupBIS != "real_>", cohen.d(Delta ~ GroupBIS)]
grMedClinLong[Scale == "B11_Tot" & GroupBIS != "real_<", t.test(Delta ~ GroupBIS)]
grMedClinLong[Scale == "B11_Tot" & GroupBIS != "real_<", cohen.d(Delta ~ GroupBIS)]


# Multivariate regression ---------------------------------------------------------------------

summary(lm(Post_B11_Tot ~ Group + Pre_B11_Tot + Pre_CCQ_N + Pre_CCQ_G + Pre_VAS, data = grMedClin))
summary(lm(Post_VAS ~ Group + Pre_B11_Tot + Pre_VAS, data = grMedClin))
summary(lm(Post_CCQ_G ~ Group + Pre_B11_Tot + Pre_CCQ_G, data = grMedClin))
summary(lm(Post_CCQ_N ~ Group + Pre_B11_Tot + Pre_CCQ_N, data = grMedClin))



# Hotelling T2 --------------------------------------------------------------------------------


print(hotelling.test(DeltaVAS + DeltaCCQN + DeltaBIS ~ Group, data = grMedClin))
print(hotelling.test(DeltaVAS + DeltaCCQN + DeltaBIS ~ GroupVAS, data = grMedClin))
print(hotelling.test(DeltaVAS + DeltaCCQN + DeltaBIS ~ GroupBIS, data = grMedClin))
print(hotelling.test(DeltaVAS + DeltaCCQN + DeltaBIS ~ GroupCCQN, data = grMedClin))


# Plots ---------------------------------------------------------------------------------------


ggplot(grMedClin, aes(GroupVAS, Post_VAS, fill = GroupVAS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    scale_x_discrete(labels = c("Real -", "Real +", "Sham")) +
    labs(x = "Group", y = "Score", title = "Craving (VAS) after 2 weeks of rTMS")

grMedClinLong[Scale == "VAS"] %>% 
    summarySE(measurevar = "Delta", groupvars = c("GroupVAS", "Stage")) %>%
    ggplot(aes(Stage, Delta, group = GroupVAS)) +
    geom_errorbar(aes(ymin = Delta - se, ymax = Delta + se, col = GroupVAS), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupVAS)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("real_<", "real_>", "sham"),
                     labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                     l=15) +
    labs(y = "Scores (Delta)", title = "Craving (VAS) changes after 2 weeks of rTMS",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-"))

grMedClinLong[Scale == "VAS" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupVAS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Craving (VAS) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")


ggplot(grMedClin, aes(GroupCCQG, Post_CCQ_G, fill = GroupCCQG)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    scale_x_discrete(labels = c("Real -", "Real +", "Sham")) +
    labs(x = "Group", y = "Score", title = "Craving (CCQ-G) after 2 weeks of rTMS")

grMedClinLong[Scale == "CCQ_G"] %>% 
    summarySE(measurevar = "Delta", groupvars = c("GroupCCQG", "Stage")) %>%
    ggplot(aes(Stage, Delta, group = GroupCCQG)) +
    geom_errorbar(aes(ymin = Delta - se, ymax = Delta + se, col = GroupCCQG), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQG)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("real_<", "real_>", "sham"),
                     labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                     l=15) +
    labs(y = "Scores (Delta)", title = "Craving (CCQ-G) changes after 2 weeks of rTMS",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-"))

grMedClinLong[Scale == "CCQ_G" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupCCQG)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Craving (CCQ-G) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")


ggplot(grMedClin, aes(GroupCCQN, Post_CCQ_N, fill = GroupCCQN)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    scale_x_discrete(labels = c("Real -", "Real +", "Sham")) +
    labs(x = "Group", y = "Score", title = "Craving (CCQ-N) after 2 weeks of rTMS")

grMedClinLong[Scale == "CCQ_N"] %>% 
    summarySE(measurevar = "Delta", groupvars = c("GroupCCQN", "Stage")) %>%
    ggplot(aes(Stage, Delta, group = GroupCCQN)) +
    geom_errorbar(aes(ymin = Delta - se, ymax = Delta + se, col = GroupCCQN), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQN)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("real_<", "real_>", "sham"),
                     labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                     l=15) +
    labs(y = "Scores (Delta)", title = "Craving (CCQ-N) changes after 2 weeks of rTMS",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-"))

grMedClinLong[Scale == "CCQ_N" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupCCQN)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Craving (CCQ-N) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")


ggplot(grMedClin, aes(GroupBIS, Post_B11_Tot, fill = GroupBIS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    scale_x_discrete(labels = c("Real -", "Real +", "Sham")) +
    labs(x = "Group", y = "Score", title = "Impulsivity (BIS-11) after 2 weeks of rTMS")

grMedClinLong[Scale == "B11_Tot"] %>% 
    summarySE(measurevar = "Delta", groupvars = c("GroupBIS", "Stage")) %>%
    ggplot(aes(Stage, Delta, group = GroupBIS)) +
    geom_errorbar(aes(ymin = Delta - se, ymax = Delta + se, col = GroupBIS), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupBIS)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("real_<", "real_>", "sham"),
                     labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                     l=15) +
    labs(y = "Scores (Delta)", title = "Impulsivity (BIS-11) changes after 2 weeks of rTMS",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-"))

grMedClinLong[Scale == "B11_Tot" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupBIS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Impulsivity (BIS-11) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")grMedClinLong[Scale == "B11_Tot" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupBIS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Impulsivity (BIS-11) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")grMedClinLong[Scale == "B11_Tot" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupBIS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Impulsivity (BIS-11) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")grMedClinLong[Scale == "B11_Tot" & Stage == "t1"] %>% 
    ggplot(aes(Stage, Delta, fill = GroupBIS)) +
    geom_boxplot() +
    scale_fill_hue(name="Group",
                   breaks=c("real_<", "real_>", "sham"),
                   labels=c("Real rTMS (low Score)", "Real rTMS (High score)", "Sham rTMS"),
                   l=25) +
    labs(y = "Scores (Delta)", title = "Impulsivity (BIS-11) changes after 2 weeks of rTMS",
         x = NULL) +
    scale_x_discrete(labels = "2 weeks real rTMS")
