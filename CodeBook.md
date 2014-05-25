Code Book
=========

Below is the description of the data in the generated `clean_UCI_data.txt` and `clean_UCI_summary.txt` files. 

Method
------

The data is taken from the original UCI dataset by combining the train and test data. Only mean and standard deviation related measurements (having `main()` or `std()` in the name) are maintained, other data (columns) are discarded. Extra columns to indicate activity and subject number are added on the left. These come from separate files in the UCI repository.
Both files are written with the default settings of the R write.table function. 
The first row contains the headers. The column separator is a space. Strings are quoted using double quotes. 

`clean_UCI_data.txt`
--------------------

The columns are as follows:

 0. A row indicator
 1. `subject` contains a number 1-30 denoting the subject of the experiment
 2. `activity` is a string describing the activity: `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, or  `WALKING_UPSTAIRS`.
 
The remaining columns 3 to 68 are the measurements of the subjects' movements. The columns starting with fft are the result of the Fast Fourier Transform on the original data. All numbers are normalized to the range [-1, 1]. For more details on the methodology of the measurements, please refer to the file `features_info.txt`. 

Every row contains a measurement, possibly multiple rows per subject and per activity.

The total layout of the file (ignoring the row indicator), based on the files in the UCI repository is as follows:

         ___ ___ _______   
        |   |   | 7 ... |  
        |___|___|_______|  
        | 1 | 3 | 5 ... |  
        |...|...| ...   |  
        |___|___|_______|  
        | 2 | 4 | 6 ... |  
        |...|...|...    |  
        |___|___|_______|  
 
1. `train/subject_train.txt` - the subject identifiers for the training set; one column only.
2. `test/subject_test.txt` - same for test set.
3. `train/y_train.txt` - the activity for the training set (mapped from a number to a description using `activity_labels.txt`); one column only.
4. `test/y_test.txt` - same for test set.
5. `train/X_train.txt` - the actual measurement data from the training set; multiple columns.
6. `test/X_test.txt` - same for test set.
7. `features.txt` - names of the columns/measurements (cleaned up to be more R friendly).

`clean_UCI_summary.txt`
-----------------------
The summary has the same layout as the full data set with one difference: the measurements are averaged by subject and activity. As a result it has 180 data rows (30 subjects x 6 activities).
