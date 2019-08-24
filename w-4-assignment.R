# week-4-program assignment
# set working dir "assignment3"
setwd("F:/1.coursera/1- Data Science Specialization/3. getting n cleaning data/w4")
# create a file "assignment3" in wd and set "assignment3"as wd
dir.create("a")
setwd("F:/1.coursera/1- Data Science Specialization/3. getting n cleaning data/w4/assignment3")
# download the data for assignment and save it as main.zip and then unzip the data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "./main.zip")
unzip(zipfile = "main.zip")
#read the training data set and check headings
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
head(X_train,3)
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
head(Y_train,3)
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
head(Sub_train,3)
#read the test data set and check headings
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
head(X_test,3)
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
head(Y_test,3)
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
head(Sub_test,3)
# read activity labels + features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
head(activityLabels)
feature_names <- read.table("./UCI HAR Dataset/features.txt")
head(features)
# 1. Merges the training and the test sets to create one data set.
X_merged <- rbind(X_train, X_test)
head(X_merged,5)
Y_merged <- rbind(Y_train, Y_test)
head(Y_merged,5)
Sub_merged <- rbind(Sub_train, Sub_test)
head(Sub_merged)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_variable <- feature_names[grep("mean\\(\\)|std\\(\\)",feature_names[,2]),]
X_merged <- X_merged[,selected_variable[,1]]
head(X_merged)

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_merged) <- "activity"
Y_merged$activitylabel <- factor(Y_merged$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_merged[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_merged) <- feature_names[selected_variable[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_merged) <- "subject"
merged <- cbind(X_merged, activitylabel, Sub_merged)
merged_mean <- merged %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(merged_mean, file = "./tidydata.csv", row.names = FALSE, col.names = TRUE)

