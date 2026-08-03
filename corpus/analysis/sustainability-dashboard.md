# Analysis: sustainability-dashboard

## co2_cso_landing_page.png

### Identification
- **Image**: co2_cso_landing_page.png | **Source page**: sustainability-dashboard (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) sustainability dashboard"
- **Device frame**: desktop (3360x2100 = 2x retina 1680x1050; site chrome visible)
- **Marker**: neutral
- **UI type**: dashboard-executive
- Tier A as suggested (no override).

### Use-case reconstruction (INFERRED)
- **Persona**: Chief Sustainability Officer / ESG program lead (filename `co2_cso_landing_page`); monthly-exec cadence.
- **Domain & brand context**: "Möller" — industrial/manufacturing corporate running a net-zero program; mission-forward optimism, entirely green-coded.
- **Top 3 user tasks (ranked)**: 1. Check headline net-zero progress (actual vs offsets vs net). 2. Spot categories off-track vs target (Transportation is over). 3. Slice trends by period/country/region for reporting.
- **Implied requirements**: "Must show actual, offset, and net impact before scrolling"; "Must flag categories exceeding annual target"; "Must expose reporting-coverage caveats"; "Must slice by year/country/region and break down by category, scope, month".
- **Data model sketch**: EmissionRecord(category: Energy|Transportation|Waste, scope 1–3, month, year, country, region, MTCO2e); CategoryTarget(year, target: 257K/78K/34K); OffsetLedger; ReportingCoverage(%). OBSERVED: 314,519 − 219,482 = 95,037 (net = actual − offsets); the three category cards sum to 314,519 exactly.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=TRANSPARENT
├─ BILLBOARD h≈300(SHORT_PLUS) overlay=full,MIDDLE,NONE bg=#dbf1d3+illustration-right
│  ├─ title MEDIUM_PLUS + underscore rule #93c47d
│  └─ COLUMNS [WIDE_PLUS:MEDIUM_PLUS-spacer(DESKTOP_WIDE)]
│     └─ COLUMNS ×3 dividers — KPI trio icon+number LARGE_PLUS
├─ CARD(filter band #85c47d, borderless) — SBS calendar+dropdown | spacer | globe+2 dropdowns
├─ COLUMNS [1:1:1] — SECTION ×3 → CARD(number LARGE + tag + bullet-progress, shadow)
├─ COLUMNS [1:1:1] — SECTION ×3 → CARD(CHART(area) | CHART(donut) | CHART(donut))
└─ SECTION "Emissions per Unit Produced" → CARD(equation strip, stamps, +/=)  [below fold]
```
- **Above the fold**: everything except the equation strip — nav, billboard KPIs, filter band, three target cards, three charts.
- **Reading order**: F — title→KPI trio across, filter band, then two 3-column sweeps.
- **Hierarchy rationale**: mission statement biggest — the page sells a goal, not a queue; hero KPIs at LARGE_PLUS keep net progress pre-scroll (task 1); target bullets above diagnostic charts — exceptions (task 2) beat exploration (task 3).
- **Density**: 3 — balanced: 7 content modules + 3-KPI hero per viewport, comfortable padding, airy billboard.
- **Ratios & spacing**: equal-thirds rows; billboard `marginBelow:"NONE"` glued to filter card (`marginBelow:"LESS"`, `padding:"STANDARD"`); cards `marginBelow:"STANDARD"` (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page bg `TRANSPARENT` (site default ≈#fafafa est.); cards white; billboard #DBF1D3; filter band #85C47D; dark green ink #274E13; bright accent #47B311; rule #93C47D; chart ramp #59C968/#41934B/#117D20/#0A4A13; on-track blue #3A77E9; over-target `NEGATIVE`; caveat orange #FF9900; neutral `SECONDARY`. Site-chrome logo green ≈#1e8035 (est.).
- **Color application points**: billboard bg + filter band (two-tone header stack); year accent; KPI icons; big numbers; all chart series; progress bars (status); tag backgrounds; filter icons. Buttons: none.
- **Typography moves**: title MEDIUM_PLUS (STRONG mixed inline); KPI numbers LARGE_PLUS with STANDARD-size "MTCO2e" units; card numbers LARGE STRONG; section headers as real H2s (`labelHeadingTag`); all-caps SMALL kicker labels everywhere ("2021 ACTUAL IMPACT", "TARGET").
- **Imagery stance**: flat vector city/wind-turbine illustration in billboard (OBSERVED only — no `backgroundMedia` in code); duotone green icons; avatar photo in chrome.
- **Card treatment**: `showBorder:false, showShadow:true` white cards; filter card flat filled #85C47D borderless.
- **Signature moves**: instead of default chart palette, one brand-green ramp via `a!colorSchemeCustom` on all charts; instead of a gauge, paired `a!progressBarField`s in `spacing:"NONE"` columns with `showDividers:true` — the divider is the target tick, the second bar red overflow; instead of a toolbar, a borderless colored card fused under the billboard as a filter band; instead of a section divider, an underscore-string richTextItem rule; an empty MEDIUM_PLUS spacer column protects the background art.

### Component inventory (CODE-VERIFIED)
- 1 `a!billboardLayout(backgroundColor:"#dbf1d3", height: SHORT_PLUS desktop / MEDIUM phone, a!fullOverlay(style:"NONE"))`; 8 cardLayout; 7 sectionLayout (`labelHeadingTag:"H2"`); 6 progressBarField (`style:"THICK"`, `showPercentage:false`; pairs 79/−1, 100/10, 72/−1); 3 tagField SMALL; 3 dropdownField (COLLAPSED, `searchDisplay:"AUTO"`); 5 stampField TINY (bolt/plug/truck-moving/trash/smog); 33 richTextDisplayField; 41 `a!isPageWidth` forks.
- Charts: `a!areaChartField(stacking:"NONE")` + 2 `a!pieChartField(style:"DONUT", seriesLabelStyle: ON_CHART desktop / LEGEND narrow)`; custom colorScheme yes ×3.
- Interactive: 3 filter dropdowns; Energy card has `link: a!dynamicLink()`; chart tooltips+legend; site-chrome tabs (not SAIL).

### Character & judgment
- **Register**: authoritative-executive + warm-community — board-grade KPIs delivered in optimistic mission-brand green with a friendly illustration.
- **Why it works**: one green hue family carries brand through data (all charts share the ramp); exceptions pop because red `NEGATIVE` overflow is the only non-green data ink; net-zero arithmetic is legible (actual − offsets = net across the hero).
- **Why not boring**: monochrome custom chart ramp instead of default multi-hue; hand-built bullet charts from paired progress bars + column divider; KPIs live inside the billboard as a hero infographic, not a card row; #FF9900 coverage tag fires only when data is incomplete (100% goes gray); equation strip renders per-unit math as literal "a + b + c + d = total".
- **Boring twin**: a white header titled "Sustainability Dashboard", default bordered KPI cards, default blue/orange charts, filters in a gray toolbar, targets as "79% of target" text — no hero, no target ticks, no color system.
- **What to steal**: define one `a!colorSchemeCustom` brand ramp and reuse it on every chart; build target-vs-actual bullets from paired progressBars (`spacing:"NONE"` + `showDividers:true`); fuse a colored borderless card under a billboard as a full-bleed filter band.
- **Risks**: #47B311 on #DBF1D3 ≈2.5:1 — survives only as large bold display text; adjacent donut greens hard to separate under CVD (ON_CHART labels mitigate); status by hue alone (blue vs red bars); bullets show target value ("257K") but no scale; SMALL all-caps SECONDARY labels run low-contrast.

### Code cross-check (`guidance/sail/sources/sustainability-dashboard.sail`, 1513 lines)
- **Code-verified palette**: the 11 hexes above + NEGATIVE/SECONDARY/TRANSPARENT — full census.
- **Notable techniques**: bullet-chart hack — paired progressBars, overflow bar −1 (empty) or 10+NEGATIVE when over target (L626–656 ×3); spacer column shown only DESKTOP_WIDE (L410–411); underscore rule mixing SMALL/STANDARD sizes (L78–81); phone-only duplicate labels + `showDividers: if(PHONE, false, true)` on the KPI trio (L403); equation strip with EXTRA_NARROW "+"/"=" columns and TINY stamps (L1183–1499).
- **Corrections**: image says "2035", code "2025" (L37) — asset drift; billboard illustration exists only in pixels (no `backgroundMedia`; the spacer column is its only trace); bars are #3A77E9, not semantic ACCENT; only Energy card has `link` (L673); pie demo data doesn't reconcile with card figures (placeholders reuse hero numbers).
