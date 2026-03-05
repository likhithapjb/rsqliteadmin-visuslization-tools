##load library
library(DBI)
library(RSQLite)
library(ggplot2)
library(readr)
library(shiny)
##load csv file
##then validate data
df <- read.csv("retail_sales_clean.csv")
head(df)
str(df)
dim(df)
summary(df)
#clean data
colSums(is.na(df))
sum(duplicated(df))
unique(df$month)
sum(df$retail_sales<0)
##select required columns
colnames(df)
df <- df[, c("YEAR", "MONTH", "RETAIL.SALES","ITEM.TYPE")]
#fix column names
colnames(df) <- tolower(colnames(df))
colnames(df) <- gsub("\\.","_",colnames(df))
colnames(df)
#fix data types
df$year <- as.numeric(df$year)
df$month <- as.numeric(df$month)
df$retail_sales <- as.numeric(df$retail_sales)
df$item_type <- as.factor(df$item_type)
#check missing values
colSums(is.na(df))
str(df)
write_csv(df, "retail_sales_clean.csv")
