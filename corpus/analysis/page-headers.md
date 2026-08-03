# Analysis: page-headers

Cross-ref: `forms-sidebar-for-eligibility-information.png` (Title bar header — alternative, "Order Fishing License") is analyzed under its primary forms page; its SAIL here CODE-VERIFIES the tall title bar recipe: `a!cardLayout(style: "#1A2530", padding: "MORE")` in `formLayout` titleBar, breadcrumb rich text (SMALL, links `#FFF`) above `a!headingField(size: "MEDIUM_PLUS", fontWeight: "BOLD")`, right-aligned SECONDARY OUTLINE + SOLID buttons.

## image44.png

### Identification
- **Image**: image44.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Title bar header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other (header pattern demo on intentionally empty page)

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit case worker, daily-operator landing on a site home tab
- **Domain & brand context**: "Boreas Foundation" — polar-conservation nonprofit; warm institutional brand keyed to a gold accent
- **Top 3 user tasks (ranked)**: 1. Confirm which page/site they're on 2. Jump to My Tasks / Cases via nav 3. Proceed into (not-yet-shown) home content
- **Implied requirements**: "Page identity must be readable at a glance"; "Title styling must come from brand color, not default chrome"; "Header must not consume vertical space needed by content"
- **Data model sketch**: none visible — page contents deliberately empty (OBSERVED)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
├─ SITE-NAV dark bar (logo, HOME active w/ gold underline, MY TASKS, CASES)
└─ CARD(icon+H1 "Home", style=#F0B323, h≈80) padding=STANDARD
```
- **Above the fold**: nav bar, yellow title bar, empty white canvas
- **Reading order**: single-column
- **Hierarchy rationale**: only one content element exists — the title bar — so identity is the entire message; icon precedes text to anchor scan start (task 1)
- **Density**: 1 — a single header bar occupies the top ~12% of the viewport; everything else is white space (demo page)
- **Ratios & spacing**: full-bleed bar; `padding: "STANDARD"`, `marginBelow: "NONE"` (CODE-VERIFIED) so the bar sits flush under the nav

### Styling specifics (CODE-VERIFIED where SAIL present)
- **Palette**: nav #2D3A45 (est.); title bar #F0B323 (CODE-VERIFIED `style`); heading text near-black default; page bg WHITE (CODE-VERIFIED `backgroundColor`)
- **Color application points**: title bar fill only; nav active-tab underline in the same gold family (OBSERVED); no other color on page
- **Typography moves**: H1 "Home" = MEDIUM, `fontWeight: "SEMI_BOLD"` (CODE-VERIFIED — page text says "Medium Plus / Strong" for the rich-text variant); leading `home` icon at MEDIUM_PLUS, `sideBySideLayout(alignVertical: "MIDDLE")` with icon item `width: "MINIMIZE"`
- **Imagery stance**: none
- **Card treatment**: filled, `showBorder: false`, `height: "AUTO"`
- **Signature moves**: instead of a plain page-title heading, page identity rides on a full-width brand-color card via `a!cardLayout(style: hex)` inside `headerContentLayout` header; instead of a large title, a modest MEDIUM heading gains prominence purely from the contrasting bar

### Component inventory (CODE-VERIFIED)
- `a!headerContentLayout(header: a!cardLayout(style:"#F0B323", padding:"STANDARD", showBorder:false), backgroundColor:"WHITE")`
- `a!sideBySideLayout(alignVertical:"MIDDLE")` → `a!richTextIcon(icon:"home", size:"MEDIUM_PLUS")` + `a!headingField(text:"Home", size:"MEDIUM", fontWeight:"SEMI_BOLD", headingTag:"H1", marginBelow:"NONE")`
- Interactive affordances: site nav only

### Character & judgment
- **Register**: institutional + warm-community — flat gold bar reads civic/branded, not decorative
- **Why it works**: saturated gold (#F0B323) against dark slate nav gives instant orientation; dark text on gold keeps contrast high; H1 tag preserved for a11y despite modest visual size
- **Why not boring**: brand color carries the header instead of default white chrome; icon+title pairing; flush bar (no margins/borders) makes it read as site chrome rather than page content
- **Boring twin**: a white page with "Home" as a LARGE section label at top-left, no bar, no icon — orientation would rely on nav highlight alone
- **What to steal**: put page identity on a `cardLayout` with a brand hex in the `header` slot; keep heading MEDIUM/SEMI_BOLD and let the bar do the shouting
- **Risks**: gold bar + gold nav underline could collide with semantic WARN yellows elsewhere; dark-on-gold contrast is fine but white-on-gold (a tempting variant) would fail WCAG

### Code cross-check
- **Code-verified palette**: bar #F0B323; content bg WHITE
- **Notable techniques**: header card with `marginBelow:"NONE"` (flush); icon sized one step above text (MEDIUM_PLUS vs MEDIUM); `width:"MINIMIZE"` on icon item
- **Corrections**: heading is `a!headingField` MEDIUM + SEMI_BOLD, while the page prose describes a rich-text MEDIUM_PLUS/STRONG variant — code wins for this screenshot

## image42.png

### Identification
- **Image**: image42.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Key performance indicators header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (KPI header pattern demo; body empty)

### Use-case reconstruction (INFERRED)
- **Persona**: fundraising program manager, weekly-manager cadence, checks campaign health then acts
- **Domain & brand context**: Boreas Foundation nonprofit; ops-flavored home page
- **Top 3 user tasks (ranked)**: 1. Scan 5 program KPIs and their week-over-week direction 2. Launch a new campaign (sole action) 3. Navigate to tasks/cases
- **Implied requirements**: "All KPIs visible without scrolling"; "Each KPI must show trend direction and magnitude"; "Primary action must be reachable from the header itself"; "KPI strip must not crowd the (content) area below"
- **Data model sketch**: KPI(label, value%, delta%, direction, icon); Campaign(count=11 active) — read off the strip

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ SITE-NAV dark bar
└─ CARD(KPI-ROW ×5 + BUTTON "NEW CAMPAIGN", style=#EEE)
   └─ COLUMNS [WIDE_PLUS: AUTO spacer: NARROW]
```
- **Above the fold**: nav, KPI strip, empty canvas
- **Reading order**: F — one horizontal sweep across KPIs ending at the action button
- **Hierarchy rationale**: values (MEDIUM_PLUS bold) outweigh labels (small caps) — numbers are the payload; the only saturated element is the action button, so the eye terminates on "what can I do"
- **Density**: 1 for the page as demoed (single strip, empty body); the strip itself packs 5 metrics + 1 action in one bar
- **Ratios & spacing**: 5 equal KPI columns with vertical dividers, `spacing: "SPARSE"`; button right-aligned in NARROW column

### Styling specifics (OBSERVED; sibling SAIL for image57 CODE-VERIFIES the same construct)
- **Palette**: strip #EEEEEE (CODE-VERIFIED via identical card in image57 code: `style: "#eee"`); nav #2D3A45 (est.); button solid accent blue #1A689D (est.; SAIL uses default SOLID accent); deltas POSITIVE green / NEGATIVE red semantics
- **Color application points**: semantic color confined to tiny delta carets; value icons are muted SECONDARY gray; single blue on the button — color budget spent exactly where meaning lives
- **Typography moves**: all-caps KPI labels ≈ STANDARD secondary; values MEDIUM_PLUS + STRONG with leading SECONDARY icon; deltas STANDARD with caret icons
- **Imagery stance**: styled icons only (money, user-circle, user-plus, refresh, bullhorn — SECONDARY, MEDIUM_PLUS)
- **Card treatment**: filled light gray, no border/shadow
- **Signature moves**: instead of `a!kpiField` defaults, hand-built KPIs from `richTextDisplayField` columns (CODE-VERIFIED pattern in image57 SAIL) for exact icon/value/delta control; `showDividers: true` columns instead of separate cards; action button embedded in the KPI bar instead of a page toolbar

### Component inventory (OBSERVED → CODE-VERIFIED via image57 twin)
- `a!cardLayout(style:"#eee")` → `a!columnsLayout(spacing:"SPARSE", showDividers:true)` ×5 + `a!buttonWidget(label:"NEW CAMPAIGN", icon:"plus-circle", size:"LARGE", style:"SOLID", align:"END")`
- No charts; no filters; nav only

### Character & judgment
- **Register**: authoritative-executive + utilitarian-ops — bare numbers, one action, zero decoration
- **Why it works**: gray strip separates metrics from both dark nav and white body without borders; up/down carets colored semantically while values stay neutral (avoids implying green=good for every metric); "ACTIVE CAMPAIGNS 11" omits a delta rather than faking one
- **Why not boring**: per-KPI leading icons give each metric a scannable anchor; LARGE solid button inside the strip converts a passive dashboard band into a launchpad; dividers instead of card-per-KPI keep the band quiet
- **Boring twin**: five white `a!kpiField` cards with drop shadows in a card group, action button floating top-right of the page, everything shouting equally
- **What to steal**: reserve saturated color for the single action; build the KPI band as one filled card with divided columns; pair every delta with a caret icon
- **Risks**: green/red carets alone are a colorblind hazard (direction is duplicated by caret shape — good); #eee strip on white body is a low-contrast boundary on poor monitors

## image75.png

### Identification
- **Image**: image75.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Hero card header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (hero header demo; body empty)

### Use-case reconstruction (INFERRED)
- **Persona**: donor / occasional-customer visiting the foundation's public-facing home
- **Domain & brand context**: Boreas Foundation; mission-driven, premium nonprofit storytelling
- **Top 3 user tasks (ranked)**: 1. Absorb the mission statement 2. Feel brand credibility 3. Continue into content below
- **Implied requirements**: "Hero must visually fuse with the site header bar"; "Message must be readable without photo-contrast tricks"; "Illustration must decorate without competing with text"
- **Data model sketch**: none — pure messaging surface

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ SITE-NAV (same fill as hero → fused block)
└─ CARD(hero, style=dark slate, h≈530)
   ├─ TEXT-BLOCK left (4-line mission, light)
   └─ ILLUSTRATION right (iceberg, penguins, aurora)
```
- **Above the fold**: fused nav+hero block (~48% of viewport height), then white emptiness
- **Reading order**: Z — headline left, illustration right
- **Hierarchy rationale**: one message, sized LARGE_PLUS/EXTRA_LARGE, gets the whole band; nav disappears into the hero so the brand block reads as a single billboard
- **Density**: 1 — one idea per screen, huge type, generous negative space
- **Ratios & spacing**: text block occupies left ~40% with wide margins; illustration anchors right ~40%

### Styling specifics (OBSERVED)
- **Palette**: hero + nav #37474F (est.) continuous fill; text #ECEFF1 (est.); illustration whites/ice blues #E8EEF4/#B9CCDE (est.), aurora gold #C9A86B (est.); penguin accents black/white/gold
- **Color application points**: single dark field; warm gold appears only in aurora + nav active underline — brand echo
- **Typography moves**: mission set ≈ LARGE_PLUS, light/regular weight (not bold), sentence case with terminal period — editorial voice; no subtitle, no button
- **Imagery stance**: flat vector illustration (not photo) — geometric iceberg facets, three stylized penguins, translucent aurora bars
- **Card treatment**: filled, flush, no border; hero ends in a hard straight edge against white body
- **Signature moves**: instead of a photo billboard, a flat illustration on a solid card whose fill exactly matches the site header ("Mercury" style) so chrome+hero become one hero element; instead of bold display type, light-weight large type carries a calm, premium tone

### Component inventory (OBSERVED)
- `a!cardLayout(style: dark hex, marginBelow:"NONE")` in header slot; `a!richTextDisplayField` large light text; illustration likely `a!imageField`/background media
- Interactive affordances: nav only

### Character & judgment
- **Register**: premium-editorial + warm-community
- **Why it works**: nav-to-hero color fusion removes the "app chrome" seam that photo billboards keep; solid dark ground guarantees text contrast (compare image49, which needs a card to fix photo contrast); illustration sits right of the text's reading path so nothing overlaps the message
- **Why not boring**: light-weight display type on near-black slate; aurora rendered as translucent rectangles (geometric, on-system) rather than a photo; brand gold reappears in exactly two quiet places
- **Boring twin**: white page, centered bold "Welcome to Boreas Foundation" over a stock penguin photo with a dark scrim and a "Learn More" button
- **What to steal**: match the hero card fill to the site-header bar color; prefer flat illustration over photos when text must sit on the band; drop the CTA when the message is the point
- **Risks**: 4-line hero pushes all content below the fold; illustration must be supplied as an asset (not SAIL-native); light text weight thins further on Windows font rendering

## image11.png

### Identification
- **Image**: image11.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Filter bar header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical (personal finance)

### Use-case reconstruction (INFERRED)
- **Persona**: consumer account holder, weekly check-in on spending; also the demo persona for URL-parameter filtering
- **Domain & brand context**: Appian-branded personal finance/banking demo ("appian" logo nav; DASHBOARD | ACCOUNTS | STATEMENTS)
- **Top 3 user tasks (ranked)**: 1. Filter all page data by date/account/category 2. Monitor credit utilization per account 3. Review transactions and category spending mix
- **Implied requirements**: "Filters must visibly govern the whole page (top placement)"; "Filter state must be shareable/bookmarkable via URL params" (page text); "Utilization must be judged at a glance (semantic gauge color)"; "Transactions must be scannable with vendor+category and amount+account condensed"
- **Data model sketch**: Account(accountName, accountNumber ****, creditLimit, total, type) 1—* Transaction(date, vendor, category, amount, account); Category(name, icon, color, total) 1—* Transaction; TopExpense(vendor, date, amount→category); 4 accounts, 7 visible transactions of 77, 6 categories (OBSERVED labels/values)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=TRANSPARENT
├─ SITE-NAV dark (appian logo, DASHBOARD active)
├─ CARD(filter bar: date, date, dropdown, dropdown; style=NONE, shadow)
└─ CONTENTS
   ├─ SECTION "OPEN ACCOUNTS" → CARD-GROUP ×4 (gauge + account rich text), cardWidth=NARROW
   └─ COLUMNS [AUTO:AUTO]
      ├─ SECTION "TRANSACTIONS" → CARD(GRID(7 rows, 4 cols))
      └─ SECTION "SPENDING BY CATEGORY" → CARD(6-col icon stat strip, dividers)
         SECTION "TOP EXPENSES" → COLUMNS [MEDIUM:AUTO]: CARD(CHART(donut)) | CARD-GROUP ×4 (stamp rows)
```
- **Above the fold**: everything (single 1999×1250 composition): filter bar, 4 account cards, full grid, category strip, donut + 4 expense cards
- **Reading order**: F — filter bar, account row, then two-column body
- **Hierarchy rationale**: filters first because they scope everything (task 1); accounts next as the highest-stakes numbers (utilization); detail grids/charts last
- **Density**: 4 — ~16 data zones in one viewport (4 gauge cards, 7-row grid, 6-stat strip, donut, 4 expense rows) with compact STANDARD padding
- **Ratios & spacing**: transactions column ≈ spending column (AUTO:AUTO); cards `padding:"STANDARD"`, `marginBelow:"STANDARD"`; filter items sparse-spaced with dropdowns at `width:"2X"` vs MINIMIZE dates (CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: page bg default light gray (backgroundColor:"TRANSPARENT"); cards white `style:"NONE"` + `showShadow:true`, `shape:"SEMI_ROUNDED"`; category brand colors — Travel #0D47A1, Groceries #8036E6, Shopping #00BCD4, Food & Drink #07987C, Entertainment #E4356C, Other #810172; gauge semantics POSITIVE/WARN/NEGATIVE by utilization (>49 NEGATIVE, >30 WARN); helper text #666666
- **Color application points**: gauges (semantic), category icons + donut slices + stamp backgrounds (identity — same hex per category across three components), active-tab underline; grid is colorless
- **Typography moves**: section headers `upper()` SMALL BOLD SECONDARY (eyebrow style); account name MEDIUM STRONG; balance MEDIUM_PLUS STRONG with "/ limit" SECONDARY; grid two-line cells — primary line + SMALL SECONDARY sub-line (vendor/category, amount/account); expense amounts MEDIUM_PLUS
- **Imagery stance**: styled icons (LARGE category icons; TINY stamps with white glyphs on category hexes)
- **Card treatment**: shadow, no border, semi-rounded — uniform across all cards
- **Signature moves**: instead of a page title, the filter bar IS the header (`a!headerContentLayout(header: cardLayout(style:"NONE", showShadow:true))`); one `local!categoryBranding` map drives icon+color for strip, donut (`a!colorSchemeCustom(local!categoryBranding.color)`), and stamps — palette-as-data; grid rows compress two fields per cell via nested rich text; `borderStyle:"LIGHT"`, `shadeAlternateRows:false` for a quiet grid

### Component inventory (CODE-VERIFIED)
- `a!dateField` ×2, `a!dropdownField` ×2 (placeholders "All accounts"/"All categories") in `a!sideBySideLayout(spacing:"SPARSE")`
- `a!cardGroupLayout(cardWidth:"NARROW")` of `a!gaugeField(size:"SMALL", primaryText:a!gaugePercentage(), color:a!match(...))`
- `a!gridField(pageSize:7, initialSorts:date, borderStyle:"LIGHT")` with icon-width kebab column (`a!buttonWidget(icon:"ellipsis-v", style:"LINK")`)
- `a!pieChartField(style:"DONUT", colorScheme:a!colorSchemeCustom(...), seriesLabelStyle:"LEGEND", height:"TALL", showAsPercentage:true)`
- `a!stampField(size:"TINY", backgroundColor: category hex)` expense rows
- Search box + SEARCH button + export/filter/refresh toolbar (OBSERVED in image; code comments delegate these to record data)

### Character & judgment
- **Register**: energetic-consumer + utilitarian-ops — dense but colorful, personal not corporate
- **Why it works**: categorical color is 100% consistent (same hex for icon, slice, stamp) so the donut needs no double legend lookup; semantic gauge coloring turns 4 numbers into an instant triage row; eyebrow headings organize 5 zones without heavy chrome
- **Why not boring**: no page title at all (nav tab carries identity — cross-ref page-titles "No page title"); vivid 6-hue identity palette against otherwise gray/white UI; two-line grid cells halve row count without losing fields
- **Boring twin**: a "My Finances" H1, filters buried in a sidebar accordion, one blue-series bar chart, single-line grid with 8 columns, all cards bordered
- **What to steal**: drive icon+color+slice from one branding map; put page-scoped filters in the header slot with a shadow to show they float above content; use `a!match` thresholds for gauge semantics
- **Risks**: 6-hue palette nears the categorical ceiling; WARN amber gauge text on white is borderline; dense layout stacks poorly unless `stackWhen` respected (code includes it)

## image82.png

### Identification
- **Image**: image82.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Decorative billboard header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (product launch workspace)

### Use-case reconstruction (INFERRED)
- **Persona**: product launch manager (retail/consumer goods), daily-operator during launch window
- **Domain & brand context**: fashion/homeware brand ("Otaru Collection" ceramics; LAUNCHES | SHOWS | CAMPAIGNS | COLLECTIONS nav; red logo) — premium consumer brand with ops tooling
- **Top 3 user tasks (ranked)**: 1. Track launch-activity completion (pricing/marketing/distribution checklists) 2. Collaborate via comment thread with attachments 3. Verify launch scope (countries, items) and review product imagery
- **Implied requirements**: "Record identity must carry brand imagery, not just text"; "Activity status must show exceptions (overdue/incomplete) distinctly"; "Country readiness must be scannable as a matrix"; "Discussion must live beside, not below, the work"
- **Data model sketch**: Launch(name "Otaru Collection", style# 432772, launchDate 4/15/2020, manager, owner) 1—* Country(code, readiness✓) [15 shown], 1—* Item(name) [6 chips], 1—* Activity(group ∈ {Pricing, Marketing, Distribution}, name, status ∈ {complete✓, warning△}), 1—* Comment(author, timestamp, body, photo attachments), 1—* Photo(hero + 6 thumbs)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ SITE-NAV charcoal (red active underline)
├─ BILLBOARD h≈230 photo=ceramics overlay=bottom-bar,dark-scrim
│  └─ title "Otaru Collection"+style# | launch date | manager avatar | owner avatar
└─ COLUMNS [≈5:4:3]
   ├─ GALLERY: hero photo + GRID(3×2 thumbs)
   ├─ EVENT-FEED: comment input + threaded comments w/ inline photo attachments
   └─ RAIL: BOX "Launch Countries"(flag+✓ ×15, 3-col) · BOX "Launch Items"(chips ×6) · BOX "Launch Activities"(grouped checklist ✓/△)
```
- **Above the fold**: billboard + title bar + top of all three columns
- **Reading order**: F — billboard identity strip, then left-to-right across gallery/feed/rail
- **Hierarchy rationale**: brand imagery leads because the record IS a visual product; status rail sits right for constant reference while the feed (task 2) holds center
- **Density**: 4 — three simultaneous columns, ~30 status atoms in the rail, threaded feed; compact paddings
- **Ratios & spacing**: billboard short (~18% of height) so work stays above fold; rail boxes use gray header bars and tight row spacing

### Styling specifics (OBSERVED)
- **Palette**: nav #3A3A3A (est.) + brand red #E8283C (est.); billboard photo desaturated grays; overlay scrim ≈70% black; white title text; body links/names #1B6AC9 (est.); success ✓ green #34A853 (est.); warning △ red-orange; boxes bg white with #EEEEEE (est.) header bars on light gray page
- **Color application points**: red = brand only (logo, paper-plane icon, active underline); green = completion state everywhere; blue = interactive text; photography carries all richness
- **Typography moves**: record title LARGE_PLUS white on scrim with SMALL gray "Style 432772" sub-line; right-side header metadata as label-over-value pairs with avatars; rail section titles STANDARD bold on gray bars; activity groups all-caps with icons
- **Imagery stance**: dominant photography (billboard + gallery + attachment thumbs + avatars) — the most photo-heavy pattern on the page
- **Card treatment**: bordered boxes with filled header strips (classic "portal box" look) rather than shadowed cards
- **Signature moves**: instead of a text title bar, identity rides a photo billboard with a bottom scrim bar (overlay=BOTTOM, dark) holding title + people metadata; instead of a status grid, country readiness renders as flag+check chips in a 3-col matrix; checklist uses one red warning triangle to make the single exception ("In-store campaigns") pop against 14 green checks
- **Density**: (see above) 4

### Component inventory (OBSERVED)
- `a!billboardLayout(backgroundMedia: photo, overlayPositionBar: "BOTTOM", overlayStyle: "DARK")` equivalent; `a!sideBySideLayout` metadata with `a!imageField` avatars
- Gallery `a!imageField` grid; comment feed ≈ `a!recordActionField`-adjacent custom feed (input `a!paragraphField`, entries rich text + thumbs)
- Rail: `a!sectionLayout`/boxed cards; `a!tagField`-like gray chips; `a!richTextIcon` check/warning lists
- Interactive affordances: comment input, per-activity links, "COMPLETE" action link on the flagged row

### Character & judgment
- **Register**: premium-editorial + utilitarian-ops — gallery-grade imagery wrapped around checklist machinery
- **Why it works**: the scrim bar keeps white title text legible over a busy photo while the photo still sells the product; exception-first coloring (one △ among ✓s) makes the overdue item the loudest pixel in the rail; three-column split maps exactly to the three user tasks
- **Why not boring**: full-bleed product photography as chrome; flags as data glyphs; people (manager/owner) surfaced in the header as accountable faces
- **Boring twin**: white header reading "Launch: Otaru Collection (432772)", a tabbed detail view with a Documents tab hiding photos, activities in a paginated grid with a Status column
- **What to steal**: bottom-scrim billboard for photogenic records; readiness matrices as icon+check chips; reserve the sole warning hue for the sole exception
- **Risks**: scrim must stay dark enough across arbitrary photos (page text warns: choose shade/transparency deliberately); flag glyphs alone are ambiguous without country codes (codes are present — good); 3-column layout needs a stacking plan for tablet

## image49.png

### Identification
- **Image**: image49.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Use a card to create high contrast for overlay contents")
- **Device frame**: desktop
- **Marker**: neutral (technique demo)
- **UI type**: home-page (billboard header demo; body empty)

### Use-case reconstruction (INFERRED)
- **Persona**: donor / first-time-public visitor
- **Domain & brand context**: Boreas Foundation; mission hero over live photography
- **Top 3 user tasks (ranked)**: 1. Read the mission statement 2. Register the brand's subject matter (photo) 3. Continue below
- **Implied requirements**: "Overlay text must pass contrast on an UNCONTROLLED photo"; "Photo must remain visible, not buried under a full scrim"; "Message block must sit on the billboard grid, off the focal subject"
- **Data model sketch**: none — messaging surface

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ SITE-NAV dark
└─ BILLBOARD h≈530 photo=penguins-on-ice overlay=left,card
   └─ CARD(mission text, solid teal-blue, w≈32%)
```
- **Above the fold**: nav + billboard (~48% viewport), white body
- **Reading order**: Z — card left, penguins right
- **Hierarchy rationale**: the card is the only saturated block on a near-white photo, so it wins first fixation; penguins (photo subject) sit right of it, untouched
- **Density**: 1 — one message, one photo
- **Ratios & spacing**: card spans ~1/3 width, inset from top/left edges (overlay column placement); generous internal padding ≈ MORE

### Styling specifics (OBSERVED)
- **Palette**: photo field near-white/gray sky+ice; card #2E6B85 (est.) solid teal-blue; text #FFFFFF; nav #2D3A45 (est.)
- **Color application points**: single solid card — the entire color story
- **Typography moves**: mission ≈ LARGE_PLUS, regular weight, left-aligned, 5 lines; no title/subtitle distinction, no CTA
- **Imagery stance**: full-bleed photo (penguins on ice), intentionally light/overexposed — the worst case for white overlay text, which is the demo's point
- **Card treatment**: filled, opaque (not translucent), square corners, no border
- **Signature moves**: instead of a full-width dark scrim over the photo, a compact opaque card guarantees AAA-ish contrast while ≥60% of the photo stays pristine; card color pulled from the brand's teal family rather than neutral black — contrast fix doubles as brand moment
- **Density**: 1

### Component inventory (OBSERVED)
- `a!billboardLayout(backgroundMedia: a!webImage(...), overlayPositionColumn: "START")` with `a!cardLayout(style: teal hex)` inside the overlay holding `a!richTextDisplayField`
- Interactive affordances: none beyond nav

### Character & judgment
- **Register**: premium-editorial
- **Why it works**: opaque card makes text contrast independent of photo luminance (compare the sibling scrim approach in image82); card placement respects the photo's subject (penguins un-occluded); white-on-teal reads calm and institutional
- **Why not boring**: the contrast mechanism is itself branded (teal card); no dimming of the photo, so the billboard stays bright and optimistic — rare among hero patterns that default to moody scrims
- **Boring twin**: same photo with a 60% black full-bleed overlay and centered white bold text — legible, but the photo dies and the brand reads generic
- **What to steal**: when the photo is light or uncontrolled, put overlay text on an opaque brand-color card instead of scrimming the whole image; keep the card to ≤1/3 width and off the subject
- **Risks**: fixed card width can collide with the photo subject at other breakpoints; long translations will grow the card over the penguins; opaque card hides whatever sits behind it (choose photos with dead zones)

## image57.png

### Identification
- **Image**: image57.png | **Source page**: page-headers | **Alt/caption**: none (heading: "Mix and match header types")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-executive (stacked header demo; body empty)

### Use-case reconstruction (INFERRED)
- **Persona**: fundraising director, weekly-manager; wants brand feel AND numbers in one glance
- **Domain & brand context**: Boreas Foundation
- **Top 3 user tasks (ranked)**: 1. Orient ("My Dashboard") 2. Scan 5 KPIs + deltas 3. Start a new campaign
- **Implied requirements**: "Header must combine decoration, identity, and metrics without scrolling"; "Each band must be visually distinct yet flush-stacked"; "Primary action lives in the KPI band"
- **Data model sketch**: same KPI set as image42 (gift dollars 82.9% ↑1.9, retention 74.2% ↓2.3, new donors 91.6% ↑3.0, recurring 48.5% ↓5.1, campaigns 11)

### Layout anatomy (OBSERVED, CODE-VERIFIED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
├─ SITE-NAV dark
├─ BILLBOARD h=EXTRA_SHORT photo=king-penguins marginBelow=NONE
├─ CARD(icon+H1 "My Dashboard", style=#165C7D) padding=STANDARD
└─ CARD(KPI-ROW ×5 dividers + BUTTON LARGE SOLID, style=#eee)
   └─ COLUMNS [WIDE_PLUS : AUTO : NARROW]
```
- **Above the fold**: all three header bands + empty body
- **Reading order**: single-column stack of three bands, then F across KPI band
- **Hierarchy rationale**: decoration (photo) is shortest band — mood only; identity band next (title on brand blue); metrics band tallest content — ordered exactly by task priority inverted from visual richness
- **Density**: 1 as demoed (three bands, empty body); header itself layers 3 information types in ~28% of viewport
- **Ratios & spacing**: every band `marginBelow: "NONE"` — flush stack (CODE-VERIFIED); KPI columns `spacing:"SPARSE", showDividers:true`

### Styling specifics (CODE-VERIFIED)
- **Palette**: billboard photo (king penguins, gold/black/white); title card #165C7D; KPI card #eee; button default SOLID accent; deltas POSITIVE/NEGATIVE
- **Color application points**: each band gets exactly one treatment — photo, brand blue, neutral gray; semantic color only on carets
- **Typography moves**: H1 "My Dashboard" MEDIUM SEMI_BOLD white + tachometer icon MEDIUM_PLUS; KPI labels caps STANDARD; values MEDIUM_PLUS STRONG (all `a!richTextItem` builds)
- **Imagery stance**: photo billboard EXTRA_SHORT — a sliver of imagery as garnish
- **Card treatment**: filled bands, no borders/shadows, flush
- **Signature moves**: three header primitives (billboard, title card, KPI card) concatenated in one `header:{}` array with all margins zeroed — the header slot as a stacking system; EXTRA_SHORT billboard proves decoration can cost ~90px; hand-rolled KPI row (richText icon+value+caret) instead of `a!kpiField` for pixel control
- **Density**: (above)

### Component inventory (CODE-VERIFIED)
- `a!billboardLayout(backgroundMedia:a!webImage(unsplash), height:"EXTRA_SHORT", marginBelow:"NONE")`
- `a!cardLayout(style:"#165C7D")` → sideBySide icon (tachometer MEDIUM_PLUS) + `a!headingField(size:"MEDIUM", fontWeight:"SEMI_BOLD", headingTag:"H1")`
- `a!cardLayout(style:"#eee")` → `a!columnsLayout([WIDE_PLUS, AUTO, NARROW], alignVertical:"MIDDLE")`; inner 5-col `spacing:"SPARSE", showDividers:true`; `a!buttonWidget(label:"NEW CAMPAIGN", icon:"plus-circle", size:"LARGE", style:"SOLID", align:"END")`
- Charts: none; affordances: button + nav

### Character & judgment
- **Register**: authoritative-executive + warm-community — numbers framed by mission imagery
- **Why it works**: flush stacking (`marginBelow:"NONE"` everywhere) makes three cards read as one engineered header; band contrast sequence dark-nav → photo → brand-blue → light-gray gives each layer a distinct luminance step; the one LARGE solid button is the only saturated interactive element
- **Why not boring**: the photo sliver adds brand warmth for almost no vertical cost; blue title band doubles as a visual divider between photo and data; KPI band inherits all image42 virtues
- **Boring twin**: a tall photo hero with title text scrimmed on top, KPIs floated as four shadowed white cards below, action button top-right — 2× the height, half the cohesion
- **What to steal**: compose headers as flush stacked cards; order bands mood→identity→data; keep the billboard EXTRA_SHORT when it's purely decorative
- **Risks**: photo band with no overlay text is decorative weight on slow connections; three stacked bands + nav consume ~350px before content on laptops; white-on-#165C7D is comfortably ≥4.5:1 but icon-only elements would not be

### Code cross-check
- **Code-verified palette**: #165C7D title band; #eee KPI band; billboard via Unsplash `a!webImage`
- **Notable techniques**: header array stacking with zeroed margins (lines ~1237–1548); KPI cells as `richTextIcon(color:"SECONDARY", size:"MEDIUM_PLUS")` + value + caret pairs; spacer `a!columnLayout(width:"AUTO")` between KPIs and button
- **Corrections**: none — pixels match params
