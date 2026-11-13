-- Drill:     06 — Change a column type safely
-- Topics:    ddl, alter table, type conversion, validation
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you change a column type after first checking whether current
--   values can be converted cleanly?
--
-- Expected outcome:
--   a validation query plus an ALTER TABLE statement that changes a column
--   type safely
--
-- Verify with:
--   The validation query returns no non-convertible rows before the change;
--   `\d customers` shows the new type afterwards.
--
-- Objects used: customers
--
-- Notes:
--   a classic practice case is converting a text column to numeric or date
--   once bad values have been identified


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
