# Initial Analysis

### Data Set

Link: [https://www.kaggle.com/zynicide/wine-reviews](https://www.kaggle.com/zynicide/wine-reviews)

The data consists of 10 fields:

| Variable | Description |
| ------------------ | ------------------------------------ |
| Points | The number of points WineEnthusiast rated the wine on a scale of 1-100 (reviews are only for wines that score >=80). |
| Title | The title of the wine review, which often contains the vintage. |
| Variety | The type of grapes used to make the wine (ie. Pinot Noir). |
| Description | A few sentences from a sommelier describing the wine's taste (ie. smell, look, feel, etc.). |
| Country | The country that the wine is from. |
| Province | The province or state that the wine is from. |
| Region 1 | The wine growing area in a province or state (ie. Napa). |
| Region 2 | Sometimes there are more specific regions specified within a wine growing area (ie. Rutherford inside the Napa Valley), but this value can sometimes be blank. |
| Winery | The winery that made the wine. |
| Designation | The vineyard within the winery where the grapes that made the wine are from. |
| Price | The cost for a bottle of the wine. |
| Taster Name | Name of the person who tasted and reviewed the wine. |
| Taster Twitter Handle | Twitter handle for the person who tasted and reviewed the wine. |

Format:

* Approximately 130K rows.

* Downloaded as a `.zip` file.

* Extracted into both JSON and CSV format.


### Research Question

Does the price of wine follow a trend based on the other factors that make up a wine? That is, can we predict the price of a wine knowing certain features about that wine (ie. location, winery, grapes used, description, rating, etc.)?

### Hypothesis

Using the wine rating data set, I hypothesize that there is no trend in wine prices that can be predicted using one or more of the explanatory variables.

### Initial Analysis

To pull the dataset into a usable format I would use a shell script integrated with the Kaggle client to first download the data set, storing it in the `data/raw` directory. I would then unzip and import the resulting CSV file into R, storing those scripts in their respective directories (`src/r`, `src/shell`).

###### Data Wrangling

When importing the data into R, I would make sure that the data is correctly formatted: categorical variables are factors, discrete variables are integers, continuous variables are doubles, etc. This would minimize the errors that could arise from blindly importing raw data. The resulting data set would be placed into the `data/interim` directory.

###### Plotting

Before any statistical methods can get applied to the data set, it is important to plot and see any obvious trends. I would start by plotting price (my response variable) as a frequency histogram, to see the rough distribution of the frequency of certain prices. I could expand this into box plot to show the range of the data as well as any outliers.

I would then plot price against rating in a scatter plot, the most obvious variable that would be related to price. If there were any obvious trends, I would fit a smooth line to approximate the trend.

I would follow this plotting pattern with the other singular variables (where appropriate), and then adding in multiple variables to the same plot (ie. grouping by location). I would also take note of any trends that are apparent but not linear, indicating that a transformation might be required for a linear regression model. The plots will all be saved in the `results/figures` directory.
