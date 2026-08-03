# Analysis: sales-perform-dashboard

## sales_dashboard_dark_theme.png

### Identification
- **Image**: sales_dashboard_dark_theme.png | **Source page**: sales-perform-dashboard | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) sales performance dashboard"
- **Device frame**: desktop (3360×2100 retina; top nav bar with appian logo, DASHBOARD/INVENTORY/PIPELINE is site chrome, not in the SAIL source — INFERRED)
- **Marker**: neutral
- **UI type**: dashboard-analytical (with operational elements)

### Use-case reconstruction (INFERRED)
- **Persona**: e-commerce sales/merchandising manager at a fashion retailer; daily-operator cadence (today-vs-yesterday deltas, restock flags)
- **Domain & brand context**: online apparel retail ("Dresses"/"Tops", campaign promos); dark "command-center" brand feel
- **Top 3 user tasks (ranked)**: 1. Scan today's revenue/orders health vs yesterday. 2. Spot inventory actions on top sellers (Restock / Low in Stock). 3. Steer promotion spend via region, campaign, and channel performance.
- **Implied requirements**: "Must show day-over-day KPI deltas with direction at a glance"; "Must flag stock state on top products inline"; "Must compare purchased vs returned per product"; "Must fit all zones in one viewport without scrolling"; "Must render entirely in a dark theme"; "Campaign names must link to detail records"
- **Data model sketch** (read off pixels): KPI{name, todayValue, delta, pct, trend[]}×4 · Product{name, rating 1–5, productId, tag, purchased, returned}×6 · Campaign{name, visits, purchases, revenue}×3 · RegionSales{region, fullPrice, clearance, promotion}×4 · SatisfactionBucket×3 · AcquisitionSeries{returning[], new[]} · TrafficSource{channel, pct}×4

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=PLUM_SCHEME
├─ CARD(header band, style #17202b, borderless)
│  └─ KPI-ROW ×4 via CARD-GROUP cardWidth=NARROW_PLUS
│     └─ each: CARD(COLUMNS [label+value : CHART(sparkline, MICRO)], PLUM_SCHEME)
└─ COLUMNS [AUTO:AUTO:MEDIUM]
   ├─ CARD("Top Selling Products By Category": dropdown+hand-legend, 6× COLUMNS [NARROW:AUTO] rows w/ CHART(stacked-bar MICRO))
   ├─ CARD(CHART(stacked column "Sales by Region")) ─ SECTION spacer ─ CARD(GRID(3 rows) "Top Performing Campaigns")
   └─ CARD(CHART(stacked-bar meter "Customer Satisfaction")) ─ CARD(CHART(line "Customer Acquisition")) ─ CARD(CHART(donut "Traffic Sources"))
```
- **Above the fold**: everything — single-viewport dashboard, 10 data zones, no scroll
- **Reading order**: F — KPI strip across, then columns left→right
- **Hierarchy rationale**: KPI band is the headerContentLayout `header`, pinning task 1 first; widest left column carries the operational product list (task 2); MEDIUM right rail holds passive monitoring charts (task 3)
- **Density**: 4 — 10 data zones in one viewport, MICRO chart heights, `spacing: "DENSE"` product rows
- **Ratios & spacing**: observed ≈ [1.5 : 1.5 : 1]; right column CODE-VERIFIED `width: "MEDIUM"`, others AUTO; all cards `padding: "STANDARD"`; vertical gaps via empty `a!sectionLayout()` spacers

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page bg `backgroundColor: "PLUM_SCHEME"` (renders ≈ #2b3050 est.); card bg `style: "PLUM_SCHEME"` (≈ #1f2440 est.); header band literal #17202b; positive #4CC900; negative #E64345; star orange #fc9901; tag yellow #F7D027; legend teal #00A88F, green #82C272; charts `colorScheme: "RAINFOREST"` (renders blue ≈ #1f7bb6, teal ≈ #00A88F, green ≈ #82C272, pale green ≈ #a5d296, all est.); links render lavender ≈ #9b8ce0 est. (scheme-supplied)
- **Color application points**: semantic red/green on KPI carets + delta text + sparkline strokes; RAINFOREST across every chart series; tag backgrounds (yellow/red); star icons; link text in grid; one custom hex band behind KPIs — no colored buttons, no colored headings
- **Typography moves**: every card/KPI heading SMALL + SEMI_BOLD; KPI values MEDIUM_PLUS rich text; deltas STANDARD; Product ID `color: "SECONDARY"`; tags SMALL. No page title at all — biggest text on screen is the KPI numbers
- **Imagery stance**: no photos (avatar is chrome); styled icons only — caret-up/down MEDIUM in semantic color, star/star-o #fc9901, SMALL circle legend dots
- **Card treatment**: filled, `showBorder: false`, no shadow — flat dark cards separated purely by value shift vs canvas
- **Signature moves**: (1) instead of a!kpiField, hand-built KPI cards via `a!cardGroupLayout` + forEach: value column beside `a!lineChartField(height:"MICRO", xAxisStyle/yAxisStyle:"NONE", showLegend:false)` sparkline; (2) instead of a light default theme, full dark mode from two scheme tokens (`PLUM_SCHEME` on page + cards) plus one literal hex; (3) instead of chart legends, hand-built legend from `a!richTextIcon(icon:"circle")` dots hex-matched to RAINFOREST (#00A88F/#82C272); (4) instead of a gauge, single-category stacked MICRO bar as a satisfaction meter with `yAxisMax: 112` = exact series sum; (5) chart-as-list-cell: per-product stacked micro bars normalized by shared `yAxisMax: 95`

### Component inventory (CODE-VERIFIED)
- `a!headerContentLayout(backgroundColor:"PLUM_SCHEME")`; header `a!cardLayout(style:"#17202b", height:"AUTO")`; `a!cardGroupLayout(cardWidth:"NARROW_PLUS")`; KPI `a!richTextItem(size:"MEDIUM_PLUS")` + `a!richTextIcon(color: item.color)`; `a!lineChartField(height:"MICRO"|"SHORT", yAxisMax:40|160, yAxisStyle:"NONE"|"MINIMAL")`; `a!barChartField_21r4(stacking:"NORMAL", showDataLabels:true, height:"MICRO")` (deprecated version); `a!columnChartField(stacking:"NORMAL")`; `a!pieChartField(style:"DONUT", seriesLabelStyle:"LEGEND", showAsPercentage:true)`; `a!gridField(pageSize:3, borderStyle:"LIGHT", shadeAlternateRows:false)` with `a!dynamicLink` campaign names; `a!tagField(size:"SMALL", align:"END")` with conditional backgroundColor (#F7D027 if "Low in Stock" else #E64345); star ratings via forEach `enumerate(5)+1` choosing star/star-o; dormant filter row (`showWhen: false`) with dropdown + two dateFields
- Chart types: line ×5 (4 sparklines + acquisition), bar ×7 (6 product rows + satisfaction), column ×1, donut ×1; custom colorScheme: yes, RAINFOREST everywhere; per-series literal colors only on sparklines
- Interactive affordances: category dropdown, sortable grid with record links, tooltips; hidden date-range filter shipped but disabled

### Character & judgment
- **Register**: authoritative-executive · utilitarian-ops — dark command-center gravitas wrapped around restock-level operational detail
- **Why it works**: semantic color is rationed to meaning (red/green deltas, yellow/red tags) so it reads instantly against the neutral plum field; uniform SMALL/SEMI_BOLD headings keep chrome quiet, letting MEDIUM_PLUS numbers dominate; shared yAxisMax normalization makes the six product bars comparable at a glance
- **Why not boring**: dark plum scheme with zero custom CSS; sparklines living inside KPI cards; charts embedded as list-row cells; hex-matched fake legends replacing chart legends; a donut + meter-bar + stacked columns mix instead of four identical charts
- **Boring twin**: light-gray page, four `a!kpiField(template:"STACKED")` tiles, one full-width product grid with numeric columns, three default-palette charts with built-in legends, LARGE section headings, bordered white cards.
- **What to steal**: (1) cardGroup+forEach KPI cards with axis-less MICRO sparklines; (2) whole-page dark theming via matching backgroundColor/card scheme tokens; (3) richTextIcon circle legends hex-matched to a built-in colorScheme
- **Risks**: red/green up-down pairing is colorblind-risky (mitigated by caret direction); lavender links ≈ #9b8ce0 on card ≈ #1f2440 is borderline contrast; MICRO axis-less charts expose values only via labels/tooltips (screen-reader weak); data labels on tiny segments (6, 7, 12) can collide at narrow widths; 3-column stack pushes right rail far below fold on mobile; deprecated `a!barChartField_21r4` dependency

### Code cross-check
- **Code-verified palette**: #17202b header band; #4CC900 / #E64345 semantic pair; #00A88F / #82C272 legend dots; #fc9901 stars; #F7D027 tag yellow; tokens `PLUM_SCHEME` (page + all cards) and `RAINFOREST` (all charts) — rendered plum/rainforest hexes remain (est.)
- **Notable techniques**: sparkline categories forEach maps every point to the KPI name so tooltips read the metric (~L148–153); yAxisMax used as normalizer/meter total (L161, 461, 614, 649); empty `a!sectionLayout()` as card spacer (L527, 629, 662); duplicated `showWhen:false` "Financial Summary" filter block in header and body (L47–103, 246–304); conditional tag backgroundColor by tag text (L434–438)
- **Corrections**: chart palette is the built-in RAINFOREST scheme, not custom series hexes as pixels suggest; card fills are the PLUM_SCHEME token, not literal hexes; grid row order in the screenshot (visits descending) contradicts `initialSorts` (revenue ascending) — screenshot shows a re-sorted state; ".00" on visit counts comes from `fixed()` formatting; code typo "Purcahsed" in a series label (invisible in UI since that legend is hidden)
