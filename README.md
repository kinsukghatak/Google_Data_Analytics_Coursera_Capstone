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

### ** Install packages :**
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
### **Read data :**

One the libraries are installed and called then I read the csv files as individual data frames and cleaned the column names to using janitor package. All the column names are converted to lower case for easier analysis later on. 
````
```
## Read files: 
Daily_Activity=read.csv('dailyActivity_merged.csv')
Daily_Calories=read.csv('dailyCalories_merged.csv')
Daily_Intensities=read.csv('dailyIntensities_merged.csv')
Daily_Sleep=read.csv('sleepDay_merged.csv')

## clean and rename column names :
Daily_Activity<-clean_names(Daily_Activity)
Daily_Activity<- rename_with(Daily_Activity, tolower)

Daily_Sleep<-clean_names(Daily_Sleep)
Daily_Sleep<- rename_with(Daily_Sleep, tolower)

Daily_Intensities<-clean_names(Daily_Intensities)
Daily_Intensities<- rename_with(Daily_Intensities, tolower)
```
````
### **Pre process :**
Once the data files are read and column names are processed; we started diving deep into the data sets. I used the below codes to udnerstand the unique count of customer ids across the various data sets.
In the next part of the code block, I crosschecked each and every dataset and dropped all the duplicate records. 
````
```
## Let us now count how many unique Ids are there in each of these datasets : 
n_distinct(Daily_Activity$id)
n_distinct(Daily_Sleep$id)
n_distinct(Daily_Intensities$id)

## Drop all the duplicate bservations : 
Daily_Activity <- Daily_Activity %>% distinct() %>% drop_na()
Daily_Intensities <- Daily_Intensities %>% distinct() %>% drop_na()
Daily_Sleep <- Daily_Sleep %>% distinct() %>% drop_na()

## check if still duplicate records exist 
sum(duplicated(Daily_Sleep))
sum(duplicated(Daily_Activity))

```
````
## **Phase 4:**  **ANALYSIS PHASE**

### **Exploratory Summary Statistics Analysis :**

In this phase, I selected few key variables from the different datsets and ran an exploratory distribution analysis using summary statistics on them, just to check how the different variables are distributed. 

````
```
##Select few specific variables and perform summary stats analysis on them:
Daily_Activity %>%
  select(total_steps, total_distance, sedentary_minutes) %>% summary()

Daily_Sleep %>%
  select(total_sleep_records, total_minutes_asleep, total_time_in_bed) %>% summary()

Daily_Intensities %>%
  select(lightly_active_minutes, fairly_active_minutes, very_active_minutes) %>% summary()
  
```
````
For example, the below snippet is the descriptive analytics result of the Daily_activity data set for total_steps, total_distance and sedentary_minutes variables. 

![image](https://github.com/kinsukghatak/Google_Data_Analytics_Coursera_Capstone/assets/11865861/83a749cd-4fb9-432b-96a5-3fb05ccca6af)

### **Exploratory visual analysis :**
In this phase, I have extracted few key variables and have tried to understand their relations with other key variables.For example I staretd with the total steps vs the sedentary minutes analysis from the Daily_activity dataset. As expected they have a negative correlation ; i.e. as the total steps go up the sedentary minutes come down which implies that as people become more active they spend less time sitting idle. the below code uses R's ggplot2 package and draws the wonderful graphs as displayed.

````
```
## analysing total steps vs sedentary minutes from the daily activity dataset :
ggplot(data=Daily_Activity, aes(x=total_steps, y=sedentary_minutes)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) + 
  labs(x ="total_steps", y = "sedentary_minutes", title = "Daily Activities: Total Steps and Sedentary Minutes")+ 
  theme_minimal()
  ```
````

![image](https://github.com/kinsukghatak/Google_Data_Analytics_Coursera_Capstone/assets/11865861/d9e042b2-d876-44a3-9e0d-ff80e4722069)


In a similar analysis, the Daily steps vs the sedendatry minutes were also crosscehcked using a heat map where calories burnt have been used as a marker with colour blue. The code used for this process is provided below. 

````
```
ggplot(data=Daily_Activity, aes(x=total_steps, y=sedentary_minutes, color = calories)) + 
geom_point() + 
labs(title = "Relationship: Daily Steps & Sedentary Minutes")
  ```
````
![image](https://github.com/kinsukghatak/Google_Data_Analytics_Coursera_Capstone/assets/11865861/bc350e27-eeb7-4870-84d5-9b3c2bf36bb8)

As can be seen from this graph, the more the total steps the dots turn light blue ; i.e. more calories are burnt. Similarly, when the sedentary minutes are high the dots are deep blue, implying lower burn out of calories. This is exactly in line with the business understanding as well.  


### **Exploratory analysis after merging of datasets:**
In this phase, I thought of analysing the activity and sleep information together. For this reason, first the Daily_Activity dataset and Daily_sleep dataset were grouped by the customer id and mean of certain key variables were obatined. The code used for this dataset creation is presented below:
````
```
## Group by Activity and Sleep data with customer id and obtain mean of distance, steps, calories burnt  and sleepn mins :
Activity_unique <- Daily_Activity %>%
  group_by(id) %>%
  summarise(mean_steps=mean(total_steps),
            mean_distance=mean(total_distance),
            mean_sed_mins=mean(sedentary_minutes),
            mean_cal=mean(calories)) %>%
  arrange(desc(mean_cal))

Sleep_unique <- Daily_Sleep %>%
  group_by(id) %>%
  summarise(mean_sleep_mins=mean(total_minutes_asleep))%>%
  arrange(desc(mean_sleep_mins))
  ```
````

Following this the two datasets are merged (inner joined) with customer id as the joining key. We wanted to understand how the mean_steps and mean_sleep_mins are related to each other. The below code that we have developed helps in answering this query.
````
```
## Merging activity and intesnity information :
ActivityandSleep <- merge(Activity_unique, Sleep_unique, by="id", how='inner')

## analysing mean teps vs sleep times from the merged dataset:
ggplot(data=ActivityandSleep, aes(x=mean_steps, y=mean_sleep_mins)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) + 
  labs(x ="mean_steps", y = "mean_sleep_mins", title = "Daily Activities: Mean Steps and Sleep times")+ 
  theme_minimal()

## find out the correlation :
cor(ActivityandSleep$mean_steps,ActivityandSleep$mean_sleep_mins)
  ```
````
The relationship between these two variables should have a negative correlation and that's true. We obtained a correlation of -0.21 which is in line with the expectation. To add to that, the below graph also showcases that there lies a negatvie relationship between these two variables. 

![image](https://github.com/kinsukghatak/Google_Data_Analytics_Coursera_Capstone/assets/11865861/40ff88ef-5438-450e-8ba4-65fd070e0809)


As mean activity times go up the mean sleep time comes down. That implies that active persons spend less time on bed. 

## **Phase 5:** **ACT PHASE**
The following recommendations may assist the marketing campaign strategy and improve the Bellabeat app: 
• Increase teleservices product offerings. Bellabeat can incorporate medical IoT, such as the use of cloud services and connected applications, allowing consumers to control their own health and allowing medical professionals to monitor their patients remotely, reducing the need for in-person visits.
• Include mental health among the areas you expand. Apps for digital therapy, mindfulness, meditation, and self-care for mental health. Bellabeat has software and scheduling tools that enable teletherapy to be applied more widely.
• Reaching a larger audience. Men's Bellabeat items should be included. The use of smart devices by men and women in comparison can then be studied in the future.

