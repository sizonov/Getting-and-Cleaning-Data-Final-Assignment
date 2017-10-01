# Get data file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="SourseDataPack.zip")
unzip(zipfile="SourseDataPack.zip",exdir=".")

##################################### 1. Merge the training and the test sets to create one data set.######################################
# 1.1. Read data files
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE)

features <- read.table("UCI HAR Dataset/features.txt",header = FALSE)

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt",header = FALSE)


# 1.2. Add column names
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity_ID"
colnames(subject_test) <- "subject_ID"

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity_ID"
colnames(subject_train) <- "subject_ID"

colnames(activity_labels) <- c('activity_ID','activity_Type')

# 1.3. Merge data
train_data <- cbind(y_train, subject_train, x_train)
test_data <- cbind(y_test, subject_test, x_test)
Data_Set <- rbind(train_data, test_data)


##################################### 2. Extract only the measurements on the mean and standard deviation for each measurement.######################################
col_names <- colnames(Data_Set)
MeanAndStd <- Data_Set[ , grepl("activity_ID|subject_ID|mean..|std..",col_names)]


#################################### 3. Use descriptive activity names to name the activities in the data set. ######################################################
ActivityNames <- merge(MeanAndStd, activity_labels, by="activity_ID", all.x=TRUE)


#################################### 4. Appropriately labels the data set with descriptive variable names. ##########################################################
names(MeanAndStd) <- gsub("\\(|\\)", "", names(MeanAndStd), perl  = TRUE)
names(MeanAndStd) <- make.names(names(MeanAndStd))

names(MeanAndStd) <- gsub("std", "Standard_Deviation", names(MeanAndStd))
names(MeanAndStd) <- gsub("mean", "Mean", names(MeanAndStd))
names(MeanAndStd) <- gsub("Freq", "Frequency", names(MeanAndStd))
names(MeanAndStd) <- gsub("Mag", "Magnitude", names(MeanAndStd))
names(MeanAndStd) <- gsub("Acc", "Acceleration", names(MeanAndStd))
names(MeanAndStd) <- gsub("^t", "Time", names(MeanAndStd))
names(MeanAndStd) <- gsub("^f", "Frequency", names(MeanAndStd))
names(MeanAndStd) <- gsub("BodyBody", "Body", names(MeanAndStd))


#################################### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ######################################

TidyData <- aggregate(. ~subject_ID + activity_ID, ActivityNames, mean)
TidyData <- TidyData[order(TidyData$subject_ID, TidyData$activity_ID),]
write.table(TidyData, "TidyData.txt", row.name=FALSE)


