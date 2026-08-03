# Analysis: ux-box-layout

## box_dont_nest.png (lone DON'T — no DO sibling on page)

### Principle: Never nest boxes inside boxes
- **DO shows**: none in corpus — implied fix: one "My Profile" box (or a plain page) with Shipping/Billing as section headings or side-by-side field groups.
- **DON'T shows**: a "My Profile" STANDARD box (#f0f0f0 title bar, #d4d4d4 border) wrapping two more STANDARD boxes ("Shipping Address", "Billing Address") — three identical gray title bars at different depths; double borders and indentation shrink content width while adding zero hierarchy cues, since inner and outer titles render identically.
- **Rule**: one box level only; structure a box's interior with headings and spacing, not more boxes.
- **Severity**: always
- **Category**: layout
- **SAIL implication**: inside a!boxLayout use a!sectionLayout or richText headers — never another a!boxLayout.

## box_layout_example.png

Component: box layout (page: ux-box-layout). Official variant vocabulary (named by page): styles "STANDARD", "ACCENT", "WARN", "ERROR". Tier B — the ERROR style.

- **Produces it**: a!boxLayout(label:"Sorry! There was a problem with your order", style:"ERROR")
- **Looks like**: pale-pink title bar #ffeeef, red label #f0022e, pink border #ff8aad; white body with #222222 text "Your credit card could not be charged".
- **Use when**: one problem needs attention at the point of failure. | **Avoid when**: decorating ordinary sections.
- **Styling hooks**: style enum (semantic colors), showBorder/showShadow.
- **Pairs well with**: checkout/validation messages above forms.
- **Hexes**: #ffeeef bar, #f0022e label, #ff8aad border — color IS the variant.
- **Marker**: neutral

### Page rollup (tier-B)
Default box is STANDARD (#f0f0f0 title bar); semantic WARN/ERROR styles are reserved for a single attention box per page.

## box_for_sections.png

Tier override: batch suggests C (DO), but this is a complete full-page UI screenshot (nav, record tabs, billboard, three columns of real data) → analyzed at tier A per protocol rule 4. The DO/DON'T teaching vs box_mixed_styles.png is captured in the pair section below.

### Identification
- **Image**: box_for_sections.png | **Source page**: ux-box-layout | **Alt/caption**: "alttext" [DO] — "Use the same style for all boxes when they represent page sections"
- **Device frame**: desktop (3060x1894, 2x retina)
- **Marker**: do
- **UI type**: record-view (hotel property summary dashboard)

### Use-case reconstruction (INFERRED)
- **Persona**: hotel-chain regional/brand manager reviewing one property — weekly-manager cadence; not the on-site operator.
- **Domain & brand context**: hospitality chain ("CITYHOTEL" logo, appianhotels.com email); warm-professional brand — taupe chrome, plum accent, night-skyline photography.
- **Top 3 user tasks (ranked)**: 1. Check property health: Spend/Occupancy/Repeat + occupancy trend + guest origin. 2. Look up property facts: address, phone, map, rooms. 3. Identify key staff and message the GM.
- **Implied requirements**: "KPIs and satisfaction readable in one glance"; "Year-over-year occupancy comparison (2015 vs 2016)"; "Map and address co-located"; "GM reachable without leaving the page"; "Deeper record data one tab away (Summary/Bookings/F&B/Events/Staff)".
- **Data model sketch** (OBSERVED off labels): Property(name "Chicago Downtown The Loop", logo, address 9 W Monroe St Chicago IL 60603, fax, email, telephone, rooms 177 incl. 23 suites, category…); Metrics(spend $121.93, occupancy 97.4%, repeat 31%, satisfaction{guests, elites, staff}, occupancyByMonth ×2 series Sep–Dec 92–100, guestOrigin{Japan 28.0%, EU 17.9%, Other 4.3%, …}); Staff(role, name, photo) ×4; Message(to=GM Terence Caldwell, body).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ TOPBAR app nav ×5 (PROPERTIES selected) + avatar, bg≈#75736b (est.)
├─ TABS ×5 record tabs (Summary selected, chip #5d3f66 est. on strip #aeaeae est.)
├─ BILLBOARD h≈390 overlay=bar,center,semi-dark content=CITYHOTEL logo tile + name
└─ COLUMNS [1:1:1]
   ├─ BOX "Information" (STANDARD): label-value pairs + embedded map + Rooms/Category
   ├─ BOX "Performance" (STANDARD): KPI trio + satisfaction smileys + CHART(line) + CHART(pie)
   └─ BOX "Key Staff" (STANDARD): photo grid 2×2
      └─ BOX "Send a message to the GM" (STANDARD): TO + paragraph field
```
- **Above the fold**: nav, tabs, billboard, all four box title bars, first content rows (KPIs, address, staff row 1).
- **Reading order**: F — billboard across, then three equal columns scanned left to right.
- **Hierarchy rationale**: the billboard names the record before any data; Performance owns the center column because health-check is task 1; equal thirds because tasks 2–3 are peers — identical STANDARD title bars let content, not chrome, differentiate.
- **Density**: 3 — balanced product UI: 4 boxes, 2 charts, 3 KPIs, a map, and 4 staff photos in one viewport with comfortable padding.
- **Ratios & spacing**: columns ≈[1:1:1]; box body padding ≈STANDARD; billboard ≈20% of viewport height; inter-box gutters ≈STANDARD.

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; nav #75736b (est.) warm taupe; tab strip #aeaeae (est.), selected chip #5d3f66 (est.); box title bars #f0f0f0, labels #222222, borders #d4d4d4 (est.); interactive purple #5f2372 (est.); line chart 2016 #6aa5e0 (est.) vs 2015 #333333 (est.); pie Japan blue / EU orange #d78e2f (est.); satisfaction green #43a047 (est.) ×2 + yellow #f2b03d (est.); billboard SEMI_DARK scrim over amber night skyline.
- **Color application points**: purple = interactivity only (links, staff names, help "?" icons, selected tab); semantic color confined to the satisfaction smileys; box chrome stays gray — the page's DO teaching.
- **Typography moves**: property name LARGE white in the overlay; box titles STANDARD STRONG #222222; KPI labels STRONG with MEDIUM values; all-caps SMALL staff roles; label-value stacks in Information.
- **Imagery stance**: night-skyline billboard photo, 4 circular staff portraits, embedded street map — photography supplies the warmth.
- **Card treatment**: boxes with hairline border, flat (no shadow), square corners, filled #f0f0f0 title bars.
- **Signature moves**: instead of section headings on white, uniform STANDARD boxes compartmentalize a dense record into four scannable chunks; instead of a toolbar header, a center bar overlay on a billboard names the record; instead of colored box headers, brand purple is spent exclusively on interactive text; satisfaction rendered as three emoji faces instead of a metrics table.

### Component inventory (OBSERVED)
a!headerContentLayout + record tab bar; a!billboardLayout(overlay: a!barOverlay(position:"CENTER", overlayStyle:"SEMI_DARK")); a!boxLayout(style:"STANDARD") ×4; a!columnsLayout [1:1:1]; richText label-value pairs; embedded map image; KPI trio with a!richTextIcon("question-circle") help affordances; a!lineChartField(2 series; dark-vs-blue pairing suggests custom colorScheme — INFERRED); a!pieChartField(labeled slices); a!imageField(circle avatar) ×4 + purple name links; a!paragraphField in the message box. Affordances: app nav, record tabs, email link, staff record links, GM message form.

### Character & judgment
- **Register**: utilitarian-ops + warm-community — an operations record made friendly by photography and plum accents.
- **Why it works**: four identical #f0f0f0 title bars form a quiet grid that makes the three-column scan effortless; purple-only-for-links yields instant affordance detection; KPIs + smileys + charts give three altitudes of "how are we doing" inside a single box.
- **Why not boring**: billboard record header with a logo tile instead of breadcrumb text; smiley-based satisfaction row; taupe/plum chrome instead of default blue; a live map embedded inside an Information box.
- **Boring twin**: stacked full-width gray H2 sections — an Information table, then one huge chart, then a staff grid — under a solid blue header bar, with "Contact" buried at the bottom.
- **What to steal**: uniform STANDARD boxes as the page-section system; center-bar billboard as record header; spend the single accent hue strictly on interactive text.
- **Risks**: white text on the semi-dark scrim is borderline over bright skyline regions; #aeaeae tab strip gives weak contrast for unselected labels; three equal columns stack long on phone, pushing GM messaging far down; "?" help icons imply hover (touch gap).

### Code cross-check
- none (no SAIL source on this page)

## box_for_sections.png + box_mixed_styles.png (DO/DON'T pair)

### Principle: Section boxes wear one style
- **DO shows**: the hotel record's four boxes all STANDARD — #f0f0f0 title bars, #222222 labels — so title bars read as one quiet system and purple remains the only accent.
- **DON'T shows**: the same page restyled — Information plum #58296e, Performance pale-yellow #fefed7, Key Staff pale-blue #edf4fe (label #35578c), message box gray #f0f0f0. Four boxes, four styles: the yellow falsely signals a warning, the plum box dominates though its content is least urgent, and no bar matches any other.
- **Rule**: boxes that organize page sections all get the identical STANDARD/ACCENT style; WARN/ERROR mark a single attention box only.
- **Severity**: usually (always when semantic styles are used decoratively)
- **Category**: color
- **SAIL implication**: a!boxLayout(style:"STANDARD") uniformly across section boxes.

## box_layout_border.png + box_layout_shadow.png (paired — both DO, complementary contexts)

### Principle: Border on white, shadow on tinted — never both
- **DO shows (border)**: a "Current Classes" box — blue #1b72e7 title bar, white body listing class links (#1b72e7) with roster counts — edged by a hairline border on a white page: crisp separation, no haze.
- **DO shows (shadow)**: the identical box on a gray page (#f0f0f0) drops the border for a soft drop shadow, lifting the box off the tinted background.
- **Rule**: pick the elevation cue from the header-content background — border on white, shadow on transparent/tinted; combining both doubles the outline noise.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!boxLayout(showBorder:true, showShadow:false) on white pages; (showBorder:false, showShadow:true) when the headerContentLayout background is tinted.
