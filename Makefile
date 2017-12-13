all: winemag-data-130k-v2.csv summary.csv *.png

winemag-data-130k-v2.csv : sandbox/winemag-data-130k-v2.csv.zip src/shell/retrieval.sh
		bash src/shell/retrieval.sh "sandbox/winemag-data-130k-v2.csv.zip" "data/raw/"

summary.csv : data/raw/winemag-data-130k-v2.csv src/r/analysis.R
		Rscript src/r/analysis.R "data/raw/winemag-data-130k-v2.csv" "data/processed/summary.csv"

*.png : data/processed/summary.csv src/r/plots.R
		Rscript src/r/plots.R "data/processed/summary.csv" "results/figures/"

clean :
		rm data/raw/winemag-data-130k-v2.csv
		rm data/processed/summary.csv

		rm results/figures/boxplots_rankings.png
		rm results/figures/rankings_distribution.png
		rm results/figures/wine_locations.png

		rm Rplots.pdf
