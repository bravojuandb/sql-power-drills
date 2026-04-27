# 06: Applied Analytical Patterns

This chapter collects high-value business analysis patterns that combine the core skills from earlier chapters.

These patterns are useful, but they are not separate SQL machinery. They are applications of joins, aggregation, CTEs, conditional logic, date handling, and window functions.

## Pattern Groups

### [Cohort Analysis](cohort_analysis/README.md)

Practice assigning entities to a first-event cohort, measuring later activity, and comparing retention or revenue across periods.

Core skills reused:

- CTEs for staged logic
- date truncation and period offsets
- grouping at the correct customer-period grain
- conditional filters for business definitions

### [Top-N Per Group](top_n_per_group/README.md)

Practice finding the best, latest, largest, or most important rows within each group.

Core skills reused:

- window functions for ranking
- CTEs or subqueries for filtering after ranking
- joins for adding dimensional context
- tie handling with `ROW_NUMBER`, `RANK`, and `DENSE_RANK`

## Future Pattern Ideas

- latest-row logic
- period-over-period change
- rolling activity flags
- funnel analysis
- customer segmentation snapshots

## Completion Criteria

- Solve each pattern by naming the intermediate grains clearly.
- Reuse prior SQL skills instead of treating the pattern as a memorized recipe.
- Keep business definitions explicit: cohort event, ranking metric, active period, tie behavior, and included/excluded rows.
