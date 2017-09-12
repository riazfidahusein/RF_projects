library(RSQLite)
sqlite <- dbDriver("SQLite")
con = dbConnect(sqlite, dbname = "/home/rstudio/Dropbox/data/european_football_database.sqlite")

dbListTables(con)
data <- dbGetQuery(con, "select * from League")

dbDisconnect(con)
