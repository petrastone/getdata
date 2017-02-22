---
title: "README.Rmd"
author: "Petra Stone"
date: "2/22/2017"
output: html_document
bibliography: bibliography.bibtex
link-citations: true
nocite: | 
  @Lichman:2013, @JSSv059i10
---

### Data Cleaning of HAR Data

The data for this study came from [HAR Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). [@jorge_esann2013_2]

The objective of this course project is to use the principles of "Tidy data" as outlined in Hadley Wickham's paper [@@JSSv059i10]:

 1. Each variable forms a column
 2. Each observation forms a row
 3. Each type of observational unit forms a table
 
Data will be loaded and tidied according to the above principles and a new tidy data set summarising the means of selected variables grouped by person and activity will be written out by `run_analysis.R`.
 
## Background of HAR Study
The dataset consists of recordings of accelerometer and gyroscope readings from 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. [@jorge_esann2013_2]

## What the script does
* `run_analysis.R` loads the training and test data and merges them into a dataframe `data`.
* Column names are extracted from `features.txt`, made unique and applied to `data`  (see [codebook.Rmd](codebook.Rmd) )
* A smaller subset `data2` only containing variables measuring mean and standard deviation is extracted
* The `activity` variable is given descriptive labels to replace codes supplied in the raw data.
* The column names of `data2` are cleaned and made more consistent (see [codebook.Rmd](codebook.Rmd) )
* A new tidy dataframe `tidyData` is created. 
* `tidyData` summarises `data2` by `subject` and `activity` giving the mean of each variable (see ([codebook.Rmd](codebook.Rmd)).
* In order to make it clear that `tidyData` contains averages (sometimes of averages) `meanOf` is appended to the column names.

## Tidy Data
TODO

## Codebook
 Information on variable names [codebook.Rmd](codebook.Rmd)


## Assumptions

* Data must be downloaded from [HAR Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzipped to create a directory `UCI HAR Dataset`
* "Average" refers to the arithmetic mean
* I assume "LAYING" means "LYING DOWN" rather than laying something down.


## References
