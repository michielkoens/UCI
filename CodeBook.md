Code Book
=========
Below is the description of the data in the generated `clean_UCI_data.txt` (data) and `clean_UCI_summary.txt` (summary) files. 
The data is taken from the original UCI dataset by combining the train and test data. Only mean and standard deviation related measurements are maintained, other data (columns) are discarded.
Both files are generated with the default settings of the R write.table function. 
The first row contains the headers. The column separator is a space. Strings are quoted using double quotes. 

Data
----
The columns are as follows:

 0. A row indicator
 1. `subject` contains a number 1-30 denoting the subject of the experiment
 2. `activity` is a string describing the activity: `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, or  `WALKING_UPSTAIRS`.
 
The remaining columns 3 to 68 are the measurements of the subjects' movements. The columns starting with fft are the result of the Fast Fourier Transform on the original data. All numbers are normalized to the range [-1, 1]. For more details on the methodology of the measurements, please refer to the file `features_info.txt`. 

Every row contains a measurement, possibly multiple rows per subject and per activity.

Summary
-------
The summary has the same layout as the full data set with one difference: the measurements are averaged by subject and activity. As a result it has 180 data rows (30 subjects x 6 activities).
