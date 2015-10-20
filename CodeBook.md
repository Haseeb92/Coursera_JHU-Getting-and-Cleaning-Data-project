---
title: "Codebook"
author: "Muhammad Haseeb Ahmad"
date: "Oct. 20, 2015"
output:
---

##Project Description
The project takes a raw data as input and generates a tidy dataset in long format.


##Study Design and Data Processing
###Collection of the Raw Data
The original features which are summarized here came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Creating the Tidy Data File
###Guide to create the tidy data file
1. Download the data file [*here*](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the file to your desired working directory.
3. Download the *run_analysis.R* file from this repository into the same working directory.
4. Source the script and you will find a find a file called *TidyData_Long_Format.txt* in your working directory.
Note: The final data table is in '*long format*' as opposed to '*wide format*'.

###Cleaning of the data
To learn how the various components of the script work to clean the data, click [*here*](https://github.com/Haseeb92/Coursera_JHU-Getting-and-Cleaning-Data-project/blob/master/README.md).

##Description of the variables in the *TidyData_Long_Format.txt* file
The final dataset is a (15481 x 5) table containing columns for the following variables:

1. *Subject.ID:* ID numbers allotted to each of 30 volunteers who took part in the experiment.

2. *Activity.ID:* ID numbers corresponding to the 6 motion components that each volunteer went through.
  - 1: WALKING
  - 2: WALKING UPSTAIRS
  - 3: WALKING DOWNSTAIRS
  - 4: SITTING
  - 5: STANDING
  - 6: LAYING

3. *Activity.Label:* Activities performed by each volunteer as part of the experiment.

4. *Variable.Name:* Contains names for the following measurements (86 names in total):

  - tBodyAcc-XYZ: Mean and standard deviation for X,Y,Z directions. <6 names>
  - tGravityAcc-XYZ: Mean and standard deviation for X,Y,Z directions. <6 names>
  - tBodyAccJerk-XYZ: Mean and standard deviation for X,Y,Z directions. <6 names>
  - tBodyGyro-XYZ: Mean and standard deviation for X,Y,Z directions. <6 names>
  - tBodyGyroJerk-XYZ: Mean and standard deviation for X,Y,Z directions. <6 names>
  - tBodyAccMag: Mean and standard deviation. <2 names>
  - tGravityAccMag: Mean and standard deviation. <2 names>
  - tBodyAccJerkMag: Mean and standard deviation. <2 names>
  - tBodyGyroMag: Mean and standard deviation. <2 names>
  - tBodyGyroJerkMag: Mean and standard deviation. <2 names>
  - fBodyAcc-XYZ: Mean, standard deviation and frequency mean for X,Y,Z directions. <9 names>
  - fBodyAccJerk-XYZ: Mean, standard deviation and frequency mean for X,Y,Z directions. <9 names>
  - fBodyGyro-XYZ: Mean, standard deviation and frequency mean for X,Y,Z directions. <9 names>
  - fBodyAccMag: Mean, standard deviation and frequency mean. <3 names>
  - fBodyAccJerkMag: Mean, standard deviation and frequency mean. <3 names>
  - fBodyGyroMag: Mean, standard deviation and frequency mean. <3 names>
  - fBodyGyroJerkMag: Mean, standard deviation and frequency mean. <3 names>
  - gravityMean: Mean for X,Y,Z directions. <3 names>
  - tBodyAccMean: Mean. <1 name>
  - tBodyAccJerkMean: Mean. <1 name>
  - tBodyGyroMean: Mean. <1 name>
  - tBodyGyroJerkMean: Mean. <1 name>

5. *Mean.Value:* Values for mean calculated from the multiple measures of each of the above identified variables 
    for each subject's each activity.
