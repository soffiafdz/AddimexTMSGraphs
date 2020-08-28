#!/usr/bin/env Rscript

library(ggplot2)
library(ggthemes)
library(dplyr)
library(reshape)
library(RCurl)

load_fonts()
## Sparklines
dd <- read.csv(text = getURL("https://gist.githubusercontent.com/GeekOnAcid/da022affd36310c96cd4/raw/9c2ac2b033979fcf14a8d9b2e3e390a4bcc6f0e3/us_nr_of_crimes_1960_2014.csv"))
d <- melt(dd, id="Year")
names(d) <- c("Year","Crime.Type","Crime.Rate")
d$Crime.Rate <- round(d$Crime.Rate,0)
mins <- group_by(d, Crime.Type) %>% slice(which.min(Crime.Rate))
maxs <- group_by(d, Crime.Type) %>% slice(which.max(Crime.Rate))
ends <- group_by(d, Crime.Type) %>% filter(Year == max(Year))
quarts <- d %>% group_by(Crime.Type) %>%
  summarize(quart1 = quantile(Crime.Rate, 0.25),
            quart2 = quantile(Crime.Rate, 0.75)) %>%
  right_join(d)

p <- ggplot(d, aes(x=Year, y=Crime.Rate)) + 
  facet_grid(Crime.Type ~ ., scales = "free_y") + 
  geom_ribbon(data = quarts, aes(ymin = quart1, max = quart2), fill = 'grey93') +
  geom_line(size=0.3) +
  geom_point(data = mins, col = 'red') +
  geom_point(data = maxs, col = 'blue') +
  geom_text(data = mins, aes(label = Crime.Rate), vjust = -1, family = "Merriweather",  size = 2.5) +
  geom_text(data = maxs, aes(label = Crime.Rate), vjust = 2.5, family = "Merriweather",  size = 2.5) +
  # geom_text(data = ends, aes(label = Crime.Rate), hjust = 0, nudge_x = 1, family = "Merriweather",  size = 2.5) +
  geom_text(data = ends, aes(label = Crime.Type), hjust = 0, nudge_x = 1, family = "Merriweather",  size = 2.5) +
  expand_limits(x = max(d$Year) + (0.25 * (max(d$Year) - min(d$Year)))) +
  scale_x_continuous(breaks = seq(1960, 2010, 10)) +
  scale_y_continuous(expand = c(0.1, 0)) +
  theme(text = element_text(size = 13, family = "Merriweather")) +
  theme_tufte(base_size = 13, base_family = "Sura") +
  theme(axis.title=element_blank(), axis.text.y = element_blank(),
        axis.ticks = element_blank(), strip.text = element_blank())

ggsave(here("figures/sparkline_ex"), device = "pdf")
