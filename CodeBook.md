###Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition, plus one initial preparatory step.

###No.0- Preparation
####Set the R working directory to where the UCI HAR Dataset was unzipped.

###No.1- Merge the training and the test sets to create one data set.
1. Read in the Features, Activty, and Train data files using `read.table()`
    * features.txt
    * activity_labels.txt
    * subject_train.txt
    * x_train.txt
    * y_train.txt
2. Assign column names using the colnames function
3. Merge yTrain, subjectTrain, and xTrain using `cbind()`
4. Repeat the steps 1 through 3 for the Test data files
    *	subject_test.txt
    * x_test.txt
    *	y_test.txt
5. Combine Train and Test into one Dataset using `rbind()`

###No.2- Extract only the measurements on the mean and standard deviation 
####Isolate the ID, mean() & stddev() columns using a logical vector and pattern matching
  * Specifically, this involves using the `grepl()` and a vector of column names *__and__*
  * Subsetting the result to keep only the necessary columns.
  * Also, remember to update the column names
    
###No.3- Use descriptive activity names to name the activities in the Dataset
####`merge()` the dataset with the activityType table 

###No.4- Appropriately label the data set with descriptive variable names 
####Use `gsub()` and pattern replacement on the `names()` of the dataset
* "t" becomes "time"
* "f" becomes "frequency"
* "Acc" becomes "Accelerometer"
* "Gyro" becomes "Gyroscope"
* "Mag" becomes "Magnitude"
* "BodyBody" becomes "Body"
  
###No.5- Create a second, independent tidy data set with the average of each variable for each activity and each subject.
1. Remove ActivityType column so that averages can be taken
2. Summarize the new table to include just the mean of each variable using `aggregate()`
3. `merge()` the new table with activityType to reintroduce the descriptive activity names
4. Export the tidy dataset *"tidy_data.txt"* using `write.table()` with row names set to __FALSE__
