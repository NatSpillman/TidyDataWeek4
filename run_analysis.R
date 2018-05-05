## run_analysis.R for Getting and Cleaning Data Course Project

## OPTIONAL PRELIMINARY STEPS (for downloading/unzipping data)
## Set download method for Windows/OSX/Linux
dlMethod <- "curl" # sets default for OSX / Linux
if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet" 

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##check if file has already been downloaded, download if it is not there
        if(!file.exists("project.zip")) {
        ##download zip file        
        download.file(url, destfile='project.zip', method=dlMethod, mode="wb")
        ## unpack the files
        unzip(zipfile = "project.zip")        
        }

## STEP 1: Merges the training and the test sets to create one data set
##set working directory to inside UCI HAR Dataset folder
setwd("./UCI HAR Dataset")

#set working directory to inside test folder
setwd("./test")
## then read in the TEST files and name
subject_test <- read.table("subject_test.txt") 
X_test <- read.table("X_test.txt")
Y_test <- read.table("y_test.txt")

#set working directory to inside train folder
setwd('..')
setwd("./train")
## then read in the TRAIN files and name
subject_train <- read.table("subject_train.txt") 
X_train <- read.table("X_train.txt")
Y_train <- read.table("y_train.txt")## column bind the test files, column bind the train files, then row bind test and train
        testbind <- cbind(subject_test, Y_test, X_test)
        trainbind <- cbind(subject_train, Y_train, X_train)
        data1 <- rbind(testbind, trainbind)

## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement 
##find variable labels
        setwd('..')
        columnlabels <- read.table("features.txt")
        library(dplyr)
        columnlabels2 <- select(columnlabels, V2)
        y <- tbl_df(columnlabels2)
        x<- rbind(data.frame(V2 = "activity"), y)
        labels <- rbind(data.frame(V2 = "subject"), x)

##search for "mean" OR "std"
        search <- c("mean", "std")
        meanstds <- grep(paste(search,collapse="|"),labels$V2, value=FALSE) ##gives 79 rows
        data2 <- data1[,c(1,2,meanstds)]

## STEP 3: Uses descriptive activity names to name the activities in the data set
## activities is column 2 of data2 (currently V1.1)
        activitynames <- read.table("activity_labels.txt")
        lower <- tolower(activitynames$V2)
        lower2 <- gsub("_", "", lower)
        for (i in 1:length(lower2)){
        data2$V1.1 <- gsub(i, lower2[i], data2$V1.1)
        }
        
## STEP 4: Appropriately labels the data set with descriptive variable names
        names <- grep(paste(search,collapse="|"),labels$V2, value=TRUE)
        names2 <- tbl_df(names)

        alt <- gsub("^t","time", names2$value)
        alt2 <- tbl_df(alt)
        alt3 <-gsub("^f", "frequency", alt2$value)
        alt4 <- tbl_df(alt3)
        alt4 <- tolower(alt4$value)
        alt5 <- tbl_df(alt4)
        alt6 <-gsub("-", "", alt5$value)
        alt7 <- tbl_df(alt6)
        alt8 <-gsub("()", "", alt7$value,fixed=TRUE)
        alt9 <- tbl_df(alt8)
        alt10 <-gsub("bodybody", "body", alt9$value)
        alt11 <- tbl_df(alt10)
        
        names3 <- rbind(data.frame(value = "activity"), alt11)
        names4 <- rbind(data.frame(value = "subject"), names3)
        names5 <- t(names4)
        colnames(data2) <- names5
        
## STEP 5: From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject 
        final <- data2 %>% group_by(subject,activity) %>% summarise_all(funs(mean))

## To export final tidy data set for assessment
        write.table(final, "tidydatasetN.txt", row.name=FALSE)
## To read the final tidy data set (insert file path based on your wd)
        data <- read.table(filepathhere, header=TRUE)
        