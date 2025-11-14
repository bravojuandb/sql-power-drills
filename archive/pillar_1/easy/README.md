## DATABASES and tables used in pillar1/easy

## 1. Database: pillar1, table: employees

```bash
createdb pillar1      
psql -d pillar1 -f pillar1/easy/create_employees.sql
psql -d pillar1 -f pillar1/easy/insert_employees.sql
psql pillar1
```

## 2. Database: sql_foundations, Schema: sales_data

•	Fact table: sales (with product_id, date_id, customer_id, store_id, quantity, price)

•	Dimension tables:
	•	product (name, category, brand)
	•	date_dim (day, month, quarter, year)
	•	customer_dim (name, age, city)
	•	store_dim (location, region)

From Terminal:

```bash
createdb pillar1
psql -d pillar1 -f pillar1/easy/setup_db2.sql
psql pillar1
```

From PostgreSQL:

```sql
CREATE DATABASE sql_foundations;
\c sql_foundations  -- switch into it

-- optional schema (like a namespace)
CREATE SCHEMA sales_data;

-- create dim tables inside schema
CREATE TABLE sales_data.customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);
```

---------------------------------------------
## Installatation Instructions
---------------------------------------------

### Instructions to INSTALL psql in iMac

### Instructions to run psql in local vscode

```bash
psql --version
psql --help
brew services start postgresql     # Start PostgreSQL
psql postgres                      # Connect to it
psql -U postgres 
```

```sql
-- MINIMUM SET OF COMMANDS--

-- See all databases
\l
-- Connect to a database
\c mydb
-- See all tables
\dt
-- Check schema of a table
\d orders
-- Run a query
SELECT * FROM orders LIMIT 5;
-- Quit
\q
```

```sql
-- BASIC NAVIGATION COMMANDS --

\l                  -- List all databases
\c dbname           -- Connect to a specific database
\dt                 -- List all tables in current schema
\dt+                -- List tables with size and descriptions
\d table_name       -- Describe a table (columns, types, indexes)
\dn                 -- List all schemas
\df                 -- List all functions
\du                 -- List all roles/users
\q                  -- Quit psql

-- QUERY HISTORY & EXECUTION --

\s                  -- Show command history
\e                  -- Open external editor for SQL input
\timing             -- Toggle timing of SQL commands
\x                  -- Toggle expanded display (for wide output)
\watch 2            -- Re-run last query every 2 seconds (live updates)

-- FILE INPUT / OUTPUT --

\i filename.sql     -- Execute commands from SQL file
\o output.txt       -- Send all output to a file
\qecho 'message'    -- Print a message during script execution
\copy table TO 'file.csv' CSV HEADER  -- Export table to CSV
\copy table FROM 'file.csv' CSV HEADER  -- Import CSV into table

-- OBJECT INSPECTION --

\dt schema.*        -- List tables in a specific schema
\d+ table_name      -- Describe table with size, storage, etc.
\df+ func_name      -- Show function details
\di                 -- List indexes
\dv                 -- List views
\dm                 -- List materialized views
\db                 -- List tablespaces

-- CONNECTION & SESSION INFO --

\conninfo           -- Show current connection details
\encoding           -- Show current client encoding
\password           -- Change user password
\set var value      -- Set psql variable (e.g. prompts)
\! bash_command     -- Run a shell command

-- USEFUL SQL EXAMPLES (WITHIN psql) --

SELECT version();                      -- Show PostgreSQL version
SELECT current_database();             -- Show current database
SELECT current_user;                   -- Show current user
SELECT * FROM table_name LIMIT 5;      -- Query sample data
CREATE DATABASE testdb;                -- Create a new database
CREATE TABLE demo (id SERIAL, name TEXT);  -- Create table

-- TIPS --

\t                  -- Toggle tuple-only output (no headers)
\f ','              -- Set field separator (e.g. for CSV-style output)
\H                  -- Toggle HTML output (for web export)
```

### Instructions to run sql in Codespaces using sqlite3

### Instructions to run psql in Codespaces using Devcontainer

