# Gauge (a!gaugeField)

Ring whose arc encodes measurable progress toward completion — the fill IS the value. Reach for it only when the value has an obvious 100% endpoint (responses received, tasks completed). NOT for unbounded figures (stock index, revenue): use a rich-text KPI with a colored delta instead; for trends or comparisons, a chart ([charts.md](charts.md)).

## Variants (primary text format)
- **Percentage** (a!gaugePercentage()) — "75" EXTRA_LARGE dark + smaller gray "%". Use when the percent is the most meaningful unit to viewers. Default choice for most cases.
- **Fraction** (a!gaugeFraction(denominator: 8)) — "6/8", numerals dark with a gray slash; arc fills exactly 6÷8 = 75%. Use when count-of-total carries the meaning (task/checklist records). Avoid when the denominator is large or abstract — percent scans faster.
- **Icon** (a!gaugeIcon(...) + altText) — an eye-catching icon replaces the number and the underlying value moves to secondaryText ("252 of 336"). Use in multi-gauge rows needing category recognition; avoid when the exact value is primary, since the icon demotes it.

## Styling hooks
- `percentage` drives the ring; fill starts at 12 o'clock and runs clockwise (OBSERVED in every corpus crop).
- `color`: default ACCENT — renders as ring #316598 (est.) over track #dddddd (est.) on white throughout the corpus; brand-colored gauges also appear (plum pair on the sales-rep home, eventHistoryListPreviewExample).
- `secondaryText`: sits below the primary text inside the ring — the self-describing label ("Tasks Completed").
- Outer `label` above or below the gauge when the text needs more space than the ring allows; corpus captions are SMALL all-caps bold ("PROJECT COMPLETION", "RESPONSES RECEIVED").
- `size` is available; keep sibling gauges at one size so rows stay level.

## Idioms
1. **Self-labeled card KPI** (gauge_secondary_text): a!gaugeField(percentage: 75, primaryText: a!gaugeFraction(denominator: 8), secondaryText: "Tasks Completed") — no outer caption; compact enough for card KPIs and record summary headers.
2. **Icon trio row** (gauge_icons): three same-size gauges, one a!gaugeIcon per category ("users"/"cube"/"flag") with "x of y" secondaryText; fills 75%/64%/33% matched 252/336, 7/11, 1/3 — a glanceable 3-up dashboard row.
3. **Quality pair in a side rail** (eventHistoryListPreviewExample): two brand-plum gauges (83% on-time, 91% issue-free deliveries) compress delivery QA into one narrow SECTION beside the task and customer columns — two numbers, no chart destination.

## Top don't
Gauging an unbounded value (always — page: "Don't use gauges to show values that are unbounded"): the corpus DON'T wraps "+6.19 / 0.21% / S&P 500 INDEX" in a ~70%-filled ring; an index has no 100% threshold, so the arc encodes nothing and fabricates a completion story. Bounded ratio, or no ring.
