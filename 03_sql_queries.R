##load library
library(DBI)
library(RSQLite)
##connect to sql  database
con <- dbConnect(RSQLite::SQLite(),"retail_sales_clean.db")
## view first 5 rows(SELECT)
preview_data <- dbGetQuery(con, "SELECT * FROM sales LIMIT 5;")
preview_data
## total retail sales across dataset
total_sales <- dbGetQuery(con, " SELECT SUM(retail_sales)AS total_sales FROM sales;")
##year wise sales analysis
yearly_sales <- dbGetQuery(con," SELECT year, SUM(retail_sales) AS yearly_total FROM SALES
+                            GROUP BY year
+                            ORDER BY year;")
yearly_sales
## filter(last year data)
latest_year <- dbGetQuery(con, "SELECT year, month, retail_sales
                          FROM sales
                          WHERE year = 2022
                          LIMIT 10;")
latest_year
## graph 1 year wise total retail sales
## analysing overall yearly growth pattern
##aggregate sales by year
yearly_sales <- dbGetQuery(con, "SELECT year,SUM(retail_sales) AS total_sales
                           FROM sales
                           GROUP BY year
                           ORDER BY year;")
yearly_sales
##item type wise sales(category comparision)
## to compare total sales across item categories
item_sales <- dbGetQuery(con, "SELECT item_type,
                          SUM(retail_sales)AS total_sales
                         FROM sales
                         GROUP BY item_type
                         ORDER BY total_sales DESC;")
item_sales
## close connection
dbDisconnect(con)
