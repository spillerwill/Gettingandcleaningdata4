#### Johns Hopkins University - Getting and Cleaning Data - Week 4 - Project

## Description from course page

# The purpose of this project is to demonstrate your ability to collect, work 
# with, and clean a data set.
# 
# Review criteria
# 1. The submitted data set is tidy.
# 2. The Github repo contains the required scripts.
# 3. GitHub contains a code book that modifies and updates the available 
# codebooks with the data to indicate all the variables and summaries 
# calculated, along with units, and any other relevant information.
# 4. The README that explains the analysis files is clear and understandable.
# 5. The work submitted for this project is the work of the student who 
# submitted it.
# 
# Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your ability to collect, work 
# with, and clean a data set. The goal is to prepare tidy data that can be used 
# for later analysis. You will be graded by your peers on a series of yes/no 
# questions related to the project. You will be required to submit: 1) a tidy 
# data set as described below, 2) a link to a Github repository with your script 
# for performing the analysis, and 3) a code book that describes the variables, 
# the data, and any transformations or work that you performed to clean up the 
# data called CodeBook.md. You should also include a README.md in the repo with 
# your scripts. This repo explains how all of the scripts work and how they are 
# connected.
# 
# One of the most exciting areas in all of data science right now is wearable 
# computing - see for example this article . Companies like Fitbit, Nike, and 
# Jawbone Up are racing to develop the most advanced algorithms to attract new 
# users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full 
# description is available at the site where the data was obtained:
# 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# Good luck!


## Submission instructions from course page
 
# Please upload the tidy data set created in step 5 of the instructions. Please 
# upload your data set as a txt file created with write.table() using 
# row.name=FALSE (do not cut and paste a dataset directly into the text box, as 
# this may cause errors saving your submission).
# 
# Please submit a link to a Github repo with the code for performing your 
# analysis. The code should have a file run_analysis.R in the main directory 
# that can be run as long as the Samsung data is in your working directory. The 
# output should be the tidy data set you submitted for part 1. You should 
# include a README.md in the repo describing how the script works and the code 
# book describing the variables.


### 0: Load data
library(dplyr)

# Name and location of the project dataset zip and extracted folder
# Edit if you renamed the extracted folder
foldername <- "UCI HAR Dataset"
zipname <- "getdata_projectfiles_UCI HAR Dataset.zip"
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## If not already present, download and extract the zip
if(!file.exists(foldername)){
    download.file(zipurl, zipname, method = "curl")
    unzip(zipname)
}


## Read in the datasets

activity_labels <- read.table(
    paste0(foldername, "/activity_labels.txt"), 
    col.names = c("code", "activity")
)

# Convert activity labels to lowercase
activity_labels$activity <- tolower(activity_labels$activity)

features <- read.table(
    paste0(foldername, "/features.txt"), 
    col.names = c("n", "functions")
)

subject_test <- read.table(
    paste0(foldername, "/test/subject_test.txt"), 
    col.names = "subject"
)

x_test <- read.table(
    paste0(foldername, "/test/X_test.txt"), 
    col.names = features$functions
)

y_test <- read.table(
    paste0(foldername, "/test/y_test.txt"), 
    col.names = "code"
)

subject_train <- read.table(
    paste0(foldername, "/train/subject_train.txt"), 
    col.names = "subject"
)

x_train <- read.table(
    paste0(foldername, "/train/X_train.txt"), 
    col.names = features$functions
)

y_train <- read.table(
    paste0(foldername, "/train/y_train.txt"), 
    col.names = "code"
)


### 1: Merges the training and the test sets to create one data set.

# Add a column to indicate the data set type in case want to do separate 
# analyses later
y_train$dataset <- "train"
y_test$dataset <- "test"

# Combine both sets
merged_data <- cbind.data.frame(
    rbind.data.frame(subject_train, subject_test), # Subject IDs
    rbind.data.frame(y_train, y_test), # Activity codes
    rbind.data.frame(x_train, x_test) # Physical measurements
)

merged_data$dataset <- as.factor(merged_data$dataset)


### 2: Extracts only the measurements on the mean and standard deviation for 
### each measurement.

merged_data_means <- select(
    merged_data, 
    subject, code, dataset,  # IDs, activity codes, training or test data
    contains("mean"), contains("std") # Means and standard deviations
)


### 3. Uses descriptive activity names to name the activities in the data set

# Get the corresponding activity label for each code
merged_data_means$code <- activity_labels[merged_data_means$code, "activity"]

# Subject and activity should be factors
merged_data_means$subject <- as.factor(merged_data_means$subject)
merged_data_means$code <- as.factor(merged_data_means$code)

# Rename the column from 'code' to 'activity
colnames(merged_data_means)[2] <- "activity"


### 4. Appropriately labels the data set with descriptive variable names.

## Tidy up the syntax

# The cases used are not entirely consistent - all lowercase is better
colnames(merged_data_means) <- tolower(colnames(merged_data_means))

# Replace all periods with underscores
colnames(merged_data_means) <- gsub("\\.", "_", colnames(merged_data_means))

# Replace all multiple underscores with a single one
colnames(merged_data_means) <- gsub("_{2,}", "_", colnames(merged_data_means))

# Remove all trailing (ending the variable name) underscores
colnames(merged_data_means) <- gsub("_$", "", colnames(merged_data_means))


## Rename variables using the information from features_info.txt

# Variables beginning with "t" refer to time, as do variables containing "tBody"
colnames(merged_data_means) <- gsub(
    "^t", "time_", colnames(merged_data_means)
    )

colnames(merged_data_means) <- gsub(
    "tbody", "time_body", colnames(merged_data_means)
)

# Variable containing "freq" or beginning with "f" refer to frequency
colnames(merged_data_means) <- gsub(
    "freq", "frequency_", colnames(merged_data_means)
    )

colnames(merged_data_means) <- gsub(
    "^f", "frequency_", colnames(merged_data_means)
    )

# "Acc" refers to the accelerometer
colnames(merged_data_means) <- gsub(
    "acc", "accelerometer_", colnames(merged_data_means)
    )

# "Gyro" refers to the gyroscope
colnames(merged_data_means) <- gsub(
    "gyro", "gyroscope_", colnames(merged_data_means)
    )

# "Mag" refers to magnitude
colnames(merged_data_means) <- gsub(
    "mag", "magnitude_", colnames(merged_data_means)
)

# Some variables contain a redundant "BodyBody"
colnames(merged_data_means) <- gsub(
    "bodybody", "body", colnames(merged_data_means)
    )

# Make "body", "gravity", "jerk", "mean", "angle" fit our underscore-based 
# variable name scheme

colnames(merged_data_means) <- gsub(
    "body", "body_", colnames(merged_data_means)
)

colnames(merged_data_means) <- gsub(
    "gravity", "gravity_", colnames(merged_data_means)
)

colnames(merged_data_means) <- gsub(
    "jerk", "jerk_", colnames(merged_data_means)
)

colnames(merged_data_means) <- gsub(
    "mean", "mean_", colnames(merged_data_means)
)

colnames(merged_data_means) <- gsub(
    "angle", "angle_", colnames(merged_data_means)
)

# Replace any introduced redundant or trailing underscores
colnames(merged_data_means) <- gsub("_{2,}", "_", colnames(merged_data_means))

colnames(merged_data_means) <- gsub("_$", "", colnames(merged_data_means))


### 5. From the data set in step 4, creates a second, independent tidy data set 
### with the average of each variable for each activity and each subject.

merged_data_summary <- summarise_all(
    # Test/training dataset info is not requested in data set; remove column 3
    group_by(merged_data_means[ , -3],subject, activity),
    # "Average is assumed to indicate arithmetic mean
    mean
)

## Please upload the tidy data set created in step 5 of the instructions. Please 
## upload your data set as a txt file created with write.table() using 
## row.name=FALSE (do not cut and paste a dataset directly into the text box, as 
## this may cause errors saving your submission).

write.table(merged_data_summary, "merged_data_summary.txt", row.names = FALSE)