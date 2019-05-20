
# Anovas --------------------------------------------------------------------------------------

aovs2 <- c(aovCON2, aovDAN2, aovDMN2, aovFPN2, aovSAL2, aovSUB2, aovVAN2, aovWB2)
# p <- aovs1 %>% map(1) %>% map(6) %>% map_dbl(3)
# head(aovCON2[[1]][[4]][[3]]) #F
# head(aovCON2[[1]][[5]][[3]]) #ges
# head(aovCON2[[1]][[6]][[3]]) #p
# head(aovs2 %>% map(1) %>% map(6))
# map(p, p.adjust, method = "fdr")

aov2Df <- data_frame(net = rep(net_names, each = 7),
                     metric = rep(metrics_names, times = 8),
                     stat = aovs2 %>% map(1) %>% map(4) %>% map_dbl(3),
                     df = rep('1, 25', 56),
                     ges = aovs2 %>% map(1) %>% map(5) %>% map_dbl(3),
                     p = aovs2 %>% map(1) %>% map(6) %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()

write_csv(aov2Df, "outData/tables/aov2.csv")
# saveRDS(aov_df, "~/Desktop/aov_df.RDS")


# Pre-post Real treatment ---------------------------------------------------------------------

tTests2 <- vector("list", length = 2)
tTests2[[1]] <- c(txCON2[[1]], txDAN2[[1]], txDMN2[[1]], txFPN2[[1]], txSAL2[[1]], 
                  txSUB2[[1]], txVAN2[[1]], txWB2[[1]])
tTests2[[2]] <- c(txCON2[[2]], txDAN2[[2]], txDMN2[[2]], txFPN2[[2]], txSAL2[[2]], 
                  txSUB2[[2]], txVAN2[[2]], txWB2[[2]])
# head(tTests2[[1]] %>% map_dbl(1)) #t
# head(tTests2[[1]] %>% map_dbl(2)) #df
# head(tTests2[[1]] %>% map_dbl(3)) #p
# head(tTests2[[1]] %>% map_dbl(5)) #mean_diff
# head(tTests2[[2]] %>% map_dbl(3)) # cohen's d

tTest2Df <- data_frame(net = rep(net_names, each = 7),
                       metric = rep(metrics_names, times = 8),
                       t = tTests2[[1]] %>% map_dbl(1),
                       df = tTests2[[1]] %>% map_dbl(2),
                       mean_diff = tTests2[[1]] %>% map_dbl(5),
                       d = tTests2[[2]] %>% map_dbl(3),
                       p = tTests2[[1]] %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()


# write_csv(tTest2Df, "tables/t_test2.csv")
# saveRDS(tTest2Df, "~/Desktop/t_df1.RDS")

# Longitudinal --------------------------------------------------------------------------------

longTests2 <- vector("list", length = 2)
longTests2[[1]] <- c(lCON2[[1]], lDAN2[[1]], lDMN2[[1]], lFPN2[[1]], lSAL2[[1]], 
                    lSUB2[[1]], lVAN2[[1]], lWB2[[1]])
longTests2[[2]] <- c(lCON2[[2]], lDAN2[[2]], lDMN2[[2]], lFPN2[[2]], lSAL2[[2]], 
                    lSUB2[[2]], lVAN2[[2]], lWB2[[2]])

# head(longTests2[[1]] %>% map(1) %>% map(1) %>% map_dbl(1)) #df Stage
# head(longTests2[[1]] %>% map(1) %>% map(1) %>% map_dbl(2)) #df Resids
# head(longTests2[[1]] %>% map(1) %>% map(4) %>% map_dbl(1)) #F stat
# head(longTests2[[1]] %>% map(1) %>% map(5) %>% map_dbl(1)) #p
# head(longTests2[[2]] %>% map(1) %>% map(1)) #diff t1-t0
# head(longTests2[[2]] %>% map(1) %>% map(2)) #diff t2-t0
# head(longTests2[[2]] %>% map(1) %>% map(3)) #diff t2-t1
# head(longTests2[[2]] %>% map(1) %>% map(10)) #p t1-t0
# head(longTests2[[2]] %>% map(1) %>% map(11)) #p t2-t0
# head(longTests2[[2]] %>% map(1) %>% map(12)) #p t2-t1

longTest2Df <- data_frame(net = rep(net_names, each = 7),
                        metric = rep(metrics_names, times = 8),
                        f_stat = longTests2[[1]] %>% map(1) %>% map(4) %>% map_dbl(1),
                        df_1 = longTests2[[1]] %>% map(1) %>% map(1) %>% map_dbl(1),
                        df_2 = longTests2[[1]] %>% map(1) %>% map(1) %>% map_dbl(2),
                        p = longTests2[[1]] %>% map(1) %>% map(5) %>% map_dbl(1),
                        diff_t1_t0 = longTests2[[2]] %>% map(1) %>% map(1),
                        diff_t2_t0 = longTests2[[2]] %>% map(1) %>% map(2),
                        diff_t2_t1 = longTests2[[2]] %>% map(1) %>% map(3),
                        p_t1_t0 = longTests2[[2]] %>% map(1) %>% map(10),
                        p_t2_t0 = longTests2[[2]] %>% map(1) %>% map(11),
                        p_t2_t1 = longTests2[[2]] %>% map(1) %>% map(12)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% 
    select(1:6, 13:14, 7:12) %>% data.table()


# write_csv(longTest2Df, "tables/longTest2Df.csv")

