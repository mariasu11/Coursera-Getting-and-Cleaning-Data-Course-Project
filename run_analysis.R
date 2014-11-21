
## Download and unzip dataset
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="tempFile")
unzip(tempFile)

## Read all the data sets
testSubject <- read.table("subject_test.txt", header = F, stringsAsFactors = F, fill = T)
testX <- read.table("X_test.txt", header = F, stringsAsFactors = F, fill = T)
testY <- read.table("y_test.txt", header = F, stringsAsFactors = F, fill = T)
trainSubject <- read.table("subject_train.txt",header = F, stringsAsFactors = F, fill = T)
trainX <- read.table("X_train.txt", header = F, stringsAsFactors = F, fill = T)
trainY <- read.table("y_train.txt", header = F, stringsAsFactors = F, fill = T)

## Merge the training and the test sets to create one data set. 
mergedData <- cbind(rbind(testSubject, trainSubject),rbind(testY, trainY), rbind(testX, trainX))

## Read the variables names from features.txt
features <- read.table("features.txt", header = F, stringsAsFactors = F, fill = T)

## Set meaningful names for first columns, those from Subject and Y
colnames(mergedData)[1:2] <- c("Subject", "Activity")

## Set names for all other columns, those coming from X, according to features data frame
colnames(mergedData)[3:563] <- features[, 2]

## Subset mergedData to only include columns that have "mean", "std", "Activity" or "Subject" 
mergedData <- mergedData[, grepl("mean()|std()|Activity|Subject", colnames(mergedData)) & !grepl("meanFreq", colnames(mergedData))]

## Read activity names from activity_labels.txt
activities <- read.table("activity_labels.txt", header = F, stringsAsFactors = F, fill = T)


## Label the data set with descriptive activity names.
mergedData$Activity <- factor(mergedData$Activity, levels = activities[, 1], labels = activities[, 2])

## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidyData <- ddply(mergedData, .(Subject, Activity), .fun=function(x) { colMeans(x[ ,-c(1:2)]) })

## Write out resulting tidy data with write.table
write.table(tidyData, "tidydata.txt", row.names = FALSE)