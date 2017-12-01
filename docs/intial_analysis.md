# Initial Analysis

### Data Set

Link: [https://www.kaggle.com/zynicide/wine-reviews](https://www.kaggle.com/zynicide/wine-reviews)

Description:

The data consists of 10 fields:

* Points: The number of points WineEnthusiast rated the wine on a scale of 1-100 (reviews are only for wines that score >=80).

* Title: The title of the wine review, which often contains the vintage.

* Variety: The type of grapes used to make the wine (ie. Pinot Noir).

* Description: A few sentences from a sommelier describing the wine's taste (ie. smell, look, feel, etc.).

* Country: The country that the wine is from.

* Province: The province or state that the wine is from.

* Region 1: The wine growing area in a province or state (ie. Napa).

* Region 2: Sometimes there are more specific regions specified within a wine growing area (ie. Rutherford inside the Napa Valley), but this value can sometimes be blank.

* Winery: The winery that made the wine.

* Designation: The vineyard within the winery where the grapes that made the wine are from.

* Price: The cost for a bottle of the wine.

* Taster Name: Name of the person who tasted and reviewed the wine.

* Taster Twitter Handle: Twitter handle for the person who tasted and reviewed the wine.

Format:

* Approximately 130K rows.

* Downloaded as a `.zip` file.

* Extracted into both JSON and CSV format.


### Research Question

Does the price of wine follow a trend based on the other factors that make up a wine? That is, can we predict the price of a wine knowing certain features about that wine (ie. location, winery, grapes used, description, rating, etc.)?

### Hypothesis

Using the wine rating data set, I hypothesize that there is no trend in wine prices that can be predicted using one or more of the explanatory variables.

### Initial Analysis
