-- Drill 01 — DDL & Schema Design: Create a customers table
-- Business question: How would you define a basic customers table with a stable primary key and required identity fields?
-- Expected outcome: a CREATE TABLE statement for customers with an integer primary key, required name columns, and a created timestamp
-- Notes: include NOT NULL where appropriate and choose a timestamp default if you want rows to capture creation time automatically
-- Tables used: none

CREATE TABLE IF NOT EXISTS customers (
	customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL UNIQUE,
	email TEXT NOT NULL,
	phone_number TEXT,
	address TEXT,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);