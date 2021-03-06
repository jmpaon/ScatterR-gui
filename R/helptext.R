#' Returns the help text for ScatterR-gui function

get_helptext <- function() {return("
Please consult the Scatter-R documentation 
for detailed instructions and description of the algorithm.

Start by selecting your data file from READ CSV DATAFILE.
Your input data must be in plain CSV format.
Make the selections concerning the headers and value separator
of your datafile
and click READ FILE button.

SELECT CLASS VARIABLE button opens a dialog where you can 
select the column that contains the classification variable
of your datafile. Calculating Scatter values requires 
that a class variable is indicated in the input data.
It is important to check if the correct column for class variable
is selected by default!

Select the classes and variables you want to 
include in the analysis from corresponding buttons.
By default, all classes and variables are selected.

Select the variables subject for 
scaling and binarization preprocessing
from the corresponding buttons.
It is normally recommended that numerical variables are scaled
and nominal variables are binarized.
The GUI, by default, selects numerical variables for scaling
and factor-like variables for binarization.

HANDLING OF MISSING VALUES option determines how missing values
are dealt with. The recommended strategy is that
missing values are replaced with class median (for numerical variables)
or class mode (for nominal variables) is selected by default.

In the OTHER OPTIONS section you can select the used distance measure,
number of iterations and baseline iterations
and the calculation procedure.
Note that the selections affect the calculation time significantly.

After making appropriate selections, press CALCULATE button.
Once the calculation finishes, the results are printed in the R console
and a dialog where you can plot and save the result is opened.
")}
