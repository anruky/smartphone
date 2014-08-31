smartphone ==========Overview

The script run_analysis.R is to handle the smartphone data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

####Steps to handle:

Load feature files
Load test file and extracts only the measurements on the mean and standard deviation for each measurement.
Add activity and subject line for test file
Load train file and extracts only the measurements on the mean and standard deviation for each measurement.
Add activity and subject line for train file
Combine test and train file
Creates a second, independent tidy data set with the average of each variable for each activity and each subject and write it into a file final_tidy.txt
###Output of run_analysis.R

The output file final_tidy.txt has 68 columns.

The first two columns are dimensions: -Activit -Subject

The remaining 66 are measurement: "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" ...
