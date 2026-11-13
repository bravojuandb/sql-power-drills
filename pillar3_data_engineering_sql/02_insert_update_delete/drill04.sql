-- Drill:     04 — Update one row by primary key
-- Topics:    update, primary key filter
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you update a single customer's status with a precise primary-key
--   filter?
--
-- Expected outcome:
--   an UPDATE statement that changes one row and only one row
--
-- Verify with:
--   The statement reports `UPDATE 1`; a SELECT by that primary key shows the
--   new status.
--
-- Objects used: customers
--
-- Notes:
--   verify the target row with a SELECT first if you want to reinforce write
--   safety habits


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
