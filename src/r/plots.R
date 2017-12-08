#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# Error handling for arguments
if (length(args) != 2) {
  stop("Two arguments must be supplied (input_path, output_path).", call.=FALSE)
}

# Initialize R enviroment, including libraries
setwd("../..")
library(tidyverse)
library(cowplot)
library(maps)
library(countrycode)
library(forcats)

# Read in summarized data as csv
data <- read.csv(args[1], sep=",")

# Edit data to make it plottable
map_iso <- 
  map_data("world") %>% 
  mutate(ISO = countrycode(region, "country.name", "iso2c"))

data$country <- data$country %>% fct_recode("United Kingdom" = "England")

data_iso <- 
  data %>% 
  mutate(ISO = countrycode(country, "country.name", "iso2c")) %>% 
  group_by(ISO) %>% 
  summarize(n=n())
         
joined_data <- 
  left_join(map_iso, data_iso, by="ISO")

# Create plots
points_hist <- data %>% 
  ggplot(aes(points)) +
  geom_histogram() + 
  labs(title="Distribution of Wine Ratings") +
  xlab("Points") + 
  ylab("Frequency")

points_hist

price_box <- data %>% 
  ggplot(aes(x=points, y=price, group=points)) +
  geom_boxplot() +
  labs(title="Distribution of Prices \n  over Wine Ratings") +
  xlab("Points") + 
  ylab("Price")

price_box_no_outliers <- data %>% 
  ggplot(aes(x=points, y=price, group=points)) +
  geom_boxplot(outlier.shape=NA) + 
  coord_cartesian(ylim = range(boxplot(data$price, plot=FALSE)$stats)*c(1, 10)) +
  labs(title="Distribution of Prices \n over Wine Ratings \n (No Outliers)") +
  xlab("Points") + 
  ylab("Price")

box_plots <- plot_grid(price_box, price_box_no_outliers, labels=)

map_count <- 
joined_data %>% 
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group,
                   fill = n)) + 
  scale_fill_gradientn(colors=rainbow(4), name="Number of Wines") + 
  scale_x_continuous("Longitude") + 
  scale_y_continuous("Latitude") + 
  labs(title="Where Wines Come From")

# Write plots as png

file_loc1 <- paste(args[2],"rankings_distribution.png", sep="")
file_loc2 <- paste(args[2],"boxplots_rankings.png", sep="")
file_loc3 <- paste(args[2],"wine_locations.png", sep="")

ggsave(file_loc1, points_hist)
ggsave(file_loc2, box_plots)
ggsave(file_loc3, map_count)
