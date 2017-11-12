# coursera-datascience-getting-and-cleaning-data-Week 4 assignment
This repo contains the project work done on the assignment given
This repository contains R code that downloads and does some preprocessing on Human Activity Recognition data set

A few steps were taken to transform the initial data set. The test and train sets have were merged and the subject identifiers and activity labels were pulled in to create a single data set. The activity identifiers were translated from identifiers into human-readable names. Only the mean and standard deviation variables were kept. Those variables were further summarized by taking their mean for each subject/activity pair.  There is a single row for each subject/activity pair, and a single column for each measurement.

The final data set can be found in the tidyMeans.txt file, which can be read into R with read.table()
