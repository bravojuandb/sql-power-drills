# Conditional Logic

This subchapter focuses on **conditional logic as a way to encode business meaning directly in SQL**.  
You will use `CASE` expressions, conditional aggregates, and rule-based bucketing to turn raw rows into interpretable analytical outputs.  
All drills are written against the **Northwind base tables** used throughout Pillar 2.

---

## Tables Used

These drills mainly rely on:

- `Customers`
- `Orders`
- `"Order Details"`
- `Products`
- `Categories`
- `Shippers`

Primary join paths used throughout:

- `Customers -> Orders`
- `Orders -> "Order Details"`
- `"Order Details" -> Products`
- `Products -> Categories`
- `Orders -> Shippers`

---

## Conditional Logic Habits

Before solving each drill, pause and identify:

1. whether the condition should be evaluated at row level or group level
2. whether the output should be a label, flag, bucket, or aggregate
3. whether `NULL` should be treated as missing, false, or its own category
4. whether a `CASE` belongs inside `SELECT`, `WHERE`, `ORDER BY`, or an aggregate
5. whether the business rule should be defined once in a subquery or CTE before reuse

---

## Conditional Logic Drills

### 1. Basic `CASE` Labeling
Return orders with a shipping status label based on whether `ShippedDate` is null.

Expected output: `order_id`, `customer_id`, `shipping_status`

### 2. Revenue Buckets
Compute one row per order with revenue and bucket each order into bands such as low, medium, and high value.
Define the revenue in a subquery or CTE first.

Expected output: `order_id`, `order_total`, `revenue_band`

### 3. Customer Activity Tier
Count orders per customer and label customers as low-, medium-, or high-activity based on order volume.

Expected output: `customer_id`, `orders_count`, `activity_tier`

### 4. Conditional `COUNT`
Return, per shipper, the number of shipped orders and the number of not-yet-shipped orders using conditional counting.

Expected output: `shipper_id`, `shipper_name`, `shipped_orders`, `unshipped_orders`

### 5. Conditional `SUM`
Compute total revenue from discounted lines and non-discounted lines separately.
Use conditional aggregation on `"Order Details"`.

Expected output: `discounted_revenue`, `full_price_revenue`

### 6. Category Price Positioning
Return products with a label showing whether each product's unit price is below, near, or above its category average price.
Prepare the category average first if needed.

Expected output: `product_id`, `category_id`, `unit_price`, `category_avg_price`, `price_position`

### 7. Customer Fulfillment Profile
Return customers with counts of shipped and unshipped orders, plus a label describing whether they are mostly fulfilled, mixed, or mostly pending.

Expected output: `customer_id`, `shipped_orders`, `unshipped_orders`, `fulfillment_profile`

### 8. Monthly Revenue Split
Aggregate revenue by month and split it into discounted versus non-discounted revenue using conditional sums.

Expected output: `year_month`, `discounted_revenue`, `full_price_revenue`

### 9. Category Performance Flags
Aggregate revenue by category and classify each category as above or below average category revenue.
Compute category revenue first, then compare to the average category total.

Expected output: `category_id`, `category_name`, `category_revenue`, `performance_flag`

### 10. Multi-Rule Business Classification
Create a classification for orders based on multiple conditions such as shipped status, discount usage, and order value.
Use a carefully ordered `CASE` expression and explain why rule order matters.

Expected output: `order_id`, `order_total`, `shipping_status`, `discount_flag`, `order_classification`

---

## Completion Criteria

- Write `CASE` logic that matches the real business rule, not just the syntax
- Handle `NULL` values intentionally
- Distinguish row-level labels from grouped summaries
- Use conditional aggregation when it is clearer than multiple separate queries
- Reuse business definitions through subqueries or CTEs when the rule appears more than once
