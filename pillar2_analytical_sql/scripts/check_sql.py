
"""
CLI utility to validate SQL drill queries against versioned CSV expectations.

The tool executes a SQL file on either SQLite or PostgreSQL, serializes the
result (columns + rows) into a deterministic CSV representation, and compares
it byte-for-byte against a stored "golden" CSV file.

It supports one-time generation of expected outputs (--write-expected) and
subsequent exact verification, enabling automated regression checks and CI.

Usage:

SQLite:

python3 pillar2_analytical_sql/scripts/check_sql.py \
  --engine sqlite \
  --db pillar2_analytical_sql/00_datasets/northwind.db \
  --sql pillar2_analytical_sql/01_subqueries/drills/drill01.sql \
  --expected pillar2_analytical_sql/tests/pillar2_analytical_sql/01_subqueries/drill01.csv

PostgreSQL:

python3 pillar2_analytical_sql/scripts/check_sql.py \
  --engine postgres \
  --db northwind \
  --sql pillar2_analytical_sql/01_subqueries/drills/drill01.sql \
  --expected pillar2_analytical_sql/tests/pillar2_analytical_sql/01_subqueries/drill01.csv

Exit codes:
    0  success (output matches expected CSV)
    1  mismatch between actual and expected output
    2  execution or configuration error

Notes:
    - Queries must be deterministic; include ORDER BY when row order matters.
    - Expected CSV files represent the accepted output contract for each drill.
"""

import argparse
import csv
import hashlib
import re
import sqlite3
import subprocess
import sys
from pathlib import Path

def read_sql(path: Path) -> str:
    return path.read_text(encoding="utf-8")

def fetch_sqlite_rows(conn: sqlite3.Connection, sql: str):
    cur = conn.cursor()
    cur.execute(sql)
    cols = [d[0] for d in (cur.description or [])]
    rows = cur.fetchall()
    return cols, rows

def strip_trailing_comments_and_semicolon(sql: str) -> str:
    query = sql.strip()
    while True:
        previous = query
        query = re.sub(r"\s+$", "", query)
        query = re.sub(r"/\*.*?\*/\s*$", "", query, flags=re.S)
        query = re.sub(r"--[^\n]*\s*$", "", query)
        query = re.sub(r"\s+$", "", query)
        if query.endswith(";"):
            query = query[:-1]
        query = query.rstrip()
        if query == previous:
            return query

def build_postgres_copy_sql(sql: str) -> str:
    query = strip_trailing_comments_and_semicolon(sql)
    return f"COPY ({query}) TO STDOUT WITH (FORMAT CSV, HEADER TRUE)"

def fetch_postgres_rows(args: argparse.Namespace, sql: str):
    cmd = ["psql", "-X", "-v", "ON_ERROR_STOP=1"]

    if args.host:
        cmd.extend(["-h", args.host])
    if args.port:
        cmd.extend(["-p", str(args.port)])
    if args.user:
        cmd.extend(["-U", args.user])

    cmd.extend(["-d", args.db, "-c", build_postgres_copy_sql(sql)])

    try:
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            check=False,
        )
    except FileNotFoundError as e:
        raise RuntimeError(
            "psql not found. Install PostgreSQL client tools or use --engine sqlite."
        ) from e

    if proc.returncode != 0:
        stderr = proc.stderr.strip() or proc.stdout.strip() or "unknown postgres error"
        raise RuntimeError(stderr)

    reader = csv.reader(proc.stdout.splitlines())
    all_rows = list(reader)
    if not all_rows:
        return [], []
    cols = all_rows[0]
    rows = all_rows[1:]
    return cols, rows

def normalize_cell(x):
    # Normalize database outputs so CSV comparison is stable
    if x is None:
        return ""  # represent NULL as empty cell in expected CSV
    return str(x)

def rows_to_csv_string(cols, rows) -> str:
    out_lines = []
    out_lines.append(",".join(cols))
    for r in rows:
        out_lines.append(",".join(escape_csv(normalize_cell(v)) for v in r))
    return "\n".join(out_lines) + "\n"

def escape_csv(s: str) -> str:
    # Minimal CSV escaping (quotes if needed)
    if any(c in s for c in [",", '"', "\n", "\r"]):
        return '"' + s.replace('"', '""') + '"'
    return s

def file_sha256(path: Path) -> str:
    h = hashlib.sha256()
    h.update(path.read_bytes())
    return h.hexdigest()

def string_sha256(s: str) -> str:
    return hashlib.sha256(s.encode("utf-8")).hexdigest()

def load_expected_csv(path: Path) -> str:
    # Load and re-serialize expected CSV for consistent newline handling
    with path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f)
        rows = list(reader)
    # Rebuild with \n
    out = []
    for row in rows:
        out.append(",".join(escape_csv(cell) for cell in row))
    return "\n".join(out) + "\n"

def main():
    p = argparse.ArgumentParser()
    p.add_argument(
        "--engine",
        choices=["sqlite", "postgres"],
        default="sqlite",
        help="Database engine to use (default: sqlite)",
    )
    p.add_argument(
        "--db",
        required=True,
        help="SQLite .db path or PostgreSQL database name",
    )
    p.add_argument("--host", help="PostgreSQL host")
    p.add_argument("--port", type=int, help="PostgreSQL port")
    p.add_argument("--user", help="PostgreSQL user")
    p.add_argument("--sql", required=True, help="Path to a .sql drill file")
    p.add_argument("--expected", required=True, help="Path to expected CSV file")
    p.add_argument("--write-expected", action="store_true",
                   help="Overwrite expected CSV with current output (use carefully)")
    args = p.parse_args()

    db_path = Path(args.db)
    sql_path = Path(args.sql)
    exp_path = Path(args.expected)

    if args.engine == "sqlite" and not db_path.exists():
        print(f"ERROR: DB not found: {db_path}", file=sys.stderr)
        return 2
    if not sql_path.exists():
        print(f"ERROR: SQL not found: {sql_path}", file=sys.stderr)
        return 2

    try:
        sql = read_sql(sql_path)
        if args.engine == "sqlite":
            conn = sqlite3.connect(str(db_path))
            try:
                cols, rows = fetch_sqlite_rows(conn, sql)
            finally:
                conn.close()
        else:
            cols, rows = fetch_postgres_rows(args, sql)

        if not cols:
            print(f"ERROR: Query returned no columns (did it SELECT?): {sql_path}", file=sys.stderr)
            return 2

        actual_csv = rows_to_csv_string(cols, rows)

        if args.write_expected:
            exp_path.parent.mkdir(parents=True, exist_ok=True)
            exp_path.write_text(actual_csv, encoding="utf-8")
            print(f"WROTE expected: {exp_path}")
            return 0

        if not exp_path.exists():
            print(f"ERROR: Expected CSV missing: {exp_path}", file=sys.stderr)
            print("Tip: run with --write-expected to generate it once.", file=sys.stderr)
            return 2

        expected_csv = load_expected_csv(exp_path)

        a_hash = string_sha256(actual_csv)
        e_hash = string_sha256(expected_csv)

        if a_hash != e_hash:
            print(f"FAIL: {sql_path}")
            print(f"  expected: {exp_path} (sha256={e_hash[:12]})")
            print(f"  actual:   sha256={a_hash[:12]}")
            print("  Hint: ensure your SQL has a deterministic ORDER BY.", file=sys.stderr)
            return 1

        print(f"PASS: {sql_path}")
        return 0

    except sqlite3.Error as e:
        print(f"SQLITE ERROR in {sql_path}: {e}", file=sys.stderr)
        return 2
    except RuntimeError as e:
        print(f"POSTGRES ERROR in {sql_path}: {e}", file=sys.stderr)
        return 2

if __name__ == "__main__":
    raise SystemExit(main())
