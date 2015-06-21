##No.0- Preparation
#Set working directory to where UCI HAR Dataset was unzipped
setwd("C:/Users/Sean/Desktop/Coursera/UCI HAR Dataset/")

##No.1- Merge the training and the test sets to create one data set
#Read in the Train data- plus Features and Activity
features <- read.table('./features.txt',header=FALSE)
activityType <- read.table('./activity_labels.txt',header=FALSE)
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE)
xTrain <- read.table('./train/x_train.txt',header=FALSE)
yTrain <- read.table('./train/y_train.txt',header=FALSE)

#Assign column names
colnames(activityType) <- c('activityId','activityType')
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2] 
colnames(yTrain) <- "activityId"

#Merge yTrain, subjectTrain, and xTrain
trainingData <- cbind(yTrain,subjectTrain,xTrain)

#Read in the Test data
subjectTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest <- read.table('./test/x_test.txt',header=FALSE)
yTest <- read.table('./test/y_test.txt',header=FALSE)

#Assign column names 
colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2] 
colnames(yTest) <- "activityId"

#Merge xTest, yTest and subjectTest
testData <- cbind(yTest,subjectTest,xTest)

#Combine Train and Test into one Dataset
mergedData = rbind(trainingData,testData)

##No. 2- Extract only the measurements on the mean and standard deviation 
#Isolate the ID, mean() & stddev() columns using a logical vector and pattern matching
colNames <- colnames(mergedData) 
isolateData <- (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))

#Subset mergedData to keep only desired columns
mergedData <- mergedData[isolateData == TRUE]

#Update Column names
colNames <- colnames(mergedData) 

##No.3- Use descriptive activity names to name the activities in the Dataset
#Merge the dataset with the activityType table 
mergedData <- merge(mergedData,activityType,by='activityId',all.x=TRUE)

##No.4- Appropriately label the dataset with descriptive variable names. 

names(mergedData)<-gsub("^t", "time", names(mergedData))
names(mergedData)<-gsub("^f", "frequency", names(mergedData))
names(mergedData)<-gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData)<-gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData)<-gsub("Mag", "Magnitude", names(mergedData))
names(mergedData)<-gsub("BodyBody", "Body", names(mergedData))

##No.5- Create a second, independent tidy dataset with the average of each variable for each activity and each subject.

#Remove ActivityType column so averages can be taken
mergedData2 <- mergedData[,names(mergedData) != "activityType"]

#Summarize the new table to include just the mean of each variable
tidy_data <- aggregate(mergedData2[,names(mergedData2) != c('activityId','subjectId')], by= list(activityId= mergedData2$activityId, subjectId= mergedData2$subjectId),mean)

#Merge the new table with activityType to reintroduce descriptive activity names
tidy_data <- merge(tidy_data,activityType,by='activityId',all.x=TRUE)

#Export the tidy dataset 
write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
