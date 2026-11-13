-- Drill:     11 — Inspect changed rows with RETURNING
-- Topics:    returning
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you capture the rows affected by a write statement instead of
--   trusting the change blindly?
--
-- Expected outcome:
--   an INSERT, UPDATE, or DELETE statement that uses RETURNING to show the
--   changed rows
--
-- Verify with:
--   The rows shown by RETURNING are exactly the rows you intended to change,
--   with the expected values.
--
-- Objects used: customers
--
-- Notes:
--   choose one write type and return the key columns plus the values that
--   matter for validation


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
