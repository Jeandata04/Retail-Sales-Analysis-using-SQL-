CREATE DATABASE Analysis;

CREATE TABLE orders (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    state VARCHAR(50),
    product_name VARCHAR(100),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sales DECIMAL(10,2)
);

-- Calculating the shipping time taken after ordering
SELECT 
    order_id,
    DATEDIFF(ship_date, order_date) AS shipping_days
FROM orders;

-- Calculating the total revenue
SELECT SUM(sales) AS total_revenue
FROM orders;

-- Calculating the monthly sales in each month 
SELECT 
    date_format(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Top 5 customers
SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Most profitable category
SELECT 
    category,
    SUM(sales) AS total_sales
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

-- State experiencing the longest shipping delays 
SELECT 
    state, 
    AVG( DATEDIFF(ship_date, order_date)) AS avg_shipping_days
FROM orders
WHERE ship_date IS NOT NULL
GROUP BY state
ORDER BY avg_shipping_days DESC;

-- Average shipping days
SELECT 
    AVG( DATEDIFF(ship_date, order_date)) AS avg_shipping_days
FROM orders





