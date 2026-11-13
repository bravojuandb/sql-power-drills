-- Drill:     09 — Preview an UPDATE with SELECT
-- Topics:    update, preview before write
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you preview exactly which rows an UPDATE will affect before
--   running the write?
--
-- Expected outcome:
--   a SELECT statement that uses the same filter logic planned for a later
--   UPDATE
--
-- Verify with:
--   The preview's row count equals the count the later UPDATE reports.
--
-- Objects used: customers
--
-- Notes:
--   return the key columns plus the columns you expect to change so the
--   preview is easy to inspect


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
