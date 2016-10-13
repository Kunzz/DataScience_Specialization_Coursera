library(plyr)

# 1. Load the data from text files into R data.frames.
##################################################################
# x_train are the measured/processed values for training
# y_train contain the activity names, e.g., walking, walking upstairs, etc.,
# subject_train are the id of each test participate 
# whose test results are included in the training dataset.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# x_test are the measured/processed values for testing
# y_test contain the activity names, e.g., walking, walking upstairs, etc.,
# subject_train are the id of each test participate 
# whose test results are included in the test dataset.
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create x_merge by combining x_train and x_test
x_merge <- rbind(x_train, x_test)

# create y_merge by combining y_train and y_test a
# name y_merge "activity"
y_merge <- rbind(y_train, y_test)
names(y_merge) <- "activity"

# create subject_merge by combining the subject_train and subject_test
# name subject_merge "subject"
subject_merge<- rbind(subject_train, subject_test)
names(subject_merge) <- "subject"

# 2. Extract the measurements on the mean and standard deviation for each measurement
##################################################################
# features contain name of the calculation perfromed
# they are used as names of the x_merge
features <- read.table("features.txt")

# Get only columns with mean() or std() in their names
# in total there are 79 variables selected
feature_mean  <- grep ("mean", features[,2])
feature_std <- grep ("std", features[,2])
mean_std  <- c(feature_mean, feature_std)

# Subset the mean() and std() columns
x_selected <- x_merge[, mean_std]

# Update the column names
names(x_selected) <- features[mean_std, 2]

# 3. Use descriptive activity names to name the activities in the data set
##################################################################
activities <- read.table("activity_labels.txt")

# Update values with correct activity names
# Replace the activity idx with activity name
y_merge[y_merge==1]  <- as.character(activities[1,2])
y_merge[y_merge==2]  <- as.character(activities[2,2])
y_merge[y_merge==3]  <- as.character(activities[3,2])
y_merge[y_merge==4]  <- as.character(activities[4,2])
y_merge[y_merge==5]  <- as.character(activities[5,2])
y_merge[y_merge==6]  <- as.character(activities[6,2])

# 4. Label the data set with descriptive variable names
###############################################################################

# Bind all the data in a single data set
clean_data <- cbind(x_selected, y_merge, subject_merge)

# 5. Create a new and tidy data set with the average of each 
# variable for each activity and each subject
###############################################################################
# Column mean for column 1:79 per activity (colume 80) and subject (colume 81))
new_data <- ddply(clean_data, .(subject, activity), function(x) colMeans(x[, 1:79]))

write.table(new_data, "new_data.txt", row.name=FALSE)