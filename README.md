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
## Setting up a Virtual Enviroment

### On Mac

```bash
cd path/to/your/local-repo
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
echo ".venv/" >> .gitignore
```

## PSQL Setup

To install `psql` on macOS using Homebrew:

```bash

brew update
brew install postgresql
brew services start postgresql

brew services restart postgresql@14
brew services stop postgresql@14
brew services start postgresql@14

brew uninstall postgresql@14
rm -rf /opt/homebrew/var/postgresql@14
brew install postgresql@14
brew services start postgresql@14

```

Then verify installation with:

```bash
psql --version
```

## Create User and Database (Dev Project Setup)

```bash
createuser -s juan         # Create superuser
createdb pillar1           # Create a database
psql pillar1               # Connect to it
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

## Run This Project in GitHub Codespaces

This project uses a `.devcontainer` folder to auto-install PostgreSQL and run the database setup.

### Step-by-step:

1. Click the green **"Code"** button in this repository.
2. Select the **"Codespaces"** tab.
3. Click **"Create codespace on main"**.
4. Wait for the container to build (1–2 minutes).
5. In the terminal, confirm PostgreSQL is running:
```bash
psql -U postgres -d sql_foundations
```
