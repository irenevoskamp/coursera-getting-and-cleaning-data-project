library(reshape2)

filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
          fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
          download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
          unzip(filename) 
}

# Load activity labels as a table
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
# Load features as a table
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation. 
featuresIWant <- grep(".*mean.*|.*std.*", features[,2])
featuresIWant.names <- features[featuresIWant,2]

#Tidies the variable names.
featuresIWant.names = gsub('-mean', 'Mean', featuresIWant.names)
featuresIWant.names = gsub('-std', 'Std', featuresIWant.names)
featuresIWant.names <- gsub('[-()]', '', featuresIWant.names)

# Load the training datasets into tables
training <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresIWant]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Combine the three tables into a unified dataset
training <- cbind(trainSubjects, trainActivities, training)

# Load the test datasets into tables.
testing <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresIWant]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Combine the three tables into a unified dataset
testing <- cbind(testSubjects, testActivities, testing)

# merge datasets and add labels
allData <- rbind(training, testing)
colnames(allData) <- c("subject", "activity", featuresIWant.names)

# Now transform the activity and subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

# reshape the data to make it tidier. In this case that means its long
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

#write out allData to a file. 
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
