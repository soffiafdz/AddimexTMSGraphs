
# Ctrl v Users --------------------------------------------------------------------------------

# metrics_names1 <- c("Global efficiency", "Local efficiency", "Density", "Strength",
# "Clustering coefficient", "Characteristic path length", "Small-worldness")


# vsTests <- vector("list", length = 2)
# vsTests[[1]] <- c(vsCON[[1]], vsDAN[[1]], vsDMN[[1]], vsFPN[[1]], vsSAL[[1]], 
#                  vsSUB[[1]], vsVAN[[1]], vsWB[[1]])
# vsTests[[2]] <- c(vsCON[[2]], vsDAN[[2]], vsDMN[[2]], vsFPN[[2]], vsSAL[[2]], 
#                  vsSUB[[2]], vsVAN[[2]], vsWB[[2]])
# # head(vsTests[[1]] %>% map_dbl(1)) #t
# # head(vsTests[[1]] %>% map_dbl(2)) #df
# # head(vsTests[[1]] %>% map_dbl(3)) #p
# # head(vsTests[[1]] %>% map(5) %>% map_dbl(1)) #mean_ctrl
# # head(vsTests[[1]] %>% map(5) %>% map_dbl(1)) #mean_user
# # head(vsTests[[2]] %>% map_dbl(3)) # cohen's d
# 
# vsTestDf <- data_frame(net = c(rep(net_names[1:6], each = 7),
#                                rep(net_names[7], 6),
#                                rep(net_names[8], 7)),
#                        metric = c(rep(metrics_names, times = 6),
#                                   metrics_names[1:6],
#                                   metrics_names),
#                        t = vsTests[[1]] %>% map_dbl(1),
#                        df = vsTests[[1]] %>% map_dbl(2),
#                        meanCtrl = vsTests[[1]] %>% map(5) %>% map_dbl(1),
#                        meanUsr = vsTests[[1]] %>% map(5) %>% map_dbl(2),
#                        d = vsTests[[2]] %>% map_dbl(3),
#                        p = vsTests[[1]] %>% map_dbl(3)) %>% 
#     mutate(p_fdr = p.adjust(p, method = "fdr"),
#            P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()
# 

# write_csv(vsTestDf, "outData/tables/vsTestDf.csv")



# Anovas --------------------------------------------------------------------------------------

net_names <- c("CON", "DAN", "DMN", "FPN", "SAL", "SUB", "VAN")
metrics_names <- c("EG", "EL", "D", "S", "CP", "LP")

aovSN <- c(aovCON, aovDAN, aovDMN, aovFPN, aovSAL, aovSUB, aovVAN)
# p <- aovs %>% map(1) %>% map(6) %>% map_dbl(3)
# head(aovs %>% map(1) %>% map(6))
# map(p, p.adjust, method = "fdr")

aovDfSn <- data.table(net = rep(net_names, each = 6),
                      metric = rep(metrics_names, times = 7),
                      stat_gr = aovSN %>% map(1) %>% map(4) %>% map(1) %>% 
                          as.character() %>% as.numeric(),
                      df_gr = rep('1, 29', 42),
                      ges_gr = aovSN %>% map(1) %>% map(5) %>% map(1) %>% 
                          as.character() %>% as.numeric(),
                      p_gr = aovSN %>% map(1) %>% map(6) %>% map(1) %>% 
                          as.character() %>% as.numeric(),
                      stat_st = aovSN %>% map(1) %>% map(4) %>% map(2) %>% 
                          as.character() %>% as.numeric(),
                      df_st = rep('1, 29', 42),
                      ges_st = aovSN %>% map(1) %>% map(5) %>% map(2) %>% 
                          as.character() %>% as.numeric(),
                      p_st = aovSN %>% map(1) %>% map(6) %>% map(2) %>% 
                          as.character() %>% as.numeric(),
                      stat_int = aovSN %>% map(1) %>% map(4) %>% map(3) %>% 
                          as.character() %>% as.numeric(),
                      df_int = rep('1, 29', 42),
                      ges_int = aovSN %>% map(1) %>% map(5) %>% map(3) %>% 
                          as.character() %>% as.numeric(),
                      p_int = aovSN %>% map(1) %>% map(6) %>% map(3) %>% 
                          as.character() %>% as.numeric()) %>% 
    na.omit()

aovDfSn[, `:=`(
    p_gr_fdr = p.adjust(p_gr, method = "fdr"),
    p_st_fdr = p.adjust(p_st, method = "fdr"),
    p_int_fdr = p.adjust(p_int, method = "fdr"),
    p_gr_bonf = p.adjust(p_gr, method = "bonferroni"),
    p_st_bonf = p.adjust(p_st, method = "bonferroni"),
    p_int_bonf = p.adjust(p_int, method = "bonferroni")
)]

metrics_names2 <- c("EG", "EL", "D", "S", "LAMDA", "GAMMA", "SIGMA")
aovDf <- data.table(metric = metrics_names2,
                    stat_gr = aovWB %>% map(1) %>% map(4) %>% map(1),
                    df_gr = rep('1, 29', 7),
                    ges_gr = aovWB %>% map(1) %>% map(5) %>% map(1),
                    p_gr = aovWB %>% map(1) %>% map(6) %>% map(1),
                    stat_st = aovWB %>% map(1) %>% map(4) %>% map(2),
                    df_st = rep('1, 29', 7),
                    ges_st = aovWB %>% map(1) %>% map(5) %>% map(2),
                    p_st = aovWB %>% map(1) %>% map(6) %>% map(2),
                    stat_int = aovWB %>% map(1) %>% map(4) %>% map(3),
                    df_int = rep('1, 29', 7),
                    ges_int = aovWB %>% map(1) %>% map(5) %>% map(3),
                    p_int = aovWB %>% map(1) %>% map(6) %>% map(3)) %>% 
    na.omit()

aovDf[, `:=`(
    p_gr_fdr = p.adjust(p_gr, method = "fdr"),
    p_st_fdr = p.adjust(p_st, method = "fdr"),
    p_int_fdr = p.adjust(p_int, method = "fdr"),
    p_gr_bonf = p.adjust(p_gr, method = "bonferroni"),
    p_st_bonf = p.adjust(p_st, method = "bonferroni"),
    p_int_bonf = p.adjust(p_int, method = "bonferroni")
)]



write_rds(aovDfSn, "outData/rds/aovDFSN.rds")
fwrite(aovDfSn, "outData/tables/aovDFsn.csv")

write_rds(aovDf, "outData/rds/aovDF.rds")
fwrite(aovDf, "outData/tables/aovDF.csv")



# Pre-post Real treatment ---------------------------------------------------------------------
# 
# tTests <- vector("list", length = 2)
#     tTests[[1]] <- c(txCON[[1]], txDAN[[1]], txDMN[[1]], txFPN[[1]], txSAL[[1]], 
#                      txSUB[[1]], txVAN[[1]], txWB[[1]])
#     tTests[[2]] <- c(txCON[[2]], txDAN[[2]], txDMN[[2]], txFPN[[2]], txSAL[[2]], 
#                      txSUB[[2]], txVAN[[2]], txWB[[2]])
# head(tTests[[1]] %>% map_dbl(1)) #t
# head(tTests[[1]] %>% map_dbl(2)) #df
# head(tTests[[1]] %>% map_dbl(3)) #p
# head(tTests[[1]] %>% map_dbl(5)) #mean_diff
# head(tTests[[2]] %>% map_dbl(3)) # cohen's d
# 
# tTestDf <- data_frame(net = rep(net_names, each = 7),
#                       metric = rep(metrics_names, times = 8),
#                       t = tTests[[1]] %>% map_dbl(1),
#                       df = tTests[[1]] %>% map_dbl(2),
#                       mean_diff = tTests[[1]] %>% map_dbl(5),
#                       d = tTests[[2]] %>% map_dbl(3),
#                       p = tTests[[1]] %>% map_dbl(3)) %>% 
#     mutate(p_fdr = p.adjust(p, method = "fdr"),
#            P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()
# 
# 
# write_csv(tTestDf, "outData/tables/tTestDf.csv")
# saveRDS(tTestDf, "~/Desktop/t_df1.RDS")

# Longitudinal --------------------------------------------------------------------------------

# longTests <- vector("list", length = 2)
#     longTests[[1]] <- c(lCON[[1]], lDAN[[1]], lDMN[[1]], lFPN[[1]], lSAL[[1]], 
#                         lSUB[[1]], lVAN[[1]], lWB[[1]])
#     longTests[[2]] <- c(lCON[[2]], lDAN[[2]], lDMN[[2]], lFPN[[2]], lSAL[[2]], 
#                         lSUB[[2]], lVAN[[2]], lWB[[2]])

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

# longTestDf <- data_frame(net = rep(net_names, each = 7),
#                         metric = rep(metrics_names, times = 8),
#                         f_stat = longTests[[1]] %>% map(1) %>% map(4) %>% map_dbl(1),
#                         df_1 = longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(1),
#                         df_2 = longTests[[1]] %>% map(1) %>% map(1) %>% map_dbl(2),
#                         p = longTests[[1]] %>% map(1) %>% map(5) %>% map_dbl(1),
#                         diff_t1_t0 = unlist(longTests[[2]] %>% map(1) %>% map(1)),
#                         diff_t2_t0 = unlist(longTests[[2]] %>% map(1) %>% map(2)),
#                         diff_t2_t1 = unlist(longTests[[2]] %>% map(1) %>% map(3)),
#                         p_t1_t0 = unlist(longTests[[2]] %>% map(1) %>% map(10)),
#                         p_t2_t0 = unlist(longTests[[2]] %>% map(1) %>% map(11)),
#                         p_t2_t1 = unlist(longTests[[2]] %>% map(1) %>% map(12))) %>% 
#     mutate(p_fdr = p.adjust(p, method = "fdr"),
#            P_bonf = p.adjust(p, method = "bonferroni")) %>% 
#     select(1:6, 13:14, 7:12) %>% data.table()
#     

# write_csv(longTestDf, "outData/tables/longTestDf.csv")

