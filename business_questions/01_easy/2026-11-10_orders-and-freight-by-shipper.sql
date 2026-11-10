-- Date:      2026-11-10
-- Level:     easy
-- Topics:    aggregation, joins, avg
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How many orders does each shipping company handle for us, and how much
--   freight do we pay them in total and on average per order?
--
-- Business context:
--   The operations lead is renegotiating contracts with the shipping companies
--   and wants to know how much business each one gets from us.
--
-- Expected grain:   one row per shipper
-- Expected columns: shipper_id, company_name, orders_handled,
--                   total_freight, avg_freight (both rounded to 2 decimals)
--                   ordered by orders_handled descending
-- Tables used:      shippers, orders


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
    sh.shipper_id,
    sh.company_name,
    COUNT(o.order_id) AS orders_handled,
    ROUND(SUM(o.freight)::numeric, 2) AS total_freight
FROM shippers sh
LEFT JOIN orders o
    ON sh.shipper_id = o.ship_via
GROUP BY sh.shipper_id, sh.company_name
ORDER BY orders_handled DESC;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================

--1. explore orders table
--2. group order_count per shipper, using orders
--3. add freight sum as total_freight
--4. left join tables, with shippers as left table
--5. wonder how to produce the avg col
--6. wonder how to coalesce total freight for inactive shippers
-- Time: ~16 minutes.

-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - Join on o.ship_via = sh.shipper_id (the FK has a different name).
-- - LEFT JOIN with shippers as left table, so shippers with no orders stay.
-- - COUNT(o.order_id) returns 0 for those shippers; ::numeric cast before ROUND.
--
-- What was wrong or fragile (and why):
-- - avg_freight missing: AVG(o.freight) = sum of freight / number of orders
--   (AVG ignores NULLs: it equals SUM(x) / COUNT(x), not SUM(x) / COUNT(*)).
-- - total_freight is NULL for shippers with no orders: SUM over zero rows
--   returns NULL. COALESCE(..., 0) makes it 0.
-- - No tie-breaker in ORDER BY.
--
-- Key takeaway:
-- - A shipper with no orders has nothing to aggregate:
--     COUNT -> 0    SUM -> NULL    AVG -> NULL
-- - Replace NULL with 0 only when 0 is the true answer:
--     total_freight: COALESCE(..., 0) -> "we paid 0" is true.
--     avg_freight:   leave NULL       -> "average 0" would be false (no orders).


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    sh.shipper_id,
    sh.company_name,
    COUNT(o.order_id) AS orders_handled,
    COALESCE(ROUND(SUM(o.freight)::numeric, 2), 0) AS total_freight,
    ROUND(AVG(o.freight)::numeric, 2) AS avg_freight
FROM shippers sh
LEFT JOIN orders o
    ON sh.shipper_id = o.ship_via
GROUP BY sh.shipper_id
ORDER BY orders_handled DESC, sh.shipper_id;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- Freight spend per shipper is our negotiating leverage: the shipper with the
-- most orders and freight is where a better rate saves the most money.
