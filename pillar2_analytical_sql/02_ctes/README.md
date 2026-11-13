# Common Table Expressions (CTEs)

This subchapter focuses on **CTEs as a way to structure reasoning**.  
You will use them to stage aggregations, break problems into readable steps, and reuse intermediate results.  
All drills are written against the **Northwind base tables** (not views) used in Pillar 2.

---

## Tables Used

These drills are written against the core Northwind base tables:

- `customers` — customer identity and company information  
- `orders` — one row per order (customer → orders)  
- `order_details` — line items per order (orders → products)  
- `products` — product catalog, pricing, and category linkage  
- `categories` — product classification  
- `shippers` — shipping companies associated with orders  

Primary join paths used throughout:

- `customers → orders`
- `orders → order_details`
- `order_details → products`
- `products → categories`
- `orders → shippers`

## CTE Drills

### 1. Single CTE as a Named Subquery
Create a CTE that aggregates the `orders` table to one row per customer, counting how many orders each customer has placed. Then join that CTE to `customers` and return only customers who have at least one order.  
customer_id, company_name, orders_count

### 2. Aggregation in a CTE
Create a CTE that rolls up `order_details` to one row per order. In that CTE, compute order revenue as `SUM(unit_price * quantity * (1 - discount))`. Then join to `orders` so each result row includes both the order and its customer.  
order_id, customer_id, order_total

### 3. Filtering on CTE Results
Start from a CTE that computes one `order_total` per order. Then create a second CTE that computes the average of those order totals across all orders. Return only the orders whose `order_total` is greater than that overall average.  
order_id, customer_id, order_total

### 4. Multiple CTEs in One Query
Use one CTE to count orders per customer and a separate CTE to compute total revenue per customer from `order_details`. Join those two prepared result sets to `customers` so the final output shows both activity and revenue for each customer with orders.  
customer_id, company_name, orders_count, customer_revenue

### 5. Chained CTEs (Layered Transformations)
Build a three-step CTE pipeline. First compute line-level revenue from `order_details`. Then aggregate those line totals into order totals. Finally aggregate order totals into customer totals and join to `customers` for company names.  
customer_id, company_name, customer_revenue

### 6. CTE for Top-N Logic
Reuse the customer revenue logic in a CTE and rank or sort customers by total revenue. Return only the top 10 customers with the highest revenue.  
customer_id, company_name, customer_revenue

### 7. CTE for Latest-Row Logic
Create a CTE that reduces `orders` to one row per customer using `MAX(order_date)`. Join that result to `customers` so each customer appears once with the date of their most recent order.  
customer_id, company_name, most_recent_order_date

### 8. Reusable CTE for Business Logic
Create a CTE that defines fulfilled orders as rows in `orders` where `shipped_date IS NOT NULL`. Use that CTE as the business definition of a fulfilled order, then join to `order_details` and `shippers` to compute both the number of fulfilled orders and the fulfilled revenue handled by each shipper. Join `orders.ship_via` to `shippers.shipper_id`.  
shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue

### 9. CTE vs Subquery Comparison
First compute total revenue per customer for customers who have at least one order. Then compute the average of those customer totals. Return only the customers whose total revenue is above that average, and include the average customer revenue as a repeated comparison column in the final result.  
customer_id, company_name, customer_revenue, avg_customer_revenue

### 10. CTE with Multiple Joins
Create a CTE that joins `orders`, `order_details`, `products`, and `categories` into an enriched order-line dataset. Each row in that CTE should include the product category and a line-level revenue calculation. Then aggregate that enriched dataset to category level.  
category_id, category_name, category_revenue

### 11. Analytical Question Using Layered CTEs
Build a layered solution for shipped orders only. Start by filtering to orders where `shipped_date IS NOT NULL`, then compute order totals, then aggregate those orders by the month of `order_date`. Format the month as `YYYY-MM` if your SQL dialect supports it; otherwise return an equivalent month key.  
year_month, revenue, orders_count

### 12. Readability & Naming Discipline
Choose one earlier drill and rewrite it using clear pipeline-style CTE names such as `line_totals`, `order_totals`, `customer_totals`, or `fulfilled_orders`. Preserve the exact same result set as the original solution while improving naming and readability.  
same result set as the original query
