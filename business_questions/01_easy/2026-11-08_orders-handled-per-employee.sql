-- Date:      2026-11-08
-- Level:     easy
-- Topics:    aggregation, joins, string concatenation
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   How many orders has each employee handled across the full history?
--
-- Business context:
--   The sales manager is preparing the yearly performance reviews and wants a
--   first view of workload: who is handling the most orders and who the least.
--
-- Expected grain:   one row per employee
-- Expected columns: employee_id, employee_name (first and last name in one column), title, orders_handled
--                   ordered by orders_handled descending
-- Tables used:      employees, orders


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT
	e.employee_id,
	e.first_name || ' ' || e.last_name AS employee_name,
	e.title,
	COUNT(o.order_id) AS orders_handled
FROM employees e
LEFT JOIN orders o
	ON e.employee_id = o.employee_id
GROUP BY e.employee_id
ORDER BY orders_handled DESC;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- Had to google how to concatenate two columns into one (||).
-- I was not aware of tie-breaking with ORDER BY.

-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
-- - The join: I wanted all the employees, so I made employees the left table
--   of a LEFT JOIN (an employee with no orders would show 0, not disappear).
-- - COUNT(o.order_id) instead of COUNT(*): with a LEFT JOIN, COUNT(*) would
--   count 1 for an employee with no orders (the NULL row); COUNT(col) ignores NULLs.
-- - GROUP BY e.employee_id only (primary key, functional dependency).
--
-- What was wrong or fragile (and why):
-- - first_name || ' ' || last_name returns NULL if either part is NULL.
--   CONCAT_WS(' ', ...) skips NULLs.
-- - No tie-breaker: employees with the same order count could come back in a
--   different order on each run.
--
-- Key takeaway:
-- - CONCAT_WS is the NULL-safe way to combine column values into one string.
-- - Always add a unique column as the last ORDER BY key.

-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    e.title,
    COUNT(o.order_id) AS orders_handled
FROM employees e
LEFT JOIN orders o
    ON e.employee_id = o.employee_id
GROUP BY e.employee_id
ORDER BY orders_handled DESC, e.employee_id;

-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- This query shows the total count of orders per employee over the full history.
-- It shows which employees carry the most order workload and which the least.
-- Order count measures volume, not performance: role (title), hire date and
-- order value should be checked before drawing conclusions about individuals.

