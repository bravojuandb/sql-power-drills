-- Drill 02 — Multi-Join Warmup: Order lines
-- Business question: For each order line, when was the order placed?
-- Expected output: order_id, order_date, product_id, quantity, unit_price
-- Notes: start from order_details grain and join the parent order information
-- Tables used: orders, order_details


SELECT 
	o.order_id,
	o.order_date,
	od.product_id,
	od.quantity,
	od.unit_price
FROM orders o
JOIN order_details od
	ON o.order_id = od.order_id;

