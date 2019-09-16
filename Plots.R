
# Plots -------------------------------------------------------------------
theme_set(theme_linedraw(base_size = 12))
pd <- position_dodge(0.75)   

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
corrplot.mixed(M, tl.col = "black", upper = 'ellipse', )
corrplot.mixed(M2, tl.col = "black", upper = 'ellipse', )


attrP[threshold %in% thresholds[1:14], c(1:3,8,9,11,17,22)][
    , threshold := factor(threshold)] %>% 
    dplyr::rename(Densidad = density, Fuerza = strength, E_global = E.global, E_local = E.local, Pequeño_mundo = sigma) %>% 
    melt( measure.vars = 4:8) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(position = pd, 
        aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = "Grupo",
        breaks=c("CU", "HC"),
        labels=c("Pacientes adictos", "Controles sanos"),
        l=10) +
    labs(y = "Valor", x = expression(tau)) +
    facet_wrap(variable ~ ., scales = 'free', nrow = 3) + 
    theme(legend.position = c(0.75,0.15))


attrT[, c(1:4,9,10,12,18,23,25)][, threshold := factor(threshold)] %>% 
    melt(meausure.vars = 5:10) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "Stage", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Stage)) +
    geom_errorbar(aes(ymin = value - sd, ymax = value + sd, col = Stage), position = pd) +
    geom_line(position = pd, aes(col = Stage)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = "Stage",
        breaks=c("T0", "T1"),
        labels=c("Pre", "Post"),
        l=10) +
    labs(y = "Values of metrics", x = "Threshold", title = "Topology differences between addicts and controls") +
    facet_wrap(variable ~ Group, scales = 'free')

