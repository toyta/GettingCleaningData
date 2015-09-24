#run_analysis.R README file
===========================================
Tobie A. Toy
Getting and Cleaning Data Coursera Course
24 SEPT 2015
===========================================
The run_anlysis R program uses the following libraries:
plyr
dplyr
===========================================
Using the data described in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, the run_analysis program merges the following datasets:

- 'activity_labels.txt' is joined separately to both the 'Y_train.txt' and 'Y_test.txt' files to give each row of the test and train data sets a recognizable activity 
- 'X_test.txt' and 'X_train.txt' are the main datasets and are merged via rowbinding to create a complete data set of all 30 subjects.
- 'subject_train.txt' and 'subject_test.txt' are column binded to the data sets such that each row contains the specific person (designated by a number 1-30) that corresponds to the measures. 
- 'features.txt' is used to name the dataset columns

===========================================
The output of the program is a tab-delimited, tidy data set called 'run_analysis_summary.txt' that uses the mean fuction to summarize the following mean and standard deviation measures by subject and activity:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z

tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z

tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z

tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z

tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z

fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z

fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z

fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z