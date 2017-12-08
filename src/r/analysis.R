#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

if (length(args) != 2) {
  stop("Two arguments must be supplied (input_path, output_path).", call.=FALSE)
}

library(tidyverse)
setwd("../..")

print(arg[1])
print(arg[2])

data <- read.table(arg[1])

data_summarized <- 
  data %>% 
  select(-description, -taster_name, -taster_twitter_handle)

data_no_na <- na.omit(data_summarized)

write.csv(data_no_na, arg[2])