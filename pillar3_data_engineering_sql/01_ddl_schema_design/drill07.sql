-- Drill:     07 — Create a lookup table and connect it
-- Topics:    ddl, normalization, foreign keys
-- Dataset:   own tables (PostgreSQL practice database)
-- Solved:    not yet
--
-- Scenario:
--   How would you normalize repeated status values into a lookup table and
--   link them back to a transactional table?
--
-- Expected outcome:
--   CREATE TABLE statements for a lookup table and a foreign-key column added
--   to the related table
--
-- Verify with:
--   `\d orders` lists the foreign key; an INSERT with a status that is not in
--   the lookup table fails.
--
-- Objects used: orders
--
-- Notes:
--   use a small lookup such as order_statuses or customer_tiers and connect it
--   to a fact-like table


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
