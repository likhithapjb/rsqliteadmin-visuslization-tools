# rsqliteadmin-visuslization-tools
This repository demonstrates a prototype implementation of data visualization tools for SQLite database using R.
Technologies used:
-R
-SQLite
-DBI
-RSQLite
Project Structure:
01.clean_data.R
cleans and prepares the dataset for analysis.
02.Sqlite_setup.R
creates a SQLite database and  loads the cleaned dataset
03.Sql_queries.R
Runs SQL queries to extract meaningful aggregated data.
04.Visualization.R
Generates visualizations using ggplot2 including:
-Time series line charts
-Bar charts by item category
These scripts together demonstrate a simple pipeline:
Data cleaning -> SQLite storage -> SQL analysis -> Data visualization

