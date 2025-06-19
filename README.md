Retail Sales Analysis – P1
Project Overview
Level: Beginner
Database: retail_sales

This SQL project was completed as part of my learning journey in data analytics. I followed a YouTube tutorial for guidance but executed all the SQL queries independently, made corrections, and customized the work to suit my own learning. The project focuses on analyzing retail sales data by setting up a structured database, cleaning the data, and answering key business questions using SQL.

Objectives
Create and structure a retail sales database

Clean and prepare data for analysis

Perform exploratory data analysis (EDA)

Solve real-world business problems using SQL

Tools Used
PostgreSQL

SQL (Structured Query Language)

pgAdmin (or your preferred SQL client)

Skills Demonstrated
SQL table creation and data typing

Data cleaning using DELETE and IS NULL

Aggregation using COUNT(), SUM(), AVG()

Filtering with WHERE, BETWEEN, and TO_CHAR()

Grouping and ordering with GROUP BY and ORDER BY

Window functions (RANK() OVER)

Time-based analysis using EXTRACT() and CASE

Project Steps
1. Database & Table Setup
sql
Copy
Edit
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR,
    age INT,
    category VARCHAR(15),
    quantiy VARCHAR(15),
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
I also altered the column quantiy (spelling preserved from the dataset) to change its type from VARCHAR to INTEGER.

2. Data Cleaning
Checked for NULLs in all critical columns.

Deleted rows where any essential column was NULL.

sql
Copy
Edit
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
    gender IS NULL OR customer_id IS NULL OR age IS NULL OR
    category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL OR 
    cogs IS NULL OR total_sale IS NULL;
3. Data Exploration
Total sales count

Unique customers

Distinct product categories

4. Business Questions Answered
Sales on a Specific Day

All transactions on 2022-11-05

High-Quantity Clothing Sales in November 2022

Total Sales per Category

Average Age of Customers in 'Beauty' Category

Transactions Where Total Sale > 1000

Number of Transactions by Gender in Each Category

Best Selling Month per Year

Used EXTRACT() and RANK() to identify the top month.

Top 5 Customers by Total Sales

Unique Customer Count by Category

Sales Shifts Based on Time (Morning, Afternoon, Evening)

Used a CASE statement with EXTRACT(HOUR) to classify shift.

Sample Insight Highlights
Several transactions had a total sale > 1000, showing premium purchases.

Clothing was frequently purchased in larger quantities during November.

Morning shift recorded the highest number of sales.

What I Learned
Importance of data cleanliness before analysis

Effective use of SQL time functions and filters

How to structure real business logic using SQL

Gained confidence in independently writing queries and interpreting results

How to Use
Set up the table using the CREATE TABLE script.

Load data (CSV or SQL insert statements).

Run the analysis queries for business insights.

Customize queries to explore other trends.

Author – Mary Valentina
This project is part of my data analytics portfolio and showcases my foundational SQL skills. I’m passionate about learning and growing as a data analyst.

Feel free to connect or provide feedback:

LinkedIn: Your LinkedIn Profile (Update when ready)
