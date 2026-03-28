-- Drill 08 — CTE: Fulfilled orders revenue per shipper
-- Business question: How many fulfilled orders and how much fulfilled revenue has each shipper handled?
-- Expected output: shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue
-- Notes: define fulfilled orders as Orders where ShippedDate IS NOT NULL, then join to Order Details and Shippers using Orders.ShipVia = Shippers.ShipperID
-- Tables used: Orders, Order Details, Shippers


-- Version 1:
-- Use DISTINCT because joining to order_details creates multiple rows per order.
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


-- Version 2:
-- Aggregate revenue per order first, so the final join keeps one row per order.
-- Then COUNT(*) safely counts fulfilled orders without DISTINCT.

WITH fulfilled_orders AS (
  SELECT
    o.order_id,
    o.ship_via AS shipper_id,
    sh.company_name AS shipper_name
  FROM orders o
  JOIN shippers sh
    ON o.ship_via = sh.shipper_id
  WHERE o.shipped_date IS NOT NULL
),
order_revenue AS (
  SELECT
    od.order_id,
    SUM((od.unit_price * od.quantity * (1 - od.discount))::numeric) AS revenue
  FROM order_details od
  GROUP BY od.order_id
)
SELECT
  fo.shipper_id,
  fo.shipper_name,
  COUNT(*) AS fulfilled_orders_count,
  ROUND(SUM(orv.revenue), 2) AS fulfilled_revenue
FROM fulfilled_orders fo
JOIN order_revenue orv
  ON fo.order_id = orv.order_id
GROUP BY fo.shipper_id, fo.shipper_name
ORDER BY fulfilled_revenue DESC;
