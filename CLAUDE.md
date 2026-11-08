# CLAUDE.md

Personal SQL practice repository. The main ongoing activity is **business question sessions** in `business_questions/`. The `pillar*` folders are a topic-based curriculum used as reference; do not reorganize them.

## Business question sessions

Triggered when the user asks for a question. Repository files are written in English.

**Each session is timeboxed to ~20 minutes** (question → solution → review → notes → commit). Size questions to fit, keep reviews short and focused on what matters, and do not push follow-up analyses or deeper digging; at most mention a follow-up in one line as a possible future question.

### 1. Propose a question

- Dataset: **Northwind on PostgreSQL** (database `northwind`, schema `public`).
- The center of the question is **obtaining business information** — something a sales manager, ops lead or finance analyst would actually ask — not exercising a syntax feature.
- Before proposing, list `business_questions/` and read the headers of recent sessions to:
  - choose the level (see progression below),
  - avoid repeating the same question or the same business angle back to back,
  - rotate across business areas: sales, customers, products, employees, suppliers, shipping, geography.
- Present: level, business context (who asks and why), the question, expected grain, expected columns, and the tables involved only if useful at that level.
- **Do not give the solution, hints or SQL** unless asked.

### 2. Review the attempt

- The user iterates in pgAdmin and pastes the solution they consider correct in chat. Do not ask for intermediate attempts.
- Run the query against Northwind when possible to check the result rather than reviewing by eye.
- Review order: correctness of the result (grain, duplicated rows from joins, missing rows from inner joins, NULLs, revenue formula including discount) → readability → idioms.
- If it is wrong, give a hint first and let the user retry before showing a corrected query.
- Explain *why* something is wrong, with a concrete case from the data when possible.

### 3. Record

- Create `business_questions/<level_folder>/YYYY-MM-DD_short-slug.sql` from `_template.sql` with the header filled (level folders: `01_easy`, `02_easy_plus`, `03_medium`, `04_medium_plus`, `05_advanced`).
- The user pastes `MY SOLUTION` into the file. After the review, give the corrected final version **in chat only**.
- The user writes `PROCESS NOTES`, `REVIEW`, `FINAL VERSION` and `BUSINESS INSIGHT` themselves. Do not fill them; when asked, review what they wrote and correct mistakes or inaccuracies.
- Propose a commit; only commit after the user confirms. Message format:
  `feat(business_questions): <date> <short description>`

### Level progression

- Start at `easy` and move up gradually to easy +, medium, medium +, advanced; there is no rush.
- Move up only after several clean easy sessions; mix in an occasional earlier-level question as review.
- Levels and their typical shape are defined in `business_questions/README.md`.

## Northwind reference

Tables: `categories`, `customers`, `customer_customer_demo`, `customer_demographics`, `employees`, `employee_territories`, `orders`, `order_details`, `products`, `region`, `shippers`, `suppliers`, `territories`, `us_states`.

- Revenue per line: `unit_price * quantity * (1 - discount)` from `order_details` (use `order_details.unit_price`, not `products.unit_price`).
- `orders.ship_via` references `shippers.shipper_id`.
- `employees.reports_to` is a self-reference (manager).
- `customer_demographics` / `customer_customer_demo` are usually empty in this dataset; verify before using them in a question.
- Check actual date ranges (`orders.order_date`) before writing period-based questions.

## Environment

- The user writes queries in pgAdmin and writes the session notes in the file; Claude creates the file with the header and reviews the notes.
