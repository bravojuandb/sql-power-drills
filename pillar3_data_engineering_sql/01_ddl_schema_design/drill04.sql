-- Drill:     04 — Add a defaulted status column
-- Topics:    ddl, alter table, defaults
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you add a status column so future inserts automatically receive
--   a sensible default?
--
-- Expected outcome:
--   an ALTER TABLE statement that adds a status column with a default,
--   followed by INSERT examples that rely on the default
--
-- Verify with:
--   `\d customers` shows the default; a row inserted without a status comes
--   back with the default value.
--
-- Objects used: customers
--
-- Notes:
--   make the default explicit and choose a status that would make sense for
--   new rows, such as active or pending


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
