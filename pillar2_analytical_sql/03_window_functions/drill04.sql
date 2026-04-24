-- Drill 04 — Window Functions: RANK() vs DENSE_RANK()
-- Business question: How do product rankings differ when ties are handled with RANK() versus DENSE_RANK()?
-- Expected output: product_id, total_quantity, sales_rank, dense_sales_rank
-- Notes: aggregate sold quantity per product first, then compare the two ranking functions; keep the window ORDER BY on total_quantity only if you want ties to remain tied
-- Tables used: order_details

WITH product_sales AS (
	SELECT
		product_id,
		SUM(quantity) AS items_sold
	FROM order_details
	GROUP BY product_id
)
SELECT 
	product_id,
	items_sold,
	RANK() OVER(
			ORDER BY items_sold DESC
	) AS ranking,
	DENSE_RANK() OVER(
			ORDER BY items_sold DESC
	) AS dense_ranking
FROM product_sales
ORDER BY items_sold DESC;