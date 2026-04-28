-- Drill 03 — DDL & Schema Design: Add a nullable column safely
-- Business question: How would you add a new optional column to an existing table without breaking the current rows?
-- Expected outcome: an ALTER TABLE statement that adds a nullable column to an existing table
-- Notes: use a column that could reasonably arrive later, such as phone_number or marketing_opt_in_at
-- Tables used: customers

-- NORMAL CASE: Adding a nullable column does not break old rows;
-- existing rows receive NULL in the new column.

ALTER TABLE customers 
    ADD COLUMN marketing_opt_in_at TIMESTAMPTZ;

-- NON-NULLABLE CASE: Add nullable first, backfill old rows,
-- then enforce NOT NULL.

ALTER TABLE customers
    ADD COLUMN loyalty_level TEXT;

UPDATE customers
SET loyalty_level = 'STANDARD'
WHERE loyalty_level IS NULL;

ALTER TABLE customers
    ALTER COLUMN loyalty_level SET NOT NULL;