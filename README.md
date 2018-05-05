# Tidy Data Week 4 Assignment
Author: Natalie

## Outline
The aim of this project is collect and clean a publicly available data set investigating activity data collected from smartphones. Data was collected for 30 volunteers and the required final data set gives average information for six activities for each volunteer.

The reference for the dataset is: 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The raw data is available at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information about this raw data set is available at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##This project includes the files:
* README.md - for understanding the analysis
* CodeBook.md - description of the variables
* run_analysis.R - the code for replicating the data analysis

##Guide to the Analysis
### Preliminary Steps
The assessment assumes that you have downloaded the Samsung files to your working directory. However, for completedness, the code for downloading and unzipping the data is included in "OPTIONAL PRELIMINARY STEPS" section of the run_analysis.R file. 

Reference: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-downloadingFiles.md

This section sets the download parameters based on operating system, checks if the files are already downloaded, and if not downloads the zip file and unzips the files.

### Step 1: Merges the training and the test sets to create one data set
This step of the code sets the working directory to the unzipped folder location and reads the required files into R. 

####Required files at this step:
* subject_test.txt 
* X_test.txt
* y_test.txt
* subject_train.txt 
* X_train.txt
* y_train.txt

The test files are joined, the training files are joined and then the sets are merged to create one data set. The data set at this stage is called data1.

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement find variable labels
This step of the code examines the list of measurements (found in the features.txt file) and subsets based on measurements where "mean" or "std" appear directly in the measurement description. The assumption is that this search returns the required mean/standard deviation measurements- however this step can be modified if additional/fewer mean/standard deviation measurements are required.

####Required files at this step:
* features.txt

At the end of this step the data set contains only the subject identifiers, activity codes and columns containing measurements of mean/standard deviation. The data set at this step is called data2.

### Step 3: Uses descriptive activity names to name the activities in the data set
This step of the code provides descriptive text for the factors in column 2 describing which of the 6 activities the volunteer performed.

####Required files at this step:
* activity_labels.txt

The data set at this step is called data2.

### Step 4: Appropriately labels the data set with descriptive variable names
This step of the code provides descriptive text for each of the variables. The variable names are cleaned, using the suggestions provided in the Week 4 lectures that the names are lower case, descriptive, unique and no non-alphanumeric symbols.

The data set at this step is called data2.

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
Tidy data has one row per observation and one column per variable. This data set meets the requirements as outlined in the Hadley Wickham "Tidy Data" article:

Reference: http://bit.ly/2nyw5Ci 

The data is sorted by subject and activity and all observations for each group are averaged. 

The tidy data set at this step (end) is called final.

### For assessment
To generate the txt file for assessment:
       
write.table(final, "tidydatasetN.txt", row.name=FALSE)

And to read the final data set (in R):
       
data <- read.table(filepathhere, header=TRUE)

Reference: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

