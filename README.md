# Google_Data_Analytics_Coursera_Capstone
This repository contains the R Script and readme file for the final capstone project under Google Data Analytics course in Coursera
# **Background** : 
In order to give women more control over their own health and behaviours, Bellabeat, a wellness firm and tech-driven producer of health-focused smart goods, provides a variety of smart gadgets that collect data on exercise, sleep, stress, and reproductive health.
In order to better understand how customers use their smart devices, the case study will focus on one Bellabeat product (the Leaf Health Fitness Tracker) and analyse smart device usage data from non-Bellabeat smart devices (Fitbit).
Bellabeat would have greater growth potential shown by the analytical insights of the consumer data from smart devices that is now available. This data analysis's objective may help consumers better understand their behaviours and make health and wellness decisions.

## **Phase 1:**  **ASK PHASE**

## **Business Task**
The issue is that Bellabeat is a small company with the potential to become a larger player in the global smart device market and it is looking to unlock new growth opportunities. Analyzing smart devise fitness data could help unlock new areas for growth and development. I was presented with the business task to identify trends on how consumers use non-Bellabeat smart devices to inform Bellabeat’s marketing strategy.

**The Research Questions**
1.) How do consumers of Fitbit products use smart devises to gain insights into new growth opportunities for Bellabeat?
2.) What growth opportunity exist for Bellabeat based on results?

## **Phase 2:** **PREPARE PHASE**

### **Dataset**
The data source used for the case study is Fitbit Fitness Tracker Data. This dataset is stored in Kaggle and was made available through Möbius. The dataset contains personal fitness tracker from thirty Fitbit users. The dataset includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.
Source: Mobius. April-May 2016. Fitbit Fitness Tracker Data, Version 1. Retrieved July 2022 from https://www.kaggle.com/datasets/arashnic/fitbit?resource=download

### **Accessibility, Data Integrity, Privacy**
Verifying the metadata demonstrates that the usage of the metadata is open-source and accessible. By giving up all of his or her rights to the work globally under copyright law, including all related and neighbouring rights, the author connected with the work discloses no copyright and dedicates the work to the public domain. The work may be duplicated, altered, distributed, and performed without prior consent—even for profit.

### **Information About the Dataset**
This dataset was produced by respondents to a distributed survey using Amazon Mechanical Turk between December 3, 2016, and December 5, 2016. Thirty eligible Fitbit users agreed to provide their personal tracker data, which included minute-level output for heart rate, sleep, and physical activity tracking. The differences in the output reflect the use of various Fitbit tracker models as well as individual monitoring habits and preferences. We may utilise the dataset's daily activity, step, and heart rate data to investigate users' routines.

### **Data Organization, Sorting, Verification**
Data Organization. The data folder contains 18 .CSV files including quantitative data, such as daily activity, calories, intensities, steps, heartrate, sleep, and weight log. Based on activity date, the spreadsheet includes data for each subject with a unique identification number in numerous rows. Since there is one observation row for each subject and each subject will have data in numerous rows, the data is seen as having a lengthy format. Each user has a distinct ID, and day and time-tracking data are tracked in numerous rows for each user.

### **Verification**
I uploaded all the files to the we based posit cloud tool, created a project space and read all the .csv files as data frame. I checked all the files and found they were okay. Then decided to proceed with only the daily activity, sleep and intesity information for the analytical study and exploratory analysis work. 


## **Phase 3:**  **PROCESSING PHASE**

**### Install packages :**
The below libraries are used for the data processing and analysis.
````
```
library(tidyverse)
library(here)
library(skimr)
library(lubridate)
library(janitor)

```
````
