library(dplyr)

features <- read.table("./features.txt")
names(features) <- c("columnIndex", "columnNames")

activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activityId", "activityName")


# Merges the training and the test sets to create one data set.
trainData <- read.table("train/X_train.txt")
trainActivityLabel <- read.table("train/y_train.txt")
trainSubjectId <- read.table("train/subject_train.txt")
names(trainData) <- features[, 2]
names(trainActivityLabel) <- "activityId"
names(trainSubjectId) <- "subjectId"
train <- cbind(trainActivityLabel, trainSubjectId, trainData)

testData <- read.table("test/X_test.txt")
testActivityLabel <- read.table("test/y_test.txt")
testSubjectId <- read.table("test/subject_test.txt")
names(testData) <- features[, 2]
names(testActivityLabel) <- "activityId"
names(testSubjectId) <- "subjectId"
test <- cbind(testActivityLabel, testSubjectId, testData)

UCI <- rbind(train, test)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
meanColumns <- grep("mean\\(\\)", features$columnNames, value = TRUE)
stdColumns <- grep("std\\(\\)", features$columnNames, value = TRUE)
matchedIndexs <- match(c(meanColumns, stdColumns), names(UCI))
selectIndexs <- sort(c(1:2, matchedIndexs))
selectedUCI <- UCI[, selectIndexs]


#Uses descriptive activity names to name the activities in the data set
selectedUCI[, 1] <- activity_labels[selectedUCI[, 1], 2]

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
byActivityName <- factor(selectedUCI$activityId)
bySubjectId <- factor(selectedUCI$subjectId)

resultData <- aggregate(x = selectedUCI[, 3:68], by = list(byActivityName, bySubjectId), FUN = mean, na.rm = TRUE)
names(resultData)[1:2] <- c("activity", "subject")

write.table(resultData, file = "tidyData.txt", row.names = FALSE)
