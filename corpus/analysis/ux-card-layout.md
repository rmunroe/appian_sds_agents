# Analysis: ux-card-layout

Source page: `corpus/pages/ux-card-layout.md` (components section). SAIL source exists on-page only for the Width and Nested-cards examples; those claims are CODE-VERIFIED. All other colors are pixel estimates.
Tier overrides: most images the manifest marked "A" are documentation parameter-demo figures (labeled variant crops on a plain canvas), not full-page UIs — per protocol rule 4 these are analyzed as tier B. Genuine full-page screenshots (image11stacked, image17border, image63border, image79border, image88border, and the DON'T pages) keep tier A/C treatment.

## image11stacked.png

### Identification
- **Image**: image11stacked.png | **Source page**: ux-card-layout | **Alt/caption**: "alttext" — heading "When to use a card layout"
- **Device frame**: desktop
- **Marker**: neutral (functions as an internal DO/DON'T: top = with cards, bottom = same page without cards)
- **UI type**: dashboard-analytical (consumer personal-finance)

### Use-case reconstruction (INFERRED)
- **Persona**: retail-banking customer; occasional-customer checking finances weekly/monthly
- **Domain & brand context**: consumer credit-card/expense tracking; Appian-branded demo; trustworthy-bank feel with consumer-friendly color pops
- **Top 3 user tasks (ranked)**: 1. Check utilization/balance per credit account 2. Review & search recent transactions 3. Understand spending mix and largest expenses
- **Implied requirements**: "Must show % utilization against limit for every account without scrolling"; "Must let users filter by date range, account, and expense category"; "Must support transaction search with pagination (77 records)"; "Must rank top expenses and tie them to categories"
- **Data model sketch** (OBSERVED labels): Account(bank, ····last4, utilization%, balance, limit) ×4; Transaction(date, vendor, category, amount, account) 1–7 of 77; Category(name, icon, total) ×6; TopExpense(vendor, date, amount) ×4. Account 1—* Transaction; Category 1—* Transaction.

### Layout anatomy (OBSERVED)
- **Skeleton** (top variant):
```
HEADER-CONTENT
├─ NAVBAR dark-navy: brand + TABS ×3 (DASHBOARD|ACCOUNTS|STATEMENTS) + avatar
├─ FORM filter row [startDate : endDate : account : category]
├─ SECTION "OPEN ACCOUNTS" → KPI-ROW ×4 CARD(donut-gauge + bank + $used/$limit)
└─ COLUMNS [1:1]
   ├─ SECTION "TRANSACTIONS" → CARD(search + GRID(7 rows, pager 1–7 of 77))
   └─ SECTION "SPENDING BY CATEGORY" → CARD(icon-stat ×6)
      └─ SECTION "TOP EXPENSES" → SBS [CARD(CHART(donut)) : CARD ×4 vendor+amount]
```
- **Above the fold**: nav, filters, all four account gauges, ~5 grid rows, category totals
- **Reading order**: F — accounts row first, then left grid / right analytics
- **Hierarchy rationale**: gauges first because balance-vs-limit is the recurring anxiety check (task 1); transactions get the widest zone (task 2 needs scanning room); analytics stacked right as secondary
- **Density**: 4 — four cards + 7-row grid + 6 icon stats + donut + 4 expense cards in one viewport
- **Ratios & spacing**: main split ≈ [1:1]; card padding ≈ STANDARD; section gaps ≈ marginBelow STANDARD; figure canvas #ececec (est.) frames both screenshots

### Styling specifics (OBSERVED)
- **Palette**: page bg #f7f7f7 (est.), card bg #ffffff, header navy #1a2742 (est.), link/pager blue #2f7fe0 (est.), gauge green #70bf4e (est.), gauge amber #f0a840 (est.), gauge red #d32f4b (est.), category hues: travel blue #2a6fd6, groceries purple #8e5bd9, shopping cyan #35b5e5, food green #3ba55c, entertainment pink #e0447c, other violet #9635b5 (all est.), neutrals #222222 text / #9a9a9a secondary / #e5e5e5 borders (est.)
- **Color application points**: navbar (only solid dark block); gauge rings encode severity; category icons; donut slices; circular icon chips on expense rows; underline on active tab (red #d32f4b est.)
- **Typography moves**: section labels all-caps SMALL gray; bank names STANDARD bold; balances MEDIUM_PLUS bold; gauge % MEDIUM; grid text STANDARD/SMALL; no oversized hero numbers — even, workmanlike scale
- **Imagery stance**: styled icons only (flat category glyphs ~24px + colored circle chips); user avatar photo in nav
- **Card treatment**: white, thin #e5e5e5 (est.) border, no shadow, squared corners
- **Signature moves**: instead of a plain accounts table, donut-gauge cards with severity-colored rings (a!gaugeField-like via chart); instead of one analytics blob, nested mini-cards for each top expense inside the section; instead of gray icon set, six distinct hues keyed to category; filter bar spans full width directly under nav (global scope signal)

### Component inventory (OBSERVED)
- a!headerContentLayout; a!cardLayout(showBorder:true, padding:"STANDARD") throughout; a!gridField(7 rows, sort on Date, row menu ⋮, pager); a!textField + dropdowns for filters; donut = a!pieChartField(style:"DONUT", custom colorScheme); icon stats = a!sideBySideLayout + a!richTextIcon; top-expense rows = small cardLayouts with icon chip + amount
- Interactive affordances: search box, column sort, per-row menu, pager, filter dropdowns, "select a slice" cross-filter hint

### Character & judgment
- **Register**: calm-clinical + energetic-consumer — neutral chrome and thin borders, but saturated category hues keep it friendly
- **Why it works**: the four-gauge row answers "am I over-extended?" in one glance; card borders carve the 50/50 columns into scannable zones; consistent icon hue system links category tiles → donut slices → expense chips
- **Why not boring**: severity-colored utilization rings; six-hue icon taxonomy reused across three zones; expense list rendered as stacked mini-cards instead of a fourth grid; dark navy bar + red active-tab underline as the only chrome color
- **Boring twin**: the bottom screenshot IS the boring twin — same data, no cards: sections dissolve into white, the gauge row floats unanchored, grid and donut collide, and only all-caps labels separate zones
- **What to steal**: wrap each value+chart pair in its own bordered card; key one hue system across chart, tiles, and lists; put global filters in a full-width band under the nav
- **Risks**: amber/green rings near-equal luminance (colorblind users rely on % text — present); 6 hues risk noise on denser pages; two-screenshot figure implies scrolling below fold on real 1366×768 viewports

### Code cross-check
- none (no SAIL source for this figure)

## image33stacked.png

Tier override: manifest says A/neutral, but this is a 3200×700 comparison strip, not a full page → analyzed as a tier-C principle (both states inside one image).

### Principle: Card-wrap each KPI+sparkline pair
- **DO shows** (top row): four white bordered cards (#e0e0e0 est. border), each pairing label + big number + delta + sparkline: Total Revenue $3,276.91 ▲ $116.31 (18%) green #3d9c46 (est.); Revenue Per User $374.12 ▼ (7%) red #cc3b33 (est.); New Orders 1275 ▼; New Users 76 ▲. Sparkline color matches delta direction.
- **DON'T shows** (bottom row): identical eight elements on one borderless white band — each sparkline drifts ambiguously toward the next metric's label; pair boundaries vanish
- **Rule**: when value+chart pairs repeat horizontally, give each pair its own bordered card
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!columnsLayout of four a!cardLayout(showBorder:true, padding:"STANDARD"), each holding richText KPI + axis-less line microchart

## card_height.png

Tier override A→B: labeled parameter-demo figure. Official vocabulary: Auto (default), Extra Short … Extra Tall fixed values.

### Auto Height
- **Produces it**: a!cardLayout(height:"AUTO")
- **Looks like**: card hugs its KPI content; bottom edge sits just under the numbers
- **Use when**: content length varies and dead space is unacceptable | **Avoid when**: a row of cards must align to equal heights
- **Styling hooks**: height, padding
- **Pairs well with**: stacked dashboards, feeds
- **Marker**: neutral

### Fixed Height ("MEDIUM_PLUS")
- **Produces it**: a!cardLayout(height:"MEDIUM_PLUS")
- **Looks like**: same content, card extends to reserved height leaving blank space; overflow would scroll internally
- **Use when**: equalizing card rows or reserving layout stability | **Avoid when**: sparse content makes the void obvious (visible here)
- **Styling hooks**: height ladder EXTRA_SHORT→EXTRA_TALL
- **Pairs well with**: uniform grid-of-cards galleries
- **Marker**: neutral

## card_background_color.png

Tier override A→B. Official vocabulary: style None / Transparent / Standard / Accent / Success / Info / Warn / Error / Charcoal / Navy / Plum / custom hex.

### None (default)
- **Produces it**: a!cardLayout(style:"NONE")
- **Looks like**: white card, standard #e0e0e0 (est.) border; text #222 (est.)
- **Use when**: content cards (the recommended default) | **Avoid when**: card must blend into non-white background
- **Hexes**: bg #ffffff
- **Marker**: neutral

### Pre-set color ("Info")
- **Produces it**: style:"INFO"
- **Looks like**: pale blue fill with slightly darker matching border; dark text retained
- **Use when**: gentle emphasis/informational grouping | **Avoid when**: page already uses colored zones
- **Hexes**: fill #e9f1fb (est.), border #cfdff2 (est.)
- **Marker**: neutral

### Custom hex (#20124d)
- **Produces it**: style:"#20124d" (hex given by page text — CODE-VERIFIED)
- **Looks like**: near-black indigo card; title/numbers flip to white, labels to muted gray-lavender #9a97b5 (est.)
- **Use when**: brand/hero emphasis with auto-adjusted text | **Avoid when**: dense text content (contrast strain)
- **Hexes**: fill #20124d
- **Marker**: neutral

## card_shadow.png

Tier override A→B. Vocabulary: showShadow false (default) / true.

### Don't Show Shadow (default)
- **Produces it**: a!cardLayout(showShadow:false)
- **Looks like**: flat bordered card
- **Use when**: white page backgrounds (per page guidance) | **Avoid when**: card sits on transparent/tinted page needing depth
- **Marker**: neutral

### Show Shadow
- **Produces it**: showShadow:true
- **Looks like**: soft diffuse drop shadow below/right; demo card also keeps its border — the page's own guideline ("never use shadows and borders at the same time") means real usage should set showBorder:false with this
- **Use when**: transparent page backgrounds | **Avoid when**: white pages or dark schemes
- **Marker**: neutral

## card-border.png

Tier override A→B. Vocabulary: showBorder true (default) / false.

### Show Border (default)
- **Produces it**: a!cardLayout(showBorder:true)
- **Looks like**: 1px #e0e0e0 (est.) outline defining the card region
- **Use when**: white page backgrounds | **Avoid when**: dark scheme pages (page guidance)
- **Marker**: neutral

### Don't Show Border
- **Produces it**: showBorder:false
- **Looks like**: card dissolves — content floats on white with no visible container
- **Use when**: card bg color/shadow already defines the edge, or intentional invisible grouping | **Avoid when**: boundary itself carries the grouping (as here)
- **Marker**: neutral

## card-border-color.png

Tier override A→B. Vocabulary: borderColor Standard (default) / Accent / Positive / Warn / Negative / custom hex.

### Standard Border Color
- **Produces it**: a!cardLayout(borderColor:"STANDARD")
- **Looks like**: quiet 1px light-gray outline
- **Use when**: default content cards | **Avoid when**: card needs selected/highlight state
- **Hexes**: #e0e0e0 (est.)
- **Marker**: neutral

### Accent Border Color
- **Produces it**: borderColor:"ACCENT"
- **Looks like**: same card, saturated blue outline (~1px) — reads as selected/active
- **Use when**: highlighting one card among peers (selection, current step) | **Avoid when**: every card gets it (accent inflation)
- **Hexes**: #2626f0 (est.)
- **Marker**: neutral

## card_padding.png

Tier override A→B. Vocabulary: padding None / Even Less / Less (default) / Standard / More / Even More. One card per setting, same KPI content.

### None
- **Produces it**: padding:"NONE" — title sits flush against the border; use only when children carry their own spacing (e.g., edge-to-edge media)
### Even Less
- ~8px (est.) inset; densest readable option for compact dashboards
### Less (default)
- ~12px (est.); the shipped default for typical content
### Standard
- ~20px (est.); comfortable reading for text-heavy cards
### More / Even More
- ~28px / ~44px (est.); editorial airiness — Even More visibly floats a small KPI block in whitespace, so reserve for large hero cards
- **Styling hooks (all)**: padding ladder; **Marker**: neutral

## card_corner_rounding.png

Tier override A→B. Vocabulary: shape Squared (default) / Semi-Rounded / Rounded.

### Squared
- **Produces it**: shape:"SQUARED" — 0px radius; institutional, gridable
### Semi-Rounded
- **Produces it**: shape:"SEMI_ROUNDED" — ~4px (est.) radius; softens without reading "pill"
### Rounded
- **Produces it**: shape:"ROUNDED" — ~10px (est.) radius; friendliest, consumer feel
- **Use when**: match product register; keep one shape per interface | **Avoid when**: mixing radii on one page
- **Styling hooks**: shape
- **Marker**: neutral

## card_decorative_bar.png

Tier override A→B. Vocabulary: decorativeBarPosition None (default) / Top / Bottom / Start / End; decorativeBarColor Accent (default) / Positive / Warn / Negative / custom hex.

### Start bar, Accent color
- **Produces it**: a!cardLayout(decorativeBarPosition:"START", decorativeBarColor:"ACCENT")
- **Looks like**: full-height ~6px (est.) blue #2626f0 (est.) stripe on the left edge of a white bordered card
- **Use when**: flagging status/ownership per card in a list | **Avoid when**: bar would be the only meaning carrier (a11y — page warns)
- **Marker**: neutral

### Top bar, custom #674ea7
- **Produces it**: decorativeBarPosition:"TOP", decorativeBarColor:"#674ea7" (hex from page text — CODE-VERIFIED)
- **Looks like**: purple band across the card's top edge; this demo card also shows a pale lavender body fill #eeecf6 (est.) harmonized with the bar
- **Use when**: category/brand accent on featured cards
- **Marker**: neutral

## card-margins.png

### Identification
- **Image**: card-margins.png | **Source page**: ux-card-layout | **Alt/caption**: ds-images/card-margins.png — heading "Margins"
- **Device frame**: desktop
- **Marker**: neutral (exemplar of consistent card-group spacing)
- **UI type**: list (photo-card gallery inside an agent portal)

### Use-case reconstruction (INFERRED)
- **Persona**: residential real-estate agent ("My Listings"); daily-operator
- **Domain & brand context**: boutique luxury brokerage "Thatcher." — serif wordmark, black chrome, single deep-red brand accent; Palm Springs–area listings ($1.7–2.2M)
- **Top 3 user tasks (ranked)**: 1. Monitor status/age of own listings 2. Create a new listing 3. Jump to search/new/sold listing views
- **Implied requirements**: "Each listing must show status and days-on-market at a glance"; "New Listing must be one click from anywhere"; "Photos must dominate — the product is the house"; "Status must be readable on top of any photo"
- **Data model sketch** (OBSERVED): Listing(photo, statusTag, price, daysOnMarket, beds, baths, sqft, address) ×5; status enum {NEW LISTING, OPEN HOUSE SCHEDULED, PRICE REDUCED, NO OFFERS RECEIVED}; agent 1—* listings

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ NAVBAR black h≈56: serif brand + app-grid icon + avatar
├─ PANE[left] icon rail w≈64 black, active item on red block
├─ PANE[left] menu w≈320 white: "Properties" + BUTTON "＋NEW LISTING" solid red + menu ×5 (active red w/ icon)
└─ PANE[center] GRID(3-col, row 2 has 2 cards)
   └─ CARD(billboard photo + tag overlay, price+days row, specs, address; padding NONE outer / padded text zone)
```
- **Above the fold**: everything — all five cards fit one viewport
- **Reading order**: F — sidebar, then card grid left-to-right
- **Hierarchy rationale**: photos biggest because sellable inventory is the object of work (task 1); red button is the sole saturated CTA (task 2); text stack per card orders price > specs > address
- **Density**: 2 — editorial: 5 large photo cards + nav, generous 24px (est.) gutters
- **Ratios & spacing**: 3 equal columns; horizontal gutter ≈ vertical gutter ≈ 24px (est.) — the page's Margins lesson: Column Spacing and Margin Below tuned to match; card text zone padding ≈ STANDARD

### Styling specifics (OBSERVED)
- **Palette**: chrome black #1e1e1e (est.), content bg #fafafa (est.), card #ffffff with #e2e2e2 (est.) border, brand red #a61c1c (est.) (button, active menu, active rail block), tag colors: orange #f0a13a, green #3f8f29, blue #3b78d8, alert red #cc1f1f (all est.), text #222222, secondary #8a8a8a (est.)
- **Color application points**: solid-fill status tags on photos; red for brand CTA + active nav only; gray icon+days pair top-right of price row
- **Typography moves**: serif logo vs sans UI; price MEDIUM_PLUS bold leads each card; specs STANDARD with "•" separators; address SMALL; all-caps only inside tags
- **Imagery stance**: full-bleed photography (billboard to card edges), tag chip overlaid top-left
- **Card treatment**: border, no shadow, squared, padding NONE outer with padded inner text block (the nested-card recipe from this page's Nested cards section)
- **Signature moves**: instead of a status column, solid-color tag overlays on photos; instead of many accents, one red reused for brand/CTA/active; days-on-market rises as status worsens (2d NEW → 42d NO OFFERS) making the grid tell a story; black chrome makes listing photos the only vivid zone

### Component inventory (OBSERVED)
- a!headerContentLayout + left nav panes; a!cardLayout(padding:"NONE", showBorder:true) per listing; a!billboardLayout(backgroundMedia:webImage, overlay tagField) — tag = a!tagItem(backgroundColor per status); price row = a!sideBySideLayout with MINIMIZE right item (calendar icon + "2d"); buttonWidget(style:"SOLID", color custom red); cards presumably link-wrapped (cards-as-links)
- Charts: none
- Affordances: sidebar filters (My/New/Search/Sold), New Listing CTA, clickable cards

### Character & judgment
- **Register**: premium-editorial + utilitarian-ops — photo-led luxury merchandising wrapped in a working agent console
- **Why it works**: equal gutters both axes make five unequal-content cards read as one calm system; solid tag chips guarantee legibility over busy photos; lone red accent creates instant "what's actionable" scanning
- **Why not boring**: photos bleed to card edges (padding NONE) instead of sitting in white margins; four-state color-coded tag system; serif wordmark on black adds brand without extra UI; days icon quietly pairs with status severity
- **Boring twin**: a white page with a data grid (address/price/status columns), thumbnails in a narrow column, blue default buttons, and uneven gaps between card rows and columns
- **What to steal**: match Column Spacing to Margin Below so horizontal and vertical gutters agree; overlay status as solid tags on imagery; reserve one saturated hue for CTA + active states
- **Risks**: red doubles as brand and "NO OFFERS" alarm (semantic collision); photo-heavy grid needs image fallbacks; 3-col collapses on tablet — tag text length may wrap

### Code cross-check
- none on page for this figure (tag/billboard params mirror the Nested-cards SAIL nearby)

## card_width.png

Tier override A→B: labeled Fixed/Variable comparison strip; SAIL source present → params CODE-VERIFIED.

### Fixed Width
- **Produces it**: a!columnLayout(width:"NARROW_PLUS") wrapping a!cardLayout(style:"#1c4587", showBorder:false, padding:"STANDARD", height:"AUTO"); empty a!columnLayout() spacers center the trio (CODE-VERIFIED)
- **Looks like**: three navy ticker cards (ABCD 123.45 ▲1.29, XYZ 39.95 ▼0.75, KPI 25.68 ▲2.15) of identical width with white LARGE values; deltas MEDIUM in POSITIVE green / NEGATIVE red
- **Use when**: card content layout must survive any screen width | **Avoid when**: you want full use of wide viewports
- **Hexes**: card #1c4587 (CODE-VERIFIED)
- **Marker**: neutral

### Variable Width
- **Produces it**: same cards in three equal AUTO columns (CODE-VERIFIED)
- **Looks like**: identical trio stretched to fill the row; interior left/right groups drift apart
- **Use when**: responsive dashboards where cards should share the row | **Avoid when**: stretch distorts intended text grouping
- **Marker**: neutral

## card_nested.png

Tier B (single-component crop; SAIL on page → CODE-VERIFIED).

### Outer media card + inner detail card
- **Produces it**: outer a!cardLayout(padding:"NONE", shape:"SEMI_ROUNDED", showBorder default true, link:a!dynamicLink) containing a!billboardLayout(height:"SHORT_PLUS", marginBelow:"NONE", backgroundColor:"#f0f0f0", fullOverlay alignVertical:"TOP" with a!tagItem("NEW LISTING", backgroundColor:"#ff9900")) + inner a!cardLayout(showBorder:false, padding:"STANDARD") — all CODE-VERIFIED
- **Looks like**: full-bleed villa photo with orange tag, then white detail block: $1,695,000 (MEDIUM_PLUS), calendar "2d" in SECONDARY gray, "3 Beds • 2.5 Baths • 2,403 Sq. Ft.", SMALL address
- **Use when**: media must touch card edges while text keeps padding; whole card is one link | **Avoid when**: inner content needs its own interactive controls (page a11y warning)
- **Hexes**: tag #ff9900 (CODE-VERIFIED)
- **Marker**: neutral

## card_nested_2.png

Tier B (crop; SAIL on page → CODE-VERIFIED).

### Flush-edge progress card
- **Produces it**: outer a!cardLayout(padding:"NONE") ⊃ inner a!cardLayout(padding:"LESS", showBorder:false) with "REVENUE" (MEDIUM), "$5.3" (LARGE, STRONG, color:"ACCENT") + "M" (LARGE), right-MINIMIZED "GOAL: $8.2M" (SECONDARY label), then a!progressBarField(percentage:65, style:"THIN", showPercentage:false) — CODE-VERIFIED
- **Looks like**: KPI card whose thin blue progress bar runs edge-to-edge along the bottom border, because zero outer padding lets the bar bleed
- **Use when**: goal-tracking KPIs; any "content + full-width strip" card | **Avoid when**: card needs uniform padding (bar would float)
- **Hexes**: bar/accent #2626f0 (est. render of ACCENT), track #e0e0e0 (est.)
- **Marker**: neutral

## trasparent_card_background.png

Tier B.

### Transparent style on dark vs light page
- **Produces it**: a!cardLayout(style:"TRANSPARENT") — same card dropped on navy and on white pages
- **Looks like**: identical American Express gauge card (27% green ring, ★★★★3294, $687/$2,500) letting each page background show through; text renders white on navy #1a2b45 (est.), near-black on white; subtle border adapts
- **Use when**: one reusable card must sit on multiple/unknown backgrounds (page recommends for reused components) | **Avoid when**: card needs to read as a distinct white content surface
- **Hexes**: gauge green #35c132 (est.) both variants
- **Marker**: neutral

## image17border.png

### Identification
- **Image**: image17border.png | **Source page**: ux-card-layout | **Alt/caption**: "alttext" — heading "Show borders, but not shadows on white page backgrounds"
- **Device frame**: desktop
- **Marker**: neutral (positive exemplar of the border-on-white rule)
- **UI type**: dashboard-analytical — same personal-finance dashboard as image11stacked, restyled; a documentation zoom callout (red frame) magnifies the American Express card

### Use-case reconstruction (INFERRED)
- **Persona**: retail-banking customer, occasional-customer cadence (same app as image11stacked)
- **Domain & brand context**: consumer finance, Appian demo brand, trust-first neutral chrome
- **Top 3 user tasks (ranked)**: 1. Check account utilization 2. Scan/search transactions 3. Review category spend
- **Implied requirements**: "On a white page, every card must be delimited without elevation effects"; "Zones must stay separable with minimal chrome"; "Filters persist above content"
- **Data model sketch**: identical to image11stacked (Account ×4, Transaction 1–7 of 77, Category ×6, TopExpense ×4)

### Layout anatomy (OBSERVED)
- **Skeleton**: as image11stacked top variant (NAVBAR → filter FORM → KPI-ROW ×4 → COLUMNS [1:1] grid card | category+donut+expenses); zoom CALLOUT overlays center
- **Above the fold**: all four zones
- **Reading order**: F
- **Hierarchy rationale**: unchanged from image11stacked; the callout exists to make the 1px border/no-shadow treatment inspectable
- **Density**: 4 — same zone count in one viewport
- **Ratios & spacing**: [1:1] main split; card padding ≈ STANDARD

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff, card bg #ffffff, card border #e5e5e5 (est.), navbar navy #1a2742 (est.), active-tab underline pink-red #e04f5f (est.), callout frame #d75f5f (est.), gauge green #70bf4e / amber #f0a840 / red #d32f4b (est.), text #222222, secondary #9a9a9a (est.)
- **Color application points**: unchanged category/donut hues; the only added color is the red documentation frame
- **Typography moves**: zoomed card confirms bank name STANDARD bold, masked digits SMALL gray, $687 LARGE bold with "/ $2,500" STANDARD gray
- **Imagery stance**: styled icons + avatar photo
- **Card treatment**: showBorder:true, showShadow:false — border-only separation on pure white; white-on-white works because every card is outlined
- **Signature moves**: instead of tinting the page to pop cards, they keep page and cards both white and let 1px borders do all separation; elevation vocabulary reserved (no shadows anywhere)

### Component inventory (OBSERVED)
- Same as image11stacked: cardLayouts, gridField, pie DONUT, sideBySide icon stats; zoom callout is documentation artwork, not SAIL
- Chart custom colorScheme: yes (six-hue)
- Affordances: filters, search, sort, pager, row menus

### Character & judgment
- **Register**: calm-clinical + energetic-consumer
- **Why it works**: uniform 1px #e5e5e5 (est.) borders keep 12+ white surfaces distinct on a white page; zero elevation keeps the dense grid calm; the magnified card proves the rule at pixel level
- **Why not boring**: severity-colored gauges, six-hue category system, mini-card expense list survive the restrained shell
- **Boring twin**: same page with default shadows AND borders on every card — double outlines plus gray haze between zones
- **What to steal**: on white pages set showBorder:true, showShadow:false everywhere — one consistent separation device
- **Risks**: 1px light borders can vanish on low-quality displays; border-only separation depends on disciplined spacing

### Code cross-check
- none

## image88border.png

### Identification
- **Image**: image88border.png | **Source page**: ux-card-layout | **Alt/caption**: "alttext" — heading "Show shadows, but not borders on transparent page backgrounds"
- **Device frame**: desktop
- **Marker**: neutral (positive exemplar)
- **UI type**: dashboard-analytical — same finance dashboard, transparent (site-gray) page background, zoom callout on the American Express card

### Use-case reconstruction (INFERRED)
- **Persona / Domain / Tasks / Data model**: identical to image17border (same app, same data)
- **Implied requirements**: "On a tinted page background, cards must separate via elevation, not outlines"; "Card fills stay white so content zones glow against the gray"

### Layout anatomy (OBSERVED)
- **Skeleton**: identical to image17border, including red zoom CALLOUT
- **Above the fold**: all zones
- **Reading order**: F
- **Hierarchy rationale**: unchanged; figure isolates the elevation treatment
- **Density**: 4
- **Ratios & spacing**: [1:1]; unchanged

### Styling specifics (OBSERVED)
- **Palette**: page bg #efeff1 (est.) (the "transparent" site background), card bg #ffffff, no card borders, soft shadow ≈ rgba(0,0,0,0.12) (est.) short-blur drop, navbar #1a2742 (est.), callout #d75f5f (est.), gauges/categories unchanged
- **Color application points**: as image17border; gray page makes white cards the brightest surfaces
- **Typography moves**: unchanged; zoom confirms no border stroke — edge defined purely by white-vs-gray value shift plus shadow
- **Imagery stance**: styled icons + avatar
- **Card treatment**: showShadow:true, showBorder:false — elevation-only separation
- **Signature moves**: instead of outlining cards, they tint the page one step gray so white fills self-separate, then add faint shadows for depth; exactly inverse of the white-page recipe

### Component inventory (OBSERVED)
- Same construct set; a!cardLayout(showShadow:true, showBorder:false) throughout
- Chart custom colorScheme: yes
- Affordances: unchanged

### Character & judgment
- **Register**: calm-clinical + energetic-consumer
- **Why it works**: value contrast (white on #efeff1 est.) does the separating so shadows can stay whisper-subtle; avoids the double-chrome look the page's "never shadows AND borders" rule targets
- **Why not boring**: same saturated data accents; the gray field adds gentle depth hierarchy absent from the flat white version
- **Boring twin**: gray page with bordered AND shadowed cards — muddy outlines, heavier chrome than content
- **What to steal**: pick the separation device from the page background: tinted page → shadow, no border
- **Risks**: on low-contrast monitors #ffffff vs #efeff1 (est.) nearly merges — shadows become load-bearing; large gray expanses can feel empty if content is sparse (page's whitespace DON'T covers this)

### Code cross-check
- none

## image79border.png

### Identification
- **Image**: image79border.png | **Source page**: ux-card-layout | **Alt/caption**: "alttext" — heading "Don't show borders or shadows on dark page backgrounds"
- **Device frame**: desktop
- **Marker**: neutral (positive exemplar of the dark-scheme rule, despite "Don't" in the heading)
- **UI type**: dashboard-analytical — same finance dashboard in a dark color scheme

### Use-case reconstruction (INFERRED)
- **Persona / Tasks / Data model**: same finance app and data as siblings above
- **Domain & brand context**: consumer finance in a dark theme — evening/ambient register, same trust cues
- **Implied requirements**: "Dark pages must separate cards by a lighter tint of the page color, no borders or shadows"; "Semantic gauge/category hues must survive on dark"; "Inputs remain light for affordance"

### Layout anatomy (OBSERVED)
- **Skeleton**: identical structure (NAVBAR → FORM filters → KPI-ROW ×4 → COLUMNS [1:1]); no zoom callout in this figure
- **Above the fold**: all four zones
- **Reading order**: F
- **Hierarchy rationale**: unchanged; the restyle is the lesson
- **Density**: 4
- **Ratios & spacing**: unchanged; card padding ≈ STANDARD

### Styling specifics (OBSERVED)
- **Palette**: navbar #141f30 (est.), page bg #262b33 (est.), card bg lighter tint #2f3540 (est.), row dividers #3a404b (est.), text #ffffff, secondary #8b93a1 (est.), inputs stay white #ffffff, gauge green #70bf4e / amber #f0a840 / red #d32f4b (est.), category hues slightly brightened for dark bg (travel #3d7de8, groceries #8d5be0, shopping #35b5e5, food #3ba55c, entertainment #e0447c, other #9635b5 — all est.), donut palette unchanged
- **Color application points**: card surfaces carry the tint step; accents identical to light theme — hue system is theme-stable
- **Typography moves**: same scale; white primaries, desaturated slate secondaries; all-caps section labels now light gray
- **Imagery stance**: styled icons; avatar placeholder
- **Card treatment**: showBorder:false, showShadow:false, style = lighter charcoal tint (page notes predefined dark schemes, e.g. "Charcoal scheme," produce this automatically)
- **Signature moves**: instead of borders/shadows, a two-step luminance ladder (page < card < divider) builds depth; instead of recoloring data hues per theme, they keep one accent system across themes

### Component inventory (OBSERVED)
- Same constructs; a!cardLayout(style:"CHARCOAL_SCHEME"-like, showBorder:false); white a!textField/dropdown filters; gridField rows divided by darker strokes
- Chart custom colorScheme: yes
- Affordances: search + inline account filter, download/filter/refresh icon buttons, pager

### Character & judgment
- **Register**: calm-clinical (dark-ops flavor)
- **Why it works**: tint-step separation avoids the halo mess shadows create on dark; white inputs pop as the interactive layer; consistent accent hues keep cross-theme learnability
- **Why not boring**: true dark scheme (blue-charcoal, not #000); gauges and donut read vividly; the restraint itself (zero borders) is the sophistication
- **Boring twin**: dark page with gray-bordered, drop-shadowed white cards — blinding surfaces and muddy edges
- **What to steal**: on dark pages set card style to a lighter tint of the page hue and kill borders/shadows; keep one semantic hue system across light and dark
- **Risks**: #8b93a1 (est.) secondary text on #2f3540 (est.) sits near 4.5:1 — verify AA; white inputs create high-contrast hotspots; amber on dark needs the % label (present)

### Code cross-check
- none

## image46info.png

### Principle: White cards for content — colored styles are not wallpaper
- **DO shows**: (reference: image17border/image88border) content cards with style:"NONE" white fills
- **DON'T shows** (this image): the same finance dashboard with every content card set to the "Info" pale blue #e8f0fa (est.) on a gray page — gauges, transaction grid, category stats, donut, and expense rows all swim in one blue wash; nothing is a callout anymore, secondary #9a9a9a (est.) text loses contrast on tint, and the page reads like a wall of notifications
- **Rule**: content cards stay white; pre-set color styles are for occasional semantic emphasis, never the default surface
- **Severity**: usually
- **Category**: color
- **SAIL implication**: a!cardLayout(style:"NONE") for content; reserve style:"INFO"/"WARN"/etc. for individual callout cards
- **Marker**: dont (standalone; DO is the white-card exemplars above)

## image63border.png

### Identification
- **Image**: image63border.png | **Source page**: ux-card-layout | **Alt/caption**: "alttext" — heading "Limit use of background colors other than white"
- **Device frame**: desktop
- **Marker**: neutral (exemplar of sanctioned non-white cards; green annotation arrows label "Light gray" and "Accent-colored" cards)
- **UI type**: portal (low-code app-designer overview: "Customer Onboarding")

### Use-case reconstruction (INFERRED)
- **Persona**: Appian application designer/builder; daily-operator during a build phase
- **Domain & brand context**: dev-tool console, Appian-branded; institutional blue-on-white with guided-onboarding overlay
- **Top 3 user tasks (ranked)**: 1. Resume building app objects (data, workflows, sites, UIs) 2. Follow the per-section "next step" guidance 3. Monitor app health/activity and discover integrations
- **Implied requirements**: "Each object section must pair guidance with its objects"; "Instruction cards must be dismissible"; "App health, object count, last-deploy visible in header"; "Promote integrations without hijacking the build flow"
- **Data model sketch** (OBSERVED): App(name, objectCount:40, health:OK, lastDeployed:—); Object(type∈{Database, Workflow, Site, Interface}, name, meta: "⚡4 🖼2") — Customer, Create/Update/Delete Customer, Onboarding Portal; ActivityEvent(objectName, "Just now", "Created by me") ×3

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ NAVBAR white: appian logo + app-grid + avatar
├─ APP HEADER navy band h≈100: icon chip + "Customer Onboarding" + KPI trio [objects 40 | HEALTH ✓OK | LAST DEPLOYED —]
└─ COLUMNS [NARROW : WIDE : MEDIUM]
   ├─ PANE[left] text menu ×11, "Overview" active (blue + left bar)
   ├─ PANE[center]
   │  ├─ SECTION "DATA": CARD(instruction, light-gray, ✕) + CARD(Customer Database, orange top bar)
   │  ├─ SECTION "WORKFLOWS": CARD(instruction) + CARD ×3 (Create|Update|Delete Customer, navy top bars)
   │  ├─ SECTION "SITES": CARD(instruction) + CARD(billboard cityscape + "Onboarding Portal" + VISIT/EDIT)
   │  └─ SECTION "USER INTERFACES" (clipped)
   └─ PANE[right] SECTION "ACTIVITY" ×3 + link + CARD(promo, solid accent blue)
```
- **Above the fold**: header KPIs, Data + Workflows sections, activity feed, promo card
- **Reading order**: F with right-rail glances
- **Hierarchy rationale**: guidance card leads each section because the app is mid-build (task 2); object cards next (task 1); promo confined to rail so it never blocks work
- **Density**: 3 — three columns, ~10 cards visible, comfortable gaps
- **Ratios & spacing**: ≈ [1:3:1.5]; instruction cards padding ≈ LESS; section gaps STANDARD

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff, header band #16209b (est.), accent promo card #2230d6 (est.), instruction-card gray #f0f0f0 (est.), link/menu blue #2126e0 (est.), object-bar orange #e0731d (est.) (Database), object-bar slate-navy #30506e (est.) (Workflows), lightbulb icon chip red-pink #cf2e5e (est.), health check green #2e9e4f (est.), annotation green #4ac97e (est.) (doc artwork), text #222222 / secondary #8a8a8a (est.)
- **Color application points**: card ROLE is color-coded — gray fill = dismissible instruction, white = real object, solid accent = promotion; decorative top bars type-code objects (orange data vs navy workflows); full-color partner logos (Google/aws/UiPath/DocuSign) appear only inside the promo card
- **Typography moves**: section labels all-caps MEDIUM gray with leading icon; instruction titles STANDARD bold; header app name LARGE white; KPI labels all-caps SMALL with STANDARD values; promo headline MEDIUM_PLUS white
- **Imagery stance**: styled icons throughout + one photo billboard (site preview) + vendor logos
- **Card treatment**: white object cards with borders; gray instruction cards borderless-looking (fill does the work); promo card solid fill, no border; site card uses padding-NONE billboard recipe
- **Signature moves**: instead of one onboarding wizard, per-section dismissible gray coach cards; instead of icon-only object lists, decorative-bar color coding by type; instead of banner ads, a single saturated accent card holding all promotional color; white "LEARN MORE" button inverts on blue

### Component inventory (OBSERVED)
- a!cardLayout variants: style:"#f0f0f0"-like instruction cards with a!richTextIcon(lightbulb) chip + dismiss link; object cards with decorativeBarPosition:"TOP" + type colors; promo a!cardLayout(style accent blue) + white buttonWidget; a!billboardLayout in site card with VISIT/EDIT outline buttons; right-rail feed of icon+text rows; header = a!headerContentLayout with navy band + a!sideBySideLayout KPI trio
- Charts: none
- Affordances: dismiss ✕, Learn more links, VISIT/EDIT, See All Activity, left menu

### Character & judgment
- **Register**: utilitarian-ops + institutional — a working console where even promotions obey the grid
- **Why it works**: three-tier card color grammar (gray=guidance, white=content, accent=promo) is legible instantly and matches the page's own rule "light gray for dismissible instructions, accent for feature promotion"; top-bar hues give object types identity without icons alone; the lone saturated card sits last in reading order
- **Why not boring**: color-coded decorative bars; dismissible coach cards inline with real objects; a photo billboard inside a console UI; vendor logos quarantined inside the promo card
- **Boring twin**: every card white with a blue "TIP:" paragraph on top of each section, promo as a full-width banner above the fold, object type shown only by a small gray icon
- **What to steal**: encode card role via fill (gray guidance / white content / one accent promo); type-code repeating object cards with decorativeBar colors; keep promotional color in exactly one card per view
- **Risks**: gray instruction cards can read as disabled; blue menu + blue links + blue promo near accent-inflation; white text on #2230d6 (est.) fine, but small gray "Created by me" on white is low-value contrast

### Code cross-check
- none

## card-style-do-border.png + card-style-dont-border.png

### Principle: Color the text, not the card
- **DO shows**: four white KPI cards (Total Revenue $6,391.16, Revenue Per User $57.13, New Orders 1275, New Users 76) where meaning lives in the delta line only — green #3d9c46 (est.) ▲ / red #cc3b33 (est.) ▼ plus matching sparkline; values stay near-black on white
- **DON'T shows**: same four cards with whole-card tints (pale green #e3f7dc, pale red #f9e8e8, matched borders — est.): four competing color blocks, "good/bad" shouted by wallpaper, red sparkline on pink loses contrast, and color alone carries meaning (a11y violation the page calls out)
- **Rule**: for KPI status, color the delta text/icon; keep the card surface neutral
- **Severity**: usually
- **Category**: color
- **SAIL implication**: a!cardLayout(style:"NONE") + a!richTextItem(color:"POSITIVE"/"NEGATIVE") + a!richTextIcon(caret-up/caret-down) — the arrow doubles as the non-color cue

## image16whitespace.png

### Principle: Don't use transparent page backgrounds on sparse pages
- **DON'T shows**: the finance dashboard rearranged (narrow Transactions card, stacked expense cards, wide Categories card) on a transparent gray #efeff1 (est.) page — content ends ~60% down and the remaining gray void becomes the most noticeable region; the tinted background that was meant to add contrast now frames emptiness
- **Rule**: transparent page backgrounds only when content reliably fills the viewport; sparse layouts keep white pages (or gain content/wider cards)
- **Severity**: contextual
- **Category**: layout
- **SAIL implication**: keep default white page background; if using a site background color, verify fill at common resolutions or stretch cards (height/width params) to occupy the grid
- **Marker**: dont (standalone)

## card_selection_example_border.png + card_layout_with_link_and_button_border.png

### Principle: Make the whole card the only click target
- **DO shows** (card_selection_example_border): insurance chooser "What do you want to protect?" (indigo #34349e est. LARGE_PLUS heading) with three tall white cards — periwinkle #8a97d8 (est.) icon, indigo bold title (Home/Car/Pet), gray description, centered stack; the hovered Home card signals linkage via accent #34349e (est.) border + faint glow + hand cursor. No controls inside; the card IS the choice
- **DON'T shows** (card_layout_with_link_and_button_border): same cards but each embeds a solid indigo "VIEW DETAILS" button while the card is also linked — two nested targets; users (and screen readers/keyboard focus) can't tell card-click from button-click
- **Rule**: when a card has a link, put no interactive components inside it
- **Severity**: always
- **Category**: a11y
- **SAIL implication**: a!cardLayout(link: a!dynamicLink…) containing display-only components; show state via borderColor:"ACCENT"; if per-item actions are needed, drop the card link or use the Card Choices component

## decorative-bar-same-position-border.png + decorative-bar-mixed-position-border.png

### Principle: One decorative-bar position per interface
- **DO shows** (same-position): four stacked notification cards, every bar at Start — info gray #555a5f, error red #c9243f, warning amber #eeb541, success green #4cba43 (all est.) — forming one left color rail; matching semantic icons align in a scannable column; blue dotted-underline links #2d6cb5 (est.) sit inline
- **DON'T shows** (mixed-position): same four cards with bars alternating Start/Top/Top/Start — top bars read as card headers, side bars as flags; the color rail fragments and each card must be re-parsed individually
- **Rule**: pick one decorativeBarPosition for all cards on an interface; encode meaning only through decorativeBarColor
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: fix decorativeBarPosition:"START" (or one chosen value) across the card set; vary decorativeBarColor semantically; icons/text carry the message so color is not the sole cue

## decorative-bar-border.png

### Principle: Match the decorative bar to the card's own content colors (standalone DO)
- **DO shows**: two feature cards on gray borders — "Appian Records": navy #2d4a86 (est.) top bar, navy circular database icon chip, navy bold title; "Appian RPA": maroon #6b1518 (est.) top bar + robot chip + title. Bar, icon, and title share one hue per card; body text stays neutral #333 (est.); borders stay quiet gray #d9d9d9 (est.)
- **Rule**: pull the decorative bar color from the card's icon/title hue so the bar reads as identity, not random trim
- **Severity**: usually
- **Category**: color
- **SAIL implication**: decorativeBarPosition:"TOP" + decorativeBarColor set to the same hex as the card's richTextIcon/title color; borderColor left "STANDARD"
- **Marker**: do (its DON'T counterpart is the clashing-border pair below)

## card-border-bar-do.png + card-border-bar-dont.png

### Principle: Bar and border must come from the same color family
- **DO shows**: the same Records/RPA cards with borderColor matched to the bar — navy bar + navy #3050a0 (est.) border, maroon bar + maroon #6b1f1a (est.) border; each card becomes one coherent colored frame around neutral body text
- **DON'T shows**: navy bar trapped inside a purple #a24de0 (est.) border, maroon bar inside an amber #f0a640 (est.) border — two unrelated hues per card edge; the frame fights its own bar and the pair no longer looks like a system
- **Rule**: when combining decorativeBarColor and borderColor, use the same or a complementary hue — never two unrelated saturated colors on one card
- **Severity**: usually
- **Category**: color
- **SAIL implication**: set decorativeBarColor and borderColor to one hex (or tints of it); if unsure, keep borderColor:"STANDARD" as in decorative-bar-border.png

## image74.gif (frames: image74_f0.png, image74_f1.png)

### Interaction: Live padding comparison on a full dashboard
- **State chart**: baseline "Expenses Dashboard" with comfortable card padding (≈STANDARD) → padding setting switched → every card (gauges, transactions grid, category/expense cards) tightens toward ≈LESS/EVEN_LESS, title band and insets shrink, more rows fit → cycles back (f1 is a mid-transition frame with visible ghosting)
- **SAIL mechanism**: other — re-render of a!cardLayout(padding:…) across the page (documentation demo of the parameter, not an in-app control)
- **UX purpose**: orientation — shows the whole-page density trade-off of one padding value before you commit
- **Replicate when**: tuning padding for dense dashboards; preview both settings on real content | **Cost**: trivial (one param), but affects every card consistently — change globally, not per card
- **Marker**: neutral

## Tier B page rollup

Default choice for most cases is a!cardLayout(style:"NONE" white, showBorder:true with no shadow on white pages, padding:"LESS"→"STANDARD" for text-heavy content, shape consistent per app, height:"AUTO", width set by the enclosing column) because the page's own guidelines converge there: white content cards, exactly one separation device chosen from the page background (border on white / shadow on transparent / lighter tint on dark), consistent margins, and color reserved for text semantics, one accent card, or one consistently-positioned decorative bar.
