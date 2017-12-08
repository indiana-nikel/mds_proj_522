#! /bin/bash

bash src/shell/retrieval.sh "sandbox/winemag-data-130k-v2.csv.zip" "data/raw/"

Rscript src/r/analysis.R "data/raw/winemag-data-130k-v2.csv" "data/processed/summary.csv"

Rscript src/r/plots.R "data/processed/summary.csv" "results/figures/"
