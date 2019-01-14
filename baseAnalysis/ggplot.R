# Functions ---------------------------------------------------------------

prep_plot_gr <- function(...){
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

prep_plot_gr2 <- function(...){
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

theme_set(theme_linedraw(base_size = 15))
pd <- position_dodge(0.21)


# Clinical ------------------------------------------------------------------------------------

prep_plot_cl(clin1, VAS) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name="Grupo",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("EMTr Sham", "EMTr Real"),
                     l=40) +
    labs(y = NULL, title = "Interacción (Grupo v Etapa): Escala Visual Análoga de Craving (N = 24)",
         x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-"))

prep_plot_cl(clin1, B11_C:B11_Tot) %>% 
    mutate(Scale = factor(Scale, labels = c("Cognitiva", "Motora", "No-planeación", "Total"))) %>% 
    ggplot(aes(Stage, Score, group = Group)) +
    geom_errorbar(aes(ymin = Score - se, ymax = Score + se, col = Group), 
                  width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name="Grupo",    # Legend label, use darker colors
                     breaks=c("sham", "tx"),
                     labels=c("EMTr Sham", "EMTr Real"),
                     l=40) +
    labs(y = NULL, title = "Interacción (Grupo v Etapa): Escala de impulsividad de Barratt (N = 24)", x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_wrap(Scale ~ ., scales = "free")


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


