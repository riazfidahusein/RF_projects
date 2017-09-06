library(devtools)
install_github('jalapic/engsoccerdata', username = "jalapic")
library(engsoccerdata)

data(package="engsoccerdata")    # lists datasets currently available
library(dplyr)

arse_games <- england %>% 
  filter(home == "Arsenal" | visitor == "Arsenal")

summary(arse_games)

england %>% 
  filter(Season == min(Season)) %>% 
  select(Date)