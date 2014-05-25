library(reshape2)

# Load all data we need
datatrain <- read.table("train/X_train.txt")
labeltrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")
datatest <- read.table("test/X_test.txt")
labeltest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

# Load mapping from label to activity
labelmap <- read.table("activity_labels.txt")
# Load the features (the column names for the data)
featuremap <- read.table("features.txt")

# Concat train and test data
data <- rbind(datatrain, datatest)
# Select only columns that contain mean() or std()
# Include mean()-X etc, exclude meanFreq()
validcols <- grep("mean\\(\\)|std\\(\\)", featuremap[[2]])
data <- data[,validcols]

# Set the names of the data columns based on the featuremap
# But remove ( and ) and replace , and - with a . 
datacols <- gsub("[,-]",".", gsub("[()]", "", featuremap[validcols, 2]))
# Also replace all uppercase letters with a . followed by the lowercase
# (include optional leading . to prevent resulting ..)
datacols <- gsub("\\.?([A-Z])", ".\\L\\1", datacols, perl=TRUE)

# Translate some abbreviations, assuming body.body is a typo and should be body
words <- c("\\.acc", "\\.std", "\\.mag", "^t", "^f", "body\\.body")
translations <- c(".acceleration", ".standarddeviation", ".magnitude", "time", "fft", "body")
wordmap <- cbind(words, translations)
for (i in 1:length(words)) {
    datacols <- gsub(words[i], translations[i], datacols)
}
# !! We keep the .'s in the column names as that seems standard, although it 
# !! is different from the teacher's preference.

# Concat train and test subjects
subjects <- rbind(subjecttrain, subjecttest)

# Concat train and test labels
labels <- rbind(labeltrain, labeltest)
# Map the labels to the activity using the labelmap
# We use the fact that labelmap is ordered:
# e.g., row 1 contains the activity for label 1
activity <- labelmap[labels[[1]], 2]

# Add the subjects and activity to the data
data <- cbind(subjects, activity, data)
# Set the names of the columns. 
names(data) <- c("subject", "activity", datacols)

# For the second data set, melt the data based on subject and activity
datamelt <- melt(data, names(data)[1:2], datacols)
# And calculate the mean of all other columns by subject and activity.
summary <- dcast(datamelt, subject + activity ~ datacols, mean)

# Save results to files
write.table(data, "clean_UCI_data.txt")
write.table(summary, "clean_UCI_summary.txt")
