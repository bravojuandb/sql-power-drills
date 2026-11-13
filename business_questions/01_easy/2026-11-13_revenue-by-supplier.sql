-- Date:      2026-11-13
-- Level:     easy
-- Topics:    aggregation, joins, count distinct
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   Which suppliers generate the most sales revenue for us, and with how many
--   different products?
--
-- Business context:
--   The purchasing manager is reviewing supplier relationships and wants to know
--   which suppliers the business depends on most.
--
-- Expected grain:   one row per supplier
-- Expected columns: supplier_id, company_name, country, products_sold,
--                   total_revenue (rounded to 2 decimals)
--                   ordered by total_revenue descending
-- Tables used:      suppliers, products, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	s.supplier_id,
	s.company_name,
	s.country,
	COUNT(DISTINCT p.product_id) AS different_products_sold,
	ROUND (SUM(od.unit_price * od.quantity * (1- od.discount))::numeric, 2) AS total_revenue
FROM suppliers s
JOIN products p
	ON s.supplier_id = p.supplier_id
JOIN order_details od
	ON p.product_id = od.product_id
GROUP BY s.supplier_id
ORDER BY total_revenue DESC, s.company_name ASC;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================

--1. recognize familiar joining path
--2. start from FROM
--3. recognize grain after triple join: one row per order line (order_details);
--   GROUP BY then brings it to one row per supplier.
--4. understand distinct use: the same product appears in many order lines,
--   so counting products needs DISTINCT
--5. rename column to different_products_sold to remove ambiguity
--6. verify the query, run, correct typos.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - Correct on first submission: join path, revenue formula, grain.
-- - COUNT(DISTINCT p.product_id) applied without hints.
--
-- What was wrong or fragile (and why):
-- - Tie-breaker on company_name: not guaranteed unique; supplier_id is.
-- - Column renamed to different_products_sold: clearer, but differs from the spec.
--
-- Key takeaway:
-- - Joins set the row grain (most detailed table); GROUP BY sets the output grain.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    s.supplier_id,
    s.company_name,
    s.country,
    COUNT(DISTINCT p.product_id) AS products_sold,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM suppliers s
JOIN products p
    ON s.supplier_id = p.supplier_id
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY s.supplier_id
ORDER BY total_revenue DESC, s.supplier_id;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- Revenue is concentrated in a few suppliers: these are the relationships the
-- business depends on most, and the first to secure in purchasing negotiations.
