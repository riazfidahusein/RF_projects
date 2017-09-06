# code to install engsoccerdata package
# library(devtools)
# install_github('jalapic/engsoccerdata', username = "jalapic")


library(dplyr)
library(engsoccerdata)

# data(package="engsoccerdata")    # lists datasets currently available

arse_games <- england %>% 
  filter(home == "Arsenal" | visitor == "Arsenal")

# total games played
games_played <- summarise(arse_games, n())

# games won/ drawn/ lost
season_home_wins <- arse_games %>% 
  filter(home == "Arsenal" | result == 'h') %>% 
  select(Season, home, visitor, hgoal, vgoal, totgoal) %>% 
  group_by(Season)
  summarise(n())

away_wins <- arse_games %>% 
  filter(home == "Arsenal" | result == 'h') %>% 
  summarise(n())



england %>% 
  filter(Season == min(Season)) %>% 
  select(Date)