# Functions ---------------------------------------------------------------

prep_plot_grw <- function(...){
    x <- bind_rows(...)
    x %>% 
        select(1:3,
               Network,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength) %>% 
        gather(key = "Metric", value = "Val", CP:S) %>% 
        summarySEwithin(measurevar = "Val", betweenvars = "Group", 
                        withinvars = c("Stage", "Network", "Metric"), 
                        idvar = "Study.ID", na.rm = T)
}

prep_plot_gr <- function(...){
    x <- bind_rows(...)
    x %>% 
        select(1:2,
               Network,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength) %>% 
        gather(key = "Metric", value = "Val", CP:S) %>% 
        summarySE(measurevar = "Val", 
                  groupvars = c("Stage", "Network", "Metric"),
                  na.rm = T)
    
}

prep_plot_cl <- function(x, ...){
    gather(x, key = "Scale", value = "Score", ...) %>% 
        select(1:3, Scale, Score) %>% 
        summarySEwithin(measurevar = "Score", betweenvars = "Group",
                        withinvars = c("Stage", "Scale"), idvar = "Study.ID", na.rm = T)
}

prep_plot_cl2 <- function(x, ...){
    gather(x, key = "Scale", value = "Score", ...) %>% 
        select(1:3, Scale, Score) %>% 
        summarySEwithin(measurevar = "Score", 
                        withinvars = c("Stage", "Scale"), idvar = "Study.ID", na.rm = T)
}

theme_set(theme_linedraw(base_size = 15))
pd <- position_dodge(0.25)


# Clinical ------------------------------------------------------------------------------------

#### Close-label stage #### 

prep_plot_cl(clin1, VAS) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd, alpha = .7) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham rTMS", "Real rTMS"),
                     l=20) +
    labs(y = NULL, title = "Interaction (Group v Stage): Craving's Analogue Visual Scale (N = 29)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-"))

prep_plot_cl(clin1, CCQ_G:CCQ_N) %>% 
    mutate(Scale = factor(Scale, labels = c("General", "Now"))) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham rTMS", "Real rTMS"),
                     l=20) +
    labs(y = NULL, title = "Interaction (Group v Stage): Cocaine's Craving Questionnaire (N = 29)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")


prep_plot_cl(clin1, B11_C:B11_Tot) %>% 
    mutate(Scale = factor(Scale, labels = c("Cognitive", "Motor", "Non-planning", "Total score"))) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham rTMS", "Real rTMS"),
                     l=20) +
    labs(y = NULL, title = "Interaction (Group v Stage): Barratt's Impulsivity Scale 11 (N = 29)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")

prep_plot_cl(clin1, Coc_last30:Grams) %>% 
    mutate(Scale = factor(Scale, labels = c("Frequency", "Grams"))) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham rTMS", "Real rTMS"),
                     l=20) +
    labs(y = NULL, title = "Interaction (Group v Stage): Consumption (N = 29)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")


UTgraph <- clin1 %>% 
    gather("Scale", "Score", UT_bzd:UT_thc, factor_key = T) %>% 
    mutate(Scale = factor(Scale, labels = c("Benzodiacepines", "Cocaine", "THC")),
           Group = factor(Group, labels = c("Sham rTMS", "Real rTMS"))) %>% 
    group_by(Group, Stage, Scale, Score) %>% 
    dplyr::summarise(Count = n()) %>% 
    filter(Stage == "t1") %>% 
    ggplot(aes(Group, Count, fill = Score)) +
    scale_fill_hue(name="Score",    # Legend label, use darker colors
                     breaks=c("negative", "positive"),
                     labels=c("Negative", "Positive"),
                     l=30) +
    labs(y = "Count", title = "Urine Testing after 2 weeks of rTMS (N = 29)",
         x = NULL) +
    facet_wrap(Scale ~ .)

UTgraph + geom_bar(stat = "identity", position = position_dodge())
UTgraph + geom_bar(stat = "identity", position = "fill") + 
    scale_y_continuous(name = "Percent", labels = scales::percent)

ConsGraph <- clin1 %>% 
    mutate(Group = factor(Group, labels = c("Sham rTMS", "Real rTMS"))) %>% 
    group_by(Group, Stage, Consume) %>% 
    dplyr::summarise(Count = n()) %>% 
    filter(Stage == "t1") %>% 
    ggplot(aes(Group, Count, fill = Consume)) +
    scale_fill_hue(name="Consumption",    # Legend label, use darker colors
                   breaks=c("Yes", "No"),
                   labels=c("Yes", "No"),
                   l=30) +
    labs(y = "Count", title = "Consumption after 2 weeks of rTMS (N = 29)",
         x = NULL) 

ConsGraph + geom_bar(stat = "identity", position = position_dodge()) + 
    scale_y_continuous(breaks = seq(2, 8, 2))

ConsGraph + geom_bar(stat = "identity", position = "fill") +
    scale_y_continuous(name = "Percent", labels = scales::percent)

ImprovGraph <- clin1 %>% 
    mutate(Group = factor(Group, labels = c("Sham rTMS", "Real rTMS"))) %>% 
    group_by(Group, Stage, Improvement) %>% 
    dplyr::summarise(Count = n()) %>% 
    filter(Stage == "t1") %>% 
    ggplot(aes(Group, Count, fill = Improvement)) +
    scale_fill_hue(name="Improvement",    # Legend label, use darker colors
                   # breaks=c("Yes", "No"),
                   # labels=c("Yes", "No"),
                   l=20) +
    labs(y = "Count", title = "Subjective improvement after 2 weeks (N = 29)",
         x = NULL) 

ImprovGraph + geom_bar(stat = "identity", position = position_dodge()) + 
    scale_y_continuous(breaks = seq(2, 12, 2))
ImprovGraph + geom_bar(stat = "identity", position = "fill") +
    scale_y_continuous(name = "Percent", labels = scales::percent)

#### Open-label stage #### 

clin2 %>% 
    ggplot(aes(Stage, VAS, fill = Stage)) +
    geom_boxplot() +
    scale_fill_hue(name="Stage",    # Legend label, use darker colors
                     breaks=c("t0", "t1"),
                     labels=c("Pre-", "Post-"),
                     l=25) +
    labs(y = NULL, title = "2 weeks real rTMS: Craving's Analogue Visual Scale (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    scale_y_continuous(breaks = seq(0, 10, 2))

clin2 %>% 
    gather(CCQ_G:CCQ_N, key = "Scale", value = "Score") %>% 
    mutate(Scale = factor(Scale, labels = c("General", "Now"))) %>% 
    ggplot(aes(Stage, Score, fill = Stage)) +
    geom_boxplot() +
    scale_fill_hue(name="Stage",    # Legend label, use darker colors
                   breaks=c("t0", "t1"),
                   labels=c("Pre-", "Post-"),
                   l=25) +
    labs(y = NULL, title = "2 weeks real rTMS: Cocaine Craving's Questionnaire (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")
    
clin2 %>% 
    gather( B11_C:B11_Tot, key = "Scale", value = "Score") %>% 
    mutate(Scale = factor(Scale, labels = c("Cognitive", "Motor", "Non-planning", "Total score"))) %>% 
    ggplot(aes(Stage, Score, fill = Stage)) +
    geom_boxplot() +
    scale_fill_hue(name="Stage",    # Legend label, use darker colors
                   breaks=c("t0", "t1"),
                   labels=c("Pre-", "Post-"),
                   l=25) +
    labs(y = NULL, title = "2 weeks real rTMS: Barratt's Impulsivity Scale (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")


clin2 %>% 
    gather(Coc_last30:Grams, key = "Scale", value = "Score") %>% 
    mutate(Scale = factor(Scale, labels = c("Frequency", "Grams"))) %>% 
    ggplot(aes(Stage, Score, fill = Stage)) +
    geom_boxplot() +
    scale_fill_hue(name="Stage",    # Legend label, use darker colors
                   breaks=c("t0", "t1"),
                   labels=c("Pre-", "Post-"),
                   l=25) +
    labs(y = NULL, title = "2 weeks real rTMS: Consumption (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")


UTgraph2 <- clin2 %>% 
    gather("Scale", "Score", UT_bzd:UT_thc, factor_key = T) %>% 
    mutate(Scale = factor(Scale, labels = c("Benzodiacepines", "Cocaine", "THC"))) %>% 
    group_by(Stage, Scale, Score) %>% 
    dplyr::summarise(Count = n()) %>% 
    ggplot(aes(Stage, Count, fill = Score)) +
    scale_fill_hue(name="Score",    # Legend label, use darker colors
                   breaks=c("negative", "positive"),
                   labels=c("Negative", "Positive"),
                   l=30) +
    labs(y = "Count", title = "Urine Testing after 2 weeks of real rTMS (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ .)

UTgraph2 + geom_bar(stat = "identity", position = position_dodge())
UTgraph2 + geom_bar(stat = "identity", position = "fill") + 
    scale_y_continuous(name = "Percent", labels = scales::percent)


#### Longitudinal stage #### 

prep_plot_cl2(clin3, VAS) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se), 
                  width = 0.1, position = pd, alpha = .7) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    labs(y = NULL, title = "Longitudinal: Craving's Analogue Visual Scale (N = 13)",
         x = NULL) +
    scale_x_discrete(labels = c("Basal", "2 weeks rTMS", "3 months maintenance"))

prep_plot_cl2(clin3, CCQ_G:CCQ_N) %>% 
    mutate(Scale = factor(Scale, labels = c("General", "Now"))) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se), 
                  width = 0.1, position = pd) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    labs(y = NULL, title = "Longitudinal: Cocaine's Craving Questionnaire (N = 13)",
         x = NULL) +
    scale_x_discrete(labels = c("Basal", "2 weeks rTMS", "3 months maintenance")) +
    facet_wrap(. ~ Scale, scales = "free")


prep_plot_cl2(clin3, B11_C:B11_Tot) %>% 
    mutate(Scale = factor(Scale, labels = c("Cognitive", "Motor", "Non-planning", "Total score"))) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se), 
                  width = 0.1, position = pd) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    labs(y = NULL, title = "Longitudinal: Barratt's Impulsivity Scale 11 (N = 13)",
         x = NULL) +
    scale_x_discrete(labels = c("Basal", "2 weeks rTMS", "3 months maintenance")) +
    facet_wrap(Scale ~ ., scales = "free")

prep_plot_cl2(clin3, Coc_last30:Grams) %>% 
    mutate(Scale = factor(Scale, labels = c("Frequency", "Grams"))) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se), 
                  width = 0.1, position = pd) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 4, fill = "white", position = pd) +
    
    labs(y = NULL, title = "Longitudinal: Consumption (N = 13)",
         x = NULL) +
    scale_x_discrete(labels = c("Basal", "2 weeks rTMS", "3 months maintenance")) +
    facet_wrap(Scale ~ ., scales = "free")


UTgraph3 <- clin3 %>% 
    gather("Scale", "Score", UT_bzd:UT_thc, factor_key = T) %>% 
    mutate(Scale = factor(Scale, labels = c("Benzodiacepines", "Cocaine", "THC"))) %>% 
    group_by(Stage, Scale, Score) %>% 
    dplyr::summarise(Count = n()) %>% 
    # na.omit() %>%
    ggplot(aes(Stage, Count, fill = Score)) +
    scale_fill_hue(name="Score",    # Legend label, use darker colors
                   breaks=c("negative", "positive", NA),
                   labels=c("Negative", "Positive", "NA"),
                   l=30) +
    labs(y = "Count", title = "Longitudinal: Urine Testing (N = 13)",
         x = NULL) +
    scale_x_discrete(labels = c("Basal", "2 weeks rTMS", "3 months maintenance")) +
    facet_wrap(Scale ~ .)

UTgraph3 + geom_bar(stat = "identity", position = position_dodge())
UTgraph3 + geom_bar(stat = "identity", position = "fill") + 
    scale_y_continuous(name = "Percent", labels = scales::percent)

ConsGraph3 <- clin3 %>% 
    group_by(Stage, Consume) %>% 
    dplyr::summarise(Count = n()) %>% 
    filter(Stage != "t0") %>% 
    na.omit() %>% 
    ggplot(aes(Stage, Count, fill = Consume)) +
    scale_fill_hue(name="Consumption",    # Legend label, use darker colors
                   # breaks=c("Yes", "No"),
                   # labels=c("Yes", "No"),
                   l=30) +
    labs(y = "Count", title = "Longitudinal consumption (N = 13)",
         x = NULL) 

ConsGraph3 + geom_bar(stat = "identity", position = position_dodge()) + 
    scale_y_continuous(breaks = seq(0, 12, 2))

ConsGraph3 + geom_bar(stat = "identity", position = "fill") +
    scale_y_continuous(name = "Percent", labels = scales::percent)

ImprovGraph3 <- clin3 %>% 
    group_by(Stage, Improvement) %>% 
    dplyr::summarise(Count = n()) %>% 
    filter(Stage != "t0") %>% 
    ggplot(aes(Stage, Count, fill = Improvement)) +
    scale_fill_hue(name="Improvement",    # Legend label, use darker colors
                   # breaks=c("Yes", "No"),
                   # labels=c("Yes", "No"),
                   l=20) +
    labs(y = "Count", title = "Longitudinal: Subjective improvement (N = 13)",
         x = NULL) 

ImprovGraph3 + geom_bar(stat = "identity", position = position_dodge()) + 
    scale_y_continuous(breaks = seq(2, 12, 2))
ImprovGraph3 + geom_bar(stat = "identity", position = "fill") +
    scale_y_continuous(name = "Percent", labels = scales::percent)


# Graphs --------------------------------------------------------------------------------------

prep_plot_gr(CON, DAN, DMN, FPN, SAL, SUB, VAN, WB) %>% 
    filter(Metric %in% c("EG", "EL")) %>% 
    mutate(Metric = factor(Metric, labels = c("Global eff.", "Local eff."))) %>% 
    ggplot(aes(Stage, Val, group = Group)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham TMS", "Real TMS"),
                     l=40) +
    facet_grid(Metric ~ Network, scales = 'free') +
    labs(y = NULL, title = NULL,
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-"))

prep_plot_gr(CON, DAN, DMN, FPN, SAL, SUB, VAN, WB) %>% 
    filter(Metric %in% c("D", "S")) %>% 
    mutate(Metric = factor(Metric, labels = c("Density", "Strength"))) %>% 
    ggplot(aes(Stage, Val, group = Group)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham TMS", "Real TMS"),
                     l=40) +
    facet_grid(Metric ~ Network, scales = 'free') +
    labs(y = NULL, title = NULL,
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-"))

prep_plot_gr(CON, DAN, DMN, FPN, SAL, SUB, VAN, WB) %>% 
    filter(Metric %in% c("CP", "LP", "SW")) %>% 
    mutate(Metric = factor(Metric, labels = c("Clustering coeff.", "Ch. path length", "Smallworldness"))) %>% 
    ggplot(aes(Stage, Val, group = Group)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham TMS", "Real TMS"),
                     l=40) +
    facet_grid(Metric ~ Network, scales = 'free') +
    labs(y = NULL, title = NULL,
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-"))


prep_plot_gr2(attrCONl, attrDANl, attrDMNl, attrFPNl, attrSALl, attrSUBl) %>% 
    filter(Metric %in% c("CP", "D", "EG", "EL", "LP", "S", "SW")) %>% 
    mutate(Metric = factor(Metric, labels = c("Clustering coeff.", "Density", "Global Eff.", "Local Eff.", "Ch. Path length", "Strength", "Smallworldness"))) %>% 
    ggplot(aes(Stage, Val, group = 1)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se), 
                  width = 0.1, position = pd) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    # scale_colour_hue(name="Group",    # Legend label, use darker colors
    #                  breaks=c("t0", "t1", "t2"),
    #                  labels=c("Baseline", "2 weeks TMS", "3 months TMS"),
    #                  l=40) +
    facet_grid(Metric ~ Network, scales = 'free') +
    labs(y = NULL, title = NULL,
         x = NULL) +
    scale_x_discrete(labels = c("Baseline", "2 weeks rTMS", "3 months rTMS"))


