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
psql -d pillar1 -f pillar1/easy/script.sql
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

