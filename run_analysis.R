
##The run_analysis program takes the test and train data sets and merges them into one data set. 
##The program merges the Subject and Activity files with the train and test data set, and uses the Features file to name the columns.
library(plyr)
library(dplyr)

##read in the different files as data frames

testData<-as.data.frame(read.table("X_test.txt"))
trainData<-as.data.frame(read.table("X_train.txt"))
features<-as.data.frame(read.table("features.txt"))
testSubject<-as.data.frame(read.table("subject_test.txt"))
trainSubject<-as.data.frame(read.table("subject_train.txt"))
testActivity<-as.data.frame(read.table("Y_test.txt"))
trainActivity<-as.data.frame(read.table("Y_train.txt"))
activities<-as.data.frame(read.table("activity_labels.txt"))

##change the column names in the test and train data sets to the names given in the second column of the features text file.
colnames(testData)<-features[,2]
colnames(trainData)<-features[,2]

##select only the columns for the mean and standard deviation from the test data.
testmeanstd<-testData[c(1:6, 41:46, 81:86,121:126, 161:166, 266:271,345:350, 424:429)]

##select only the columns for the mean and standard deviation from the training data.
trainmeanstd<-trainData[c(1:6, 41:46, 81:86,121:126, 161:166, 266:271,345:350, 424:429)]

##join the test and train Activities with the activity labels
testActivityLabels<-join(testActivity, activities)
trainActivityLabels<-join(trainActivity, activities)

##Rename the V2 columns of the test and train activity labels with the name Activity and select only that column from the test and train activity data frames.
testActivityLabels<-rename(testActivityLabels, replace=c("V2"="Activity"))
testActivityLabels<-select(testActivityLabels, Activity)
trainActivityLabels<-rename(trainActivityLabels, replace=c("V2"="Activity"))
trainActivityLabels<-select(trainActivityLabels,Activity)

##bind the test subjects with the test data
testSubject<-rename(testSubject, replace=c("V1"="Subject"))
testDatabySubject<-cbind(testSubject,testActivityLabels,testmeanstd)

##bind the train subjects with the train data
trainSubject<-rename(trainSubject, replace=c("V1"="Subject"))
trainDatabySubject<-cbind(trainSubject, trainActivityLabels,trainmeanstd)

##bind the rows of the test data (by subject) and the rows of train data (by subject) to create the combined data set.
testAndTrain<-rbind(testDatabySubject,trainDatabySubject)

##Create the tidy data set by grouping the combined data set by subject and activity and using the mean function to summarize each column.
SummaryData<-testAndTrain %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

##output the text file with the tidy data set.
write.table(SummaryData, "run_analysis_summary.txt", sep="\t", row.name=FALSE)