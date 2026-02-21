CREATE DATABASE ecommerce_analytics;

CREATE TABLE IF NOT EXISTS sample_superstore AS
SELECT * FROM sample_superstore;

SELECT COUNT(*) AS total_records
FROM sample_superstore;

SELECT COUNT(*) AS total_null_records
FROM sample_superstore
WHERE row_id IS NULL;

SELECT *
FROM sample_superstore
WHERE sales IS NULL;

SELECT order_id, COUNT(*) 
FROM sample_superstore
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT DISTINCT category FROM sample_superstore;
SELECT DISTINCT region FROM sample_superstore;
SELECT DISTINCT ship_mode FROM sample_superstore;
SELECT DISTINCT segment FROM sample_superstore;

SELECT 
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore;

SELECT 
    category,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY category
ORDER BY total_sales DESC;

SELECT 
    region,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT 
    ship_mode,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

SELECT 
    segment,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY segment
ORDER BY total_sales DESC;

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY order_year
ORDER BY order_year;

SELECT 
    TO_CHAR(order_date,'Month') AS month,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY EXTRACT(MONTH FROM order_date), month
ORDER BY EXTRACT(MONTH FROM order_date);

SELECT 
    category,
    sub_category,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY category, sub_category
ORDER BY total_sales DESC;

SELECT 
    product_name,
    ROUND(SUM(sales)::numeric,2) AS total_sales
FROM sample_superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    product_name,
    ROUND(SUM(sales)::numeric,2) AS total_sales
FROM sample_superstore
GROUP BY product_name
ORDER BY total_sales
LIMIT 10;

SELECT 
    product_name,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT 
    product_name,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY product_name
ORDER BY total_profit
LIMIT 10;

SELECT 
    category,
    ROUND(SUM(sales)::numeric,2) AS total_sales,
    ROUND(SUM(profit)::numeric,2) AS total_profit,
    ROUND((SUM(profit)/NULLIF(SUM(sales),0))*100,2) AS profit_margin
FROM sample_superstore
GROUP BY category
ORDER BY profit_margin DESC;

WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS year_month,
        SUM(sales) AS total_sales
    FROM sample_superstore
    GROUP BY year_month
)
SELECT 
    year_month,
    total_sales,
    LAG(total_sales) OVER(ORDER BY year_month) AS prev_month_sales,
    ROUND(
        ((total_sales - LAG(total_sales) OVER(ORDER BY year_month))
        / NULLIF(LAG(total_sales) OVER(ORDER BY year_month),0))*100,2
    ) AS growth_rate
FROM monthly_sales
ORDER BY year_month;

SELECT 
    product_name,
    ROUND(SUM(profit)::numeric,2) AS total_profit
FROM sample_superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;

WITH rank_cte AS (
    SELECT 
        region,
        product_name,
        SUM(sales) AS total_sales,
        RANK() OVER(PARTITION BY region ORDER BY SUM(sales) DESC) AS rnk
    FROM sample_superstore
    GROUP BY region, product_name
)
SELECT *
FROM rank_cte
WHERE rnk = 1;

WITH rank_cte AS (
    SELECT 
        region,
        product_name,
        SUM(profit) AS total_profit,
        RANK() OVER(PARTITION BY region ORDER BY SUM(profit) DESC) AS rnk
    FROM sample_superstore
    GROUP BY region, product_name
)
SELECT *
FROM rank_cte
WHERE rnk = 1;

SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM sample_superstore
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT order_id) = 1
ORDER BY customer_id;

SELECT 
    ROUND(discount::numeric,2) AS discount_level,
    ROUND(AVG(profit)::numeric,2) AS avg_profit
FROM sample_superstore
GROUP BY discount_level
ORDER BY discount_level;

SELECT 
    ship_mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales)::numeric,2) AS total_sales
FROM sample_superstore
GROUP BY ship_mode
ORDER BY total_orders DESC;