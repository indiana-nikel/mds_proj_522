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

# Read in summarized data as csv
data <- read.csv(arg[1], sep=",")

# Create plots



# Write plots as png
