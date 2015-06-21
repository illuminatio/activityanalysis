There is only one script for this analysis. All data must be located is the
working directory for the script to work. The script produces a tidy dataset
named "tidy.txt" and puts it in the working directory. All the permutations are
described in the CodeBook.md



Okay, here's the copy of the description, because it's unclear where it should be. Task description says it should be in the CodeBook, but a question for peer evaluation asks if you could follow the description in the README. So it's in both places, just to be sure.

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
