# Dashboards

Charts, grids, and KPIs composed to show data visually. The official page reduces every decision to two questions: which information gets priority, and how does each data shape become digestible. Both are layout questions.

## When this pattern
Signals: the user opens the page to **read state and decide** — aggregates (counts, trends, rates, % of goal) dominate, with at most one working list; cadence anywhere from hourly triage to board review; desktop-first.
Nearest alternatives: a **record view** when the page is about one entity (lead with identity + attributes, not metric families); a **plain list/grid page** when the grid is the whole job (promote it to full width, demote metrics to a header band); a **form** when the user came to submit, not to monitor.

## Anatomy
Canonical form (all corpus dashboards are specializations of this):
```
HEADER-CONTENT
├─ header slot: 1–3 flush bands (identity · KPI-ROW · filter band), each marginBelow:"NONE"
├─ COLUMNS (unequal — width per zone's information need)
│  ├─ PANE[main]  lead graphic or working grid (widest)
│  └─ PANE[rail]  interpretation & monitoring (narrow)
└─ full-width supporting strip (below fold, optional)
```
- **Header band(s)**: state at a glance plus the page's single primary action. KPI rows are one filled card with 4–5 dividered columns — not separate cards (see [data-value-display](data-value-display.md)).
- **Filters**: page-level, in the header, when they govern all zones — official guidance prefers this over per-chart filters because switching slices (period/geo/category) gets faster.
- **Main pane**: the object of work. Column widths scale to information need, never symmetry — the official column-distribution lesson: a 12-point monthly line chart earns a wide column at ≈2:1 over a donut that needs none; main:rail ≈3:1.
- **Rail**: verdicts, exceptions, rankings — interpretation lives beside data, not mixed into it (prose verdict card + warning cards + ranked worst-offenders in the award-cycle example).
- **Cognitive load rule (official)**: limit data points and categories per view; the official example ships fully dark (theme tokens on page background and every card, zero custom CSS) to reduce eye strain.
- Above-fold priorities: every KPI, the lead chart, first grid rows — all three exemplars keep these pre-scroll.

## Variants
### Operational — daily triage, density 4–5
The user clears items within hours. Exemplar: nonprofit fundraising dashboard (density 4).
```
├─ BILLBOARD h=EXTRA_SHORT (brand sliver, optional) marginBelow=NONE
├─ CARD(KPI-ROW ×5 showDividers + sole SOLID action button) flush under billboard
└─ COLUMNS [MEDIUM:AUTO:MEDIUM]
   ├─ queue rail: alerts + my-tasks (linked cards, container padding "NONE")
   ├─ working GRID (pageSize 15 + toolbar + pager) — widest zone
   └─ shortcut rail: action buttons, resources, personal goals (gauges)
```
Rules: everything above the fold including the full grid; charts nearly absent — gauges, carets, and tags carry status; exactly one SOLID button on the page; empty states designed (fixed-height card + oversized pale icon), never blank.

### Analytical — weekly review, density 3–4
The user compares, diagnoses, then drills in. Exemplars: sales performance dashboard (density 4, single-viewport), award-cycle-time report (density 4, hybrid with an operational grid).
```
├─ CARD(KPI-ROW ×4 w/ MICRO sparklines) as the header band
└─ COLUMNS [AUTO:AUTO:MEDIUM]  — or [≈3:1] main:rail
   ├─ lead diagnostic: widest CHART(line/trend) with in-chart threshold reference line
   ├─ mid zone: secondary charts + small GRID (pageSize 3, linked rows)
   └─ rail: passive monitoring charts, or verdict + warning cards + ranked worst-offenders
```
Rules: every headline number carries a delta vs the prior period; threshold semantics go **inside** the chart (reference line), not into another KPI; pair every analytic chart with a named "so what" (verdict/warning cards that point at the exact slices breaching); a filter row (≈5 dropdowns) sits directly above the drill-in grid; single-viewport is achievable here via MICRO chart heights, `spacing: "DENSE"` rows, and empty `a!sectionLayout()` spacers (sales exemplar: 10 zones, no scroll).

### Executive — monthly/board aggregates, density 1–2
The user reads state and rarely acts. Corpus exemplar: sustainability dashboard at density 3 — this variant's ceiling (7 modules + hero in one viewport); with fewer families, go airier.
```
├─ BILLBOARD h=SHORT_PLUS (MEDIUM on phone) — hero carries the title + KPI trio inside its overlay
├─ CARD(filter band, colored, borderless) fused flush under the billboard
├─ COLUMNS [1:1:1] — per-family target cards (big number + status tag + bullet progress)
├─ COLUMNS [1:1:1] — one chart per family (trend | composition | composition)
└─ below fold: derived-math strip (equation row)
```
Rules: equal thirds are **correct** here — peer families deserve peer weight (the inverse of the analytical rule); the headline arithmetic must be legible in the hero itself (actual − offset = net reads across the KPI trio); exceptions above exploration — target/status cards sit above the diagnostic charts; grids absent or below the fold.

### Selection rules
- Cadence: hourly/daily → operational · weekly → analytical · monthly/quarterly → executive.
- A worked queue on-page → operational. Cross-time/category diagnosis → analytical. Targets + aggregates only → executive.
- Grid share of viewport: operational ≥40% · analytical ≤25% · executive ≈0%.
- Actions: operational = 1 primary + shortcut rail · analytical = drill-ins and threshold edits · executive = filters only.
- Hybrids are normal (award-cycle = analytical lead + operational grid): pick the dominant variant's skeleton and borrow zones.

## Component roster
- [header-content-layout](../components/header-content-layout.md) — page shell; the header slot hosts the flush band stack
- [card-layout](../components/card-layout.md) — every zone container: filled borderless for bands, shadowed for content
- [columns-layout](../components/columns-layout.md) — unequal zoning, dividers, `stackWhen`
- [card-group-layout](../components/card-layout.md) — reflowing KPI card rows (`cardWidth: "NARROW_PLUS"`)
- [grid-field](../components/grids.md) — working and drill-in grids
- [charts](../components/charts.md) — line/area/column/pie(DONUT), MICRO sparklines, reference lines; one colorScheme reused page-wide
- [section-layout](../components/section-layout.md) — labeled zones (`labelHeadingTag: "H2"`) and empty-section spacers
- [dropdown-field](../components/inputs.md) — filter bands (`labelPosition: "COLLAPSED"`)

## Layout decisions by data shape
- 12+ time points → widest column, chart height MEDIUM (SHORT below DESKTOP_NARROW). 3–5 categories → donut or single stacked bar in a medium column. One number + recent movement → KPI cell with MICRO sparkline, `xAxisStyle`/`yAxisStyle: "NONE"`.
- KPI count 4–5 per band; beyond that, cut or spill into a card group — never shrink type to fit more.
- In-dashboard grids: 4–5 columns, numeric columns `align: "END"`; an 11-column grid (award-cycle) demands the full main pane and will not survive tablet.
- Rows visible: operational 15 (`pageSize: 15`); analytical 3 (`pageSize: 3`) + link to the full list.
- Peer metric families → equal thirds; mixed ranks → 2:1 / 3:1 sized to information need.
- Micro-bars repeated across list rows: normalize with a shared `yAxisMax` so lengths compare truthfully (sales exemplar).

## Mobile behavior
- Stack order = task order: header KPI band first, then main pane, then rails — set `stackWhen: {"PHONE", "TABLET_PORTRAIT"}` on body columns (CODE-VERIFIED in both light-theme exemplars).
- Charts: heights drop MEDIUM→SHORT and donut labels switch ON_CHART→LEGEND below DESKTOP_NARROW (sustainability forks).
- Billboards: height steps down (SHORT_PLUS→MEDIUM on phone); overlay `alignVertical` TOP on phone.
- Dividered KPI rows become a vertical march when stacked — the corpus caps at 5, turns dividers off on phone (`showDividers: if(a!isPageWidth({"PHONE"}), false, true)`), and shows per-item caps labels instead.
- Wide grids and 3-column bodies push rails far below the fold — order columns so the queue stacks before shortcuts; keep 11-column grids desktop-only.

## Top 3 don'ts
1. **Equal-width chart cards in a symmetric grid.** The official column-distribution page exists to forbid this; its boring twin is "four equal-width chart cards in a 2×2 grid" where every graphic gets the same room regardless of data density.
2. **Charts without interpretation.** No threshold reference line, no verdict/exception cards, no ranked-offender list — "the user does all the interpretation" is the corpus's named failure mode. Every analytic chart gets a "so what" neighbor.
3. **A shouting header.** Four separately bordered, shadowed KPI cards plus default multi-hue on every chart. Corpus dashboards build the KPI band as one filled card with dividered columns, reuse a single chart colorScheme page-wide, and ration accent/semantic color to deltas and the one primary action.

## Exemplars
| case study | what to steal |
|---|---|
| [sustainability-dashboard](../case-studies/sustainability-dashboard.md) | executive skeleton: KPI trio inside the billboard hero; colored borderless filter band fused beneath; bullet-progress target cards (paired THICK progress bars, column divider = target tick) |
| [sales-perform-dashboard](../case-studies/sales-perform-dashboard.md) | analytical single-viewport build: cardGroup + forEach KPI cards with axis-less MICRO sparklines; [AUTO:AUTO:MEDIUM] zoning; shared-`yAxisMax` micro bars as list-row cells |
| [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md) | operational masthead: EXTRA_SHORT photo billboard butted flush to the KPI band (double `marginBelow: "NONE"`); queue–grid–shortcuts triptych [MEDIUM:AUTO:MEDIUM]; one SOLID button among OUTLINE peers |
