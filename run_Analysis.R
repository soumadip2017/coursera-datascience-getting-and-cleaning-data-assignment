## This is the code which Course 3 Week 4 assignment
## the file is to be named run_Analysis.R

## The first step toward preparation is downloading the 
## zipped file, unzip it and place all data related files in 
## one folder and make it the working directory
## for me the working directory is 
##  "H:/Coursera/Course3/Assignment/UCI HAR Dataset"
## I would be writing the code in the same directory so the code can directly refer to it

## To understand the data I had used generic comments like summary(), str(), head() 
## That gave me an idea as in what data is stored in which file
## and how many of observations are there in each of the files given
## The readme.txt; features.txt and features_info.txt file given also helped in the initial
## study of the data provided

## test files (3 of them mentioned below) contained 2947 observations each
##      X_test.txt ; subject_test.txt and y_test.txt is combined to know 
##      which subject did which activity and their respective 561 observations 
## train files contained 7352 observations
##      y_train.txt ; subject_train.txt and y_test.txt are the corresponding training files

## read the features file
featureNames <- read.table("features.txt")

## read and combine test-subject's data column wise 
x.test <- read.table("X_test.txt")
subject.test <- read.table("subject_test.txt")
y.test <- read.table("y_test.txt")

names(subject.test) <- "subjectID"
names(y.test) <- "ActivityID"
names(x.test) <- featureNames$V2

## read and combine train-subject's data column wise 
x.train <- read.table("X_train.txt")
subject.train <- read.table("subject_train.txt")
y.train <- read.table("y_train.txt")


names(subject.train) <- "subjectID"
names(y.train) <- "ActivityID"
names(x.train) <- featureNames$V2

## combining all the files with respective headings

train <- cbind(subject.train, y.train, x.train)
test <- cbind(subject.test, y.test, x.test)
combined <- rbind(train, test)

## Only selecting the fields which has "mean" and "std" in the names
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
    grepl("std\\(\\)", names(combined))

## Making sure we do not lose the Subject ID and Activity Columns ; 
## they are the first two columns of the combined data frame 
meanstdcols[1:2]<- TRUE

## Removing all other columns using the index created 
combined.selected <- combined[, meanstdcols]

## One can cross check the result by using the below mentioned command
## names(combined.selected)


# convert the activity column from integer to factor
combined.selected$ActivityID <- factor(combined.selected$ActivityID, labels=c("Walking",
                                                        "Walking Upstairs", 
                                                        "Walking Downstairs", 
                                                        "Sitting", 
                                                        "Standing", 
                                                        "Laying"))
combined.selected$subjectID <- as.factor(combined.selected$subjectID)

## it is needed to load the plyr package
## library("plyr")

## defining a function which could be repeated applied
limitedColMeans <- function(data) { colMeans(data[,-c(1,2)]) }

tidy.mean.data <- ddply(combined.selected, 
                        .(subjectID, 
                          ActivityID), 
                        limitedColMeans)


## writing the data onto an external .txt file

write.csv(tidy.mean.data, file = "tidy_mean_data.txt", row.names = FALSE)






