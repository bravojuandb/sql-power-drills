
/* 
Problem 1 — Customers who bought ‘Power Tools’

Task:
Retrieve the names and emails of customers who have purchased products 
from the 'Power Tools' category.

Tables Involved:
	•	sales_data.sales_fact
	•	sales_data.products_dim
	•	sales_data.customers_dim

Requirements:
	•	Only include customers who actually made such a purchase.
	•	Avoid duplicates — one row per customer.
*/


SELECT DISTINCT c.name, c.email

FROM sales_data.sales_fact f

JOIN sales_data.customers_dim c ON f.customer_id = c.customer_id

JOIN sales_data.products_dim p ON f.product_id = p.product_id

WHERE p.category = 'Power Tools';