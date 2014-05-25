UCI
===

This repository contains code to clean up data from UCI [Human Activity Recognition Using Smartphones Data Set:](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Usage
-----
Running the R script `run_analysis.R` will: 

1. Combine the test and train data
2. Prune the data to only contain mean and standard deviation
3. Attach clean headers
4. Add columns for activity and subject
5. Calculate a second (summary) data set that averages the data by activity and subject
6. Save the resulting data using default `write.table` settings (space as separator etc.) so it can be read with `read.table` without specific settings.

Results
-------
Final data is stored in variables `data` and `summary`, and written to files `clean_UCI_data.txt` and `clean_UCI_summary.txt`. The details of the data are in `WorkBook.md`. The file `features_info.txt` contains the original description of the measurements and is only added for completeness.

Requirements
------------
The following files are expected to be readable for `run_analysis.R`:

- `train/X_train.txt`
- `train/y_train.txt`
- `train/subject_train.txt`
- `test/X_test.txt`
- `test/y_test.txt`
- `test/subject_test.txt`
- `activity_labels.txt`
- `features.txt`
