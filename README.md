# Overview

This is the main directory for the data science project: `mds_proj_522`.
The data science project `mds_proj_522` is for the purpose of analysis and
is for educational use.

## Description

`mds_proj_522` is developing a predictive model for the price of wine based on up to 10 different explanatory factors. The data set, pulled from [https://www.kaggle.com/zynicide/wine-reviews](https://www.kaggle.com/zynicide/wine-reviews) contains approximately 130,000 different wine reviews to analyze from.

## Initial Analysis

### Usage

The analysis for this project can be run using the driver script in the main directory:

```
bash driver.sh
```

This driver script requires no arguments and contains the order in which the analysis source code is run, including arguments.

The analysis pipe line begins with the shell script `retrieval.sh`, which takes
in the location of the downloaded zip file and the destination of the unzipped data file. the purpose of the script is to unzip the compressed file into a usable format.

The next step is the R script `analysis.R`, which takes in the location of the raw data file and the destination of the wrangled data file. The purpose of the script is to manipulate and transform the data into a format that is usable for plotting and reports.

The final step is the R script `plots.R`, which takes in the location of the wrangled data file and the path to the figures directory to save the newly-created plots. The purpose of the script is to write to file plots that show insight into the data set.

When all of the scripts have completed, the final report can be found in the `results/reports` directory as `report.Rmd`.

When the analysis is complete, you can remove all temporary files (excluding `report.Rmd` and `winemag-data-130k-v2.csv.zip`) through the clean script in the main directory:

```
bash clean.sh
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
