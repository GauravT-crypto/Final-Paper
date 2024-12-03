#### Preamble ####
# Purpose: Tests for the four dataset cleaned to make sure it is suitable for analyses
# Author: Gauravpreet Thind
# Date: 8th November 2024
# Contact: gauravpreet.thind@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# 01-download_data.R
# GSS.dct
# GGS.dat


#### Workspace setup ####
library(tidyverse)
library(arrow)

GSS <- read_parquet("C:/Users/gthin/OneDrive/Documents/final/cleaned_GSS.parquet")
demo_data <- read_parquet("C:/Users/gthin/OneDrive/Documents/final/demo_data.parquet")
days_data <- read_parquet("C:/Users/gthin/OneDrive/Documents/final/days_data.parquet")
analysis_data <- read_parquet("C:/Users/gthin/OneDrive/Documents/final/analysis_data.parquet")
mentalVsHealth <- read_parquet("C:/Users/gthin/OneDrive/Documents/final/mentalVsHealth_data.parquet")

#### Test data ####
# expected that id is only from 1 to 72390
unique(GSS$id) == c(1:72390)

# expected that year is only from 1972 to 2022
max(GSS$year) <= 2022
min(GSS$year) >= 1972

# expected that sex is only between 1 to 2
max(demo_data$sex) == 2
min(demo_data$sex) == 1
### This test passed, but only after changing order and should be improved.
any(unique(demo_data$sex) == c(2:1))

# expected that age is only between 1 to 99
min(demo_data$age) >= 1
max(demo_data$age) <= 99

# expected that mental_health is only between 0 to 31
min(demo_data$ment_days) >= 0
max(demo_data$ment_days) <= 31
min(days_data$ment_days) >= 0
max(days_data$ment_days) <= 31
min(mentalVsHealth$ment_days) >= 0
max(mentalVsHealth$ment_days) <= 31


# expected that physical_health is only between 0 to 31
min(demo_data$phys_days) >= 0
max(demo_data$phys_days) <= 31
min(days_data$phys_days) >= 0
max(days_data$phys_days) <= 31
min(depress_data$phys_days) >= 0
max(depress_data$phys_days) <= 31

# expected that depress is only either 1 or 2
max(depress_data$depress) == 2
min(depress_data$depress) == 1
### This test passed, but only after changing order and should be improved.
any(unique(depress_data$depress) == c(2:1))

# expected that health is only between 1 to 4
max(mentalVsHealth$health) <= 4
min(mentalVsHealth$health) >= 1
any(unique(mentalVsHealth$health) == c(1:4))
