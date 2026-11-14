-- Date:      2026-11-14
-- Level:     easy
-- Topics:    aggregation, joins, count distinct
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How much revenue does each product category generate, and in how many
--   orders does it appear?
--
-- Business context:
--   The marketing director is planning next year's campaign budget and wants
--   to split it across categories according to their weight in sales.
--
-- Expected grain:   one row per category
-- Expected columns: category_id, category_name, orders_count, total_revenue
--                   (rounded to 2 decimals)
--                   ordered by total_revenue descending
-- Tables used:      categories, products, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	c.category_id,
	c.category_name,
	COUNT(DISTINCT od.order_id) AS orders_count,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM categories c
JOIN products p
	ON c.category_id = p.category_id
JOIN order_details od
	ON p.product_id = od.product_id
GROUP BY c.category_id
ORDER BY total_revenue DESC, c.category_id ASC;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================

--1. determine join path: table containing the final grain -> table containing the desired metrics
--2. for a moment hesitate if use distinct, decide yes
--3. without distinct, COUNT would count order lines, not orders (the row grain
--   after the joins is one order line either way)
--4. remember to tie break by category id
--5. clean at first try
-- complete in 15 min


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - Clean on first submission, 15 minutes.
-- - COUNT(DISTINCT od.order_id): one order with several products of the same
--   category has several lines, but counts once.
-- - Tie-breaker on the primary key.
--
-- What was wrong or fragile (and why):
-- - Nothing.
--
-- Key takeaway:
-- - DISTINCT doesn't change the grain; it changes what COUNT counts.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    c.category_id,
    c.category_name,
    COUNT(DISTINCT od.order_id) AS orders_count,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY c.category_id
ORDER BY total_revenue DESC, c.category_id;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- Categories differ in weight: the campaign budget can follow the revenue
-- share of each category, with the top categories getting the largest part.
