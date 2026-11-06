-- Date:      2026-11-06
-- Level:     easy
-- Topics:    aggregation, joins, top-n
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   Which are the 10 products that have generated the most revenue across the full history?
--
-- Business context:
--   The sales director is preparing the annual catalog review and wants to know
--   which products carry the business before deciding what to promote.
--
-- Expected grain:   one row per product
-- Expected columns: product_id, product_name, total_revenue (rounded to 2 decimals), units_sold
--                   ordered by total_revenue descending
-- Tables used:      order_details, products


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	p.product_id,
	p.product_name,
	ROUND(SUM(od.unit_price * od.quantity * (1 - discount))::numeric, 2) AS total_revenue,
	SUM(od.quantity) AS units_sold
FROM order_details od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- On a very first try, the engine asked to add od.quantity to the GROUP BY. I then
-- realized that od.quantity is a per-order-line value, not a per-product one,
-- and I had to aggregate it with SUM(od.quantity).
-- I also had to cast the whole SUM to numeric in order to round it
-- (ROUND(x, 2) does not accept real / double precision in PostgreSQL).


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- Join, revenue formula (with discount), choosing tables, grain.
-- What was wrong or fragile (and why):
-- - `discount` unqualified: works only because no other joined table has that
--   column; it becomes ambiguous as soon as one does. Use od.discount.
-- - ON not indented under its JOIN: harder to read with many joins.
-- - No tie-breaker in ORDER BY: with a LIMIT, ties at the cut-off are arbitrary.
-- Key takeaway:
-- - GROUP BY defines the grain; every other selected column must be aggregated.
-- - Any LIMIT needs a deterministic ORDER BY.
-- - No need to group by p.product_name when grouping by the primary key
--   p.product_id (functional dependency in PostgreSQL).


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue,
    SUM(od.quantity) AS units_sold
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC, p.product_id
LIMIT 10;

-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- Result shows the ten products with the highest revenue.
-- Highest-revenue products are not necessarily the most sold ones.
-- The query shows the all-time total, not a particular time window, which would be interesting.