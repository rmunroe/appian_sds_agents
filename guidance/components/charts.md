# Charts (a!pieChartField, a!columnChartField, a!barChartField, a!lineChartField, a!areaChartField, a!scatterChartField)

Data-visualization family for reporting dashboards. Reach for a chart when the story is composition, distribution, trend, or correlation. NOT for one unbounded number (rich-text KPI + colored delta), bounded progress ([gauge.md](gauge.md)), or qualitative comparisons on scatter axes — aggregate those to bar/pie.

## Variants (chart-type selection — official decision tree)
- **Parts of a whole**: one category → pie/donut (≤5 slices, always); multiple categories → stacked bar/column; over time → stacked area.
- **Distribution**: positive AND negative values → column (y-axis crosses zero); many categories or labels >~15 chars → bar (each label gets a full row — never rotate/truncate column labels); two measures at once → scatter (quantitative axes only; point color = third grouping).
- **Trends over time**: few intervals (~≤7) → column or line; many → line (≤5 series) or area (≤3 series; stacking:"NORMAL" = totals+trend, "PERCENT_TO_TOTAL" = pure share; unstacked only when series interleave).
- **Compare across categories**: small set → column/line/area; large set → line. Line y-axis auto-scales, surfacing small deltas.
- **Sort in the query** (charts render data order as-is): pie/bar descending, column ascending; time categories always chronological, never by magnitude.
- Missing periods: pass nulls → visible gaps; never zero-fill (always).

## Styling hooks
- `colorScheme` (OOTB scheme or custom hex list): ONE scheme per interface (always) — the corpus dashboard runs 6 charts on one blue-green family (navy #1c5f88, blue #1287b8, teal #17a09a, green #86c65a, all est.). Keep category→color mapping stable across charts.
- ≤5 colors per chart (always); roll small categories into "Other" in the query — "Other" is data prep, not a chart param.
- Monotone gradient ramps only for inherently ordered categories (size rank, workflow stage) on sorted charts; unordered categories take distinct hues — never a ramp on multi-line charts.
- Per-series color on a!chartSeries: one bright hero (#4a9ff5 est.) vs muted gray context (#cccccc est.); semantic red only on the alarming series (Critical) within a quiet family.
- `height` ("MICRO"…"TALL", "AUTO"), `stacking`, pie `style:"DONUT"`, `seriesLabelStyle:"LEGEND"`, legend off for single series.
- Charts have no background (20.4+): host each on a white a!cardLayout over one uniform surface; never mismatched grounds or saturated card colors behind charts.

## Height rules
- Side-by-side charts share one height; size charts so their column stays level with the page ("SHORT" in constrained columns).
- Never a card shorter than its chart — clipped arcs + inner scrollbar (always).
- Drill-down charts: "MEDIUM"/"TALL" for legible click targets, never "SHORT"/"MICRO".
- Bar charts with data-driven category counts: height:"AUTO" — fixed heights silently drop bars and every other label (always).
- "MICRO" = one coarse stat with axes hidden; never micro for many series/labels (x labels collapse to "Ja…").

## Axis & label hygiene
- Hide axes only when the host supplies context (per-row bars beside product names + in-bar values); if space exists and rows are otherwise anonymous, keep default axis labels.
- Hidden axes still need a!chartSeries(label:) + real category values — they feed the tooltip; otherwise hover reads "[Category 23] / Chart Series: 36" (always).
- Single series: no legend; put the meaning in a descriptive title (always).
- Sibling pies in a row: one shared legend + identical heights; per-slice callouts shrink plots unevenly.

## Idioms
1. **KPI card + sparkline** (charts_dashboard): a!cardLayout(showBorder:true) → SMALL label, EXTRA_LARGE number, ▲/▼ delta (green #3aa54a / red #e03c31, est.), right-aligned a!lineChartField height:"MICRO" with axes hidden.
2. **Micro bars inside list rows** (charts_dashboard products list): per-row stacked a!barChartField after name + ID + rating + status tag — fuses chart and record list in one zone.
3. **One-palette dashboard** (charts_dashboard): 11 data zones, 6 chart types, a single shared scheme; red/green reserved exclusively for deltas and stock tags.

## Top don't
Multiple color schemes on one interface (always): when a hue flips meaning between charts (yellow = Tablet in the donut, Desktop in the bar), the page stops being one system and actively misleads — define one scheme and pass it to every chart.
