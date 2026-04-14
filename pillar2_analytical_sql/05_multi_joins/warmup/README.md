# Multi-Join Warmup

This folder is a **gentle on-ramp** into the full `05_multi_joins` chapter.
It is designed for learners who want to practice joins in the **Northwind** dataset before tackling heavier analytical join patterns.

The drills here keep the scope intentionally narrow:

- start with simple two-table joins
- follow one join path at a time
- get comfortable with row grain
- introduce a basic left join before moving on

---

## Tables Used

These warmup drills mainly rely on:

- `customers`
- `orders`
- `order_details`
- `products`
- `categories`
- `suppliers`

Primary join paths used in this warmup:

- `customers -> orders`
- `orders -> order_details`
- `order_details -> products`
- `products -> categories`
- `products -> suppliers`

---

## Warmup Habits

Before solving each drill, pause and identify:

1. which table should provide the base row grain
2. whether each join is one-to-one or one-to-many
3. whether the result should keep all matches only or also unmatched rows
4. whether the final answer should return raw rows or aggregated rows

---

## Drill Progression

### 1. Customer Orders
Join `customers` to `orders` and return one row per order with customer information attached.

Expected output: `customer_id`, `company_name`, `order_id`, `order_date`

### 2. Order Lines
Join `orders` to `order_details` and return one row per order line.

Expected output: `order_id`, `order_date`, `product_id`, `quantity`, `unit_price`

### 3. Product Categories
Join `products` to `categories` and return product names with their category names.

Expected output: `product_id`, `product_name`, `category_id`, `category_name`

### 4. Product Suppliers
Join `products` to `suppliers` and return product names with their supplier names.

Expected output: `product_id`, `product_name`, `supplier_id`, `supplier_name`

### 5. Enriched Order Lines
Follow the path from `order_details` to `products` and `categories` so each order line includes the product and category.

Expected output: `order_id`, `product_id`, `product_name`, `category_name`, `quantity`

### 6. Products With or Without Sales
Return all products together with the total quantity sold. Products with no sales should still appear.
Use a `LEFT JOIN`.

Expected output: `product_id`, `product_name`, `total_quantity`

---

## Completion Criteria

- Write basic joins without guessing the join key
- Keep track of whether the result is at order grain, order-line grain, or product grain
- Recognize when a left join is needed to preserve rows
- Feel comfortable moving from two-table joins to small multi-table joins
