#setwd("BA/R/GCD/assignment")
## Merges the training and the test sets to create one data set.
featurename <- read.table("ds/features.txt")
featurename <- featurename$V2
#read files in test folder except inertial
subject_test <- read.table("ds/test/subject_test.txt", 
                           col.names = "subject")
X_test <- read.table("ds/test/X_test.txt", col.names = featurename)
y_test <- read.table("ds/test/y_test.txt", col.names = "labels")
merged_test <- cbind(subject_test, y_test, X_test)
#read files in train folder except inertial
subject_train <- read.table("ds/train/subject_train.txt", 
                            col.names = "subject")
X_train <- read.table("ds/train/X_train.txt", col.names = featurename)
y_train <- read.table("ds/train/y_train.txt", col.names = "labels")
merged_train <- cbind(subject_train, y_train, X_train)
#final step: merge two separate dataframes
merged_df <- rbind(merged_test, merged_train)
## Extracts only the measurements on the mean and
## standard deviation for each measurement. 
library(dplyr)
df <- select(merged_df, subject, labels, contains('mean'), contains('std'))
## Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("ds/activity_labels.txt", 
                              col.names = c("index","activity"))
df_act_name <- df$labels
for (i in 1:length(df_act_name)){
    index <- df_act_name[i]
    df_act_name[i] <- activity_labels[index,2]
}
df <- mutate(df, labels = df_act_name)
## Appropriately labels the data set with descriptive variable names.
## This has already been accomplished.

## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
tidydf <- df %>% group_by(subject, labels) %>% summarise(across(everything(), 
                     mean, .names = "mean_{col}"))
write.table(tidydf, file = "tidydataframe.txt", row.name = FALSE)