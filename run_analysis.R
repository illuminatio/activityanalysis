X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

features <- read.table("features.txt", as.is = T)
activityLabels <- read.table("activity_labels.txt")

train <- do.call(cbind, list(subject_train, y_train, X_train))
test <- do.call(cbind, list(subject_test, y_test, X_test))

mergedData <- rbind(train, test)

colnames(mergedData) <- c("Subject", "Activity", features[[2]])

mergedData <- mergedData[c(1, 2, grep("(mean\\(|std)", colnames(mergedData)))]
mergedData <- mergedData[order(mergedData$Subject, mergedData$Activity),]

mergedData[, 2] <- activityLabels[mergedData[[2]], 2]

tidy <- as.data.frame(matrix(0, 30*6, ncol(mergedData)))
colnames(tidy)[1:2] <- c("Subject", "Activity")
tidy[1] <- rep(1:30, each = 6)
tidy[2] <- rep(levels(mergedData$Activity), 30)

for(i in 3:ncol(mergedData)) {
    tidy[i] <- as.numeric(tapply(mergedData[[i]], list(mergedData$Activity, mergedData$Subject), mean))
    colnames(tidy)[i] <- colnames(mergedData)[i]
}

write.table(tidy, "tidy.txt", row.names = F)