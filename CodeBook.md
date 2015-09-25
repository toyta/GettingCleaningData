###CodeBook for run_analysis Project

* Author: Tobie A. Toy
* Date: 25 SEPT 2015
* Getting and Cleaning Data Coursera Coursera

============================================
###Data Collection/Study Design

Summary: Background information for the data set and purpose of the underlying data set can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  The purpose of the run_analysis project was to take the raw data (found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and merge it into a tidy data set. The resulting tidy data set contains only the measurements of interest--means and standard deviations for both the time domain and frequency domain signals in the X, Y, and Z directions for body acceleration, gravity acceleration, and jerk. 

Data files: Eight data files were used in the run_analysis study. Each of these were text files. 

(1.) 'X_train.txt': All measurements for the set of training subjects
- Dimensions: 7352 rows x 561 columns
- Column Headers: None 

(2.) 'Y_train.txt': The numerical activity descriptor corresponding to each row in X_train.
- Dimensions: 7352 rows X 1 column
- Column Headers: None

(3.) 'X_test.txt': All measurements for the set of test subjects
- Dimensions: 2947 rows X 561 columns
- Column Headers: None

(4.) 'Y_test.txt': The numerical activity descriptor corresponding to each row in X_test. 
- Dimensions: 2947 rows X 1 column
- Column Headers: None

(5.) 'subject_train.txt': The numerical subject descriptor corresponding to each row in X_train. 
- Dimensions: 7352 rows X 1 column
- Column Headers: None

(6.) 'subject_test.txt': The numerical subject descriptor corresponding to each row in X_test. 
- Dimensions: 2947 rows X 1 column
- Column Headers: None

(7.) 'activity_labels.txt': Reference table mapping the numerical activity descriptor to the activity nomenclature. 
- Dimensions: 6 rows X 2 columns
- Column Headers: None

(8.) 'features.txt': Reference table mapping columns in X_test and X_train to the measurement nomenclature. 
- Dimesions: 561 rows X 2 columns
- Column Headers: None

Note: The 'features_info.txt' file was referenced for measurement knowledge

================================================
###Variable Units
* Total and body accelerations are measured in Gs (gravity of earth, 9.8 m/sec^2)
* Gyroscope units are measured in radians/second

For the list of variables in "Merging the Data" below, variables containing "Acc" are measured in Gs and those containing "Gyro" are rad/sec. 

================================================
###Merging the Data

The data sets were merged in the following way:

(1.) The 'X_train.txt' and 'X_test.txt' data sets were given proper column names by using the second column of 'features.txt' as the column names.

(2.) The measurements of interest were determined by using 'features_info.txt' and 'features.txt' as references. Only the mean and standard deviation for the domain and frequency signals in the X, Y, and Z directions for body acceleration, gravity acceleration, and jerk were selected. The variables selected from both the 'X_train.txt' and 'X_test.txt' files were:
* tBodyAcc-mean()-X		
* tBodyAcc-mean()-Y		
* tBodyAcc-mean()-Z		
* tBodyAcc-std()-X		
* tBodyAcc-std()-Y		
* tBodyAcc-std()-Z		
* tGravityAcc-mean()-X		
* tGravityAcc-mean()-Y		
* tGravityAcc-mean()-Z		
* tGravityAcc-std()-X		
* tGravityAcc-std()-Y		
* tGravityAcc-std()-Z		
* tBodyAccJerk-mean()-X		
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z

(3.) The 'Y_test.txt' and 'Y_train.txt' Activities were joined with 'activity_labels.txt' to provide an activity nomenclature for each numerical activity idenitifier. The column was renamed to "Activity" and only that column was selected.

(4.) The subjects in 'subject_test.txt' and the activities in 'Y_test.txt' were column binded to 'X_test.txt'.  'subject_train.txt' and 'Y_train.txt' were column binded to 'X_train.txt' so each row would have a corresponding subject and activity.

(5.) The resulting data frames in 4. above were row binded to create a complete data set. 

The R code can be found at https://github.com/toyta/GettingCleaningData/blob/master/run_analysis.R

=================================================
###Creating a Tidy Data Set

1. Using the resulting data set in 5. above, the data was grouped by subject and activity. 
2. Each measurement column was then summarized using the mean function in R. 
3. The data was written out to a text file named "run_analysis_summary.txt" 









