# Analysis: tabular-data-display

Page context: "Tabular Data Display" (section: patterns) — grid best practices. One demo dataset ("Special Offers", 16 promo rows) and one ("Products") recur across all four images under identical Appian-branded chrome: navy billboard header #0d2240 (est.) with white glyph+title, waffle+avatar right. No SAIL on this page — all colors pixel-estimated. Two of the four "neutral" images internally embed DO/DON'T composites (prohibition-circle overlays): image37 (bottom half = don't) and image40 (left phone = don't); noted per section.

## image31.png

### Identification
- **Image**: image31.png | **Source page**: tabular-data-display | **Alt/caption**: none (heading: "List-style grid")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list — record list ("Special Offers") demonstrating Auto column widths
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: merchandising/sales-ops analyst at a bike wholesaler (AdventureWorks-style data), weekly-manager browsing promos to drill into one
- **Domain & brand context**: Appian demo brand; retail/wholesale discounts domain
- **Top 3 user tasks (ranked)**: 1. Find a promotion and drill in via its name link 2. Compare discount % across categories (Reseller vs Customer) 3. Check validity windows (Starts/Ends) and qty brackets
- **Implied requirements**: "Grid must fit page width with no horizontal scroll" (page text); "Row identity column must be a drill-in link"; "Numeric/date columns must right-align for scanning"; "Show total count"
- **Data model sketch**: SpecialOffer{description (16 rows: 'No Discount', 'Volume Discount 11 to 14'…'Mountain-500 Silver Clearance Sale'), discountPct 0–50%, category ∈ {No Discount, Reseller, Customer}, starts 5/1/2011…, ends …5/30/2014, minQty 0–61, maxQty 0–60}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ header CARD(#0d2240 est., tag icon + "Special Offers")
└─ GRID(7-col × 16 rows visible, full-width, footer "16 items")
```
- **Above the fold**: header + all 16 rows + count footer (grid IS the page)
- **Reading order**: single-column — header scan, then row-major; left link column anchors each fixation
- **Hierarchy rationale**: Description gets ~27% width and the only color (links) because drill-in is task 1; dates get the widest data columns (long timestamp strings); qty columns compress at far right — least-used data last
- **Density**: 4 — 16 data rows × 7 columns fill the viewport edge-to-edge; minimal chrome beyond the billboard
- **Ratios & spacing**: column widths content-proportional (Auto per page text): Description ≈27%, Discount ≈10%, Category ≈11%, Starts/Ends ≈16% each, Min/Max Qty ≈10%; row height ≈48px airy; light vertical rules between columns

### Styling specifics (OBSERVED — no SAIL on page)
- **Palette**: billboard #0d2240 (est.); page/grid #ffffff; row zebra alt tint #f7f8f9 (est., barely-there); links #2276bb (est.); header text + values #222222 (est.); column/row rules #e7e9ec (est.); footer count STRONG black + gray "items"
- **Color application points**: blue only on Description links; all other cells monochrome; no status colors, no icons in cells
- **Typography moves**: column headers STANDARD STRONG dark (not caps); cell text STANDARD; right-aligned numerals and dates vs left-aligned text columns — alignment is the typography system; title ≈ LARGE_PLUS white STRONG with tag glyph
- **Imagery stance**: none in data; glyph icon in billboard only
- **Card treatment**: none — grid sits directly on white page, borderless except hairlines
- **Signature moves**: instead of manual widths, Auto sizing keyed to content (the pattern's lesson) — dates wide, quantities narrow; instead of an ID column, the human-readable description doubles as the record link; instead of loud zebra striping, near-invisible alternation + hairlines keeps 7 columns quiet
- (Right-alignment of Starts/Ends dates is unusual — treats timestamps as numeric-scannable.)

### Component inventory (INFERRED — no SAIL)
- a!gridField(data: recordType, columns: 7 × a!gridColumn(width:"AUTO"), first column a!linkField/recordLink, align:"END" on numeric/date columns), page-size ≥16, count footer built-in; billboard a!cardLayout or headerContentLayout header
- Chart types: none
- Interactive affordances: 16 row links; implicit column sort (records grid default)

### Character & judgment
- **Register**: utilitarian-ops + institutional — colorless data plane under a navy brand bar
- **Why it works**: one hue = one affordance (blue text is always "drill in"); Auto widths give every column exactly its content's width so 7 columns fit without scroll (the pattern's promise, visibly true); right-aligned qty/date columns create clean scan rails
- **Why not boring**: it is deliberately plain — the interest is discipline: zero decoration spent where data is the UI; count footer as the only summary chrome
- **Boring twin**: same grid with equal-width columns — description wrapping to two lines, "Min Qty" header wider than its 2-digit values, dates truncated with ellipses — plus colored category chips nobody asked for.
- **What to steal**: Auto widths for fit-to-page lists; link the name, not an ID; align by data type
- **Risks**: 0-values render literally ("0" for no-bracket promos — noise); link blue on white is the only selected/hover affordance shown; 7 columns already near the list-style ceiling (this page's mobile image proves it breaks on phones)

### Code cross-check
- none — no SAIL on this page

## image37.png

### Identification
- **Image**: image37.png | **Source page**: tabular-data-display | **Alt/caption**: none (heading: "Spreadsheet-style grid")
- **Device frame**: desktop
- **Marker**: neutral per batch, but the image is a stacked composite: top grid = DO, bottom grid overlaid with a gray prohibition circle = DON'T. Analyzed as one tier-A image with the internal pair documented.
- **UI type**: list — wide "Products" analysis grid (fixed-width columns) vs its misconfigured twin

### Use-case reconstruction (INFERRED)
- **Persona**: inventory/data analyst, daily-operator auditing product master data ("analysis, not navigation" per page text)
- **Domain & brand context**: Appian demo; bike-parts product catalog (AdventureWorks-style)
- **Top 3 user tasks (ranked)**: 1. Scan stock thresholds (Safety Stock Level, Reorder Point) across products 2. Audit cost/price/weight fields (all 0.00 — data-quality review) 3. Verify identifiers (Product Number, GUID)
- **Implied requirements**: "Many columns must stay legible — overflow horizontally, never shrink" (page text); "Fixed widths sized to header + typical value"; "Sorted column must be visible (↑ on Product Number)"; "Row identity stays leftmost while scrolling"
- **Data model sketch**: Product{name 'Adjustable Race'…'Chainring Bolts', productNumber AR-5381…CB-2903, productId 1–320, color (Black/Silver/blank), safetyStockLevel 500–1000, reorderPoint 375–750, standardCost 0.00, listPrice 0.00, weight 0.00, uniqueIdentifier GUID, +hidden: size, unit codes, daysToManufacture, productLine, class, style, modelId, sellStart 4/30/2008, sellEnd, discontinued}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[DO] HEADER-CONTENT navy billboard "Products"
     └─ GRID(11-col visible × 10 rows, fixed widths, GUID column clipped at right edge → h-scroll)
[DON'T] same billboard
     └─ GRID(~22-col × 4 rows visible, auto/relative widths: 3-line headers, 4-line GUID wraps) + ⊘ overlay
```
- **Above the fold**: both grids stacked (teaching composite), ~10 clean rows top vs ~4 bloated rows bottom
- **Reading order**: single-column per grid; the ⊘ overlay forces top-vs-bottom comparison
- **Hierarchy rationale**: identical data makes the single manipulated variable (column width strategy) the only difference — the comparison IS the hierarchy; clipped GUID column at the right edge deliberately shows overflow as acceptable
- **Density**: DO grid 4 (11 columns × 10 rows, compact single-line rows); DON'T grid 5-gone-wrong (~22 columns forced into width; tall wrapped rows collapse effective density to 4 rows/viewport)
- **Ratios & spacing**: DO columns ≈ NARROW/MEDIUM fixed each (header+value sized, e.g. Color narrow, Unique Identifier wide); DON'T columns squeezed ≈70px each, header text wrapping 2–3 lines ("Safety Stock Level"), cells wrapping 4 lines (GUIDs)

### Styling specifics (OBSERVED — no SAIL on page)
- **Palette**: billboard #0d2240 (est.); grid white; links #2276bb (est.); sort arrow ↑ #2276bb (est.) beside "Product Number"; rules #e7e9ec (est.); zebra alt #f7f8f9 (est.); ⊘ overlay 50%-gray circle-slash
- **Color application points**: blue on Name links + sort indicator only; DON'T half identical (color is not the variable)
- **Typography moves**: headers STRONG single-line in DO vs wrapped multi-line in DON'T — the most visible symptom; cells STANDARD; numerals right-aligned (Product Id, stock, costs), text left
- **Imagery stance**: none
- **Card treatment**: none — bare grid on page
- **Signature moves**: instead of cramming, DO clips mid-column at the viewport edge (visible half-GUID) advertising horizontal scroll; sorted-column arrow kept adjacent to its header; the pattern pairs its own anti-pattern in one artifact — self-contained lesson
- **DO/DON'T pair (embedded)** — Principle: "Fixed widths for wide analysis grids". DO: fixed NARROW/MEDIUM per column, overflow scrolls. DON'T: Auto/relative widths shrink all ~22 columns to fit → 3-line headers, 4-line cells, 4 visible rows. Rule: when columns exceed page width, scroll them, never shrink them. Severity: usually. Category: data-display. SAIL implication: a!gridColumn(width:"NARROW"/"MEDIUM"…), never "AUTO"/"3X", on spreadsheet-style grids.

### Component inventory (INFERRED)
- a!gridField(recordType data, ~22 a!gridColumn each width:"NARROW"|"MEDIUM"|"MEDIUM_PLUS", sortField on productNumber, Name column recordLink); DON'T twin: same with width:"AUTO"/weighted
- Chart types: none
- Interactive affordances: sortable headers (↑ shown), Name links, horizontal scrollbar (implied by clipped column)

### Character & judgment
- **Register**: utilitarian-ops — pure working grid, zero adornment
- **Why it works**: fixed widths hold one row = one line, keeping 10 rows scannable where the DON'T twin shows 4; the clipped right column is honest signage that more data lives off-screen; sorted-by indicator preserves orientation in a wide field
- **Why not boring**: the built-in anti-pattern with prohibition overlay (documentation-as-UI); tolerating horizontal scroll — counter to reflexive "never scroll sideways" — as the *correct* trade for analysis grids
- **Boring twin**: the bottom half of this very image is the boring twin, rendered: reflexive fit-to-width with every column shrunk into illegibility.
- **What to steal**: size each fixed column to max(header, typical value); let wide grids scroll horizontally; keep identity column leftmost
- **Risks**: horizontal scroll hides right-side columns from casual users (mitigate with column choice/order); all-0.00 money columns burn three columns of width for no information; GUID column is developer noise in a user grid

### Code cross-check
- none — no SAIL on this page

## image40.png

### Identification
- **Image**: image40.png | **Source page**: tabular-data-display | **Alt/caption**: none (heading: "Grids for smaller device widths")
- **Device frame**: phone (two iPhone mockups side by side)
- **Marker**: neutral per batch, but internally a DON'T/DO pair: left phone carries the prohibition circle (list-style Auto widths on phone), right phone is the corrective (fixed widths + horizontal scroll). Documented as the embedded pair.
- **UI type**: list — "Special Offers" grid at phone width, two configurations

### Use-case reconstruction (INFERRED)
- **Persona**: same merchandising analyst checking promos on a phone, occasional mobile cadence
- **Domain & brand context**: Appian demo; retail discounts
- **Top 3 user tasks (ranked)**: 1. Recognize each offer by name at a glance 2. Read discount % beside it 3. Swipe sideways for category/date detail
- **Implied requirements**: "Grids tuned for laptops must be re-tuned per breakpoint" (page text); "Conditionally switch to fixed-width spreadsheet style on narrow screens"; "Name column must not wrap into a ragged block"; "Accept off-screen columns on phones"
- **Data model sketch**: same SpecialOffer entity as image31 (names, discountPct, category, starts…)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[DON'T ⊘] PHONE frame → navy header "Special Offers"
          └─ GRID(4 cols squeezed: Description wraps 3-4 lines, dates wrap 2)
[DO]      PHONE frame → navy header "Special Offers"
          └─ GRID(fixed cols: Description 1 line, Discount right-aligned, Category clipped at bezel → h-scroll)
```
- **Above the fold**: DON'T shows ~8 tall mangled rows; DO shows 16 single-line rows — same viewport, double the data
- **Reading order**: side-by-side comparison; within each, single-column row scan
- **Hierarchy rationale**: identical chrome/data isolates the width strategy; DO's clipped Category column at the bezel is the visible cue that overflow is intended; row count difference (8 vs 16) is the argument
- **Density**: DON'T 3 (wrapped rows waste half the height); DO 4 (16 rows in one phone screen)
- **Ratios & spacing**: DON'T splits ~375px across 4 auto columns (~90px each — below word width); DO gives Description ≈70% of the viewport, Discount ≈25%, next column clipped

### Styling specifics (OBSERVED — no SAIL on page)
- **Palette**: navy header #0d2240 (est.), white grid, links #2276bb (est.), rules #e7e9ec (est.), zebra #f7f8f9 (est.), gray ⊘ overlay on left phone; realistic iPhone bezels frame both
- **Color application points**: unchanged from desktop — blue links only; the phone frames are presentation chrome, not UI
- **Typography moves**: DON'T: link text fragments across 3–4 lines ("Volume / Discount 11 / to 14"), dates split "5/31/2011 / 12:00 AM"; DO: every cell single-line — line discipline as the visible typographic difference; headers STRONG both sides
- **Imagery stance**: device mockup photography only
- **Card treatment**: none — edge-to-edge grid inside the phone viewport
- **Signature moves**: instead of a phone-specific card list or hidden columns, the pattern keeps the *same grid component* and only swaps width configuration per breakpoint (a!isPageWidth-style conditional, low-code); overflow honesty again — clip mid-column at the bezel
- **DO/DON'T pair (embedded)** — Principle: "Re-tune grid widths per breakpoint". DON'T: Auto/list-style widths at 375px → every text cell wraps, 8 rows/screen, ragged left column. DO: fixed widths sized for content → single-line rows, 16 rows/screen, horizontal scroll for the rest. Rule: on narrow screens switch list-style grids to fixed-width spreadsheet style rather than letting columns shrink. Severity: usually. Category: mobile | data-display. SAIL implication: wrap widths in if(a!isPageWidth({"PHONE"}), fixed widths, "AUTO") on a!gridColumn.

### Component inventory (INFERRED)
- Same a!gridField; conditional a!gridColumn widths via a!isPageWidth; record links on Description
- Chart types: none
- Interactive affordances: row links; horizontal swipe on DO grid

### Character & judgment
- **Register**: utilitarian-ops
- **Why it works**: the 8-vs-16-rows outcome is measurable in the pixels — fixed widths literally double throughput; keeping Description whole preserves recognition (names are how users find promos); one component, two configs beats maintaining a separate mobile layout
- **Why not boring**: enterprise pattern that embraces horizontal swipe on phones instead of pretending everything must fit; paired-phones presentation making the argument visual
- **Boring twin**: the left phone — shipped by teams who never resize their laptop preview.
- **What to steal**: a!isPageWidth-conditional column widths; give the identity column ~70% of a phone viewport; count rows-per-screen as your mobile grid metric
- **Risks**: clipped third column may read as "table ends here" without a scroll affordance; horizontal swipe conflicts with iOS back-gesture near edges; 12:00 AM timestamps waste precious phone width (should format short dates on mobile)

### Code cross-check
- none — no SAIL on this page

## image62.png

### Identification
- **Image**: image62.png | **Source page**: tabular-data-display | **Alt/caption**: none (heading: "User controls on records-powered grids")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list — "Special Offers" records grid with the auto-generated control bar enabled
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: sales-ops analyst, daily-operator slicing promos by category/amount and exporting for reporting
- **Domain & brand context**: Appian demo; retail discounts
- **Top 3 user tasks (ranked)**: 1. Search/filter offers (text, Category, Discount Amount) 2. Export the result set (download control) 3. Drill into an offer row
- **Implied requirements**: "Filtering/search/export must come from record-type config, not custom UI" (page text: 'a few clicks'); "Controls must minimize footprint, leaving space for data" (page text); "Filters must read as a single compact bar"
- **Data model sketch**: same SpecialOffer entity; declared record filters: category, discountAmount; searchable description

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT navy billboard "Special Offers"
├─ CONTROL BAR: [🔍 Search Special Offers |SEARCH] [CATEGORY Any ▾] [DISCOUNT AMOUNT Any ▾] [⭳][⚲▾][⟳]
└─ GRID(7-col × 16 rows, identical to image31) + "16 items"
```
- **Above the fold**: control bar + all 16 rows — controls cost one ~44px band total
- **Reading order**: single-column; control bar scans left→right ending at icon cluster
- **Hierarchy rationale**: search leads (broadest tool) then named filters, then icon-only utilities (export/filter/refresh) — frequency-ordered left to right; the grid below is unchanged so data keeps ~90% of the viewport (the pattern's stated goal)
- **Density**: 4 — 16 rows + 6 controls in one viewport
- **Ratios & spacing**: search ≈27% width matching the Description column beneath; two filter dropdowns ≈30% each; icon buttons collapse to ≈40px squares at right; single-row bar, no wrapping

### Styling specifics (OBSERVED — no SAIL on page)
- **Palette**: billboard #0d2240 (est.); bar fields white with #d7dbe0 (est.) 1px borders; caps field labels #6b7683 (est.) inside the control ("CATEGORY | Any"); placeholder italic gray #9aa2ab (est.); icon glyphs #5a6472 (est.); grid identical to image31 (links #2276bb est.)
- **Color application points**: none added — the control bar is deliberately achromatic so the (blue-linked) data stays the loudest layer
- **Typography moves**: embedded caps SMALL labels inside filter controls (label and value share the box — footprint move); italic placeholders ("Any", "Search Special Offers"); SEARCH as a small caps bordered button fused to the input
- **Imagery stance**: styled glyph icons only (magnifier, download, funnel-with-caret, refresh)
- **Card treatment**: none — flat bar over flat grid
- **Signature moves**: instead of a filter panel or sidebar, label-inside-control dropdowns compress two named filters + search + three utilities into one row (the auto-arranged "minimized footprint" the page advertises); icon-only utilities cluster right, separated from semantic filters; search button attached flush to its input
- (This is the records-grid out-of-box arrangement — the lesson is to configure, not rebuild.)

### Component inventory (INFERRED — records-grid built-ins)
- a!gridField(data: a!recordData(recordType), showSearchBox:true, showRefreshButton:true, showExportButton:true, userFilters:{category, discountAmount}) — controls auto-rendered; columns as image31
- Chart types: none
- Interactive affordances: text search, 2 user-filter dropdowns, export download, save/manage-filters funnel menu, refresh, row links, sortable headers

### Character & judgment
- **Register**: utilitarian-ops + institutional
- **Why it works**: the whole control suite costs one band — compare any custom filter card stack; label-in-control keeps six affordances self-describing without a second label row; achromatic controls defer to blue data links
- **Why not boring**: it is proudly stock — the design insight is restraint (page text: consider this before building custom controls); embedded caps labels are a genuinely compact labeling trick worth copying in custom UIs
- **Boring twin**: a white "Filters" card above the grid with three stacked labeled dropdowns, an Apply button, and a separate toolbar row for export/refresh — three times the vertical cost, hand-built and hand-maintained.
- **What to steal**: enable record-grid controls before hand-rolling filter UIs; embed caps labels inside filter controls; cluster icon utilities right of semantic filters
- **Risks**: icon-only export/funnel/refresh rely on tooltips for meaning; "Any" placeholders don't show active-filter state loudly once changed; control bar wraps unpredictably at tablet widths (records grid handles it, but custom clones often don't)

### Code cross-check
- none — no SAIL on this page (controls are record-type configuration, not expression code)
