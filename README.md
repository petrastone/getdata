# README

# Data Cleaning of HAR Data

The data for this study came from [HAR Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
[Anguita et al, 2013](#har)

The objective of this course project is to use the principles of "Tidy data" as outlined in [Wickham, 2014](#hadley):

 1. Each variable forms a column
 2. Each observation forms a row
 3. Each type of observational unit forms a table
 
Data will be loaded and tidied according to the above principles and a new tidy data set summarising the means of selected variables grouped by person and activity will be written out by `run_analysis.R`.
 
## Background of HAR Study
The dataset consists of recordings of accelerometer and gyroscope readings from 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. [Anguita et al, 2013](#har)

## What the script does
* `run_analysis.R` loads the training and test data and merges them into a dataframe `data`.
* Column names are extracted from `features.txt`, made unique and applied to `data`  (see [codebook.md](codebook.md) )
* A smaller subset `data2` only containing variables measuring mean and standard deviation is extracted
* The `activity` variable is given descriptive labels to replace codes supplied in the raw data.
* The column names of `data2` are cleaned and made more consistent (see [codebook.md](codebook.md) )
* A new tidy dataframe `tidyData` is created. 
* `tidyData` summarises `data2` by `subject` and `activity` giving the mean of each variable (see ([codebook.md](codebook.md)).
* In order to make it clear that `tidyData` contains averages (sometimes of averages) `meanOf` is appended to the column names.

## Tidy Data
This is a tidy data set because it conforms to the requirements of each variable forming a column, each observation forming a row and being a single table for each type of observation.

You can load the script's output with:

<pre>
<code>tidyData <- read.table("tidyData.txt", header=T)</code>
</pre>

## Codebook
 Information on variable names [codebook.md](codebook.md)


## Assumptions

* Data must be downloaded from [HAR Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzipped to create a directory `UCI HAR Dataset`
* "Average" refers to the arithmetic mean
* I assume "LAYING" means "LYING DOWN" rather than laying something down.


## References
<div id="refs" class="references">
<div id="har">
<p>Anguita, D., A. Ghio, L. Oneto, X. Parra, and J. L. Reyes-Ortiz. 2013. “A Public Domain Dataset for Human Activity Recognition Using Smartphones.”</p>
</div>
<div id="ref-Lichman:2013">
<p>Lichman, M. 2013. “UCI Machine Learning Repository.” University of California, Irvine, School of Information and Computer Sciences. <a href="http://archive.ics.uci.edu/ml" class="uri">http://archive.ics.uci.edu/ml</a>.</p>
</div>
<div id="ref-JSSv059i10">
<a id="hadley"></a>
<p>Wickham, Hadley. 2014. “Tidy Data.” <em>Journal of Statistical Software</em> 59 (1): 1–23. doi:<a href="https://doi.org/10.18637/jss.v059.i10">10.18637/jss.v059.i10</a>.</p>
</div>
</div>
</div>
