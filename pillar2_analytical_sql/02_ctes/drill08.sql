-- Drill 08 — CTE: Fulfilled orders revenue per shipper
-- Business question: How many fulfilled orders and how much fulfilled revenue has each shipper handled?
-- Expected output: shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue
-- Notes: define fulfilled orders as Orders where ShippedDate IS NOT NULL, then join to Order Details and Shippers using Orders.ShipVia = Shippers.ShipperID
-- Tables used: Orders, Order Details, Shippers


-- Version 1: 
-- Use DISTINCT because the join to order_details creates multiple rows per order
-- orders has one row per order.
-- order_details has one row per item within an order.

WITH fulfilled_orders AS (
	SELECT 
		o.ship_via AS shipper_id,
		sh.company_name AS shipper_name,
		o.order_id
	FROM orders o
	JOIN shippers sh
		ON o.ship_via = sh.shipper_id
	WHERE o.shipped_date IS NOT NULL
)
SELECT 
	fo.shipper_id,
	fo.shipper_name,
	COUNT(DISTINCT fo.order_id) AS fulfilled_orders_count,
	ROUND(SUM((od.unit_price * od.quantity * ( 1 - od.discount))::numeric), 2) AS fulfilled_revenue
FROM fulfilled_orders fo
JOIN order_details od
	ON fo.order_id = od.order_id
GROUP BY fo.shipper_id, fo.shipper_name
ORDER BY fulfilled_revenue DESC;
