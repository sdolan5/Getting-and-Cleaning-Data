## Getting and Cleaning Data Course Project

### Introduction
This project is for a Data Science course offered as a MOOC by **Coursera** and taught by professors from **Johns Hopkins**.
This repository hosts the R code and documentation files for the project.  

### Project Description
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the data used for the project: 

*__Human Activity Recognition Using Smartphones__*
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Instructions
You should create one R script called run_analysis.R which does the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each          activity and each subject.
  
### Additional Information
You can find additional information about the variables, the data and the transformations used to clean up the data in the CodeBook.MD file.

The run_analysis.R file contains all the code used to complete the project.  
NOTE:  The code takes for granted that all of the data from the original dataset has been downloaded and extracted, but remains in one folder bearing the original directory name "UCI HAR Dataset" and file names unaltered.

The final dataset, which is the output of the 5th step, is called *"tidy_data.txt"* and is uploaded to this repo.
