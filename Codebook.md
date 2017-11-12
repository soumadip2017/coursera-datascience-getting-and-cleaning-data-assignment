# Introduction

## The script run_analysis.R

* Downloads the data from UCI Machine Learning Repository
* Merges the training and test sets to create one data set
* Replaces activity values in the dataset with descriptive activity names
* Extracts only the measurements (features) on the mean for each measurement
* Appropriately labels the columns with descriptive names
* Creates a second, independent tidy dataset with an average of each variable for each each activity and each subject. 

In other words, same type of measurements for a particular subject and activity are averaged into 
one value and the tidy data set contains these mean values only. 
The processed tidy data set is also exported as csv file.

## The original data set
The original data set is split into training and test sets (70% and 30%, respectively) 
where each partition is also split into three files that contain

* measurements from the accelerometer and gyroscope
* activity label
* identifier of the subject

## Process Applied
The first step toward preparation is downloading the zipped file, unzip it and place all data related files in 
one folder and make it the working directory for me the working directory is 
 "H:/Coursera/Course3/Assignment/UCI HAR Dataset"


To understand the initial given data I had used generic comments like summary(), str(), head() 
That gave me an idea as in what data is stored in which fileand how many of observations are there in each of the files given
The readme.txt; features.txt and features_info.txt file given also helped in the initial study of the data provided

test files (3 of them mentioned below) contained 2947 observations each
     X_test.txt ; subject_test.txt and y_test.txt is combined to know 
     which subject did which activity and their respective 561 observations 
train files contained 7352 observations
      y_train.txt ; subject_train.txt and y_test.txt are the corresponding training files
      
## Steps followed within the program:-

* read the features file
* read and combine test-subject's data column wise 
* read and combine train-subject's data column wise 
* give names to additional columns added
* combining all the files with respective headings
* Only selecting the fields which has "mean" and "std" in the names
* convert the activity column from integer to factor
* using ddply to get the mean for a combination of subject and activity 
* writing the tidy file

## Subject and Activity
These variables identify the unique subject/activity pair the variables relate to:

Subject: the integer subject ID.
Activity: the string activity name:
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

## Measurement Values
* Time domain body acceleration mean along X, Y, and Z:
* MeanTimeBodyAccMeanX
* MeanTimeBodyAccMeanY
* MeanTimeBodyAccMeanZ
* Time domain body acceleration standard deviation along X, Y, and Z:
* MeanTimeBodyAccStdDevX
* MeanTimeBodyAccStdDevY
* MeanTimeBodyAccStdDevZ
* Time domain gravity acceleration mean along X, Y, and Z:
* MeanTimeGravityAccMeanX
* MeanTimeGravityAccMeanY
* MeanTimeGravityAccMeanZ
* Time domain gravity acceleration standard deviation along X, Y, and Z:
* MeanTimeGravityAccStdDevX
* MeanTimeGravityAccStdDevY
* MeanTimeGravityAccStdDevZ
* Time domain body jerk mean along X, Y, and Z:
* MeanTimeBodyAccJerkMeanX
* MeanTimeBodyAccJerkMeanY
* MeanTimeBodyAccJerkMeanZ
* Time domain body jerk standard deviation along X, Y, and Z:
* MeanTimeBodyAccJerkStdDevX
* MeanTimeBodyAccJerkStdDevY
* MeanTimeBodyAccJerkStdDevZ
* Time domain gyroscope mean along X, Y, and Z:
* MeanTimeBodyGyroMeanX
* MeanTimeBodyGyroMeanY
* MeanTimeBodyGyroMeanZ
* Time domain gyroscope standard deviation along X, Y, and Z:
* MeanTimeBodyGyroStdDevX
* MeanTimeBodyGyroStdDevY
* MeanTimeBodyGyroStdDevZ
* Time domain gyroscope jerk mean along X, Y, and Z:
* MeanTimeBodyGyroJerkMeanX
* MeanTimeBodyGyroJerkMeanY
* MeanTimeBodyGyroJerkMeanZ
* Time domain gyroscope jerk standard deviation along X, Y, and Z:
* MeanTimeBodyGyroJerkStdDevX
* MeanTimeBodyGyroJerkStdDevY
* MeanTimeBodyGyroJerkStdDevZ
* Time domain body acceleration magnitude mean:
* MeanTimeBodyAccMagMean
* Time domain body acceleration magnitude standard deviation:
* MeanTimeBodyAccMagStdDev
* Time domain gravity acceleration magnitude mean:
* MeanTimeGravityAccMagMean
* Time domain gravity acceleration magnitude standard deviation:
* MeanTimeGravityAccMagStdDev
* Time domain body jerk magnitude mean:
* MeanTimeBodyAccJerkMagMean
* Time domain body jerk magnitude standard deviation:
* MeanTimeBodyAccJerkMagStdDev
* Time domain gyroscope magnitude mean:
* MeanTimeBodyGyroMagMean
* Time domain gyroscope magnitude standard deviation:
* MeanTimeBodyGyroMagStdDev
* Time domain gyroscope jerk magnitude mean:
* MeanTimeBodyGyroJerkMagMean
* Time domain gyroscope jerk magnitude standard deviation:
* MeanTimeBodyGyroJerkMagStdDev
* Frequency domain body acceleration mean along X, Y, and Z:
* MeanFrequencyBodyAccMeanX
* MeanFrequencyBodyAccMeanY
* MeanFrequencyBodyAccMeanZ
* Frequency domain body acceleration standard deviation along X, Y, and Z:
* MeanFrequencyBodyAccStdDevX
* MeanFrequencyBodyAccStdDevY
* MeanFrequencyBodyAccStdDevZ
* Frequency domain body jerk mean along X, Y, and Z:
* MeanFrequencyBodyAccJerkMeanX
* MeanFrequencyBodyAccJerkMeanY
* MeanFrequencyBodyAccJerkMeanZ
* Frequency domain body jerk standard deviation along X, Y, and Z:
* MeanFrequencyBodyAccJerkStdDevX
* MeanFrequencyBodyAccJerkStdDevY
* MeanFrequencyBodyAccJerkStdDevZ
* Frequency domain gyroscope mean along X, Y, and Z:
* MeanFrequencyBodyGyroMeanX
* MeanFrequencyBodyGyroMeanY
* MeanFrequencyBodyGyroMeanZ
* Frequency domain gyroscope standard deviation along X, Y, and Z:
* MeanFrequencyBodyGyroStdDevX
* MeanFrequencyBodyGyroStdDevY
* MeanFrequencyBodyGyroStdDevZ
* Frequency domain body acceleration magnitude mean:
* MeanFrequencyBodyAccMagMean
* Frequency domain body acceleration magnitude standard deviation:
* MeanFrequencyBodyAccMagStdDev
* Frequency domain body jerk magnitude mean:
* MeanFrequencyBodyAccJerkMagMean
* Frequency domain body jerk magnitude standard deviation:
* MeanFrequencyBodyAccJerkMagStdDev
* Frequency domain gyroscope magnitude mean:
* MeanFrequencyBodyGyroMagMean
* Frequency domain gyroscope magnitude standard deviation:
* MeanFrequencyBodyGyroMagStdDev
* Frequency domain gyroscope jerk magnitude mean:
* MeanFrequencyBodyGyroJerkMagMean
* Frequency domain gyroscope jerk magnitude standard deviation:
* MeanFrequencyBodyGyroJerkMagStdDev
