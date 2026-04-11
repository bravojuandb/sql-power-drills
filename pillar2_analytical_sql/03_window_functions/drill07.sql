-- Drill 07 — Window Functions: Moving average across months
-- Business question: What is the 3-month moving average of monthly revenue?
-- Expected output: year_month, monthly_revenue, moving_avg_3_month
-- Notes: aggregate to month grain first, then use a framed window ordered by month
-- Tables used: Orders, Order Details

