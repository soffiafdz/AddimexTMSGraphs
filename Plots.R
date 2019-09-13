
# Plots -------------------------------------------------------------------
theme_set(theme_linedraw(base_size = 14))
pd <- position_dodge(3)   

attrP[, c(1:3,8,9,11,17,22)][, threshold := factor(threshold)] %>% 
    melt( measure.vars = 4:8) %>% 
    as.data.frame() %>% 
    summarySE(measurevar = "value",
        groupvars = c("Group", "threshold", "variable"), na.rm = T) %>% 
    ggplot(aes(threshold, value, group = Group)) +
    geom_errorbar(aes(ymin = value - sd, ymax = value + sd, col = Group)) +
    geom_line(position = pd, aes(col = Group)) +
    geom_point(shape = 21, size = 3, fill = "white", position = pd) +
    scale_colour_hue(name = "Group",
        breaks=c("CU", "HC"),
        labels=c("Cocaine dependents", "Human Controls"),
        l=10) +
    labs(y = "Values of metrics", x = "Threshold", title = "Topology differences between addicts and controls") +
    facet_wrap(variable ~ ., scales = 'free')

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
