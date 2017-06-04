# Script to analyse Sberbank_Housing_Mkt
library(tidyverse)
library(data.table)

setwd <- 'C:/Users/Riaz/Dropbox/riaz work/R_Projects/Sberbank_Housing_Mkt/'

macro <- read_csv("./data/macro.csv")
train <- read_csv("./data/train.csv")
              
