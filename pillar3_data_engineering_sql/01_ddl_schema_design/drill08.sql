-- Drill:     08 — Drop a temporary table carefully
-- Topics:    ddl, drop table, dependencies
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you remove a temporary practice table only after confirming
--   nothing depends on it?
--
-- Expected outcome:
--   a dependency-check step plus a DROP TABLE statement for a temporary table
--
-- Verify with:
--   The dependency check returns no referencing objects; after the drop,
--   `SELECT to_regclass('<table>')` returns NULL.
--
-- Objects used: none
--
-- Notes:
--   the point is the workflow: inspect first, then drop intentionally


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
