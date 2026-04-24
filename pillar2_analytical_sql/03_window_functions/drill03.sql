-- Drill 03 — Window Functions: Latest order per customer
-- Business question: Which is the most recent order for each customer?
-- Expected output: customer_id, order_id, order_date
-- Notes: rank orders from newest to oldest, using order_date DESC and order_id DESC, then filter after ranking
-- Tables used: orders

WITH customer_partition AS (
	SELECT 
		customer_id,
		order_id,
		order_date,
		ROW_NUMBER() OVER(
			PARTITION BY customer_id
			ORDER BY 
				order_date DESC,
				order_id DESC
		) AS row_num
	FROM orders
)
SELECT
	customer_id,
	order_id,
	order_date
FROM customer_partition
WHERE row_num = 1;