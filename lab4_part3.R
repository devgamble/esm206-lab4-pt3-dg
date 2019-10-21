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

#Create subset for comparison of infant death rates, then graph

db_sub <- db0 %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan","Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both") #can use & instead of ,
#Keep rows where country matches any of these
# Check with unique(db_sub$country_name)

#Create a basic line graph
ggplot(data = db_sub, aes(x = year, y = deaths_per_100k))+
  geom_line(aes(color = country_name))



