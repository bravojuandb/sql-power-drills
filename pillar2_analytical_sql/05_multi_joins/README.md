# Multi-Join Analytical Patterns

This subchapter focuses on **joining several tables without losing control of grain**.  
You will use multi-hop joins to enrich facts with dimensions, trace relationships across the schema, and answer broader analytical questions without accidentally multiplying rows.  
All drills are written against the **Northwind base tables** used throughout Pillar 2.

---

## Tables Used

These drills mainly rely on:

- `Customers`
- `Orders`
- `"Order Details"`
- `Products`
- `Categories`
- `Suppliers`
- `Employees`
- `Shippers`

Primary join paths used throughout:

- `Customers -> Orders`
- `Orders -> "Order Details"`
- `"Order Details" -> Products`
- `Products -> Categories`
- `Products -> Suppliers`
- `Orders -> Employees`
- `Orders -> Shippers`

---

## Multi-Join Habits

Before solving each drill, pause and identify:

1. which table is the fact table and which tables are dimensions
2. the intended grain of the final answer
3. where row multiplication can happen across one-to-many relationships
4. whether aggregation should happen before or after the joins
5. whether a left join is needed to preserve unmatched rows

---

## Multi-Join Drills

### 1. Order Header Enrichment
Return one row per order enriched with customer name, employee name, and shipper name.

Expected output: `order_id`, `customer_id`, `company_name`, `employee_name`, `shipper_name`, `order_date`

### 2. Order Line Enrichment
Return one row per order line with product, category, and supplier information attached.

Expected output: `order_id`, `product_id`, `product_name`, `category_name`, `supplier_name`, `quantity`

### 3. Customer Revenue by Category
Compute customer revenue by category using the full join path from customers to categories through orders and order details.

Expected output: `customer_id`, `category_id`, `category_name`, `customer_category_revenue`

### 4. Supplier Reach Across Customers
Find how many unique customers bought at least one product from each supplier.
Use careful distinct counting after the necessary joins.

Expected output: `supplier_id`, `supplier_name`, `unique_customers`

### 5. Employee Category Sales
Return revenue by employee and category.
This drill requires joining across orders, order details, products, and categories.

Expected output: `employee_id`, `employee_name`, `category_id`, `category_name`, `category_revenue`

### 6. Left Join Coverage Check
Return all products together with total sold quantity, ensuring unsold products still appear.
Use a left join and handle missing sales correctly.

Expected output: `product_id`, `product_name`, `total_quantity`

### 7. Pre-Aggregate Before a Join
Compute one row per order for order revenue first, then join to customers and shippers.
Compare this approach with joining line items directly first.

Expected output: `order_id`, `customer_id`, `shipper_name`, `order_total`

### 8. Dimension-Enriched Category Reporting
Return one row per category with:
- category revenue
- number of distinct products sold
- number of distinct customers who purchased from the category

Expected output: `category_id`, `category_name`, `category_revenue`, `products_sold`, `active_customers`

### 9. Unmatched Relationship Analysis
Find customers with orders that have not yet shipped, including shipper information when available.
Use outer joins carefully and explain which rows should be preserved.

Expected output: `customer_id`, `company_name`, `order_id`, `shipper_name`, `shipped_date`

### 10. Star-Style Analytical Query
Build a summary by month, category, and shipper using enriched order-line data.
This is a capstone drill for combining dimensions safely.

Expected output: `year_month`, `category_id`, `shipper_id`, `revenue`, `orders_count`

---

## Completion Criteria

- Join through the schema without losing track of the output grain
- Prevent accidental duplication in one-to-many paths
- Use distinct counting only when it truly matches the business question
- Choose inner vs left joins intentionally
- Pre-aggregate when it protects the analysis from row multiplication
