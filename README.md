# Google_Data_Analytics_Coursera_Capstone
This repository contains the R Script and readme file for the final capstone project under Google Data Analytics course in Coursera
# Background : 
In order to give women more control over their own health and behaviours, Bellabeat, a wellness firm and tech-driven producer of health-focused smart goods, provides a variety of smart gadgets that collect data on exercise, sleep, stress, and reproductive health.
In order to better understand how customers use their smart devices, the case study will focus on one Bellabeat product (the Leaf Health Fitness Tracker) and analyse smart device usage data from non-Bellabeat smart devices (Fitbit).
Bellabeat would have greater growth potential shown by the analytical insights of the consumer data from smart devices that is now available. This data analysis's objective may help consumers better understand their behaviours and make health and wellness decisions.

# ASK PHASE

## Business Task
The issue is that Bellabeat is a small company with the potential to become a larger player in the global smart device market and it is looking to unlock new growth opportunities. Analyzing smart devise fitness data could help unlock new areas for growth and development. I was presented with the business task to identify trends on how consumers use non-Bellabeat smart devices to inform Bellabeat’s marketing strategy.

The Research Questions
1.) How do consumers of Fitbit products use smart devises to gain insights into new growth opportunities for Bellabeat?
2.) What growth opportunity exist for Bellabeat based on results?

PREPARE PHASE

Dataset
The data source used for the case study is Fitbit Fitness Tracker Data. This dataset is stored in Kaggle and was made available through Möbius. The dataset contains personal fitness tracker from thirty Fitbit users. The dataset includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.
Source: Mobius. April-May 2016. Fitbit Fitness Tracker Data, Version 1. Retrieved July 2022 from https://www.kaggle.com/datasets/arashnic/fitbit?resource=download

Accessibility, Data Integrity, Privacy
Verifying the metadata reveals that accessibility of the metadata usage is open-source. The author associated to the work reveals no copyright and has dedicated the work to the public domain by waiving all of his or her rights to the work worldwide under copyright law, including all related and neighboring rights. You can copy, modify, distribute, and perform the work, even for commercial purposes, all without asking permission.

Information About the Dataset
Respondents generated this dataset to a distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. The variation between output represents the use of different types of Fitbit trackers and individual tracking behaviors and preferences. The dataset includes information about daily activity, steps, and heart rate that we can use to explore users’ habits.

Data Organization, Sorting, Verification
Data Organization. The Fitabase data folder contains 18 .CSV files that provides quantitative information which includes daily activity, calories, intensities, steps, heartrate, sleep, and weight log. The spreadsheet contains data of each uniquely identified subject in multiple rows based on activity date. The data is considered a long format since there is one observation row per subject where each subject will have data in multiple rows. Each user has a unique ID with multiple rows of data for each tracked by day and time.

Verification. I first converted the files from .CSV to Excel for ease of data organization because upon opening certain files the spreadsheets indicated that certain .CSV files contained data with over 1.3 million rows. Tables in Apple Numbers application for .CSV files cannot support more than one million rows. Thus, I used Excel to sort the sample and filtered the tables using Pivot Tables. I verified attributes, observations, and relations between each table. I counted the sample size (number of users) and verified the analysis of the length of time as 31 days.
