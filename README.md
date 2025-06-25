# sql-power-drills

This is my personal SQL training ground — organized around Four Pillars of SQL:

- Query Fluency & Set Logic

- Readable & Robust SQL

- Scripted SQL & Automation

- Data Pipeline Thinking


## Folder structure

```bash
pillar 1/
├── easy/
│   ├── create_db_easy.sql
│   ├── insert_db_easy.sql
│   ├── drill1.sql
│   ├── drill2.sql
│   └── ...
├── medium/
│   ├── create_db_medium.sql
│   ├── insert_db_medium.sql
│   └── ...
└── hard/
│   ├── create_db_hard.sql
│   ├── insert_db_hard.sql
│   └── ...
pillar 2/
pillar 3/
pillar 4/
```

## PSQL Setup

To install `psql` on macOS using Homebrew:

```bash
brew update
brew install postgresql
brew services start postgresql
```

Then verify installation with:

```bash
psql --version
```

## Loading .sql scripts

To run a `.sql` file from the command line:

```bash
psql -d your_database_name -f path/to/your_script.sql
```

For example, if you're in the project root and want to load an "easy" drill:

```bash
psql -d postgres -f pillar_1/easy/drill1.sql
```