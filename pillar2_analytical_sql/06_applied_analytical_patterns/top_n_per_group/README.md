# Top-N and Per-Group Analysis

This subchapter focuses on **finding the best, latest, largest, or most important rows within each group**.  
You will combine grouping, window functions, and post-ranking filters to answer questions that simple aggregation cannot express cleanly.  
All drills are written against the **Northwind base tables** used throughout Pillar 2.

---

## Tables Used

These drills mainly rely on:

- `Customers`
- `Orders`
- `"Order Details"`
- `Products`
- `Categories`

Primary join paths used throughout:

- `Customers -> Orders`
- `Orders -> "Order Details"`
- `"Order Details" -> Products`
- `Products -> Categories`

---

## Top-N Habits

Before solving each drill, pause and identify:

1. what defines "top" for the business question
2. whether ranking should happen globally or within a partition
3. how ties should be handled
4. whether the query should return exactly N rows per group or allow tied extras
5. whether the ranking logic should be staged in a CTE or subquery before filtering

---

## Top-N Drills

### 1. Top 10 Customers by Revenue
Compute customer revenue and return the top 10 customers overall.

Expected output: `customer_id`, `company_name`, `customer_revenue`

### 2. Top 5 Products by Quantity Sold
Aggregate quantity sold per product and return the top 5 products across the whole dataset.

Expected output: `product_id`, `product_name`, `total_quantity`

### 3. Highest-Value Order Per Customer
Return the single highest-value order for each customer.
Use ranking and filter after the ranking step.

Expected output: `customer_id`, `order_id`, `order_total`

### 4. Most Recent Order Per Customer
Return the latest order for each customer.
This is a per-group top 1 problem based on date rather than revenue.

Expected output: `customer_id`, `order_id`, `order_date`

### 5. Top 3 Products Per Category
Rank products by revenue within each category and return only the top 3 per category.

Expected output: `category_id`, `category_name`, `product_id`, `product_name`, `product_revenue`, `category_rank`

### 6. Top Shipper by Fulfilled Revenue
Define fulfilled orders first, then find the shipper with the highest fulfilled revenue.

Expected output: `shipper_id`, `shipper_name`, `fulfilled_revenue`

### 7. Ties and Ranking Behavior
Return products with both `ROW_NUMBER()` and `RANK()` so tied rows can be compared directly.
Explain which ranking method better fits a "top N" requirement when ties exist.

Expected output: `product_id`, `product_revenue`, `row_num`, `sales_rank`

### 8. Top Categories by Monthly Revenue
Aggregate category revenue by month, rank categories within each month, and return the top 2 categories per month.

Expected output: `year_month`, `category_id`, `category_name`, `category_revenue`, `month_rank`

---

## Completion Criteria

- Distinguish global ranking from per-group ranking
- Choose a ranking function that matches the tie-handling requirement
- Filter ranked rows in an outer query or CTE stage
- Keep the ranking metric explicit and reproducible
- Recognize when top-N logic is clearer with window functions than with joins or subqueries alone
