# 03: Transactions

## Focus

This chapter practices grouping SQL changes into controlled units of work.

The goal is to understand how database state changes across `BEGIN`, `COMMIT`, `ROLLBACK`, and `SAVEPOINT`.

## Drill Prompt Design

1. Start a transaction, insert a row, inspect it, then roll it back.
2. Start a transaction, insert a row, commit it, then confirm it remains.
3. Update several rows inside a transaction and roll back after validating the result.
4. Use a transaction to protect a multi-step load into two related tables.
5. Use a savepoint before a risky update, then roll back only to the savepoint.
6. Trigger a constraint error inside a transaction and observe the transaction state.
7. Practice recovering from a failed statement by rolling back.
8. Transfer values between two rows and commit only when both updates are correct.
9. Compare the database state from inside and outside an open transaction.
10. Write a transaction script that is safe to rerun during practice.

## Concepts To Practice

- `BEGIN`
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`
- Atomic changes
- Multi-statement safety
- Failure recovery
- Inspecting state before commit
