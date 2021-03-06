ScatterR-gui
============

ScatterR-gui is a graphical user interface for the basic use of Scatter-R.
Scatter-R is an implementation of Scatter-algorithm in [R](https://r-project.org).

Description
-----------

The ScatterR-gui provides a graphical user interface for Scatter-R.
Detailed description about the Scatter-R project can be found in the project [wiki](https://github.com/Tommytronic/Scatter-R/wiki).

Scatter is an algorithm useful to determine if the dataset or parts of it has such information that can be successfully used for classification and class prediction. [1] It can also used in dimensionality reduction as shown by Saarikoski et al. in [2].

It works simply by traversing the dataset from a randomly chosen starting case to always closest neighbour recording the class label. In this way a *collection vector* is produced and the *label change count* is calculated from the collection vector. Then, scatter value is calculated as a proportion of the label changes `v` and theoretical maximum number of label changes `w`, thus the equation for Scatter value `S = v / w`. [1]

Scatter value is also used to calculate *separation power*, which is the difference between random situation, i.e. the labels of the current dataset is randomly distributed, and the current situation. The equation for separation power is `F = z - s`, where `z` is the scatter value for random situation.[1]

```ScatterR-gui()``` function summons a graphical user interface
to assist in using the **scatter** algorithm
and the associated preprocessing function ```scatter.preprocess```.
```ScatterR-gui()``` provides an easy-to-use graphical interface for
reading data files,
making selections related to preprocessing
and the **scatter** algorithm calculation,
calling the ```scatter.preprocess``` and ```scatter``` functions
with the selected arguments
and ultimately saving the results.

## Installation

See installation instructions [here](https://github.com/Tommytronic/Scatter-R/blob/master/README.md).

Usage
-----

## Calling the GUI

```ScatterR-gui()``` opens the ScatterR-gui main window.

## Using the GUI

In the following, the GUI elements and their functionality
is described, starting from the top-most elements.

- **Read CSV datafile...** button
	- Opens a dialog to select a data file to read
	and the selections concerning the format of the data file.
	- **Select file...** opens the file selection dialog;
	user selects a CSV or TXT file containing the data to be
	processed with **Scatter** algorithm.
	- **Does the file have column headers? (Yes/No)**: Select "Yes" if
	your data has variable/column/attribute names on the first row,
	otherwise select "No".
	- **Select value separator**: Select the character that is
	used as value separator in your data file.
	Comma and semicolon are common options.
	- **Read file**: reads the file you have selected
	with the header and value separator selections you have made.
- **Select class variable...** button
	- Shows a list of the column/variable names in the data you have read
	using the **Read CSV datafile** button.
	- Select the name of the column that contains the class label information
	in your data.
	- When you read the datafile, the initial guess for the column containing
	class variable is going to be the rightmost factor-like column.
	Remember to select the correct column if your dataset's class variable column
	is not the rightmost factor-like column.
- **Select included classes...** button
	- Shows a list of the different class labels that the column you have selected
	as class label containing column with the **Select class variable** button
	- Check/Uncheck the classes you want included/excluded in/from the
	**scatter** calculation.
- **Select included variables...** button
	- Shows a list of the column/variable names in the data you have read
	using the **Read CSV datafile** button.
	- Check/Uncheck the columns/variables you want included
	in the scatter calculation.
- **Select variables to scale...** button
	- Shows a list of the column/variable names in the data you have read
	using the **Read CSV datafile** button, that are *numeric* and
	can be scaled by the preprocessing function.
	- Check/Uncheck the columns/variables you want to scale during preprocessing.
- **Select variables to binarize...** button
	- Shows a list of the column/variable names in the data you have read
	using the **Read CSV datafile** button, that are *factor-like* or *integer-like*
	and can be binarized by the preprocessing function.
	- Check/Uncheck the columns/variables you want to binarize during preprocessing.
- **Handling of missing values** radio button set
	- This option selects how missing values are handled during preprocessing.
	The preprocessing function always removes the rows where *classvar* is missing.
	- *Do nothing*: No action; Missing values are not estimated or removed.
	- *Replace with class median/mode*: Replaces missing values in each column
	with the median or mode (depending on the nature of the variable) of the
	*class* of the case with the missing value. This is the recommended
	missing value handling strategy.
	- *Replace with column median/mode*: Replaces missing values in each column
	with the column median/mode, depending on the nature of the data in the column.
	- *Remove rows*: Removes the rows that have missing values.
- **Select distance measure** radio button set
	- Select which distance measure is to be used in **scatter** calculation.
	- *Euclidean*: Euclidean distance measure.
	- *Manhattan*: Manhattan distance measure.
	- *HEOM*: Heterogenous Euclidean-Overlap Metric.
- **Iterations** spinbox
	- Selects the number of iterations for the **Scatter** calculation.
	Consult the **Scatter** algorithm documentation for details.
- **Baseline iterations** spinbox
	- Selects the number of baseline iterations for the **Scatter** calculation.
	Consult the **Scatter** algorithm documentation for details.
- **Select calculation** radio button set
	- Selects the calculation procedure for the **Scatter** algorithm.
	The different options are described
	in the **Scatter** algorithm documentation.
		- *Single*
		- *Variables*
		- *Classes*
		- *All*
- **Calculate** button
	- Starts the **Scatter** calculation with the selected data and options.
	Data is first preprocessed according to the preprocessing options
	and the preprocessed dataframe is then passed to the **Scatter** algorithm.
	- The results are printed in the R console
	- When the calculation finishes, ```scatter.gui```
	shows a dialog where it is possible to save the result.
		- **Save result to TXT file** button: Opens a save dialog to save the results
		in the format they are printed in the R console.
		- **Save result object as text representation** button:
		Opens a save dialog to save the results
		as an R object text representation, that can be read back to
		R environment with the ```dget()``` function.




Further reading and references
------------------------------

[1] Juhola, M., & Siermala, M. (2012). A scatter method for data and variable importance evaluation. Integrated Computer-Aided Engineering, 19 (2), 137–149. http://doi.org/10.3233/ICA-2011-0385

[2] Saarikoski, J., Laurikkala, J., Järvelin, K., Siermala, M., & Juhola, M. (2014). Dimensionality reduction in text classification using scatter method. International Journal of Data Mining, Modelling and Management, 6 (1), 1. http://doi.org/10.1504/IJDMMM.2014.059978
