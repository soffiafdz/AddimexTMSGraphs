score_mean_1 <- mean(d$y[1:50])
score_mean_2 <- mean(d$y[51:100])
score_median1 <- median(d$y[1:50])
score_median2 <- median(d$y[51:100])
score_sd_1 <- sd(d$y[1:50])
score_sd_2 <- sd(d$y[51:100])
score_se_1 <- score_sd_1/sqrt(n) #-> adjust your n
score_se_2 <- score_sd_2/sqrt(n) #-> adjust your n
score_ci_1 <- CI(d$y[1:50], ci = 0.95)
score_ci_2 <- CI(d$y[51:100], ci = 0.95)
#Create data frame with 2 rows and 7 columns containing the descriptives
group <- c("x", "z")
N <- c(50, 50)
score_mean <- c(score_mean_1, score_mean_2)
score_median <- c(score_median1, score_median2)
sd <- c(score_sd_1, score_sd_2)
se <- c(score_se_1, score_se_2)
ci <- c((score_ci_1[1] - score_ci_1[3]), (score_ci_2[1] - score_ci_2[3]))
#Create the dataframe
summary_df <- data.frame(group, N, score_mean, score_median, sd, se, ci)

before = iris$Sepal.Length[1:50]
after = iris$Sepal.Length[51:100]
n <-length(before)
d <-data.frame(
    y =c(before, after),
    x =rep(c(1,2), each=n),
    z =rep(c(3,4), each=n),
    id =factor(rep(1:n,2)))

set.seed(321)
d$xj <-jitter(d$x, amount = .09)
d$xj_2 <-jitter(d$z, amount = .09)

f8 <- ggplot(data = d, aes(y = y)) +

   # Add geom_() objects
   geom_point(data = d %>% filter(x =="1"), aes(x = xj), color = 'dodgerblue', size = 1.5,
              alpha = .6) +
   geom_point(data = d %>% filter(x =="2"), aes(x = xj), color = 'darkorange', size = 1.5,
              alpha = .6) +
   geom_point(data = d %>% filter(z =="3"), aes(x = xj_2), color = 'dodgerblue', size = 1.5,
              alpha = .6) +
   geom_point(data = d %>% filter(z =="4"), aes(x = xj_2), color = 'darkorange', size = 1.5,
              alpha = .6) +
   geom_line(aes(x = xj, group = id), color = 'lightgray', alpha = .3) +
   geom_line(aes(x = xj_2, group = id), color = 'lightgray', alpha = .3) +

   geom_half_boxplot(
     data = d %>% filter(x=="1"), aes(x=x, y = y), position = position_nudge(x = -.35),
     side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
     fill = 'dodgerblue', alpha = .6) +

   geom_half_boxplot(
     data = d %>% filter(x=="2"), aes(x=x, y = y), position = position_nudge(x = -1.16),
     side = "l",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
     fill = 'darkorange', alpha = .6) +

   geom_half_boxplot(
     data = d %>% filter(z=="3"), aes(x=z, y = y), position = position_nudge(x = 1.3),
     side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
     fill = 'dodgerblue', alpha = .6) +

   geom_half_boxplot(
     data = d %>% filter(z=="4"), aes(x=z, y = y), position = position_nudge(x = .2),
     side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
     fill = 'darkorange', alpha = .6) +

   geom_half_violin(
     data = d %>% filter(x=="1"),aes(x = x, y = y), position = position_nudge(x = -.40),
     side = "l", fill = 'dodgerblue', alpha = .6) +

   geom_half_violin(
     data = d %>% filter(x=="2"),aes(x = x, y = y), position = position_nudge(x = -1.40),
     side = "l", fill = "darkorange", alpha = .6) +

   geom_half_violin(
     data = d %>% filter(z=="3"),aes(x = z, y = y), position = position_nudge(x = 1.45),
     side = "r", fill = 'dodgerblue', alpha = .6) +

   geom_half_violin(
     data = d %>% filter(z=="4"),aes(x = z, y = y), position = position_nudge(x = .45),
     side = "r", fill = "darkorange", alpha = .6) +

   geom_point(data = d %>% filter(x=="1"), aes(x = x, y = score_mean[1]),
     position = position_nudge(x = -.13), color = "dodgerblue", alpha = .6, size = 1.5) +

   geom_errorbar(data = d %>% filter(x=="1"), aes(x = x, y = score_mean[1],
     ymin = score_mean[1]-ci[1], ymax = score_mean[1]+ci[1]),
     position = position_nudge(-.13),
     color = "dodgerblue", width = 0.05, size = 0.4, alpha = .6) +

   geom_point(data = d %>% filter(x=="2"), aes(x = x, y = score_mean[2]),
    position = position_nudge(x = -1.1), color = "darkorange", alpha = .6, size = 1.5)+

   geom_errorbar(data = d %>% filter(x=="2"), aes(x = x, y = score_mean[2],
    ymin = score_mean[2]-ci[2],
    ymax = score_mean[2]+ci[2]), position = position_nudge(x = -1.1), color = "darkorange",
    width = 0.05, size = 0.4, alpha = .6) +
   geom_point(data = d %>% filter(z=="3"), aes(x = z, y = score_mean[1]),
    position = position_nudge(x = 1.15), color = "dodgerblue", alpha = .5) +

   geom_errorbar(data = d %>% filter(z=="3"), aes(x = z, y = score_mean[1],
    ymin = score_mean[1]-ci[1],
    ymax = score_mean[1]+ci[1]), position = position_nudge(1.15),
    color = "dodgerblue", width = 0.05, size = 0.4, alpha = .5)+
   geom_point(data = d %>% filter(z=="4"), aes(x = z, y = score_mean[2]),
    position = position_nudge(x = .15), color = "darkorange", alpha = .5)+
   geom_errorbar(data = d %>% filter(z=="4"), aes(x = z, y = score_mean[2],
    ymin = score_mean[2]-ci[2], ymax = score_mean[2]+ci[2]), position = position_nudge(.15),
    color = "darkorange", width = 0.05, size = 0.4, alpha = .5)+


   #Define additional settings
   scale_x_continuous(breaks=c(1,2,3,4), labels=c("Before", "After","Before", "After"),
                      limits=c(0, 5))+
   xlab("Condition") + ylab("Value") +
   ggtitle('Figure 8: 2 x 2 Repeated measures with box- and violin plots') +
   theme_classic()+
   coord_cartesian(ylim=c(y_lim_min, y_lim_max))
