# GCD_CourseProject
## Getting and Cleaning Data Course Project

###Repo
This Repo contains the following files and directories:
- **INPUT-THE RAWS DATA**: *UCI HAR Dataset*, source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . A full description is available on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
- **SCRIPT**: *run_analysis.R*: the script for getting and cleaning the raws data. It creates a text file with the tidy data set
- **OUTPUT-THE TIDY DATA**: *tidyData.txt*: the text file with the tidy data set
- **Code Book**: *CodeBook.md* describes each variable and its values in the tidy data set
- **README**: *README.md* (the present file)

###How run_analysis.R script works
- First, download and unzip in your working directory the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Use source("run_analysis.R") command in RStudio.
- The script generates the tidyData.txt in your working directory
- You can use read.table("tidyData.txt") command in RStudio to read the file
