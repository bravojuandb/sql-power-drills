# Datasets

## Purpose

This folder will hold setup scripts and small datasets for Pillar 3.

The datasets should be intentionally small enough to inspect by hand, but realistic enough to practice operational patterns such as staging, deduplication, updates, constraints, and transaction rollback.

## Planned Dataset Ideas

- A simple customer/order/product model for schema design and constraints
- A raw event import table with duplicates and malformed values
- A slowly changing customer profile feed
- A staging table that needs to be promoted into a clean final table
- A permissions or audit-style table for DCL and operational metadata practice

## Drill Prompt Themes

- Load a raw CSV-style table into a staging table.
- Create a clean target schema from a messy source.
- Compare raw row counts with cleaned row counts.
- Identify duplicate natural keys before inserting into a final table.
- Reset the practice database after destructive drills.
