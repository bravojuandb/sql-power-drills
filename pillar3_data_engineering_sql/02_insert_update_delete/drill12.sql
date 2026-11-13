-- Drill:     12 — Compare row counts before and after a change
-- Topics:    validation, row counts
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you verify the impact of a write by checking row counts around
--   the operation?
--
-- Expected outcome:
--   a before-and-after validation pattern that compares counts for the
--   affected slice of data
--
-- Verify with:
--   The change in the slice's count equals the number of rows the write
--   statement reported.
--
-- Objects used: customers
--
-- Notes:
--   focus on the relevant subset, not only the whole table, so the validation
--   actually proves the change


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
