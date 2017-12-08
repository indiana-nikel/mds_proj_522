#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# Error handling for arguments
if (length(args) != 2) {
  stop("Two arguments must be supplied (input_path, output_path).", call.=FALSE)
}

# Initial set up of R environment, including libraries
library(tidyverse)

# Read in data
data <- read.csv(args[1], sep=",")

# Summarize data, removing unused columns
data_summarized <-
  data %>%
  select(-description, -taster_name, -taster_twitter_handle)

# Handle NA values by removing the rows
data_no_na <- na.omit(data_summarized)

# Writes data to new csv
write.csv(data_no_na, args[2])
