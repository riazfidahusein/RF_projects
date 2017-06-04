# script to load cleaed data from BOE excel files to SQLite database
library(tidyverse)
library(RSQLite)
library(dplyr)
library(ggplot2)
library(tidyquant)
library(PerformanceAnalytics)
library(RFtools)
library(devtools)
install_github('RFtools','riazfidahusein')

datapath <- 'C:/Users/Riaz/Dropbox/RF_Projects/BoE_Macro_Analysis/data/'

# load csv data from orig BoE files
seriesMap <- read_csv(paste(datapath, 'Original_BoE_Datasets/seriesMap.csv',sep = ''))
headlineSeries <- read_csv(paste(datapath, 'Original_BoE_Datasets/headlineSeries.csv',sep = ''))

# create new database and tables
# con = dbConnect(SQLite(), dbname = paste(datapath, 'BoEData.sqlite', sep = ''))
# dbWriteTable(con, "seriesMap", seriesMap)
# dbWriteTable(con, "headlineSeries", headlineSeries)


# connect to database
db <- src_sqlite(path = paste(datapath, 'BoEData.sqlite', sep = ''))
# load tables
map <- tbl(db, "seriesMap")
series <- tbl(db, "headlineSeries")

# retreive data from database
mydata <- series %>%
  select(Year, realGDP_fc) %>% 
  filter(!is.na(realGDP_fc)) %>%
  as_xts(date_col = Year) %>% 
  collect(mydata)

# calculate returns
mydata <- df2xts(mydata)


# plot output
ggplot(mydata, aes(x = Year, y = log(realGDP_fc))) +
  geom_point()





