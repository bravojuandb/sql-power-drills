-- Drill 12 — Multi-Join Analytical Patterns: Shipper category performance
-- Business question: For shipped orders only, how do shippers perform by product category in terms of revenue and shipping speed?
-- Expected output: shipper_id, shipper_name, category_id, category_name, shipped_orders, avg_days_to_ship, category_revenue
-- Notes: preserve the shipper-category grain, use only shipped orders, and compute average shipping time from order_date to shipped_date
-- Tables used: orders, order_details, products, categories, shippers

WITH shipped_orders AS (
	SELECT 
		o.order_id,
		od.product_id,
		o.ship_via AS shipper_id,
		s.company_name AS shipper_name,
		o.order_date,
		o.shipped_date,
		SUM(od.unit_price * od.quantity * (1 - od.discount)) AS category_revenue
	FROM orders o
	JOIN shippers s
		ON o.ship_via = s.shipper_id
	JOIN order_details od
		ON o.order_id = od.order_id
	WHERE o.shipped_date IS NOT NULL
	GROUP BY 
		o.order_id,
		od.product_id,
		o.ship_via,
		s.company_name,
		o.order_date,
		o.shipped_date
)

SELECT
	sh.shipper_id,
	sh.shipper_name,
	c.category_id,
	c.category_name,
	COUNT(DISTINCT sh.order_id) AS shipped_orders,
	AVG(sh.shipped_date - sh.order_date) AS avg_days_to_ship,
	SUM(sh.category_revenue) AS category_revenue
FROM shipped_orders sh 
JOIN products p
	ON sh.product_id = p.product_id
JOIN categories c
	ON p.category_id = c.category_id
GROUP BY 
	sh.shipper_id,
	sh.shipper_name,
	c.category_id,
	c.category_name;  