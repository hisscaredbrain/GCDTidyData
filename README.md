# Course Project in Getting and Cleaning Data
Author: Harsha UB

This project uses the data from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This is a part of the UCI machine learning repository that we learned about in the course. If one desires, dataset and dataset description can be downloaded from the above links as well. However, we shall use the dataset that been mirrored in a course specific [location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Objective or Goal of this project as described in the course material
The purpose of this project is to demonstrate ones ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This translates into following artefacts that need to be present in the repository - 

1) A tidy data set as described in the project(see below description in steps)
2) A link to a Github repository with your script for performing the analysis
3) A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) A README.md in the repo with your scripts. This [file](https://github.com/hisscaredbrain/GCDTidyData/blob/master/README.md) explains how all of the scripts work and how they are connected.

All the data processing is carried out in a file [run_analysis.R](https://github.com/hisscaredbrain/GCDTidyData/blob/master/run_analysis.R) that does the following:  

Step 1: Merges the training and the test sets to create one data set.  
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.  
Step 3: Uses descriptive activity names to name the activities in the data set.  
Step 4: Appropriately labels the data set with descriptive variable names.  
Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Summary

The following artefacts have been created as a part of this project - 

Item | Description | Link to Item
--- | ---- | ---
run_analysis.R | File containing R code for doing data processing and generating the clean data set | [R Script Link](https://github.com/hisscaredbrain/GCDTidyData/blob/master/run_analysis.R)
Tidy Dataset | Clean dataset which is the outcome of Step 5 as described above | [Link](To be updated)
CodeBook.md | A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data in Steps 1 - 5 | [CodeBook.md](https://github.com/hisscaredbrain/GCDTidyData/blob/master/CodeBook.md)
README.md | This document! | [README.md](https://github.com/hisscaredbrain/GCDTidyData/blob/master/README.md)
