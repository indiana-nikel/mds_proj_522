#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# Error handling for arguments
if (length(args) != 2) {
  stop("Two arguments must be supplied (input_path, output_path).", call.=FALSE)
}

# Initialize R enviroment, including libraries
library(ezknitr)

ezknit(file=args[1], out_dir=args[2], keep_html=FALSE)
