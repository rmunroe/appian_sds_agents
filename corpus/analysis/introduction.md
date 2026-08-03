# Analysis: introduction

Page context: "How to Use Patterns" is meta-guidance. Its five images are showcase renderings of other SDS example UIs plus two planning artifacts, each illustrating a process principle (browse patterns, site-map first, pick per-page patterns, express hierarchy, be consistent). No SAIL source on this page — all palettes pixel-estimated unless cross-referenced.

## image3.png

### Identification
- **Image**: image3.png | **Source page**: introduction | **Alt/caption**: none; nearest heading "Start all of your designs by browsing for ideas and best practices"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal / record-view — customer self-service account overview ("My Account", INSURECORP). Tier A confirmed. INFERRED: same UI as the `customer-acct-management` pattern (`insurance_account_page.png`); treat that analysis as canonical, this as the intro-page showcase.

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — auto-insurance policyholder checking billing/coverage a few times a year.
- **Domain & brand context**: consumer insurance carrier "INSURECORP"; trustworthy, restrained corporate brand.
- **Top 3 user tasks (ranked)**: 1. Confirm next payment amount/date and autopay status. 2. Review insured drivers and per-vehicle coverage. 3. Jump to Claims/Preferences or edit details.
- **Implied requirements**: "Must show next payment amount + due date without interaction"; "Must confirm autopay at a glance"; "Must list drivers with household roles"; "Must summarize per-vehicle deductibles/limits with expansion"; "Every data group needs an inline Edit".
- **Data model sketch**: Account 1—1 Payment ($123.45, due July 1, source Pine Street Bank xxxx3456, autopay flag); Account 1—N Driver (name, role PRIMARY/SPOUSE/DEPENDENT CHILD, age, sex) ×3; Account 1—N Vehicle (2021 Polestar 2, 2009 Saab 9-5) 1—N Coverage (Comprehensive/Collision/Bodily Injury/Property Damage; deductible, limits).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈270 style=flat-#1355cc content=brand-bar + title "My Account"
│  └─ TABS ×3 (Overview | Claims | Preferences) on billboard bottom edge
└─ COLUMNS [1:1]
   ├─ SECTION "Payment" → CARD(amount SBS due-date; source + AUTOPAY chip)
   │  SECTION "Insured Drivers" → CARD(3 avatar rows + Edit)
   └─ SECTION "Vehicles & Coverage" → CARD(2 vehicle blocks, SBS [vehicle : coverage list], Show More)
```
- **Above the fold**: everything — single-viewport design.
- **Reading order**: Z — title → Payment (top-left) → Vehicles (right) → Drivers.
- **Hierarchy rationale**: Payment first/top-left because money due is the #1 visit reason; $123.45 rendered as the page's only big number; coverage detail gets the full right column as scannable reference (task 2).
- **Density**: 2 — three content cards per viewport, generous margins, large title band.
- **Ratios & spacing**: columns ≈[1:1]; card padding ≈STANDARD/MORE; section titles sit OUTSIDE cards; hairline dividers between card rows.

### Styling specifics (OBSERVED, est.)
- **Palette**: primary #1355cc (est.) — header band, links, chip; page bg #f0f0f0 (est.); cards #ffffff; active-tab underline #65c7ee (est.); avatar identity colors #e02e8b / #0d8bf1 / #559a38 (est.); labels mid-gray ≈#6e6e6e (est.); text near-black.
- **Color application points**: full-bleed header billboard; tab underline; AUTOPAY solid tag; Edit/Show More links; driver initial avatars. Data itself is grayscale.
- **Typography moves**: page title ≈EXTRA_LARGE white on blue; section headers ≈MEDIUM bold; ALL-CAPS SMALL gray eyebrow labels (NEXT PAYMENT, PAYMENT SOURCE, PRIMARY, VEHICLE 1); amount + names ≈MEDIUM_PLUS bold; body STANDARD.
- **Imagery stance**: no photos except chrome avatar; colored initial avatars for drivers.
- **Card treatment**: flat white, faint shadow/hairline, square corners.
- **Signature moves**: instead of a thin white toolbar, the page title lives in a solid brand-blue billboard with tabs on its bottom edge; instead of a drivers table, eyebrow-role + colored initial-avatar rows (sideBySide); instead of "Autopay: on" text, a solid #1355cc tag beside its plain-language explanation; eyebrow ALL-CAPS labels over bold values create hierarchy with zero extra chrome.

### Component inventory (INFERRED)
- a!headerContentLayout with colored header/billboard + tab pattern; a!columnsLayout [1:1]; a!cardLayout flat; a!sideBySideLayout rows; a!tagField (solid AUTOPAY); a!richTextDisplayField (caps eyebrows, values); link fields for Edit/Show More. Charts: none. Interactive: tabs ×3, per-group Edit links, Show More expanders.

### Character & judgment
- **Register**: calm-clinical + institutional — one restrained hue, generous space; a reassuring billing surface.
- **Why it works**: single accent reserved for identity+action makes Edit/AUTOPAY pop from grayscale data; eyebrow-label rhythm makes every card scan identically; [1:1] split maps to "what I owe" vs "what I'm covered for".
- **Why not boring**: saturated full-bleed billboard header; #65c7ee two-tone tab underline on the blue; hue-coded initial avatars; coverage as typographic label/value stacks, not a grid.
- **Boring twin**: white top bar, black "Account" H1, three stacked bordered tables (Payments, Drivers, Vehicles), default blue links, no chips or avatars.
- **What to steal**: 1) Eyebrow ALL-CAPS label + bold value pattern. 2) Billboard header carrying page tabs. 3) Reserve the accent hue strictly for interaction and status.
- **Risks**: gray caps labels near AA floor on white; [1:1] columns must stack on phone; underline cyan is decorative-contrast only.

### Code cross-check
- none on this page (see customer-acct-management analysis for the canonical version).

## image5.png

### Identification
- **Image**: image5.png | **Source page**: introduction | **Alt/caption**: none; nearest heading "Choose the best design pattern for each page or component type"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical (ESG/sustainability). Tier A confirmed. INFERRED: same UI family as the `sustainability-dashboard` pattern (`co2_cso_landing_page.png`) — variant data (offsets 47,178; net 267,341) and simpler top nav (Möller logo + OVERVIEW/PLANTS/REPORTS), no per-unit equation strip.

### Use-case reconstruction (INFERRED)
- **Persona**: sustainability program lead / monthly-exec reviewing net-zero progress per site.
- **Domain & brand context**: German industrial firm "Möller" (Düsseldorf plant selector); mission-forward, all-green brand.
- **Top 3 user tasks (ranked)**: 1. Check the net-zero arithmetic (actual − offsets = net). 2. Spot categories over target (Transportation). 3. Diagnose via time/category/scope breakdowns after slicing year+site.
- **Implied requirements**: "Must show actual/offsets/net before scrolling"; "Must flag any category exceeding its target"; "Must filter by reporting period and location"; "Must break emissions down by month, category, and GHG scope"; "Must keep the 2035 goal visible".
- **Data model sketch**: EmissionRecord(month, year, site, category ∈ Energy|Transportation|Waste, scope 1–3, MTCO2e); CategoryTarget (257K/78K/34K); OffsetLedger (47,178). OBSERVED: 203,194+85,853+25,472 = 314,519 (cards sum to actual); 314,519−47,178 = 267,341 ✓.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ Utility bar white: logo(green block) + TABS ×3 + avatar
├─ BILLBOARD h≈300 bg=#dbf0d2 content=title+rule, KPI-ROW ×3 (icon+number), illustration right
├─ CARD(filter band #85c47d) — SBS calendar-dropdown | globe-dropdown
└─ GRID(3-col ×2)
   ├─ CARD(KPI+bullet Energy) CARD(Transportation) CARD(Waste)
   └─ CARD(CHART(stacked-area)) CARD(CHART(donut category)) CARD(CHART(donut scope))
```
- **Above the fold**: hero KPIs, filter band, bullet-card row; chart row partially.
- **Reading order**: F — hero trio left→right in equation order, filter band, then two 3-column sweeps.
- **Hierarchy rationale**: the three hero numbers ARE program status (task 1); target bullets next (task 2 exceptions); diagnostic charts last (task 3).
- **Density**: 3 — nine modules per viewport but airy hero; balanced product UI.
- **Ratios & spacing**: equal thirds; billboard fused to filter band (no gap); cards STANDARD padding, thin borders.

### Styling specifics (OBSERVED, est.; palette CODE-VERIFIED on the sustainability-dashboard page)
- **Palette**: hero band #dbf0d2 (est.), filter band #85c47d (est.), brand/logo green #117d21 (est.), KPI ink #284e13 (est.), area ramp #b0e4b4/#7abc80/#4d9c52 (est.), donut greens #58c969→#117d21 (est.), on-track bullet blue #3977e8 (est.), over-target red #de0037 (est.), page bg #f0f0f0 (est.), cards #ffffff.
- **Color application points**: two-tone green header stack (pale hero over saturated filter strip); green icons+numbers in hero; every chart series green-monochrome; red appears ONLY on the Transportation over-target bullet; blue only on in-target bullets.
- **Typography moves**: title as a sentence with bold green emphasis ("Net-Zero Carbon **2035**") ≈MEDIUM_PLUS; hero numbers EXTRA_LARGE with SMALL "MTCO2e" unit suffix; ALL-CAPS SMALL eyebrows ("2021 ACTUAL IMPACT"); card KPIs LARGE_PLUS; section headers MEDIUM bold.
- **Imagery stance**: flat vector landscape (city, wind turbines, road, car) filling the hero's right half; small duotone green icons.
- **Card treatment**: white, thin gray border, flat, square.
- **Signature moves**: instead of white header+gray toolbar, layered tonal bands (#dbf0d2 billboard + #85c47d borderless filter card); instead of a generic title, the goal year embedded and emphasized; instead of default multicolor charts, one green ramp everywhere so the lone red bullet is the loudest pixel; instead of plain progress bars, bullet graphs with target ticks (value bar + marker + remainder).

### Component inventory (INFERRED)
- a!billboardLayout (or colored card) hero; rich-text KPI trio with icons; a!dropdownField ×2 inside a colored borderless a!cardLayout; a!columnsLayout thirds; a!areaChartField stacked + custom colorScheme; a!pieChartField DONUT ×2 custom greens; bullet bars ≈ paired a!progressBarField composition. Interactive: 3 top tabs, 2 filter dropdowns, chart tooltips.

### Character & judgment
- **Register**: authoritative-executive + warm-community — board numbers wrapped in optimistic mission green.
- **Why it works**: KPI order encodes the domain equation; monochrome discipline gives the single red bar total salience; per-category target ticks turn tonnage into pass/fail judgment.
- **Why not boring**: tonal band stack; illustration living inside a data hero; goal-year typography; strict one-hue chart system.
- **Boring twin**: "Emissions Dashboard" in black on white, six identical bordered cards, default blue/orange series, filters in a gray toolbar, no offsets/net framing.
- **What to steal**: 1) One brand ramp for every chart; reserve one alarm hue. 2) Order hero KPIs as the domain equation. 3) Fuse a colored borderless filter card under the billboard.
- **Risks**: white dropdown text on #85c47d borderline AA; red/green status pairing needs the tick-position cue for CVD; hero illustration crowds tablet widths.

### Code cross-check
- none on this page (see sustainability-dashboard analysis: billboard #DBF1D3, band #85C47D, ink #274E13, ramp #59C968/#41934B/#117D20 CODE-VERIFIED there).

## image76.png

### Identification
- **Image**: image76.png | **Source page**: introduction | **Alt/caption**: none; nearest heading "Use a top-down site map to facilitate project planning"
- **Device frame**: none (diagram canvas)
- **Marker**: neutral
- **UI type**: other — planning artifact. **Tier override**: listed A by dimensions, but this is a site-map tree diagram on a dark canvas, not a UI screenshot; analyzed as a diagram at reduced depth (persona/styling template fields don't apply).

### What it shows (OBSERVED)
- App: "Response Hub" (workplace COVID-response hub). Root → 5 top-level site tabs: Incidents, Activity, People, Facilities, Configure.
- Branches: Incidents → All Incidents, Incidents Report. Activity → Pass Requests, Surveys, Isolation Updates, Individual Tests, Pool Tests, Community Help. People → Users, Request Tests. Facilities → Facilities Information, Manage Facilities. Configure → ~20 admin leaves (Manage Site Features, Branding, Incident Options, Cohorts→Manage Cohorts, Pass Request Questions→Add Question, Isolation Update→{Add Question, Edit Prompt Message}, Preview Questionnaire, Guidelines→Add a Guideline, Announcements→Post Announcement, Group Management, Facilities/Manage Facilities, Areas→Add Area, Departments→Add Department, Volunteer Options→Add Category, Survey Questions→Add Question, Helpful Links→Add Link, Policy Documents→Attach New File, COVID-19 Testing→Edit Message, Automated Isolation Removal).
- **Node color encoding** (est.): canvas #222222; root teal #41caac; site-tab level blue #0091ff; page nodes magenta #b420dd; action/task leaves white #ffffff; connectors #616161 with dot junctions. Depth ≤3 throughout.

### Teaching content (INFERRED)
- Visualizes exactly the page-text planning questions: which sites/tabs, which pages get secondary navigation, which actions hang off each page. Node color = artifact type (tab vs page vs action), so navigation mechanism is decided before any UI is drawn.
- The deliberately lopsided Configure branch (~20 leaves vs 2–6 elsewhere) demonstrates how a site map exposes admin sprawl early — a cue to consolidate into a settings pattern before build.
- **What to steal**: color-code node types when sketching; keep depth ≤3; treat branch imbalance as a design smell to resolve up-front.

## image81.png

### Identification
- **Image**: image81.png | **Source page**: introduction | **Alt/caption**: none; nearest heading "Aim for consistency across UIs"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-operational — federal awards management home ("Active Awards", Appian-branded demo). Tier A confirmed.

### Use-case reconstruction (INFERRED)
- **Persona**: daily-operator — contracting officer/specialist managing a federal award portfolio (NASA-style numbers "80AFRC…"), in it every day.
- **Domain & brand context**: government acquisition / aerospace vendors (Lockheed Martin, Blue Origin, Rolls Royce); institutional navy Appian brand.
- **Top 3 user tasks (ranked)**: 1. Triage expired/expiring awards. 2. Find awards by CO/CS/date; add, import, bulk-update. 3. Monitor FY funds obligated/spent and socio-economic targets.
- **Implied requirements**: "Must flag expired/expiring-soon inline in the list"; "Must filter by contracting officer, specialist, and date range"; "Must support bulk selection with toolbar actions"; "Must show FY funds obligated vs budget and spent vs obligated"; "Must track 8(a)/Small Business/WOSB/SDVOSB set-aside progress"; "Must keep 12+ rows scannable".
- **Data model sketch**: Award(number, vendor, CO, CS, period 01/01/2020–12/31/2021, amount, derived expiry status) ×112 active (76 on track / 13 expiring / 23 expired); FY2021 Funds(obligated $400M/$500M = 80%, spent $250M/$400M = 63%); SocioEconomicTarget(category, actual, goal, %).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ Utility bar #010a50: appian logo + TABS ×4 + avatar
└─ COLUMNS [3:1]
   ├─ SECTION "Active Awards"
   │  ├─ FILTER-ROW (search, 2 dropdowns, date-range) + toolbar (+ADD, IMPORT, UPDATE-disabled)
   │  └─ GRID(6-col, 12+ rows, checkbox selection, two-line cells)
   └─ PANE[right]
      ├─ CARD("Awards by Status": KPI 112 + legend + stacked bar)
      ├─ CARD("Funds Obligated": donut 80% + $400M/$500M)
      ├─ CARD("Funds Spent": donut 63% + $250M/$400M)
      └─ CARD("Socio-Economic Targets": 4 labeled progress bars)
```
- **Above the fold**: filters, ~8 grid rows, status card, most of Funds Obligated.
- **Reading order**: F — filter row, then grid rows; right rail scanned as a summary column.
- **Hierarchy rationale**: the grid takes ~75% width because the award list IS the work queue; urgency pills sit inside rows so triage needs zero clicks; analytics demoted to a narrow rail.
- **Density**: 4 — 12+ compact grid rows plus four analytics cards per viewport; a working tool.
- **Ratios & spacing**: [3:1]; two-line grid cells; rail cards STANDARD padding, tight stack.

### Styling specifics (OBSERVED, est.)
- **Palette**: navy #010a50 (est.) — nav bar, award-number links, donut fills, target bars, stacked-bar darkest segment; status tint ramp #495696 / #6978c9 / #97a1d9 (est.); alert red #df0036 (est.); warning amber #ffc13e (est.); page bg #f0f0f0 (est.); cards/table #ffffff–#fafafa.
- **Color application points**: one navy carries brand + links + all data viz; red/amber appear ONLY as status pills, clock glyphs, and countdown microcopy; legend dots reuse the ramp.
- **Typography moves**: section headers MEDIUM_PLUS bold; KPI "112" EXTRA_LARGE navy with SMALL caps "TOTAL ACTIVE"; grid data STANDARD, award numbers bold link-styled over SMALL gray vendor lines; ALL-CAPS toolbar buttons and pill labels; money right-aligned bold.
- **Imagery stance**: none; small glyph icons (clock, building) only.
- **Card treatment**: white, hairline border, flat, square.
- **Signature moves**: instead of a status text column, solid pills + derived countdown microcopy ("Expires in 30 days" with clock icon) under the date; instead of three unrelated status hues, a single-navy tint ramp for legend + stacked bar; instead of wide tables, two-line cells (bold number over gray vendor); donut gauges echo the exact nav navy, welding chrome and data into one identity.

### Component inventory (INFERRED)
- a!gridField (selectable, rich-text two-line cells, link column); a!textField search + 2 a!dropdownField + 2 a!dateField filter row; a!buttonArrayLayout toolbar with icons and a disabled state; a!tagField pills (solid #df0036 / #ffc13e); rail: rich-text KPI + stacked horizontal bar (custom ramp), donut gauge pairs (pie DONUT + SBS big % / values), a!progressBarField ×4 navy with %-labels. Custom colorScheme: yes (navy tints). Interactive: row checkboxes, award links, filters, toolbar actions.

### Character & judgment
- **Register**: utilitarian-ops + institutional.
- **Why it works**: color+text redundancy (pill hue AND countdown words) makes triage colorblind-safe; [3:1] keeps analytics glanceable without stealing queue width; monochrome ramp keeps four viz zones calm beside a busy grid.
- **Why not boring**: navy-everywhere identity vs surgically-placed red/amber; two-line cells doubling density; derived urgency microcopy instead of raw dates; iconed ALL-CAPS toolbar fused to the filter row.
- **Boring twin**: full-width grid, status as a plain text column, charts stacked below the fold in default multicolor, filters hidden behind a "Filters" button, no countdowns.
- **What to steal**: 1) Derive urgency text from dates and pair it with the pill. 2) Build status ramps as tints of one brand hue. 3) [3:1] queue+rail composition for operator homes.
- **Risks**: #6978c9 vs #97a1d9 legend steps are close; white-on-#df0036 near the 4.5:1 line at pill size; 6-column grid needs a phone alternate; disabled UPDATE affordance is low-contrast.

### Code cross-check
- none on this page.

## image94.png

### Identification
- **Image**: image94.png | **Source page**: introduction | **Alt/caption**: none; nearest heading "Clearly express information hierarchy"
- **Device frame**: desktop
- **Marker**: neutral (annotated teaching figure)
- **UI type**: dashboard-analytical skeleton inside site chrome. Tier A shape (full page) but analyzed at reduced depth: content zones are intentionally blank placeholders and the image carries red numbered callouts — it is a wayfinding diagram, not a finished UI. Noting this as a partial override of depth, not tier.

### Callout mapping (OBSERVED → page text)
- **1 → page title**: arrow to the H1 "Dashboard" ("Display a descriptive page title", see Page Titles).
- **2 → section identification**: arrow to the "Expenses" section header — bold MEDIUM titles above each bordered content box ("Select an appropriate style for identifying page content sections", see Content Structure).
- **3 → secondary navigation**: arrow to the left sidebar ("Implement secondary navigation controls as needed", see Secondary Navigation).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-CHROME top bar #353f47: "Boreas Foundation" brand + TABS ×3 (HOME active, gold underline) + avatar
├─ PANE[left w≈250 #3d464d] nav ×6: Dashboard (active) | My Cases | Overdue Cases | All Cases | Advanced Search | Knowledge Base
└─ CONTENT (white)
   ├─ H1 "Dashboard"
   └─ GRID(3-col ×2) SECTION-titled empty boxes: Income, Expenses, Profit and Loss, Hiring, Attrition, Customer Satisfaction
```
- **Reading order**: F — title, then row-wise section headers.
- **Density**: 2 as rendered (placeholders); the frame anticipates a density-3 dashboard.

### Styling specifics (OBSERVED, est.)
- **Palette**: top nav #353f47 (est.); sidebar #3d464d (est.); active-tab underline gold #dfbc3f (est.); annotation circles/arrows #cc445a (est., not part of the UI); content #ffffff; placeholder box hairlines ≈#e0e0e0 (est.).
- **Typography moves**: H1 ≈LARGE_PLUS near-black; section headers ≈MEDIUM bold; site tabs SMALL ALL-CAPS; sidebar items STANDARD, active item white+bold with left indicator bar, siblings muted gray.
- **Card treatment**: hairline-bordered empty boxes (chart placeholders).

### Teaching content (INFERRED)
- Three wayfinding layers, one dominant element each: site level (top tabs + gold underline), page level (single H1), section level (repeated bold headers). Hierarchy = consistent, mutually distinct treatments per layer — not decoration.
- Sidebar active state shows redundant cues (bold + white + indicator bar), the pattern to reuse for any secondary nav.
- **What to steal**: 1) Give each wayfinding layer exactly one visual treatment and never mix them. 2) Use multi-cue active states in secondary nav. 3) Name sections with content words (Income, Attrition), not "Chart 1".
- **Risks**: muted gray sidebar items on #3d464d run close to AA; six placeholder sections need responsive stacking order decided before charts arrive.

### Code cross-check
- none on this page.
