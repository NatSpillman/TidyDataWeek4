---
title: "CodeBook.md"
author: "Natalie"
date: "5 May 2018"
output: html_document
---
# Code Book for Variables
This Code Book was constructed using a guide to codebooks from: https://dss.princeton.edu/online_help/analysis/codebook.htm 

# Study Information

## Description of the Study:
### Performed by:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### Abstract:
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## Sampling Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

## For futher information:
Further information regarding the transformations from raw data to final tidy data set, using the run_analysis.R program, is found in the README.md file for this study. 

Consult the raw information files at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Variables
Column headings are comprised of descriptive titles from the following list of descriptors:

subject- volunteer identification number

activity- the activities of daily living (ADL), including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

time- recorded windows of 2.56 sec and 50% overlap (128 readings/window)

body- the body of the volunteer subject

acc- sensor acceleration signal, which has gravitational and body motion components

mean- mean value

frequency-frequency domain signals after Fast Fourier Transform was applied

x- 3-axial signal in the X direction

y- 3-axial signal in the Y direction

z- 3-axial signal in the Z direction

std- standard deviation value

gravity-  gravitational force

jerk- body linear acceleration and angular velocity were derived in time to obtain Jerk signals

gyro-gyroscope

mag- magnitude calculated using the Euclidean norm

freq- frequency value

For further clarification on variable descriptions consult the original raw information files at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
