#### Preamble ####
# Purpose: Tests for the four dataset cleaned to make sure it is suitable for analyses
# Author: Gauravpreet Thind
# Date: 8th November 2024
# Contact: gauravpreet.thind@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# 02-data_cleaning.R
# GSS.dct
# GGS.dat

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
path <- "data/analysis_data/analysis_data.parquet"
analysis_data <- read_parquet(here::here(path))

### Model data ####
model <-
  stan_glm(
    formula = phys_days ~ ment_days + depress,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  model,
  file = "models/model.rds"
)
