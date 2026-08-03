# Analysis: ux-section-layout

No SAIL source on this page — all hexes are pixel-sampled `(est.)`.

## overview_sections_1.png

Tier A as suggested. Note: the three orange rectangles #fe9d00 (est.) around section headings are documentation annotation overlays, not UI; caption: "Use section headings to describe the key content groupings on a page".

### Identification
- **Image**: overview_sections_1.png | **Source page**: ux-section-layout | **Alt/caption**: ds-images/overview_sections_1.png; caption above
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: residential real-estate agent/broker; daily-operator reviewing listings inside a listing-management site (nav: ALL PROPERTIES / NEW PROPERTY / TRENDS & METRICS).
- **Domain & brand context**: residential real estate, Fairfax County VA ("Great Falls" neighborhood OBSERVED); institutional steel-blue chrome, no consumer branding.
- **Top 3 user tasks (ranked)**: 1. Review a property's complete spec sheet (interior / exterior / location & taxes). 2. Compare against nearby comps (photo, price, distance, BR/BA/sqft). 3. Check local market context (median list price, offer volume) before pricing/advising.
- **Implied requirements**: "Full dossier on one scrolling page, grouped by named sections"; "Location ratings (Schools/Transit/Safety) readable in one glance"; "Comps must pair photo with price+specs+distance"; "Market trend stats for last 90 days"; "Entry points to create properties and view portfolio trends".
- **Data model sketch**: Property(beds 3, baths 2.5, rooms w/ dimensions, basement 464 sq ft, garage ×2, utilities, deck, heated pool, lot 0.85 ac; county Fairfax; taxes $12,664.26, assessment $1,093,160.00; local stats incl. population 17,606, households w/ children 49.41%) —N NearbyHome ×4 (address, 1.4–9.8 mi, $875,000–$2,150,000, BR/BA/sqft) — MarketTrend(median list $1,475,000, avg offers 1.0).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-CHROME bar #4d7a9a (tabs w/ icons; active tab #054269 + white underline; app grid + avatar right)
├─ SECTION "Property Details" (blue #1b6eac)
│  └─ COLUMNS [1:1:1]
│     ├─ "Interior Features" (gray) → 5 bold sub-groups + bullet lists
│     ├─ "Exterior Features" (gray) → 5 bold sub-groups + bullet lists
│     └─ "Location Details" (gray) → SBS icon-trio (Schools Good / Transit Poor / Safety Good)
│        + 3 bold sub-groups + bullet lists
├─ SECTION "Nearby Homes" (blue)
│  └─ CARD ×4 row: full-bleed photo, bottom scrim w/ white address (mi) + price•BR•BA•sqft
└─ SECTION "Local Market Trends (last 90 days)" (blue) → label:value stats (crop ends here)
```
- **Above the fold**: chrome + the entire Property Details section; Nearby Homes begins ≈2/3 down the capture.
- **Reading order**: single-column of three sections; F-pattern across the three detail columns.
- **Hierarchy rationale**: three blue headings segment the page into exactly the three ranked tasks; details come first (the agent's core lookup); comps get the only photography — visual identification beats text for houses.
- **Density**: 3 — ~45 attributes, 4 image cards, and 3 stats in one capture, kept airy by borderless whitespace grouping.
- **Ratios & spacing**: detail columns ≈[1:1:1]; section gaps ≈ `marginBelow: "STANDARD"`; no boxes around any detail zone; comp cards flush in one row (≈4-up, even gutters).

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; nav #4d7a9a with active #054269; section-heading blue #1b6eac; column sub-heads #707070; body/bold labels #222222; positive #00b021 / negative #f62143 (sampled on the identical Location block crop `richtext_do.png`, ux-rich-text); photo scrim ≈45% black over image (avg ≈#848688); annotation orange #fe9d00 (docs overlay, not UI).
- **Color application points**: blue only on the 3 section headings (+ nav chrome); green/red only on the 3 qualitative ratings; photos are the only saturated area; everything else neutral gray/black.
- **Typography moves**: section headings ≈MEDIUM_PLUS bold blue; column sub-heads MEDIUM regular gray; sub-group labels STANDARD bold #222222; bullets STANDARD; card captions white ≈MEDIUM address + SMALL meta; caps only in nav chrome. Four distinct grades = four nesting levels, no indentation needed.
- **Imagery stance**: 4 property photos (full-bleed card media); gray outline icons (book/bus/shield) for ratings; glyph icons in nav.
- **Card treatment**: comp cards flat, image-filled, caption on scrim (no border); detail zones completely unboxed — heading typography does all grouping.
- **Signature moves**: instead of bordered cards per group, a pure type-hierarchy grouping system (blue MEDIUM section → gray MEDIUM sub-head → bold STANDARD sub-group); instead of a "Location" bullet list, an icon + word trio with POSITIVE/NEGATIVE color for one-second reads; instead of a comps grid, photo cards with in-image caption strips; strict color economy makes the lone red "Poor" the loudest element on the page.

### Component inventory (OBSERVED, params INFERRED)
- Site header (tabs) is chrome, not in-page SAIL; content = 3× `a!sectionLayout(labelColor: "ACCENT"-family blue)`; `a!columnsLayout` [1:1:1]; sub-heads as `a!richTextDisplayField(color: "SECONDARY", size: "MEDIUM")`; bullet lists as rich text; rating trio = `a!sideBySideLayout`(gray `a!richTextIcon` + STRONG label + `a!richTextItem(color: "POSITIVE"/"NEGATIVE")`); comps = `a!cardLayout(padding: "NONE")` w/ image + overlay caption (billboard-style), likely links; trends = label:value rich text pairs.
- Chart types: none visible; "List Price" label implies a chart below the crop (INFERRED).
- Interactive affordances: nav tabs, app-grid + avatar, comp cards presumably clickable (INFERRED); no filters on this view.

### Character & judgment
- **Register**: calm-clinical + institutional — county-records subject matter, zero decoration, disciplined single accent.
- **Why it works**: heading color+size alone carves ~45 fields into three scannable zones (exactly the caption's lesson); "Poor" in #f62143 is an instant risk flag amid neutral text; comps carry price/specs on the photo so comparison needs no table.
- **Why not boring**: box-free grouping via graded labels where most builders would stack bordered cards; semantic icon-trio instead of another bullet list; photo-scrim comp cards; 4-level type ladder with zero indentation.
- **Boring twin**: one bordered card titled "Property Information" holding a two-column field grid, location ratings as plain text rows, comps in an `a!gridField` with thumbnail column, every heading the same size/color.
- **What to steal**: the 3-grade label system (blue section / gray sub-head / bold sub-group) for dense records; POSITIVE/NEGATIVE words+icons for qualitative scores; caption-on-scrim image cards for comparable entities.
- **Risks**: white captions depend on scrim strength — the bright sky behind "178 Pleasant Ct" is borderline; #00b021/#f62143 on white ≈2.9–4:1 (computed), acceptable only because words carry the meaning; three bullet columns stack very long on phone; the below-fold trends chart may go unnoticed.

### Code cross-check
none — no SAIL source on this page.

## sectionLabelSizes.png

### Principle: "Grade section labels by nesting level"
- **DO shows**: Profile page with a three-tier label ladder — page title "Profile" ≈LARGE bold #222222; section labels ("Personal Details", "COVID-19 Health Information") ≈MEDIUM bold accent blue #3d6fa6 (est.); sub-section labels ("Contact Information", "History") ≈MEDIUM regular gray #767676 (est.); then right-aligned bold #222222 field labels against plain values. Hierarchy is legible from grades alone — no rules, boxes, or indentation.
- **DON'T shows**: none pictured (uniform-text twin: `font_features_dont.png`, ux-rich-text).
- **Rule**: one distinct size/weight/color grade per nesting level, consistent page-wide.
- **Severity**: usually
- **Category**: typography
- **SAIL implication**: `a!sectionLayout(labelSize:, labelColor:)` stepped per level (e.g. LARGE/STANDARD → MEDIUM/ACCENT → MEDIUM/SECONDARY); label:value via side-by-side rich text.
- **Marker**: do

## filterControls_dont.png + filterControls_do.png (DO/DON'T pair)

### Principle: "Toggle filters with links, not collapsible section headings"
- **DON'T shows**: "Prospect Pipeline" list whose filter dropdowns (Category / Region / Status / Industry) sit inside a collapsible section "Filters" (blue #09609c (est.) + chevron) — a control panel dressed as content structure, adding clutter and a false grouping.
- **DO shows**: "Show advanced settings" and "Hide filters" plain links (#085e9f (est.), cursor shown) toggling controls inline; section headings (blue "Account Settings") stay reserved for content groupings.
- **Rule**: section headings describe what content IS; links perform show/hide of controls.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!richTextItem` link + `showWhen:` on the filter block instead of `a!sectionLayout(label: "Filters", isCollapsible: true)`.
- **Marker**: dont / do

## mixCollapsible_dont.png

### Principle: "Don't mix collapsible and fixed sections on one page"
- **DON'T shows**: three stacked sections — "Items" and "Vendor Information" collapsed with chevrons; "Approval" (expanded: approver fields + signature) not collapsible. All headings share blue #0065a1 (est.), but chevrons push collapsible heading text right while "Approval" sits flush-left — OBSERVED ragged edge breaks rhythm, implies false hierarchy, makes collapse affordance unpredictable.
- **DO shows**: none pictured — implied: all sibling sections collapsible, or none.
- **Rule**: collapse behavior (and the alignment it causes) must be uniform across siblings.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: set `isCollapsible` identically on every `a!sectionLayout` at the same level (all true + `isInitiallyCollapsed` as needed, or all false).
- **Marker**: dont
