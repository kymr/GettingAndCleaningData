# Source Data Files
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


# Cleaning Data Process with run_analysis.R

* read 'features.txt' : this table has all measurement names
* read 'activity_labels.txt' : this table has activity names that matched labels id

* read 'train/X_train.txt' : training data
* read 'train/y_train.txt' : training activitiy lables (id)
* read 'train/subject_train.txt' : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* setting training colNames from features table
* train data : cbind upper datas 

* read 'test/X_test.txt' : test data
* read 'test/y_test.txt' : tests activitiy lables (id)
* read 'test/subject_test.txt' : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* setting test colNames from features table
* test data : cbind upper datas

* UCI : rbind train data & test data

* Extracts only the measurements on the mean and standard deviation for each measurement.
* use regular expression that matches mean() & std(), so you can get matched columns
* then select the activity, subject and matched columns 

* Uses descriptive activity names to name the activities in the data set. you can get the activity names from activity_labels table

* There are 6 activities and 30 subjects
* you can get each factors (6 activities, 30 sbujects) by factor() function
* By these 2 factors, you can get independent tidy data set the average of each variable for each activity and each subject with aggregate() function.

* Save result as 'tidyData.txt' with write.table() function


# 'tidyData.txt'
* activity : each activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject : Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 66 measurements : Average measurement of each variable for each activity and each subject.
