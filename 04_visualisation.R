##load libraries
library(ggplot2)
library(DBI)
library(RSQLite)
##connect to sqlite database
con <- dbConnect(RSQLite::SQLite(),"retail_sales_clean.db")
##fetch data for visualization
sales_data <- dbGetQuery(con, " SELECT year, SUM(retail_sales)AS total_sales
                         FROM sales
                         GROUP BY year
                         ORDER BY year
                         ")
##Graph 1 : year wise retail sales trend
ggplot(sales_data, aes(x = year, y = total_sales)) +
  geom_line(color = "blue",linewidth = 1) +
  geom_point(color = "red", size = 3) +
   labs(
    title = "Retail Sales Over Years",
    x = "Year",
    y = "Total Retail Sales"
  ) +
  theme_minimal()

##Graph 2: Item type comparison
ggplot(item_sales, aes(x = item_type, y = total_sales, fill = item_type)) +
 geom_bar(stat = "identity") +
  labs(
    title = " Retail sales Trend by item type",
    x = "Item_Type",
    y = "Total  Sales"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45,hjust =1))
  