# Analysis: content-structure

Page context: "Content Structure" (section: patterns). Five annotated/demo screenshots teaching one system: primary section headings (page-stated spec: labelSize MEDIUM / H2 / STANDARD), secondary headings (SMALL / H3 / SECONDARY, all-caps), card variants, and when to omit headings. No SAIL on this page; the first image's underlying dashboard has source on the dashboards page (cross-verified there).

## primary_heading_highlight.png

### Identification
- **Image**: primary_heading_highlight.png | **Source page**: content-structure | **Alt/caption**: none (heading: "Primary section heading")
- **Device frame**: desktop (annotated doc figure: screenshot dimmed, three white spotlight chips over the primary headings)
- **Marker**: neutral
- **UI type**: dashboard-analytical (dark-theme retail sales dashboard, annotated)

### Use-case reconstruction (INFERRED)
- **Persona**: doc reader (SAIL designer) learning where primary headings sit; underlying UI serves a retail ops manager, daily
- **Domain & brand context**: fashion e-commerce ("Ruched Dress", campaigns); dark analytic cockpit
- **Top 3 user tasks (ranked)**: 1. Identify which labels are primary section headings 2. See one heading per major zone 3. Map the style onto their own dashboards
- **Implied requirements**: "Every top-level content zone gets exactly one heading"; "Headings must contrast with card body content"; "Zone = column/card cluster, not individual chart"
- **Data model sketch**: KPIs (Total Revenue $3,276.91 +18%, Revenue Per User $374.12 −7%, New Orders 1275 −15%, New Users 76 +22%); Product{name, rating, id, tags}; Region sales; Campaign{visits, purchases, revenue} — read off labels

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (dark)
├─ nav bar + "Financial Summary" + date filters
├─ KPI-ROW ×4 (dark cards, sparkline right)
└─ COLUMNS [≈1:1:1] — spotlight chips on: "Top Selling Products by Category" ·
   "Sales by Region ($)" · "Customer Satisfaction"
```
- **Above the fold**: everything (single figure)
- **Reading order**: Z — KPI band, then three highlighted column heads
- **Hierarchy rationale**: exactly one spotlighted heading per column → teaches 1 heading : 1 zone; KPI band deliberately unhighlighted → KPIs need no section label
- **Density**: 4 (underlying UI) — 4 KPI cards + 6 product rows + 3 charts + grid in one viewport
- **Ratios & spacing**: three near-equal columns; card padding STANDARD (CODE-VERIFIED on dashboards page)

### Styling specifics (OBSERVED; underlying palette CODE-VERIFIED on dashboards page)
- **Palette**: header #17202b, cards style "PLUM_SCHEME" (renders ≈ #232837 est.), chart scheme "RAINFOREST" teals/greens, KPI up #4CC900 / down #E64345, stars #fc9901, tags #F7D027/#E64345; annotation chips #ffffff with black text
- **Color application points**: annotation reserves white strictly for the three heading chips — the lesson is carried by contrast alone
- **Typography moves**: highlighted headings render bold ≈ MEDIUM; note the underlying code uses a!headingField(size:"SMALL", weight:"SEMI_BOLD") — see corrections
- **Imagery stance**: none (charts only)
- **Card treatment**: filled dark cards, showBorder:false
- **Signature moves**: instead of arrows/callout numbers, the doc dims everything and floats white chips over the teaching targets — figure IS the hierarchy lesson

### Component inventory (OBSERVED → CODE-VERIFIED)
- Underlying: a!cardLayout(style:"PLUM_SCHEME"), a!headingField headings, micro line/bar charts (height:"MICRO", axes "NONE"), a!gridField(borderStyle:"LIGHT") — verified in dashboards.md source
- Chart custom colorScheme: "RAINFOREST" + per-KPI hex colors (CODE-VERIFIED)
- Interactive affordances: dropdown + date filters, sortable grid (underlying)

### Character & judgment
- **Register**: utilitarian-ops (underlying), calm-clinical (annotation)
- **Why it works**: spotlight-on-dim isolates the pattern without prose; one chip per column proves the "one primary heading per zone" rule; dark theme shows the spec is theme-independent
- **Why not boring**: annotation-by-dimming beats red arrows; primary headings survive even on PLUM cards where borders vanish
- **Boring twin**: the same screenshot with three red rectangles and numbered callouts keyed to a legend below.
- **What to steal**: audit dashboards by dimming — if you can't spotlight one heading per zone, structure is broken
- **Risks**: annotated figure could be mistaken for a real UI state; dark-theme small gray text underneath is illegible when dimmed (intended)

### Code cross-check (via dashboards page source for this same dashboard)
- **Code-verified palette**: #17202b, PLUM_SCHEME, RAINFOREST, #4CC900, #E64345, #fc9901
- **Notable techniques**: card-section headings implemented as a!headingField(size:"SMALL", weight:"SEMI_BOLD") inside cards
- **Corrections**: the content-structure spec says primary = MEDIUM/H2/STANDARD, but this dashboard's headings are coded SMALL/SEMI_BOLD — the figure teaches placement, not exact size; treat MEDIUM/H2 as the rule, this instance as a compact exception

## secondary_heading_highlight.png

### Identification
- **Image**: secondary_heading_highlight.png | **Source page**: content-structure | **Alt/caption**: none (heading: "Secondary section heading")
- **Device frame**: desktop (annotated: whole page grayed to placeholder blocks; six white chips over secondary headings)
- **Marker**: neutral
- **UI type**: home-page (Boreas Foundation case-worker home, wireframed by the annotation)

### Use-case reconstruction (INFERRED)
- **Persona**: doc reader; underlying UI: nonprofit case worker, daily triage
- **Domain & brand context**: Boreas Foundation case management
- **Top 3 user tasks (ranked)**: 1. See how secondary headings subdivide primary sections 2. Note the all-caps small style 3. Contrast with bold primary headings left visible
- **Implied requirements**: "Secondary headings subdivide, never lead a zone"; "All-caps + SECONDARY color must stay legible next to MEDIUM primaries"; "Two levels max per column"
- **Data model sketch**: My Cases{HIGH PRIORITY, OTHERS} · All Cases · Alerts{MAJOR, MINOR} · Performance{TEAM, ME} — the heading tree is the data

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ site bar (dark)
└─ COLUMNS [≈2:1]
   ├─ SECTION "My Cases" ├─ chip:HIGH PRIORITY ├─ chip:OTHERS
   ├─ SECTION "All Cases"
   └─ right: SECTION "Alerts" (chips MAJOR/MINOR) · SECTION "Performance" (chips TEAM/ME)
```
- **Above the fold**: all four primary sections + six chips
- **Reading order**: F — left column then right rail
- **Hierarchy rationale**: primaries kept in black bold while content is grayed → the two heading tiers are the only legible text, making the size/case/color contrast the entire lesson
- **Density**: 3 (underlying); as annotated, effectively 1
- **Ratios & spacing**: [≈2:1] columns; even vertical rhythm between placeholder bars

### Styling specifics (OBSERVED)
- **Palette**: dimmed grays #808080/#8a8a8a (est.) over white; chips #ffffff; primary headings #1a1a1a (est.); site bar #2e3d45 (est.) with gold underline #f0b428 (est.)
- **Color application points**: annotation only — white chips
- **Typography moves**: primary "My Cases" bold sentence-case ≈ MEDIUM; secondary "HIGH PRIORITY" all-caps ≈ SMALL, gray (SECONDARY token per page spec, H3)
- **Imagery stance**: none
- **Card treatment**: flattened to gray placeholder bars
- **Signature moves**: all-caps does the differentiating work — page text notes caps let SMALL headings hold their own beside MEDIUM primaries

### Component inventory (INFERRED)
- a!sectionLayout(labelSize:"MEDIUM", labelHeadingTag:"H2") primaries containing a!sectionLayout(labelSize:"SMALL", labelHeadingTag:"H3", labelColor:"SECONDARY") with upper-case labels; no charts
- Interactive affordances: none visible (wireframed)

### Character & judgment
- **Register**: calm-clinical
- **Why it works**: six instances across three primary sections prove the pattern generalizes; caps+color+size triple-encode the tier difference
- **Why not boring**: teaching via redaction — content removed so typography hierarchy is unmissable
- **Boring twin**: bulleted style-guide table "H3, 12px, uppercase, gray" with no in-situ example.
- **What to steal**: uppercase SMALL SECONDARY labels for sub-groups; never promote them to zone leads
- **Risks**: SECONDARY gray caps can fall under 4.5:1 on tinted cards; all-caps hurts long labels — keep to 1-2 words

### Code cross-check
- none — no SAIL on this page for this figure

## image21.png

### Identification
- **Image**: image21.png | **Source page**: content-structure | **Alt/caption**: none (heading: "Primary content card heading")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal (Boreas Foundation "Cases" workspace, cards intentionally blank for the figure)

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit case supervisor, daily
- **Domain & brand context**: Boreas Foundation; slate + gold institutional brand
- **Top 3 user tasks (ranked)**: 1. Scan My Cases / Alerts 2. Review All Cases / Performance 3. Create a new case
- **Implied requirements**: "Card zones must be labeled above the card, not inside"; "Title bar must host the page-level action"; "Cards on gray bg use shadow, no border" (page-stated)
- **Data model sketch**: Case, Alert, Performance-metric collections (cards blank by design)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ site bar (dark slate)
├─ title bar (gold): folder icon + "Cases" | [+ NEW CASE] (white outline btn)
└─ COLUMNS [≈2:1] ×2 rows
   ├─ "My Cases" → CARD(blank, shadow)      ├─ "Alerts" → CARD
   └─ "All Cases" → CARD                    └─ "Performance" → CARD
```
- **Above the fold**: title bar + all four headed cards
- **Reading order**: F
- **Hierarchy rationale**: gold bar carries page identity + sole action; headings sit OUTSIDE cards so labels survive any card content re-balancing (page's stated rationale); wide column for case lists, narrow for monitoring
- **Density**: 2 as shown (blank cards); 3 when populated
- **Ratios & spacing**: [≈2:1]; equal gutter ≈ 24px (est.); heading-to-card gap tight (≈ marginBelow "LESS")

### Styling specifics (OBSERVED)
- **Palette**: page bg #efefef (est.), cards #ffffff + soft shadow, site bar #2e3d45 (est.), title bar gold #f0b428 (est.) with near-black text, NEW CASE white fill / gray border
- **Color application points**: gold strictly for the title bar; headings plain dark text on gray bg; no card accents
- **Typography moves**: page title "Cases" ≈ LARGE bold on gold; section headings ≈ MEDIUM bold (spec: MEDIUM/H2/STANDARD); nav all-caps SMALL
- **Imagery stance**: folder glyph + avatar only
- **Card treatment**: showShadow:true, showBorder:false on transparent/gray page bg (page-stated best practice)
- **Signature moves**: heading-above-card instead of in-card header rows — cards stay pure content containers; a colored title bar replaces a billboard for utility pages

### Component inventory (INFERRED)
- a!headerContentLayout + colored title-bar card, a!sectionLayout(labelSize:"MEDIUM", labelHeadingTag:"H2") per zone, a!cardLayout(showShadow:true, showBorder:false), a!buttonWidget New Case; no charts
- Interactive affordances: NEW CASE button, nav tabs

### Character & judgment
- **Register**: institutional
- **Why it works**: labels-outside-cards keep all four zones scannable in one F-sweep; shadow-no-border reads cleanly on gray; single gold bar prevents chrome competing with content
- **Why not boring**: gold title bar gives a flat utility page one memorable stripe; asymmetric 2:1 grid instead of quadrants
- **Boring twin**: four equal white cards each with an internal bold header row and a border, page title floating unanchored top-left.
- **What to steal**: title-bar-with-action for workspaces; headings above cards; shadow-over-border on tinted backgrounds
- **Risks**: blank-figure ambiguity (readers may copy empty cards); gold bar text needs dark ink for contrast; heading-card association depends on tight spacing

### Code cross-check
- none — no SAIL on this page

## image20.png

### Identification
- **Image**: image20.png | **Source page**: content-structure | **Alt/caption**: none (heading: "Secondary section heading in cards")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal (same Cases workspace as image21, now with in-card sub-groups)

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit case supervisor, daily
- **Domain & brand context**: Boreas Foundation (identical chrome to image21)
- **Top 3 user tasks (ranked)**: 1. Separate OVERDUE from DUE SOON within My Cases 2. Separate NEW from ALL alerts 3. Same page actions as image21
- **Implied requirements**: "Sub-groups live INSIDE the primary card"; "Sub-group labels use the secondary style (SMALL/H3/SECONDARY)"; "Only add when a card truly has multiple content groups" (page: "If needed…")
- **Data model sketch**: My Cases{OVERDUE[], DUE SOON[]}; Alerts{NEW[], ALL[]}; All Cases and Performance remain undivided

### Layout anatomy (OBSERVED)
- **Skeleton**: same as image21, plus
```
CARD "My Cases": SECTION "OVERDUE" · SECTION "DUE SOON"
CARD "Alerts":   SECTION "NEW" · SECTION "ALL"
```
- **Above the fold**: all four cards + four in-card sub-headings
- **Reading order**: F
- **Hierarchy rationale**: three tiers now visible — page title (gold bar) > card headings (outside) > sub-groups (inside, all-caps gray) — each tier changes size AND position AND case, so no tier is ambiguous
- **Density**: 2 as shown; 3-4 when lists populate
- **Ratios & spacing**: sub-headings top-aligned within card padding; generous vertical gap between OVERDUE and DUE SOON blocks

### Styling specifics (OBSERVED)
- **Palette**: identical to image21 (page bg #efefef est., cards #ffffff shadow, gold #f0b428 est., slate #2e3d45 est.); sub-headings gray #6c6c75 (est. — SECONDARY token)
- **Color application points**: none new — sub-headings are gray text only
- **Typography moves**: sub-headings all-caps ≈ SMALL SECONDARY vs sentence-case MEDIUM primaries — case+color+position triple contrast
- **Imagery stance**: none
- **Card treatment**: unchanged (shadow, no border)
- **Signature moves**: hierarchy deepened without any new chrome — no dividers, no nested cards, just the secondary label style

### Component inventory (INFERRED)
- Inside a!cardLayout: a!sectionLayout(labelSize:"SMALL", labelHeadingTag:"H3", labelColor:"SECONDARY", label:upper-case); no charts
- Interactive affordances: NEW CASE button, nav tabs

### Character & judgment
- **Register**: institutional
- **Why it works**: sub-groups inherit the card's identity from the outside heading, so labels stay one-word; the gray caps recede until needed; H2→H3 tagging keeps screen-reader outline correct (page's a11y intent)
- **Why not boring**: three-tier hierarchy achieved with typography alone — zero extra boxes
- **Boring twin**: nested bordered sub-cards or divider lines between OVERDUE/DUE SOON, each with bold black headers competing with the card title.
- **What to steal**: subdivide cards with SMALL/SECONDARY caps labels, never nested cards; keep sub-labels to 1-2 words
- **Risks**: gray caps on white ≈ 4.6:1 (est.) — do not lighten further; more than 2 sub-groups per card would crowd

### Code cross-check
- none — no SAIL on this page

## image13.png

### Identification
- **Image**: image13.png | **Source page**: content-structure | **Alt/caption**: none (heading: "Omitting section headings")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (new-hire onboarding record, Appian-branded HR demo)

### Use-case reconstruction (INFERRED)
- **Persona**: HR onboarding coordinator, daily-operator driving pre-start tasks
- **Domain & brand context**: Appian HR demo ("NEW HIRES / CANDIDATES / REEPORTS" nav); clinical blue-gray
- **Top 3 user tasks (ranked)**: 1. Check overall onboarding readiness (83%, starts in 10 days) 2. Chase overdue tasks (−3d, −1d red) 3. Review hire profile/history (timeline, contacts, departments)
- **Implied requirements**: "Readiness must be visible without scrolling"; "Overdue tasks must sort first with negative-day flags"; "Recruitment history must read as a timeline"; "Sections must be self-evident without labels" (the page's whole point)
- **Data model sketch**: NewHire{Kathy Anne Gregory, Software Engineer, REFERRAL, dept Engineering, office HQ, school U. of Virginia, email, phones, referredBy Jennifer Porter, candidateType University}; Milestones{APPLIED 11/5/2018 → PHONE INTVW 11/9 → ONSITE 11/16 → OFFER ACCEPTED 12/21 → START 8/5/2019 with day-gaps 4d/7d/35d/227d}; DeptChecklist{Recruiting 7/8, HR 14/18, Finance 9/9, IT 8/11, Engineering 12/14}; Task{name, assignee{name, role, avatar}, due ±Nd} ×10; Contacts{manager, recruiter, trainer}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ dark header: avatar + "Kathy Gregory" + REFERRAL tag | Department/Office/School fact row
├─ SBS band: donut 83% "50 of 60 tasks" | horizontal milestone TIMELINE ×5 with day-gaps
└─ COLUMNS [≈1:1]
   ├─ dept progress bars ×5 → contacts trio → FORM-style fact grid (First/Middle/Last…)
   └─ GRID(task list): task · ASSIGNED TO (avatar+role) · DUE (sorted ↑, negatives red)
```
- **Above the fold**: header, gauge, timeline, all five bars, top ~6 tasks
- **Reading order**: Z — identity, then gauge/timeline band, then columns
- **Hierarchy rationale**: the 83% donut is the largest graphic → readiness is the page's one question (task 1); DUE column sorted ascending puts −3d/−1d red at top (task 2); identity facts live in the dark header so the body is pure work
- **Density**: 4 — gauge + timeline + 5 bars + 3 contacts + 12-field grid + 10-row task list in one viewport
- **Ratios & spacing**: two ≈ equal body columns; timeline consumes ~60% width of the top band; tight 8-12px row rhythm in the task list (est.)

### Styling specifics (OBSERVED)
- **Palette**: header #3b4a5a (est.), page #ffffff, donut/bars blue #2d5f8a (est.), Finance bar green #3dbf3d (est.), overdue red #e03c3c (est.), REFERRAL tag magenta #c2187e (est.), links #2f7bbf (est.), muted labels #9aa5ad (est.)
- **Color application points**: green only for the one 100% department; red only for negative due-days; magenta only for the referral tag; names as blue links; everything else steel blue/gray — four accent colors, each meaning exactly one thing
- **Typography moves**: donut number ≈ EXTRA_LARGE; hire name LARGE light+bold mix ("Kathy" light, "Gregory" bold-ish); milestone labels all-caps SMALL with dates STANDARD; column headers all-caps SMALL gray (PRE-ONBOARDING TASK / ASSIGNED TO / DUE) acting as table headers, not section headings; task names STANDARD bold
- **Imagery stance**: circular photo avatars everywhere people appear (hire, contacts, assignees) — people-heavy domain
- **Card treatment**: none — flat white with hairline column separations; zones separated by representation change, not boxes
- **Signature moves**: instead of section labels, each zone uses a distinct information *form* (gauge vs timeline vs bars vs fact-grid vs task table) so structure is self-evident — the page's teaching point; day-gap annotations (4d, 7d, 35d, 227d) between milestones encode velocity, not just dates; negative "−3d" duetext beats a generic "Overdue" badge
- **Density**: (see above) 4

### Component inventory (INFERRED — no SAIL on page)
- Donut gauge ≈ a!gaugeField(percentage:83) with rich-text center; milestone strip ≈ sideBySide richTextIcons + dashes; dept bars ≈ a!progressBarField ×5 (green one color:"POSITIVE"); task list ≈ gridField or forEach sideBySide rows with a!imageField AVATAR TINY; REFERRAL ≈ a!tagField(backgroundColor:#c2187e est.)
- Charts: gauge + progress bars only; no colorScheme
- Interactive affordances: person-name links, sortable DUE column (↑ arrow), nav tabs

### Character & judgment
- **Register**: calm-clinical + utilitarian-ops
- **Why it works**: five distinct representation types make labels redundant (the page's argument); single-meaning accent colors survive the no-headings decision; sorted DUE column turns the task grid into a work queue
- **Why not boring**: milestone gaps annotated in days; mixed-weight name typography; readiness gauge paired with "Starts in 10 days" countdown context
- **Boring twin**: same data under six bold headings ("Summary", "Timeline", "Progress", "Contacts", "Details", "Tasks"), all-gray progress bars, absolute due dates, and a bordered card around each zone.
- **What to steal**: change representation per zone instead of labeling zones; ±Nd due encoding with red negatives; annotate timeline gaps with durations
- **Risks**: page text itself flags it — screen-reader users lose structure; add hidden labels/accessibilityText per zone; gray small caps column headers are low-contrast; two-column fact grid may stack poorly on phones

### Code cross-check
- none — no SAIL on this page
