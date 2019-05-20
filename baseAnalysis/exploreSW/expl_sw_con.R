# Exploring (Mean) ----------------------------------------------------------------------------

swCONvs %>% 
    group_by(Group) %>% 
    dplyr::summarize(sigma = mean(sigma), 
                     Lp = mean(Lp), 
                     lambda = mean(Lp.norm),
                     Cp = mean(Cp),
                     gamma = mean(Cp.norm))

swCON %>% 
    group_by(Group, Stage) %>% 
    dplyr::summarize(sigma = mean(sigma), 
                     Lp = mean(Lp), 
                     lambda = mean(Lp.norm),
                     Cp = mean(Cp),
                     gamma = mean(Cp.norm))

swCONx %>% 
    group_by(Stage) %>% 
    dplyr::summarize(sigma = mean(sigma), 
                     Lp = mean(Lp), 
                     lambda = mean(Lp.norm),
                     Cp = mean(Cp),
                     gamma = mean(Cp.norm))

swCONl %>% 
    group_by(Stage) %>% 
    dplyr::summarize(sigma = mean(sigma), 
                     Lp = mean(Lp), 
                     lambda = mean(Lp.norm),
                     Cp = mean(Cp),
                     gamma = mean(Cp.norm))



# Exploring (Stats) ---------------------------------------------------------------------------

swCONvs %>% 
    dplyr::summarise(sigma = t.test(sigma ~ Group)$p.value, 
                     Lp = t.test(Lp ~ Group)$p.value, 
                     lambda = t.test(Lp.norm ~ Group)$p.value,
                     Cp = t.test(Cp ~ Group)$p.value,
                     gamma = t.test(Cp.norm ~ Group)$p.value)

swCON %>% 
    group_by(Stage) %>% 
    dplyr::summarise(sigma = t.test(sigma ~ Group)$p.value, 
                     Lp = t.test(Lp ~ Group)$p.value, 
                     lambda = t.test(Lp.norm ~ Group)$p.value,
                     Cp = t.test(Cp ~ Group)$p.value,
                     gamma = t.test(Cp.norm ~ Group)$p.value)

swCON %>% 
    group_by(Group) %>% 
    dplyr::summarise(sigma = t.test(sigma ~ Stage)$p.value, 
                     Lp = t.test(Lp ~ Stage)$p.value, 
                     lambda = t.test(Lp.norm ~ Stage)$p.value,
                     Cp = t.test(Cp ~ Stage)$p.value,
                     gamma = t.test(Cp.norm ~ Stage)$p.value)



swCONx %>% 
    dplyr::summarize(sigma = t.test(sigma ~ Stage)$p.value, 
                     Lp = t.test(Lp ~ Stage)$p.value, 
                     lambda = t.test(Lp.norm ~ Stage)$p.value,
                     Cp = t.test(Cp ~ Stage)$p.value,
                     gamma = t.test(Cp.norm ~ Stage)$p.value)



swCONl %>% 
    dplyr::summarize(sigma = summary(aov(sigma ~ Stage))[[1]][["Pr(>F)"]][[1]], 
                     Lp = summary(aov(Lp ~ Stage))[[1]][["Pr(>F)"]][[1]],
                     lambda = summary(aov(Lp.norm ~ Stage))[[1]][["Pr(>F)"]][[1]],
                     Cp = summary(aov(Cp ~ Stage))[[1]][["Pr(>F)"]][[1]],
                     gamma = summary(aov(Cp.norm ~ Stage))[[1]][["Pr(>F)"]][[1]])