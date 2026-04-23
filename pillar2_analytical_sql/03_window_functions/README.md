# Window Functions

This subchapter focuses on **window functions as a way to analyze rows without collapsing them**.  
You will use them to rank, compare, accumulate, and look across neighboring rows while preserving row-level detail.  
All drills are written against the **Northwind base tables** used throughout Pillar 2.s

---

## Tables Used

These drills mainly rely on:

- `customers`
- `orders`
- `order_details`
- `products`
- `categories`

Primary join paths used throughout:

- `customers -> orders`
- `orders -> order_details`
- `order_details -> products`
- `products -> categories`

---

## Window Function Habits

Before solving each drill, pause and identify:

1. the grain of the final result before introducing any window function
2. the correct `PARTITION BY` boundary for the business question
3. the correct `ORDER BY` inside the window, if row sequence matters
4. whether the answer should keep all rows or filter to only ranked rows afterward
5. whether a grouped query, CTE, or subquery should prepare the data before window logic

---

## Window Function Drills

### 1. `ROW_NUMBER()` Over All Orders
Return all orders with a sequential row number ordered by `order_date`.
Use a window function without partitioning.
If multiple orders share the same date, break ties with `order_id` so the numbering is deterministic.

Expected output: `order_id`, `customer_id`, `order_date`, `row_num`

### 2. `ROW_NUMBER()` Per Customer
Return each order with its sequence number within the customer's order history.
Partition by customer and order by `order_date`.
If multiple orders share the same date for one customer, break ties with `order_id`.

Expected output: `customer_id`, `order_id`, `order_date`, `customer_order_number`

### 3. Latest Order Per Customer
Rank each customer's orders from newest to oldest, then return only the latest order per customer.
Use a CTE or subquery to filter after ranking.
Order by `order_date DESC, order_id DESC` so ties on the same date still produce one deterministic latest row.

Expected output: `customer_id`, `order_id`, `order_date`

### 4. `RANK()` vs `DENSE_RANK()`
Rank products by total sold quantity from highest to lowest and compare `RANK()` with `DENSE_RANK()`.
Observe how ties create gaps in one ranking but not the other.
If you want ties to stay tied, do not add `product_id` inside the window `ORDER BY`; use it only in the final result ordering if needed.

Expected output: `product_id`, `total_quantity`, `sales_rank`, `dense_sales_rank`

### 5. Top 3 Products Per Category
Compute product revenue, partition by category, and rank products within each category.
Return only the top 3 products per category.
Decide tie handling explicitly: use `ROW_NUMBER()` for exactly 3 rows per category, or `RANK()` if tied rows should all be kept.

Expected output: `category_id`, `category_name`, `product_id`, `product_name`, `product_revenue`, `category_rank`

### 6. Running Revenue Total by Month
Aggregate revenue to month grain first, then compute a running total ordered by month.
Use one row per calendar month before applying the window.

Expected output: `year_month`, `monthly_revenue`, `running_revenue`

### 7. Moving Average Across Months
Aggregate order revenue by month, then compute a 3-month moving average.
Use a framed window ordered by month.

Expected output: `year_month`, `monthly_revenue`, `moving_avg_3_month`

### 8. Previous Order Date With `LAG()`
Return each order together with the previous order date for the same customer.
Then compute the gap between the two dates if your SQL dialect supports date subtraction cleanly.
Order each customer's history by `order_date, order_id` so "previous" is deterministic.

Expected output: `customer_id`, `order_id`, `order_date`, `previous_order_date`

### 9. Next Order Date With `LEAD()`
Return each order together with the next order date for the same customer.
Use this to inspect order cadence.
Order each customer's history by `order_date, order_id` so "next" is deterministic.

Expected output: `customer_id`, `order_id`, `order_date`, `next_order_date`

### 10. Share of Category Revenue
Compute product revenue and compare each product's revenue to total revenue for its category using a window aggregate.
Do not collapse the result to category grain.

Expected output: `category_id`, `product_id`, `product_revenue`, `category_revenue`, `revenue_share`

### 11. Order vs Customer Average
Return each order together with the customer's average order total using a windowed average.
Then identify whether the order is above or below that customer benchmark.

Expected output: `customer_id`, `order_id`, `order_total`, `customer_avg_order_total`

### 12. Running Total vs Final Total
Return monthly revenue with both:
- a running total ordered by month
- the final total repeated on every row

Use different window definitions to compare cumulative and full-partition logic.

Expected output: `year_month`, `monthly_revenue`, `running_revenue`, `final_revenue_total`

---

## Completion Criteria

- Choose the correct partition and ordering logic before writing the function
- Keep row-level detail when the business question requires it
- Filter ranked rows only after the ranking step is complete
- Distinguish grouped aggregation from windowed aggregation
- Use CTEs or subqueries when the window should operate on prepared data
