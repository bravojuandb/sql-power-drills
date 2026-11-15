-- Date:      2026-11-15
-- Level:     easy
-- Topics:    aggregation, joins, count distinct, average order value
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How much revenue has each employee generated, and what is their average
--   order value?
--
-- Business context:
--   The sales manager already knows how many orders each employee handles
--   (session 2026-11-08). Now they want to know whether employees with fewer
--   orders compensate with bigger ones.
--
-- Expected grain:   one row per employee
-- Expected columns: employee_id, employee_name, orders_handled,
--                   total_revenue, avg_order_value (both rounded to 2 decimals)
--                   avg_order_value = average value of ONE order of that employee
--                   ordered by total_revenue descending
-- Tables used:      employees, orders, order_details


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	e.employee_id,
	CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
	COUNT(DISTINCT o.order_id) AS orders_handled,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue,
	ROUND(AVG(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS avg_order_value
FROM employees e
JOIN orders o
	ON e.employee_id = o.employee_id
JOIN order_details od
	ON o.order_id = od.order_id
GROUP BY e.employee_id
ORDER BY total_revenue DESC, e.employee_id;


-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- At first I didn't know if avg_order_value was per employee or for all orders.
-- I spent most of the 20 minutes figuring out the average, and I still wasn't sure.
-- In my second try I put the cast in the wrong place, so ROUND didn't work.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- Everything except the average: joins, revenue, counting distinct orders,
-- the employee name and the tie-breaker.
--
-- What was wrong or fragile (and why):
-- I used AVG, but after the joins each row is a line of an order, not a whole
-- order. So AVG gave me the average value of a line. If an order of 1,000 has
-- 4 lines of 250, AVG says 250, but the order is worth 1,000.
-- The fix is to divide total revenue by the number of distinct orders.
--
-- Also, :: is applied before /, so my cast only touched the COUNT.
-- The whole division needs parentheses before casting.
--
-- Key takeaway:
-- AVG only gives the right answer when each row is one of the things I want
-- to average. If not, I have to build the average myself: total / count.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    COUNT(DISTINCT o.order_id) AS orders_handled,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue,
    ROUND(
        (SUM(od.unit_price * od.quantity * (1 - od.discount))
         / COUNT(DISTINCT o.order_id))::numeric,
        2) AS avg_order_value
FROM employees e
JOIN orders o
    ON e.employee_id = o.employee_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY e.employee_id
ORDER BY total_revenue DESC, e.employee_id;


-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- Looking at average order value next to the number of orders tells us if
-- the employees with fewer orders make up for it with bigger ones.
-- The employee with the highest average is not the one with the highest total:
-- they handle fewer orders, but bigger ones. This could mean they manage large
-- accounts, that their role brings fewer but more strategic deals, or that a
-- couple of very big orders push their average up.
-- So the number of orders alone doesn't measure performance.