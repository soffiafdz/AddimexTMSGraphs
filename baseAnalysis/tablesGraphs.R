
# Ctrl v Users --------------------------------------------------------------------------------
net_names <- c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN", "WB")
# metrics_names1 <- c("Global efficiency", "Local efficiency", "Density", "Strength",
# "Clustering coefficient", "Characteristic path length", "Small-worldness")
metrics_names <- c("EG", "EL", "D", "S", "CP", "LP", "Sigma")

vsTests <- vector("list", length = 2)
vsTests[[1]] <- c(vsCON[[1]], vsDAN[[1]], vsDMN[[1]], vsFPN[[1]], vsSAL[[1]], 
                 vsSUB[[1]], vsVAN[[1]], vsWB[[1]])
vsTests[[2]] <- c(vsCON[[2]], vsDAN[[2]], vsDMN[[2]], vsFPN[[2]], vsSAL[[2]], 
                 vsSUB[[2]], vsVAN[[2]], vsWB[[2]])
# head(vsTests[[1]] %>% map_dbl(1)) #t
# head(vsTests[[1]] %>% map_dbl(2)) #df
# head(vsTests[[1]] %>% map_dbl(3)) #p
# head(vsTests[[1]] %>% map(5) %>% map_dbl(1)) #mean_ctrl
# head(vsTests[[1]] %>% map(5) %>% map_dbl(1)) #mean_user
# head(vsTests[[2]] %>% map_dbl(3)) # cohen's d

vsTestDf <- data_frame(net = c(rep(net_names[1:6], each = 7),
                               rep(net_names[7], 6),
                               rep(net_names[8], 7)),
                       metric = c(rep(metrics_names, times = 6),
                                  metrics_names[1:6],
                                  metrics_names),
                       t = vsTests[[1]] %>% map_dbl(1),
                       df = vsTests[[1]] %>% map_dbl(2),
                       meanCtrl = vsTests[[1]] %>% map(5) %>% map_dbl(1),
                       meanUsr = vsTests[[1]] %>% map(5) %>% map_dbl(2),
                       d = vsTests[[2]] %>% map_dbl(3),
                       p = vsTests[[1]] %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()


# write_csv(vsTestDf, "outData/tables/vsTestDf.csv")



# Anovas --------------------------------------------------------------------------------------



aovs <- c(aovCON, aovDAN, aovDMN, aovFPN, aovSAL, aovSUB, aovVAN, aovWB)
# p <- aovs %>% map(1) %>% map(6) %>% map_dbl(3)
# head(aovs %>% map(1) %>% map(6))
# map(p, p.adjust, method = "fdr")

aovDf <- data_frame(net = rep(net_names, each = 7),
                    metric = rep(metrics_names, times = 8),
                    stat_gr = aovs %>% map(1) %>% map(4) %>% map_dbl(1),
                    df_gr = rep('1, 25', 56),
                    ges_gr = aovs %>% map(1) %>% map(5) %>% map_dbl(1),
                    p_gr = aovs %>% map(1) %>% map(6) %>% map_dbl(1),
                    stat_st = aovs %>% map(1) %>% map(4) %>% map_dbl(2),
                    df_st = rep('1, 25', 56),
                    ges_st = aovs %>% map(1) %>% map(5) %>% map_dbl(2),
                    p_st = aovs %>% map(1) %>% map(6) %>% map_dbl(2),
                    stat_int = aovs %>% map(1) %>% map(4) %>% map_dbl(3),
                    df_int = rep('1, 25', 56),
                    ges_int = aovs %>% map(1) %>% map(5) %>% map_dbl(3),
                    p_int = aovs %>% map(1) %>% map(6) %>% map_dbl(3)) %>% 
    mutate(p_gr_fdr = p.adjust(p_gr, method = "fdr"),
           p_st_fdr = p.adjust(p_st, method = "fdr"),
           p_int_fdr = p.adjust(p_int, method = "fdr"),
           p_gr_bonf = p.adjust(p_gr, method = "bonferroni"),
           p_st_bonf = p.adjust(p_st, method = "bonferroni"),
           p_int_bonf = p.adjust(p_int, method = "bonferroni")) %>% data.table()

write_csv(aovDf, "outData/tables/aovDf.csv")
# saveRDS(aov_df, "~/Desktop/aov_df.RDS")


# Pre-post Real treatment ---------------------------------------------------------------------

tTests <- vector("list", length = 2)
    tTests[[1]] <- c(txCON[[1]], txDAN[[1]], txDMN[[1]], txFPN[[1]], txSAL[[1]], 
                     txSUB[[1]], txVAN[[1]], txWB[[1]])
    tTests[[2]] <- c(txCON[[2]], txDAN[[2]], txDMN[[2]], txFPN[[2]], txSAL[[2]], 
                     txSUB[[2]], txVAN[[2]], txWB[[2]])
head(tTests[[1]] %>% map_dbl(1)) #t
head(tTests[[1]] %>% map_dbl(2)) #df
head(tTests[[1]] %>% map_dbl(3)) #p
head(tTests[[1]] %>% map_dbl(5)) #mean_diff
head(tTests[[2]] %>% map_dbl(3)) # cohen's d

tTestDf <- data_frame(net = rep(net_names, each = 7),
                      metric = rep(metrics_names, times = 8),
                      t = tTests[[1]] %>% map_dbl(1),
                      df = tTests[[1]] %>% map_dbl(2),
                      mean_diff = tTests[[1]] %>% map_dbl(5),
                      d = tTests[[2]] %>% map_dbl(3),
                      p = tTests[[1]] %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()


write_csv(tTestDf, "outData/tables/tTestDf.csv")
# saveRDS(tTestDf, "~/Desktop/t_df1.RDS")

# Longitudinal --------------------------------------------------------------------------------

longTests <- vector("list", length = 2)
    longTests[[1]] <- c(lCON[[1]], lDAN[[1]], lDMN[[1]], lFPN[[1]], lSAL[[1]], 
                        lSUB[[1]], lVAN[[1]], lWB[[1]])
    longTests[[2]] <- c(lCON[[2]], lDAN[[2]], lDMN[[2]], lFPN[[2]], lSAL[[2]], 
                        lSUB[[2]], lVAN[[2]], lWB[[2]])

# head(longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(1)) #df Stage
# head(longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(2)) #df Resids
# head(longTests[[1]] %>% map(1) %>% map(4) %>% map_dbl(1)) #F stat
# head(longTests[[1]] %>% map(1) %>% map(5) %>% map_dbl(1)) #p
# head(longTests[[2]] %>% map(1) %>% map(1)) #diff t1-t0
# head(longTests[[2]] %>% map(1) %>% map(2)) #diff t2-t0
# head(longTests[[2]] %>% map(1) %>% map(3)) #diff t2-t1
# head(longTests[[2]] %>% map(1) %>% map(10)) #p t1-t0
# head(longTests[[2]] %>% map(1) %>% map(11)) #p t2-t0
# head(longTests[[2]] %>% map(1) %>% map(12)) #p t2-t1

longTestDf <- data_frame(net = rep(net_names, each = 7),
                        metric = rep(metrics_names, times = 8),
                        f_stat = longTests[[1]] %>% map(1) %>% map(4) %>% map_dbl(1),
                        df_1 = longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(1),
                        df_2 = longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(2),
                        p = longTests[[1]] %>% map(1) %>% map(5) %>% map_dbl(1),
                        diff_t1_t0 = unlist(longTests[[2]] %>% map(1) %>% map(1)),
                        diff_t2_t0 = unlist(longTests[[2]] %>% map(1) %>% map(2)),
                        diff_t2_t1 = unlist(longTests[[2]] %>% map(1) %>% map(3)),
                        p_t1_t0 = unlist(longTests[[2]] %>% map(1) %>% map(10)),
                        p_t2_t0 = unlist(longTests[[2]] %>% map(1) %>% map(11)),
                        p_t2_t1 = unlist(longTests[[2]] %>% map(1) %>% map(12))) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% 
    select(1:6, 13:14, 7:12) %>% data.table()
    

# write_csv(longTestDf, "outData/tables/longTestDf.csv")

