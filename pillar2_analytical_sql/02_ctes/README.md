# Common Table Expressions (CTEs)

This subchapter focuses on **CTEs as a way to structure reasoning**.  
You will use them to stage aggregations, break problems into readable steps, and reuse intermediate results.  
All drills are written against the **Northwind base tables** (not views) used in Pillar 2.

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

## Verified Schema Notes

The prompts below match the PostgreSQL Northwind schema used in this pillar.

Verified table names used in this chapter:

- `Customers`
- `Orders`
- `"Order Details"`
- `Products`
- `Categories`
- `Shippers`

Verified source columns used in these drills:

- `Customers.CustomerID`, `Customers.CompanyName`
- `Orders.OrderID`, `Orders.CustomerID`, `Orders.OrderDate`, `Orders.ShippedDate`, `Orders.ShipVia`
- `"Order Details".OrderID`, `"Order Details".ProductID`, `"Order Details".UnitPrice`, `"Order Details".Quantity`, `"Order Details".Discount`
- `Products.ProductID`, `Products.CategoryID`, `Products.ProductName`
- `Categories.CategoryID`, `Categories.CategoryName`
- `Shippers.ShipperID`, `Shippers.CompanyName`

Notes:

- The output column names shown in the drills are **expected aliases**, not necessarily the original source column names.
- These drills should be kept consistent with the PostgreSQL schema conventions used across Pillar 2.

## CTE Drills

### 1. Single CTE as a Named Subquery
Create a CTE that aggregates the `Orders` table to one row per customer, counting how many orders each customer has placed. Then join that CTE to `Customers` and return only customers who have at least one order.  
customer_id, company_name, orders_count

### 2. Aggregation in a CTE
Create a CTE that rolls up `"Order Details"` to one row per order. In that CTE, compute order revenue as `SUM(UnitPrice * Quantity * (1 - Discount))`. Then join to `Orders` so each result row includes both the order and its customer.  
order_id, customer_id, order_total

### 3. Filtering on CTE Results
Start from a CTE that computes one `order_total` per order. Then create a second CTE that computes the average of those order totals across all orders. Return only the orders whose `order_total` is greater than that overall average.  
order_id, customer_id, order_total

### 4. Multiple CTEs in One Query
Use one CTE to count orders per customer and a separate CTE to compute total revenue per customer from `"Order Details"`. Join those two prepared result sets to `Customers` so the final output shows both activity and revenue for each customer with orders.  
customer_id, company_name, orders_count, customer_revenue

### 5. Chained CTEs (Layered Transformations)
Build a three-step CTE pipeline. First compute line-level revenue from `"Order Details"`. Then aggregate those line totals into order totals. Finally aggregate order totals into customer totals and join to `Customers` for company names.  
customer_id, company_name, customer_revenue

### 6. CTE for Top-N Logic
Reuse the customer revenue logic in a CTE and rank or sort customers by total revenue. Return only the top 10 customers with the highest revenue.  
customer_id, company_name, customer_revenue

### 7. CTE for Latest-Row Logic
Create a CTE that reduces `Orders` to one row per customer using `MAX(OrderDate)`. Join that result to `Customers` so each customer appears once with the date of their most recent order.  
customer_id, company_name, most_recent_order_date

### 8. Reusable CTE for Business Logic
Create a CTE that defines fulfilled orders as rows in `Orders` where `ShippedDate IS NOT NULL`. Use that CTE as the business definition of a fulfilled order, then join to `"Order Details"` and `Shippers` to compute both the number of fulfilled orders and the fulfilled revenue handled by each shipper. Join `Orders.ShipVia` to `Shippers.ShipperID`.  
shipper_id, shipper_name, fulfilled_orders_count, fulfilled_revenue

### 9. CTE vs Subquery Comparison
First compute total revenue per customer for customers who have at least one order. Then compute the average of those customer totals. Return only the customers whose total revenue is above that average, and include the average customer revenue as a repeated comparison column in the final result.  
customer_id, company_name, customer_revenue, avg_customer_revenue

### 10. CTE with Multiple Joins
Create a CTE that joins `Orders`, `"Order Details"`, `Products`, and `Categories` into an enriched order-line dataset. Each row in that CTE should include the product category and a line-level revenue calculation. Then aggregate that enriched dataset to category level.  
category_id, category_name, category_revenue

### 11. Analytical Question Using Layered CTEs
Build a layered solution for shipped orders only. Start by filtering to orders where `ShippedDate IS NOT NULL`, then compute order totals, then aggregate those orders by the month of `OrderDate`. Format the month as `YYYY-MM` if your SQL dialect supports it; otherwise return an equivalent month key.  
year_month, revenue, orders_count

### 12. Readability & Naming Discipline
Choose one earlier drill and rewrite it using clear pipeline-style CTE names such as `line_totals`, `order_totals`, `customer_totals`, or `fulfilled_orders`. Preserve the exact same result set as the original solution while improving naming and readability.  
same result set as the original query
