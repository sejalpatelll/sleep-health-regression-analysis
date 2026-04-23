library(tidyr)
library(dplyr)

sleep_data <- read_csv("Project/sleep.csv")

# ***************************************************
#                   CLEANING DATA                   *
# ***************************************************

# Getting rid of PersonID column
sleep <- select(sleep_data, -1)
View(sleep)

# Renaming columns
colnames(sleep) <- c("Gender", "Age", "Occuptaion", "Sleep_Duration", "Sleep_Quality", "Physical_Activity", "Stress_Level", "BMI_Category", "BP", "Heart_Rate", "Daily_Steps", "Sleep_Disorder")

# Changing "Normal Weight" to "Normal" in BMI column
sleep$BMI_Category[which(sleep$BMI_Category == "Normal Weight")] <- "Normal"
View(sleep)

# checking for NAs
sum(is.na(sleep))
