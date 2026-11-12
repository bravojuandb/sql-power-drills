-- Date:      2026-11-12
-- Level:     easy
-- Topics:    aggregation, joins, count distinct, top-n
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   Who are our 10 most valuable customers by revenue, and how many orders
--   have they placed?
--
-- Business context:
--   The head of customer success wants to launch a key-account program and
--   needs the shortlist of customers that bring in the most money.
--
-- Expected grain:   one row per customer
-- Expected columns: customer_id, company_name, country, orders_placed,
--                   total_revenue (rounded to 2 decimals)
--                   ordered by total_revenue descending
-- Tables used:      customers, orders, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	c.customer_id,
	c.company_name,
	c.country,
	COUNT(o.order_id) AS orders_placed,
	ROUND (SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY c.customer_id
ORDER BY total_revenue DESC, c.company_name
LIMIT 10;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================

--1. explore col names
--2. determine table joining path
--3. write the from and join statements (choose left joins on purpose)
--4. select column names
--5. run query, notice customers with orders placed 0
--6. inner join orders from customers, fix customers with 0 orders
--7. should I use distinct? 
-- 16 minutes, 2 attempts

-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - Join path, revenue formula, tie-breaker in ORDER BY.
-- - Spotted customers with no orders at the top: NULL revenue sorts FIRST
--   with DESC in PostgreSQL. INNER JOIN on orders fixed it (NULLS LAST also would).
--
-- What was wrong or fragile (and why):
-- - COUNT(o.order_id) counted order lines, not orders: after joining
--   order_details the grain is one row per order line. Fix: COUNT(DISTINCT o.order_id).
-- - LEFT JOIN on order_details was unnecessary: every order has lines.
--
-- Key takeaway:
-- - The most detailed table in the join sets the grain. Before counting,
--   ask: what is one row after the joins?


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    c.customer_id,
    c.company_name,
    c.country,
    COUNT(DISTINCT o.order_id) AS orders_placed,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id
ORDER BY total_revenue DESC, c.customer_id
LIMIT 10;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- These 10 customers are the shortlist for the key-account program.
-- More orders does not always mean more revenue: order size matters too.
