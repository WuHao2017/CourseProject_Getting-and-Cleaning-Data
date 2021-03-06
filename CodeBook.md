# Code book for course project: Getting and Cleaning Data

This code book explained how to turn the raw data from several separated data files into the tidy data file required by the course project. It devided into 4 parts:
  1. Introduce the backgrounds of the data and relevant data files which used as inputs;
  2. Introduce available variables for each observations;
  3. Introduce the tidy data requirements of the course project;
  4. Explaination for the script how to turn the raw data into tidy data set required
 
## 1. Backgrounds and Data files used and the data in them
### Backgrounds
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

All these are recorded in several data files.

### Data files used
There are x files that used for this course projects:
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'features.txt': List of all features.

## 2. Introduction for the available variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are:
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values.
- iqr(): Interquartile range
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal
- kurtosis(): kurtosis of the frequency domain signal
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
 
## 3. Tidy data requirements fo the course project

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 4. Explanation for how to manipulate raw data into the tidy data set required

1) The first step is reading data files into R. When read data from training data files and test data files, consolidate training and testing data. Those are below codes do in the script:

--------------------------------------------------------------------------------------------------------
activity_labels <- read.table("activity_labels.txt")

features <- read.table("features.txt")

X <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))

y <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))

subject <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))

--------------------------------------------------------------------------------------------------------

2) Then use join and mutate function to replace the actvity lable in the records with descriptive activity name:

--------------------------------------------------------------------------------------------------------
activity <- join(y, activity_labels, by = "V1") %>% transmute(activity = V2)

--------------------------------------------------------------------------------------------------------

3) Give descriptive name as 'subject' to the data set subject and give the descriptive names to variables in the data set 'X':

--------------------------------------------------------------------------------------------------------
names(subject) <- "subject"

names(X) <- features[, 2]

--------------------------------------------------------------------------------------------------------

4) Now it is turn to extract the measurements only on the mean and standard deviation. The variables with the column name which contains 'mean()' or 'std()' are the variables need to be extract from X. Regular expression was used to selected the target column in X.

--------------------------------------------------------------------------------------------------------
X <- X[, grep(".+(mean\\(\\)|std\\(\\)).*", names(X), invert = FALSE)]

--------------------------------------------------------------------------------------------------------

5) Then the script combine the subject information, descriptive activity information and measurements on mean/standard devication into one data set. Group the observations by subject and activity, summarise the results for each variables by mean.

--------------------------------------------------------------------------------------------------------
data_set <- cbind(subject, activity, X) %>% group_by(subject, activity) %>% summarise_all(mean)

--------------------------------------------------------------------------------------------------------

6) Write the data set into file 'data_set.txt'.

--------------------------------------------------------------------------------------------------------
write.table(data_set, file ="data_set.txt", row.names = FALSE)

--------------------------------------------------------------------------------------------------------
