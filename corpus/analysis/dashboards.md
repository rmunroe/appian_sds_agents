# Analysis: dashboards

Page context: "Dashboards" pattern (section: patterns). This page also embeds `sales_dashboard_dark_theme.png` (dark-theme cognitive-load example; its SAIL source lives here — see also content-structure/primary_heading_highlight.png which annotates the same dashboard) and `co2_cso_landing_page.png` (page-level filters example with SAIL here) — both analyzed under their primary pages; their code-verified palettes (#17202b + PLUM_SCHEME + RAINFOREST; #dbf1d3 billboard + greens #59C968/#41934B/#117D20) are available in this page's source. Only the column-distribution image is analyzed below (no SAIL for it on this page).

## dashboards-focusing-user-attention.png

### Identification
- **Image**: dashboards-focusing-user-attention.png | **Source page**: dashboards | **Alt/caption**: "Example of a dashboard displaying metrics for award cycle time." (heading: "Providing the right amount of detail with column distribution")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-operational (process-performance report with work queue)

### Use-case reconstruction (INFERRED)
- **Persona**: procurement/contracting operations manager, weekly-manager reviewing award cycle performance against thresholds
- **Domain & brand context**: government/enterprise procurement (Boeing, Lockheed Martin, Xerox vendors; $12M awards); neutral Appian-demo branding, light theme
- **Top 3 user tasks (ranked)**: 1. Judge whether cycle time is trending under the 67-day threshold 2. Find which phase drags (Awaiting Signature +5d, Draft +8d) and act (EDIT THRESHOLD) 3. Drill into individual slow awards via filters/grid
- **Implied requirements**: "Trend vs threshold must be the largest graphic"; "Phase-level breakdown must sit beside the trend"; "Must name the worst offenders (Awards with Longest Cycle Times)"; "Grid must expose per-phase day counts, filterable by dept/vendor/officer/spend"; "Insight rail must translate charts into verdicts ('Great overall progress!')"
- **Data model sketch**: Award{id HT98200012…, amount $12,234,234.12, releaseDate, requestingDept, vendor, contractingOfficer, timeInDraft, timeUnderReview, timeApproved, timeAwaitingSignature, totalCycleTime}; aggregates: awards 185, avg 56 days, threshold 67, per-phase averages; period July 2022–July 2023

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ nav: SPEND DASHBOARD | PROCESS DASBOARD (active, blue underline)
└─ COLUMNS [≈3:1]
   ├─ PANE[main] "Award Cycle Time Report" + period label
   │  ├─ COLUMNS [≈2:1]
   │  │  ├─ CARD(CHART(line) "Avg Cycle Time by Month" + threshold dash line)
   │  │  └─ KPI-ROW ×2 (Awards 185 · Avg 56 Days) above CARD(CHART(donut) per phase)
   │  ├─ filter row ×5 dropdowns
   │  └─ GRID(11-col, 3+ rows: per-phase day columns)
   └─ PANE[right]
      ├─ CARD(illustration + "Great overall progress!" + EDIT THRESHOLD btn)
      ├─ SECTION "Areas to Improve" → warning cards ×2
      └─ SECTION "Awards with Longest Cycle Times" → ranked list
```
- **Above the fold**: line chart, both KPIs, donut, verdict card, Areas to Improve, filter row, first grid rows
- **Reading order**: Z — title→trend chart→KPIs/donut, then right rail verdicts, then grid
- **Hierarchy rationale**: the line chart gets the single widest column because trend-vs-threshold is task 1; KPIs+donut share a medium column — supporting detail, not the lead (the page's stated lesson: unequal columns = right amount of detail per graphic); prose verdict + warnings occupy the narrow rail so interpretation never crowds data
- **Density**: 4 — 2 charts, 2 KPIs, 5 filters, 11-column grid, 2 warning cards, ranked list in one viewport, but white space keeps it below trading-desk
- **Ratios & spacing**: main:rail ≈ 3:1; within main, chart:stats ≈ 2:1; grid columns sized to content (Amount right-aligned wide, day-counts narrow); card padding ≈ STANDARD with light #f2f2f7 (est.) card fills

### Styling specifics (OBSERVED — no SAIL for this image)
- **Palette**: page #ffffff, panel fills #f7f7fb (est.), trend line + primary buttons royal blue #2726dd (est.), donut: Draft #2726dd (est.) / Under Review #a878ea (est.) / Approved #eaa84c (est.) / Awaiting Signature #6fa8b8 (est.), warning tiles amber icon #eaa84c (est.) on cream #fdf3e3 (est.), links #2745e0 (est.), threshold dash-dot #444 (est.), text #1f1f1f / #6b6b73 (est.)
- **Color application points**: one blue for line series, active tab, EDIT THRESHOLD, Award ID links (action color = data color); donut is the only multi-hue element; amber reserved for "needs improvement"; grid is colorless
- **Typography moves**: KPI numerals ≈ LARGE_PLUS/EXTRA_LARGE with unit suffixes ("56 Days") in STANDARD gray; card titles STANDARD/MEDIUM sentence-case; filter placeholders all-caps SMALL; rank numbers in small blue squares; period label right-aligned gray
- **Imagery stance**: one flat-style illustration (trophy/steps, blue-suit figures) softening the verdict card — the only decorative element
- **Card treatment**: flat very-light-gray fills, no borders/shadows (est. style:"#F7F7FB", showBorder:false)
- **Signature moves**: instead of equal-width chart cards, column widths scale to each graphic's information need (line chart wide, donut medium, verdict narrow) — the page's teaching point; instead of leaving interpretation to the reader, a prose verdict card ("80% of your awards were processed under the threshold of 67 days") plus warning cards convert analytics into calls-to-action; threshold drawn as a reference line inside the trend rather than a separate KPI; ranked "longest cycle times" list names the tail, complementing averages

### Component inventory (INFERRED — no SAIL)
- a!lineChartField(xAxis months, referenceLine threshold ≈ a!chartReferenceLine), KPI pair ≈ a!richTextDisplayField stacks or a!kpiField, a!pieChartField(style:"DONUT", seriesLabelStyle:"LEGEND", custom colorScheme), a!dropdownField ×5 filter row, a!gridField 11 columns with link column (Award IDs), right rail a!cardLayout stack + a!buttonWidget(style:"SOLID") EDIT THRESHOLD, warning cards ≈ cardLayout with amber stamp/icon, ranked list with numbered stamps
- Chart custom colorScheme: yes (blue/purple/amber/teal quartet, est.)
- Interactive affordances: filters, sortable grid, Award ID record links, EDIT THRESHOLD action, chevron drill-ins on warning cards

### Character & judgment
- **Register**: utilitarian-ops + authoritative-executive — operational grid below, verdict-first executive rail beside
- **Why it works**: unequal columns give the trend chart room for 12 monthly points while the donut needs none (cited lesson); the amber "Areas to Improve" cards point at exactly the two donut slices that exceed threshold, closing the loop between chart and action; per-phase grid columns let a manager verify any aggregate by eye
- **Why not boring**: prose verdict card with illustration instead of a fourth chart; threshold as in-chart reference line; ranked worst-offender list; phase color carried from donut to warnings (Awaiting Signature teal → named in amber card)
- **Boring twin**: four equal-width chart cards in a 2×2 grid, no threshold line, no verdicts, and a separate "Reports" page for the grid — every graphic same size, user does all the interpretation.
- **What to steal**: size columns to information density, not symmetry; pair every analytic chart with a named "so what" card; put threshold semantics inside the chart
- **Risks**: "PROCESS DASBOARD" typo in nav (OBSERVED); amber-on-cream warning text ≈ 3:1 (est.) contrast; 11-column grid will scroll or crush on tablet; donut relies on legend colors alone (no data labels)

### Code cross-check
- none for this image — the two SAIL blocks on this page belong to sales_dashboard_dark_theme.png and co2_cso_landing_page.png (analyzed under their primary pages)
