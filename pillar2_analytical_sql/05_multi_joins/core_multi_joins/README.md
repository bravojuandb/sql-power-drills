# Core Multi-Joins

This folder contains the original core drill set for `05_multi_joins`.
The focus is on joining several Northwind tables while keeping the result grain
clear and avoiding accidental row multiplication.

---

## Core Multi-Join Drills

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
Return one row per category with category revenue, number of distinct products sold,
and number of distinct customers who purchased from the category.

Expected output: `category_id`, `category_name`, `category_revenue`, `products_sold`, `active_customers`

### 9. Unmatched Relationship Analysis
Find customers with orders that have not yet shipped, including shipper information when available.
Use outer joins carefully and explain which rows should be preserved.

Expected output: `customer_id`, `company_name`, `order_id`, `shipper_name`, `shipped_date`

### 10. Star-Style Analytical Query
Build a summary by month, category, and shipper using enriched order-line data.
This is a capstone drill for combining dimensions safely.

Expected output: `year_month`, `category_id`, `shipper_id`, `revenue`, `orders_count`

### 11. Customer-Supplier Relationship Matrix
Return one row per customer and supplier pair showing how much revenue the customer generated for that supplier.
Be careful to count orders at the correct grain while summing order-line revenue.

Expected output: `customer_id`, `company_name`, `supplier_id`, `supplier_name`, `supplier_revenue`, `orders_count`

### 12. Shipper Category Performance
Build a shipped-orders summary by shipper and category.
Include revenue and average days to ship, using only orders that have actually shipped.

Expected output: `shipper_id`, `shipper_name`, `category_id`, `category_name`, `shipped_orders`, `avg_days_to_ship`, `category_revenue`
