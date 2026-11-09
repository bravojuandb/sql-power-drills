-- Date:      2026-11-09
-- Level:     easy
-- Topics:    aggregation, joins, count distinct
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   In which countries do we have the most customers, and how many orders do they place?
--
-- Business context:
--   The head of international sales is deciding where to focus next year's
--   account managers and wants a first view of the customer base by country.
--
-- Expected grain:   one row per customer country
-- Expected columns: country, customers, orders_placed
--                   ordered by orders_placed descending
-- Tables used:      customers, orders


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	c.country,
	COUNT(c.customer_id) AS customers,
	COUNT(o.order_id) AS orders_placed
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY customers DESC;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- First step: counted customers per country on the customers table alone,
-- before joining, to get the reference numbers:
--
--   SELECT country, COUNT(customer_id) AS customer_count
--   FROM customers
--   GROUP BY country
--   ORDER BY customer_count DESC;
--
-- Spent ~15 minutes stuck. I noticed that customers and orders_placed returned
-- the same numbers, but couldn't find why.
-- Lesson: compare the joined result against the pre-join count. If a number
-- that shouldn't change grows after a join, the join is multiplying rows.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - Correct tables, join key and grain (GROUP BY c.country).
-- - Spotted the symptom myself: both counts were identical, which can't be right.
--
-- What was wrong or fragile (and why):
-- - COUNT(c.customer_id) counted orders, not customers. After joining
--   customers to orders, each row is one order: a customer with 10 orders
--   appears in 10 rows, so counting customer_id counts rows.
--   Fix: COUNT(DISTINCT c.customer_id).
-- - INNER JOIN dropped customers with no orders, so they were not counted
--   as customers of their country. Fix: LEFT JOIN + COUNT(o.order_id)
--   (ignores the NULLs of customers without orders).
-- - Ordered by customers instead of orders_placed, and no tie-breaker.
--
-- Key takeaway:
-- - A one-to-many join multiplies the rows of the "one" side (customers).
--   To count entities from that side after the join, use COUNT(DISTINCT ...).
-- - Symptom to recognise: two counts that should differ come out identical.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    c.country,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(o.order_id) AS orders_placed
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY orders_placed DESC, c.country;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- The customer base and order volume are concentrated in a few countries,
-- which are the natural first candidates for dedicated account managers.
-- Orders per customer differ by country: a country with fewer but more active
-- customers can matter as much as one with many customers.
