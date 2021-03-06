# Wine Price Regression

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

## Overview

This is the main directory for the data science project: `wine_price_regression`.
The data science project `wine_price_regression` is for the purpose of analysis and
is for educational use.

## Description

`wine_price_regression` is developing a predictive model for the price of wine based on
up to 10 different explanatory factors. The data set, pulled from
[https://www.kaggle.com/zynicide/wine-reviews](https://www.kaggle.com/zynicide/wine-reviews)
contains approximately 130,000 different wine reviews to analyze from.

## Initial Analysis

### Usage

The analysis for this project can be run using the makefile `Makefile` in the
main directory:

```
make -f Makefile_windows all
```

This makefile requires one argument `all` to run the analysis top to bottom.
This makefile contains the order in which the analysis source code is run,
including arguments.

The analysis pipe line begins with the shell script `retrieval.sh`, which takes
in the location of the downloaded zip file and the destination of the unzipped
data file. the purpose of the script is to unzip the compressed file into a
usable format.

The next step is the R script `analysis.R`, which takes in the location of the
raw data file and the destination of the wrangled data file. The purpose of the
script is to manipulate and transform the data into a format that is usable for
plotting and reports.

The next step is the R script `plots.R`, which takes in the location of the
wrangled data file and the path to the figures directory to save the
newly-created plots. The purpose of the script is to write to file plots that
show insight into the data set.

When all of the above scripts have completed, the raw report can be found in the `results/reports` directory as `report.Rmd`.  

The final step is the R script `render.R`, which takes in the location of the
raw report file and the path to the documents directory to save the final
rendered report in a `.md` format. The purpose of the script is to render the
`R.md` file into a final, readable format.

When the analysis is complete, you can remove all temporary files (excluding
`report.Rmd` and `winemag-data-130k-v2.csv.zip`) through the `clean` argument in the makefile in main directory:

```
make -f Makefile_windows clean
```

#### Docker

It is possible to run the entire analysis through a Docker container as well. you must clone the repository locally, and then run the below command:

```
docker pull inikel/wine_price_regression
```
When the image is finished downloading, you can run:
```
docker run -it --rm -v <ABSOLUTE_PATH_OF_REPOSITORY>:/home/wine_price_regression inikel/wine_price_regression /bin/bash
```
Once you are inside of the container interactively, you can run the analysis:

```
make -f Makefile_linux all
```

```
make -f Makefile_linux clean
```

#### Packrat

To run the analysis without needing to download any packages, there is a `packrat/` directory with the packages already initialized. before running the analysis, you must run the below code to use the packrat libraries:

```
packrat::restore()
```

### File Dependency

```
├── report.md
│   ├── render.R
│   └── report.Rmd
│       └── *.png
│           ├── plots.R
│           └── summary.csv
│               ├── analysis.R
│               └── winemag-data-130k-v2.csv
│                   ├── analysis.R
│                   └── winemag-data-130k-v2.csv.zip
│                       └── retrieval.sh
```

### Data Set

Link: [https://www.kaggle.com/zynicide/wine-reviews](https://www.kaggle.com/zynicide/wine-reviews)

The data consists of 13 fields:

| Variable | Description |
| ------------------ | ------------------------------------ |
| Country | The country that the wine is from. |
| Description | A few sentences from a sommelier describing the wine's taste (ie. smell, look, feel, etc.). |
| Designation | The vineyard within the winery where the grapes that made the wine are from. |
| Points | The number of points WineEnthusiast rated the wine on a scale of 1-100 (reviews are only for wines that score >=80). |
| Price | The cost for a bottle of the wine. |
| Province | The province or state that the wine is from. |
| Region 1 | The wine growing area in a province or state (ie. Napa). |
| Region 2 | Sometimes there are more specific regions specified within a wine growing area (ie. Rutherford inside the Napa Valley), but this value can sometimes be blank. |
| Taster Name | Name of the person who tasted and reviewed the wine. |
| Taster Twitter Handle | Twitter handle for the person who tasted and reviewed the wine. |
| Title | The title of the wine review, which often contains the vintage. |
| Variety | The type of grapes used to make the wine (ie. Pinot Noir). |
| Winery | The winery where the grapes that made the wine are from. |


Format:

* Approximately 130K rows.

* Approximately 9K rows with at least one NA value.

* Downloaded as a `.zip` file.

* Can be extracted into both JSON and CSV format.


### Research Question

Does the price of wine follow a trend based on the other factors that make up a wine? That is, can we predict the price of a wine knowing certain features about that wine (ie. location, winery, grapes used, description, rating, etc.)?

### Hypothesis

Using the wine rating data set, I hypothesize that there is no trend in wine prices that can be predicted using one or more of the explanatory variables.

### Initial Analysis

To pull the dataset into a usable format I would use a shell script integrated with the Kaggle client to first download the data set, storing it in the `data/raw` directory. I would then unzip and import the resulting CSV file into R, storing those scripts in their respective directories (`src/r`, `src/shell`).

###### Data Wrangling

When importing the data into R, I would make sure that the data is correctly
formatted: categorical variables are factors, discrete variables are integers,
continuous variables are doubles, etc. This would minimize the errors that could
arise from blindly importing raw data. The resulting data set would be placed
into the `data/processed` directory.

###### Plotting

Before any statistical methods can get applied to the data set, it is important
to plot and see any obvious trends. I would start by plotting points as a
frequency histogram, to see the rough distribution of the frequency of certain
prices. I could expand this into box plot against price (my response variable)
to show the range of the data as well as any outliers.

Additionally, to see where the distribution of wines are coming from, I would
plot a map of the world. The colors of the map would correspond to the number of
wines rated. This could give an insight into why wines are rated the way that
they are (ie. French wines are rated lower but cost more than American wines).

The plots will all be saved in the `results/figures` directory.

###### Moving Forward

After the exploratory data analysis, statistical methods can be put into place.
I would be looking at fitting a linear regression model for price based on the
factors that are the most statistically significant. It might also be
appropriate to include a classification model for why wines are rated the way
that they are.
