# Exploring (Mean) ----------------------------------------------------------------------------

# swWBvs[, .(
#     Sigma = mean(sigma),
#     Lp = mean(Lp),
#     lambda = mean(Lp.norm),
#     Cp = mean(Cp),
#     gamma = mean(Cp.norm)),
#     keyby = .(Group, Stage)]


swWB[, .(
    Sigma = mean(sigma),
    Lp = mean(Lp),
    lambda = mean(Lp.norm),
    Cp = mean(Cp),
    gamma = mean(Cp.norm)), 
    keyby = .(Group, Stage)]

# swWBx[, .(
#     Sigma = mean(sigma),
#     Lp = mean(Lp),
#     lambda = mean(Lp.norm),
#     Cp = mean(Cp),
#     gamma = mean(Cp.norm)), 
#     keyby = .(Group, Stage)]
# 
# swWBl[, .(
#     Sigma = mean(sigma),
#     Lp = mean(Lp),
#     lambda = mean(Lp.norm),
#     Cp = mean(Cp),
#     gamma = mean(Cp.norm)), 
#     keyby = .(Group, Stage)]



# Exploring (Stats) ---------------------------------------------------------------------------

# swWBvs[, .(
#     Sigma = t.test(sigma ~ Group)$p.value,
#     Lp = t.test(Lp ~ Group)$p.value,
#     lambda = t.test(Lp.norm ~ Group)$p.value,
#     Cp = t.test(Cp ~ Group)$p.value,
#     gamma = t.test(Cp.norm ~ Group)$p.value)]



swWB[, .(
    Sigma = t.test(sigma ~ Stage)$p.value,
    Lp = t.test(Lp ~ Stage)$p.value,
    lambda = t.test(Lp.norm ~ Stage)$p.value,
    Cp = t.test(Cp ~ Stage)$p.value,
    gamma = t.test(Cp.norm ~ Stage)$p.value), 
    keyby = .(Group)]

# 
# swWBx[, .(
#     Sigma = t.test(sigma ~ Stage)$p.value,
#     Lp = t.test(Lp ~ Stage)$p.value,
#     lambda = t.test(Lp.norm ~ Stage)$p.value,
#     Cp = t.test(Cp ~ Stage)$p.value,
#     gamma = t.test(Cp.norm ~ Stage)$p.value)]
# 
# 
# 
# swWBl[, .(
#     Sigma = summary(aov(sigma ~ Stage))[[1]][["Pr(>F)"]][[1]],
#     Lp = summary(aov(Lp ~ Stage))[[1]][["Pr(>F)"]][[1]],
#     lambda = summary(aov(Lp.norm ~ Stage))[[1]][["Pr(>F)"]][[1]],
#     Cp = summary(aov(Cp ~ Stage))[[1]][["Pr(>F)"]][[1]],
#     gamma = summary(aov(Cp.norm ~ Stage))[[1]][["Pr(>F)"]][[1]])]