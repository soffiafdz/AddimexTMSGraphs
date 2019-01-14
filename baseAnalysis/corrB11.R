##BIS11 - Cognitive

# CON - B11C ----------------------------------------------------------------------------------

con_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(con0[i]), con0$B11_C))
con_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(1:11), i]), con1[c(1:11), "B11_C"]))
con_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(12:25), i]), con1[c(12:25), "B11_C"]))

con0_rp_b11c <- con1sh_rp_b11c <- con1tx_rp_b11c <- con0_rcor_b11c <- 
    con1sh_rcor_b11c <- con1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    con0_rp_b11c[i] <- con_r0_test_b11c[[i]][[3]]
    con1sh_rp_b11c[i] <- con_r1sh_test_b11c[[i]][[3]]
    con1tx_rp_b11c[i] <- con_r1tx_test_b11c[[i]][[3]]
    con0_rcor_b11c[i] <- con_r0_test_b11c[[i]][[4]]
    con1sh_rcor_b11c[i] <- con_r1sh_test_b11c[[i]][[4]]
    con1tx_rcor_b11c[i] <- con_r1tx_test_b11c[[i]][[4]]
}

con_cor_b11c <- vector('list')
con_cor_b11c <- tibble(unlist(c(con0_rcor_b11c, con1sh_rcor_b11c, con1tx_rcor_b11c)), 
                       unlist(c(con0_rp_b11c, con1sh_rp_b11c, con1tx_rp_b11c)))
names(con_cor_b11c) <- c("r", "p")
con_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
con_cor_b11c$Metrics <- rep(metrics, times = 3)
con_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
con_cor_b11c <- con_cor_b11c[c(3:5, 1:2)]


# DAN - B11C ----------------------------------------------------------------------------------

dan_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dan0[i]), dan0$B11_C))
dan_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(1:11), i]), dan1[c(1:11), "B11_C"]))
dan_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(12:25), i]), dan1[c(12:25), "B11_C"]))

dan0_rp_b11c <- dan1sh_rp_b11c <- dan1tx_rp_b11c <- dan0_rcor_b11c <- 
    dan1sh_rcor_b11c <- dan1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    dan0_rp_b11c[i] <- dan_r0_test_b11c[[i]][[3]]
    dan1sh_rp_b11c[i] <- dan_r1sh_test_b11c[[i]][[3]]
    dan1tx_rp_b11c[i] <- dan_r1tx_test_b11c[[i]][[3]]
    dan0_rcor_b11c[i] <- dan_r0_test_b11c[[i]][[4]]
    dan1sh_rcor_b11c[i] <- dan_r1sh_test_b11c[[i]][[4]]
    dan1tx_rcor_b11c[i] <- dan_r1tx_test_b11c[[i]][[4]]
}

dan_cor_b11c <- vector('list')
dan_cor_b11c <- tibble(unlist(c(dan0_rcor_b11c, dan1sh_rcor_b11c, dan1tx_rcor_b11c)), 
                       unlist(c(dan0_rp_b11c, dan1sh_rp_b11c, dan1tx_rp_b11c)))
names(dan_cor_b11c) <- c("r", "p")
dan_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dan_cor_b11c$Metrics <- rep(metrics, times = 3)
dan_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dan_cor_b11c <- dan_cor_b11c[c(3:5, 1:2)]


# DMN - B11C ----------------------------------------------------------------------------------

dmn_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dmn0[i]), dmn0$B11_C))
dmn_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(1:11), i]), dmn1[c(1:11), "B11_C"]))
dmn_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(12:25), i]), dmn1[c(12:25), "B11_C"]))

dmn0_rp_b11c <- dmn1sh_rp_b11c <- dmn1tx_rp_b11c <- dmn0_rcor_b11c <- 
    dmn1sh_rcor_b11c <- dmn1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    dmn0_rp_b11c[i] <- dmn_r0_test_b11c[[i]][[3]]
    dmn1sh_rp_b11c[i] <- dmn_r1sh_test_b11c[[i]][[3]]
    dmn1tx_rp_b11c[i] <- dmn_r1tx_test_b11c[[i]][[3]]
    dmn0_rcor_b11c[i] <- dmn_r0_test_b11c[[i]][[4]]
    dmn1sh_rcor_b11c[i] <- dmn_r1sh_test_b11c[[i]][[4]]
    dmn1tx_rcor_b11c[i] <- dmn_r1tx_test_b11c[[i]][[4]]
}

dmn_cor_b11c <- vector('list')
dmn_cor_b11c <- tibble(unlist(c(dmn0_rcor_b11c, dmn1sh_rcor_b11c, dmn1tx_rcor_b11c)), 
                       unlist(c(dmn0_rp_b11c, dmn1sh_rp_b11c, dmn1tx_rp_b11c)))
names(dmn_cor_b11c) <- c("r", "p")
dmn_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dmn_cor_b11c$Metrics <- rep(metrics, times = 3)
dmn_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dmn_cor_b11c <- dmn_cor_b11c[c(3:5, 1:2)]


# FPN - B11C ----------------------------------------------------------------------------------

fpn_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(fpn0[i]), fpn0$B11_C))
fpn_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(1:11), i]), fpn1[c(1:11), "B11_C"]))
fpn_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(12:25), i]), fpn1[c(12:25), "B11_C"]))

fpn0_rp_b11c <- fpn1sh_rp_b11c <- fpn1tx_rp_b11c <- fpn0_rcor_b11c <- 
    fpn1sh_rcor_b11c <- fpn1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    fpn0_rp_b11c[i] <- fpn_r0_test_b11c[[i]][[3]]
    fpn1sh_rp_b11c[i] <- fpn_r1sh_test_b11c[[i]][[3]]
    fpn1tx_rp_b11c[i] <- fpn_r1tx_test_b11c[[i]][[3]]
    fpn0_rcor_b11c[i] <- fpn_r0_test_b11c[[i]][[4]]
    fpn1sh_rcor_b11c[i] <- fpn_r1sh_test_b11c[[i]][[4]]
    fpn1tx_rcor_b11c[i] <- fpn_r1tx_test_b11c[[i]][[4]]
}

fpn_cor_b11c <- vector('list')
fpn_cor_b11c <- tibble(unlist(c(fpn0_rcor_b11c, fpn1sh_rcor_b11c, fpn1tx_rcor_b11c)), 
                       unlist(c(fpn0_rp_b11c, fpn1sh_rp_b11c, fpn1tx_rp_b11c)))
names(fpn_cor_b11c) <- c("r", "p")
fpn_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
fpn_cor_b11c$Metrics <- rep(metrics, times = 3)
fpn_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
fpn_cor_b11c <- fpn_cor_b11c[c(3:5, 1:2)]


# SAL - B11C ----------------------------------------------------------------------------------

sal_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sal0[i]), sal0$B11_C))
sal_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(1:11), i]), sal1[c(1:11), "B11_C"]))
sal_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(12:25), i]), sal1[c(12:25), "B11_C"]))

sal0_rp_b11c <- sal1sh_rp_b11c <- sal1tx_rp_b11c <- sal0_rcor_b11c <- 
    sal1sh_rcor_b11c <- sal1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    sal0_rp_b11c[i] <- sal_r0_test_b11c[[i]][[3]]
    sal1sh_rp_b11c[i] <- sal_r1sh_test_b11c[[i]][[3]]
    sal1tx_rp_b11c[i] <- sal_r1tx_test_b11c[[i]][[3]]
    sal0_rcor_b11c[i] <- sal_r0_test_b11c[[i]][[4]]
    sal1sh_rcor_b11c[i] <- sal_r1sh_test_b11c[[i]][[4]]
    sal1tx_rcor_b11c[i] <- sal_r1tx_test_b11c[[i]][[4]]
}

sal_cor_b11c <- vector('list')
sal_cor_b11c <- tibble(unlist(c(sal0_rcor_b11c, sal1sh_rcor_b11c, sal1tx_rcor_b11c)), 
                       unlist(c(sal0_rp_b11c, sal1sh_rp_b11c, sal1tx_rp_b11c)))
names(sal_cor_b11c) <- c("r", "p")
sal_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sal_cor_b11c$Metrics <- rep(metrics, times = 3)
sal_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sal_cor_b11c <- sal_cor_b11c[c(3:5, 1:2)]


# SUB - B11C ----------------------------------------------------------------------------------

sub_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sub0[i]), sub0$B11_C))
sub_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(1:11), i]), sub1[c(1:11), "B11_C"]))
sub_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(12:25), i]), sub1[c(12:25), "B11_C"]))

sub0_rp_b11c <- sub1sh_rp_b11c <- sub1tx_rp_b11c <- sub0_rcor_b11c <- 
    sub1sh_rcor_b11c <- sub1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    sub0_rp_b11c[i] <- sub_r0_test_b11c[[i]][[3]]
    sub1sh_rp_b11c[i] <- sub_r1sh_test_b11c[[i]][[3]]
    sub1tx_rp_b11c[i] <- sub_r1tx_test_b11c[[i]][[3]]
    sub0_rcor_b11c[i] <- sub_r0_test_b11c[[i]][[4]]
    sub1sh_rcor_b11c[i] <- sub_r1sh_test_b11c[[i]][[4]]
    sub1tx_rcor_b11c[i] <- sub_r1tx_test_b11c[[i]][[4]]
}

sub_cor_b11c <- vector('list')
sub_cor_b11c <- tibble(unlist(c(sub0_rcor_b11c, sub1sh_rcor_b11c, sub1tx_rcor_b11c)), 
                       unlist(c(sub0_rp_b11c, sub1sh_rp_b11c, sub1tx_rp_b11c)))
names(sub_cor_b11c) <- c("r", "p")
sub_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sub_cor_b11c$Metrics <- rep(metrics, times = 3)
sub_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sub_cor_b11c <- sub_cor_b11c[c(3:5, 1:2)]


# VAN - B11C ----------------------------------------------------------------------------------

van_r0_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(van0[i]), van0$B11_C))
van_r1sh_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(1:11), i]), van1[c(1:11), "B11_C"]))
van_r1tx_test_b11c <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(12:25), i]), van1[c(12:25), "B11_C"]))

van0_rp_b11c <- van1sh_rp_b11c <- van1tx_rp_b11c <- van0_rcor_b11c <- 
    van1sh_rcor_b11c <- van1tx_rcor_b11c <- vector("list", length = 1)

for (i in 1:7){
    van0_rp_b11c[i] <- van_r0_test_b11c[[i]][[3]]
    van1sh_rp_b11c[i] <- van_r1sh_test_b11c[[i]][[3]]
    van1tx_rp_b11c[i] <- van_r1tx_test_b11c[[i]][[3]]
    van0_rcor_b11c[i] <- van_r0_test_b11c[[i]][[4]]
    van1sh_rcor_b11c[i] <- van_r1sh_test_b11c[[i]][[4]]
    van1tx_rcor_b11c[i] <- van_r1tx_test_b11c[[i]][[4]]
}

van_cor_b11c <- vector('list')
van_cor_b11c <- tibble(unlist(c(van0_rcor_b11c, van1sh_rcor_b11c, van1tx_rcor_b11c)), 
                       unlist(c(van0_rp_b11c, van1sh_rp_b11c, van1tx_rp_b11c)))
names(van_cor_b11c) <- c("r", "p")
van_cor_b11c$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
van_cor_b11c$Metrics <- rep(metrics, times = 3)
van_cor_b11c$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
van_cor_b11c <- van_cor_b11c[c(3:5, 1:2)]


##BIS11 - Motor

# CON - B11M ----------------------------------------------------------------------------------

con_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(con0[i]), con0$B11_M))
con_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(1:11), i]), con1[c(1:11), "B11_M"]))
con_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(12:25), i]), con1[c(12:25), "B11_M"]))

con0_rp_b11m <- con1sh_rp_b11m <- con1tx_rp_b11m <- con0_rcor_b11m <- 
    con1sh_rcor_b11m <- con1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    con0_rp_b11m[i] <- con_r0_test_b11m[[i]][[3]]
    con1sh_rp_b11m[i] <- con_r1sh_test_b11m[[i]][[3]]
    con1tx_rp_b11m[i] <- con_r1tx_test_b11m[[i]][[3]]
    con0_rcor_b11m[i] <- con_r0_test_b11m[[i]][[4]]
    con1sh_rcor_b11m[i] <- con_r1sh_test_b11m[[i]][[4]]
    con1tx_rcor_b11m[i] <- con_r1tx_test_b11m[[i]][[4]]
}

con_cor_b11m <- vector('list')
con_cor_b11m <- tibble(unlist(c(con0_rcor_b11m, con1sh_rcor_b11m, con1tx_rcor_b11m)), 
                       unlist(c(con0_rp_b11m, con1sh_rp_b11m, con1tx_rp_b11m)))
names(con_cor_b11m) <- c("r", "p")
con_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
con_cor_b11m$Metrics <- rep(metrics, times = 3)
con_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
con_cor_b11m <- con_cor_b11m[c(3:5, 1:2)]


# DAN - B11M ----------------------------------------------------------------------------------

dan_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dan0[i]), dan0$B11_M))
dan_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(1:11), i]), dan1[c(1:11), "B11_M"]))
dan_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(12:25), i]), dan1[c(12:25), "B11_M"]))

dan0_rp_b11m <- dan1sh_rp_b11m <- dan1tx_rp_b11m <- dan0_rcor_b11m <- 
    dan1sh_rcor_b11m <- dan1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    dan0_rp_b11m[i] <- dan_r0_test_b11m[[i]][[3]]
    dan1sh_rp_b11m[i] <- dan_r1sh_test_b11m[[i]][[3]]
    dan1tx_rp_b11m[i] <- dan_r1tx_test_b11m[[i]][[3]]
    dan0_rcor_b11m[i] <- dan_r0_test_b11m[[i]][[4]]
    dan1sh_rcor_b11m[i] <- dan_r1sh_test_b11m[[i]][[4]]
    dan1tx_rcor_b11m[i] <- dan_r1tx_test_b11m[[i]][[4]]
}

dan_cor_b11m <- vector('list')
dan_cor_b11m <- tibble(unlist(c(dan0_rcor_b11m, dan1sh_rcor_b11m, dan1tx_rcor_b11m)), 
                       unlist(c(dan0_rp_b11m, dan1sh_rp_b11m, dan1tx_rp_b11m)))
names(dan_cor_b11m) <- c("r", "p")
dan_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dan_cor_b11m$Metrics <- rep(metrics, times = 3)
dan_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dan_cor_b11m <- dan_cor_b11m[c(3:5, 1:2)]


# DMN - B11M ----------------------------------------------------------------------------------

dmn_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dmn0[i]), dmn0$B11_M))
dmn_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(1:11), i]), dmn1[c(1:11), "B11_M"]))
dmn_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(12:25), i]), dmn1[c(12:25), "B11_M"]))

dmn0_rp_b11m <- dmn1sh_rp_b11m <- dmn1tx_rp_b11m <- dmn0_rcor_b11m <- 
    dmn1sh_rcor_b11m <- dmn1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    dmn0_rp_b11m[i] <- dmn_r0_test_b11m[[i]][[3]]
    dmn1sh_rp_b11m[i] <- dmn_r1sh_test_b11m[[i]][[3]]
    dmn1tx_rp_b11m[i] <- dmn_r1tx_test_b11m[[i]][[3]]
    dmn0_rcor_b11m[i] <- dmn_r0_test_b11m[[i]][[4]]
    dmn1sh_rcor_b11m[i] <- dmn_r1sh_test_b11m[[i]][[4]]
    dmn1tx_rcor_b11m[i] <- dmn_r1tx_test_b11m[[i]][[4]]
}

dmn_cor_b11m <- vector('list')
dmn_cor_b11m <- tibble(unlist(c(dmn0_rcor_b11m, dmn1sh_rcor_b11m, dmn1tx_rcor_b11m)), 
                       unlist(c(dmn0_rp_b11m, dmn1sh_rp_b11m, dmn1tx_rp_b11m)))
names(dmn_cor_b11m) <- c("r", "p")
dmn_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dmn_cor_b11m$Metrics <- rep(metrics, times = 3)
dmn_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dmn_cor_b11m <- dmn_cor_b11m[c(3:5, 1:2)]


# FPN - B11M ----------------------------------------------------------------------------------

fpn_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(fpn0[i]), fpn0$B11_M))
fpn_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(1:11), i]), fpn1[c(1:11), "B11_M"]))
fpn_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(12:25), i]), fpn1[c(12:25), "B11_M"]))

fpn0_rp_b11m <- fpn1sh_rp_b11m <- fpn1tx_rp_b11m <- fpn0_rcor_b11m <- 
    fpn1sh_rcor_b11m <- fpn1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    fpn0_rp_b11m[i] <- fpn_r0_test_b11m[[i]][[3]]
    fpn1sh_rp_b11m[i] <- fpn_r1sh_test_b11m[[i]][[3]]
    fpn1tx_rp_b11m[i] <- fpn_r1tx_test_b11m[[i]][[3]]
    fpn0_rcor_b11m[i] <- fpn_r0_test_b11m[[i]][[4]]
    fpn1sh_rcor_b11m[i] <- fpn_r1sh_test_b11m[[i]][[4]]
    fpn1tx_rcor_b11m[i] <- fpn_r1tx_test_b11m[[i]][[4]]
}

fpn_cor_b11m <- vector('list')
fpn_cor_b11m <- tibble(unlist(c(fpn0_rcor_b11m, fpn1sh_rcor_b11m, fpn1tx_rcor_b11m)), 
                       unlist(c(fpn0_rp_b11m, fpn1sh_rp_b11m, fpn1tx_rp_b11m)))
names(fpn_cor_b11m) <- c("r", "p")
fpn_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
fpn_cor_b11m$Metrics <- rep(metrics, times = 3)
fpn_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
fpn_cor_b11m <- fpn_cor_b11m[c(3:5, 1:2)]


# SAL - B11M ----------------------------------------------------------------------------------

sal_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sal0[i]), sal0$B11_M))
sal_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(1:11), i]), sal1[c(1:11), "B11_M"]))
sal_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(12:25), i]), sal1[c(12:25), "B11_M"]))

sal0_rp_b11m <- sal1sh_rp_b11m <- sal1tx_rp_b11m <- sal0_rcor_b11m <- 
    sal1sh_rcor_b11m <- sal1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    sal0_rp_b11m[i] <- sal_r0_test_b11m[[i]][[3]]
    sal1sh_rp_b11m[i] <- sal_r1sh_test_b11m[[i]][[3]]
    sal1tx_rp_b11m[i] <- sal_r1tx_test_b11m[[i]][[3]]
    sal0_rcor_b11m[i] <- sal_r0_test_b11m[[i]][[4]]
    sal1sh_rcor_b11m[i] <- sal_r1sh_test_b11m[[i]][[4]]
    sal1tx_rcor_b11m[i] <- sal_r1tx_test_b11m[[i]][[4]]
}

sal_cor_b11m <- vector('list')
sal_cor_b11m <- tibble(unlist(c(sal0_rcor_b11m, sal1sh_rcor_b11m, sal1tx_rcor_b11m)), 
                       unlist(c(sal0_rp_b11m, sal1sh_rp_b11m, sal1tx_rp_b11m)))
names(sal_cor_b11m) <- c("r", "p")
sal_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sal_cor_b11m$Metrics <- rep(metrics, times = 3)
sal_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sal_cor_b11m <- sal_cor_b11m[c(3:5, 1:2)]


# SUB - B11M ----------------------------------------------------------------------------------

sub_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sub0[i]), sub0$B11_M))
sub_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(1:11), i]), sub1[c(1:11), "B11_M"]))
sub_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(12:25), i]), sub1[c(12:25), "B11_M"]))

sub0_rp_b11m <- sub1sh_rp_b11m <- sub1tx_rp_b11m <- sub0_rcor_b11m <- 
    sub1sh_rcor_b11m <- sub1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    sub0_rp_b11m[i] <- sub_r0_test_b11m[[i]][[3]]
    sub1sh_rp_b11m[i] <- sub_r1sh_test_b11m[[i]][[3]]
    sub1tx_rp_b11m[i] <- sub_r1tx_test_b11m[[i]][[3]]
    sub0_rcor_b11m[i] <- sub_r0_test_b11m[[i]][[4]]
    sub1sh_rcor_b11m[i] <- sub_r1sh_test_b11m[[i]][[4]]
    sub1tx_rcor_b11m[i] <- sub_r1tx_test_b11m[[i]][[4]]
}

sub_cor_b11m <- vector('list')
sub_cor_b11m <- tibble(unlist(c(sub0_rcor_b11m, sub1sh_rcor_b11m, sub1tx_rcor_b11m)), 
                       unlist(c(sub0_rp_b11m, sub1sh_rp_b11m, sub1tx_rp_b11m)))
names(sub_cor_b11m) <- c("r", "p")
sub_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sub_cor_b11m$Metrics <- rep(metrics, times = 3)
sub_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sub_cor_b11m <- sub_cor_b11m[c(3:5, 1:2)]


# VAN - B11M ----------------------------------------------------------------------------------

van_r0_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(van0[i]), van0$B11_M))
van_r1sh_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(1:11), i]), van1[c(1:11), "B11_M"]))
van_r1tx_test_b11m <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(12:25), i]), van1[c(12:25), "B11_M"]))

van0_rp_b11m <- van1sh_rp_b11m <- van1tx_rp_b11m <- van0_rcor_b11m <- 
    van1sh_rcor_b11m <- van1tx_rcor_b11m <- vector("list", length = 1)

for (i in 1:7){
    van0_rp_b11m[i] <- van_r0_test_b11m[[i]][[3]]
    van1sh_rp_b11m[i] <- van_r1sh_test_b11m[[i]][[3]]
    van1tx_rp_b11m[i] <- van_r1tx_test_b11m[[i]][[3]]
    van0_rcor_b11m[i] <- van_r0_test_b11m[[i]][[4]]
    van1sh_rcor_b11m[i] <- van_r1sh_test_b11m[[i]][[4]]
    van1tx_rcor_b11m[i] <- van_r1tx_test_b11m[[i]][[4]]
}

van_cor_b11m <- vector('list')
van_cor_b11m <- tibble(unlist(c(van0_rcor_b11m, van1sh_rcor_b11m, van1tx_rcor_b11m)), 
                       unlist(c(van0_rp_b11m, van1sh_rp_b11m, van1tx_rp_b11m)))
names(van_cor_b11m) <- c("r", "p")
van_cor_b11m$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
van_cor_b11m$Metrics <- rep(metrics, times = 3)
van_cor_b11m$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
van_cor_b11m <- van_cor_b11m[c(3:5, 1:2)]

##BIS11 - Non planning

# CON - B11NP ---------------------------------------------------------------------------------

con_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(con0[i]), con0$B11_NP))
con_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(1:11), i]), con1[c(1:11), "B11_NP"]))
con_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(12:25), i]), con1[c(12:25), "B11_NP"]))

con0_rp_b11n <- con1sh_rp_b11n <- con1tx_rp_b11n <- con0_rcor_b11n <- 
    con1sh_rcor_b11n <- con1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    con0_rp_b11n[i] <- con_r0_test_b11n[[i]][[3]]
    con1sh_rp_b11n[i] <- con_r1sh_test_b11n[[i]][[3]]
    con1tx_rp_b11n[i] <- con_r1tx_test_b11n[[i]][[3]]
    con0_rcor_b11n[i] <- con_r0_test_b11n[[i]][[4]]
    con1sh_rcor_b11n[i] <- con_r1sh_test_b11n[[i]][[4]]
    con1tx_rcor_b11n[i] <- con_r1tx_test_b11n[[i]][[4]]
}

con_cor_b11n <- vector('list')
con_cor_b11n <- tibble(unlist(c(con0_rcor_b11n, con1sh_rcor_b11n, con1tx_rcor_b11n)), 
                       unlist(c(con0_rp_b11n, con1sh_rp_b11n, con1tx_rp_b11n)))
names(con_cor_b11n) <- c("r", "p")
con_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
con_cor_b11n$Metrics <- rep(metrics, times = 3)
con_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
con_cor_b11n <- con_cor_b11n[c(3:5, 1:2)]


# DAN - B11NP ---------------------------------------------------------------------------------

dan_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dan0[i]), dan0$B11_NP))
dan_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(1:11), i]), dan1[c(1:11), "B11_NP"]))
dan_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(12:25), i]), dan1[c(12:25), "B11_NP"]))

dan0_rp_b11n <- dan1sh_rp_b11n <- dan1tx_rp_b11n <- dan0_rcor_b11n <- 
    dan1sh_rcor_b11n <- dan1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    dan0_rp_b11n[i] <- dan_r0_test_b11n[[i]][[3]]
    dan1sh_rp_b11n[i] <- dan_r1sh_test_b11n[[i]][[3]]
    dan1tx_rp_b11n[i] <- dan_r1tx_test_b11n[[i]][[3]]
    dan0_rcor_b11n[i] <- dan_r0_test_b11n[[i]][[4]]
    dan1sh_rcor_b11n[i] <- dan_r1sh_test_b11n[[i]][[4]]
    dan1tx_rcor_b11n[i] <- dan_r1tx_test_b11n[[i]][[4]]
}

dan_cor_b11n <- vector('list')
dan_cor_b11n <- tibble(unlist(c(dan0_rcor_b11n, dan1sh_rcor_b11n, dan1tx_rcor_b11n)), 
                       unlist(c(dan0_rp_b11n, dan1sh_rp_b11n, dan1tx_rp_b11n)))
names(dan_cor_b11n) <- c("r", "p")
dan_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dan_cor_b11n$Metrics <- rep(metrics, times = 3)
dan_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dan_cor_b11n <- dan_cor_b11n[c(3:5, 1:2)]


# DMN - B11NP ---------------------------------------------------------------------------------

dmn_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dmn0[i]), dmn0$B11_NP))
dmn_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(1:11), i]), dmn1[c(1:11), "B11_NP"]))
dmn_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(12:25), i]), dmn1[c(12:25), "B11_NP"]))

dmn0_rp_b11n <- dmn1sh_rp_b11n <- dmn1tx_rp_b11n <- dmn0_rcor_b11n <- 
    dmn1sh_rcor_b11n <- dmn1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    dmn0_rp_b11n[i] <- dmn_r0_test_b11n[[i]][[3]]
    dmn1sh_rp_b11n[i] <- dmn_r1sh_test_b11n[[i]][[3]]
    dmn1tx_rp_b11n[i] <- dmn_r1tx_test_b11n[[i]][[3]]
    dmn0_rcor_b11n[i] <- dmn_r0_test_b11n[[i]][[4]]
    dmn1sh_rcor_b11n[i] <- dmn_r1sh_test_b11n[[i]][[4]]
    dmn1tx_rcor_b11n[i] <- dmn_r1tx_test_b11n[[i]][[4]]
}

dmn_cor_b11n <- vector('list')
dmn_cor_b11n <- tibble(unlist(c(dmn0_rcor_b11n, dmn1sh_rcor_b11n, dmn1tx_rcor_b11n)), 
                       unlist(c(dmn0_rp_b11n, dmn1sh_rp_b11n, dmn1tx_rp_b11n)))
names(dmn_cor_b11n) <- c("r", "p")
dmn_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dmn_cor_b11n$Metrics <- rep(metrics, times = 3)
dmn_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dmn_cor_b11n <- dmn_cor_b11n[c(3:5, 1:2)]


# FPN - B11NP ---------------------------------------------------------------------------------

fpn_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(fpn0[i]), fpn0$B11_NP))
fpn_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(1:11), i]), fpn1[c(1:11), "B11_NP"]))
fpn_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(12:25), i]), fpn1[c(12:25), "B11_NP"]))

fpn0_rp_b11n <- fpn1sh_rp_b11n <- fpn1tx_rp_b11n <- fpn0_rcor_b11n <- 
    fpn1sh_rcor_b11n <- fpn1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    fpn0_rp_b11n[i] <- fpn_r0_test_b11n[[i]][[3]]
    fpn1sh_rp_b11n[i] <- fpn_r1sh_test_b11n[[i]][[3]]
    fpn1tx_rp_b11n[i] <- fpn_r1tx_test_b11n[[i]][[3]]
    fpn0_rcor_b11n[i] <- fpn_r0_test_b11n[[i]][[4]]
    fpn1sh_rcor_b11n[i] <- fpn_r1sh_test_b11n[[i]][[4]]
    fpn1tx_rcor_b11n[i] <- fpn_r1tx_test_b11n[[i]][[4]]
}

fpn_cor_b11n <- vector('list')
fpn_cor_b11n <- tibble(unlist(c(fpn0_rcor_b11n, fpn1sh_rcor_b11n, fpn1tx_rcor_b11n)), 
                       unlist(c(fpn0_rp_b11n, fpn1sh_rp_b11n, fpn1tx_rp_b11n)))
names(fpn_cor_b11n) <- c("r", "p")
fpn_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
fpn_cor_b11n$Metrics <- rep(metrics, times = 3)
fpn_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
fpn_cor_b11n <- fpn_cor_b11n[c(3:5, 1:2)]


# SAL - B11NP ---------------------------------------------------------------------------------

sal_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sal0[i]), sal0$B11_NP))
sal_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(1:11), i]), sal1[c(1:11), "B11_NP"]))
sal_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(12:25), i]), sal1[c(12:25), "B11_NP"]))

sal0_rp_b11n <- sal1sh_rp_b11n <- sal1tx_rp_b11n <- sal0_rcor_b11n <- 
    sal1sh_rcor_b11n <- sal1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    sal0_rp_b11n[i] <- sal_r0_test_b11n[[i]][[3]]
    sal1sh_rp_b11n[i] <- sal_r1sh_test_b11n[[i]][[3]]
    sal1tx_rp_b11n[i] <- sal_r1tx_test_b11n[[i]][[3]]
    sal0_rcor_b11n[i] <- sal_r0_test_b11n[[i]][[4]]
    sal1sh_rcor_b11n[i] <- sal_r1sh_test_b11n[[i]][[4]]
    sal1tx_rcor_b11n[i] <- sal_r1tx_test_b11n[[i]][[4]]
}

sal_cor_b11n <- vector('list')
sal_cor_b11n <- tibble(unlist(c(sal0_rcor_b11n, sal1sh_rcor_b11n, sal1tx_rcor_b11n)), 
                       unlist(c(sal0_rp_b11n, sal1sh_rp_b11n, sal1tx_rp_b11n)))
names(sal_cor_b11n) <- c("r", "p")
sal_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sal_cor_b11n$Metrics <- rep(metrics, times = 3)
sal_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sal_cor_b11n <- sal_cor_b11n[c(3:5, 1:2)]


# SUB - B11NP ---------------------------------------------------------------------------------

sub_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sub0[i]), sub0$B11_NP))
sub_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(1:11), i]), sub1[c(1:11), "B11_NP"]))
sub_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(12:25), i]), sub1[c(12:25), "B11_NP"]))

sub0_rp_b11n <- sub1sh_rp_b11n <- sub1tx_rp_b11n <- sub0_rcor_b11n <- 
    sub1sh_rcor_b11n <- sub1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    sub0_rp_b11n[i] <- sub_r0_test_b11n[[i]][[3]]
    sub1sh_rp_b11n[i] <- sub_r1sh_test_b11n[[i]][[3]]
    sub1tx_rp_b11n[i] <- sub_r1tx_test_b11n[[i]][[3]]
    sub0_rcor_b11n[i] <- sub_r0_test_b11n[[i]][[4]]
    sub1sh_rcor_b11n[i] <- sub_r1sh_test_b11n[[i]][[4]]
    sub1tx_rcor_b11n[i] <- sub_r1tx_test_b11n[[i]][[4]]
}

sub_cor_b11n <- vector('list')
sub_cor_b11n <- tibble(unlist(c(sub0_rcor_b11n, sub1sh_rcor_b11n, sub1tx_rcor_b11n)), 
                       unlist(c(sub0_rp_b11n, sub1sh_rp_b11n, sub1tx_rp_b11n)))
names(sub_cor_b11n) <- c("r", "p")
sub_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sub_cor_b11n$Metrics <- rep(metrics, times = 3)
sub_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sub_cor_b11n <- sub_cor_b11n[c(3:5, 1:2)]


# VAN - B11NP ---------------------------------------------------------------------------------

van_r0_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(van0[i]), van0$B11_NP))
van_r1sh_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(1:11), i]), van1[c(1:11), "B11_NP"]))
van_r1tx_test_b11n <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(12:25), i]), van1[c(12:25), "B11_NP"]))

van0_rp_b11n <- van1sh_rp_b11n <- van1tx_rp_b11n <- van0_rcor_b11n <- 
    van1sh_rcor_b11n <- van1tx_rcor_b11n <- vector("list", length = 1)

for (i in 1:7){
    van0_rp_b11n[i] <- van_r0_test_b11n[[i]][[3]]
    van1sh_rp_b11n[i] <- van_r1sh_test_b11n[[i]][[3]]
    van1tx_rp_b11n[i] <- van_r1tx_test_b11n[[i]][[3]]
    van0_rcor_b11n[i] <- van_r0_test_b11n[[i]][[4]]
    van1sh_rcor_b11n[i] <- van_r1sh_test_b11n[[i]][[4]]
    van1tx_rcor_b11n[i] <- van_r1tx_test_b11n[[i]][[4]]
}

van_cor_b11n <- vector('list')
van_cor_b11n <- tibble(unlist(c(van0_rcor_b11n, van1sh_rcor_b11n, van1tx_rcor_b11n)), 
                       unlist(c(van0_rp_b11n, van1sh_rp_b11n, van1tx_rp_b11n)))
names(van_cor_b11n) <- c("r", "p")
van_cor_b11n$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
van_cor_b11n$Metrics <- rep(metrics, times = 3)
van_cor_b11n$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
van_cor_b11n <- van_cor_b11n[c(3:5, 1:2)]

##BIS11 - Total Score

# CON - B11T ----------------------------------------------------------------------------------

con_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(con0[i]), con0$B11_Tot))
con_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(1:11), i]), con1[c(1:11), "B11_Tot"]))
con_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(con1[c(12:25), i]), con1[c(12:25), "B11_Tot"]))

con0_rp_b11t <- con1sh_rp_b11t <- con1tx_rp_b11t <- con0_rcor_b11t <- 
    con1sh_rcor_b11t <- con1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    con0_rp_b11t[i] <- con_r0_test_b11t[[i]][[3]]
    con1sh_rp_b11t[i] <- con_r1sh_test_b11t[[i]][[3]]
    con1tx_rp_b11t[i] <- con_r1tx_test_b11t[[i]][[3]]
    con0_rcor_b11t[i] <- con_r0_test_b11t[[i]][[4]]
    con1sh_rcor_b11t[i] <- con_r1sh_test_b11t[[i]][[4]]
    con1tx_rcor_b11t[i] <- con_r1tx_test_b11t[[i]][[4]]
}

con_cor_b11t <- vector('list')
con_cor_b11t <- tibble(unlist(c(con0_rcor_b11t, con1sh_rcor_b11t, con1tx_rcor_b11t)), 
                       unlist(c(con0_rp_b11t, con1sh_rp_b11t, con1tx_rp_b11t)))
names(con_cor_b11t) <- c("r", "p")
con_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
con_cor_b11t$Metrics <- rep(metrics, times = 3)
con_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
con_cor_b11t <- con_cor_b11t[c(3:5, 1:2)]


# DAN - B11T ----------------------------------------------------------------------------------

dan_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dan0[i]), dan0$B11_Tot))
dan_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(1:11), i]), dan1[c(1:11), "B11_Tot"]))
dan_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dan1[c(12:25), i]), dan1[c(12:25), "B11_Tot"]))

dan0_rp_b11t <- dan1sh_rp_b11t <- dan1tx_rp_b11t <- dan0_rcor_b11t <- 
    dan1sh_rcor_b11t <- dan1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    dan0_rp_b11t[i] <- dan_r0_test_b11t[[i]][[3]]
    dan1sh_rp_b11t[i] <- dan_r1sh_test_b11t[[i]][[3]]
    dan1tx_rp_b11t[i] <- dan_r1tx_test_b11t[[i]][[3]]
    dan0_rcor_b11t[i] <- dan_r0_test_b11t[[i]][[4]]
    dan1sh_rcor_b11t[i] <- dan_r1sh_test_b11t[[i]][[4]]
    dan1tx_rcor_b11t[i] <- dan_r1tx_test_b11t[[i]][[4]]
}

dan_cor_b11t <- vector('list')
dan_cor_b11t <- tibble(unlist(c(dan0_rcor_b11t, dan1sh_rcor_b11t, dan1tx_rcor_b11t)), 
                       unlist(c(dan0_rp_b11t, dan1sh_rp_b11t, dan1tx_rp_b11t)))
names(dan_cor_b11t) <- c("r", "p")
dan_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dan_cor_b11t$Metrics <- rep(metrics, times = 3)
dan_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dan_cor_b11t <- dan_cor_b11t[c(3:5, 1:2)]


# DMN - B11T ----------------------------------------------------------------------------------

dmn_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dmn0[i]), dmn0$B11_Tot))
dmn_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(1:11), i]), dmn1[c(1:11), "B11_Tot"]))
dmn_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(dmn1[c(12:25), i]), dmn1[c(12:25), "B11_Tot"]))

dmn0_rp_b11t <- dmn1sh_rp_b11t <- dmn1tx_rp_b11t <- dmn0_rcor_b11t <- 
    dmn1sh_rcor_b11t <- dmn1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    dmn0_rp_b11t[i] <- dmn_r0_test_b11t[[i]][[3]]
    dmn1sh_rp_b11t[i] <- dmn_r1sh_test_b11t[[i]][[3]]
    dmn1tx_rp_b11t[i] <- dmn_r1tx_test_b11t[[i]][[3]]
    dmn0_rcor_b11t[i] <- dmn_r0_test_b11t[[i]][[4]]
    dmn1sh_rcor_b11t[i] <- dmn_r1sh_test_b11t[[i]][[4]]
    dmn1tx_rcor_b11t[i] <- dmn_r1tx_test_b11t[[i]][[4]]
}

dmn_cor_b11t <- vector('list')
dmn_cor_b11t <- tibble(unlist(c(dmn0_rcor_b11t, dmn1sh_rcor_b11t, dmn1tx_rcor_b11t)), 
                       unlist(c(dmn0_rp_b11t, dmn1sh_rp_b11t, dmn1tx_rp_b11t)))
names(dmn_cor_b11t) <- c("r", "p")
dmn_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
dmn_cor_b11t$Metrics <- rep(metrics, times = 3)
dmn_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
dmn_cor_b11t <- dmn_cor_b11t[c(3:5, 1:2)]


# FPN - B11T ----------------------------------------------------------------------------------

fpn_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(fpn0[i]), fpn0$B11_Tot))
fpn_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(1:11), i]), fpn1[c(1:11), "B11_Tot"]))
fpn_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(fpn1[c(12:25), i]), fpn1[c(12:25), "B11_Tot"]))

fpn0_rp_b11t <- fpn1sh_rp_b11t <- fpn1tx_rp_b11t <- fpn0_rcor_b11t <- 
    fpn1sh_rcor_b11t <- fpn1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    fpn0_rp_b11t[i] <- fpn_r0_test_b11t[[i]][[3]]
    fpn1sh_rp_b11t[i] <- fpn_r1sh_test_b11t[[i]][[3]]
    fpn1tx_rp_b11t[i] <- fpn_r1tx_test_b11t[[i]][[3]]
    fpn0_rcor_b11t[i] <- fpn_r0_test_b11t[[i]][[4]]
    fpn1sh_rcor_b11t[i] <- fpn_r1sh_test_b11t[[i]][[4]]
    fpn1tx_rcor_b11t[i] <- fpn_r1tx_test_b11t[[i]][[4]]
}

fpn_cor_b11t <- vector('list')
fpn_cor_b11t <- tibble(unlist(c(fpn0_rcor_b11t, fpn1sh_rcor_b11t, fpn1tx_rcor_b11t)), 
                       unlist(c(fpn0_rp_b11t, fpn1sh_rp_b11t, fpn1tx_rp_b11t)))
names(fpn_cor_b11t) <- c("r", "p")
fpn_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
fpn_cor_b11t$Metrics <- rep(metrics, times = 3)
fpn_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
fpn_cor_b11t <- fpn_cor_b11t[c(3:5, 1:2)]


# SAL - B11T ----------------------------------------------------------------------------------

sal_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sal0[i]), sal0$B11_Tot))
sal_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(1:11), i]), sal1[c(1:11), "B11_Tot"]))
sal_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sal1[c(12:25), i]), sal1[c(12:25), "B11_Tot"]))

sal0_rp_b11t <- sal1sh_rp_b11t <- sal1tx_rp_b11t <- sal0_rcor_b11t <- 
    sal1sh_rcor_b11t <- sal1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    sal0_rp_b11t[i] <- sal_r0_test_b11t[[i]][[3]]
    sal1sh_rp_b11t[i] <- sal_r1sh_test_b11t[[i]][[3]]
    sal1tx_rp_b11t[i] <- sal_r1tx_test_b11t[[i]][[3]]
    sal0_rcor_b11t[i] <- sal_r0_test_b11t[[i]][[4]]
    sal1sh_rcor_b11t[i] <- sal_r1sh_test_b11t[[i]][[4]]
    sal1tx_rcor_b11t[i] <- sal_r1tx_test_b11t[[i]][[4]]
}

sal_cor_b11t <- vector('list')
sal_cor_b11t <- tibble(unlist(c(sal0_rcor_b11t, sal1sh_rcor_b11t, sal1tx_rcor_b11t)), 
                       unlist(c(sal0_rp_b11t, sal1sh_rp_b11t, sal1tx_rp_b11t)))
names(sal_cor_b11t) <- c("r", "p")
sal_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sal_cor_b11t$Metrics <- rep(metrics, times = 3)
sal_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sal_cor_b11t <- sal_cor_b11t[c(3:5, 1:2)]


# SUB - B11T ----------------------------------------------------------------------------------

sub_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sub0[i]), sub0$B11_Tot))
sub_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(1:11), i]), sub1[c(1:11), "B11_Tot"]))
sub_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(sub1[c(12:25), i]), sub1[c(12:25), "B11_Tot"]))

sub0_rp_b11t <- sub1sh_rp_b11t <- sub1tx_rp_b11t <- sub0_rcor_b11t <- 
    sub1sh_rcor_b11t <- sub1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    sub0_rp_b11t[i] <- sub_r0_test_b11t[[i]][[3]]
    sub1sh_rp_b11t[i] <- sub_r1sh_test_b11t[[i]][[3]]
    sub1tx_rp_b11t[i] <- sub_r1tx_test_b11t[[i]][[3]]
    sub0_rcor_b11t[i] <- sub_r0_test_b11t[[i]][[4]]
    sub1sh_rcor_b11t[i] <- sub_r1sh_test_b11t[[i]][[4]]
    sub1tx_rcor_b11t[i] <- sub_r1tx_test_b11t[[i]][[4]]
}

sub_cor_b11t <- vector('list')
sub_cor_b11t <- tibble(unlist(c(sub0_rcor_b11t, sub1sh_rcor_b11t, sub1tx_rcor_b11t)), 
                       unlist(c(sub0_rp_b11t, sub1sh_rp_b11t, sub1tx_rp_b11t)))
names(sub_cor_b11t) <- c("r", "p")
sub_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
sub_cor_b11t$Metrics <- rep(metrics, times = 3)
sub_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
sub_cor_b11t <- sub_cor_b11t[c(3:5, 1:2)]


# VAN - B11T ----------------------------------------------------------------------------------

van_r0_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(van0[i]), van0$B11_Tot))
van_r1sh_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(1:11), i]), van1[c(1:11), "B11_Tot"]))
van_r1tx_test_b11t <- lapply(metrics, function(i) 
    cor.test(unlist(van1[c(12:25), i]), van1[c(12:25), "B11_Tot"]))

van0_rp_b11t <- van1sh_rp_b11t <- van1tx_rp_b11t <- van0_rcor_b11t <- 
    van1sh_rcor_b11t <- van1tx_rcor_b11t <- vector("list", length = 1)

for (i in 1:7){
    van0_rp_b11t[i] <- van_r0_test_b11t[[i]][[3]]
    van1sh_rp_b11t[i] <- van_r1sh_test_b11t[[i]][[3]]
    van1tx_rp_b11t[i] <- van_r1tx_test_b11t[[i]][[3]]
    van0_rcor_b11t[i] <- van_r0_test_b11t[[i]][[4]]
    van1sh_rcor_b11t[i] <- van_r1sh_test_b11t[[i]][[4]]
    van1tx_rcor_b11t[i] <- van_r1tx_test_b11t[[i]][[4]]
}

van_cor_b11t <- vector('list')
van_cor_b11t <- tibble(unlist(c(van0_rcor_b11t, van1sh_rcor_b11t, van1tx_rcor_b11t)), 
                       unlist(c(van0_rp_b11t, van1sh_rp_b11t, van1tx_rp_b11t)))
names(van_cor_b11t) <- c("r", "p")
van_cor_b11t$Stage <- c(rep.int("T0", 7), rep.int("T1", 14))
van_cor_b11t$Metrics <- rep(metrics, times = 3)
van_cor_b11t$Group <- c(rep(c(NA, "sham", "tx"), each = 7))
van_cor_b11t <- van_cor_b11t[c(3:5, 1:2)]

#Corr test - Total Networks  ----------------
b11c_corrs <- rbind(con_cor_b11c, dan_cor_b11c, dmn_cor_b11c, fpn_cor_b11c, sal_cor_b11c, sub_cor_b11c, van_cor_b11c)
b11c_corrs$Network <- rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN"), each = 21)
b11c_corrs <- b11c_corrs[c(6, 1:5)]

b11m_corrs <- rbind(con_cor_b11m, dan_cor_b11m, dmn_cor_b11m, fpn_cor_b11m, sal_cor_b11m, sub_cor_b11m, van_cor_b11m)
b11m_corrs$Network <- rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN"), each = 21)
b11m_corrs <- b11m_corrs[c(6, 1:5)]

b11n_corrs <- rbind(con_cor_b11n, dan_cor_b11n, dmn_cor_b11n, fpn_cor_b11n, sal_cor_b11n, sub_cor_b11n, van_cor_b11n)
b11n_corrs$Network <- rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN"), each = 21)
b11n_corrs <- b11n_corrs[c(6, 1:5)]

b11t_corrs <- rbind(con_cor_b11t, dan_cor_b11t, dmn_cor_b11t, fpn_cor_b11t, sal_cor_b11t, sub_cor_b11t, van_cor_b11t)
b11t_corrs$Network <- rep(c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN"), each = 21)
b11t_corrs <- b11t_corrs[c(6, 1:5)]

