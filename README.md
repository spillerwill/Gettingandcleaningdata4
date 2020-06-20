# Johns Hopkins - Getting and Cleaning Data - Week 4 - Peer-Graded Project

This repository contains William Spiller's submission for the Johns Hopkins Coursera course 'Getting and Cleaning Data' week 4 peer-graded project. It runs an analysis on the UCI HAR dataset, available at [cloudfront](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). If a folder named 'UCI HAR Dataset' is not in the working directory when the code is run, it will download and extract this from source.

## Files

### codebook.md
A code book describing variables used.

### run_analysis.R
Downloads and extracts the dataset if not present in the working directory, and performs the 5 steps of analysis required in the project instructions.

0. Downloads, extracts and reads in data.
* Checks whether a folder names 'UCI HAR Dataset' is present in the working directory; if not, downloads the zip file and extracts it.
* Reads in the required text files from the dataset[^1].

1. Merges the training and test sets to create one data set.
* Although not required (or included) in the submitted text file, adds a field to indicate the source of data in case separate analyses are desired.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Selects only the columns subject, [[activity]] code, source of data (training or test sets), and all columns containing either 'mean' or 'std'.

3. Uses descriptive activity names to name the activities in the data set.
* Pull the activity description for each activity code, and renames the column as 'activity'.

4. Appropriately labels the data set with descriptive variable names.
* The original dataset is not entirely consistent in its use of capitals; all variable names are changed to lowercase.
* The original dataset is also not consistent in its use of separating underscores; all words are separated by underscores.
* Abbreviations are disambiguated (using the information in features_info.txt).
* Redundant (multiple) or trailing underscores are removed.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* 'Average' is assumed to refer to the arithmetic mean.
* Uses the summarise_all function to create a data set called merged_data_summary with the mean of each variable for each activity and each subject.
* Creates a text file merged_data_summary.txt containing the created data set.


### merged_data_summary.txt
A tidy data set containing the mean of each variable for each activity and each subject.


[1] Files used from the dataset:
* activity_labels.txt
* features.txt
* subject_test.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt
