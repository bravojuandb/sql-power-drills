# Common Table Expressions (CTEs)

This subchapter focuses on **subqueries as a reasoning tool**.  
All drills are written against the **Northwind base tables** (not views).

---

## Tables Used

These drills are written against the core Northwind base tables:

- **Customers** — customer identity and company information  
- **Orders** — one row per order (customer → orders)  
- **Order Details** — line items per order (orders → products)  
- **Products** — product catalog, pricing, and category linkage  
- **Categories** — product classification  
- **Shippers** — shipping companies associated with orders  

Primary join paths used throughout:

- `Customers → Orders`
- `Orders → Order Details`
- `Order Details → Products`
- `Products → Categories`
- `Orders → Shippers`

## CTEs drills

### 1. Single CTE as a Named Subquery
List customers who have placed at least 1 order.  
customer_id, company_name, orders_count

### 2. Aggregation in a CTE
Compute total revenue per order (UnitPrice × Quantity × (1 − Discount)).  
order_id, customer_id, order_total

### 3. Filtering on CTE Results
Find high-value orders: orders whose total is above the average order total.  
order_id, customer_id, order_total

### 4.  Multiple CTEs in One Query
For each customer, show total orders and total revenue using separate preparation steps.  
customer_id, company_name, orders_count, customer_revenue

### 5. Chained CTEs (Layered Transformations)
Build a pipeline: line totals → order totals → customer totals.  
customer_id, company_name, customer_revenue

### 6.  CTE for Top-N Logic
Top 10 customers by total revenue.  
customer_id, company_name, customer_revenue

### 7. CTE for De-duplication
Return one row per customer with their most recent order date.  
customer_id, company_name, most_recent_order_date

### 8. Reusable CTE for Business Logic
Define fulfilled orders as ShippedDate IS NOT NULL, then compute revenue per shipper.  
shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue

### 9. CTE vs Subquery Comparison
Customers whose total revenue is above the average customer revenue (subquery → CTE refactor).  
customer_id, company_name, customer_revenue, avg_customer_revenue

### 10. CTE with Multiple Joins
Create an enriched order-line dataset and aggregate revenue by product category.  
category_id, category_name, category_revenue

### 11. Analytical Question Using Layered CTEs
Monthly revenue trend for shipped orders only (YYYY-MM).  
year_month, revenue, orders_count

### 12. Readability & Naming Discipline
Rewrite a previous drill using pipeline-style CTE names while preserving identical results.  
same result set as the original query