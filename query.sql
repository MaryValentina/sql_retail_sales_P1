--SQL Retail Sales Analysis- P1

--Create Table
CREATE TABLE retail_sales
             (

				transactions_id	INT PRIMARY KEY,
				sale_date DATE,	
				sale_time	TIME,
				customer_id	INT,
				gender	VARCHAR,
				age	INT,
				category VARCHAR(15),	
				quantiy	VARCHAR(15),
				price_per_unit	FLOAT,
				cogs	FLOAT,
				total_sale FLOAT

             );


SELECT * FROM retail_sales		 
LIMIT 10

SELECT
	COUNT(*)
FROM retail_sales	

--Data Cleaning--
SELECT * FROM retail_sales
WHERE transactions_id is Null

SELECT * FROM retail_sales
WHERE sale_date is Null

SELECT * FROM retail_sales
WHERE sale_time is Null

SELECT * FROM retail_sales
WHERE transactions_id is Null

SELECT * FROM retail_sales
WHERE 
	transactions_id is Null
	or
	sale_date is Null
	or
	sale_time is Null
	or
	gender is null
	or
	customer_id is null
	or 
	age is null
	or
	category is null
	or 
	quantiy is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;

DELETE FROM retail_sales
WHERE 
	transactions_id is Null
	or
	sale_date is Null
	or
	sale_time is Null
	or
	gender is null
	or
	customer_id is null
	or 
	age is null
	or
	category is null
	or 
	quantiy is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;

--Data Exploration--

--How many sales do we have--
select count(*) as total_sales
from retail_sales

--How many unique customers do we have--
select count (distinct customer_id) as Customers
from retail_sales

select distinct category 
from retail_sales

--Data Analysis & Business Key Problems--

--1. Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
select * 
from retail_sales
where sale_date='2022-11-05'

ALTER TABLE retail_sales
ALTER COLUMN quantiy TYPE INTEGER
USING quantiy::INTEGER;

--2. Write a SQL Query to retrieve all the transactions where the category is clothing and the quantity sold is more than 4 in the month of nov-2022
select 
	*
from retail_sales
where category='Clothing'
	and
	TO_CHAR(sale_date,'YYYY-MM')='2022-11'
	and
	quantiy >= 4

--3. Write a SQL query to calculate total sales (total_sale) for each category

select category,
sum(total_sale) as net_sale,
count(*) as total_orders
from retail_sales
Group by category

--4. Write a query to find the average age of customers who purchased items from the 'Beauty' Category
select 
Round(AVG(age),2) as avg_age
from retail_sales
where category='Beauty'

--5. Write a SQL query to find all transactions where the total_sale is greater than 1000.
select *
From retail_sales
where total_sale > 1000 

--6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each caetgory
select category, gender, count(transactions_id)
From retail_sales
Group by category, gender
order by 1

--7. Write a SQL query to calculate the average sale for each month, find out best selling month in each year
select 
year,month,avg_sale
FROM
(
	SELECT
		EXTRACT (YEAR FROM sale_date) as year,
		EXTRACT (MONTH FROM sale_date) as month,
		AVG(total_sale) as avg_sale,
		RANK () OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) as rank
		from retail_sales
		GROUP BY 1,2
) as t1
WHERE rank=1

--8. Write a SQL Query to find the top 5 customers based on the highest total sales
select
customer_id,
SUM(total_sale) as total_sales
From retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--9. Write a SQL Query to find the number of unique customers who purchased items from each category
select
category,
COUNT(DISTINCT(customer_id)) as count_of_unique_customers
From retail_sales
GROUP BY category

--10. Write a SQL Query to create each shift and number of orders (Example morning<=12, Afternoon between 12&17, Evening >17)
WITH hourly_sale AS (
  SELECT *,
    CASE
      WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'MORNING'
      WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
      ELSE 'EVENING'
    END AS shift
  FROM retail_sales
)
SELECT 
  shift,
  COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
