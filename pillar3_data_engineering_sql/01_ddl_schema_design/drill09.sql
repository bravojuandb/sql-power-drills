-- Drill:     09 — Design a raw ingest table
-- Topics:    ddl, staging tables
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you model a raw landing table for a feed where every incoming
--   value arrives as text?
--
-- Expected outcome:
--   a CREATE TABLE statement for a raw staging table with loosely typed text
--   columns
--
-- Verify with:
--   `\d <raw_table>` shows only text columns (plus any load metadata); a row
--   with malformed values inserts without error.
--
-- Objects used: none
--
-- Notes:
--   favor traceability and load tolerance over strict typing at this stage


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
