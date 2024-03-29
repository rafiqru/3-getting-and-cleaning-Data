# Getting and Cleaning-data-peer-reviewed-project
Author: Mohammad Rafiqul Islam
## Goal of the Project
- A tidy data set
- A link to a Github repository with the script for performing the analysis
- A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. It is also included a README.md in the repo with your scripts, which explains how all of the scripts work and how they are connected.
- R Script

## Procedures of the assignment

First, download and unzip the data file into your R working directory.
Second, download the R source code into your R working directory.
Finally, execute R source code to generate tidy data file.
Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## Code explaination
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

## New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

## The code was written based on the instruction of this assignment
-Read training and test dataset into R. Read variable names into R. Read subject index into R.
-Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
-Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
-Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
-Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
