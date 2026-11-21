-- Date:      2026-11-21
-- Level:     easy+
-- Topics:    aggregation, joins, count distinct, case, customer segmentation
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How many customers are in each spending segment, how many orders do they
--   place, and what share of total revenue does each segment represent?
--
-- Business context:
--   The sales director wants to split the customer base into segments to decide
--   which customers get a dedicated account manager. Segments are based on the
--   total revenue of each customer (with discount):
--     A - Key account: 10,000 or more
--     B - Regular:     2,500 or more, but less than 10,000
--     C - Small:       less than 2,500
--
-- Expected grain:   one row per segment
-- Expected columns: segment, customers_count, orders_count,
--                   total_revenue (rounded to 2 decimals),
--                   revenue_share_pct (rounded to 2 decimals; share of the
--                   total revenue of the whole company)
--                   ordered by segment ascending
-- Tables used:      customers, orders, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT 
	CASE 
		WHEN 
			total_revenue >= 10000 THEN 'Key account'
		WHEN 
			total_revenue >= 2500 THEN 'Regular'
		ELSE 'Small'
	END AS segment,
	COUNT(c.customer_id) AS customer_count,
	COUNT(DISTINCT o.order_id) AS orders_count,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY segment
ORDER BY segment ASC;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- This question was a big step up from what I already know. I ran out of the
-- 20 minutes before I had a working query.
-- I knew I needed a CASE for the segments. I tried to use the alias
-- total_revenue inside the CASE, but it does not exist at that point.
-- I did not see that I needed the total per customer first.
-- I thought I needed a CTE, but I did not use one in the earlier exercises,
-- so I did not try it. I should trust that instinct when a label depends on
-- a total calculated per customer.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
--   The CASE idea, the revenue formula with discount and the joins.
--
-- What was wrong or fragile (and why):
--   1. I used the alias total_revenue inside the CASE of the same SELECT.
--      SQL does not allow that, so PostgreSQL would give an error.
--   2. The segment depends on the total of each customer, but my query
--      worked on order lines. It never had the total per customer.
--   3. COUNT(c.customer_id) counts rows (order lines), not customers.
--   4. The revenue_share_pct column was missing.
--
-- Key takeaway:
--   If a label depends on a total, I calculate that total first in a CTE
--   (one row per customer). Then I classify and group in a second step.
--   For a share of the total, SUM(SUM(x)) OVER () avoids repeating the query.
--


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

WITH customer_totals AS (
    SELECT
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS orders_count,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS revenue
    FROM orders o
    JOIN order_details od
        ON od.order_id = o.order_id
    GROUP BY o.customer_id
)
SELECT
    CASE
        WHEN revenue >= 10000 THEN 'A - Key account'
        WHEN revenue >= 2500  THEN 'B - Regular'
        ELSE                       'C - Small'
    END AS segment,
    COUNT(*) AS customers_count,
    SUM(orders_count) AS orders_count,
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue,
    ROUND((100 * SUM(revenue) / SUM(SUM(revenue)) OVER ())::numeric, 2) AS revenue_share_pct
FROM customer_totals
GROUP BY segment
ORDER BY segment;



-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- 38 of 89 customers are key accounts. They bring 83.66% of the revenue.
-- Small customers are 17 and bring only 1.81%.
-- The key accounts should get the dedicated account managers.
