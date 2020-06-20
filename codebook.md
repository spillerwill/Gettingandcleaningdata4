# Code Book
This code book summarises the variables in the file merged_data_summary.txt. The process by which this data was derived is described in README.md.

## Introduction
The description of variable names is derived from the explanatory features_info.txt file:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For the tidy data set, abbreviations were disambiguated as follows:
* t - time
* f, freq - frequency
* Acc - accelerometer
* Gyro - gyroscope
* Mag - magnitude

As per the submission instructions, merged_data_summary.txt contains the average (arithmetic mean) of each measurement for each activity and each subject.

All measurements are normalised floating-point values, bounded within [[-1,1]].

Measurements are made for both the effects of moTime-domain signals are the output of the (normalised) accelerometer and gyroscope raw data. Frequency-domain signals result from the application of a Fast Fourier Transform to time-domain signals. Variables are measured in the cardinal directions x, y, z.

## Variables

### Subject
Unique test subject ID

### Activity
The activity that was taking place when the measurements were taken. 

### Measurements
* Mean and standard deviation of the time-domain body acceleration in the x, y, z directions
    * time_body_accelerometer_mean_x
    * time_body_accelerometer_mean_y
    * time_body_accelerometer_mean_z
    * time_body_accelerometer_std_x
    * time_body_accelerometer_std_y
    * time_body_accelerometer_std_z
* Mean and standard deviation of the time-domain body acceleration jerk in the x, y, z directions
    * time_body_accelerometer_jerk_mean_x
    * time_body_accelerometer_jerk_mean_y
    * time_body_accelerometer_jerk_mean_z
    * time_body_accelerometer_jerk_std_x
    * time_body_accelerometer_jerk_std_y
    * time_body_accelerometer_jerk_std_z
* Mean and standard deviation of the magnitude of the time-domain body acceleration
    * time_body_accelerometer_magnitude_mean
    * time_body_accelerometer_magnitude_std
* Mean and standard deviation of the magnitude of the time-domain body acceleration jerk
    * time_body_accelerometer_jerk_magnitude_mean
    * time_body_accelerometer_jerk_magnitude_std"
* Mean and standard deviation of the time-domain gravity acceleration in the x, y, z directions
    * time_gravity_accelerometer_mean_x
    * time_gravity_accelerometer_mean_y
    * time_gravity_accelerometer_mean_z
    * time_gravity_accelerometer_std_x
    * time_gravity_accelerometer_std_y
    * time_gravity_accelerometer_std_z
* Mean and standard deviation of the magnitude of the time-domain gravity acceleration
    * time_gravity_accelerometer_magnitude_mean
    * time_gravity_accelerometer_magnitude_std"
* Mean angle between time-domain body and gravity acceleration
    * angle_time_body_accelerometer_mean_gravity
* Mean angle between time-domain body and gravity acceleration jerk
    * angle_time_body_accelerometer_jerk_mean_gravity_mean
* Mean and standard deviation of the time-domain body angular velocity in the x, y, z directions
    * time_body_gyroscope_mean_x
    * time_body_gyroscope_mean_y
    * time_body_gyroscope_mean_z
    * time_body_gyroscope_std_x
    * time_body_gyroscope_std_y
    * time_body_gyroscope_std_z
* Mean and standard deviation of the time-domain body angular velocity jerk in the x, y, z directions
    * time_body_gyroscope_jerk_mean_x
    * time_body_gyroscope_jerk_mean_y
    * time_body_gyroscope_jerk_mean_z
    * time_body_gyroscope_jerk_std_x
    * time_body_gyroscope_jerk_std_y
    * time_body_gyroscope_jerk_std_z
* Mean and standard deviation of the magnitude of the time-domain body angular velocity
    * time_body_gyroscope_magnitude_mean
    * time_body_gyroscope_magnitude_std
* Mean and standard deviation of the magnitude of the time-domain body angular velocity jerk
    * time_body_gyroscope_jerk_magnitude_mean
    * time_body_gyroscope_jerk_magnitude_std
* Mean angle between time-domain body and gravity angular velocity
    * angle_time_body_gyroscope_mean_gravity_mean
* Mean angle between time-domain body and gravity angular velocity jerk
    * angle_time_body_gyroscope_jerk_mean_gravity_mean
* Mean angle between x, y, z directions and gravity
    * angle_x_gravity_mean
    * angle_y_gravity_mean
    * angle_z_gravity_mean
* Mean, standard deviation, and mean frequency components of the frequency-domain body acceleration in the x, y, z directions
    * frequency_body_accelerometer_mean_x
    * frequency_body_accelerometer_mean_y
    * frequency_body_accelerometer_mean_z
    * frequency_body_accelerometer_std_x
    * frequency_body_accelerometer_std_y
    * frequency_body_accelerometer_std_z
    * frequency_body_accelerometer_mean_frequency_x
    * frequency_body_accelerometer_mean_frequency_y
    * frequency_body_accelerometer_mean_frequency_z
* Mean, standard deviation, and mean frequency components of the frequency-domain body acceleration jerk in the x, y, z directions
    * frequency_body_accelerometer_jerk_mean_x
    * frequency_body_accelerometer_jerk_mean_y
    * frequency_body_accelerometer_jerk_mean_z
    * frequency_body_accelerometer_jerk_std_x
    * frequency_body_accelerometer_jerk_std_y
    * frequency_body_accelerometer_jerk_std_z
    * frequency_body_accelerometer_jerk_mean_frequency_x
    * frequency_body_accelerometer_jerk_mean_frequency_y
    * frequency_body_accelerometer_jerk_mean_frequency_z
* Mean, standard deviation, and mean frequency components of the magnitude of the frequency-domain body acceleration
    * frequency_body_accelerometer_magnitude_mean
    * frequency_body_accelerometer_magnitude_std
    * frequency_body_accelerometer_magnitude_mean_frequency
* Mean, standard deviation, and mean frequency components of the magnitude of the frequency-domain body acceleration jerk
    * frequency_body_accelerometer_jerk_magnitude_mean
    * frequency_body_accelerometer_jerk_magnitude_std
    * frequency_body_accelerometer_jerk_magnitude_mean_frequency
* Mean and standard deviation of the frequency-domain body angular velocity in the x, y, z directions
    * frequency_body_gyroscope_mean_x
    * frequency_body_gyroscope_mean_y
    * frequency_body_gyroscope_mean_z
    * frequency_body_gyroscope_std_x
    * frequency_body_gyroscope_std_y
    * frequency_body_gyroscope_std_z
    * frequency_body_gyroscope_mean_frequency_x
    * frequency_body_gyroscope_mean_frequency_y
    * frequency_body_gyroscope_mean_frequency_z
* Mean, standard deviation, and mean frequency components of the magnitude of the frequency-domain body angular velocity
    * frequency_body_gyroscope_magnitude_mean
    * frequency_body_gyroscope_magnitude_std
    * frequency_body_gyroscope_magnitude_mean_frequency
* Mean, standard deviation, and mean frequency components of the magnitude of the frequency-domain body angular velocity jerk
    * frequency_body_gyroscope_jerk_magnitude_mean
    * frequency_body_gyroscope_jerk_magnitude_std
    * frequency_body_gyroscope_jerk_magnitude_mean_frequency
