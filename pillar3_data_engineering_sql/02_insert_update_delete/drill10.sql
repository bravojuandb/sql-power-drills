-- Drill:     10 — Preview a DELETE with SELECT
-- Topics:    delete, preview before write
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you preview exactly which rows a DELETE will remove before
--   running it?
--
-- Expected outcome:
--   a SELECT statement that mirrors the WHERE clause planned for a later
--   DELETE
--
-- Verify with:
--   The preview's row count equals the count the later DELETE reports.
--
-- Objects used: raw_customers
--
-- Notes:
--   this drill is about discipline: prove the target set first, then delete


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
