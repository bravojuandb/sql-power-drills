# 04: Upserts & MERGE

## Focus

This chapter practices handling incoming data that may already exist in the target table.

The goal is to learn when to insert, when to update, and how to make repeated loads safe.

## Drill Prompt Design

1. Insert new rows into a table with a unique natural key.
2. Attempt to insert duplicate keys and observe the failure.
3. Use `INSERT ... ON CONFLICT DO NOTHING` to ignore duplicates.
4. Use `INSERT ... ON CONFLICT DO UPDATE` to refresh changed fields.
5. Preserve created timestamps while updating modified timestamps during an upsert.
6. Upsert from a staging table into a final table.
7. Compare source and target rows before deciding what should change.
8. Use `MERGE` to insert new rows and update matched rows.
9. Add a condition to update only when the incoming value is newer.
10. Make an upsert script idempotent so running it twice produces the same final state.

## Concepts To Practice

- Natural keys
- Unique constraints
- Idempotent loads
- `INSERT ... ON CONFLICT`
- `DO NOTHING`
- `DO UPDATE`
- `MERGE`
- Source-to-target comparison
