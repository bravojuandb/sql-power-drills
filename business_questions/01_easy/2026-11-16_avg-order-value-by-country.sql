-- Date:      2026-11-16
-- Level:     easy
-- Topics:    aggregation, joins, count distinct, average order value
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   In which countries do customers place the biggest orders on average?
--
-- Business context:
--   The head of international sales wants to know where each order is worth
--   the most, to decide in which markets to offer premium service.
--
-- Expected grain:   one row per customer country
-- Expected columns: country, orders_count, total_revenue,
--                   avg_order_value (both rounded to 2 decimals)
--                   avg_order_value = average value of ONE order in that country
--                   ordered by avg_order_value descending
-- Tables used:      customers, orders, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================


SELECT
	c.country,
	COUNT(DISTINCT o.order_id) AS order_count,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue,
	ROUND (SUM(od.unit_price * od.quantity * (1 - od.discount)) / (COUNT(DISTINCT o.order_id))::numeric, 2) AS avg_order_value 
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY c.country
ORDER BY order_value DESC;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
--1. Choose the base table: the one that has the field I need for the grain (customers.country).
--2. Decide the join path: customers -> orders -> order_details.
--3. Think about the grain of the join itself. The most detailed level is one row per order line.
--4. Notice that order_details has a composite PK (order_id + product_id).
--5. Time spent on my first (incorrect) version: 20 minutes.



-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
--   The join path and the revenue formula were right, with the discount included.
--   I saw that the join gives one row per order line, so I used COUNT(DISTINCT order_id).
--
-- What was wrong or fragile (and why):
--   My first version put COUNT(DISTINCT ...) inside a SUM. PostgreSQL does not allow
--   nested aggregates. I thought it was a parentheses problem, but it was not.
--   I also ordered by the wrong thing: first order_count, then an alias that does not exist.
--   The column name did not match the header (orders_count).
--
-- Key takeaway:
--   Average order value = total revenue / number of distinct orders.
--   Divide one aggregate by the other. Never wrap an aggregate inside another one.
--


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
	c.country,
	COUNT(DISTINCT o.order_id) AS orders_count,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue,
	ROUND(
		(SUM(od.unit_price * od.quantity * (1 - od.discount))
		 / COUNT(DISTINCT o.order_id))::numeric,
		2) AS avg_order_value
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY c.country
ORDER BY avg_order_value DESC;



-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- The USA (about 2,013 per order) and Germany (about 1,888) have the biggest orders.
-- They also have 122 orders each, so they are the strongest candidates for premium service.
-- Denmark, Belgium and Switzerland have high averages too (about 1,760 to 1,815),
-- but with only 18 or 19 orders each, so I would trust those numbers less.
