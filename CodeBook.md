###Description from the original dataset

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

###Other variables

Subject             Number of subject
Activity            Name of activity

###Description of permutations

Each value is the resulting tidy dataset is a mean of all observation
for a particular combination of a subject and an activity from both training
and test datasets.

Here's how it is done:

1) Read tables from subject_train.txt, y_train.txt and X_train.txt
2) Column-bind them together in the specified order. subject_train contains numbers of subjects, y_train contains code numbers of activities.
3) Do the same for subject_test.txt, y_train.txt and X_test.txt, respectively.
4) Row bind resulting tables, thus merging train and test datasets.
5) Name two first columns "Subject" (it came from subject_train and subject_test) and "Activity" (it came from y_train and y_test).
6) Remove all columns except for the ones containing "mean()" or "std()" in their names.
7) Order rows by subjects and activites.
8) Replaces activity codes with actual activity names.
9) Prepare an empty data frame to fill with tidy data.
10) Prepare first two columns of a soon-to-be-tidy data frame, filling them with all combinations of subject number and activity names. Activity names are sorted alphabetically for each subject.
11) Finally, compute means for every required variable (described in the first part of this document) for every combination of subject and activity, and write them to the respective columns of a tidy data frame.
12) And absolutely finally, write the tidy data frame to a file.
........
14) PROFIT

P.S. Personally I think that comments in code would be much more clear and useful than this strange file. But the task was clear-ish, so here it is, I guess.
