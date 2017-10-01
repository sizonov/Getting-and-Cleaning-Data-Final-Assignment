This is a code book describes the data, variables and transformations with them provided R script performes to clean up original data.

### Data source
As sourse data for work was used Human Activity Recognition Using Smartphones Data Set
Original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Folowong files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

### Data transformation
To perform source data cleaning launch "run_analysis.R" file in RStudio or R command line.
The script perform following steps (in accordance with assignment):   
Load and unpack sourse data
1. Merge the training and the test sets to create one data set.   
  1.1. Create data tables by reading files of trains, test and features data   
  1.2. Add column names to data tables   
  1.3. Create data set merging all data   
2. Extracti only the measurements on the mean and standard deviation for each measurement   
3. Assign descriptive activity names to name the activities in the data set   
4. Clean and reassign appropriate descriptive variable names to the data set labels
5. Create independent tidy data set with the average of each variable for each activity and each subject   
  5.1 Aggreagate and order data   
  5.2 Write tidy data set in the TidyData.txt file   
  
  ### Main variables
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` store data readed from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset
* 'activity_labels' contains activities
* 'MeanAndStd' holds the measurements on the mean and standard deviation for each measurement
* 'TidyData' is the resulting clean dataset
