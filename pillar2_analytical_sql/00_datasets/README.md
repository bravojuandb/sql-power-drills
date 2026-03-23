# Northwind on PostgreSQL for macOS

This guide shows how to load the Northwind dataset into PostgreSQL on macOS.

The flow is simple:

1. Install PostgreSQL
2. Run PostgreSQL
3. Load `northwind.sql`
4. Verify the load

This setup assumes you are running commands from the root of this repository.

## 1. Install PostgreSQL

Check whether PostgreSQL is already installed:

```bash
psql --version
```

If it is not installed, install it with Homebrew:

```bash
brew install postgresql
```

Confirm the install:

```bash
psql --version
```

If `brew` is not available, install Homebrew first and then rerun the command above.

## 2. Run PostgreSQL

Start PostgreSQL with Homebrew services:

```bash
brew services start postgresql
```

Check that it is running:

```bash
brew services list
```

You can also test the connection:

```bash
psql postgres
```

If the connection opens, PostgreSQL is running correctly.

Exit `psql` with:

```bash
\q
```

## 3. Load the Northwind Database

The Northwind SQL file is expected at:

```bash
pillar2_analytical_sql/00_datasets/northwind.sql
```

Before loading it, create a database named `northwind`:

```bash
createdb northwind
```

If the database already exists, you may see an error. That is fine as long as the `northwind` database is already available.

To confirm it exists:

```bash
psql -lqt
```

You can load the schema and data in two ways.

### Interactive method inside `psql`

Open the database:

```bash
psql -d northwind
```

From inside `psql`, run:

```sql
\i pillar2_analytical_sql/00_datasets/northwind.sql
```

This is useful if you want to stay in the PostgreSQL shell and inspect output as the file runs.

### Batch method from the terminal

Run the SQL file directly from your shell, without opening `psql` interactively:

```bash
psql -d northwind -f pillar2_analytical_sql/00_datasets/northwind.sql
```

This is useful when you want a quick one-command load from the command line.

If the file loads successfully, PostgreSQL will print a series of statements as they execute.

## 4. Verify the Load

Connect to the database:

```bash
psql -d northwind
```

Run a few quick checks:

```sql
\dt
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_details;
```

What to verify:

- `\dt` should list the Northwind tables
- `customers`, `orders`, and `order_details` should all return row counts
- No table-not-found errors should appear

Exit `psql` when you are done:

```bash
\q
```

## Troubleshooting

If something does not work, these are the most common causes:

- `psql: command not found`: PostgreSQL is not installed or not on your shell path
- `brew: command not found`: Homebrew is not installed
- `database "northwind" does not exist`: create it first with `createdb northwind`
- `northwind.sql: No such file or directory`: check that the SQL file is saved in `pillar2_analytical_sql/00_datasets`
- connection errors: make sure PostgreSQL is running with `brew services start postgresql`
