# Analysis: record-views

## image34.png

### Identification
- **Image**: image34.png | **Source page**: record-views | **Alt/caption**: none (heading: "Basic record view with cards")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (campaign record, Summary tab)

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit campaign manager, weekly-manager cadence; monitors one fundraising campaign
- **Domain & brand context**: Boreas Foundation (same brand family as page-headers images); ops-analytics record
- **Top 3 user tasks (ranked)**: 1. Check pledge progress vs time elapsed 2. Review setup facts and gift stats 3. Analyze performance mix (geo/urban/age) before acting (Update/Delete Campaign)
- **Implied requirements**: "Header must be unmistakably distinct from contents" (flush dark header — stated technique); "Progress must pair % with absolute values"; "Record actions must ride the header"; "Values must be readable at arm's length" (large label/value text — stated technique)
- **Data model sketch**: Campaign(name "Q3 Search Engine Marketing (US)", startDate 6-1-2021, endDate 8-31-2021, goal $750,000, pledged $265,319.42, impressions 932,531, clicks 53,219, CTR 5.7%, conv 7.8%, avgCPC $0.75, maxCPC $2.25) 1—* Gift(4,150; donors 4,103; min $5; max $1,000); breakdown dimensions Region×4, Urbanicity×3, AgeBand×8 (OBSERVED)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ HEADER flush dark: H1 title + record actions (UPDATE/DELETE, outline-on-dark)
├─ TABS ×4 (Summary active filled, rest links)
└─ COLUMNS [1:1]
   ├─ SECTION "Campaign Setup" → CARD(3 label/value rows, dividers)
   │  SECTION "Performance Summary" → CARD(8 rows; 2 with inline progress bars)
   └─ SECTION "Gift Stats" → CARD(KPI-ROW ×4 + caption)
      SECTION "Performance Breakdown" → CARD(2× CHART(donut) + CHART(column))
```
- **Above the fold**: header, tabs, all four cards (bottom of chart grazes the fold)
- **Reading order**: F — title band, then left facts column, right analytics column
- **Hierarchy rationale**: dark flush header carries identity + destructive/primary actions so contents stay pure data; facts left / analysis right mirrors "what is it → how is it doing"; paired 37%/37% bars put the campaign's core question (pledge pace vs time) in one glance
- **Density**: 3 — four zones, ~20 values + 3 charts, generous row spacing (balanced product UI)
- **Ratios & spacing**: equal columns; label/value rows divided by hairlines; cards white on light gray with shadow, ≈STANDARD padding

### Styling specifics (OBSERVED)
- **Palette**: header #2E3A45 (est.) flush to viewport edges; page bg #F4F5F7 (est.); cards #FFFFFF shadow no-border; active tab fill #1D5FA6 (est.), tab links #1D6FBF (est.); progress bars #1D6FBF (est.) with white % label on bar; region donut = indigo→lavender ramp #283593→#9FA8DA (est.); urbanicity donut = blue ramp #1565C0→#90CAF9 (est.); age columns #4A90D9 (est.)
- **Color application points**: header (identity), tabs/links + bars + all chart series (one blue family), zero semantic reds/greens — analytical neutrality
- **Typography moves**: H1 ≈ LARGE white on dark; section headers ≈ MEDIUM STANDARD bold; label/value rows at MEDIUM/MEDIUM_PLUS (deliberately large — the page's stated technique); Gift Stats values ≈ LARGE_PLUS STRONG with SMALL secondary labels above; caption "As of yesterday at midnight" SMALL SECONDARY; eyebrow sub-labels "GEOGRAPHIC"/"DEMOGRAPHIC" caps SMALL SECONDARY
- **Imagery stance**: none — charts only
- **Card treatment**: flat white + shadow, square corners, contrasted against transparent gray body (stated technique)
- **Signature moves**: instead of default record chrome on white, a set header background color makes the header flush and bold (page text: "set a header background color… bolder header style"); instead of a KPI card grid, Gift Stats is one card with a 4-stat divided row; progress rendered as label + inline mini-bar + right absolute value in the same row — three encodings, one line; monochrome chart ramps keep 3 charts from fighting
- **Density**: (above)

### Component inventory (OBSERVED)
- Record header w/ background color + `a!recordActionField` equivalents (outline-on-dark buttons); record view tabs
- Label/value rows: `a!sideBySideLayout` or 2-col `columnsLayout` with `divider:"BELOW"` sections
- Progress: `a!progressBarField`-style compact bars with percentage labels
- `a!pieChartField(style:"DONUT", seriesLabelStyle:"LEGEND", colorScheme custom)` ×2; `a!columnChartField` (y-axis "% of total", 8 age bins)
- Interactive affordances: tabs, header actions; no filters

### Character & judgment
- **Register**: calm-clinical + authoritative-executive — one hue, big quiet numbers
- **Why it works**: flush dark header + white cards on gray gives three unambiguous elevation layers without borders; the twin 37% bars (time vs pledged) answer "on pace?" instantly; blue-only palette keeps charts comparative rather than alarmist
- **Why not boring**: label-left/value-right rows at MEDIUM_PLUS read like a spec sheet, not a form dump; stat row caption discloses data freshness; two donuts share geometry but distinct ramps so they don't read as duplicates
- **Boring twin**: white header with black title, actions floated far right, one tall card with 15 label-over-value fields, default multicolor pie + rainbow columns
- **What to steal**: flush colored record header with actions embedded; time-vs-money paired progress bars; one-hue ramps per chart family; freshness captions under stats
- **Risks**: no semantic cue when pledge pace falls behind time (both bars blue — user must compare); light-gray labels on white are borderline contrast; donut pairs need legends read (slices unlabeled)

## image72.png

### Identification
- **Image**: image72.png | **Source page**: record-views | **Alt/caption**: none (heading: "Basic record view (alternative)")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (insurance claim, adjuster-facing)

### Use-case reconstruction (INFERRED)
- **Persona**: claims adjuster/examiner, daily-operator; works claims and their related records
- **Domain & brand context**: INSURECORP auto insurer, plum-brand theme variant; internal working tool
- **Top 3 user tasks (ranked)**: 1. Verify claim facts (coverages, incident, driver) 2. See process position (timeline) 3. Pivot to related records (related claims, parties, claims history)
- **Implied requirements**: "Subject fields and one-to-one related records in the middle; one-to-many lists on the right" (stated structure); "Coverage flags must read yes/no at a glance"; "Related records must be one click away"; "Don't mix column counts within a card" (stated caution)
- **Data model sketch**: Claim(number 123-456-6789, opened, source, coverage flags collision/comprehensive/liability/medical/uninsured/rental) —1:1— Incident(description, location, date, conditions, injuries, propertyDamage, tow, police…) —1:1— Driver(name, DOB, license…); Claim 1—* RelatedClaim / ClaimsHistory(claim#, status, closedDate) ×4; 1—* Party(name, roles) ×3 (CODE-VERIFIED fields)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV dark plum · RECORD-HEADER plum band: H1 "Claim 123-45-6789" + EDIT/REJECT actions
COLUMNS [NARROW_PLUS : AUTO : MEDIUM]
├─ SECTION "Claim Progress" → vertical timeline ×6 (ACCENT stamps done, gray future)
├─ SECTION "Claim Details" → CARD(3-col label-over-value ×3 rows)
│  SECTION "Incident Details" → CARD(full-width description + 3-col rows)
│  SECTION "Insured Driver Details" → CARD(4-col rows)
└─ SECTION "Related Claims" → CARD(GRID 1 row) · "Involved Parties" → CARD(stamp list ×3) · "Claims History" → CARD(GRID 4 rows)
```
- **Above the fold**: all three columns through Insured Driver Details / Claims History
- **Reading order**: F with a fixed left rail — timeline anchors, center facts, right pivots
- **Hierarchy rationale**: center column widest (AUTO) because facts are the work; timeline NARROW_PLUS as persistent orientation; one-to-many lists right where scanning, not reading, happens
- **Density**: 4 — three columns, ~30 fields + 2 grids + 3-party list in one viewport, STANDARD card padding (working-tool dense)
- **Ratios & spacing**: CODE-VERIFIED widths [NARROW_PLUS, AUTO, MEDIUM]; sections `marginBelow:"MORE"`; grids in cards with `padding:"NONE"`, parties card `padding:"LESS"`

### Styling specifics (CODE-VERIFIED)
- **Palette**: stamps done = `backgroundColor:"ACCENT"` (renders theme plum #8B3A62 est.), future = #d9d9d9 with #666666 content; party stamps #1155cc (SF ×2) and #38761d (AT); party names/link text `color:"ACCENT"` (plum); coverage icons POSITIVE check / NEGATIVE times / SECONDARY minus; cards `style:"NONE", showShadow:true, showBorder:false`; grids `borderStyle:"LIGHT"`; header band plum #7A2B5C (est.), nav #451C39 (est.)
- **Color application points**: theme ACCENT drives stamps, links, claim# links — brand = interactivity; semantic green/red only on yes/no icons; everything else neutral
- **Typography moves**: section labels MEDIUM STANDARD (H2); field labels STANDARD bold over STANDARD values (`labelPosition:"ABOVE"`); description spans full card width above 3-col rows (stated exception for long values); grid headers plain
- **Imagery stance**: initial/text stamps (TINY) as avatars; no photos
- **Card treatment**: white, shadow, no border; grids flush inside `padding:"NONE"` cards
- **Signature moves**: instead of icon-only booleans, coverage flags pair colored icon + "Yes/No/Not carried" text (`a!richTextIcon(icon:"check", color:"POSITIVE")` + label); one-to-one vs one-to-many placement encoded by column (middle vs right); consistent per-card column counts (3/3/4) obeying the page's misalignment warning; timeline stamps reuse the popular-patterns vertical timeline with ACCENT instead of POSITIVE
- **Density**: (above)

### Component inventory (CODE-VERIFIED)
- `a!stampField` timeline (TINY, EXTRA_NARROW column + connector `a!imageField`)
- `a!cardLayout(showShadow:true)` sections; `a!richTextDisplayField(labelPosition:"ABOVE")` field grids
- `a!gridField(borderStyle:"LIGHT")` ×2 (Related Claims `data: local!claimsHistory[1]`, Claims History full set; closed "–" when null)
- `a!sideBySideLayout` parties: `a!stampField(text:"SF", backgroundColor:"#1155cc")` + name ACCENT STRONG + role SECONDARY
- Chart types: none; affordances: claim# links, header actions

### Character & judgment
- **Register**: utilitarian-ops + institutional
- **Why it works**: three-column altitude split (process | facts | relationships) matches adjuster workflow; icon+text booleans survive grayscale and screen readers; plum accent doubles as "clickable" signal so grids stay scannable
- **Why not boring**: theme-accent timeline instead of default green; description-spans-full-width exception handled deliberately; Related Claims (open) split from Claims History (all) — same entity, two questions
- **Boring twin**: single wide column of stacked field groups, timeline as a text list of dates, related records behind a "Related" tab, blue links everywhere
- **What to steal**: middle=1:1, right=1:many column contract; icon+word booleans; per-card column-count discipline
- **Risks**: plum-on-plum (accent names on white is fine, but accent stamps + accent links may overload one hue); 4-col driver rows will misalign against 3-col cards on narrow screens (code stacks at TABLET_LANDSCAPE); gray future-timeline text #666 on #d9d9d9 stamp is low contrast

## image66.png

### Identification
- **Image**: image66.png | **Source page**: record-views | **Alt/caption**: none (heading: "Case summary record view")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (policyholder-facing claim summary)

### Use-case reconstruction (INFERRED)
- **Persona**: policyholder (occasional-customer) checking their auto claim
- **Domain & brand context**: INSURECORP, bright-blue consumer theme
- **Top 3 user tasks (ranked)**: 1. "Where is my claim and what happens next?" 2. Review loss facts (where/when/what) 3. See vehicle damage record and repair status
- **Implied requirements**: "Next step must be spelled out in words" (What's next banner); "Progress must be visual, not tabular" (timeline); "Recognize the topic at a glance via map/photos/diagram" (stated goal: visual information display techniques); "Self-service actions (cancel/message) always visible"
- **Data model sketch**: Claim(number, status→timeline of 6 milestones w/ dates) —1:1— Driver(Sharif, discount tag) —1:1— Incident(location Beverly Hills 90210, datetime Sep 13 2021 3:00PM, type Collision) —1:1— Vehicle(2009 Saab 9-5, VIN YS3EH58GX13004109, condition "Not Drivable - Towed", damage zones R FRONT/FRONT/L FRONT/L REAR, photos ×4) + RepairStatus("Waiting for Estimate") (OBSERVED/CODE-VERIFIED)

### Layout anatomy (OBSERVED, CODE-VERIFIED)
- **Skeleton**:
```
SITE-NAV blue · RECORD-HEADER flush #1155cc-family: H1 "Claim 123-45-6789" + CANCEL/SEND actions
TABS ×4 (Summary filled active)
CARD(banner "What's next? …", style=#cfe2f3)
COLUMNS [NARROW_PLUS : MEDIUM_PLUS : AUTO]
├─ vertical timeline ×6 (POSITIVE green done w/ dates, gray future)
├─ "Insured Driver" CARD(stamp #118bf1 + name + TAG #45818e) · "Details of Loss" CARD(LOCATION map, DATE & TIME, TYPE OF LOSS)
└─ "Insured Vehicle & Damage" CARD(stamp #a64d79 + model + VIN, photos ×4, condition, damage diagram + NEGATIVE tags) · "Repair Status" CARD(clock icon + text, centered)
```
- **Above the fold**: header, tabs, banner, timeline, driver card, most of loss + vehicle cards
- **Reading order**: F — banner first full-width, then three columns left-to-right
- **Hierarchy rationale**: the sentence-form "What's next?" outranks all data because the persona's #1 question is temporal; timeline column reinforces it spatially; evidence-heavy vehicle column widest (AUTO) since photos/diagram need room
- **Density**: 3 — three columns but airy MEDIUM_PLUS values, EVEN_MORE padding on repair card (balanced, consumer-calibrated)
- **Ratios & spacing**: CODE-VERIFIED [NARROW_PLUS, MEDIUM_PLUS, AUTO→WIDE]; sections `marginBelow:"MORE"`; photo strip `spacing:"DENSE"`

### Styling specifics (CODE-VERIFIED)
- **Palette**: banner #cfe2f3 on white header card; timeline done stamps POSITIVE green / future #d9d9d9+#666666; driver stamp #118bf1; discount tag #45818e; vehicle stamp #a64d79; damage tags NEGATIVE; repair clock icon #a4c2f4 EXTRA_LARGE; cards `style:"NONE"` + shadow; header band bright blue (theme)
- **Color application points**: green exclusively = completed progress; red exclusively = damage zones; pastel blues = guidance (banner, clock); identity hues confined to stamps/tags — four color jobs, no overlap
- **Typography moves**: eyebrow sub-labels inside cards ("LOCATION", "DATE & TIME", "INSPECTION PHOTOS") SMALL caps SECONDARY H3; values MEDIUM_PLUS; banner lead-in "What's next?" STRONG inline with body MEDIUM; driver/vehicle names MEDIUM_PLUS STRONG beside stamps
- **Imagery stance**: heavy and purposeful — embedded Google map (`a!webContentField`, SHORT), 4 damage photos (`a!imageField` thumbnails), schematic car outline with tag overlays
- **Card treatment**: white shadow cards on transparent bg; banner is a filled card inside the header slot
- **Signature moves**: instead of a status field, a full-sentence next-step banner (`richTextItem` STRONG lead + body, card #cfe2f3); damage encoded on a car schematic with NEGATIVE tags positioned via nested `columnsLayout` — a diagram built from layout primitives; empty-state Repair Status uses oversized pastel icon + SECONDARY text, centered with `padding:"EVEN_MORE"`; tag colors (#45818e) reserved for entitlements
- **Density**: (above)

### Component inventory (CODE-VERIFIED)
- `a!cardLayout(style:"#cfe2f3")` banner; vertical timeline stamps/connectors (as popular-patterns image84, POSITIVE variant)
- `a!stampField` identity chips (#118bf1 "S", #a64d79 car icon); `a!tagField(a!tagItem(backgroundColor:"#45818e"))`; damage `a!tagItem(backgroundColor:"NEGATIVE", size:"SMALL")`
- `a!webContentField(source: maps embed, height:"SHORT", showBorder:true)`; `a!imageField(isThumbnail:true, size:"FIT")` ×4; `cons!CAR_DAMAGE_OUTLINE` image
- Record tabs; header record actions
- **Register**: calm-clinical + warm-community — guidance-first consumer tone

### Character & judgment
- **Why it works**: three visual instruments (timeline, map, diagram) each replace a paragraph; the banner converts process state into plain language at the exact top-of-page fixation point; strict color-role separation keeps green=progress and red=damage unambiguous
- **Why not boring**: schematic-with-tags damage summary instead of a text list; oversized pastel empty-state icon instead of a dash; per-entity stamp hues echo image82's identity-color system
- **Boring twin**: status dropdown value "Vehicle Inspected", address as text only, damage as comma-separated list, repair status "N/A"
- **What to steal**: next-step sentence banner; diagram-plus-tags for spatial data; single-purpose color roles; EVEN_MORE-padded centered empty states
- **Risks**: Google embed = external dependency + privacy; tag text at SMALL on NEGATIVE red needs contrast check; three-column stack order on phone must keep banner first (code stacks at TABLET_LANDSCAPE)

## image24.png

### Identification
- **Image**: image24.png | **Source page**: record-views | **Alt/caption**: none (heading: "Case summary page (alternative)")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: case-study-detail (freeform interface, not a record view — stated)

### Use-case reconstruction (INFERRED)
- **Persona**: policyholder, occasional-customer (same scenario as image66; different construction)
- **Domain & brand context**: INSURECORP consumer claim portal
- **Top 3 user tasks (ranked)**: 1. Grasp claim stage instantly (header timeline) 2. Read what happens next 3. Review facts/evidence below
- **Implied requirements**: "Header composition must be fully custom (breadcrumb + timeline + guidance stacked)" — the freeform's stated purpose; "Timeline must sit in the brand band, horizontal"; "Actions live on the breadcrumb bar"; page text tradeoff: "Use record views to maximize development velocity"
- **Data model sketch**: same claim entity set as image66 (driver, incident, vehicle, repair status; 6 milestones with dates Sep 13/13/15)

### Layout anatomy (OBSERVED, CODE-VERIFIED)
- **Skeleton**:
```
SITE-NAV blue
CARD(breadcrumb "Claims > 123-45-6789" + CANCEL/SEND buttons, style=#1c4587, padding=LESS)
CARD(TIMELINE horizontal ×6: date/stamp/label per NARROW col, arrows between, style=#1155cc)
CARD(banner "What's next? …", style=#cfe2f3)
COLUMNS centered [spacer : MEDIUM_PLUS : WIDE : spacer]
├─ "Insured Driver" CARD · "Details of Loss" CARD(map…)
└─ "Insured Vehicle & Damage" CARD(photos, condition, diagram) · "Repair Status" CARD
```
- **Above the fold**: full tri-band header + banner + top half of both content columns
- **Reading order**: single-column header stack, then Z across two centered content columns
- **Hierarchy rationale**: process state is promoted INTO the header (the page's differentiator vs image66) — stage is answered before any scroll; breadcrumb band carries identity + actions in minimum height; content demoted to two centered columns with empty flanks for focus
- **Density**: 3 — rich header but only two content columns, large values, flanking whitespace
- **Ratios & spacing**: CODE-VERIFIED header cards flush (`marginBelow:"NONE"` between bands); timeline columns NARROW with EXTRA_NARROW arrow columns, `spacing:"NONE"`; desktop-only spacer columns via `a!isPageWidth({"DESKTOP","DESKTOP_WIDE"})`

### Styling specifics (CODE-VERIFIED)
- **Palette**: breadcrumb band #1c4587; timeline band #1155cc; banner #cfe2f3; done stamps POSITIVE (green) `contentColor:"STANDARD"`; future stamps `backgroundColor:"SECONDARY"` with #999999 content and #d9d9d9 labels; buttons OUTLINE SECONDARY on dark; content cards white+shadow (as image66); dates STRONG white
- **Color application points**: two-step blue banding (darker utility bar over brighter hero bar) builds header depth without borders; green/gray progress dichotomy; pastel banner as the only soft tint
- **Typography moves**: white timeline labels MEDIUM STRONG when done, #d9d9d9 plain when future — weight+color redundancy on a dark ground; dates STRONG above stamps; breadcrumb MEDIUM with chevron; banner mixes STRONG lead-in + regular body
- **Imagery stance**: photos/map/diagram in body (shared with image66); header is purely iconographic (stamps + arrows + clock icon for current step)
- **Card treatment**: header = three flush filled cards (the page-headers "mix and match" idea applied to a record); body = white shadow cards
- **Signature moves**: instead of a title, the breadcrumb IS the title row (identity + actions in a #1c4587 strip, `padding:"LESS"`); horizontal timeline built from repeating [date/stamp/label] NARROW columns with arrow separators — `a!isPageWidth` swaps flanking spacers off below DESKTOP; current step marked by a clock icon separator (OBSERVED) while future steps dim three ways (stamp bg, content color, label color)
- **Density**: (above)

### Component inventory (CODE-VERIFIED)
- `a!cardLayout(style:"#1c4587"|"#1155cc"|"#cfe2f3", marginBelow:"NONE")` header stack inside `headerContentLayout(header:{…})`
- Timeline cells: `a!richTextDisplayField(align:"CENTER", preventWrapping:true)` + `a!stampField(size:"SMALL", align:"CENTER")`; arrows `a!richTextIcon(icon:"arrow-right", size:"MEDIUM_PLUS")`
- `a!buttonArrayLayout(align:"END")` OUTLINE SECONDARY on dark
- Body cards identical to image66 inventory (map webContent, photo thumbnails, damage tags, stamps, tag field)
- Charts: none

### Character & judgment
- **Register**: calm-clinical + warm-community
- **Why it works**: promoting the timeline into a full-width brand band makes stage the page's first read — measurably earlier than image66's left rail; triple-encoding of future steps (bg, glyph color, label color) survives the dark background; flush band stack gives a designed, non-Appian-default look while staying pure SAIL
- **Why not boring**: header as three stacked filled cards (breadcrumb/timeline/guidance) — chrome built from content primitives; responsive spacer columns instead of fixed centering; clock-vs-arrow separator quietly marks "you are here"
- **Boring twin**: standard record header titled "Claim 123-45-6789", timeline as a Status field + dates grid inside a "Progress" card, guidance in a tooltip
- **What to steal**: breadcrumb-strip-as-title with end-aligned actions; horizontal [date/stamp/label] timeline columns for ≤6 fixed milestones; dim future steps on three channels at once
- **Risks**: freeform forfeits record-view velocity/tabs (stated tradeoff); horizontal timeline caps at ~6 milestones before wrapping (vertical variant scales better — page text); #d9d9d9 future labels on #1155cc ≈ 3:1 — decorative-only legibility; two blues + green demand careful theme governance

## record-view-custom-header.png

Tier B (as suggested): 2420x492 cropped header fragment — component analysis, not full-page.

### Component: Custom record header (page: record-views)

- **Produces it**: record header hidden; `a!headerContentLayout(header:…)` stacks breadcrumb+actions card, title-band card, and `#FAFAFC` tabs card of `a!cardLayout(style:"TRANSPARENT", link:a!recordLink(dashboard:…))` columns with `a!horizontalLine(color: active ? "ACCENT" : "#fff0")` underlines (CODE-VERIFIED)
- **Looks like**: navy strip ("All Claims › CLM-2024-001847", ghost + white-solid buttons); blue band with H1, icon meta chips (muted labels, white values), unicode-dot stepper "Step 4 of 6" (done green, current yellow ring, future muted); light tabs row, active tab underlined
- **Use when**: record needs bespoke identity/status/navigation | **Avoid when**: default header suffices — hiding it removes built-in title, tabs, actions (stated); record-type refs don't copy across environments
- **Styling hooks**: band hexes; stepper glyphs `char(9210/9135/9022)` colored per state; `a!match` dashboard routing; `preventWrapping` H1
- **Pairs well with**: staged claim/case workflows (image24's simpler sibling)
- **Hexes** (CODE-VERIFIED — color IS the layering dimension): #1c4587, #1155cc, #BFC8E2, #F4F7FF(E6), #4ade80, #facc15, #9CA7E6, #FAFAFC
- **Marker**: neutral

### Page rollup
Default remains the built-in record header (velocity, free tabs/actions); use this custom stack only when staged status or brand banding must live in the header, rebuilding tabs as `recordLink` dashboards as coded.
