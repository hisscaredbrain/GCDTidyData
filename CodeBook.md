This code book contains information on all variables used in [run_analysis.R](https://github.com/hisscaredbrain/GCDTidyData/blob/master/run_analysis.R)

Variable name | Description
---- | ------
fileURL1 | Variable to hold the URL of the dataset to be downloaded
activityLabels | List of activities
features | Index and feature names
featuresDesired | List of features containing mean and std
measurements | Subset of features containing ONLY desired features
trainingActivity | Activity training data
trainingSubject | Identifies the subject who carried out the activity
trainingDS | Training Dataset
testActivity | Activity test data
testSubject | Identifies the subject who carried out the activity
testDS | Test Dataset
combinedDS | Combined dataset containing both training and test data
tidyData.txt | Tidy dataset written to a text file
tidyData.csv | Tidy dataset written to a csv file
