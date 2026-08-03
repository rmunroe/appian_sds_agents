# Analysis: ux-presenting-information-clearly

Page has no SAIL source; all hexes are pixel-estimated. Several images are docs-annotated: content washed toward white with an orange callout box around the taught element. Fades and orange boxes are documentation overlays, not UI design (OBSERVED, noted per image).

## IA_good_title_do.png

### Identification
- **Image**: IA_good_title_do.png | **Source page**: ux-presenting-information-clearly | **Alt/caption**: ds-images/IA_good_title_do.png (illustrates "Use prominent titles… 'Sales Performance by Region' describes a report dashboard")
- **Device frame**: desktop
- **Marker**: neutral (do-leaning; filename `_do`, orange annotation box around title, rest of page faded by docs overlay)
- **UI type**: dashboard-analytical

Note: same UI appears unfaded as IA_diff_do.png (different data snapshot); styling claims below are cross-checked against that sibling and marked accordingly.

### Use-case reconstruction (INFERRED)
- **Persona**: regional sales manager / sales-ops lead; weekly-manager cadence with daily glances.
- **Domain & brand context**: B2B sales pipeline reporting inside a CRM-ish internal app; Appian-default styling, no brand theming.
- **Top 3 user tasks (ranked)**: 1. Check region health vs targets (KPIs). 2. Compare account execs to find over/under-performers. 3. Spot pipeline-stage bottlenecks; re-scope by region.
- **Implied requirements**: "Must show actuals against targets without a legend"; "Must switch region scope in one click with all options visible"; "Must rank execs by conversion"; "Must show opportunity distribution across all 7 stages"; "Title must stay stable while filters change" (the page's lesson).
- **Data model sketch**: Opportunity(stage 1–7, amount, region, exec) *—1 AccountExec(name, photo); region enum All/North/East/South/West; per-KPI target values (75, 5%, $425K, $50M). Exec 1—* opportunities.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PAGE (no site chrome in crop)
├─ TITLE "Sales Performance by Region" (LARGE, blue) ← orange docs box
├─ FORM radio "Region" ×5 horizontal (All selected)
├─ KPI-ROW ×4 CARD(label + value+icon left, target right, border)
└─ COLUMNS [1:1]
   ├─ GRID(4-col: Account Exec+photo | # Opps | Total Amt | Conversion; 7 rows)
   └─ CHART(column) "Opportunities By Pipeline Stage", 7 bars
```
- **Above the fold**: everything — title, filter, 4 KPIs, full 7-row grid, full chart.
- **Reading order**: F
- **Hierarchy rationale**: title first names the page (task 0: orientation — the lesson taught); KPI row answers task 1 before detail; grid left of chart because per-person accountability (task 2) outranks distribution (task 3).
- **Density**: 3 — 4 KPI cards + 7-row grid + 7-bar chart in one ~1490×640 viewport with comfortable padding.
- **Ratios & spacing**: 4 equal KPI cards; lower split ≈[1:1]; card padding ≈ STANDARD; section gaps ≈ marginBelow STANDARD; grid rows zebra-striped.

### Styling specifics (OBSERVED; est. hexes; sibling IA_diff_do used where this copy is faded)
- **Palette**: page bg #ffffff; card border #d9d9d9 (est.); title blue #1c6ea4 (est.); KPI values #222222 (est.); labels/targets gray #6e6e6e (est.); positive green #3aa54c (est.); negative red #cc4444 (est.); chart bars steel blue #2e6da4 (est.). In THIS snapshot the KPI cards carry pale washes — green #eaf6ea (est.) where actual ≥ target (opps 100/75, deal $433K/$425K), pink #fdefee (est.) where below (pipeline $43.3M/$50M) — read through the fade overlay, so low confidence; absent in IA_diff_do (OBSERVED).
- **Color application points**: title text; conversion column values (green/red by performance); KPI value green when favorable (7.6% in sibling); single-hue chart series; gray glyph icons; conditional card wash (this variant only). No colored header bar.
- **Typography moves**: title LARGE bold blue; KPI labels STANDARD all-caps gray; KPI values EXTRA_LARGE; targets STANDARD gray; grid headers STANDARD bold; body STANDARD. All-caps reserved for KPI labels.
- **Imagery stance**: user photos in grid rows; inline glyph icons after KPI values (handshake, cycle, banknote, rising line) and a dartboard glyph before each target.
- **Card treatment**: 1px border, flat, square corners, white fill — KPIs only; grid and chart sit borderless on the page.
- **Signature moves**: instead of a separate targets legend, targets sit right-aligned inside each KPI card with a dartboard icon; instead of rainbow chart colors, one blue hue keeps green/red meaningful; instead of a filter dropdown, horizontal radios expose all 5 region scopes at once; instead of uniform text rows, photos + semantic conversion colors make the grid scannable.

### Component inventory (OBSERVED → INFERRED)
- a!radioButtonField(choiceLayout:"COMPACT", 5 choices) as filter; KPI cards ≈ a!cardLayout(showBorder:true) + a!sideBySideLayout + a!richTextDisplayField (hand-built KPI, predates/instead of a!kpiField); a!gridField with image column (avatars) + richText conversion column colored conditionally; a!columnChartField, single series, default colorScheme (no custom).
- Interactive affordances: region radio filter; grid appears read-only (sorted by Conversion desc — supports ranking task); no row actions visible.

### Character & judgment
- **Register**: utilitarian-ops + authoritative-executive — plain white ground, terse all-caps labels, numbers dominate.
- **Why it works**: every KPI carries its own comparator (◎ target) so judgment is instant; semantic red/green appears ONLY on performance numbers, so it always means something; one-viewport composition — no scrolling to complete any of the three tasks.
- **Why not boring**: inline dartboard-targets inside KPI cards; EXTRA_LARGE value + icon pairing; avatar photos breaking a numeric grid; (this variant) target-attainment card washes; conversion-sorted grid as an implicit leaderboard.
- **Boring twin**: a dropdown filter, four huge borderless numbers with no targets, a multi-color chart, a photo-less grid sorted alphabetically, and a title that mutates to "North Region Sales Performance" on filter change.
- **What to steal**: put the target inside the KPI card, right-aligned and gray; reserve red/green strictly for performance deltas; keep the title constant while radios carry scope state.
- **Risks**: green/red conversion values are color-only encoding (add arrows/icons for color-blind users); gray all-caps labels ≈4.5:1 borderline on white; 4 KPI cards + [1:1] split will stack awkwardly at tablet width; pastel washes nearly invisible (if real).

### Code cross-check
- none — no SAIL source on this page.

## IA_self_title.png

### Identification
- **Image**: IA_self_title.png | **Source page**: ux-presenting-information-clearly | **Alt/caption**: ds-images/IA_self_title.png ("A separate title may not be needed if the selected site page title adequately describes the purpose")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (site page). Kept tier A per batch: full-width viewport top including site chrome and the page's entire content (5-row roster ends in whitespace); note the grid is docs-faded and the orange box around the EMPLOYEES tab is annotation, not UI.

### Use-case reconstruction (INFERRED)
- **Persona**: HR coordinator or people manager; weekly, occasional lookup cadence.
- **Domain & brand context**: internal HR "people directory" site; Appian-default chrome with appian logo, no custom brand.
- **Top 3 user tasks (ranked)**: 1. Find an employee and open their record. 2. Scan roster by title/department/location. 3. Switch context (Dashboard/Tasks) via tabs.
- **Implied requirements**: "Page purpose must be clear from the selected tab alone — no duplicate in-page title"; "Every row must link to a detail view"; "Navigation must stay persistent above content".
- **Data model sketch**: Employee(photo, name, title, department, location) — 5 visible: Daniel Clark/Assistant Manager/Legal/Virginia; Sharon Jackson/VP of Marketing; Pamela Howard/Engineering; Sarah Nelson/Sales/California; Larry Miller/Marketing/New York. Site: Dashboard | Employees | Tasks.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-HEADER (light blue-gray bar)
├─ TABS ×3 icon-over-label (DASHBOARD | EMPLOYEES selected ← orange docs box | TASKS) + waffle + avatar + logo
└─ PAGE (NO in-page title — tab acts as title)
   └─ GRID(5 cols: photo | Name-link | Title | Department | Location; 5 rows)
```
- **Above the fold**: entire page.
- **Reading order**: single-column (header, then grid F-scan).
- **Hierarchy rationale**: selected tab is the only title device (the lesson); grid starts immediately, reclaiming the title's vertical space; Name is the only link/bold column because task 1 is person lookup.
- **Density**: 2 — five airy rows (~95px logical each), one content zone.
- **Ratios & spacing**: columns ≈ [narrow-avatar : 2 : 2 : 2 : 2]; hairline row separators; generous white margin around grid.

### Styling specifics (OBSERVED, est. — grid readable through fade)
- **Palette**: header bar #b9c8d4 (est.); selected tab fill dark navy #173d5c (est.) with white icon+label; unselected tabs white icon+label on bar color; page bg #ffffff; name links accent blue #2b7cb9 (est.); body text gray #555 (est.); separators #e5e5e5 (est.); orange annotation #ec7625 (est., docs overlay).
- **Color application points**: selected-tab fill; name links; nothing else — zero accent inside content.
- **Typography moves**: tab labels STANDARD all-caps under glyph icons; grid headers STANDARD bold dark; names STANDARD bold link-blue; other cells STANDARD regular gray. No LARGE text anywhere on the page.
- **Imagery stance**: circular avatar placeholders per row; icon-over-label tabs.
- **Card treatment**: none — open grid on white, hairline separators only.
- **Signature moves**: instead of repeating "Employees" as an in-page title, the filled navy tab carries the title role; instead of a text-only nav, icons above labels raise tab scannability; avatar column is unlabeled, letting headers align with text columns.

### Component inventory (OBSERVED → INFERRED)
- Site tab bar (site configuration, not SAIL); a!gridField with image column + a!recordLink name column; rows link to the record view seen in IA_back_link.png (Daniel Clark).
- Chart types: none. Filters/search: none visible.

### Character & judgment
- **Register**: institutional + calm-clinical — muted blue-gray chrome, gray text, zero decoration.
- **Why it works**: tab title + immediate grid means content starts ~90px sooner than with a duplicate title; single accent (navy fill) makes location-in-app unambiguous; one bold/link column matches the one real task.
- **Why not boring**: it IS deliberately minimal — the interest is the omission: no title block, no toolbar, no card wrapper; selected-tab fill in navy against a pale bar is the page's only strong contrast move.
- **Boring twin**: same grid pushed down by a redundant "Employees" heading plus a decorative divider, wrapped in a bordered card, with every column bolded.
- **What to steal**: when the site tab names the page, omit the in-page title entirely; spend color only on selection state and links.
- **Risks**: without an in-page title, prints/screenshots/deep links lose context; faded-gray cell text as shown would fail contrast (fade is annotation, but the real values are still mid-gray); icon-over-label tabs need accessible names.

### Code cross-check
- none — no SAIL source on this page.

## IA_change_title_dont.png + IA_change_title_do.png (tier C pair)

### Principle: Keep the page title constant as content updates
- **DO shows**: "Sales Performance by Region" stays the crisp blue title while Region=North is selected; KPIs/grid (faded by docs overlay) update to North data — scope lives in the radio state, not the title.
- **DON'T shows**: identical dashboard, same North selection and data, but retitled "North Region Sales Performance" — the page renames itself per selection, breaking orientation and any "where am I" anchor.
- **Rule**: a title identifies the page; encode user selections in controls and content, never in the title.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: title is a literal, not an expression of filter variables; bind `local!region` to queries/charts only; radio field displays current scope.

## Component: Orientation & navigation devices — IA_back_link.png, IA_breadcrumbs.png (tier B)

Official vocabulary from page: back navigation link; breadcrumbs; (plus prominent titles / site page title, covered above).
Tier override: IA_back_link.png was suggested tier A but is a docs-faded, orange-boxed crop of a record view's top strip (cut mid-content below the avatar row) — an instructional fragment, so tier B.

### IA_back_link.png
- **Produces it**: rich text link "← Back to employee list", accent blue #1d659c (est.), placed as first element above the faded "Employee Details" title on Daniel Clark's record (same HR app/list as IA_self_title.png).
- **Looks like**: lone left-aligned arrow+link under the site tab bar; orange box = docs annotation.
- **Use when**: detail reached from one parent list. | **Avoid when**: multi-level hierarchy (use breadcrumbs).
- **Styling hooks**: STANDARD size, accent color, leading ← glyph.
- **Pairs well with**: list-page grids, record views.
- **Marker**: neutral

### IA_breadcrumbs.png
- **Produces it**: one rich text line: "All Employees / Sales / Asia Pacific" — ancestor links accent blue #2b7cb9 (est.), " / " separators gray, current node bold near-black #222 (est.), not a link.
- **Looks like**: single trail line, no background.
- **Use when**: item sits ≥3 levels deep and users jump across the hierarchy. | **Avoid when**: flat list→detail.
- **Styling hooks**: separator glyph, bold+plain current node.
- **Pairs well with**: hierarchical record sets (org/region trees).
- **Marker**: neutral

### Page rollup
Default: back link for simple list→detail returns; breadcrumbs once the hierarchy is deep enough that "back" is ambiguous.

## IA_structure_do.png + IA_confusing_hierarchy_dont.png (tier C pair)

### Principle: One visual style per hierarchy level
- **DO shows**: "Cargo Van #12847" vehicle record with four distinct, consistently-applied levels — near-black LARGE title; tab bar (selected tab filled blue #1d659c est., white label); blue MEDIUM section headings (Utilization, Specifications, Gallery); gray all-caps STANDARD subsection labels (USAGE / CONTRACT / LOCATION / GENERAL / ENGINE / DRIVE TRAIN) over 3-column field groups.
- **DON'T shows**: "Case #1748": section heading "Case History" styled identically to the page title (blue LARGE); data value "Acme Corporation" styled as a heading; sibling section "Notes" in a third, charcoal style — same level, three treatments, and a value masquerading as structure.
- **Rule**: map each structural level to exactly one text style; never style data values as headings.
- **Severity**: always
- **Category**: typography
- **SAIL implication**: use sectionLayout/box labels and rich text header sizes consistently (title > section > sub-section); customer name belongs in a field value, STANDARD size.

## IA_diff_dont.png + IA_diff_do.png (tier C pair)

### Principle: Differentiate content so it can be scanned
- **DON'T shows**: "Cargo Van" spec sheet — ~40 bold-label/plain-value rows in two undifferentiated columns; no grouping, size, color, or container variation; finding Price vs Bluetooth is a linear read.
- **DO shows**: the sales dashboard — EXTRA_LARGE KPI numbers with icons in bordered cards, green #3aa54c/red #cc4444 (est.) conversion values, avatar photos breaking grid uniformity, restrained single-blue chart.
- **Rule**: vary size, weight, color, and container only along real importance differences — enough to guide the eye, no more.
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: KPI-style cards for headline numbers; conditional richText color (POSITIVE/NEGATIVE) on deltas; image columns in people grids; group specs under labeled sections (see IA_structure_do.png).

## IA_random_colors_dont.png (tier C, unpaired DON'T — restrained counterpart is IA_diff_do.png)

### Principle: Color must carry meaning, not variety
- **DON'T shows**: three equal-status stat cards in three arbitrary hues — Notifications filled orange-red #e8482d (est.) with white text, Licenses purple #8e2fc4 (est.), Exceptions blue #1a56db (est.) — plus a pale-yellow #faf3c8 (est.) box header, green/red bullet sentences, smiley/frowny priority emoji, and a 3-series chart (blue/green/yellow). ~9 hues, none systematic; the filled red card screams "alert" for a mere count.
- **Rule**: one accent hue plus semantic green/red; equal-status items get identical styling; saturation ∝ urgency.
- **Severity**: usually
- **Category**: color
- **SAIL implication**: shared accent for card icons/values; reserve filled red cards and NEGATIVE text for true alerts; default chart colorScheme.

## IA_random_layouts_dont.png (tier C, unpaired DON'T)

### Principle: One component, one meaning per page
- **DON'T shows**: "Create New Customer" form where card layouts play four roles at once — gray-filled summary card (title + Created-by + SAVE/SUBMIT), red-filled cards as selected toggles (Business vs Consumer), blue-filled/pale-blue cards as multi-select Stage toggles (Prospected, Lead, Pitched selected), and red-filled bars as section headers ("Section #1: Company Information") above bordered form cards with red icon rows. Users cannot tell container from control from header; selected-state colors (red vs blue) also disagree.
- **Rule**: give each role a distinct, consistent pattern — sections look like sections, choices look like inputs.
- **Severity**: always
- **Category**: layout
- **SAIL implication**: sectionLayout labels for headers; checkbox/radio or a!cardChoiceField (one consistent selected style) for choices; reserve cardLayout fills for true containers.
