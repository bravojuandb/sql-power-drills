-- Drill:     02 — Insert multiple product rows
-- Topics:    insert, multi-row values
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you load several new rows in one statement instead of issuing
--   separate inserts?
--
-- Expected outcome:
--   a single INSERT statement with multiple VALUES tuples
--
-- Verify with:
--   The statement reports `INSERT 0 n`, with n equal to the number of tuples,
--   and `SELECT COUNT(*)` grows by n.
--
-- Objects used: products
--
-- Notes:
--   use a compact seed-data example with a small products or statuses table


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
