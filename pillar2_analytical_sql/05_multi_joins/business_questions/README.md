# Business Question Multi-Joins

This folder adds scenario-style drills for practicing the most important part of
analytical SQL: translating a business question into the right joins, grain, and
metrics.

Each drill starts with the business decision to support. Before writing SQL,
identify the base fact table, the dimensions needed, and the exact output grain.

---

## Drill Progression

### 1. Best Customers by Category
Find the highest-revenue customers inside each product category.

Expected output: `category_id`, `category_name`, `customer_id`, `company_name`, `category_revenue`, `orders_count`

### 2. Category Expansion Opportunities
Find customers with strong total revenue who have not purchased from a given category.

Expected output: `customer_id`, `company_name`, `customer_revenue`, `missing_category_id`, `missing_category_name`

### 3. Supplier Concentration Risk
Measure how dependent each category is on its top suppliers by revenue.

Expected output: `category_id`, `category_name`, `supplier_id`, `supplier_name`, `supplier_revenue`, `category_revenue`, `supplier_revenue_share`

### 4. Shipping Delay Hotspots
Identify customer countries and shippers with the highest average shipping delay.

Expected output: `ship_country`, `shipper_id`, `shipper_name`, `shipped_orders`, `avg_days_to_ship`, `late_orders`

### 5. Employee Portfolio Mix
Show each employee's revenue mix by customer country and product category.

Expected output: `employee_id`, `employee_name`, `country`, `category_id`, `category_name`, `revenue`, `orders_count`

### 6. Discount Effectiveness
Compare discounted and non-discounted revenue by category and customer country.

Expected output: `category_id`, `category_name`, `country`, `discounted_revenue`, `full_price_revenue`, `discounted_orders`

### 7. Product Reorder Pressure
Find products with low inventory pressure and meaningful historical demand.

Expected output: `product_id`, `product_name`, `supplier_name`, `category_name`, `units_in_stock`, `units_on_order`, `reorder_level`, `historical_quantity_sold`

### 8. Cross-Sell Category Pairs
Find category pairs that appear together in the same customer order.

Expected output: `category_id_1`, `category_name_1`, `category_id_2`, `category_name_2`, `orders_count`, `customers_count`

### 9. Market Revenue Quality
Compare revenue, freight, and order count by customer country and shipper.

Expected output: `country`, `shipper_id`, `shipper_name`, `orders_count`, `revenue`, `freight_total`, `freight_to_revenue_ratio`

### 10. Supplier Customer Footprint
Show which suppliers have broad customer reach across countries.

Expected output: `supplier_id`, `supplier_name`, `customer_country`, `customers_count`, `orders_count`, `supplier_revenue`

### 11. Underpenetrated Categories by Country
Find countries where a category has active buyers but low revenue compared with the category's global revenue.

Expected output: `country`, `category_id`, `category_name`, `country_category_revenue`, `global_category_revenue`, `country_share`

### 12. Order Profitability Proxy
Build an order-level view combining revenue, discount value, freight, customer, employee, and shipper.

Expected output: `order_id`, `customer_id`, `company_name`, `employee_name`, `shipper_name`, `order_revenue`, `discount_value`, `freight`
