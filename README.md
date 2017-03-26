# AccelerometerProject


## Getting and Cleaning Data course project

This repo contains one script called "run_analysis.R". 

It needs to be run with the working directory set to the directory containing the "UCI HAR Dataset" directory, which can be extracted from the zipped file found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script takes the training data (7352 observations of 21 experimental subjects) and test data (2947 observations of 9 experimental subjects) and combines them into a single dataset (10299 observations of 30 experimental subjects).

The script includes the experimental subject IDs ("subjectid") and the types of activity ("activityname") as variables in the same data frame as the observations and features. 

The script subsets the columns of the dataframe to include only the features which express the mean (feature names ending in "-mean()") or standard deviation (feature names ending in "-std()") of various observations. 

The output is a file called "TidyTable.txt" saved in the working directory from which the script was called. 

The code also include a commented-out command to save a file called "MeansTable.txt", which is contains the means of each of the chosen features for every experimental subject and every activity. 



 