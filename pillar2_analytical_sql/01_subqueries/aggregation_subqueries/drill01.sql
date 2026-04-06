-- Drill 01 — Grain Check Before Aggregation
-- Business question: How many rows are in orders and order_details, and what does one row represent in each?
-- Expected output: orders_rows, order_details_rows
-- Notes: use scalar subqueries; this drill is intentionally simple
-- Tables used: orders, order_details

-- Return one row with both counts.
-- Use scalar subqueries so each table is counted independently.
-- Then explain, in your own words, which table is at order grain
-- and which table is at line-item grain.

SELECT 
	(SELECT COUNT(*) FROM orders) AS orders_rows, 
	(SELECT COUNT(*) FROM order_details) AS order_details_rows;

-- Explanation:
-- `orders` is at order grain because each row represents one order.
-- `order_details` is at line-item grain because each row represents
-- one product line within an order.
