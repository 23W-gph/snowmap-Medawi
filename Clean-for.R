###############################  FIRST : IMPORTING DATA ################# 
# 1- Import Data: 
data <- read.csv("diabetes.csv")
# 2- Select Important columns only 
###########################################################################
# 3- Explore Data:
str(data)      # Structure of the data
summary(data)  # Summary statistics
head(data)     # Display the first few rows
## Correlation Matrix: ####################################################
correlation_matrix <- cor(data, use = "complete.obs")
############## Add New column: Diabetics Category ###########
library(dplyr)
new_df <-data %>% 
  mutate(Diabetics_cat = case_when(FFPG<5.6 ~ "Not Diabetics",
                                   FFPG >= 5.6 & FFPG < 7 ~ "Pre-Diabetics",
                                   FFPG >= 7 ~ "Diabetic", 
                                   TRUE ~ NA_character_))
## Change the type :
new_df$Diabetics_cat <- as.factor(new_df$Diabetics_cat)
new_df$smoking <- factor(new_df$smoking, levels =c(1,2,3,4.860753), labels = c("Never smoked", "Occasional smoker", "Regular smoker", "Heavy smoker"))
new_df$drinking <- factor(new_df$drinking, levels =c(1,2,3,4.860753), labels = c("Never", "Sometimes", "Regular", "Heavy"))
new_df$Gender <- factor(new_df$Gender, levels =c(1,2), labels = c("Male", "Female"))
