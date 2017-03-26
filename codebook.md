Code Book
=========

This is an updated version of features.txt found in the UCI HAR Dataset at the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file "TidyTable.txt" output by "run_analysis.R" contains 10299 observations. There are 20 columns: 2 variables and 18 features. The 2 variables are "subjectid" which is an integer from 1-30 labelling the experimental subject and "activityname" which is a factor variable with 6 levels corresponding to the activity being measured: "walking", "walkingupstairs" (walking upstairs), "walkingddownstairs" (walking downstairs), "sitting", "standing" and "laying".

The 18 features are 
                       tbodyaccmagmean
                       tbodyaccmagstd
                       tgravityaccmagmean
                       tgravityaccmagstd
                       tbodyaccjerkmagmean
                       tbodyaccjerkmagstd
                       tbodygyromagmean
                       tbodygyromagstd
                       tbodygyrojerkmagmean
                       tbodygyrojerkmagstd
                       fbodyaccmagmean
                       fbodyaccmagstd
                       fbodybodyaccjerkmagmean
                       fbodybodyaccjerkmagstd
                       fbodybodygyromagmean
                       fbodybodygyromagstd
                       fbodybodygyrojerkmagmean
                       fbodybodygyrojerkmagstd

The meanings of these are as follows:

- The last characters, either "mean" or "std", indicate whether the measurement is a mean or a standard deviation of a particular type of observation.
- The first letter, either "t" or "f", indicates whether the variable is time-domain or frequency-domain.
- The next characters, either "body" or "gravity", indicate whether the signal was due to bodily motion or gravity
- All the features measure *magnitudes* of the motion, not X,Y or Z components. 
- etc. 

The feature names can be gotten from the ones used in the original dataset (cf. the original codebook below) by making all letters lowercase and deleting hyphens and parentheses.

Original codebook:

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
