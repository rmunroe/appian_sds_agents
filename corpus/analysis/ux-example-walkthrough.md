# Analysis: ux-example-walkthrough

Cross-ref: `overview_sections_1.png` also appears on this page (under "Sections") but is analyzed with its primary page in `corpus/analysis/ux-section-layout.md`. All five images below show the SAME real-estate listing app (an Appian-branded property-management site), so palette/chrome observations are shared; no SAIL source exists for this example — all hexes pixel-sampled `(est.)`.

## walkthrough_1.png

### Identification
- **Image**: walkthrough_1.png | **Source page**: ux-example-walkthrough (guidance) | **Alt/caption**: ds-images/walkthrough_1.png (page intro: "real estate listing example UI ... information-dense and visually-appealing")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: listing agent / brokerage office staff at a residential real-estate firm; daily-operator — opens a property record to brief a buyer, book tours, log offers.
- **Domain & brand context**: residential real estate around Great Falls, VA (OBSERVED zip 22066); internal Appian site ("appian" logo in chrome), so brand feel = platform-institutional chrome wrapped around consumer-grade listing content.
- **Top 3 user tasks (ranked)**: 1. Absorb the listing's identity + four headline stats (price, size, beds, baths) instantly. 2. Launch transactions — SCHEDULE TOUR / SUBMIT AN OFFER / UPDATE PROPERTY. 3. Evaluate fit: read description, browse photos, check location on map.
- **Implied requirements**: "Headline stats must be visible inside the hero, not below it"; "Actions must be reachable without scrolling"; "Photos must dominate the first viewport"; "Location must be shown as a map, not a text address alone"; "Listing history (original price, listed-on) must be one glance away."
- **Data model sketch**: Property(address, city/state/zip, price $925,000, sqFt 2,480, bedrooms 3, bathrooms 2.5, type=House, style=Ranch, builtIn, listedOn Apr 2 2017, originalPrice $945,000, description, lat/long) 1—N Photo (7 thumbnails) , N—1 Agent (Real Estate Agent field); record actions Tour, Offer, Update.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (site chrome #302d40: ALL PROPERTIES* | NEW PROPERTY | TRENDS & METRICS + avatar)
├─ Title row: "24450 Country Club Dr" + 3 outline buttons right-aligned
├─ TABS ×4 (Summary selected solid #21649e; others link-blue)
├─ BILLBOARD h≈470css overlay=BOTTOM-bar,DARK (video tour loops per page text)
│  └─ COLUMNS [1:1]  ├─ title EXTRA_LARGE + city
│                    └─ COLUMNS ×4 (Price | Sq. Ft | Bedrooms | Bathrooms)
├─ Thumbnail strip ×7 (clickable gallery)
└─ COLUMNS [1:1]
   ├─ description paragraph + COLUMNS [1:1] field grid (Property Type/Style/Built In | Listed On/Original Price/Agent)
   └─ map w/ red pin
```
- **Above the fold**: chrome, title+actions, tabs, full billboard with stat bar, thumbnail strip, top of description/map row.
- **Reading order**: F — title/actions, then billboard bar left→right (address → 4 stats), then description | map.
- **Hierarchy rationale**: photo hero biggest because buyers judge homes visually (task 3 feeds task 1); the four decision stats ride ON the hero in the overlay bar so task 1 costs zero scroll; actions pinned top-right at title level for task 2.
- **Density**: 3 — balanced record view: one hero + stat bar + two content columns above the fold, STANDARD padding throughout.
- **Ratios & spacing**: description:map measured ≈[1:1]; overlay bar split [1:1] with nested ×4 equal columns (per page text, two-column then four-column layouts); thumbnails tight ≈STANDARD gaps; sections separated ≈`marginBelow: "STANDARD"`.

### Styling specifics (OBSERVED)
- **Palette**: chrome #302d40 (est.), active-nav cell #3f3963 (est.), page bg #ffffff, accent/selected/link #21649e (est.), body text #222222 (est.), overlay scrim ≈55% black over photo, map greens/tans (Google-style tiles), pin red ≈#e03c31 (est.).
- **Color application points**: nav bar bg; selected record tab fill; the 3 outline buttons (border+text #21649e); tab links; agent link; house glyph next to "House". Content itself stays neutral — color = navigation + actions only.
- **Typography moves**: record title LARGE dark; billboard address EXTRA_LARGE white + city STANDARD white; overlay stat labels STANDARD white over values LARGE_PLUS white — label-over-number KPI pattern; field labels STANDARD bold over STANDARD values; buttons/nav all-caps.
- **Imagery stance**: dominant — looping video billboard (page text) + 7 photo thumbnails + map; no illustrations; only tiny glyph icons (house).
- **Card treatment**: none — flat white page, zones separated by whitespace, not cards.
- **Signature moves**: instead of a stats row below the header, they nest a 4-column KPI strip inside the billboard's dark bottom bar (a!barOverlay position BOTTOM, style DARK per page text); instead of a static photo, a looping video background; instead of a text address, a map given a full half-width column [1:1] with the prose; instead of colored primary buttons, three quiet outline buttons so the hero keeps all saturation.

### Component inventory (OBSERVED → inferred SAIL)
- a!billboardLayout(backgroundMedia: video, overlay: a!barOverlay(position:"BOTTOM", style:"DARK")) wrapping a!columnsLayout [1:1] with nested a!columnsLayout ×4; record header tabs + record action buttons (site record view chrome); a!imageField gallery strip; a!richTextDisplayField paragraph; read-only field grid in two columns; map component/webImage with pin.
- Charts: none. Interactive affordances: 3 record-action buttons, 4 view tabs, thumbnail gallery, agent link.

### Character & judgment
- **Register**: premium-editorial + institutional — magazine-scale hero and stats inside imagery, under stock Appian-blue chrome.
- **Why it works**: the DARK bar overlay guarantees white text contrast over any video frame; price/size/beds/baths sit exactly where the eye already is (on the hero); [1:1] prose+map halves answer "what is it" and "where is it" in one fixation row.
- **Why not boring**: video (not photo) hero; KPI strip embedded in the overlay instead of a separate band; near-black plum chrome #302d40 (est.) rather than default gray; map promoted to co-equal column instead of an afterthought link.
- **Boring twin**: white page, title, then a single-column label/value grid (Price, Sq Ft, Beds…), a photo carousel somewhere below, address as text with a "View map" link, actions buried in a Related Actions tab.
- **What to steal**: bottom-bar DARK overlay carrying a nested 4-col stat strip; [1:1] description+map pairing; outline-only buttons when a hero owns the color budget.
- **Risks**: white STANDARD labels over video can dip below AA when the loop shows bright frames outside the bar; 7-thumb strip + video is bandwidth-heavy; on phone the 4-stat nested columns will stack tall under the address.

### Code cross-check
- none (no SAIL source on this page).

## walkthrough_billboards.png

### Identification
- **Image**: walkthrough_billboards.png | **Source page**: ux-example-walkthrough | **Alt/caption**: ds-images/walkthrough_billboards.png (section "Billboards")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (annotated teaching figure: highlight-by-fading)

### Use-case reconstruction (INFERRED)
- **Persona/domain**: same app as walkthrough_1; figure exists to teach WHERE billboard layouts appear on the page.
- **Top 3 user tasks**: 1. See that the hero is a billboard with a bottom bar overlay. 2. See that each "Nearby Homes" card is ALSO a mini billboard with its own overlay. 3. Ignore everything else (washed out).
- **Implied requirements**: "Figure must isolate billboards without cropping their context"; "Must show the pattern recurs at two scales."
- **Data model sketch**: adds NearbyHome(title, distance mi, price, BR, BA, sqFt): 28 Forest St (2.8 mi) $925,000·3BR·1.5BA·2,050SqFt; 178 Pleasant Ct (6.7 mi) $905,000; 787 Lakeview St (1.4 mi) $875,000; 7303 Amerige St (9.8 mi) $2,150,000·6BR·4BA·6,140SqFt. Also Basement/Lot bullet fields and Local Market Trends (Median List Price $1,475,000, Avg # Offers 1.0).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[crop 1 — page top, veiled to ≈25% opacity]
└─ BILLBOARD (full contrast) h≈470css overlay=BOTTOM-bar,DARK
   └─ COLUMNS [1:1] title+city | COLUMNS ×4 stats
━━ solid #000000 rule ≈4px (marks omitted scroll span)
[crop 2 — page bottom, veiled]
└─ SECTION "Nearby Homes" (full contrast cards)
   └─ 4× CARD(BILLBOARD h≈220css, overlay=BOTTOM 2-line: title on translucent gray scrim, price·BR·BA·SqFt white on photo)
```
- **Above the fold / reading order**: n/a (composite of two scroll positions); reading order figure-directed: hero → black rule → card row.
- **Hierarchy rationale**: fading inverts normal hierarchy — the two full-contrast zones ARE the lesson; the black rule honestly signals discontinuity instead of faking adjacency.
- **Density**: 3 — same page as walkthrough_1; card row adds 4 items per viewport row.
- **Ratios & spacing**: 4 equal nearby-home cards, ≈STANDARD gaps; hero identical to walkthrough_1. Hero photo here is a bedroom (different video frame than walkthrough_1's dining room) — OBSERVED, confirms looping video.

### Styling specifics (OBSERVED)
- **Palette**: veil = white at ≈75% over UI (faded chrome reads #c9c9c9 est., faded heading #c4dbea est.); divider #000000; card title scrim ≈#9a9a9a at ~60% (est.); card text #ffffff; hero bar as in walkthrough_1.
- **Color application points**: only the billboards keep saturation — the figure's entire point.
- **Typography moves**: card titles ≈MEDIUM white; card stat line STANDARD white with "·" separators; hero as walkthrough_1.
- **Imagery stance**: 5 photographic billboards (1 hero + 4 exteriors).
- **Card treatment**: nearby cards = flat photo tiles, no border, overlay bars only.
- **Signature moves**: instead of arrows/boxes, annotation-by-desaturation; instead of one screenshot, two crops joined by a black rule; the SAME barOverlay grammar reused at hero scale and card scale — pattern recursion as the teaching.

### Component inventory (OBSERVED → inferred SAIL)
- Hero: a!billboardLayout + a!barOverlay(position:"BOTTOM", style:"DARK"). Cards: 4× a!billboardLayout(height:"SHORT", overlay: a!barOverlay(position:"BOTTOM", style≈"SEMI_DARK")) inside equal columns; section heading #21649e (est.).
- Charts none; affordances: cards presumably link to sibling records.

### Character & judgment
- **Register**: premium-editorial — photography carries both scales.
- **Why it works**: recursion is shown, not told (hero overlay ↔ card overlays); fading keeps full-page context while removing distraction; black rule prevents misreading the two crops as contiguous.
- **Why not boring**: mini-billboards as list items (photo + overlay stats) instead of a plain "Nearby Homes" grid; distance annotated inline in the title "(2.8 mi)"; consistent "·"-separated stat string.
- **Boring twin**: a table of nearby homes (Address | Price | BR | BA | SqFt) under an un-annotated screenshot with a caption.
- **What to steal**: billboard-with-bar-overlay as a card recipe for photo-first lists; desaturation as annotation.
- **Risks**: card stat line sits DIRECTLY on the photo (no scrim below title band) — white on autumn grass ≈2.5:1 (est.), fails AA; four remote photos per row cost bandwidth.

### Code cross-check
- none (no SAIL source on this page).

## walkthrough_columns.png

### Identification
- **Image**: walkthrough_columns.png | **Source page**: ux-example-walkthrough | **Alt/caption**: ds-images/walkthrough_columns.png (section "Columns": "two layers of columns")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (annotated full page — the complete Summary view, top to bottom)

### Use-case reconstruction (INFERRED)
- **Persona/domain**: same app; figure teaches the column skeleton via overlay boxes: orange #fea300 (est.) = top-level columnsLayouts, red #fd0025 (est.) = nested columnsLayouts.
- **Top 3 user tasks**: 1. Map every content zone to a top-level column layout. 2. See where a second nesting layer buys density (stat strips, field pairs, KPI trio). 3. Read the full record for context.
- **Implied requirements**: "Every annotated box must align with a real layout boundary"; "Two annotation colors must encode exactly two nesting layers."
- **Data model sketch**: extends walkthrough_1 with InteriorFeatures (bedrooms/bathrooms/kitchen/rooms/basement bullets), ExteriorFeatures (garage/utilities/decks/pool/lot), LocationDetails (county Fairfax, taxes $12,664.26, population 17,606, ratings Schools/Transit/Safety), MarketTrend(medianListPrice $1,475,000, median$PerSqFt $280, saleList 93%, avgOffers 1.0, downpayment 18.9%, soldHomes 13) + table row Great Falls.

### Layout anatomy (OBSERVED)
- **Skeleton** (full page; [O]=orange box, [R]=red box):
```
HEADER-CONTENT chrome → title+3 buttons → TABS ×4
├─ BILLBOARD overlay=BOTTOM-bar
│  └─ [O] COLUMNS [1:1] → title | [R]×4 COLUMNS (Price|Sq.Ft|Bedrooms|Bathrooms)
├─ thumbnails ×7
├─ [O] COLUMNS [1:1]
│  ├─ description + [R] COLUMNS [1:1] field pairs (Type/Style/Built In/Lot Size | Listed On/Orig Price/Agent)
│  └─ map
├─ SECTION "Property Details" → [O] COLUMNS [1:1:1]
│  ├─ Interior Features   ├─ Exterior Features
│  └─ Location Details incl. [R] COLUMNS ×3 KPI (Schools Good | Transit Poor | Safety Good)
├─ SECTION "Nearby Homes" → [O]×4 equal card columns
└─ SECTION "Local Market Trends (last 90 days)" → [O] COLUMNS [≈2:1]
   ├─ [R] COLUMNS [1:1] stat pairs + table "Median Real Estate Values"
   └─ CHART(line, series #6ca63f est.)
```
- **Above the fold**: n/a — stitched full-page capture (2880×4396).
- **Reading order**: single-column stack of sections; F-scan inside each.
- **Hierarchy rationale**: top-level columns define zones per section; nesting appears only where small data clusters need side-by-side compression (stats, field pairs, ratings) — exactly the page text's "dense, but balanced" claim.
- **Density**: 3 — five stacked sections, three-column bullet lists, 4-card row, stats+chart; padding stays STANDARD, nothing cramped.
- **Ratios & spacing**: [1:1] hero bar split; [1:1] description/map; [1:1:1] Property Details; 4 equal cards; trends ≈[2:1] with [1:1] nested stats; consistent section gaps ≈STANDARD.

### Styling specifics (OBSERVED)
- **Palette**: annotations #fea300 / #fd0025 (est.); section headings #21649e (est.); ratings Good #25c300, Poor #dc0031 (est.); chart line #6ca63f (est.); links #21649e; body #222222; page #ffffff.
- **Color application points**: blue = section labels + links + selected tab; green/red = the three location ratings (only semantic color on the page); green = chart series; everything else neutral.
- **Typography moves**: section labels MEDIUM #21649e; sub-headers (Interior Features…) MEDIUM gray; field names bold STANDARD over bullet values; ratings words colored + bold beside MEDIUM icons (book, bus, shield-star).
- **Imagery stance**: photos (hero, 4 cards), map, glyph icons for ratings.
- **Card treatment**: only the 4 nearby-home photo tiles; data zones are flat.
- **Signature moves**: instead of a metrics table, Schools/Transit/Safety rendered as icon+word KPI trio with semantic color (#25c300/#dc0031); instead of one wide bullet dump, features split [1:1:1] by interior/exterior/location taxonomy; instead of chart-only trends, paired stat columns + table + line chart in one section.
- **Two-layer rule (the figure's thesis)**: orange boxes never appear inside orange; red only inside orange — nesting stops at depth 2.

### Component inventory (OBSERVED → inferred SAIL)
- a!columnsLayout at 6 top-level spots + 4 nested spots (as skeleton); a!sectionLayout ×3 labeled; a!lineChartField(single series, custom green); read-only grid (Location | List Price | $/Sq.Ft. | Sale/List → "Great Falls, $1,475,000, $280, 93%"); richText bullet lists; icon+text rating trio.
- Interactive: agent link, card links, tabs, actions — unchanged.

### Character & judgment
- **Register**: institutional + utilitarian-ops — the deeper page reveals a working analyst's record under the editorial hero.
- **Why it works**: two annotation colors = two nesting depths, a rule simple enough to internalize; every red box sits inside an orange one, proving the discipline; ratings trio compresses three judgments into one glance line.
- **Why not boring**: color-coded rating words instead of numbers; features taxonomy in three parallel columns; market stats given label:value pairs AND a trend line, not one or the other.
- **Boring twin**: single-column page: field grid, then one giant bullet list, then a nearby-homes table, then a lone chart — no nesting, twice the scroll.
- **What to steal**: depth-2 column discipline; icon+colored-word micro-KPIs inside a column; [1:1:1] taxonomy split for long attribute lists.
- **Risks**: #25c300/#dc0031 rating words rely on color + text (ok), but green #25c300 on white ≈2.2:1 (est.) — borderline for AA at STANDARD size; 3-col bullets + 4-col stats will stack very tall on phone.

### Code cross-check
- none (no SAIL source on this page).

## walkthrough_narrow.png

### Identification
- **Image**: walkthrough_narrow.png | **Source page**: ux-example-walkthrough | **Alt/caption**: ds-images/walkthrough_narrow.png; page caption: "Using the 'Narrow' page width would not have been appropriate for this content"
- **Device frame**: desktop
- **Marker**: neutral in manifest, but functions as a DON'T (caption is explicitly negative) — treating it as the counter-example of the Page-width pair.
- **UI type**: list (record list at "Narrow" site page width)

### Use-case reconstruction (INFERRED)
- **Persona**: same brokerage staff; browsing/filtering the property inventory (ALL PROPERTIES tab active).
- **Domain & brand context**: unchanged.
- **Top 3 user tasks**: 1. Filter/search inventory. 2. Scan rows and compare price/size/features. 3. Open a property record via address link.
- **Implied requirements**: "Grid must show all 7 columns without truncation"; "Filter labels must not clip"; "Maximize rows per viewport" — the Narrow width violates all three, which is the lesson.
- **Data model sketch**: Property(address+city+zip link, type enum {house, condo/apartment, land}, listPrice, bedrooms, bathrooms, size sqft|acres, additionalFeatures set {Garage, Basement, Fireplace, Pool, Deck}). 6 rows OBSERVED: $315,000–$2,150,000; land rows (756 Aspen Ave, 4.6 acres) have empty BR/BA cells.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT chrome (full-width #302d40)
└─ centered content column ≈58% viewport on #f0f0f0 gutters
   ├─ FORM filter block: search+SEARCH | TYPE | LIST PRICE | SIZE
   │                     BEDROOMS | BATHROOMS | ADDITIONAL FE… (clipped)
   └─ GRID(7-col | 6 rows visible) Address·Type·List Price·Bedrooms·Bathrooms·Size·Additional Features
```
- **Above the fold**: filters + ~6 grid rows; every address wraps to 2 lines.
- **Reading order**: F.
- **Hierarchy rationale**: grid is the page; nothing competes — which is why the wasted gutters read as pure loss.
- **Density**: 3 forced toward 4 locally — 6 rows visible with 2-line wrapping; at Wide the same data yields 14 single-line rows (see walkthrough_page_width.png).
- **Ratios & spacing**: content ≈1676px of 2880 (≈58%) centered; gutters #f0f0f0 (est.) ≈21% each side; grid cells default padding.

### Styling specifics (OBSERVED)
- **Palette**: gutters #f0f0f0 (est.), content white, chrome #302d40 (est.), links #1d659c (est.), alternating row tint #fafafa (est.), type icons: house #265382, building #7b3ea6, land-tree #39902f (all est.).
- **Color application points**: address links; three semantic type icons; nav chrome. No other color.
- **Typography moves**: column headers bold STANDARD dark; values STANDARD; numbers right-aligned; addresses left; no all-caps except filter labels/buttons.
- **Imagery stance**: none — icons only (glyph per property type).
- **Card treatment**: none; bordered grid with hairline #eeeeee (est.) rules.
- **Signature moves**: instead of a text "Type" column, single colored glyphs (#265382/#7b3ea6/#39902f) encode house/condo/land; instead of a units column, "sq. ft." vs "acres" inline per row; filter bar mirrors grid columns 1:1 so filtering vocabulary = scanning vocabulary.

### Component inventory (OBSERVED → inferred SAIL)
- Record list: a!gridField(7 columns) with rich-text icon column; filter row of a!dropdownField ×6 ("Any" placeholders) + search a!textField + SEARCH button; site page width setting = "Narrow" (the variable under test).
- Charts none; affordances: row links, filters, search.

### Character & judgment
- **Register**: utilitarian-ops — pure working grid.
- **Why it works (as a lesson)**: the failure is visible in three concrete artifacts — clipped "ADDITIONAL FE…" label, 2-line address wraps, 42% of viewport spent on empty #f0f0f0 gutters.
- **Why not boring**: n/a for aesthetics — its value is the honest failure mode; the semantic icon column is the one flourish worth noting.
- **Boring twin**: n/a — this IS the cautionary version; the corrected twin is the left half of walkthrough_page_width.png.
- **What to steal**: the diagnostic itself — check label clipping, cell wrapping, and gutter share when auditing page width; colored type glyphs for enum columns.
- **Risks**: icon-only type column has no text fallback (screen readers need altText); truncated filter label harms comprehension; wrapped addresses slow scanning.

### Code cross-check
- none (no SAIL source on this page).

## walkthrough_page_width.png

### Identification
- **Image**: walkthrough_page_width.png | **Source page**: ux-example-walkthrough | **Alt/caption**: ds-images/walkthrough_page_width.png; caption: "Both the record list and the record view benefit from the 'Wide' page width"
- **Device frame**: desktop ×2 (composite figure: two framed screenshots side by side)
- **Marker**: neutral (functions as the DO of the page-width pair, opposite walkthrough_narrow.png)
- **UI type**: other (comparative composite: list + record-view at "Wide" width)

### Use-case reconstruction (INFERRED)
- **Persona/domain**: as walkthrough_1/walkthrough_narrow.
- **Top 3 user tasks**: 1. Confirm the record list uses full width well. 2. Confirm the record view (billboard hero) uses full width well. 3. Generalize: choose site page width from the widest-hungry content.
- **Implied requirements**: "One width setting must serve BOTH page types on the site"; "Grid should show maximal rows/columns"; "Billboard should bleed edge to edge."
- **Data model sketch**: same Property list — 14 rows OBSERVED at Wide (adds 827 West Homewood St $2,200,000 2.8 acres; 787 Lakeview $875,000; 178 Pleasant Ct $905,000 Fireplace, Deck; 279 Crescent Dr $190,000 780 sq ft; 28 Forest St $925,000; 756 Aspen Ave Reston $688,000 2.86 acres) + the walkthrough_1 record view.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SBS (two thin-bordered screenshot frames)
├─ [left] record list @Wide: filter rows (search+SEARCH·TYPE·LIST PRICE·SIZE / BEDROOMS·BATHROOMS·ADDITIONAL FEATURES)
│         └─ GRID(7-col | 14 rows visible, single-line rows, no clipped labels)
└─ [right] record view @Wide: title+3 buttons → TABS ×4 → BILLBOARD overlay=BOTTOM-bar (full-bleed) → thumbnails ×7 → description…
```
- **Above the fold**: entire figure; each screenshot is a full viewport.
- **Reading order**: left→right comparison; Z within each half.
- **Hierarchy rationale**: pairing the site's two core page types at equal size argues the width choice must satisfy both simultaneously — the figure's whole claim.
- **Density**: left half 4 (14 grid rows + 7 filters per viewport); right half 3 — same page as walkthrough_1.
- **Ratios & spacing**: two ≈equal halves; inside left, grid consumes ≈full content width with zero gutters (vs 58% at Narrow); "ADDITIONAL FEATURES" filter label fully fits (clipped at Narrow) — the sharpest before/after tell.

### Styling specifics (OBSERVED)
- **Palette**: as siblings — chrome #302d40 (est.), links/accent #1d659c–#21649e (est.), type icons #265382/#7b3ea6/#39902f (est.), white grids, #f0f0f0 frame border (est.).
- **Color application points**: unchanged from siblings; nothing figure-specific beyond the neutral screenshot frames.
- **Typography moves**: as siblings; at this reduction the readable signal is row count and line-wrap behavior, not type detail.
- **Imagery stance**: right half photographic (billboard bedroom frame + 7 thumbs); left half icon-only.
- **Card treatment**: none.
- **Signature moves**: instead of prose "Wide fits more", a same-scale twin-screenshot proof; instead of cropping to the grid, both PAGE TYPES shown, arguing width is a site-level (not page-level) decision.

### Component inventory (OBSERVED → inferred SAIL)
- Site setting pageWidth:"WIDE" applied to: a!gridField record list (7 cols, 14 rows) and record Summary view (a!billboardLayout hero etc.). Same components as walkthrough_1/walkthrough_narrow — the only variable is width.

### Character & judgment
- **Register**: utilitarian-ops (figure) wrapping premium-editorial (right half).
- **Why it works**: 14 vs 6 visible rows and unclipped vs clipped filter labels quantify the benefit; showing list AND record view blocks the "just set width per page" misreading.
- **Why not boring**: n/a — deliberately plain comparative figure; its force is the measurable deltas.
- **Boring twin**: n/a (teaching composite; the DON'T twin is walkthrough_narrow.png).
- **What to steal**: audit page width against the most horizontally hungry page types on the site; screenshot-pair evidence format for design reviews.
- **Risks**: at 2200×616 the halves are heavily downscaled — fine for layout comparison, illegible for content; nothing else.

### Code cross-check
- none (no SAIL source on this page).
