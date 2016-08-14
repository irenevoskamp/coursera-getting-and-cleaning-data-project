# coursera-getting-and-cleaning-data-project
This project comprises the final project for the Getting and Cleaning Data Course. 

This repository contains: a tidy data set as described below,  a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md. It also includes this README.md which  explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R Script called run_analysis.R  does the following.

  1. Download the dataset (if it does not already exist in the working directory)
  2. Load the activity and feature info
  3. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
  4. Loads the activity and subject data for each dataset, and merges those columns with the dataset
  5. Merges the two datasets
  6. Converts the activity and subject columns into factors
  7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
  
The end result is shown in the file tidy.txt.
