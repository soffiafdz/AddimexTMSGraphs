metrics <- c("E.global", "E.local", "density", "strength", "Cp", "Lp", "sigma")
metrics1 <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")


# CON -----------------------------------------------------------------------------------------

con_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(con0[i]), con0$VAS))
con_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(1:11), i]), con1[c(1:11), "VAS"]))
con_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(12:25), i]), con1[c(12:25), "VAS"]))

con0_rp_vas <- con1sh_rp_vas <- con1tx_rp_vas <- con0_rcor_vas <- 
    con1sh_rcor_vas <- con1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    con0_rp_vas[i] <- con_r0_test_vas[[i]][[3]]
    con1sh_rp_vas[i] <- con_r1sh_test_vas[[i]][[3]]
    con1tx_rp_vas[i] <- con_r1tx_test_vas[[i]][[3]]
    con0_rcor_vas[i] <- con_r0_test_vas[[i]][[4]]
    con1sh_rcor_vas[i] <- con_r1sh_test_vas[[i]][[4]]
    con1tx_rcor_vas[i] <- con_r1tx_test_vas[[i]][[4]]
}

con_cor_vas <- vector('list')
con_cor_vas <- tibble(unlist(c(con0_rcor_vas, con1sh_rcor_vas, con1tx_rcor_vas)), 
                      unlist(c(con0_rp_vas, con1sh_rp_vas, con1tx_rp_vas)))
names(con_cor_vas) <- c("r", "p")
con_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
con_cor_vas$Metrics <- rep(metrics, times = 3)
con_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
con_cor_vas <- con_cor_vas[c(3:5, 1:2)]


# DAN -----------------------------------------------------------------------------------------

dan_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dan0[i]), dan0$VAS))
dan_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(1:11), i]), dan1[c(1:11), "VAS"]))
dan_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(12:25), i]), dan1[c(12:25), "VAS"]))

dan0_rp_vas <- dan1sh_rp_vas <- dan1tx_rp_vas <- dan0_rcor_vas <- 
    dan1sh_rcor_vas <- dan1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    dan0_rp_vas[i] <- dan_r0_test_vas[[i]][[3]]
    dan1sh_rp_vas[i] <- dan_r1sh_test_vas[[i]][[3]]
    dan1tx_rp_vas[i] <- dan_r1tx_test_vas[[i]][[3]]
    dan0_rcor_vas[i] <- dan_r0_test_vas[[i]][[4]]
    dan1sh_rcor_vas[i] <- dan_r1sh_test_vas[[i]][[4]]
    dan1tx_rcor_vas[i] <- dan_r1tx_test_vas[[i]][[4]]
}

dan_cor_vas <- vector('list')
dan_cor_vas <- tibble(unlist(c(dan0_rcor_vas, dan1sh_rcor_vas, dan1tx_rcor_vas)), 
                      unlist(c(dan0_rp_vas, dan1sh_rp_vas, dan1tx_rp_vas)))
names(dan_cor_vas) <- c("r", "p")
dan_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dan_cor_vas$Metrics <- rep(metrics, times = 3)
dan_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dan_cor_vas <- dan_cor_vas[c(3:5, 1:2)]


# DMN -----------------------------------------------------------------------------------------

dmn_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dmn0[i]), dmn0$VAS))
dmn_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(1:11), i]), dmn1[c(1:11), "VAS"]))
dmn_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(12:25), i]), dmn1[c(12:25), "VAS"]))

dmn0_rp_vas <- dmn1sh_rp_vas <- dmn1tx_rp_vas <- dmn0_rcor_vas <- 
    dmn1sh_rcor_vas <- dmn1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    dmn0_rp_vas[i] <- dmn_r0_test_vas[[i]][[3]]
    dmn1sh_rp_vas[i] <- dmn_r1sh_test_vas[[i]][[3]]
    dmn1tx_rp_vas[i] <- dmn_r1tx_test_vas[[i]][[3]]
    dmn0_rcor_vas[i] <- dmn_r0_test_vas[[i]][[4]]
    dmn1sh_rcor_vas[i] <- dmn_r1sh_test_vas[[i]][[4]]
    dmn1tx_rcor_vas[i] <- dmn_r1tx_test_vas[[i]][[4]]
}

dmn_cor_vas <- vector('list')
dmn_cor_vas <- tibble(unlist(c(dmn0_rcor_vas, dmn1sh_rcor_vas, dmn1tx_rcor_vas)), 
                      unlist(c(dmn0_rp_vas, dmn1sh_rp_vas, dmn1tx_rp_vas)))
names(dmn_cor_vas) <- c("r", "p")
dmn_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dmn_cor_vas$Metrics <- rep(metrics, times = 3)
dmn_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dmn_cor_vas <- dmn_cor_vas[c(3:5, 1:2)]


# FPN -----------------------------------------------------------------------------------------

fpn_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(fpn0[i]), fpn0$VAS))
fpn_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(1:11), i]), fpn1[c(1:11), "VAS"]))
fpn_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(12:25), i]), fpn1[c(12:25), "VAS"]))

fpn0_rp_vas <- fpn1sh_rp_vas <- fpn1tx_rp_vas <- fpn0_rcor_vas <- 
    fpn1sh_rcor_vas <- fpn1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    fpn0_rp_vas[i] <- fpn_r0_test_vas[[i]][[3]]
    fpn1sh_rp_vas[i] <- fpn_r1sh_test_vas[[i]][[3]]
    fpn1tx_rp_vas[i] <- fpn_r1tx_test_vas[[i]][[3]]
    fpn0_rcor_vas[i] <- fpn_r0_test_vas[[i]][[4]]
    fpn1sh_rcor_vas[i] <- fpn_r1sh_test_vas[[i]][[4]]
    fpn1tx_rcor_vas[i] <- fpn_r1tx_test_vas[[i]][[4]]
}

fpn_cor_vas <- vector('list')
fpn_cor_vas <- tibble(unlist(c(fpn0_rcor_vas, fpn1sh_rcor_vas, fpn1tx_rcor_vas)), 
                      unlist(c(fpn0_rp_vas, fpn1sh_rp_vas, fpn1tx_rp_vas)))
names(fpn_cor_vas) <- c("r", "p")
fpn_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
fpn_cor_vas$Metrics <- rep(metrics, times = 3)
fpn_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
fpn_cor_vas <- fpn_cor_vas[c(3:5, 1:2)]


# SAL -----------------------------------------------------------------------------------------

sal_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sal0[i]), sal0$VAS))
sal_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(1:11), i]), sal1[c(1:11), "VAS"]))
sal_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(12:25), i]), sal1[c(12:25), "VAS"]))

sal0_rp_vas <- sal1sh_rp_vas <- sal1tx_rp_vas <- sal0_rcor_vas <- 
    sal1sh_rcor_vas <- sal1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    sal0_rp_vas[i] <- sal_r0_test_vas[[i]][[3]]
    sal1sh_rp_vas[i] <- sal_r1sh_test_vas[[i]][[3]]
    sal1tx_rp_vas[i] <- sal_r1tx_test_vas[[i]][[3]]
    sal0_rcor_vas[i] <- sal_r0_test_vas[[i]][[4]]
    sal1sh_rcor_vas[i] <- sal_r1sh_test_vas[[i]][[4]]
    sal1tx_rcor_vas[i] <- sal_r1tx_test_vas[[i]][[4]]
}

sal_cor_vas <- vector('list')
sal_cor_vas <- tibble(unlist(c(sal0_rcor_vas, sal1sh_rcor_vas, sal1tx_rcor_vas)), 
                      unlist(c(sal0_rp_vas, sal1sh_rp_vas, sal1tx_rp_vas)))
names(sal_cor_vas) <- c("r", "p")
sal_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sal_cor_vas$Metrics <- rep(metrics, times = 3)
sal_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sal_cor_vas <- sal_cor_vas[c(3:5, 1:2)]


# SUB -----------------------------------------------------------------------------------------

sub_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sub0[i]), sub0$VAS))
sub_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(1:11), i]), sub1[c(1:11), "VAS"]))
sub_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(12:25), i]), sub1[c(12:25), "VAS"]))

sub0_rp_vas <- sub1sh_rp_vas <- sub1tx_rp_vas <- sub0_rcor_vas <- 
    sub1sh_rcor_vas <- sub1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    sub0_rp_vas[i] <- sub_r0_test_vas[[i]][[3]]
    sub1sh_rp_vas[i] <- sub_r1sh_test_vas[[i]][[3]]
    sub1tx_rp_vas[i] <- sub_r1tx_test_vas[[i]][[3]]
    sub0_rcor_vas[i] <- sub_r0_test_vas[[i]][[4]]
    sub1sh_rcor_vas[i] <- sub_r1sh_test_vas[[i]][[4]]
    sub1tx_rcor_vas[i] <- sub_r1tx_test_vas[[i]][[4]]
}

sub_cor_vas <- vector('list')
sub_cor_vas <- tibble(unlist(c(sub0_rcor_vas, sub1sh_rcor_vas, sub1tx_rcor_vas)), 
                      unlist(c(sub0_rp_vas, sub1sh_rp_vas, sub1tx_rp_vas)))
names(sub_cor_vas) <- c("r", "p")
sub_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sub_cor_vas$Metrics <- rep(metrics, times = 3)
sub_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sub_cor_vas <- sub_cor_vas[c(3:5, 1:2)]


# VAN -----------------------------------------------------------------------------------------

van_r0_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(van0[i]), van0$VAS))
van_r1sh_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(1:11), i]), van1[c(1:11), "VAS"]))
van_r1tx_test_vas <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(12:25), i]), van1[c(12:25), "VAS"]))

van0_rp_vas <- van1sh_rp_vas <- van1tx_rp_vas <- van0_rcor_vas <- 
    van1sh_rcor_vas <- van1tx_rcor_vas <- vector("list", length = 1)

for (i in 1:7){
    van0_rp_vas[i] <- van_r0_test_vas[[i]][[3]]
    van1sh_rp_vas[i] <- van_r1sh_test_vas[[i]][[3]]
    van1tx_rp_vas[i] <- van_r1tx_test_vas[[i]][[3]]
    van0_rcor_vas[i] <- van_r0_test_vas[[i]][[4]]
    van1sh_rcor_vas[i] <- van_r1sh_test_vas[[i]][[4]]
    van1tx_rcor_vas[i] <- van_r1tx_test_vas[[i]][[4]]
}

van_cor_vas <- vector('list')
van_cor_vas <- tibble(unlist(c(van0_rcor_vas, van1sh_rcor_vas, van1tx_rcor_vas)), 
                      unlist(c(van0_rp_vas, van1sh_rp_vas, van1tx_rp_vas)))
names(van_cor_vas) <- c("r", "p")
van_cor_vas$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
van_cor_vas$Metrics <- rep(metrics, times = 3)
van_cor_vas$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
van_cor_vas <- van_cor_vas[c(3:5, 1:2)]


#Correlation test - Networks  ----------------
vas_corrs <- rbind(con_cor_vas, dan_cor_vas, dmn_cor_vas, fpn_cor_vas, 
                   sal_cor_vas, sub_cor_vas, van_cor_vas)
vas_corrs$Network <- rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN"), each = 21)
vas_corrs <- vas_corrs[c(6, 1:5)]
    