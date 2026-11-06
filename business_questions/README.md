# Business Questions

Practice sessions built around real business questions on the Northwind dataset (PostgreSQL).

Unlike the pillars, which are organized by SQL topic, this folder is organized by **date**. A business question rarely fits a single topic: answering it usually means combining joins, aggregations, CTEs or window functions. The goal here is not to practice a syntax feature, but to turn a stakeholder question into correct, readable SQL and a clear business insight.

## How a session works

1. **Ask** — Claude proposes a business question (level, context, expected grain and columns), without the solution.
2. **Solve** — iterate in pgAdmin until you have a solution you consider correct.
3. **Review** — paste it to Claude (plus where you got stuck, optionally). Claude reviews it: hints first, then the correction.
4. **Record** — Claude creates the session file from [`_template.sql`](_template.sql) and fills it in; then commit.

Trial and error stays in pgAdmin. The file keeps the submitted solution unedited: the gap between it and the final version is the record of progress.

## Levels and file naming

Each session goes in the folder of its level, named by date:

```
business_questions/<level_folder>/YYYY-MM-DD_short-slug.sql
```

Example: `01_easy/2026-11-05_top-customers-by-revenue.sql`. For a second session on the same day: `2026-11-05b_...`. Sessions are not necessarily daily; the date only keeps them in order.

| Folder | Level | Typical shape |
|--------|-------|---------------|
| `01_easy` | easy | One or two tables, filters, `GROUP BY`, top-N lists, totals and counts. |
| `02_easy_plus` | easy+ | Simple joins across 2–3 tables, `HAVING`, basic date filtering, `CASE` labels. |
| `03_medium` | medium | Multi-table joins with grain control, CTEs, conditional aggregates, date bucketing. |
| `04_medium_plus` | medium+ | Window functions (ranking, running totals), period comparisons, multi-step CTEs. |
| `05_advanced` | advanced | Cohorts, retention, period-over-period growth, multi-step analyses with edge cases. |

Progression is gradual: stay at a level until it feels comfortable, then move up.

## Finding past sessions by topic

```bash
grep -rl "Topics:.*window functions" business_questions/
```

## Setup

Northwind must be loaded in PostgreSQL. See the [Pillar 2 dataset guide](../pillar2_analytical_sql/00_datasets/README.md).
