
# Dependence vs Controls --------------------------------------------------

kNumRandClust <- 3e2
gRandP <- smallClustP <- vector('list', length = length(groups1))

for (i in seq_along(groups1)) {
    gRandP[[i]] <- vector('list', length = length(thresholdsP))
    for (j in seq_along(thresholdsP)) {
        gRandP[[i]][[j]] <- sim.rand.graph.par(
            gP[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustP[[i]] <- small.world(gP[[i]], gRandP[[i]])
}
smallClustP <- rbindlist(smallClustP)

write_rds(gRandP, 'outData/RDS/gRandP.RDS')
write_rds(smallClustP, 'outData/RDS/smallClustP.RDS')

# Closed label: T0 --------------------------------------------------------

gRandT0 <- smallClustT0 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandT0[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandT0[[i]][[j]] <- sim.rand.graph.par(
            gT0[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustT0[[i]] <- small.world(gT0[[i]], gRandT0[[i]])
}
smallClustT0 <- rbindlist(smallClustT0)

write_rds(gRandT0, 'outData/RDS/gRandT0.RDS')
write_rds(smallClustT0, 'outData/RDS/smallClustT0.RDS')

# Closed label: T1 --------------------------------------------------------

gRandT1 <- smallClustT1 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandT1[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandT1[[i]][[j]] <- sim.rand.graph.par(
            gT1[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustT1[[i]] <- small.world(gT1[[i]], gRandT1[[i]])
}
smallClustT1 <- rbindlist(smallClustT1)

write_rds(gRandT1, 'outData/RDS/gRandT1.RDS')
write_rds(smallClustT1, 'outData/RDS/smallClustT1.RDS')

# Longitudinal 1: Baseline ------------------------------------------------

gRandL10 <- smallClustL10 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL10[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL10[[i]][[j]] <- sim.rand.graph.par(
            gL10[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL10[[i]] <- small.world(gL10[[i]], gRandL10[[i]])
}
smallClustL10 <- rbindlist(smallClustL10)

write_rds(gRandL10, 'outData/RDS/gRandL10.RDS')
write_rds(smallClustL10, 'outData/RDS/smallClustL10.RDS')

# Longitudinal 1: Two weeks -----------------------------------------------

gRandL11 <- smallClustL11 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL11[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL11[[i]][[j]] <- sim.rand.graph.par(
            gL11[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL11[[i]] <- small.world(gL11[[i]], gRandL11[[i]])
}
smallClustL11 <- rbindlist(smallClustL11)

write_rds(gRandL11, 'outData/RDS/gRandL11.RDS')
write_rds(smallClustL11, 'outData/RDS/smallClustL11.RDS')

# Longitudinal 1: Three months --------------------------------------------

gRandL12 <- smallClustL12 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL12[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL12[[i]][[j]] <- sim.rand.graph.par(
            gL12[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL12[[i]] <- small.world(gL12[[i]], gRandL12[[i]])
}
smallClustL12 <- rbindlist(smallClustL12)

write_rds(gRandL12, 'outData/RDS/gRandL12.RDS')
write_rds(smallClustL12, 'outData/RDS/smallClustL12.RDS')

# Longitudinal 2: Baseline ------------------------------------------------

gRandL20 <- smallClustL20 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL20[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL20[[i]][[j]] <- sim.rand.graph.par(
            gL20[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL20[[i]] <- small.world(gL20[[i]], gRandL20[[i]])
}
smallClustL20 <- rbindlist(smallClustL20)

write_rds(gRandL20, 'outData/RDS/gRandL20.RDS')
write_rds(smallClustL20, 'outData/RDS/smallClustL20.RDS')

# Longitudinal 2: Two weeks -----------------------------------------------

gRandL21 <- smallClustL21 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL21[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL21[[i]][[j]] <- sim.rand.graph.par(
            gL21[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL21[[i]] <- small.world(gL21[[i]], gRandL21[[i]])
}
smallClustL21 <- rbindlist(smallClustL21)

write_rds(gRandL21, 'outData/RDS/gRandL21.RDS')
write_rds(smallClustL21, 'outData/RDS/smallClustL21.RDS')

# Longitudinal 2: Three months --------------------------------------------

gRandL22 <- smallClustL22 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL22[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL22[[i]][[j]] <- sim.rand.graph.par(
            gL22[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL22[[i]] <- small.world(gL22[[i]], gRandL22[[i]])
}
smallClustL22 <- rbindlist(smallClustL22)

write_rds(gRandL22, 'outData/RDS/gRandL22.RDS')
write_rds(smallClustL22, 'outData/RDS/smallClustL22.RDS')

# Longitudinal 2: Six months ----------------------------------------------

gRandL23 <- smallClustL23 <- vector('list', length = length(groups2))

for (i in seq_along(groups2)) {
    gRandL23[[i]] <- vector('list', length = length(thresholds))
    for (j in seq_along(thresholds)) {
        gRandL23[[i]][[j]] <- sim.rand.graph.par(
            gL23[[i]][[j]], kNumRandClust, clustering = T
        )
    }
    smallClustL23[[i]] <- small.world(gL23[[i]], gRandL23[[i]])
}
smallClustL23 <- rbindlist(smallClustL23)

write_rds(gRandL23, 'outData/RDS/gRandL23.RDS')
write_rds(smallClustL23, 'outData/RDS/smallClustL23.RDS')

