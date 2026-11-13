-- Drill:     06 — Convert blanks to NULL
-- Topics:    update, null handling, staging
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you normalize blank strings into NULL values in a staging table
--   before downstream loading?
--
-- Expected outcome:
--   an UPDATE statement that replaces blank or whitespace-only strings with
--   NULL
--
-- Verify with:
--   After the update, counting rows where `TRIM(column) = ''` returns 0 for
--   each cleaned column.
--
-- Objects used: raw_customers
--
-- Notes:
--   be explicit about which columns are being cleaned and whether TRIM() is
--   needed


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
