# Cohort and Time-Based Analysis

This subchapter focuses on **time-based analytical patterns that compare groups over time**.  
You will assign customers to cohorts, measure repeat behavior, and track how activity changes across later periods.  
All drills are written against the **Northwind base tables** used throughout Pillar 2.

---

## Tables Used

These drills mainly rely on:

- `Customers`
- `Orders`
- `"Order Details"`

Primary join paths used throughout:

- `Customers -> Orders`
- `Orders -> "Order Details"`

---

## Cohort Analysis Habits

Before solving each drill, pause and identify:

1. the event that defines cohort membership
2. the grain of the cohort table before any retention math
3. the time key you will compare across periods
4. whether you are counting customers, orders, or revenue
5. whether duplicate activity within a period should be collapsed first

---

## Cohort Drills

### 1. First Order Per Customer
Return each customer together with the date of their first order.
This becomes the cohort anchor for later drills.

Expected output: `customer_id`, `first_order_date`

### 2. Cohort Month Assignment
Convert each customer's first order date into a cohort month key such as `YYYY-MM`.

Expected output: `customer_id`, `cohort_month`

### 3. Order Month Activity
Return one row per `(customer_id, order_month)` so each active customer appears once per month of activity.
Collapse duplicates before moving to retention calculations.

Expected output: `customer_id`, `order_month`

### 4. Months Since Cohort Start
Join cohort month to activity month and compute the period offset for each active customer-month.

Expected output: `customer_id`, `cohort_month`, `order_month`, `month_number`

### 5. Cohort Size
Count how many customers belong to each cohort month.

Expected output: `cohort_month`, `cohort_size`

### 6. Retained Customers by Cohort and Month Number
Count active customers for each `(cohort_month, month_number)` combination.

Expected output: `cohort_month`, `month_number`, `retained_customers`

### 7. Retention Rate
Combine retained customer counts with cohort size to compute a retention rate.

Expected output: `cohort_month`, `month_number`, `retained_customers`, `cohort_size`, `retention_rate`

### 8. Cohort Revenue Curve
Instead of counting customers, compute revenue by cohort and month number.
Use order totals or line revenue as your revenue definition.

Expected output: `cohort_month`, `month_number`, `cohort_revenue`

### 9. Repeat-Purchase Cohort Variant
Return only activity after month 0 and measure how many customers made a repeat purchase.

Expected output: `cohort_month`, `repeat_customers`, `repeat_rate`

### 10. Shipped-Order Retention Variant
Redo the retention logic using only shipped orders.
Treat shipped status as part of the business definition, not just a filter added at the end.

Expected output: `cohort_month`, `month_number`, `retained_customers`

---

## Completion Criteria

- Define cohort membership from a clear business event
- Collapse data to the correct customer-period grain before counting
- Distinguish cohort size from later retained activity
- Be explicit about the difference between customer retention, order activity, and revenue retention
- Use layered SQL so each step of the cohort logic is inspectable
