
# Anovas --------------------------------------------------------------------------------------

aovs1 <- c(aovCON1, aovDAN1, aovDMN1, aovFPN1, aovSAL1, aovSUB1, aovVAN1, aovWB1)
# p <- aovs1 %>% map(1) %>% map(6) %>% map_dbl(3)
# head(aovCON1[[1]][[4]][[3]]) #F
# head(aovCON1[[1]][[5]][[3]]) #ges
# head(aovCON1[[1]][[6]][[3]]) #p
# head(aovs1 %>% map(1) %>% map(6))
# map(p, p.adjust, method = "fdr")

aov1Df <- data_frame(net = rep(net_names, each = 7),
                    metric = rep(metrics_names, times = 8),
                    stat = aovs1 %>% map(1) %>% map(4) %>% map_dbl(3),
                    df = rep('1, 25', 56),
                    ges = aovs1 %>% map(1) %>% map(5) %>% map_dbl(3),
                    p = aovs1 %>% map(1) %>% map(6) %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()

write_csv(aov1Df, "outData/tables/aov1.csv")
# saveRDS(aov_df, "~/Desktop/aov_df.RDS")


# Pre-post Real treatment ---------------------------------------------------------------------

tTests1 <- vector("list", length = 2)
tTests1[[1]] <- c(txCON1[[1]], txDAN1[[1]], txDMN1[[1]], txFPN1[[1]], txSAL1[[1]], 
                 txSUB1[[1]], txVAN1[[1]], txWB1[[1]])
tTests1[[2]] <- c(txCON1[[2]], txDAN1[[2]], txDMN1[[2]], txFPN1[[2]], txSAL1[[2]], 
                 txSUB1[[2]], txVAN1[[2]], txWB1[[2]])
head(tTests1[[1]] %>% map_dbl(1)) #t
head(tTests1[[1]] %>% map_dbl(2)) #df
head(tTests1[[1]] %>% map_dbl(3)) #p
head(tTests1[[1]] %>% map_dbl(5)) #mean_diff
head(tTests1[[2]] %>% map_dbl(3)) # cohen's d

tTest1Df <- data_frame(net = rep(net_names, each = 7),
                      metric = rep(metrics_names, times = 8),
                      t = tTests1[[1]] %>% map_dbl(1),
                      df = tTests1[[1]] %>% map_dbl(2),
                      mean_diff = tTests1[[1]] %>% map_dbl(5),
                      d = tTests1[[2]] %>% map_dbl(3),
                      p = tTests1[[1]] %>% map_dbl(3)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% data.table()


# write_csv(tTest1Df, "tables/t_test1.csv")
# saveRDS(tTest1Df, "~/Desktop/t_df1.RDS")

# Longitudinal --------------------------------------------------------------------------------

longTests1 <- vector("list", length = 2)
longTests1[[1]] <- c(lCON1[[1]], lDAN1[[1]], lDMN1[[1]], lFPN1[[1]], lSAL1[[1]], 
                    lSUB1[[1]], lVAN1[[1]], lWB1[[1]])
longTests1[[2]] <- c(lCON1[[2]], lDAN1[[2]], lDMN1[[2]], lFPN1[[2]], lSAL1[[2]], 
                    lSUB1[[2]], lVAN1[[2]], lWB1[[2]])

# head(longTests1[[1]] %>% map(1) %>% map(1) %>% map_dbl(1)) #df Stage
# head(longTests1[[1]] %>% map(1) %>% map(1) %>% map_dbl(2)) #df Resids
# head(longTests1[[1]] %>% map(1) %>% map(4) %>% map_dbl(1)) #F stat
# head(longTests1[[1]] %>% map(1) %>% map(5) %>% map_dbl(1)) #p
# head(longTests1[[2]] %>% map(1) %>% map(1)) #diff t1-t0
# head(longTests1[[2]] %>% map(1) %>% map(2)) #diff t2-t0
# head(longTests1[[2]] %>% map(1) %>% map(3)) #diff t2-t1
# head(longTests1[[2]] %>% map(1) %>% map(10)) #p t1-t0
# head(longTests1[[2]] %>% map(1) %>% map(11)) #p t2-t0
# head(longTests1[[2]] %>% map(1) %>% map(12)) #p t2-t1

longTest1Df <- data_frame(net = rep(net_names, each = 7),
                        metric = rep(metrics_names, times = 8),
                        f_stat = longTests1[[1]] %>% map(1) %>% map(4) %>% map_dbl(1),
                        df_1 = longTests1[[1]] %>% map(1) %>% map(1) %>% map_dbl(1),
                        df_2 = longTests1[[1]] %>% map(1) %>% map(1) %>% map_dbl(2),
                        p = longTests1[[1]] %>% map(1) %>% map(5) %>% map_dbl(1),
                        diff_t1_t0 = longTests1[[2]] %>% map(1) %>% map(1),
                        diff_t2_t0 = longTests1[[2]] %>% map(1) %>% map(2),
                        diff_t2_t1 = longTests1[[2]] %>% map(1) %>% map(3),
                        p_t1_t0 = longTests1[[2]] %>% map(1) %>% map(10),
                        p_t2_t0 = longTests1[[2]] %>% map(1) %>% map(11),
                        p_t2_t1 = longTests1[[2]] %>% map(1) %>% map(12)) %>% 
    mutate(p_fdr = p.adjust(p, method = "fdr"),
           P_bonf = p.adjust(p, method = "bonferroni")) %>% 
    select(1:6, 13:14, 7:12) %>% data.table()


# write_csv(longTest1Df, "tables/longTest1Df.csv")

# Correlation Vas -----------------------------------------------------------------------------

# vas_corrs$Metrics <- rep(metric_names, times = 21)
# vas_corrs$Network <- rep(net_names, each = 21)
# 
# vas_corrs_sign <- filter(vas_corrs, p <= 0.05)
# 
# write_csv(vas_corrs, "tables/vas.csv")
# write_csv(vas_corrs_sign, "tables/vas2.csv")
# 
# saveRDS(vas_corrs, "~/Desktop/vas_r.RDS")
# saveRDS(vas_corrs_sign, "~/Desktop/vas_rs.RDS")

# Correlation Bis11 ---------------------------------------------------------------------------

# b11c_corrs$Metrics <- rep(metric_names, times = 21)
# b11m_corrs$Metrics <- rep(metric_names, times = 21)
# b11np_corrs$Metrics <- rep(metric_names, times = 21)
# b11tot_corrs$Metrics <- rep(metric_names, times = 21)
# 
# b11c_corrs$Network <- rep(net_names, each = 21)
# b11m_corrs$Network <- rep(net_names, each = 21)
# b11np_corrs$Network <- rep(net_names, each = 21)
# b11tot_corrs$Network <- rep(net_names, each = 21)
# 
# 
# b11tot_corrs_sign <- filter(b11tot_corrs, p <= 0.05)
# 
# write_csv(b11tot_corrs, "tables/b11.csv")
# write_csv(b11tot_corrs_sign, "tables/b11s.csv")
# write_csv(filter(b11c_corrs, p < 0.05), "tables/b11cs.csv")
# write_csv(filter(b11m_corrs, p < 0.05), "tables/b11ms.csv")
# write_csv(filter(b11np_corrs, p < 0.05), "tables/b11nps.csv")
# 
# saveRDS(b11c_corrs, "~/Desktop/b11c_r.RDS")
# saveRDS(b11m_corrs, "~/Desktop/b11m_r.RDS")
# saveRDS(b11np_corrs, "~/Desktop/b11np_r.RDS")
# saveRDS(b11tot_corrs, "~/Desktop/b11tot_r.RDS")

