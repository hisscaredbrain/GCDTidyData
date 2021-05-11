# This script is a part of the course project in Getting and Cleaning Data

# Load packages that are going to be used
library(data.table)
library(reshape2)

# Download the dataset ------------------------------------
fileURL1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("data")) {
  dir.create("data")
}
download.file(fileURL1, destfile = "./data/dataFiles.zip", method = "curl")
unzip(zipfile = "./data/dataFiles.zip", exdir = "./data")

# Load activity labels and features
activityLabels <- fread("./data/UCI HAR Dataset/activity_labels.txt",
                        col.names = c("classLabels", "activityName"))
features <- fread("./data/UCI HAR Dataset/features.txt",
                  col.names = c("index", "featureNames"))
# Step 2 (Step 1 follows later)
# We are primarily interested in features containing mean and standard deviation
featuresDesired <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresDesired, featureNames]
measurements <- gsub('[()]', '', measurements)

# Load training dataset
trainingDS <- fread("./data/UCI HAR Dataset/train/X_train.txt")[, featuresDesired, with = FALSE]
data.table::setnames(trainingDS, colnames(trainingDS), measurements)
trainingActivity <- fread("./data/UCI HAR Dataset/train/Y_train.txt", 
                          col.names = c("Activity"))
trainingSubject <- fread("./data/UCI HAR Dataset/train/subject_train.txt",
                         col.names = c("SubjectNum"))
trainingDS <- cbind(trainingSubject, trainingActivity, trainingDS)

# Load testing dataset
testDS <- fread("./data/UCI HAR Dataset/test/X_test.txt")[, featuresDesired, with = FALSE]
data.table::setnames(testDS, colnames(testDS), measurements)
testActivity <- fread("./data/UCI HAR Dataset/test/Y_test.txt", 
                          col.names = c("Activity"))
testSubject <- fread("./data/UCI HAR Dataset/test/subject_test.txt",
                         col.names = c("SubjectNum"))
testDS <- cbind(testSubject, testActivity, testDS)

# Step 1 : Merge the datasets
combinedDS <- rbind(trainingDS, testDS)

# Step 3 : All activity names are descriptive
# Step 4 : All variables/column names are descriptive
combinedDS[["Activity"]] <- factor(combinedDS[, Activity],
                                   levels = activityLabels[["classLabels"]],
                                   labels = activityLabels[["activityName"]])
combinedDS[["SubjectNum"]] <- as.factor(combinedDS[, SubjectNum])

# Step 5: create a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
combinedDS <- reshape2::melt(data = combinedDS, id = c("SubjectNum", "Activity"))
combinedDS <- reshape2::dcast(data = combinedDS, 
                              SubjectNum + Activity ~ variable,
                              fun.aggregate = mean)

# Submission guidelines explicitly ask for using write.table
write.table(x = combinedDS, file = "./data/tidyData.txt", row.name = FALSE)
#data.table::fwrite(x = combinedDS, file = "./data/tidyData.txt", quote = FALSE)

# table stored in csv file for faster import and easy preview
data.table::fwrite(x = combinedDS, file = "./data/tidyData.csv", quote = FALSE)