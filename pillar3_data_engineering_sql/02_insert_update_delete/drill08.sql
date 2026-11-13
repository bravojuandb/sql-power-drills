-- Drill:     08 — Delete duplicate staging rows
-- Topics:    delete, deduplication, row_number
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you remove duplicate rows from a staging table while preserving
--   one survivor per duplicate group?
--
-- Expected outcome:
--   a DELETE pattern that keeps one row and removes the extras
--
-- Verify with:
--   Grouping by the business key with `HAVING COUNT(*) > 1` returns no rows,
--   and the number of distinct keys is unchanged.
--
-- Objects used: raw_customers
--
-- Notes:
--   common solutions stage duplicates with ROW_NUMBER() in a CTE before
--   deleting rows where the row number is greater than 1


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
