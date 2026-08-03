# KPI (a!kpiField)

Shows the current value of one business metric (primary measure), optionally with a trend comparing it against a secondary measure. Reach for it for decision-worthy numbers on dashboards and headers. NOT for values that track nothing (database artifacts — see Top don't); when a header strip needs exact control of sizes, the corpus hand-builds KPI rows from rich text instead (mixed-header KPI strip in [header-content-layout](header-content-layout.md)).

## Variants
Official vocabulary — templates, trends, text, sizes:
- **COMPACT** (default template) — icon + primaryText inline, value EXTRA_LARGE below, trend at the bottom. The default for cards and dashboards.
- **STACKED** — every element on its own line, often `align: "CENTER"`; for mobile, narrow columns, and billboard overlay bands (kpi_example_overlay: 4 STACKED KPIs in a bottom `a!barOverlay`, `spacing: "SPARSE"`, `showDividers: true`, `stackWhen` PHONE/TABLETs). Tallest variant.
- **ADJACENT** — oversized icon spanning the text rows on the left; for dense dashboards needing an eye anchor; pairs with `iconStyle: "STAMP"` (colored circle behind the glyph).
- **trend**: `AUTO` (default — difference AND percentage: "↑ 4 (+50%)") | `PERCENTAGE` (rate is the story) | `DIFFERENCE` (absolute change matters) | `NONE` (no meaningful comparison exists).
- **primaryText** labels the value; **secondaryText** trails the trend to name its baseline ("over last week", "vs 2023") — add it whenever a trend shows.
- **size**: SMALL | STANDARD | LARGE.

## Styling hooks
- `icon`, `iconColor` (stamp circles in the docs: "#FAA92F", "#EB4183"), `iconStyle: "STAMP"`, `align`, `size`.
- Trend colors are semantic and automatic: positive #117c00 / negative #df0036 (est.) on white. On dark card styles like `#0F1C2E` the renderer auto-brightens text to #eeeeee and trends to #5af740 / #ff3434 (est.) — custom dark cards keep contrast for free.
- Custom trend icon: compare `fv!primaryMeasure` vs `fv!secondaryMeasure` inside `a!match()` with icons for positive, negative, AND no change (kpi_trendIcon: double-chevron-down amplifies an unfavorable decline).

## Idioms
1. **KPI + chart in one card** — the Examples section's repeated recipe (analysis rollup): KPI + its supporting visual in a single `a!cardLayout` (white or `#0F1C2E`), `showShadow: true`, `showBorder: false`, ALL chart chrome stripped (`labelPosition: "COLLAPSED"`, axis styles "NONE"). Hero form (kpi_example_chart, CODE-VERIFIED):
```
a!cardLayout(contents: {
    a!kpiField(data: ..., primaryText: "Total Revenue",
      icon: "file-invoice-dollar", size: "LARGE"),
    a!cardLayout(contents: {
        a!columnChartField(labelPosition: "COLLAPSED", height: "SHORT",
          xAxisStyle: "STANDARD", yAxisStyle: "NONE", showLegend: false,
          colorScheme: a!colorSchemeCustom(colors: {"#ffbc11", ...}))
      }, style: "#FAFAFA", shape: "ROUNDED", padding: "LESS", showBorder: false)
  }, shape: "ROUNDED", padding: "STANDARD", showBorder: false, showShadow: true)
```
Tile form: `size: "SMALL"` + `height: "MICRO"` + `xAxisStyle: "NONE"`. Sparkline form (kpi_example_sparkline): dark card, `a!sideBySideLayout` of kpiField (`width: "MINIMIZE"`, trend PERCENTAGE) + `a!lineChartField(height: "MICRO", showTooltips: false)`, one colorSchemeCustom hue per card (#756BD1 / #F47348 / #F8B439).
2. **Multi-KPI titled card** (kpi_example_card, CODE-VERIFIED): white card, `shape: "SEMI_ROUNDED"`, `decorativeBarPosition: "TOP"`, `decorativeBarColor: "ACCENT"`, MEDIUM STRONG title + SMALL SECONDARY subtitle, then `a!columnsLayout(spacing: "SPARSE", showDividers: true)` of 4 KPIs — only the lead metric keeps a trend; the rest set `trend: "NONE"` (a funnel needs one comparison, not four).
3. **Progress-to-goal** (kpi_example_progress, CODE-VERIFIED): `template: "ADJACENT", iconStyle: "STAMP", trend: "NONE", secondaryText: "Target Revenue: $1,200,000"` + `a!progressBarField(percentage: 80, color: "POSITIVE", style: "THIN", showPercentage: false, marginAbove: "LESS")` in the same card. Use only when a real target exists.

## Top don't
Don't promote non-metrics to KPIs (always-severity): the docs DON'T is "Newest ID value: 200" with "⇅ 0 (0%)" — a database artifact plus a full line of zero-change noise. A value earns a KPI only if it tracks an important metric; set `trend: "NONE"` when no meaningful comparison exists, and give every real trend a secondaryText baseline.
