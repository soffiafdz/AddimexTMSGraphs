
# Plots -------------------------------------------------------------------
theme_set(theme_linedraw(base_size = 21))
pd <- position_dodge(0.5)   

#### VS ####
# Density & strength
attrP[threshold %in% thresholds[1:14], c(1:3,17,22)][
    , threshold := factor(threshold)] %>% 
    dplyr::rename(Densidad = density, Fuerza = strength) %>% 
    melt( measure.vars = 4:5) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(position = pd, width = .4,
        aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("CU", "HC"),
        labels=c("Pacientes", "Controles"),
        l=10) +
    labs(y = NULL, x = expression(tau)) +
    facet_grid(variable ~ ., scales = 'free') + 
    theme(legend.position = 'top')

# Efficiencies
attrP[threshold %in% thresholds[1:14], c(1:3,9,11)][
    , threshold := factor(threshold)] %>% 
    dplyr::rename(E.Global = E.global, E.Local = E.local) %>% 
    melt( measure.vars = 4:5) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(position = pd, width = .4,
        aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("CU", "HC"),
        labels=c("Pacientes", "Controles"),
        l=10) +
    labs(y = NULL, x = expression(tau)) +
    facet_grid(variable ~ ., scales = 'free') + 
    theme(legend.position = 'top')

# Sigmas
pd <- position_dodge(0.4)   
attrP[threshold %in% thresholds[1:8], c(1:3,4,6,8)][
    , threshold := factor(threshold)] %>% 
    dplyr::rename(MundoP. = sigma, L.Camino = Lp, C.Agrup. = Cp) %>% 
    melt( measure.vars = 4:6) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(position = pd, width = .4,
        aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("CU", "HC"),
        labels=c("Pacientes", "Controles"),
        l=10) +
    labs(y = NULL, x = NULL) +
    facet_grid(variable ~ ., scales = 'free') + 
    theme(legend.position = 'top')

attrP[threshold %in% thresholds[9:14], c(1:3,4,6,8)][
    , threshold := factor(threshold)] %>% 
    dplyr::rename(MundoP. = sigma, L.Camino = Lp, C.Agrup. = Cp) %>% 
    melt( measure.vars = 4:6) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(position = pd, width = .4,
        aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("CU", "HC"),
        labels=c("Pacientes", "Controles"),
        l=10) +
    labs(y = NULL, x = expression(tau)) +
    facet_grid(variable ~ ., scales = 'free') + 
    theme(legend.position = 'none')







corrClin <- melt(clin1, id.vars = c(1, 3, 10), measure.vars = 4:6, 
    variable.name = "Craving_measure", value.name = "Craving_value")
corrClin[Stage == "T0", cor.test(Craving_value, B11Tot), by = Craving_measure][
    , c(1,5,4,10)]
corrClin[Stage == "T1", cor.test(Craving_value, B11Tot), by = Craving_measure][
    , c(1,5,4,10)]

clinScales <- names(clin1)[c(4:6,10)]
M1 <- cor(clin1[Stage == "T0", ..clinScales])
M2 <- cor(clin1[Stage == "T1", ..clinScales])

#### Corrs Craving vs Impulsivity ####
corrplot.mixed(M1, tl.col = "black", upper = 'ellipse', )
corrplot.mixed(M2, tl.col = "black", upper = 'ellipse', )

grMedClinPlot <- read_rds('outData/RDS/grMedClinLongPLOT.RDS')

#### Cambios por Mediana ####
pd <- position_dodge(0.25)   
grMedClinPlot[Scale == "VAS"] %>% 
    summarySE(measurevar = "Score", groupvars = c("GroupVAS2", "GroupVAS3", "Group", "Stage")) %>%
    ggplot(aes(Stage, Score, group = GroupVAS2)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupVAS3),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupVAS3)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("<", ">"),
        labels=c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_grid(. ~ factor(Group, labels = c("EMTr Sham", "EMTr Real"))) +
    theme(legend.position = "none")

grMedClinPlot[Scale == "CCQG"] %>% 
    summarySE(measurevar = "Score", groupvars = c("GroupCCQG2", "GroupCCQG3", "Group", "Stage")) %>%
    ggplot(aes(Stage, Score, group = GroupCCQG2)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQG3),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQG3)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("<", ">"),
        labels=c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_grid(. ~ factor(Group, labels = c("EMTr Sham", "EMTr Real"))) +
    theme(legend.position = c(0.85, 0.88))

grMedClinPlot[Scale == "CCQN"] %>% 
    summarySE(measurevar = "Score", groupvars = c("GroupCCQN2", "GroupCCQN3", "Group", "Stage")) %>%
    ggplot(aes(Stage, Score, group = GroupCCQN2)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQN3),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQN3)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("<", ">"),
        labels=c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = "Fase") +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_grid(. ~ factor(Group, labels = c("EMTr Sham", "EMTr Real"))) +
    theme(legend.position = "none")

grMedClinPlot[Scale == "B11Tot"] %>% 
    summarySE(measurevar = "Score", groupvars = c("GroupBIS2", "GroupBIS3", "Group", "Stage")) %>%
    ggplot(aes(Stage, Score, group = GroupBIS2)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupBIS3),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupBIS3)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = "División por mediana",
        breaks=c("<", ">"),
        labels=c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = "Fase") +
    scale_x_discrete(labels = c("Pre-", "Post-")) +
    facet_grid(. ~ factor(Group, labels = c("EMTr Sham", "EMTr Real"))) +
    theme(legend.position = "none")

#### Grafos ####

graphTplot <- melt(
    attrT[threshold == thresholds[10],c(1:3,5,7,9,10,12,18,23)], 
    measure.vars = 4:10
)
graphTplot <- dcast(
    graphTplot, Study.ID + Group + variable ~ Stage, value.var = "value"
)
graphTplot[, Delta := T1 - T0]
graphTplot <- melt(
    graphTplot, measure.vars = 4:5, 
    variable.name = "Stage", value.name = "Score"
)
graphTplot[Stage == "T0", Delta := 0][, `:=`(
    Stage = factor(Stage, labels = c("Pre-", "Post-")),
    variable = factor(variable, labels = c(
        "L.Camino", "C.Agrupamiento", "MundoP.",
        "E.Global", "E.Local", "Densidad", "Fuerza"
        ))
)]


graphTplot %>% 
    filter(variable %in% c("Densidad", "Fuerza")) %>% 
    summarySE(measurevar = "Delta",
        groupvars = c("Group", "Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Delta, group = Group)) +
    geom_errorbar(aes(ymin = Delta - sd, ymax = Delta + sd, col = Group), 
        position = pd, width = 0.25) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("Sham", "Tx"),
        labels=c("EMTr Sham", "EMTr Real"),
        l=10) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free') +
    theme(legend.position = 'top')

graphTplot %>% 
    filter(variable %in% c("E.Global", "E.Local")) %>% 
    summarySE(measurevar = "Delta",
        groupvars = c("Group", "Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Delta, group = Group)) +
    geom_errorbar(aes(ymin = Delta - sd, ymax = Delta + sd, col = Group), 
        position = pd, width = 0.25) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("Sham", "Tx"),
        labels=c("EMTr Sham", "EMTr Real"),
        l=10) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free') +
    theme(legend.position = 'top')

graphTplot %>% 
    filter(variable %in% c("L.Camino", "C.Agrupamiento", "MundoP.")) %>% 
    summarySE(measurevar = "Delta",
        groupvars = c("Group", "Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Delta, group = Group)) +
    geom_errorbar(aes(ymin = Delta - sd, ymax = Delta + sd, col = Group), 
        position = pd, width = 0.25) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    scale_colour_hue(name = NULL,
        breaks=c("Sham", "Tx"),
        labels=c("EMTr Sham", "EMTr Real"),
        l=10) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free') +
    theme(legend.position = 'top')



# Longitudinal ------------------------------------------------------------

grMedClinLongL1[Scale == "VAS"] %>% 
   summarySE(measurevar = "Score", groupvars = c("GroupVAS", "Stage")) %>% 
    ggplot(aes(Stage, Score, group = GroupVAS)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupVAS),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupVAS)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Basal", "Dos semanas", "Tres meses")) + 
    theme(legend.position = 'none')

grMedClinLongL1[Scale == "CCQG"] %>% 
   summarySE(measurevar = "Score", groupvars = c("GroupCCQG", "Stage")) %>% 
    ggplot(aes(Stage, Score, group = GroupCCQG)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQG),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQG)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Basal", "Dos semanas", "Tres meses")) + 
    theme(legend.position = c(0.82,0.86))

grMedClinLongL1[Scale == "CCQN"] %>% 
   summarySE(measurevar = "Score", groupvars = c("GroupCCQN", "Stage")) %>% 
    ggplot(aes(Stage, Score, group = GroupCCQN)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQN),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQN)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Basal", "Dos semanas", "Tres meses")) + 
    theme(legend.position = 'none')

grMedClinLongL1[Scale == "B11Tot"] %>% 
   summarySE(measurevar = "Score", groupvars = c("GroupBIS", "Stage")) %>% 
    ggplot(aes(Stage, Score, group = GroupBIS)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupBIS),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupBIS)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(labels = c("Basal", "Dos semanas", "Tres meses")) + 
    theme(legend.position = 'none')

#### Graphs ####

graphL1plot <- melt(
    attrL1[threshold == thresholds[10],c(1:2,4,6,8,9,11,17,22)], 
    measure.vars = 3:9, value.name = "Score"
)
graphL1plot[, `:=`(
    Stage = factor(Stage, labels = c("T0", "T1", "T2")),
    variable = factor(variable, labels = c(
        "L.Camino", "C.Agrupamiento", "MundoP.",
        "E.Global", "E.Local", "Densidad", "Fuerza"
        ))
)]

graphL1plot %>% 
    filter(variable %in% c("Densidad", "Fuerza")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')

graphL1plot %>% 
    filter(variable %in% c("E.Global", "E.Local")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')

graphL1plot %>% 
    filter(variable %in% c("L.Camino", "C.Agrupamiento", "MundoP.")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')

#### 6 meses ####
grMedClinLongL2[Scale == "VAS"] %>% 
   summarySE(
       measurevar = "Score", groupvars = c("GroupVAS", "Stage"), na.rm = T
       ) %>% 
    ggplot(aes(Stage, Score, group = GroupVAS)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupVAS),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupVAS)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(
        labels = c("Basal", "Dos semanas", "Tres meses", "Seis meses")
        ) + theme(legend.position = 'none')

grMedClinLongL2[Scale == "CCQG"] %>% 
   summarySE(
       measurevar = "Score", groupvars = c("GroupCCQG", "Stage"), na.rm = T
       ) %>% 
    ggplot(aes(Stage, Score, group = GroupCCQG)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQG),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQG)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(
        labels = c("Basal", "Dos semanas", "Tres meses", "Seis meses")
        ) + theme(legend.position = c(0.6,0.85))

grMedClinLongL2[Scale == "CCQN"] %>% 
   summarySE(
       measurevar = "Score", groupvars = c("GroupCCQN", "Stage"), na.rm = T
       ) %>% 
    ggplot(aes(Stage, Score, group = GroupCCQN)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupCCQN),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupCCQN)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(
        labels = c("Basal", "Dos semanas", "Tres meses", "Seis meses")
        ) + 
    theme(legend.position = 'none')

grMedClinLongL2[Scale == "B11Tot"] %>% 
   summarySE(
       measurevar = "Score", groupvars = c("GroupBIS", "Stage"), na.rm = T
       ) %>% 
    ggplot(aes(Stage, Score, group = GroupBIS)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd, col = GroupBIS),
        width = 0.1, position = pd) +
    geom_line(position = pd, aes(col = GroupBIS)) +
    geom_point(shape = 21, size = 5, fill = 'white', position = pd) + 
    scale_colour_hue(name = NULL, 
        breaks = c("<", ">"),
        labels = c("Puntaje bajo", "Puntaje alto"),
        l=10) +
    labs(y = NULL, x = NULL) +
    scale_x_discrete(
        labels = c("Basal", "Dos semanas", "Tres meses", "Seis meses")
        ) + 
    theme(legend.position = 'none')

#### Graphs ####

graphL2plot <- melt(
    attrL2[threshold == thresholds[10],c(1:2,4,6,8,9,11,17,22)], 
    measure.vars = 3:9, value.name = "Score"
)
graphL2plot[, `:=`(
    Stage = factor(Stage, labels = c("T0", "T1", "T2", "T3")),
    variable = factor(variable, labels = c(
        "L.Camino", "C.Agrupamiento", "MundoP.",
        "E.Global", "E.Local", "Densidad", "Fuerza"
        ))
)]

graphL2plot %>% 
    filter(variable %in% c("Densidad", "Fuerza")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')

graphL2plot %>% 
    filter(variable %in% c("E.Global", "E.Local")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')

graphL2plot %>% 
    filter(variable %in% c("L.Camino", "C.Agrupamiento", "MundoP.")) %>% 
    summarySE(measurevar = "Score",
        groupvars = c("Stage", "variable"), na.rm = T) %>% 
    ggplot(aes(Stage, Score, group = 1)) +
    geom_errorbar(aes(ymin = Score - sd, ymax = Score + sd), 
        position = pd, width = 0.25) +
    geom_line(position = pd) +
    geom_point(shape = 21, size = 5, fill = "white", position = pd) +
    labs(y = NULL, x = NULL) +
    facet_wrap(variable ~ ., scales = 'free')
