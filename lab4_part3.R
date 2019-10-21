########
# Devin Gamble
########

library(tidyverse)
library(janitor)
library(here)

#Read in data
db0 <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() %>%  #default is lwoer snakecase
  rename(deaths_per_100k = death_rate_per_100_000)
  
View(db0)





