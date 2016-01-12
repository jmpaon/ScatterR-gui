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

> Note, that these instructions are same as in ScatterR-algoritmipaketin README-tiedostossa (commit: 1c05c01f7b92c1458a3e53dc41ae50366616359a).

Follow these instructions to install Scatter-project. If you know, what you're doing, you can choose the installation method of your liking.

These installation instructions are tested with Windows 8 and Windows 10 operating systems using R versions 3.2.2 and 3.2.3.

### ScatterR-package
 
Follow these steps to install the Scatter-R package, which contains the algorithm itself and command line interface to it. Installation of the GUI package is described later.

The name of the package is ScatterR even though the repository and project name has dash in it. This is because R doesn't allow dashes in the name of the package.

Go to the [Releases](https://github.com/Tommytronic/Scatter-R/releases) page of the project and find out, which is the most recent release. Under the heading "Downloads" you will find source archives and at least one archive, which name ends with `_release`. Copy it's URL to clipboard since you will need it.
 
Install the package using following commands.

> Note, that the URL may vary depending on the release. In general, the package name ends with `_release`.

#### Install the package.

Install the package by issuing following command in R console.

```R
install.packages("https://github.com/Tommytronic/Scatter-R/releases/download/v0.9/ScatterR_0.9_release.tar.gz", repos = NULL, method = "libcurl")
```

#### Test the installation

After the installation has completed without errors, it's time to test the installation.

Issue following commands.

```R
library(ScatterR)
run(iris)
```

The `library`-command loads and attaches the ScatterR package to the search path and it's ready to be used.

The `run`-command runs the usecase `single` for the whole iris dataset. The iris dataset is part of R and you don't need to get and install it.

After the `run` is completed, it prints out some information about the results. More information about these on Usage-section.

### GUI for ScatterR

This package is not currently in CRAN repositories and there's some other issues too, so it's installation is not as simple as it could be. Also, it's further development idea to find out how to simplify the installation process of the GUI.

We have separated GUI from ScatterR package and those who needs or wants GUI, can install it as a separate package. The GUI and these same instructions can be found [here](https://github.com/jmpaon/scatterr-gui). 

Our GUI is written using gWidgets2 and GTK, so you need to ensure those are installed too.

Issue following command to install all other GUI dependencies but GTK-package itself.

```R
install.packages("RGtk2", depen = T)
library(RGtk2)
```

When you issue `install.packages("RGtk2", depen = T)`-command, you will be prompted for repository to use. Choose a location close to you and click OK.

After you issue `library(RGtk2)`-command, you get an error and prompt to install GTK-library. Click OK to install the GTK-bundle. After that, restart R console and issue following commands. [5]

```R
install.packages("gWidgets2RGtk2")
```

Now all GUI dependencies are installed and GUI itself can be installed by issuing following command.

```R
install.packages("https://github.com/jmpaon/ScatterR-gui/releases/download/0.9/ScatterRGui_0.9.tar.gz", repos = NULL, method = "libcurl")
```

After installation is complete, you can load and run the GUI by issuing commands `library(ScatterRGui)` and `ScatterR.gui()`.

You might get some version warning when installing or running GUI, but if everything works, you can dismiss those. Otherwise, please open an [issue](https://github.com/jmpaon/ScatterR-gui/issues) at Github.


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
