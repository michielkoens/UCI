UCI
===

Clean up data from UCI Human Activity Recognition Using Smartphones Data Set

Usage
-----
Running the R script run_analysis.R will: 

1. Combine the test and train data
2. Prune the data to only contain mean and standard deviation
3. Attach clean headers
4. Add columns for activity and subject
5. Calculate a second (summary) data set that averages the data by activity and subject
6. Save the resulting data using default write.table settings

Results
-------
Final data is stored in variables data and summary, and written to files clean_UCI_data.txt and clean_UCI_summary.txt.

Requirements
------------
The following files are expected to be readable:

- train/X_train.txt
- train/y_train.txt
- train/subject_train.txt
- test/X_test.txt
- test/y_test.txt
- test/subject_test.txt
