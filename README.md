# How the script works:
1.Merge the training and the test sets to create one data set
Fistly, read all the data, and plase remember to change the directory when you check my script. Thanks!
Secondly, use cbind to separately combine test files and train files. 
Thirdly, use rbind to combine test df and train df.
2.Extract only the measurements on the mean and standard deviation for each measurement
Use select in dplyr.
3.Uses descriptive activity names to name the activities in the data set
Firstly, read activity's names file.
Secondly, use for loop to change variables in df$labels
Thirdly, use mutate to overwrite df$labels.
4.Appropriately label the data set with descriptive variable names
This part has been done when I read data, so let's skip it.
5.From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
Firstly, group_by data by subject and then by labels
Secondly, use summarise and across to get mean of all columns and change their names.
Thirdly, write the file to local path.

#
