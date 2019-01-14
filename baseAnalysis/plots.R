
clin1 %>% 
    gather("craving", "Resultado", 8:10) %>% 
    mutate(Group = factor(Group, labels = c("Sham", "Real"))) %>% 
    ggplot(aes(Stage, Resultado)) +
    stat_summary(aes(colour = Group), fun.y = mean, geom = "point") + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.y = mean, geom = "line", linetype = 'twodash') + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.data = mean_se, alpha = 0.7, 
                 width = 0.05, geom = "errorbar") +
    facet_wrap(craving~., scales = "free", nrow=2) +
    labs(y = NULL, x = "Etapa", col = "Grupo") +
    scale_x_discrete(labels = c("T0", "T1")) +
    theme_bw() +
    theme(legend.position = c(0.75 , 0.2))

clin1 %>% 
    gather("imp", "Resultado", 4:7) %>% 
    mutate(Group = factor(Group, labels = c("Sham", "Real"))) %>% 
    ggplot(aes(Stage, Resultado)) +
    stat_summary(aes(colour = Group), fun.y = mean, geom = "point") + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.y = mean, geom = "line", linetype = 'twodash') + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.data = mean_se, alpha = 0.7, 
                 width = 0.05, geom = "errorbar") +
    facet_grid(. ~ imp, scales = "free") +
    labs(y = NULL, x = "Etapa", col = "Grupo") +
    scale_x_discrete(labels = c("T0", "T1")) +
    theme_bw() 


clin3 %>% 
    gather("craving", "Resultado", 8:10) %>% 
    mutate(Group = factor(Group, labels = c("Sham", "Real"))) %>% 
    ggplot(aes(Stage, Resultado)) +
    stat_summary(aes(colour = Group), fun.y = mean, geom = "point") + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.y = mean, geom = "line", linetype = 'twodash') + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.data = mean_se, alpha = 0.7, 
                 width = 0.05, geom = "errorbar") +
    facet_wrap(craving~., scales = "free", nrow=1) +
    labs(y = NULL, x = "Etapa", col = "Grupo") +
    scale_x_discrete(labels = c("T0", "T1", "T2")) +
    theme_bw()

clin3 %>% 
    gather("imp", "Resultado", 4:7) %>% 
    mutate(Group = factor(Group, labels = c("Sham", "Real"))) %>% 
    ggplot(aes(Stage, Resultado)) +
    stat_summary(aes(colour = Group), fun.y = mean, geom = "point") + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.y = mean, geom = "line", linetype = 'twodash') + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.data = mean_se, alpha = 0.7, 
                 width = 0.05, geom = "errorbar") +
    facet_grid(. ~ imp, scales = "free") +
    labs(y = NULL, x = "Etapa", col = "Grupo") +
    scale_x_discrete(labels = c("T0", "T1", "T2")) +
    theme_bw() 

clin3 %>% 
    gather("craving", "Resultado", 8:10) %>% 
    ggplot(aes(Stage, Resultado)) +
    geom_boxplot() + 
    facet_grid(craving~., scales = "free") +
    labs(y = NULL,
         x = "Etapa") +
    scale_x_discrete(labels = c("T0", "T1", "T2")) +
    theme_bw() 

clin3 %>% 
    gather("imp", "Resultado", 4:7) %>% 
    ggplot(aes(Stage, Resultado)) +
    geom_boxplot() + 
    facet_grid(. ~ imp, scales = "free") +
    labs(y = NULL,
         x = "Etapa") +
    scale_x_discrete(labels = c("T0", "T1", "T2")) +
    theme_bw() 




####Correlation plots dorsal attention Network####


d %>% 
    gather(key = "metric", value = "value", CP:VAS) %>% 
    ggplot(aes(Stage, value)) + 
    stat_summary(aes(colour = Group), fun.y = mean, geom = "point") + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.y = mean, geom = "line", linetype = 'twodash') + 
    stat_summary(aes(group = Group, 
                     colour = Group), 
                 fun.data = mean_se, alpha = 0.7, 
                 width = 0.05, geom = "errorbar") +
    facet_grid(metric ~ net, scales = "free") +
    labs(y = NULL, title = "Interactions between stimulation group and stage of treatment",
         x = "Stage", colour = "Group") +
    scale_x_discrete(labels = c("T0", "T1", "Tx")) +
    theme_minimal() + 
    theme(text = element_text(size = 23, colour = "#580000"), 
          strip.text = element_text(colour = "#580000"),
          axis.text.y = element_blank())
theme(axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks = element_blank())


z %>% 
    ggplot(aes(VAS, val)) +
    geom_point(aes(colour = Group)) +
    geom_smooth(aes(colour = Group), 
                method = "lm", se = F, linetype = 2) + 
    geom_smooth(method = "lm", colour = "#580000", alpha = 0.2, size = 0.5) +
    facet_wrap(Stage ~ metric, scales = "free", nrow = 2) +
    labs(y = "Graph metric", x = "Craving (VAS)", colour = "Group",
         title = "Dorsal attention network - Significant correlations (p < 0.05)") +
    theme_minimal() +
    theme(
        text = element_text(size = 23, colour = "#580000"), 
        strip.text = element_text(colour = "#580000"))



# Functions ---------------------------------------------------------------

prep_plot1 <- function(...){
    x <- bind_rows(...)
    x %>% 
        filter(Stage %in% c("t0", "t1")) %>% 
        mutate(Net = case_when(
            Network == "con" ~ "CON",
            Network == "dan" ~ "DAN",
            Network == "dmn" ~ "DMN",
            Network == "fpn" ~ "FPN",
            Network == "sal" ~ "SAL",
            Network == "sub" ~ "SUB",
            Network == "van" ~ "VAN"
        )) %>% 
        select(1:3,
               Net,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength) %>% 
        gather(key = "Metric", value = "Val", CP:S) %>% 
        summarySEwithin(measurevar = "Val", betweenvars = "Group", 
                        withinvars = c("Stage", "Net", "Metric"), 
                        idvar = "Study.ID", na.rm = T)
}

prep_plot2 <- function(...){
    x <- bind_rows(...)
    x %>% 
        stage_tx() %>% 
        mutate(Net = case_when(
            Network == "con" ~ "CON",
            Network == "dan" ~ "DAN",
            Network == "dmn" ~ "DMN",
            Network == "fpn" ~ "FPN",
            Network == "sal" ~ "SAL",
            Network == "sub" ~ "SUB",
            Network == "van" ~ "VAN"
        )) %>% 
        select(1, 3,
               Net,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength) %>% 
        gather(key = "Metric", value = "Val", CP:S) %>% 
        summarySEwithin(measurevar = "Val", 
                        withinvars = c("Stage", "Net", "Metric"), 
                        idvar = "Study.ID", na.rm = T)
}

prep_plot2.5 <- function(...){
    x <- bind_rows(...)
    x %>% 
        stage_tx2.5() %>% 
        mutate(Net = case_when(
            Network == "con" ~ "CON",
            Network == "dan" ~ "DAN",
            Network == "dmn" ~ "DMN",
            Network == "fpn" ~ "FPN",
            Network == "sal" ~ "SAL",
            Network == "sub" ~ "SUB",
            Network == "van" ~ "VAN"
        )) %>% 
        select(1, 3,
               Net,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength) %>% 
        gather(key = "Metric", value = "Val", CP:S) %>% 
        summarySEwithin(measurevar = "Val", 
                        withinvars = c("Stage", "Net", "Metric"), 
                        idvar = "Study.ID", na.rm = T)
}

prep_plot3 <- function(...){
    x <- bind_rows(...)
    x %>% 
        filter(Stage != "t1-4") %>% 
        mutate(Net = case_when(
            Network == "co_tc" ~ "CON",
            Network == "d_att" ~ "DAN",
            Network == "dmn" ~ "DMN",
            Network == "fp_tc" ~ "FPN",
            Network == "sal" ~ "SAL",
            Network == "subc" ~ "SUB",
            Network == "v_att" ~ "VAN"
        )) %>% 
        select(1:3,
               Net,
               CP = Cp, 
               LP = Lp, 
               SW = sigma, 
               EG = E.global, 
               EL = E.local,
               D = density,
               S = strength, 
               B11 = B11_Tot,
               VAS = VAS) %>% 
        gather(key = "GraphM", value = "Val1", CP:S) %>% 
        gather(key = "ClinM", value = "Val2", B11:VAS) %>% 
        mutate(Group2 = case_when(
            Stage == "t0" ~ "both",
            Stage == "t1" ~ Group)) %>% 
        select(1, Group = Group2, 3:8)
        
}


# Interaction plot --------------------------------------------------------
##General with all variables/networks
pd <- position_dodge(0.2)
prep_plot1(con, dan, dmn, fpn, sal, sub, van, wb) %>% 
    ggplot(aes(Stage, Val, group = Group)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se), 
                  width = 0.1, col = "black", position = pd) +
    geom_line(position = pd, aes(linetype = Group)) +
    geom_point(shape = 21, size = 2, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham", "Real"),
                     l=40) +
    facet_grid(Metric ~ Net, scales = 'free') +
    labs(y = NULL, title = "Interactions: Stimulation group v Stage of treatment",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    theme_bw()

##COTC
prep_plot1(co_tc) %>%
    mutate(Grupo = factor(Group, labels = c("Sham", "Real"))) %>% 
    ggplot(aes(Stage, Val, group = Grupo)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se), 
                  width = 0.1, col = "black", position = pd) +
    geom_line(position = pd, aes(linetype = Grupo)) +
    geom_point(shape = 21, size = 2, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham", "Real"),
                     l=40) +
    facet_wrap(. ~ Metric, scales = 'free') +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    theme_bw() +
    theme(legend.position = c(0.5 , 0.2))

prep_plot1(subc) %>% 
    ggplot(aes(Stage, Val, group = Group)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se), 
                  width = 0.1, col = "black", position = pd) +
    geom_line(position = pd, aes(linetype = Group)) +
    geom_point(shape = 21, size = 2, fill = "white", position = pd) +
    scale_colour_hue(name="Group",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("Sham", "Real"),
                     l=40) +
    facet_wrap(Metric ~ ., scales = 'free') +
    labs(y = NULL, title = "SUBC; Interactions: Stimulation group v Stage of treatment",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    theme_bw() +
    theme(legend.position = c(0.5 , 0.2))

prep_plot2.5


# T_test plot -------------------------------------------------------------

prep_plot2(co_tc) %>% 
    ggplot(aes(Stage, Val, group = 1)) +
    geom_errorbar(aes(ymin = Val - se, ymax = Val + se), 
                  width = 0.1, col = "black") +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 2, fill = "white") +
    facet_grid(Metric ~ Net, scales = 'free') +
    labs(y = NULL, title = "Difference Pre-post real treatment",
         x = "Stage") +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    theme_bw()


# Correlation plot --------------------------------------------------------

bind_rows(list(
    prep_plot3(filter(co_tc, Group == "sham" & Stage == "t1")) %>%
        filter(GraphM %in% c("CP", "EL")),
    prep_plot3(filter(subc, Group == "sham" & Stage == "t1")) %>% 
        filter(GraphM %in% c("CP", "SW"))))  %>% 
    filter(ClinM == "VAS") %>% 
    ggplot(aes(Val2, Val1)) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", alpha = 0.2, size = 0.4) +
    facet_wrap(Net ~ GraphM, scales = "free") +
    stat_cor(aes(), size = 3.2, label.y.npc = "top") +
    labs(y = NULL, title = "VAS correlations",
        x = NULL) +
    theme_bw() #+
    #theme(axis.text.x = element_blank(), axis.text.y = element_blank())
    

bind_rows(list(
    prep_plot3(filter(co_tc, Group == "sham" & Stage == "t1")) %>%
        filter(GraphM %in% c("CP", "EL")),
    prep_plot3(filter(subc, Group == "sham" & Stage == "t1")) %>% 
        filter(GraphM %in% c("CP", "SW"))))  %>% 
    filter(ClinM == "VAS") %>% 
    ggplot(aes(Val2, Val1)) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", alpha = 0.2, size = 0.4) +
    facet_wrap(Net ~ GraphM, scales = "free") +
    stat_cor(aes(), size = 3.2, label.y.npc = "top") +
    labs(y = NULL, title = "VAS correlations",
         x = NULL) +
    theme_bw() 
