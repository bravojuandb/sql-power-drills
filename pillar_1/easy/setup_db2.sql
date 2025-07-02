/*

This script sets up a new PostgreSQL database called 'sql_foundations'.

It creates a schema named 'sales_data' containig the following tables:

- Fact table: sales
- Dimension tables: product, date_dim, customer_dim, store_dim


	•	Creates the sales_data schema
	•	Defines dimension tables first (customers, products, store_dim, date_dim)
	•	Populates each dimension table with valid sample data
	•	Defines the sales fact table with foreign keys to all dimension tables
	•	Populates the fact table using only valid existing IDs


To execute this setup from the termional (outside psql) use the following commands:

    createdb sql_foundations
    psql -d sql_foundations -f pillar1/easy/setup_db2.sql
    psql sql_foundations

*/

CREATE SCHEMA sales_data;

-- Create and populate customers dimension table inside schema
CREATE TABLE sales_data.customers_dim (
    customer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

INSERT INTO sales_data.customers_dim (name, email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Carlos Martínez', 'carlos.martinez@example.com'),
('Diana Evans', 'diana.evans@example.com'),
('Eva Gómez', 'eva.gomez@example.com');

-- Create and populate the products dimension table
CREATE TABLE sales_data.products_dim (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price NUMERIC(10, 2)
);

INSERT INTO sales_data.products_dim (product_name, category, price) VALUES
('Hammer', 'Tools', 15.99),
('Screwdriver Set', 'Tools', 12.50),
('Electric Drill', 'Power Tools', 79.99),
('Wrench', 'Tools', 9.80),
('Circular Saw', 'Power Tools', 129.95);


-- Create and populate the store dimension table
CREATE TABLE sales_data.store_dim (
    store_id SERIAL PRIMARY KEY,
    store_name TEXT,
    location TEXT
);

INSERT INTO sales_data.store_dim (store_name, location) VALUES
('Madrid Central Store', 'Madrid, Spain'),
('Barcelona Outlet', 'Barcelona, Spain'),
('Valencia Hub', 'Valencia, Spain'),
('Seville Branch', 'Seville, Spain'),
('Bilbao Depot', 'Bilbao, Spain');


-- Create and populate the date dimension table
CREATE TABLE sales_data.date_dim (
    date_id SERIAL PRIMARY KEY,
    date_value DATE,
    year INT,
    month INT,
    day INT
);

INSERT INTO sales_data.date_dim (date_value, year, month, day) VALUES
('2025-07-01', 2025, 7, 1),
('2025-07-02', 2025, 7, 2),
('2025-07-03', 2025, 7, 3),
('2025-07-04', 2025, 7, 4),
('2025-07-05', 2025, 7, 5);

-- Create sales fact table
CREATE TABLE sales_data.sales_fact (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales_data.customers_dim(customer_id),
    product_id INT REFERENCES sales_data.products_dim(product_id),
    store_id INT REFERENCES sales_data.store_dim(store_id),
    date_id INT REFERENCES sales_data.date_dim(date_id),
    quantity INT,
    total_amount NUMERIC(10, 2)
);

-- Populate the sales fact table
INSERT INTO sales_data.sales_fact (customer_id, product_id, store_id, date_id, quantity, total_amount) VALUES
(1, 1, 1, 1, 2, 31.98),   -- Alice Smith buys 2 Hammers at Madrid store on 2025-07-01
(2, 3, 2, 2, 1, 79.99),   -- Bob Johnson buys 1 Electric Drill at Barcelona store on 2025-07-02
(3, 2, 3, 3, 3, 37.50),   -- Carlos Martínez buys 3 Screwdriver Sets at Valencia store on 2025-07-03
(4, 5, 4, 4, 1, 129.95),  -- Diana Evans buys 1 Circular Saw at Seville store on 2025-07-04
(5, 4, 5, 5, 2, 19.60);   -- Eva Gómez buys 2 Wrenches at Bilbao store on 2025-07-05
