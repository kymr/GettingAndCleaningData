Getting and Cleaning Data - Course Project
==========================================

## Introduction

This repository is related Coursera "Getting and Cleaning Data" (https://class.coursera.org/getdata-011)


One of the most exciting areas in all of data science right now is wearable computing - see for example this article.
http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## How to 

You can download the dataset files below
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R : R script that makes upper data tidy

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Result Files

tidyData.txt : pre-processed tidy result data
CodeBook.md : tidyData.txt 's detail infomation
