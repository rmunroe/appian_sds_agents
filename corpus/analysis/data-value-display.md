# Analysis: data-value-display

Page: `corpus/pages/data-value-display.md` (section: patterns). Seven display patterns for field/KPI values; every image except image47 is a component-variant crop → tier B. image47 is a full-page screenshot → tier A. SAIL source exists for all patterns (the scrape duplicates one combined code block under five headings; sub-examples mapped below), so palette/param claims are CODE-VERIFIED unless noted. Official pattern vocabulary (page headings): Easy-to-scan field summary · Simple performance indicators · Supplemental information for performance indicators · Performance indicators with trend microcharts · Performance indicators with goal progress bars · Key attribute values · Performance against targets.

## image47.png

### Identification
- **Image**: image47.png | **Source page**: data-value-display | **Alt/caption**: none (heading: "Easy-to-scan field summary")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: donor-relations staffer at a nonprofit ("Boreas Foundation" site chrome), occasional-to-daily lookups of a single supporter record before a call or mailing
- **Domain & brand context**: charitable foundation CRM; restrained institutional brand (dark top bar, yellow active-tab underline, single blue accent)
- **Top 3 user tasks (ranked)**: 1. Verify contact details (email/phone/address). 2. Check the current gift commitment (amount, frequency, source, tier). 3. Review giving history (tenure, lifetime total, highest tier).
- **Implied requirements**: "Staff must scan a supporter's core profile in one glance, no scrolling"; "Read-only summary — no editing affordances"; "Field labels must be visually quiet so values dominate"; "Group fields by topic with explanatory helper text"; "Remain screen-reader legible despite non-standard label rendering" (page text calls this out OBSERVED-in-prose)
- **Data model sketch**: Supporter(name, email, phone, mailingAddress) 1—1 GiftCommitment(frequency, schedule note, amount, source, tier) 1—1 History(supporterSince, lifetimeGiving, highestTierReached). ~10 scalar fields total; single record, no lists.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-CHROME top bar (#22303c est.) tabs=HOME/MY TASKS/CASES active-underline #f5c400 est.
PAGE
├─ TITLE "Karen Anderson" (labelSize LARGE_PLUS)
└─ COLUMNS [EXTRA_NARROW gutter : MEDIUM label-col : value-col : EXTRA_NARROW gutter]
   ├─ SECTION "Contact Information" (labelColor ACCENT, labelSize MEDIUM)
   │  └─ 3 label:value rows, divider BELOW each
   ├─ SECTION "Gift Commitment" + helper (SMALL SECONDARY)
   │  └─ 4 rows (Frequency row carries sub-annotation "On the 1st of each month")
   └─ SECTION "History" + helper
      └─ 3 rows
```
- **Above the fold**: entire record — title, all three sections, all ~10 fields
- **Reading order**: F (section label left, then label→value sweep per row)
- **Hierarchy rationale**: Name is the page title (LARGE_PLUS) because identity confirmation precedes everything; section labels are the only colored text (ACCENT) so topic boundaries pop; values sit hard-right at MEDIUM_PLUS so the scan line down the right edge answers task 1–3 fastest.
- **Density**: 2 — ~10 field rows + 3 section labels occupy the full 1999×1250 viewport; no cards, no grids, generous row spacing.
- **Ratios & spacing**: label column width MEDIUM (CODE-VERIFIED ×10), EXTRA_NARROW outer gutters; rows are sectionLayouts with `divider: "BELOW"` (×9) and `marginBelow: "NONE"`; section gaps `marginBelow: "MORE"/"EVEN_MORE"`.

### Styling specifics (CODE-VERIFIED where named)
- **Palette**: page bg #ffffff; text near-black #333333 (est.); labels/helper `color: "SECONDARY"` (renders ≈#6c6c6c est.); section labels `labelColor: "ACCENT"` (renders ≈#2e6db5 est.); site bar #22303c (est.) with #f5c400 (est.) active underline — chrome, not SAIL
- **Color application points**: section labels only (ACCENT). No icons, tags, buttons, or chart color anywhere in the pattern body.
- **Typography moves**: page title LARGE_PLUS; section labels MEDIUM; labels AND values MEDIUM_PLUS (×21 CODE-VERIFIED) — parity of size, contrast carried by color (SECONDARY label vs standard value); helper text SMALL/STANDARD SECONDARY; value sub-annotation ("On the 1st of each month") smaller SECONDARY under the value; values right-aligned (`align: "RIGHT"` ×10)
- **Imagery stance**: none (avatar in chrome only)
- **Card treatment**: none — open page, hairline dividers only
- **Signature moves**: (1) instead of default field labels ABOVE, label-value pairs are richText rows with values right-aligned via `align:"RIGHT"`, creating a clean right scan edge; (2) instead of bold section headers, `a!sectionLayout(labelColor:"ACCENT")` makes color, not weight, the grouping cue; (3) instead of tooltips, persistent helper text (SMALL SECONDARY) under section labels ("The supporter's current gift commitment"); (4) instead of boxes, `divider:"BELOW"` per row supplies structure with near-zero ink.

### Component inventory (CODE-VERIFIED)
- a!columnsLayout (×14) with EXTRA_NARROW/MEDIUM widths; a!sectionLayout (×17, most `label: ""`); a!richTextDisplayField (×22) with a!richTextItem size MEDIUM_PLUS / color SECONDARY
- Charts: none. colorScheme: n/a
- Interactive affordances: none in pattern (site tabs in chrome). Explicitly display-only; page warns against using with editable forms.

### Character & judgment
- **Register**: calm-clinical + institutional — monochrome typography, one accent, zero decoration.
- **Why it works**: right-aligned values give a single vertical scan line for answers; MEDIUM_PLUS type at ~10 fields fills the viewport so nothing competes; ACCENT section labels segment the page without adding weight.
- **Why not boring**: value right-alignment (rare vs default left); size-parity labels/values differentiated purely by SECONDARY color; inline sub-annotation under "Monthly"; helper sentences baked into section headers.
- **Boring twin**: the same 10 fields as default a!textField displays, labels ABOVE in gray caps, packed two-column inside a bordered card, left-aligned values, section headings in bold black — accurate, cramped, and scannable only by reading every label.
- **What to steal**: right-align values for read-only summaries; reserve the accent color for section labels; put schedule/context annotations directly under the value they qualify.
- **Risks**: label↔value gap approaches ~700px on wide screens — eye-tracking across the gutter strains (dividers mitigate); SECONDARY gray at MEDIUM_PLUS passes contrast but helper SMALL gray is borderline (est. #8a8a8a on white ≈3.6:1); pattern relies on reading order for screen readers — page itself flags "avoid with editable forms".

### Code cross-check
- **Code-verified palette**: only named constants used — SECONDARY, ACCENT, STANDARD; no literal hexes in this block, so all rendered hexes above stay (est.)
- **Notable techniques**: rows built as `a!sectionLayout(label:"", divider:"BELOW", marginBelow:"NONE")` (~lines 60–600); label column fixed `width:"MEDIUM"`, value column auto; page title itself is a sectionLayout label at LARGE_PLUS; EXTRA_NARROW empty flanking columns center the sheet
- **Corrections**: none — pixels matched code.

## image54.png

Pattern: Simple performance indicators — separate-cards variant (page: data-value-display)

- **Produces it**: 4× `a!cardLayout(style:"NONE")` in NARROW columns; richText label `color:"SECONDARY"` over value `size:"LARGE", style:"STRONG"` (CODE-VERIFIED)
- **Looks like**: four bordered tiles; gray label over big number (Applications 3,415 … Enrolled 199)
- **Use when**: independent metrics need standalone weight | **Avoid when**: metrics form one family — four borders read as clutter (page steers to image59)
- **Styling hooks**: border vs borderless, value size, column width
- **Pairs well with**: record headers, dashboard top rows
- **Hexes**: none — color not the variant dimension
- **Marker**: neutral

## image59.png

Pattern: Simple performance indicators — shared-card group variant (page: data-value-display)

- **Produces it**: one `a!cardLayout`: heading `size:"MEDIUM_PLUS"`, `a!columnsLayout(showDividers:true)` of 4 SECONDARY-label/LARGE-STRONG-value columns, footer `size:"SMALL", color:"SECONDARY"` (CODE-VERIFIED)
- **Looks like**: single card — title, four numbers split by hairline dividers, "2021 Fall Semester" caption
- **Use when**: a KPI family shares one context/timeframe | **Avoid when**: values need independent emphasis or differing periods
- **Styling hooks**: showDividers, heading/footer, spacing
- **Pairs well with**: funnel metrics (this is an admissions funnel), section tops
- **Hexes**: none
- **Marker**: neutral

## image97.png

Pattern: Supplemental information for performance indicators — two stacked variants (page: data-value-display)

- **Produces it**: cards of richText stacks. Row 1: ALL-CAPS SECONDARY label, value LARGE STRONG, supplement below in STANDARD SECONDARY; supplement-less cards get an empty-space char so heights match (CODE-VERIFIED). Row 2: value + trailing icon `color:"ACCENT", size:"LARGE"` (envelope-o, check-circle-o, handshake-o, university) + caret trend line POSITIVE/NEGATIVE; zero change = "– (0.0%)" SECONDARY (CODE-VERIFIED)
- **Looks like**: same admissions KPIs upgraded — top row gray context sentences; bottom row blue mnemonic icons plus green/red delta lines
- **Use when**: the number begs a question (as-of date, definition, movement) | **Avoid when**: supplements repeat the label or crowd small cards
- **Styling hooks**: all-caps labels outrank supplements; smaller supplement font; icon color
- **Pairs well with**: image38 microcharts (same delta grammar)
- **Hexes**: named constants only
- **Marker**: neutral

## image38.png

Pattern: Performance indicators with trend microcharts (page: data-value-display)

- **Produces it**: `a!forEach` over `local!values` maps → card: KPI column + `a!lineChartField(height:"MICRO", xAxisStyle/yAxisStyle:"NONE", showLegend:false)`; series `color: if(percentChange<0, "#eb113f", "#1cc101")`; delta caret NEGATIVE/POSITIVE; `a!currency` formatting (CODE-VERIFIED)
- **Looks like**: four cards — number + delta left, naked 36-point sparkline right; green rising (TOTAL REVENUE, NEW USERS), red falling (REVENUE PER USER, NEW ORDERS)
- **Use when**: direction/shape of recent movement matters as much as the level | **Avoid when**: only current values decide — chart ink becomes noise
- **Styling hooks**: MICRO height, axes NONE, conditional series color, window length
- **Pairs well with**: revenue/ops dashboards, drill-in links
- **Hexes**: #1cc101 up / #eb113f down (CODE-VERIFIED)
- **Marker**: neutral

## image90.png

Pattern: Performance indicators with goal progress bars — two color-strategy variants (page: data-value-display)

- **Produces it**: per card: label SECONDARY + right-pinned `a!richTextIcon(icon:"bullseye")` goal; value LARGE STRONG beside `a!progressBarField(style:"THICK", percentage: 91|57|98|152)`, in-bar % labels. Top variant: selective coding — on-track `color:"#434343"`, shortfall NEGATIVE, overshoot POSITIVE. Bottom variant: all ACCENT/default (CODE-VERIFIED)
- **Looks like**: two rows of four cards; top charcoal/red/charcoal/green bars, bottom uniform steel-blue; "◎ $7,000" goal in each corner
- **Use when**: numeric goals exist; variant 1 only when good/bad is unambiguous | **Avoid when**: semantic color implies judgment you can't defend — use accent (page guidance)
- **Styling hooks**: bar color per state, THICK, bullseye affordance
- **Pairs well with**: target dashboards; image36 for midpoint targets
- **Hexes**: neutral bar #434343 (CODE-VERIFIED)
- **Marker**: neutral

## image10.png

Pattern: Key attribute values (page: data-value-display)

- **Produces it**: 4× `a!cardLayout(style:"NONE")`: ALL-CAPS SECONDARY label, value LARGE STRONG decorated per type — empty amount "$ –" (dash SECONDARY); status `a!richTextIcon(icon:"inbox", color:"#45818e")`; boolean `check-circle` NEGATIVE; person `a!imageField(a!userImage(), size:"ICON", style:"AVATAR")` (CODE-VERIFIED)
- **Looks like**: KPI-style cards holding record attributes: CLAIM AMOUNT $–, CLAIM STATUS ⬓ Submitted, INJURIES ✔(red) Yes, CLAIM ADJUSTER 🧑 Karen Anderson
- **Use when**: a record's 3–5 defining attributes deserve header-level scan weight | **Avoid when**: attributes are long text or frequently edited
- **Styling hooks**: icon color per status taxonomy, avatar for people, en-dash empty state
- **Pairs well with**: record headers above tabs/grids; image47 for the long-form remainder
- **Hexes**: status icon #45818e; NEGATIVE on "Yes" flags risk, not success (CODE-VERIFIED)
- **Marker**: neutral

## image36.png

Pattern: Performance against targets (page: data-value-display)

- **Produces it**: card: title MEDIUM STRONG; value LARGE_PLUS STRONG + "days" LARGE SECONDARY (+ `exclamation-triangle` NEGATIVE on breach); then TWO half-width `a!progressBarField(style:"THICK", showPercentage:false)` in `a!columnsLayout(spacing:"NONE", showDividers:true)` — the column divider IS the midpoint target marker; target text above, "SLA" below (CODE-VERIFIED)
- **Looks like**: 45 days ⚠ red bar overshooting the SLA tick (halves 100%+50% NEGATIVE); 11 days blue bar at 55% of first half (`percentage:-1` empties the second)
- **Use when**: overshoot vs target must be visible | **Avoid when**: plain % of goal suffices — this is a two-bar assembly
- **Styling hooks**: NEGATIVE breach vs ACCENT within; divider-as-marker
- **Pairs well with**: SLA/ops scorecards
- **Hexes**: named constants only
- **Marker**: neutral

### Page rollup
Default choice for most cases is the shared-card group (image59) because related metrics almost always share context, and one card with `showDividers` gives the family a single frame with minimal ink. Escalate deliberately: add supplements (image97) when numbers beg "as of when? vs what?", microcharts (image38) when trajectory drives decisions, progress bars (image90/36) only when explicit numeric goals exist. Color rule across all variants: neutral (#434343) or ACCENT by default; POSITIVE/NEGATIVE only where good/bad is defensible — and the same red can mean "risk present" on an attribute card (image10 INJURIES: Yes). For non-metric record fields at scan weight use image10; for the full read-only profile use image47's open, right-aligned sheet.
