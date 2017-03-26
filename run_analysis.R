## This script needs to be run with the "UCI HAR Dataset" directory
## contained in the working directory
#
## Input all the data
#
setwd("UCI HAR Dataset/test/")
#
xtest       <- read.csv("X_test.txt", sep="", header=F)
ytest       <- read.csv("y_test.txt", sep="", header=F)[,1]
subjecttest <- read.csv("subject_test.txt", sep="", header=F)[,1]
#
setwd("Inertial Signals/")
#
bodyaccxtest    <- read.csv("body_acc_x_test.txt", sep="", header=F)
bodyaccytest    <- read.csv("body_acc_y_test.txt", sep="", header=F)
bodyaccztest    <- read.csv("body_acc_z_test.txt", sep="", header=F)
bodygyroxtest   <- read.csv("body_gyro_x_test.txt", sep="", header=F)
bodygyroytest   <- read.csv("body_gyro_y_test.txt", sep="", header=F)
bodygyroztest   <- read.csv("body_gyro_z_test.txt", sep="", header=F)
totalaccxtest   <- read.csv("body_acc_x_test.txt", sep="", header=F)
totalaccytest   <- read.csv("body_acc_y_test.txt", sep="", header=F)
totalaccztest   <- read.csv("body_acc_z_test.txt", sep="", header=F)
#
setwd("../../train/")
#
xtrain        <- read.csv("X_train.txt", sep="", header=F)
ytrain        <- read.csv("y_train.txt", sep="", header=F)[,1]
subjecttrain  <- read.csv("subject_train.txt", sep="", header=F)[,1]
#
setwd("Inertial Signals/")
#
bodyaccxtrain   <- read.csv("body_acc_x_train.txt", sep="", header=F)
bodyaccytrain   <- read.csv("body_acc_y_train.txt", sep="", header=F)
bodyaccztrain   <- read.csv("body_acc_z_train.txt", sep="", header=F)
bodygyroxtrain  <- read.csv("body_gyro_x_train.txt", sep="", header=F)
bodygyroytrain  <- read.csv("body_gyro_y_train.txt", sep="", header=F)
bodygyroztrain  <- read.csv("body_gyro_z_train.txt", sep="", header=F)
totalaccxtrain  <- read.csv("body_acc_x_train.txt", sep="", header=F)
totalaccytrain  <- read.csv("body_acc_y_train.txt", sep="", header=F)
totalaccztrain  <- read.csv("body_acc_z_train.txt", sep="", header=F)
#
setwd("../..")
#
features <- read.csv("features.txt", sep="",header=F, stringsAsFactors = FALSE)[,2]
activitylabels <- read.csv("activity_labels.txt", sep="",header=F, stringsAsFactors = FALSE)[,2]
#
#
#
## Join the data into a single dataset
#
#
subjectall    <- c(subjecttrain,subjecttest)
xall          <- rbind(xtrain,xtest)
yall          <- c(ytrain,ytest)
bodyaccxall   <- rbind(bodyaccxtrain,bodyaccxtest)
bodyaccyall   <- rbind(bodyaccytrain,bodyaccytest)
bodyacczall   <- rbind(bodyaccztrain,bodyaccztest)
bodygyroxall  <- rbind(bodygyroxtrain,bodygyroxtest)
bodygyroyall  <- rbind(bodygyroytrain,bodygyroytest)
bodygyrozall  <- rbind(bodygyroztrain,bodygyroztest)
totalaccxall  <- rbind(totalaccxtrain,totalaccxtest)
totalaccyall  <- rbind(totalaccytrain,totalaccytest)
totalacczall  <- rbind(totalaccztrain,totalaccztest)

## Rewrite the activity labels in lower case without underscores

activities <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")

yall <- as.factor(yall)
levels(yall) <- activities

## Extract the mean and standard deviation for each element

## boolean vector of which features are means
meanfeatures <- grepl(".*-mean\\(\\)$",features)

## boolean vector of which features are standard deviations
sdfeatures <- grepl(".*-std\\(\\)$",features)

## boolean vector of which features are standard deviations OR means

sdmean <- sdfeatures | meanfeatures

## Combine participant number, activity labels and features into one DF

combinedDF <- cbind(subjectall,yall,xall[,sdmean])

## Rename columns without parenthesis, capital letters, dashes:

names(combinedDF) <- c("subjectid",
                       "activityname",
                       "tbodyaccmagmean",
                       "tbodyaccmagstd",
                       "tgravityaccmagmean",
                       "tgravityaccmagstd",
                       "tbodyaccjerkmagmean",
                       "tbodyaccjerkmagstd",
                       "tbodygyromagmean",
                       "tbodygyromagstd",
                       "tbodygyrojerkmagmean",
                       "tbodygyrojerkmagstd",
                       "fbodyaccmagmean",
                       "fbodyaccmagstd",
                       "fbodybodyaccjerkmagmean",
                       "fbodybodyaccjerkmagstd",
                       "fbodybodygyromagmean",
                       "fbodybodygyromagstd",
                       "fbodybodygyrojerkmagmean",
                       "fbodybodygyrojerkmagstd")

## Change working directory back to the original

setwd("..")

## Output the dataframe to a csv

write.table(combinedDF, file="TidyTable.txt", row.names = F)

## Create a new dataframe with just the mean for each observation and 
## each experimental subject

## Load the dplyr package

library(dplyr)

## Create a dataframe grouped by the id of the experimental
## subject and by the activity

grouped <- group_by(combinedDF,subjectid,activityname)

## Compute the means of the various means which were
## supplied in the original dataset for each subject
## and each activity

means <- summarize(grouped,
          tbodyaccmagmean = mean(tbodyaccmagmean),
          tgravityaccmagmean = mean(tgravityaccmagmean),
          tbodyaccjerkmagmean = mean(tbodyaccjerkmagmean),
          tbodygyromagmean = mean(tbodygyromagmean),
          tbodygyrojerkmagmean = mean(tbodygyrojerkmagmean),
          fbodyaccmagmean = mean(fbodyaccmagmean),
          fbodybodyaccjerkmagmean = mean(fbodybodyaccjerkmagmean),
          fbodybodygyromagmean = mean(fbodybodygyromagmean),
          fbodybodygyrojerkmagmean = mean(fbodybodygyrojerkmagmean))

## Output to file

## write.table(means, file="MeansTable.txt", row.names = F)

## This is commented out because the submission page says
## "The output should be the tidy data set you submitted for part 1."