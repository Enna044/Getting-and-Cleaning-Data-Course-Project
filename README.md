Getting and Cleaning Data Course Project

Purpose: Demonstrate your ability to collect, work with, and clean a data set. 
Goal: Prepare tidy data that can be used for later analysis. 

Background:
  One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
  
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
  Here are the data for the project:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


On this repository you can find the next files:
  1) A tidy data set as described below, called Samsung_TidyData.txt
  2) The data set described on the first 4 steps, called base_limp.txt
  3) A code book that describes the variables, the data, and any transformations performed to clean up the data called CodeBook.md. 
  4) This readme.md explaining the project
  5) An R script called run_analysis.R that does the following.
      a) Merges the training and the test sets to create one data set.
      b) Extracts only the measurements on the mean and standard deviation for each measurement.
    c) Uses descriptive activity names to name the activities in the data set
    d) Appropriately labels the data set with descriptive variable names.
    e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and  each subject.
