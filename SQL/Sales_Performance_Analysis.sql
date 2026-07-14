/*==========================================================
 Project: Sales Performance Analysis
 Author: Raghothaman Balaji
 Tool: MySQL
 Dataset: Superstore
==========================================================*/


/*=========================================================
1. DATA EXPLORATION
=========================================================*/

use sales_analysis;
    USE sales_analysis;

Select * from orders LIMIT 10;
select count(*) as Toatal_Records from orders;
SELECT
    MIN(`Row ID`) AS min_row_id,
    MAX(`Row ID`) AS max_row_id
FROM orders;
select 
	'row id',
    count(*) as occurrences
    from orders
    group by 'row id'
    having count(*) > 1;
    
    SHOW WARNINGS;
    
    SELECT COUNT(*) AS total_records
FROM `sample-superstore`;

SELECT COUNT(*) AS total_records
FROM orders;

SELECT COUNT(*) FROM `sample-superstore`;

SELECT
    `Row ID`,
    COUNT(*) AS occurrences
FROM orders
GROUP BY `Row ID`
HAVING COUNT(*) > 1;

SHOW TABLES ;

SELECT COUNT(*) AS total_records
FROM `sample - superstore`;

SELECT SUM(`Sales`) AS Total_Sales FROM orders;

SELECT SUM(`Profit`) AS Total_Profit FROM orders;

SELECT COUNT(`Order ID`) AS Total_Order FROM orders;

SELECT COUNT(distinct`Customer ID`) AS Total_Customer FROM orders;


SELECT
    SUM(`Sales`) AS Total_Sales,
    SUM(`Profit`) AS Total_Profit,
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    AVG(`Discount`) AS Average_Discount
FROM orders;

select
	Category,
    sum(Sales) as highest_sales
    FROM orders
    group by Category
    order by highest_sales desc
    limit 1;

select
	Region,
    sum(Profit) as lowest_profit
    from orders
    group by Region
    order by lowest_profit asc
    limit 1;
    
select
	`Customer ID`,
    sum(sales) as Total_Sales
    from orders
    group by `Customer ID`
    order by Total_sales desc
    limit 5;
    
    SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 5;
    
select
	`Product ID`,
    `Product Name`,
    sum(profit) as Total_Profit
    from orders
    group by `Product ID`, `Product Name`
    order by Total_Profit desc
    limit 5;
    
select
	`Product id`,
    `Product name`,
    round(avg(Discount),2) as Highest_Average_Discount
    from orders
    group by `Product id`,`product name`
    order by Highest_Average_Discount desc
    limit 10;

select
	`product id`, `product name`,
    round(sum(sales),2) as high_sales,
    round(sum(profit),2) as low_profit
    from orders
    group by `product id`, `product name`
    order by high_sales desc, low_profit asc
    limit 1;
    
select
	`product name`
    from orders
    where `sales` > 1000;
    
    
SELECT
    `Order ID`,
    `Product Name`,
    Sales,
    Profit
FROM orders
WHERE Sales > 1000;
    
select 
    `region`,
    count(DISTINCT `order id`) as Total_Orders
    from orders
    group by `region`
	having Total_Orders > 500;
    
select 
	`region`,
    round(sum(`sales`),2) as total_sales
	from orders 
    group by `region`
    having total_sales > 500000;
    
    
select 
	`region`,
    round(sum(`sales`),2) as total_sales
	from orders
    where `sales` > 1000
    group by `region`
    having sum(`sales`) > 500000;
    
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
WHERE Sales > 1000
GROUP BY Region;
		
	select 
		`Product Name`,
        round(sum(`profit`),2) as total_Profit,
	case
		when sum(profit) > 5000 then 'High Profit'
		when sum(profit) between 1000 and  5000 then 'Medium profit'
        else 'low profit'
	end as profit_category
    from orders
    group by `product name`
    order by total_profit desc;
	
    SELECT
    `Order Date`,
    `Ship Date`
FROM orders
LIMIT 10;

DESCRIBE orders;

SHOW COLUMNS FROM orders;


SELECT
    `Order Date`,
    Order_Date
FROM orders
LIMIT 10;

SELECT
    Order_Date,
    YEAR(Order_Date) AS Order_Year
FROM orders
LIMIT 10;

select 
	Year(Order_Date) as _year_,
    Round(sum(sales),2) as Total_Sales
    from orders
    group by year(Order_Date)
    order by sum(sales) desc;

select
	month(Order_date) as Month_No,
    monthname(Order_date) as Month_name,
    round(sum(sales),2) as Total_Sales
    from orders
    group by 
		month(Order_date),
        monthname(Order_date)
	order by sum(sales) desc;
    
select 
	month(order_date) as Month_No,
    monthname(Order_date) as Month_name,
    round(sum(profit),2) as Total_Profit
    from orders
    group by
		month(order_date),
         monthname(Order_date) 
	order by Total_Profit desc;
    
select 
	month(order_date) as Month_No,
    monthname(Order_date) as Month_name,
    round(sum(profit),2) as Total_Profit
    from orders
    group by
		month(order_date),
         monthname(Order_date) 
	order by Total_Profit asc
    limit 1;
    
select
	Category,
    Round(sum(profit),2) as Highest_Profit
    from orders
    where monthname(order_date) = 'December'
    group by Category
    order by  Highest_Profit desc;
    
select 
    `Product ID`,
    `Product Name`,
    Round(sum(profit),2) as Total_Profit
    from orders
    where Category = 'Technology' 
    and month(order_date) = 12
    group by 
		    `Product ID`,
			`Product Name`
	order by Total_Profit desc
    limit 5;
    
select
	`Customer ID`,
    `Customer Name`,
    round(sum(profit),2) as total_profit
from orders
where Category = 'Technology' 
	and month(order_date) = 12
group by 
	`Customer ID`,
    `Customer Name`
order by total_profit desc
limit 5;

select
	round(avg(`Discount`),2) as Average_Discount
    from orders
    where Category = 'Technology'
		and month(`order_Date`) = 12;
    
select 
		round(avg(`Discount`),2)  as Overall_Discount
    from orders;
    
select 
	`region`,
    round(sum(`profit`),2) as Profit_By_Region
    from orders
	where Category = 'Technology'
		and month(`order_Date`) = 12
	group by `region`
    order by Profit_By_Region desc;
    
select
	`City`,
    round(sum(`profit`),2) as Total_Profit
    from orders
    where Category = 'Technology'
		and month(`order_Date`) = 12
	group by `city`
    order by Total_Profit desc
    limit 10;
    
select
	`product ID`,
    `Product Name`,
    round(avg(`Discount`),2) as Discount,
	sum(`Quantity`) as Total_Quantites,
    round(sum(`profit`),2) as Total_Profit
    from orders
    group by 
		`product ID`,
		`Product Name`
	order by Total_Quantites desc
    limit 10;
    
    select * from orders