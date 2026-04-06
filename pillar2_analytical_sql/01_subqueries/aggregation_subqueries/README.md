# Aggregation Subqueries

This subchapter focuses on two linked skills:

- choosing the right aggregation pattern for the question
- developing careful habits for reading table grain before writing SQL
- using subqueries to protect grain, stage aggregation, and compare grouped results

The drills are designed to slow down the first step of analysis:
What does one row represent here?
What changes when I join?
At which layer should I aggregate?

All drills are written for the PostgreSQL-style Northwind schema used in this pillar.

---

## Tables Used

These drills mainly rely on:

- `customers`
- `orders`
- `order_details`
- `products`
- `categories`
- `suppliers`

Primary join paths used throughout:

- `customers -> orders`
- `orders -> order_details`
- `products -> order_details`
- `suppliers -> products`
- `categories -> products`

---

## Reading Data Habits

Before solving each drill, pause and identify:

1. the grain of each source table
2. whether the final answer is one row per customer, order, product, or month
3. whether aggregation should happen before or after the join
4. whether `COUNT(*)`, `COUNT(column)`, `COUNT(DISTINCT ...)`, `SUM(...)`, or `AVG(...)` actually matches the business question
5. whether you need a subquery to prevent accidental row multiplication

---

## Aggregation Subquery Drills

### 1. Grain Check Before Aggregation
Return the number of rows in `orders` and the number of rows in `order_details`.
Then explain which table is at order grain and which table is at line-item grain.
Use scalar subqueries so each table is counted independently before any join is even possible.
  
Expected output: `orders_rows`, `order_details_rows`

### 2. `COUNT(*)` vs `COUNT(column)`
For all orders, compute:
- total rows
- rows with a non-null `shipped_date`
- rows with a non-null `customer_id`

Use scalar subqueries to answer the three counting questions as separate checks.
  
Expected output: `total_orders`, `shipped_orders`, `orders_with_customer`

### 3. Aggregate at the Correct Grain
Return one row per customer with their total number of orders.
Start from a grouped subquery on `orders`, then select from that derived result.
Do not join `order_details`.
  
Expected output: `customer_id`, `orders_count`

### 4. Join After Pre-Aggregation
Compute order revenue from `order_details`, but return one row per customer with total revenue.
Use a subquery that first reduces `order_details` to one row per order before rolling up to the customer.
  
Expected output: `customer_id`, `customer_revenue`

### 5. Average of Raw Rows vs Average of Order Totals
Return customers whose average order total is above the global average order total.
Use a subquery to first compute one row per order, then average those order totals.
  
Expected output: `customer_id`, `avg_order_total`

### 6. Distinct Counting Habit
Return the number of unique customers who placed at least one order in each calendar year.
First build a subquery with one row per `(order_year, customer_id)`, then count those rows by year.
  
Expected output: `order_year`, `active_customers`

### 7. `WHERE` vs `HAVING`
Return customers whose total revenue is greater than 5000.
First compute one row per customer in a subquery, then filter the outer query on that grouped result.
  
Expected output: `customer_id`, `customer_revenue`

### 8. Read the Join Multiplication Risk
Find products whose total sold quantity is above the average total sold quantity across products.
Use one aggregation layer per product, then compare against an outer average of those product totals.
  
Expected output: `product_id`, `total_quantity`

### 9. Weighted Revenue Thinking
Return category revenue using `SUM(unit_price * quantity * (1 - discount))`.
Do not use plain `AVG(unit_price)` as a proxy for performance.
First build a product-level revenue subquery, then roll those product revenues up to category level.
  
Expected output: `category_id`, `category_name`, `category_revenue`

### 10. Reconciliation Habit
Write a query that returns:
- total revenue across all order lines
- the sum of customer-level revenues

These two values should match.
Use subqueries to prove that your aggregation logic is internally consistent.
  
Expected output: `line_revenue_total`, `customer_revenue_total`

---

## Completion Criteria

- Identify the correct output grain before writing the query
- Avoid unnecessary joins
- Use subqueries when they protect the intended grain
- Use at least one meaningful subquery or derived table in every drill
- Distinguish row-level logic from group-level logic
- Validate totals when a query is easy to misread
