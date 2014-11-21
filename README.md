Coursera-Getting-and-Cleaning-Data-Course-Project
================================================

The course project for the Getting and Cleaning Data course part of the Data Science Specialization track on Coursera.

## Data
The data sets used in this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
The data sets being used can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The training and the test data sets are merged to create one data set.

##How the  run_analysis.R script works
The files for this project are contained in the following zip folder:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis script works by first unzipping all the files to your working directory.
It then reads all the tables into R.
The test and training sets are all merged together using cbind and rbind.
The variable names are then read from the features text file and added to the data frame.
The mergedData is then subset to include only columns that have "mean", "std", "Activity" or "Subject"
The activity_labels.txt is read and column with descriptive activity names is added to the data set.
The plyr package is loadded into R and a second data set is created with the average of each variable for each activity and each subject.
Lastly, this new data set is written into a text document and named tidydata.txt using the write.table function.

##Code Book
See the Code Book file for information regarding the variables, units of measurements and calculated summaries. 


