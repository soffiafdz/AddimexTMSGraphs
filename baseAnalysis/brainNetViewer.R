
# Getting info --------------------------------------------------------------------------------

bnvSh0 <- bnvTx0 <- bnvSh1 <- bnvTx1 <- vector('list', length = 8)

bnvSh0[[1]] <- gGrCONt0[[1]][[1]]
bnvSh0[[2]] <- gGrDANt0[[1]][[1]]
bnvSh0[[3]] <- gGrDMNt0[[1]][[1]]
bnvSh0[[4]] <- gGrFPNt0[[1]][[1]]
bnvSh0[[5]] <- gGrSALt0[[1]][[1]]
bnvSh0[[6]] <- gGrSUBt0[[1]][[1]]
bnvSh0[[7]] <- gGrVANt0[[1]][[1]]
bnvSh0[[8]] <- gGrWBt0[[1]][[1]]

bnvTx0[[1]] <- gGrCONt0[[2]][[1]]
bnvTx0[[2]] <- gGrDANt0[[2]][[1]]
bnvTx0[[3]] <- gGrDMNt0[[2]][[1]]
bnvTx0[[4]] <- gGrFPNt0[[2]][[1]]
bnvTx0[[5]] <- gGrSALt0[[2]][[1]]
bnvTx0[[6]] <- gGrSUBt0[[2]][[1]]
bnvTx0[[7]] <- gGrVANt0[[2]][[1]]
bnvTx0[[8]] <- gGrWBt0[[2]][[1]]

bnvSh1[[1]] <- gGrCONt1[[1]][[1]]
bnvSh1[[2]] <- gGrDANt1[[1]][[1]]
bnvSh1[[3]] <- gGrDMNt1[[1]][[1]]
bnvSh1[[4]] <- gGrFPNt1[[1]][[1]]
bnvSh1[[5]] <- gGrSALt1[[1]][[1]]
bnvSh1[[6]] <- gGrSUBt1[[1]][[1]]
bnvSh1[[7]] <- gGrVANt1[[1]][[1]]
bnvSh1[[8]] <- gGrWBt1[[1]][[1]]

bnvTx1[[1]] <- gGrCONt1[[2]][[1]]
bnvTx1[[2]] <- gGrDANt1[[2]][[1]]
bnvTx1[[3]] <- gGrDMNt1[[2]][[1]]
bnvTx1[[4]] <- gGrFPNt1[[2]][[1]]
bnvTx1[[5]] <- gGrSALt1[[2]][[1]]
bnvTx1[[6]] <- gGrSUBt1[[2]][[1]]
bnvTx1[[7]] <- gGrVANt1[[2]][[1]]
bnvTx1[[8]] <- gGrWBt1[[2]][[1]]


# Saving Raw ----------------------------------------------------------------------------------

for (i in c(1, 6:8)) {
    write_brainnet(bnvSh0[[i]], "none", "strength", "weight", 
                   paste0("outData/brainNetViewer/sh0", i))
    write_brainnet(bnvTx0[[i]], "none", "strength", "weight", 
                   paste0("outData/brainNetViewer/tx0", i))
    write_brainnet(bnvSh1[[i]], "none", "strength", "weight", 
                   paste0("outData/brainNetViewer/sh1", i))
    write_brainnet(bnvTx1[[i]], "none", "strength", "weight", 
                   paste0("outData/brainNetViewer/tx1", i))
}


# Loading back --------------------------------------------------------------------------------

##CON

sh0CONbnvE <- read_tsv('outData/brainNetViewer/sh01.edge', col_names = F)
sh0CONbnvN <- read_tsv('outData/brainNetViewer/sh01.node', col_names = F)
sh1CONbnvE <- read_tsv('outData/brainNetViewer/sh11.edge', col_names = F)
sh1CONbnvN <- read_tsv('outData/brainNetViewer/sh11.node', col_names = F)

tx0CONbnvE <- read_tsv('outData/brainNetViewer/tx01.edge', col_names = F)
tx0CONbnvN <- read_tsv('outData/brainNetViewer/tx01.node', col_names = F)
tx1CONbnvE <- read_tsv('outData/brainNetViewer/tx11.edge', col_names = F)
tx1CONbnvN <- read_tsv('outData/brainNetViewer/tx11.node', col_names = F)


##SUB

sh0SUBbnvE <- read_tsv('outData/brainNetViewer/sh06.edge', col_names = F)
sh0SUBbnvN <- read_tsv('outData/brainNetViewer/sh06.node', col_names = F)
sh1SUBbnvE <- read_tsv('outData/brainNetViewer/sh16.edge', col_names = F)
sh1SUBbnvN <- read_tsv('outData/brainNetViewer/sh16.node', col_names = F)

tx0SUBbnvE <- read_tsv('outData/brainNetViewer/tx06.edge', col_names = F)
tx0SUBbnvN <- read_tsv('outData/brainNetViewer/tx06.node', col_names = F)
tx1SUBbnvE <- read_tsv('outData/brainNetViewer/tx16.edge', col_names = F)
tx1SUBbnvN <- read_tsv('outData/brainNetViewer/tx16.node', col_names = F)


##VAN

sh0VANbnvE <- read_tsv('outData/brainNetViewer/sh07.edge', col_names = F)
sh0VANbnvN <- read_tsv('outData/brainNetViewer/sh07.node', col_names = F)
sh1VANbnvE <- read_tsv('outData/brainNetViewer/sh17.edge', col_names = F)
sh1VANbnvN <- read_tsv('outData/brainNetViewer/sh17.node', col_names = F)

tx0VANbnvE <- read_tsv('outData/brainNetViewer/tx07.edge', col_names = F)
tx0VANbnvN <- read_tsv('outData/brainNetViewer/tx07.node', col_names = F)
tx1VANbnvE <- read_tsv('outData/brainNetViewer/tx17.edge', col_names = F)
tx1VANbnvN <- read_tsv('outData/brainNetViewer/tx17.node', col_names = F)


##WB

sh0WBbnvE <- read_tsv('outData/brainNetViewer/sh08.edge', col_names = F)
sh0WBbnvN <- read_tsv('outData/brainNetViewer/sh08.node', col_names = F)
sh1WBbnvE <- read_tsv('outData/brainNetViewer/sh18.edge', col_names = F)
sh1WBbnvN <- read_tsv('outData/brainNetViewer/sh18.node', col_names = F)

tx0WBbnvE <- read_tsv('outData/brainNetViewer/tx08.edge', col_names = F)
tx0WBbnvN <- read_tsv('outData/brainNetViewer/tx08.node', col_names = F)
tx1WBbnvE <- read_tsv('outData/brainNetViewer/tx18.edge', col_names = F)
tx1WBbnvN <- read_tsv('outData/brainNetViewer/tx18.node', col_names = F)


# Deltas --------------------------------------------------------------------------------------

## CON 

shDeltaCONe <- sh1CONbnvE - sh0CONbnvE 
shDeltaCONn <- sh1CONbnvN %>% 
    mutate(X5 = X5 - sh0CONbnvN$X5)

txDeltaCONe <- tx1CONbnvE - tx0CONbnvE
txDeltaCONn <- tx1CONbnvN %>% 
    mutate(X5 = X5 - tx0CONbnvN$X5)


## SUB

shDeltaSUBe <- sh1SUBbnvE - sh0SUBbnvE
shDeltaSUBn <- sh1SUBbnvN %>% 
    mutate(X5 = X5 - sh0SUBbnvN$X5)

txDeltaSUBe <- tx1SUBbnvE - tx0SUBbnvE
txDeltaSUBn <- tx1SUBbnvN %>% 
    mutate(X5 = X5 - tx0SUBbnvN$X5)


## VAN 

shDeltaVANe <- sh1VANbnvE - sh0VANbnvE
shDeltaVANn <- sh1VANbnvN %>% 
    mutate(X5 = X5 - sh0VANbnvN$X5)

txDeltaVANe <- tx1VANbnvE - tx0VANbnvE
txDeltaVANn <- tx1VANbnvN %>% 
    mutate(X5 = X5 - tx0VANbnvN$X5)


## WB 

shDeltaWBe <- sh1WBbnvE - sh0WBbnvE
shDeltaWBn <- sh1WBbnvN %>% 
    mutate(X5 = X5 - sh0WBbnvN$X5)

txDeltaWBe <- tx1WBbnvE - tx0WBbnvE
txDeltaWBn <- tx1WBbnvN %>% 
    mutate(X5 = X5 - tx0WBbnvN$X5,
           X4 = c(rep(1, 30), rep(2, 5), rep(3, 14), rep(4, 13),
                  rep(5, 58), rep(6, 5), rep(7, 31), rep(8, 25),
                  rep(9, 18), rep(10, 13), rep(11, 9), rep(12, 11),
                  rep(13, 4), rep(14, 28)))


# Save Finals ---------------------------------------------------------------------------------

write_tsv(shDeltaCONe, 'outData/brainNetViewer/shDeltaCON.edge', col_names = F)
write_tsv(shDeltaCONn, 'outData/brainNetViewer/shDeltaCON.node', col_names = F)
write_tsv(txDeltaCONe, 'outData/brainNetViewer/txDeltaCON.edge', col_names = F)
write_tsv(txDeltaCONn, 'outData/brainNetViewer/txDeltaCON.node', col_names = F)

write_tsv(shDeltaSUBe, 'outData/brainNetViewer/shDeltaSUB.edge', col_names = F)
write_tsv(shDeltaSUBn, 'outData/brainNetViewer/shDeltaSUB.node', col_names = F)
write_tsv(txDeltaSUBe, 'outData/brainNetViewer/txDeltaSUB.edge', col_names = F)
write_tsv(txDeltaSUBn, 'outData/brainNetViewer/txDeltaSUB.node', col_names = F)

write_tsv(shDeltaVANe, 'outData/brainNetViewer/shDeltaVAN.edge', col_names = F)
write_tsv(shDeltaVANn, 'outData/brainNetViewer/shDeltaVAN.node', col_names = F)
write_tsv(txDeltaVANe, 'outData/brainNetViewer/txDeltaVAN.edge', col_names = F)
write_tsv(txDeltaVANn, 'outData/brainNetViewer/txDeltaVAN.node', col_names = F)

write_tsv(shDeltaWBe, 'outData/brainNetViewer/shDeltaWB.edge', col_names = F)
write_tsv(shDeltaWBn, 'outData/brainNetViewer/shDeltaWB.node', col_names = F)
write_tsv(txDeltaWBe, 'outData/brainNetViewer/txDeltaWB.edge', col_names = F)
write_tsv(txDeltaWBn, 'outData/brainNetViewer/txDeltaWB.node', col_names = F)
