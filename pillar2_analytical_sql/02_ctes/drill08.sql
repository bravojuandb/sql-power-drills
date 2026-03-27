-- Drill 08 — CTE: Fulfilled orders revenue per shipper
-- Business question: How many fulfilled orders and how much fulfilled revenue has each shipper handled?
-- Expected output: shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue
-- Notes: define fulfilled orders as Orders where ShippedDate IS NOT NULL, then join to Order Details and Shippers using Orders.ShipVia = Shippers.ShipperID
-- Tables used: Orders, Order Details, Shippers


SELECT 
	o.ship_via AS shipper_id,
	sh.company_name AS shipper_name,
	o.order_id
FROM orders o
JOIN shippers sh
    ON o.ship_via = sh.shipper_id
WHERE o.shipped_date IS NOT NULL;