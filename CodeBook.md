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
 
## 3. Tidy data requirements fo the course project
 
## 4. Explanation for how to manipulate raw data into the tidy data set required
