-- Date:      2026-11-20
-- Level:     easy
-- Topics:    aggregation, joins, count distinct, dates
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How much revenue did we make each year, with how many orders, and what
--   period of activity does each year cover?
--
-- Business context:
--   The finance analyst is preparing the annual summary and needs to know
--   how sales evolved year by year, and how much of each year the data covers.
--
-- Expected grain:   one row per order year
-- Expected columns: order_year, orders_count, total_revenue (rounded to 2
--                   decimals), first_order_date, last_order_date
--                   ordered by order_year ascending
-- Tables used:      orders, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	EXTRACT (YEAR FROM order_date) AS order_year,
	COUNT(DISTINCT o.order_id) AS orders_count,
	ROUND (SUM( od.quantity * od.unit_price * (1 - od.discount))::numeric, 2) AS total_revenue,
	MIN(o.order_date) AS first_order_date,
	MAX(o.order_date) AS last_order_date
FROM orders o
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY order_year;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- First I looked for a way to get the year out of a date. I asked the AI a
-- general question about it.
-- Then I thought about the period each year covers, and used MIN and MAX
-- on the order date.
-- I solved it in one try.
-- Time: 13 minutes.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
--   Clean result logic on the first try, in 13 minutes. I used
--   COUNT(DISTINCT o.order_id) because the join gives one row per order line.
--   The revenue formula included the discount, and I cast to numeric before
--   ROUND. MIN and MAX gave the period covered by each year.
--
-- What was wrong or fragile (and why):
--   1. I forgot the ORDER BY. The header asks for order_year ascending.
--      Without it, PostgreSQL can return the years in any order.
--   2. order_date had no table prefix inside EXTRACT. It works because only
--      orders has that column, but o.order_date is safer and more consistent.
--
-- Key takeaway:
--   Before I paste the query, I read the header line by line: columns, filters,
--   order. Grouping by the alias (order_year) is allowed in PostgreSQL.
--   Also, a total means little without the period it covers. Years with
--   different intervals cannot be compared. That is why I added MIN and MAX
--   of the order date: they show that 1996 and 1998 are partial years.
--   Before comparing periods, I check the dates first.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
	EXTRACT(YEAR FROM o.order_date) AS order_year,
	COUNT(DISTINCT o.order_id) AS orders_count,
	ROUND(SUM(od.quantity * od.unit_price * (1 - od.discount))::numeric, 2) AS total_revenue,
	MIN(o.order_date) AS first_order_date,
	MAX(o.order_date) AS last_order_date
FROM orders o
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY order_year
ORDER BY order_year ASC;



-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- The years are not comparable as they are. 1996 only covers July to December
-- and 1998 only covers January to May 6, so only 1997 is a full year.
-- Per day, sales grew every year: about 1,150 in 1996, 1,690 in 1997 and
-- 3,500 in 1998, so 1998 is not a drop, it is the strongest period so far.
