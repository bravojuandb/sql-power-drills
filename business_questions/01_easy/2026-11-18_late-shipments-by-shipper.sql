-- Date:      2026-11-18
-- Level:     easy
-- Topics:    aggregation, joins, filters, dates
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   For each shipping company, how many of our orders left the warehouse
--   after their required date, and by how many days on average?
--
-- Business context:
--   The operations lead wants to know whether late dispatches are concentrated
--   in orders assigned to a particular carrier (for example, slow pickups or
--   bookings). A late order is one shipped after its required date. Orders not
--   shipped yet are not counted.
--   Note: Northwind has no delivery date, so this measures late dispatch (our
--   side), not late delivery (the carrier's side).
--
-- Expected grain:   one row per shipper (only shippers with late orders)
-- Expected columns: shipper_id, company_name, late_orders,
--                   avg_days_late (rounded to 2 decimals)
--                   ordered by late_orders descending, then shipper_id
-- Tables used:      shippers, orders


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	sh.shipper_id,
	sh.company_name,
	COUNT(o.order_id) AS late_orders,
	ROUND( AVG(o.shipped_date - o.required_date)::numeric, 2) AS avg_days_late
FROM shippers sh
JOIN orders o
	ON sh.shipper_id = o.ship_via
WHERE o.shipped_date > o.required_date
GROUP BY sh.shipper_id
ORDER BY late_orders DESC;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- First I explored the orders table alone. I counted the orders where
-- shipped_date was later than required_date.
-- Then I added the shippers table to group the result by shipper.
-- While doing this I saw a problem with the question. A late shipped_date is
-- the company's fault, not the carrier's. To judge the carrier I would need a
-- delivery date, and Northwind does not have one.
-- The header was rewritten to talk about late dispatch.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
--   The condition shipped_date > required_date. Orders not shipped yet have
--   a NULL shipped_date, so they are left out without an extra filter.
--   COUNT(o.order_id) was right without DISTINCT, because there is no join
--   with order_details: one row is one order.
--   AVG was right too, because each row is one order. This is the opposite of
--   the 2026-11-15 session.
--   The column names matched the header.
--
-- What was wrong or fragile (and why):
--   I forgot the tie-breaker. The header asks for late_orders DESC and then
--   shipper_id. If two shippers have the same late_orders, their order is not
--   guaranteed.
--
-- Key takeaway:
--   Before writing SQL, ask if the metric blames the right party. With only a
--   shipped_date, I can measure late dispatch, not late delivery.
--   And always add a tie-breaker on the primary key.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    sh.shipper_id,
    sh.company_name,
    COUNT(o.order_id) AS late_orders,
    ROUND(AVG(o.shipped_date - o.required_date)::numeric, 2) AS avg_days_late
FROM shippers sh
JOIN orders o
    ON o.ship_via = sh.shipper_id
WHERE o.shipped_date > o.required_date
GROUP BY sh.shipper_id, sh.company_name
ORDER BY late_orders DESC, sh.shipper_id;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- The result shows, for each shipper, how many orders left the warehouse
-- after the required date and by how many days on average. If one shipper has
-- clearly more late orders or a higher average, the operations lead can check
-- why those orders are dispatched late. It does not prove the carrier is slow,
-- because I have no delivery date.

