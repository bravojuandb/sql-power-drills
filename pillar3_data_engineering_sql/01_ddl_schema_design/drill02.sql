-- Drill 02 — DDL & Schema Design: Create an orders table with a foreign key
-- Business question: How would you define an orders table that belongs to customers and preserves referential integrity?
-- Expected outcome: a CREATE TABLE statement for orders with its own primary key and a foreign key to customers
-- Notes: include an order date and a status-like column so the table feels operational, not purely theoretical
-- Tables used: customers


CREATE TABLE IF NOT EXISTS orders (
	order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
	order_date DATE NOT NULL,
	status TEXT NOT NULL CHECK (status IN ('SHIPPED', 'PENDING'))	
);