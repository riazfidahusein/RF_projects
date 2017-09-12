# code to install engsoccerdata package
# library(devtools)
# install_github('jalapic/engsoccerdata', username = "jalapic")


library(tidyverse)
library(plyr)
library(engsoccerdata)

# data(package="engsoccerdata")    # lists datasets currently available

teamName <- "Arsenal"

tot_games <- england %>% 
  filter(home == teamName | visitor == teamName)

# total games played
games_played <- summarise(tot_games, n())

# games won/ drawn/ lost
home_game_outcomes <- tot_games %>% 
  filter(home == teamName) %>% 
  select(result) %>%
  mutate(outcome = replace(result, which(result == "A"), "L")) %>%
  mutate(outcome = replace(outcome, which(result == "H"), "W")) %>%
  select(outcome) %>% 
  group_by(outcome) %>% 
  tally()
  
away_game_outcomes <- tot_games %>% 
  filter(visitor == teamName) %>% 
  select(result) %>%
  mutate(outcome = replace(result, which(result == "A"), "W")) %>%
  mutate(outcome = replace(outcome, which(result == "H"), "L")) %>%
  select(outcome) %>% 
  group_by(outcome) %>% 
  tally()


# build league table
zz <- england %>% 
  arrange(Date) %>% 
  dlply("Season", identity)


tmp <- zz$`1888`


teams <- unique(c(tmp$home, tmp$visitor))



build_league_table()

england %>% 
  filter(Season == 1888) %>%
  select(home, visitor) %>% 
  







