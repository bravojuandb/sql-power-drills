-- Drill:     03 — Insert from a SELECT
-- Topics:    insert select, staging
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you populate a target table from an existing query result
--   instead of hand-writing row values?
--
-- Expected outcome:
--   an INSERT ... SELECT statement that copies or transforms rows into a
--   target table
--
-- Verify with:
--   The number of rows inserted into the target equals the count returned by
--   the SELECT on its own.
--
-- Objects used: raw_customers, clean_customers
--
-- Notes:
--   this is a good place to move rows from a raw staging table into a cleaned
--   table


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
