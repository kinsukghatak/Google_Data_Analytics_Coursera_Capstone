#install.packages("tidyverse")
#install.packages('janitor')

library(tidyverse)
library(here)
library(skimr)
library(lubridate)
library(janitor)

Daily_Activity=read.csv('dailyActivity_merged.csv')
Daily_Calories=read.csv('dailyCalories_merged.csv')
Daily_Intensities=read.csv('dailyIntensities_merged.csv')
Daily_Sleep=read.csv('sleepDay_merged.csv')
Daily_Sleep=read.csv('sleepDay_merged.csv')



Daily_Activity<-clean_names(Daily_Activity)
Daily_Activity<- rename_with(Daily_Activity, tolower)

Daily_Sleep<-clean_names(Daily_Sleep)
Daily_Sleep<- rename_with(Daily_Sleep, tolower)

Daily_Intensities<-clean_names(Daily_Intensities)
Daily_Intensities<- rename_with(Daily_Intensities, tolower)

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

## LEt us now analyze the summary statistics :
summary(Daily_Activity)
summary(Daily_Sleep)

##Select few specific variables and perform summary stats analysis on them:
Daily_Activity %>%
  select(total_steps, total_distance, sedentary_minutes) %>% summary()

Daily_Sleep %>%
  select(total_sleep_records, total_minutes_asleep, total_time_in_bed) %>% summary()

Daily_Intensities %>%
  select(lightly_active_minutes, fairly_active_minutes, very_active_minutes) %>% summary()

## analysing total steps vs sedentary minutes from the daily activity dataset :
ggplot(data=Daily_Activity, aes(x=total_steps, y=sedentary_minutes)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) + 
  labs(x ="total_steps", y = "sedentary_minutes", title = "Daily Activities: Total Steps and Sedentary Minutes")+ 
  theme_minimal()

## analysing total steps vs Very active minutes from the daily activity dataset :
ggplot(data=Daily_Activity, aes(x=total_steps, y=very_active_minutes)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) + 
  labs(x ="total_steps", y = "very_active_minutes", title = "Daily Activities: Total Steps and Very Active Minutes")+ 
  theme_minimal()

ggplot(data=Daily_Activity, aes(x=total_steps, y=sedentary_minutes, color = calories)) + 
geom_point() + 
labs(title = "Relationship: Daily Steps & Sedentary Minutes")


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
  

## Merging activity and intesnity information :
ActivityandSleep <- merge(Activity_unique, Sleep_unique, by="id", how='inner')

## analysing mean teps vs sleep times from the merged dataset:
ggplot(data=ActivityandSleep, aes(x=mean_steps, y=mean_sleep_mins)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) + 
  labs(x ="mean_steps", y = "mean_sleep_mins", title = "Daily Activities: Mean Steps and Sleep times")+ 
  theme_minimal()

## find out the correlation :
cor(ActivityandSleep$mean_steps,ActivityandSleep$mean_sleep_mins)
