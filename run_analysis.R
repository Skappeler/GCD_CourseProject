# COURSE PROJECT GETTING AND CLEANING DATA
#*****************************************
# origin of the data:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#  the files must be  unziped in the working directory, in a subdirectory called "UCI HAR Dataset"
#*****************************************


# 1. Merges the training and the test sets to create one data set
#------------------------------------------------------------------
#Get the data set in R
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")

#merge the data
data<-merge(test,train,all=TRUE)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#------------------------------------------------------------------------------------------
#named the variables of the data set
features<-read.table("./UCI HAR Dataset/features.txt") #get the names of variables
label_f<-features[,2]   #select the column with the label names
label_f<-as.character(label_f) #convert from factor to character

colnames(data)<-c(label_f) # rename the column with the label names

#select only the measurements on the mean and standard deviation for each measurement
toMatch <- c("mean", "std") 
data2<-data[,grep(paste(toMatch,collapse="|"),colnames(data))]


# 3. Uses descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------
#get the data in R
test_activity<-read.table("./UCI HAR Dataset/test/y_test.txt")
train_activity<-read.table("./UCI HAR Dataset/train/y_train.txt")
activity_label<-read.table("./UCI HAR Dataset/activity_labels.txt")

#merge the test and train activity in one data set and add a column in the previous data set with measurements
activity_set<-rbind(test_activity,train_activity)
colnames(activity_set)<-"activity"
data3<-cbind(activity_set,data2)

#put the descriptive activity names to name the activities in the data set
data3$activity<-as.factor(data3$activity)  #convert the class of the variable activity to factor
label_a<-activity_label[,2] #create a vector with the activity labels
levels(data3$activity)<-label_a 


# 4. Appropriately labels the data set with descriptive variable names.
#-----------------------------------------------------------------------

names(data3)<-gsub("\\()", "", names(data3)) #clean the special characters from the column names.


# 5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
#-----------------------------------------------------------------------

#get the data of subject in R
test_s<-read.table("./UCI HAR Dataset/test/subject_test.txt")
train_s<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#merge the test and train subject in one data set and add a column in the previos data set with measurements
subject_set<-rbind(test_s,train_s)
colnames(subject_set)<-"subject"
data3<-cbind(subject_set,data3)

#melt and cast the data
data3 <- melt(data3, id = c("subject", "activity"))
tidyData <- dcast(data3, activity+subject ~ variable, mean)

#write the tidyData in a text file in the working directory
write.table(tidyData,"tidyData.txt", sep="\t",row.name=FALSE)
