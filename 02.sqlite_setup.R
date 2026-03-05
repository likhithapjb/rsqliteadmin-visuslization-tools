#load libraries
library(DBI)
library(RSQLite)
library(readr)
##load csv file
df <- read_csv('retail_sales_clean.csv')
##connect to SQLite
con <- dbConnect(RSQLite::SQLite(),"retail_sales_clean.db")
#write data frame into table
dbWriteTable(con,"sales",df, overwrite = TRUE)
dbListTables(con)
#check schema
dbGetQuery(con, "PRAGMA table_info(sales);")
## check  row count
dbGetQuery(con, "SELECT COUNT(*) FROM sales;")
##close connection
dbDisconnect(con)
