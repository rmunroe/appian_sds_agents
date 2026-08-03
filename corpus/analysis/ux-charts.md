# Analysis: ux-charts

Page: `corpus/pages/ux-charts.md` (section: components). 48 images: 1 tier A (charts_dashboard.png), 47 tier B/C chart crops. No SAIL source exists on this page, so every hex is pixel-estimated `(est.)`; nothing is CODE-VERIFIED. Tier-C crops are grouped into DO/DON'T pairs when siblings under the same heading; unpaired crops get standalone entries with the missing side noted. Note: `height_DO_dashboard_short.png` and `text_DO_dashboards_axes.png` are the same 1601x941 screenshot as `charts_dashboard.png`, reused by the page to teach height and labeling points (OBSERVED, dimensions + content match).

## charts_dashboard.png

### Identification
- **Image**: charts_dashboard.png | **Source page**: ux-charts | **Alt/caption**: ds-images/charts_dashboard.png
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical

### Use-case reconstruction (INFERRED)
- **Persona**: e-commerce operations/marketing manager; weekly-manager cadence (date-range filter spans 4 months, deltas vs prior period)
- **Domain & brand context**: online apparel retail ("Dresses", campaigns like "Holiday Bundle"); Appian-branded demo chrome; pragmatic business feel
- **Top 3 user tasks (ranked)**: 1. Scan financial health vs prior period (revenue, orders, users). 2. Diagnose what drives it (products by category, sales by region, traffic sources). 3. Act on merchandising/campaigns (Restock tags, campaign revenue table).
- **Implied requirements**: "Must show 4 headline KPIs with trend at a glance"; "Must filter the whole page by date range"; "Must expose per-product purchase vs return counts and stock alerts"; "Must break regional sales into price-type mix"; "Must rank campaigns by conversions with drill-in links"
- **Data model sketch**: Product(name, productId, rating, stockStatus, itemsPurchased, itemsReturned) filtered by Category; Order→Region(4) × PriceType(Full Price/Clearance/Promotion); Campaign(name, visits, purchases, revenue) ×3; CustomerSatisfaction(3 buckets); Acquisition(week, returning, new); TrafficSource(4, %). OBSERVED off labels.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (teal-blue nav bar: 3 tabs + waffle + avatar + appian logo)
├─ SECTION "Financial Summary" + FORM(date-range dropdown, 2 date fields)
├─ KPI-ROW ×4 CARD(label, EXTRA_LARGE number, ▲/▼ delta, right-aligned sparkline CHART(line micro, axes hidden), border)
└─ COLUMNS [4:4:3]
   ├─ PANE[left] SECTION "Top Selling Products By Category"
   │  ├─ FORM(category dropdown) + 2-item legend
   │  └─ 6 rows: name + Product ID + star rating + status tag + CHART(stacked bar, per-row)
   ├─ PANE[center]
   │  ├─ CHART(stacked column "Sales by Region ($)", 3 series, legend below)
   │  └─ SECTION "Top Performing Campaigns" GRID(3 rows × 4 cols, sorted by # Purchases, linked names)
   └─ PANE[right]
      ├─ CHART(stacked bar ×1 "Customer Satisfaction", axes hidden, legend)
      ├─ CHART(line ×2 "Customer Aquisition", x labels hidden)
      └─ CHART(donut "Traffic Sources", legend with %)
```
- **Above the fold**: everything — single-viewport dashboard, no scroll implied
- **Reading order**: F (KPI strip, then left→right across three columns)
- **Hierarchy rationale**: KPI money numbers biggest and first (task 1); composition charts mid-page for diagnosis (task 2); action surfaces (tags, linked campaigns) embedded in lists (task 3)
- **Density**: 4 — 11 distinct data zones (4 KPI cards + 6 charts/lists + table) in one 1601×941 viewport, compact padding
- **Ratios & spacing**: ~[4:4:3] columns; KPI cards equal width; card padding ≈ `padding:"STANDARD"`, section gaps ≈ `marginBelow:"STANDARD"`; thin borders, no shadows

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; nav #1287b8 (est.), selected-tab block #0f6f9c (est.) with white underline; card borders #d9d9d9 (est.); series family navy #1c5f88, blue #1287b8, teal #17a09a, green #86c65a (all est.) — resembles an OOTB blue-green colorScheme (INFERRED "Ocean"-like); semantic green #3aa54a / red #e03c31 (est.); tag bgs yellow #f2c94c, red #e04f42 (est.); link blue #1c7ecb (est.); stars #f5a623 (est.)
- **Color application points**: nav bar; KPI deltas + sparklines (semantic red/green); chart series (brand family only); star icons; status tags; table links. Card bodies stay white — color is data-only.
- **Typography moves**: page title LARGE semibold; zone titles STANDARD–MEDIUM bold; KPI numbers EXTRA_LARGE; deltas SMALL colored; nav tabs all-caps SMALL; product IDs SMALL gray #757575 (est.)
- **Imagery stance**: none (no photos/illustrations; only chart marks, stars, tags)
- **Card treatment**: border, flat (showBorder:true, no shadow) for KPI cards; inner zones sit borderless on white
- **Signature moves**: instead of number-only KPIs, sparkline line charts with hidden axes ride inside each KPI card; instead of a separate products chart, per-row micro stacked bars fuse chart into a record list; instead of per-chart palettes, one blue-green scheme spans all 6 visualizations; semantic red/green is reserved exclusively for deltas and stock tags

### Component inventory (OBSERVED)
- a!headerContentLayout-style nav; a!dateField ×2 + dropdown; 4× KPI card ≈ a!cardLayout(showBorder:true) + a!richTextDisplayField(EXTRA_LARGE) + a!lineChartField(height:"MICRO", showAxes:false) (INFERRED)
- a!barChartField(stacking:"NORMAL") per product row; a!columnChartField(stacking:"NORMAL", 3 series); a!gridField(3 rows, sortable "# Purchases", link column); a!barChartField single-row satisfaction; a!lineChartField(2 series); a!pieChartField(style:"DONUT")
- Chart custom colorScheme: yes — shared blue-green family; INFERRED single scheme param reused
- Interactive affordances: date-range filter, category dropdown, sortable grid, campaign links, tab nav; label typo "Customer Aquisition" OBSERVED
- Legend text OBSERVED: satisfaction legend reads Not Satisfied / Neutral / Satisfied with green/teal/blue dots

### Character & judgment
- **Register**: utilitarian-ops + authoritative-executive — money KPIs up top, dense operational detail below, zero decoration
- **Why it works**: one palette across 6 charts makes the page read as one system; KPI row answers "how are we doing" in <2s via number+delta+sparkline; each chart type matches its data (donut=share, stacked column=regional mix, line=trend)
- **Why not boring**: sparklines-in-KPI-cards instead of bare stat tiles; product list interleaves stars, colored tags, and micro stacked bars per row; donut legend carries exact % so the ring stays clean; date-range control makes it a tool, not a poster
- **Boring twin**: four flat stat boxes with no trend, one full-width data table, a default-palette pie and column chart stacked vertically, no filters, each chart a different color scheme.
- **What to steal**: 1. Share one colorScheme across every chart on a page. 2. Pair every KPI number with a micro axis-less sparkline. 3. Embed per-row micro bars inside lists to fuse records with quantities.
- **Risks**: teal vs green series are close in hue (colorblind ambiguity, mitigated by ▲/▼ glyphs on deltas only); hidden x-axis on Customer Acquisition depends on tooltips; small gray ID text near contrast floor

### Code cross-check
- **Code-verified palette**: none — page has no SAIL source; all hexes pixel-estimated
- **Notable techniques**: none
- **Corrections**: none

## pie_DO_proportional.png + pie_DONT_multiple.png

### Principle: One pie shows one whole — never compare pies
- **DO shows**: single donut "Commuting Preferences", 5 slices sorted descending from 12 o'clock (40/25/20/10/5%), monochrome indigo ramp dark→light tracking rank (#1b2148→#9aa5d6 est.), legend right as "Category (value%)", white slice separators (OBSERVED)
- **DON'T shows**: two side-by-side pies "Customers by Region 2016/2017"; reader must eyeball near-identical slices across charts (US 36.2%→37.5%); duplicate callout labels double the ink (OBSERVED)
- **Rule**: a pie communicates composition at one point; comparison across sets or time needs a line/column chart with categories per set
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: one a!pieChartField(style:"DONUT", seriesLabelStyle:"LEGEND"); for year-over-year use a!lineChartField with one series per region

## text_DONT_slices.png

### Principle: Cap pies at 5 slices
- **DO shows**: none paired here — page prescribes broader categories or an "Other" rollup (see text_DO_other.png)
- **DON'T shows**: "Memory Usage" pie with 9 slices; five slivers ≤3.1% crowd the top; a red and a light-blue sliver render with no labels at all; leader lines converge and tangle (OBSERVED)
- **Rule**: >5 slices makes labels drop and slivers unreadable; aggregate small values into "Other" before charting
- **Severity**: always (page: "should not consist of more than 5 slices")
- **Category**: data-display | labeling
- **SAIL implication**: aggregate in the query (top 4 + "Other"), then a!pieChartField; keep every category labeled

## col_DO_time.png

### Principle: Columns for few time intervals
- **DO shows**: "New Customers by Year" — 5 yearly columns 2015–2019, single coral series #e87658 (est.), y 0–6 with light gridlines, no legend (title names the measure) (OBSERVED)
- **DON'T shows**: none — counterpart guidance lives in line_DO_time (many intervals → line)
- **Rule**: with a small number of time buckets (~≤7), columns compare periods more directly than a line
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: a!columnChartField, one a!chartSeries, yearly categories; omit legend for single series

## col_DO_negValues.png

### Principle: Signed data belongs on columns
- **DO shows**: "Net Profits by Flavor" — purple columns #9268c9 (est.) spanning −20…+24 across a zero baseline; losses (Birthday Cake, Blueberry, Caramel) hang below, gains rise above; ascending sort walks loss→gain; category labels sit at chart bottom, clear of downward bars (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: when values can be negative, use a column chart — its y-axis extends below zero and the baseline makes sign instantly legible
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: a!columnChartField; y-axis auto-includes negatives; sort data ascending before binding

## bar_DO_longLabels.png

### Principle: Long category labels → horizontal bars
- **DO shows**: "Customers by Region" — six purple bars #a06cc9 (est.); full-length "City, State" labels ("Overland Park, Kansas") right-aligned beside each bar, untruncated and unrotated; value axis 0–1200 rendered top and bottom (OBSERVED)
- **DON'T shows**: none here — the failure case is text_DONT_longLabels.png (rotated/truncated column labels)
- **Rule**: bars give every label a full row of horizontal space regardless of category count
- **Severity**: usually
- **Category**: data-display | labeling
- **SAIL implication**: a!barChartField instead of a!columnChartField when labels exceed ~15 chars or categories are many

## line_DO_time.png + line_DONT_fiveLines.png

### Principle: Lines for time series — capped at 5
- **DO shows**: "Customers By Region", 4 series over 9 years (2012–2020); distinct hues + distinct markers (blue/circle, green/diamond, yellow/square, orange/triangle est. #6da9dc/#74a85b/#edc949/#dd8b3d); axis titles "Year"/"Number of Customers"; legend below (OBSERVED)
- **DON'T shows**: same chart with 8 series over 4 years — lines cross constantly, the palette recycles ("UK" appears twice, green and yellow), one series name truncates to "Fr"; no single region is traceable (OBSERVED)
- **Rule**: beyond ~5 lines a line chart becomes spaghetti — switch to a column chart or trim series
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: a!lineChartField with ≤5 a!chartSeries; distinct colorScheme; full series names so legend/tooltip stay meaningful

## line_do_scale_new.png

### Principle: Auto-scaled y-axis surfaces small deltas
- **DO shows**: "Customers by Year" single blue line #6da9dc (est.); y auto-scales to 985–1015 so a ±1% fluctuation fills the plot height; markers at each year (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: when differences between points are small, lean on the line chart's automatic y-scaling rather than forcing a zero baseline
- **Severity**: contextual (axis not starting at 0 can exaggerate — pair with labeled axis)
- **Category**: data-display
- **SAIL implication**: a!lineChartField default yAxis auto-min/max. OBSERVED tension: legend reads generic "Chart Series" for a single series — exactly what text_DONT_legend forbids

## line_DO_gaps.png

### Principle: Show missing data as gaps
- **DO shows**: "Shenandoah National Park Yearly Visitors", teal line #3a9188 (est.), 1979–2019 with the line broken over 2013–2015 — no interpolation across the missing years; 45°-rotated year labels; y 750–2000 (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: a visible gap is honest; bridging missing periods fabricates data
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: pass null data points to a!lineChartField — nulls render as breaks; do not zero-fill upstream

## area_DO_none.png + area_DONT_none.png

### Principle: Unstacked areas only when series interleave
- **DO shows**: "Tea and Coffee Sales" — two semi-transparent areas (Tea purple #a973cf, Coffee blue #4aa8d8, both est.) whose lines cross repeatedly 2014–2021; alternating dominance plus translucency makes clear they overlap rather than stack (OBSERVED)
- **DON'T shows**: "New Hires" — Female band #59c2a7 (est.) sits above Male #2e3f6e (est.) every year; it reads as a stacked base+increment, inviting users to sum the bands (OBSERVED)
- **Rule**: if one series always exceeds the other, unstacked areas are ambiguous — use a line chart or explicit stacking with context
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: a!areaChartField(stacking:"NONE") only for interleaving series; otherwise a!lineChartField or stacking:"NORMAL"

## area_DO_stacking.png + area_DONT_stacking.png

### Principle: Stack areas for parts-of-whole; never exceed ~3 series
- **DO shows**: same "Active Users" data twice side-by-side — "Normal Stacking" (y 0–15000; Premium/Basic/Trial bands #7fd4e8/#c9a3e8/#ef5b8c est. accumulate to total trend) vs "Percent to Total Stacked" (y 0–100%, share-only story) (OBSERVED)
- **DON'T shows**: "Sales by Genre" — six unstacked translucent areas; intersections blend into muddy browns; blue "Alternative" is invisible except one 2021 dot; colors no longer map to genres (OBSERVED)
- **Rule**: choose Normal stacking to show totals+trend, Percent-to-total for pure share; with >3 series abandon area charts entirely
- **Severity**: usually
- **Category**: data-display | color
- **SAIL implication**: a!areaChartField(stacking:"NORMAL" | "PERCENT_TO_TOTAL"); series count ≤3

## scatter_DO_compare.png

### Principle: Scatter compares two measures; color adds a third grouping
- **DO shows**: "Average order total compared with salesperson commission" — x Commission (%) 0–2, y order total 10k–40k; ~16 points colored by a secondary region grouping with a 10-item legend below in a 4-column grid (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: use scatter for two related quantitative variables; add a categorical grouping via point color/legend
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: a!scatterChartField with x/y measures plus grouping field driving series colors

## scatter_DONT_compare.png

### Principle: Keep outliers in the plot
- **Marker note**: filename says DONT but the page labels this a DO example (OBSERVED mismatch); analyzed as DO
- **DO shows**: "Risk factors by age of onset" — dense teal #17a08a (est.) diagonal band (ages 20–65) with far-flung outliers retained at ≈(79, 18%) and ≈(88, 53%) (OBSERVED)
- **Rule**: outliers are data; filter only to narrow the whole dataset, never to delete individual points
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: apply a!queryFilter to scope the population, not to prune points that "look wrong"

## scatter_DONT_qualitative.png

### Principle: No qualitative axes on scatter charts
- **DO shows**: none paired — page redirects to bar or pie for qualitative data
- **DON'T shows**: "Order totals by salesperson gender" — gender numerically coded so x shows 1 and 2; points pile into two vertical strips (M #8bc98a, F #17a08a, both est.); horizontal position carries no meaning (OBSERVED)
- **Rule**: scatter axes must both be quantitative (age, income, temperature); categorical comparisons belong on bar/pie charts
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: aggregate per category and use a!barChartField instead of encoding categories as fake numbers

## sort_DO_pie_descend.png + sort_DO_bar_descend.png

### Principle: Sort pies and bars descending by magnitude
- **Shows** (two sibling DOs, same rule): pie "Customers by Region" runs clockwise from 12 o'clock US 41.7% → Asia 27.8% → UK 20.9% → Other 9.7% (#5cb385/#58a4d0/#a86fd1/#e0637f est.); bar "Customers by Region" stacks rows Northeast ≈14.3k down to Southeast ≈3.6k in single coral #e87658 (est.) (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: descending magnitude puts the biggest slice/bar first, making rank and relative size readable at a glance
- **Severity**: usually ("in most scenarios")
- **Category**: data-display
- **SAIL implication**: sort the query descending by measure before binding to a!pieChartField / a!barChartField; charts render data order as-is

## sort_DO_col_ascend.png

### Principle: Sort columns ascending so the eye lands on the max
- **DO shows**: "Sales by Category" teal #3a9188 (est.) columns rising left→right: Tents ≈100 → Clothing ≈1000; y-axis titled "Average Sales per Day"; the tallest column terminates the scan (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: for columns, ascending order emphasizes the largest value (opposite of bar/pie guidance — the reading axis differs)
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: query sorted ascending by measure, then a!columnChartField

## sort_DO_col_time.png

### Principle: Time categories sort by sequence, never magnitude
- **DO shows**: "Sales Performance Year to Date vs. Previous Year to Date" — grouped columns January→April in calendar order; two series (Previous YTD yellow #f5c542, Current YTD coral #e87658, est.) with legend below; April's dip stays visible because order is chronological (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: sequential categories (time) keep their natural order; magnitude sorting would scramble the trend
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: sort by the date/period field ascending in the query; applies to a!columnChartField and a!lineChartField alike

## height_DO_balance.png + height_DONT_mismatched.png

### Principle: Match chart heights to neighboring content
- **DO shows**: "Undergraduate Admissions" dashboard — 3×3 grid of bordered cards where every zone in a row shares one height: KPI bars/columns row ≈ short, then bar+column+gauge row, then bar+donut+table row; nine visualizations, no vertical voids (OBSERVED). Bonus observed details: gauge "663k / 1.4m", data labels on Applicant Status columns, typo "Availalble Funds"
- **DON'T shows**: two side-by-side line charts — "New Users" (pink #e0637f est.) fills ~1300px tall while "App Downloads" (maroon #7a1f3d est.) stops at ~350px, leaving a two-thirds-empty white column below it (OBSERVED)
- **Rule**: side-by-side charts share a height; mismatches read as broken layout and waste viewport
- **Severity**: usually
- **Category**: layout | density
- **SAIL implication**: set the same height value ("SHORT"/"MEDIUM") on sibling chart fields within a!columnsLayout

## height_DO_dashboard_short.png + height_DONT_container.png

### Principle: Size the chart to fit its container and column
- **DO shows**: the Financial Summary dashboard (same screenshot as charts_dashboard.png) with a spotlight overlay on the "Customer Aquisition" line chart — its SHORT height keeps the right-hand column level with the page instead of towering past it (OBSERVED)
- **DON'T shows**: "Availalble Funds (USD)" card where the donut is clipped mid-arc by the card's bottom edge and an inner scrollbar appears on the card (OBSERVED)
- **Rule**: never place a chart in a card too short for it; pick a chart height that keeps its column in balance with the rest of the page
- **Severity**: always (clipping); usually (balance)
- **Category**: layout
- **SAIL implication**: chart height:"SHORT" inside constrained columns; avoid fixed-height a!cardLayout/a!sectionLayout smaller than the chart it wraps

## height_DONT_short.png

### Principle: Interactive charts need tall click targets
- **DO shows**: none paired — page prescribes a taller height for drill-down charts
- **DON'T shows**: "Device Usage per Region" — 5-series stacked columns squashed into a short plot; the Windows/Other slivers atop each column shrink to a few pixels, hopeless as drill-down click targets (series navy/green/blue/purple/pink est. #4463a8/#5cb385/#58a4d0/#a86fd1/#e0637f) (OBSERVED)
- **Rule**: when users click data points to drill in, height buys both legibility and hit area
- **Severity**: usually
- **Category**: data-display | a11y
- **SAIL implication**: height:"MEDIUM"/"TALL" on charts with link/drilldown behavior; never "SHORT"/"MICRO"

## height_DONT_fixedBar.png

### Principle: Let bar charts grow with category count ("Auto" height)
- **DO shows**: none paired — page prescribes Auto height
- **DON'T shows**: "User Login Attempts" — ~20 users forced into a fixed height: bars thin to hairlines and the axis auto-hides every other category label (only User 1, 3, 5…19 remain), so half the rows are unidentifiable (OBSERVED)
- **Rule**: fixed heights silently drop categories/labels; Auto height sizes the chart to the dataset
- **Severity**: always (data is being hidden)
- **Category**: data-display | labeling
- **SAIL implication**: a!barChartField(height:"AUTO") when category count varies with data

## height_DO_microHideAxes.png + height_DONT_data.png

### Principle: Micro height = one simple stat, axes hidden
- **DO shows**: "Customer Satisfaction" — single micro stacked bar, axes fully hidden; three segments (Satisfied #3a86a8, Neutral #3fa189, Not Satisfied #8fc470, est.) plus a legend are the entire chart (OBSERVED)
- **DON'T shows**: "2019 Savings Contribution per Month" — 12 monthly columns crammed into micro height: x labels truncate to "Ja…/F…/M…", the y-axis collapses to "0/480", bars become unreadable chips (OBSERVED)
- **Rule**: micro heights suit one coarse composition read; extensive series/labels need a real chart height
- **Severity**: usually
- **Category**: data-display | density
- **SAIL implication**: height:"MICRO" + showAxes/labels off for glanceable bars; larger heights once labels matter

## color_DONT_fivePlus.png

### Principle: Never more than 5 colors per chart
- **DO shows**: none paired — page prescribes an "Other" rollup (see text_DO_other.png)
- **DON'T shows**: "Application Usage Trends" stacked columns with TEN departments/colors; three near-identical yellows (Sales gold, Purchasing yellow, Production amber) and two greens force constant legend lookups; thin mid-stack bands are unmatchable (OBSERVED)
- **Rule**: past 5 hues, color stops discriminating; merge small categories into "Other"
- **Severity**: always (page states the limit)
- **Category**: color | data-display
- **SAIL implication**: aggregate to ≤5 series before binding; colorScheme lists stay short

## color_DONT_multipleSchemes.png

### Principle: One color scheme per interface
- **DO shows**: none paired — the DO is the dashboard-wide single scheme in charts_dashboard.png
- **DON'T shows**: donut "Application Device Usage" (Desktop blue, Mobile green, Tablet yellow) beside bar "Device Usage by Department" (Desktop yellow, Mobile orange, Tablet red) — same dimension, two palettes, and yellow flips meaning from Tablet to Desktop between charts (OBSERVED)
- **Rule**: multiple schemes distract, and re-used hues with different meanings actively mislead
- **Severity**: always
- **Category**: color
- **SAIL implication**: define one colorScheme (or custom hex list) and pass it to every chart on the page; keep category→color mapping stable

## color_DO_pie_gradient.png + color_DO_col_gradient.png

### Principle: Gradients encode magnitude/order on sorted charts
- **Shows** (two sibling DOs): pie "Opportunity Sources" sorted descending with monotone teal ramp darkest→lightest (Existing Client 45% #12332b → Inbound Call 2% #86c4b1, est.) so darkness mirrors slice size; stacked columns "Monthly Case Assignments" ramp pink→crimson across Open/Pending/Closed (#eb9ebd/#d95c85/#c22e5a est.), tying color depth to workflow stage (OBSERVED)
- **Rule**: use a single-hue gradient only when categories have inherent order (size rank, stage); the ramp itself carries meaning
- **Severity**: contextual
- **Category**: color | data-display
- **SAIL implication**: colorScheme:"RAINFOREST"-style monotone scheme (or ordered custom hexes) + data sorted descending before binding

## color_DO_contrast.png + color_DONT_similar.png

### Principle: Distinct categories need distinct hues — never a gradient
- **DO shows**: "Open vs. Closed Cases" — opposing states in opposing hues: Open orange #e0912f vs Closed blue #2e6da4 (est.); the lines (and a paired spike/dip anomaly ~Feb 22) stay attributable at a glance (OBSERVED)
- **DON'T shows**: "Order Trend by Status" — three constantly-crossing lines in one teal ramp (#7cc4b8/#3f9e8a/#1f6f5c est.); at every intersection the reader must re-derive which teal is Open vs Processing vs Delivered (OBSERVED)
- **Rule**: gradients imply order; unordered/contrasting categories take clearly separated hues, especially on line charts
- **Severity**: usually
- **Category**: color
- **SAIL implication**: multi-line a!lineChartField gets a distinct-hue colorScheme or custom hex list, not monotone ramps

## color_DO_bright.png

### Principle: Bright hero series, muted context series
- **DO shows**: "Customer Acquisition" — New in saturated blue #4a9ff5 (est.) with solid markers; Returning in light gray #cccccc (est.); the eye lands on New's climb while Returning stays available as context (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: reserve one bright primary for the value that matters; demote comparisons to muted neutrals
- **Severity**: contextual
- **Category**: color
- **SAIL implication**: custom series colors — accent hex on the key a!chartSeries, gray on the rest

## color_DO_highlight.png

### Principle: Semantic color singles out the alarming series
- **DO shows**: "Client Case Overview" stacked bars — Open/Pending/Closed share a blue monochrome family (#8ec9f5/#4a90e2/#2e6da4 est.) while Critical alone is red #d9453d (est.); rows with a red segment (Cloudustries, Life Networks) jump out (OBSERVED)
- **DON'T shows**: none paired
- **Rule**: color one series by meaning (red=critical/negative) and keep siblings in a quiet family; mind the hue's connotation
- **Severity**: contextual
- **Category**: color | data-display
- **SAIL implication**: per-series color override on a!chartSeries within one scheme family

## color_DO_transparentBackground.png + color_DONT_transparentBackground.png

### Principle: Transparent charts sit on white cards, and all on the same surface
- **DO shows**: "Personal Budgeting Dashboard" — gray page bg #f0f0f0 (est.) with two bordered white cards, each hosting one chart (blue payment-type columns; category donut); the transparent chart backgrounds read as intentional against uniform white (OBSERVED)
- **DON'T shows**: two adjacent charts on mismatched surfaces — "Users by Age and Gender" on white beside "Users by Month" on gray #ebebeb (est.); the checkerboard makes the transparent charts look broken (OBSERVED)
- **Rule**: since charts have no background (Appian 20.4+), standardize the surface behind them — white cards inside header-content layouts
- **Severity**: usually
- **Category**: color | layout
- **SAIL implication**: wrap each chart in a!cardLayout on the default white style; don't alternate card styles behind charts

## color_DONT_coloredCard.png

### Principle: No charts on saturated card colors
- **DO shows**: none paired — the DO is the white-card treatment above
- **DON'T shows**: "Job Offer Responses" — coral bars #e87658 (est.) on a saturated blue card #3d6da8 (est.) with white title text; the complementary clash vibrates, axis lines vanish, and the card reads as decoration, not data (OBSERVED)
- **Rule**: bright background colors look unprofessional and compete with series colors; keep chart surfaces neutral
- **Severity**: usually
- **Category**: color
- **SAIL implication**: avoid a!cardLayout(style:<accent hex>) around charts; reserve accent card styles for KPIs/callouts without charts

## text_DONT_longLabels.png

### Principle: Rotated, truncated column labels mean wrong chart type
- **DO shows**: none here — the fix is bar_DO_longLabels.png (same "Customers by Region" data as horizontal bars)
- **DON'T shows**: pink #e0457b (est.) columns whose city-state labels rotate 45° and still truncate ("Minneapolis, Minnesota…"); reading requires head-tilt plus guesswork (OBSERVED)
- **Rule**: if x-labels must rotate or truncate, switch to a bar chart rather than styling around it
- **Severity**: usually
- **Category**: labeling | data-display
- **SAIL implication**: a!barChartField replaces a!columnChartField; no SAIL knob fixes rotated labels

## text_DONT_tooltip.png

### Principle: Hidden axes still need defined labels for tooltips
- **DO shows**: none paired
- **DON'T shows**: "Revenue Over Time" — axis-less indigo line #7381c9 (est.) whose hover tooltip reads literal placeholder "[Category 23] / Chart Series: 36"; with axes gone, the tooltip was the last context and it says nothing (OBSERVED)
- **Rule**: when hiding axes, series and category labels must still be populated — they feed the tooltip
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: set a!chartSeries(label:…) and real category values even when showAxes/labels are off

## text_DO_dashboards_axes.png + text_DONT_hideLabels.png

### Principle: Hide axes only where surrounding context substitutes
- **DO shows**: the Financial Summary dashboard (same screenshot as charts_dashboard.png) spotlighting "Top Selling Products By Category" — its per-row bars carry no axes, but product names, in-bar values (80/12…), and a legend supply every needed label (OBSERVED)
- **DON'T shows**: "Applicants by Category" — six berry #9e2a5e (est.) bars with the category axis suppressed despite ample left margin; identifying any row forces a hover ("Out-of-State Freshmen: 400" tooltip) (OBSERVED)
- **Rule**: axis-hiding is for decluttering when labels are redundant — never when space exists and rows are otherwise anonymous
- **Severity**: usually
- **Category**: labeling | layout
- **SAIL implication**: hide axes on micro/embedded charts whose host row provides names; otherwise keep default axis labels

## text_DO_other.png

### Principle: Roll small categories into "Other"
- **DO shows**: "Product Sales by Country" stacked columns capped at exactly 5 series — United States/England/Korea/Canada plus an explicit "Other" (warm ramp #f5c04e/#ee7d51/#c93f55/#952f5e/#6b3060 est.); every band stays thick enough to read (OBSERVED; minor data quirk: x-category "Accessories" appears twice)
- **DON'T shows**: the failure cases are text_DONT_slices.png and color_DONT_fivePlus.png
- **Rule**: when categories exceed the color budget, aggregate the tail into "Other" or broaden the taxonomy
- **Severity**: usually
- **Category**: data-display | labeling
- **SAIL implication**: group in the query (top-N + Other); "Other" is a data-prep artifact, not a chart param

## text_DONT_legend.png

### Principle: Single series → descriptive title, no legend
- **DO shows**: none paired — col_DO_time.png demonstrates the legend-free single-series pattern
- **DON'T shows**: "2018 Quarterly Sales" — four periwinkle #7381c9 (est.) columns plus a one-item legend reading just "Quarter"; it identifies nothing, duplicates the axis, and spends a full row of vertical space (OBSERVED)
- **Rule**: legends exist to disambiguate multiple series; with one series, put the meaning in the chart title
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: a!chartSeries without label + showLegend:false (or omit legend); carry semantics in label/instructions text

## text_DONT_seriesLabel.png

### Principle: Sibling pies share a legend, not per-slice callouts
- **DO shows**: none paired — page prescribes one legend for the row
- **DON'T shows**: donuts "Early Decision" vs "Regular Decision Application Status" — per-slice callout labels (Accepted/Declined/Pending; #f2604d/#c9214e/#f7b84e est.) consume different margins on each chart, so the left donut renders visibly smaller than the right; the row looks misaligned (OBSERVED)
- **Rule**: for multiple pies in a row/column, label via a shared legend so plot areas stay identical
- **Severity**: usually
- **Category**: layout | labeling
- **SAIL implication**: seriesLabelStyle:"LEGEND" (not "ON_CHART") for pie/donut sets; identical height on siblings
