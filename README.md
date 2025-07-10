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

## Github Codespaces Setup

1. Use sqlite3, the easiest way to run slq

```bash

sqlite3 --version

sudo apt update
sudo apt install sqlite3

sudo apt install sqlite3 libsqlite3-dev

sqlite3 mydata.db

.quit

```


## Set up on Mac

1. Create a Virtual Enviroment:

```bash
cd path/to/your/local-repo
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
echo ".venv/" >> .gitignore

```
2. Install `psql` on macOS using Homebrew:

```bash
brew update
brew install postgresql
brew services start postgresql

--troubleshhoting:--

brew services restart postgresql@14
brew services stop postgresql@14
brew services start postgresql@14

brew uninstall postgresql@14
rm -rf /opt/homebrew/var/postgresql@14
brew install postgresql@14
brew services start postgresql@14
```

3. Then verify installation with:

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

