# Analysis: employee-home-pages

Page: `corpus/pages/employee-home-pages.md` (section: patterns). All seven images are full-page home-page screenshots → tier A. Four of them (image8, image53, image43, image77) are the SAME Boreas Foundation campaign-manager page — image8 plain, the others with a white spotlight overlay emphasizing one zone; image8 carries the full deep-dive and the variants analyze their teaching point without repeating it. Full SAIL source exists for image8-family and image2; none for the two density examples. Cross-ref: the page's lead example `ins_agent_home_page.png` (insurance agent home page) is analyzed under its primary page; it is also the anchor image for density 4 in CONVENTIONS.

## image8.png

### Identification
- **Image**: image8.png | **Source page**: employee-home-pages | **Alt/caption**: none (heading: "Choosing the right type of header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (operational)

### Use-case reconstruction (INFERRED)
- **Persona**: campaign manager at a nonprofit foundation ("Boreas Foundation"), mid-level, daily first-screen; monitors fundraising performance and works tasks
- **Domain & brand context**: donation-campaign operations; sober institutional chrome (dark bar, yellow tab underline) warmed by a penguin billboard photo
- **Top 3 user tasks (ranked)**: 1. Monitor fundraising KPIs (page text says a KPI header was chosen "because it's important for users to actively monitor business performance"). 2. Work assigned tasks / catch alerts. 3. Scan and launch campaigns (grid + NEW CAMPAIGN).
- **Implied requirements**: "KPIs must be visible before any scrolling"; "One primary CTA (new campaign) reachable from the header"; "Tasks show assignee, recency, and overdue state at a glance"; "Alerts zone must hold its place even when empty"; "Common actions and reference links live on-page but subordinate"
- **Data model sketch**: KPI(label, value%, deltaPct, direction) ×5; Campaign(name, startDate 6/1/2021, endDate 8/31/2021, goalAmountUSD, pctRaised) ×17 (paging "1–15 of 17"); Task(title, assignees[people|groups], timestamp|dueDate, overdue?) ×5-of-N; Resource(title, kind: download|external) ×4; Goal(metric, pctOfGoal) ×2; Alert ×0.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈EXTRA_SHORT media=photo(penguins) overlay=none marginBelow=NONE
├─ CARD(KPI-ROW ×5 dividers + SOLID btn "NEW CAMPAIGN", white bar)  ← header slot
└─ COLUMNS [MEDIUM:AUTO:MEDIUM]
   ├─ SECTION "Alerts" → CARD(empty-state, fixed h=MEDIUM_PLUS)
   │  SECTION "My Tasks" → CARD(5× CARD(link) + see-all CARD)
   ├─ SECTION "Active Campaigns" → CARD(GRID(15 rows visible; search+category filter+export/filter/refresh toolbar))
   └─ SECTION "Actions" → CARD(3 OUTLINE buttons FILL)
      SECTION "Resources" → CARD(4× link CARD(stamp+title))
      SECTION "My Goals" → CARD(GAUGE ×2)
```
- **Above the fold**: billboard strip, all 5 KPIs + CTA, tops of all three columns (~8 campaign rows)
- **Reading order**: F — KPI bar first, then left-to-right across column tops
- **Hierarchy rationale**: KPI bar spans full width directly under the photo because task 1 is monitoring; the widest (AUTO) center column holds the campaign grid — the working surface; the only SOLID button is NEW CAMPAIGN, matching the single most valuable action.
- **Density**: 4 — eight content zones plus a 15-row grid within one 1999×1250 viewport; compact task cards; built for a daily operator.
- **Ratios & spacing**: content columns MEDIUM:AUTO:MEDIUM (CODE-VERIFIED), KPI row inside WIDE_PLUS + NARROW button column; KPI dividers via `spacing:"SPARSE", showDividers:true`; cards `showBorder:false, showShadow:true`; list-holding cards `padding:"NONE"` with padded child cards.

### Styling specifics (CODE-VERIFIED via page SAIL)
- **Palette**: content bg light gray ≈#f0f0f0 (est.; headerContentLayout `backgroundColor:"TRANSPARENT"`); cards #ffffff; accent/links/solid CTA ACCENT (renders ≈#1f6dc1 est.); empty-state icon #d9d9d9; stamp pairs #d7e5f3/#3d85c6 (downloads) and #d7f3e0/#459b20 (external links); gauges #45818e, #a64d79; OVERDUE tag NEGATIVE; deltas POSITIVE/NEGATIVE; site bar #212c38 (est.) + #f5c400 (est.) underline (chrome)
- **Color application points**: header CTA (solid); KPI trend carets; task assignee names (ACCENT) and OVERDUE tag; resource stamps; gauge rings; grid row links; "104%" in POSITIVE
- **Typography moves**: KPI labels authored ALL-CAPS at STANDARD; KPI values MEDIUM_PLUS STRONG with SECONDARY MEDIUM_PLUS icons; section labels MEDIUM, H2, STANDARD color; task titles STRONG with `preventWrapping:true`; metadata SMALL SECONDARY
- **Imagery stance**: one decorative photo billboard; styled icons elsewhere (SECONDARY gray in KPIs, tinted stamps TINY in Resources)
- **Card treatment**: borderless + shadow (`style:"NONE", showBorder:false, showShadow:true`) throughout — shadow-on-gray does the separation
- **Signature moves**: (1) instead of a title header, the header slot is BILLBOARD(EXTRA_SHORT) + a!cardLayout of KPIs — brand strip and instrument panel replace a headline; (2) instead of five KPI cards, one shared card with column dividers (`spacing:"SPARSE", showDividers:true`); (3) instead of many solid buttons, exactly one SOLID (LARGE "NEW CAMPAIGN") — sidebar actions demoted to OUTLINE/SECONDARY FILL; (4) empty Alerts renders a designed state: `char(10)`×4 + bell-slash-o #d9d9d9 EXTRA_LARGE + "No Alerts" SECONDARY inside a fixed MEDIUM_PLUS card; (5) tasks are cards-as-links (a!dynamicLink on cardLayout) with a two-line grammar: title STRONG / meta row (hand-o-right + assignees, right-pinned date via `width:"MINIMIZE"`).
### Component inventory (CODE-VERIFIED)
- a!headerContentLayout, a!billboardLayout(height:"EXTRA_SHORT"), a!cardLayout (header bar, zone wrappers, task/resource rows), a!columnsLayout(showDividers), a!sideBySideLayout(+MINIMIZE), a!richTextDisplayField/Item/Icon, a!buttonWidget(style:"SOLID"/"OUTLINE", color:"SECONDARY", width:"FILL"), a!tagField(a!tagItem(backgroundColor:"NEGATIVE")), a!stampField(size:"TINY", tinted), a!gaugeField(size:"SMALL", custom colors, a!gaugeIcon), a!gridField(labelPosition:"COLLAPSED", height:"AUTO"), a!dynamicLink
- Charts: gauges only, custom colors yes (#45818e, #a64d79)
- Interactive affordances: grid search + CATEGORY dropdown + export/filter/refresh; cards-as-links; "See All Tasks" overflow link; record actions (header CTA + sidebar buttons)

### Character & judgment
- **Register**: utilitarian-ops + warm-community — dense working zones under a wildlife photo and mission-toned content.
- **Why it works**: the KPI card visually fuses with the billboard into one header unit (marginBelow NONE on both), so monitoring costs zero scroll; single-solid-button discipline makes the primary action unmissable among ~10 buttons; consistent borderless-shadow cards keep 8 zones from fragmenting.
- **Why not boring**: photo-strip-plus-instrument-panel header instead of a page title; tinted stamp icons encode resource type by color pair; empty state that is designed rather than blank; per-KPI delta carets tucked at baseline right.
- **Boring twin**: gray title bar reading "Home", KPIs as four bordered boxes stacked above a full-width grid, every action a solid blue button in a row, an empty white rectangle where alerts would be.
- **What to steal**: KPI header card under a short billboard; one-solid-CTA rule; two-line task-card grammar with MINIMIZE-pinned dates.
- **Risks**: SMALL gray metadata on white is low-contrast (est. ≈#767676, ~4.5:1 borderline); penguin photo is decorative (fine) but yellow-on-dark tab underline is chrome-dependent; three columns collapse via stackWhen — long grid will push right-column actions far down on tablets/phones (order: tasks → grid → actions).

### Code cross-check
- **Code-verified palette**: #d9d9d9, #d7e5f3/#3d85c6, #d7f3e0/#459b20, #45818e, #a64d79; constants ACCENT/POSITIVE/NEGATIVE/SECONDARY; billboard image is an Unsplash webImage
- **Notable techniques**: header = billboard + cardLayout stacked in the `header:` slot (≈lines 32–304); KPI dividers via columnsLayout(spacing:"SPARSE", showDividers:true) (≈272); task list card padding:"NONE" wrapping link-cards (≈354–723); gauge "104%" text colored POSITIVE (≈1020); stackWhen: PHONE/TABLET_PORTRAIT/TABLET_LANDSCAPE/DESKTOP_NARROW (≈1048)
- **Corrections**: none — pixels matched code.

## image53.png

### Identification
- **Image**: image53.png | **Source page**: employee-home-pages | **Alt/caption**: "…with emphasis on a highlights list used to display user tasks." | **Device frame**: desktop | **Marker**: neutral | **UI type**: home-page (spotlight overlay on the My Tasks zone; base page = image8)

### Use-case reconstruction (INFERRED)
- **Persona / domain**: same as image8 (campaign manager, nonprofit)
- **Top 3 user tasks**: 1. See my most relevant tasks without leaving home. 2. Jump to a task. 3. Escape to the full task list.
- **Implied requirements** (from page prose + pixels): "Show 5–10 items max, sorted/filtered by relevance"; "No paging controls — a See All link instead"; "Only critical fields per item; details live on the item's own page"
- **Data model sketch**: Task(title, assignees: people links + groups, timestamp|dueDate, overdue flag) — exactly 5 shown + overflow link

### Layout anatomy (OBSERVED)
- **Skeleton**: base page as image8; spotlighted zone =
```
SECTION "My Tasks" → CARD(padding NONE)
└─ 5× CARD(link): title STRONG preventWrapping / meta(hand-o-right+assignees SMALL, [OVERDUE tag], date SMALL MINIMIZE)
   └─ CARD("See All Tasks ›" ACCENT STRONG centered)
```
- **Above the fold**: whole highlights list | **Reading order**: single-column within the list | **Hierarchy rationale**: title line dominates each item; metadata compressed to one SMALL line so five items fit one card height | **Density**: 4 (inherited) — 5 two-line items in ~430px | **Ratios & spacing**: items marginBelow:"NONE", stacked flush inside a padding-NONE card

### Styling specifics (CODE-VERIFIED)
- **Palette/application**: as image8; inside the list — assignee person-names ACCENT, groups plain; OVERDUE a!tagItem backgroundColor NEGATIVE, SMALL; timestamps SECONDARY SMALL
- **Typography**: titles STANDARD STRONG single-line (`preventWrapping:true`); meta SMALL
- **Imagery**: hand-o-right SECONDARY SMALL as assignee glyph | **Card treatment**: flush link-cards, borderless+shadow container
- **Signature moves**: relevance-truncated list (5 items, no pager) with a centered "See All Tasks ›" card as the ONLY navigation; people vs groups distinguished purely by ACCENT color; overdue encoded as a tag inline with meta, not a red row.

### Component inventory (CODE-VERIFIED)
- a!cardLayout(link: a!dynamicLink) per item; a!sideBySideLayout with width:"MINIMIZE" date pinning; a!tagField; richText grammar as image8. No charts. Affordances: each row is a link; overflow link.

### Character & judgment
- **Register**: utilitarian-ops — list stripped to decision-critical fields.
- **Why it works**: two-line grammar keeps five tasks in one glance; no pager honors "home is a jumping-off point"; single-line titles prevent height wobble.
- **Why not boring**: cards-as-links with flush stacking read as a list, not boxes; OVERDUE tag placed mid-meta where the eye already is.
- **Boring twin**: a paged read-only grid with six columns (ID, title, assignee, created, due, status) crammed into the sidebar.
- **What to steal**: 5–10 item cap + See-All escape; encode entity-type by color only when clickable.
- **Risks**: truncated titles hide differentiating tails ("…template brandi…"); SMALL meta contrast; tag + date + assignees can collide on narrow columns (MINIMIZE mitigates).

### Code cross-check
- As image8; item cards ≈lines 354–715; overflow card ≈692–715. Corrections: none.

## image43.png

### Identification
- **Image**: image43.png | **Source page**: employee-home-pages | **Alt/caption**: "…with emphasis on a call-to-action button and a card displaying common user actions." | **Device frame**: desktop | **Marker**: neutral | **UI type**: home-page (spotlight on header CTA + Actions card; base page = image8)

### Use-case reconstruction (INFERRED)
- **Persona / domain**: as image8
- **Top 3 user tasks**: 1. Start a new campaign (primary). 2. Enroll a donor / launch audit / add category (secondary). 3. Everything else on the page.
- **Implied requirements**: "Primary record action visible in the header at all times"; "Secondary actions grouped, equal weight, clearly subordinate to the CTA"; "Actions must read as actions, not content"
- **Data model sketch**: actions only — NewCampaign; EnrollNewDonor; LaunchQuarterlyAudit; NewCampaignCategory (record actions, no data rows)

### Layout anatomy (OBSERVED)
- **Skeleton**: base page as image8; spotlighted zones =
```
HEADER CARD … └─ COLUMNS […:NARROW] → BUTTON "NEW CAMPAIGN" SOLID LARGE icon=plus-circle align=END
SECTION "Actions" → CARD(buttonArrayLayout ×3, width=FILL, OUTLINE, SECONDARY, icons)
```
- **Above the fold**: both zones | **Reading order**: header CTA caught in the F-scan's first sweep; Actions card top-right of content | **Hierarchy rationale**: page text names the two record-action styles — "call to action" in the header, "sidebar" style in the Actions card — weight matches frequency/importance | **Density**: 4 (inherited) | **Ratios & spacing**: CTA in NARROW right column of the KPI card; sidebar buttons stacked FILL width

### Styling specifics (CODE-VERIFIED)
- **Palette/application**: CTA = the page's only SOLID ACCENT button (≈#1f6dc1 est. rendered); sidebar buttons OUTLINE with `color:"SECONDARY"` (gray border/label) so they don't compete; each carries a leading icon (user-plus, search, plus-circle)
- **Typography**: button labels ALL-CAPS as rendered; CTA size LARGE
- **Imagery**: icons on all four buttons | **Card treatment**: Actions card borderless+shadow like all zones
- **Signature moves**: two-tier action system — one SOLID LARGE CTA in the header vs OUTLINE SECONDARY FILL stack in a labeled card; actions get their own H2 section ("Actions") instead of floating buttons.

### Component inventory (CODE-VERIFIED)
- a!buttonArrayLayout(align:"END") + a!buttonWidget(style:"SOLID", size:"LARGE") in header; a!buttonArrayLayout(align:"START") of 3× a!buttonWidget(width:"FILL", style:"OUTLINE", color:"SECONDARY") in card. These stand in for record action components (page: "easiest way… is with the record action component").

### Character & judgment
- **Register**: utilitarian-ops.
- **Why it works**: exactly one saturated button on a page with ~10 clickables; FILL widths make the sidebar set scannable as a menu; icons disambiguate similar verbs.
- **Why not boring**: CTA lives inside the KPI header card (action beside the numbers that motivate it) rather than a toolbar.
- **Boring twin**: four identical solid-blue buttons in a header toolbar, no grouping card, no icons.
- **What to steal**: header CTA + sidebar-card pairing; OUTLINE+SECONDARY for everything that is not the one primary action.
- **Risks**: gray OUTLINE SECONDARY labels flirt with disabled-look; three stacked full-width buttons grow tall on stacked mobile layout.

### Code cross-check
- Header button ≈lines 281–295; Actions card ≈760–795. Corrections: none.

## image77.png

### Identification
- **Image**: image77.png | **Source page**: employee-home-pages | **Alt/caption**: "…with emphasis on a card displaying alerts." | **Device frame**: desktop | **Marker**: neutral | **UI type**: home-page (spotlight on the empty Alerts card; base page = image8; heading: "Preserve layout consistency when data changes")

### Use-case reconstruction (INFERRED)
- **Persona / domain**: as image8
- **Top 3 user tasks**: 1. Notice alerts when they exist. 2. Trust the page shape when they don't. 3. Continue to tasks below.
- **Implied requirements** (page prose): "Cap items per section"; "Fix a minimum card height when below typical item count"; "Never show a bare empty list — show an empty-state message and keep height so layout stays balanced"
- **Data model sketch**: Alert ×0 (empty collection driving the state)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SECTION "Alerts" → CARD(h=MEDIUM_PLUS fixed, centered stack: blank lines ×4 + bell-slash icon + "No Alerts")
```
- **Above the fold**: yes, top-left column slot | **Reading order**: first zone in the F-scan — which is why its emptiness must be graceful | **Hierarchy rationale**: fixed MEDIUM_PLUS height reserves the slot so My Tasks below never jumps when alerts arrive | **Density**: 4 page / deliberately 1 inside the card | **Ratios & spacing**: `height:"MEDIUM_PLUS"` (CODE-VERIFIED fixed), content centered via `align:"CENTER"` + leading `char(10)`×4

### Styling specifics (CODE-VERIFIED)
- **Palette**: icon `color:"#d9d9d9"` EXTRA_LARGE; text "No Alerts" SECONDARY MEDIUM; card white, borderless+shadow
- **Color application points**: intentionally near-none — emptiness signaled by desaturation
- **Typography**: MEDIUM message under an EXTRA_LARGE glyph | **Imagery**: single bell-slash-o icon | **Card treatment**: same shell as populated cards — the state changes, the container doesn't
- **Signature moves**: empty state designed as icon+message at fixed height instead of collapsing; #d9d9d9 chosen lighter than SECONDARY so the glyph whispers.

### Component inventory (CODE-VERIFIED)
- a!cardLayout(height:"MEDIUM_PLUS", style:"NONE", showShadow:true) > a!richTextDisplayField(align:"CENTER") with a!richTextIcon(icon:"bell-slash-o", color:"#d9d9d9", size:"EXTRA_LARGE"). No affordances (nothing to act on).

### Character & judgment
- **Register**: calm-clinical moment inside a utilitarian-ops page.
- **Why it works**: neighboring zones keep their positions across data states (the rule the heading teaches); the icon explains the emptiness faster than a sentence; gray-on-white cannot be mistaken for an error.
- **Why not boring**: char(10) vertical centering + oversized ghost icon turns "nothing" into confirmation.
- **Boring twin**: the Alerts section simply hidden when empty — column reflows, tasks jump up, users hunt for the missing zone.
- **What to steal**: fixed min-height + icon + quiet message for every capped list's empty state.
- **Risks**: fixed heights waste space on small screens; #d9d9d9 icon is decorative-contrast only (acceptable — text carries meaning); ensure the same card gains a height cap when populated, or the fix works only in one direction.

### Code cross-check
- Alerts card ≈lines 316–345 (`char(10)` padding, #d9d9d9, height MEDIUM_PLUS). Corrections: none.

## image2.png

### Identification
- **Image**: image2.png | **Source page**: employee-home-pages | **Alt/caption**: none (heading: "Focusing attention on the main information")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (student portal)

### Use-case reconstruction (INFERRED)
- **Persona**: university student ("Baxley" university), daily quick-glance between classes; occasional-consumer polish, daily cadence
- **Domain & brand context**: higher-ed student services; deep-purple brand, friendly (illustration, support-team faces)
- **Top 3 user tasks (ranked)**: 1. Check this week's class schedule (page text: "the main information on the page… takes up the most visual space"). 2. Track degree progress / registration deadline. 3. Reach services (nav + quick access + advisors).
- **Implied requirements**: "Schedule must dominate visual space, sorted by day/time"; "Current day must be findable at a glance"; "Degree progress needs one summary number plus requirement checklist"; "Registration campaign needs a promo slot that can't be missed"; "Sensitive identifiers must be masked"
- **Data model sketch**: Student(name, ssn masked ***-**-1234, degree BS, expectedGrad Spring 2022, credits 120/92/15); ClassSection(code+title, meetingDay, timeRange, room) ~9 meetings over 5 day-groups; Requirement(label, status done|in-progress) ×4; Advisor(name, role, photo) ×3; QuickLink ×4; NavItem ×6.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-CHROME purple bar (#2a1245 est.) — SAIL header slot is empty (header:{})
COLUMNS [NARROW_PLUS : AUTO]
├─ CARD(white side-nav, padding LESS): avatar+name+masked SSN ÷ 6 nav rows(tick+icon+label)
│  ÷ "QUICK ACCESS" links ×4 ÷ spacer CARDs EXTRA_TALL ×2
└─ CARD(#f3f0f6 canvas, padding MORE)
   └─ COLUMNS [AUTO : MEDIUM_PLUS] spacing=SPARSE
      ├─ SECTION "My Class Schedule" → 5× CARD(day): rows time[2X] : course[5X] : ⚲room[2X]
      │    (Tuesday: decorativeBar START ACCENT; other days #fff)
      └─ SECTION "My Path to Graduation" → CARD(gauge 77 + degree, KPI-ROW ×3 dividers, checklist ×4)
         CARD(promo #f1e8f4, decorativeBar TOP ACCENT, illustration + CTA)
         SECTION "My Support Team" → CARD(3× avatar+role + outline button)
```
- **Above the fold**: side nav, Mon–Wed schedule cards, graduation card, promo, first support-team row
- **Reading order**: F within a hub layout — nav rail, then schedule column, then right rail
- **Hierarchy rationale**: schedule column gets AUTO (widest) width per the page's stated intent; day cards repeat a fixed 2X:5X:2X row grammar so times align page-long; graduation/promo/support stack right as "next level of priority".
- **Density**: 3 — balanced product UI; ~12 schedule rows + 3 sidebar cards visible with comfortable padding (this page is literally the university-dashboard anchor for 3).
- **Ratios & spacing**: sidebar NARROW_PLUS; right rail MEDIUM_PLUS; `spacing:"SPARSE"` between main columns; day cards padding STANDARD, marginBelow STANDARD (all CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED via page SAIL)
- **Palette**: canvas card + page `backgroundColor:"#f3f0f6"` (lavender-gray); promo card `style:"#f1e8f4"`; ACCENT = Baxley purple (renders ≈#3d1e63 est.); unselected nav text/icons #444; gauge icon #555; white cards; chrome bar ≈#2a1245 (est.)
- **Color application points**: selected nav row (tick+icon+label ACCENT); Tuesday's decorative bar; promo bar + headline + illustration; checklist checks POSITIVE green; gauge ring purple; links ACCENT
- **Typography moves**: section labels MEDIUM; day names MEDIUM (current day also STRONG); times STANDARD STRONG; credits row SMALL all-caps labels over LARGE numbers; degree MEDIUM_PLUS; masked SSN STANDARD
- **Imagery stance**: user avatar (style:"AVATAR"), 3 advisor photos, one flat illustration (reading figure) in the promo — photos for people, illustration for marketing
- **Card treatment**: sidebar + day cards borderless with shadow; promo filled #f1e8f4 with `decorativeBarPosition:"TOP"`; selected day `decorativeBarPosition:"START"`
- **Signature moves**: (1) instead of a nav component, nav rows are link-cards whose selected state is a "❘" richText glyph colored ACCENT — unselected rows render the same glyph in #ffffff so text never shifts; (2) same invisible-ink trick on day cards: every card has decorativeBarPosition START, non-current days set decorativeBarColor "#fff"; (3) empty EXTRA_TALL spacer cards extend the white sidebar to the page bottom; (4) tinted canvas card (#f3f0f6) wraps the entire main area, making the white sidebar read as a fixed rail; (5) SSN masked in data ("***-**-1234"), privacy as content design.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(header:{}, backgroundColor:"#f3f0f6", contentsPadding:"NONE"); a!cardLayout as nav rows/day cards/promo/spacers; a!sideBySideLayout rows with width tokens 2X/5X/2X; a!sectionLayout(divider:"ABOVE") per class row; a!gaugeField(percentage:77, a!gaugeIcon("graduation-cap")) + a!gaugeField SMALL in goals; a!imageField(userImage/webImage, style:"AVATAR"); a!linkField(a!safeLink) quick access; a!buttonWidget(size:"SMALL", style:"OUTLINE", color:"SECONDARY") ×3 + promo "Register Now" OUTLINE
- Charts: gauge only. Custom colors: decorative bars, promo tint
- Interactive affordances: nav link-cards, quick-access safeLinks (NEW_TAB), schedule-meeting buttons, promo CTA

### Character & judgment
- **Register**: warm-community + institutional — brand purple and faces over a calm, rule-driven grid.
- **Why it works**: fixed 2X:5X:2X row grammar aligns every time/course/room down the page; the only saturated-tint surface is the registration promo, so the seasonal call-out wins attention honestly; current-day bar + STRONG day name orient instantly.
- **Why not boring**: invisible decorative bars and white "❘" glyphs preserve pixel-perfect alignment across states; lavender canvas-in-card instead of default gray; masked SSN detail; illustration reserved for the one marketing moment.
- **Boring twin**: a tabbed page titled "Student Home" with a schedule grid component, nav as a plain link list, degree progress as a table, and the registration notice as a yellow banner across the top.
- **What to steal**: invisible-ink selected-state trick (#fff bars/glyphs); fixed side-by-side width ratios for repeating rows; single tinted promo card with decorative bar.
- **Risks**: #444-on-white nav is fine but ACCENT purple on lavender (#f3f0f6) tightens contrast for small text; spacer-card sidebar height breaks if content shrinks; masked SSN still hints at storing SSNs; 2X:5X:2X rows will crush on phone despite stacking rules.

### Code cross-check
- **Code-verified palette**: #f3f0f6, #f1e8f4, #444, #555, #fff bars, ACCENT constants
- **Notable techniques**: nav selected tick ≈lines 1157–1220; invisible decorative bars ≈1804–1810 vs 1941–1946; spacer cards EXTRA_TALL ≈1591–1604; canvas card style #f3f0f6 padding MORE ≈2914–2919; masked SSN ≈1141–1146
- **Corrections**: top purple bar is site chrome — the SAIL `header:` slot is empty, so the "header" is really column one of the body.

## worker-home-page-three-column.png

### Identification
- **Image**: worker-home-page-three-column.png | **Source page**: employee-home-pages | **Alt/caption**: "Example of an employee home page for a case management company." (heading: "High information density")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (operational workspace)

### Use-case reconstruction (INFERRED)
- **Persona**: case worker / operations specialist, daily-operator, lives in this workspace (nav: WORKSPACE · CASES · ENTITIES · SEARCH · REPORTING)
- **Domain & brand context**: case management (permits/loans/solar programs per case titles); Appian-branded demo — indigo accents, rounded geometric sans (non-default font, INFERRED custom branding)
- **Top 3 user tasks (ranked)**: 1. Work my cases and tasks (page text: "'My Tasks' is… in the center because it's high priority and the main focus"). 2. Fire quick actions (submit case, create entity…). 3. Track deadline risk (donuts, due-date calendar, red due flags).
- **Implied requirements**: "Three columns: fixed left (actions/activity), variable center (cases/tasks grid that stretches), fixed right (KPIs/dates)" (stated in page prose); "Priority and status legible per case card at a glance"; "Overdue/near-due dates flagged inline"; "Deadline health summarized numerically"
- **Data model sketch**: Case(id prefixed CTA-/SMW-/RSP-, title, status Open|In Progress, priority icon tier, assignee, dueDate) ×6 shown; Task(name, subtype Decision|Confirmation|Document Upload, status Ready, caseRef "SOP-… | title", dueDate, kebab menu) ×4+; ActivityEvent(actor, verb, artifact chip, timestamp) ×4; DeadlineMetric(cases 89%, tasks 76%); CalendarDay(dueDate marks, March 2024).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (white, indigo active underline)
COLUMNS [NARROW : AUTO : NARROW]   ← left/right fixed, center variable (page prose)
├─ SECTION "Quick Actions" → 4× CARD(icon-tile lightIndigo + indigo label link)
│  SECTION "Recent Activity" → EVENT-FEED 4× CARD(avatar, actor+verb, ts, artifact chip, ›)
├─ SECTION "My Cases" +View All → GRID(2×3 CARDs: priority icon+ID / title STRONG / status tag / assignee / due(+red !))
│  SECTION "My Tasks" → GRID(4+ rows: Task+subtype | ◎ Ready | case chip | ! due | ⋮)
└─ SECTION "Expected to Meet Deadline" → CARD(donut GAUGE ×2: 89% Cases green, 76% Tasks yellow)
   SECTION "Due Dates" → CARD(month calendar, indigo linked days + dot marks)
```
- **Above the fold**: everything shown — all three columns, 6 case cards, 4 task rows, both donuts, full calendar
- **Reading order**: F anchored center — headline zones left-to-right, then the center grids absorb the session
- **Hierarchy rationale**: center column is widest and holds cases+tasks because that is the work; left column is verbs (start things), right column is time (risk); "diverse styles… cards, grids, charts, and a calendar" (page prose) keeps three dense columns distinguishable.
- **Density**: 4 — ~9 zones, 6 case cards + 4 grid rows + calendar in one 2406×1140 viewport; compact paddings; daily-operator tool.
- **Ratios & spacing**: approx [1 : 2.4 : 0.9] measured (OBSERVED); consistent ~16px card gaps; white cards on #f7f7fa (est.) canvas.

### Styling specifics (OBSERVED — no SAIL on page for this example)
- **Palette**: canvas #f7f7fa (est.); cards #ffffff; brand indigo (links, icons, calendar dates, active nav) ≈#2322f0 (est.); icon tiles light indigo ≈#e8e9fd (est.); status tags — Open indigo on ≈#e8e9fd (est.), In Progress amber ≈#b07c0c on #fdf1d3 (est.); priority glyphs red ≈#d92b2b (est.) double-chevron/flame vs gray circle; due alerts red; donuts green ≈#4cc41c (est.) and yellow ≈#f0c231 (est.); text near-black ≈#20242c (est.)
- **Color application points**: action labels/icons, status tags, priority glyphs, due-date flags, donut rings, calendar day links+dots, active-nav underline
- **Typography moves**: rounded geometric sans throughout (INFERRED non-default); section headers ≈MEDIUM; case titles STANDARD STRONG; IDs/status/meta SMALL; donut numbers ≈MEDIUM_PLUS with SMALL "%"
- **Imagery stance**: user avatars in activity feed; styled glyph icons everywhere else; no photos/illustrations
- **Card treatment**: hairline-border flat cards (borders ≈#e5e6ee est., minimal/no shadow) — denser look than the shadow style of image8
- **Signature moves**: (1) instead of a button stack, Quick Actions are icon-tile cards (tinted square + label) that read as a launcher; (2) case severity as a two-glyph system — colored priority icon BEFORE the ID plus a status tag under the title; (3) case reference in tasks compressed to a gray chip "SOP-3B824B7 | Green Energy…" keeping the grid to 4 columns; (4) calendar-as-KPI: due-date dots turn a date picker into a workload heatmap; (5) paired donuts (green/yellow) give deadline health a traffic-light read without red panic.

### Component inventory (OBSERVED → SAIL guesses; no code on page)
- a!cardLayout tiles + a!richTextIcon/tags (a!tagField for Open/In Progress); a!gridField for My Tasks (kebab = a!recordActionField or menu); case cards likely a!cardLayout grid in a!columnsLayout; donuts = styled gauge/pie (custom colorScheme yes); calendar = custom component or CALENDAR pattern; View All a!linkField
- Interactive affordances: 4 action links, View All, row kebab menus, calendar day links, activity chevrons

### Character & judgment
- **Register**: utilitarian-ops + energetic-consumer — dense operator content wearing bright indigo, rounded type, and playful glyphs.
- **Why it works**: fixed-outer/variable-center columns let the tasks grid own spare width (the page's stated engineering rationale); every zone uses a different visual grammar (tiles, feed, cards, grid, donuts, calendar) so density stays navigable; red is rationed to priority/overdue only.
- **Why not boring**: icon-tile launcher instead of buttons; case-chip compression in the grid; calendar dots as workload signal; amber/indigo tag palette instead of default gray.
- **Boring twin**: one full-width paged grid of 40 tasks under a row of four solid buttons, KPIs as plain numbers in a header bar, no calendar, uniform blue tags.
- **What to steal**: fixed:variable:fixed column plan with the stretchy grid centered; zone-per-grammar variety to absorb density; two-glyph priority+status system.
- **Risks**: amber-on-cream tag text ≈3.5:1 (est.) borderline; donut color meaning (green vs yellow) uncoded elsewhere — needs labels for color-blind users (numbers help); three columns on tablet will stack long; hairline borders may vanish on low-contrast displays.

### Code cross-check
- none — no SAIL for this example on the page.

## employee-home-page-low-density.png

### Identification
- **Image**: employee-home-page-low-density.png | **Source page**: employee-home-pages | **Alt/caption**: "Example of an employee home page for a brokerage firm." (heading: "Low information density")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (portal for external-ish operator)

### Use-case reconstruction (INFERRED)
- **Persona**: insurance broker ("Welcome, Broker John", Broker Portal), weekly-to-daily light usage; submits and tracks policy submissions
- **Domain & brand context**: commercial insurance brokerage on an Appian-branded portal; indigo hero, concierge tone
- **Top 3 user tasks (ranked)**: 1. Start something (Create Submission / Check Status / Contact Insurer — page text: "relevant high-priority actions are called out at the top"). 2. Resume recently modified submissions. 3. Glance at productivity vs targets and pending tasks/messages.
- **Implied requirements**: "Top of page = three primary actions, nothing else"; "Recent items show status at a glance"; "Personal metrics visible but subordinate"; "Overall load kept light and digestible" (page: "less information dense and easier to digest")
- **Data model sketch**: Submission(id SUB123456, lineOfBusiness: Commercial Package|Auto|Liability|Property, insuredName, status: Quoted|Referred|In Review|Hold, lastModified) ×6; ProductivityMetric(label, actual/target — $20,000/$35,000, $8000/$9500, 24 policies, deltaMoM +5%, progress 75%) ×3; Tabs(Tasks 3, Messages 3).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV white (logo, HOME, MY SUBMISSIONS, Broker Portal ▾, TB)
HEADER-CONTENT
├─ BILLBOARD h≈370 solid #2d24b8 (est.) overlay=center
│  content = "Welcome, Broker John" + "What would you like to do today?" + 3× white action CARDs (icon-circle + indigo label)
└─ COLUMNS [≈3:1]
   ├─ SECTION "Recently Modified" +View All → GRID(2×3 CARDs: id•type SMALL / name MEDIUM STRONG / status tag / modified date)
   │  SECTION "Requires Attention" → TABS ×2 (Tasks·3, Messages·3 count chips, indigo active underline)
   └─ SECTION "My Productivity" → CARD(3× label+▲5% MoM / value LARGE STRONG / indigo bar + 75% target caret)
```
- **Above the fold**: hero with all three actions + first row of recent cards + top productivity KPI
- **Reading order**: single-column funnel into the hero question, then Z across content
- **Hierarchy rationale**: actions outrank data — the billboard holds only a greeting, a question, and three verbs; "other timely items and key metrics are below… next level of priority" (page prose); productivity rail narrow because it informs, not acts.
- **Density**: 2 — editorial; one hero idea + two content zones + a rail; six cards total; large type, wide margins.
- **Ratios & spacing**: content ≈[3:1]; card grid 3-across with ~24px gutters; hero ≈30% of viewport height (OBSERVED).

### Styling specifics (OBSERVED — no SAIL on page for this example)
- **Palette**: hero indigo ≈#2d24b8 (est.); page below #f7f7f8 (est.); cards #ffffff; action labels + tabs + bars indigo ≈#3626d9 (est.); status tags as tinted text-pills — Quoted ≈#a12dbc on #f7e8fb, Referred ≈#d32f2f on #fde7e7, In Review ≈#3949ab on #e8ebfa, Hold ≈#9c6f00 on #fdf3cf (all est.); MoM deltas green ≈#1d9b3e (est.); text ≈#20242c (est.)
- **Color application points**: hero field, action icons/labels, status pills, tab underline + count chips, productivity bars/markers, green deltas
- **Typography moves**: hero question ≈EXTRA_LARGE white over SMALL greeting; section headers ≈MEDIUM STRONG; card names MEDIUM STRONG; ids/meta SMALL SECONDARY-gray; KPI values LARGE STRONG ("$20,000/$35,000" as actual/target composite)
- **Imagery stance**: none — flat color field + icon circles carry the brand (no photo billboard)
- **Card treatment**: flat white, hairline border ≈#e8e8ee (est.); hero action cards are white cards ON the indigo field — inverted emphasis
- **Signature moves**: (1) instead of a KPI header, a question-as-header ("What would you like to do today?") with exactly three verbs — concierge pattern; (2) actions rendered as white cards floating on saturated indigo, the strongest contrast on the page; (3) status pills are tinted-text chips (colored text on pale matching fill), quieter than solid tags; (4) targets shown as composite "actual/target" strings PLUS a caret-marked 75% point on each progress bar; (5) MoM deltas standardized as small green "▲ 5% MoM" beside labels.
### Component inventory (OBSERVED → SAIL guesses; no code on page)
- a!billboardLayout(backgroundColor solid, overlay center) with a!cardLayout action row (cards-as-links); a!cardGroupLayout/columns of submission cards; a!tagField-style pills (likely styled richText or tags); tabs = TABS pattern with count chips; progress bars a!progressBarField(color accent) + custom marker (or stamp/richText caret); a!linkField "View All"
- Charts: none — bars only
- Interactive affordances: 3 hero actions, View All, tabbed Tasks/Messages, card links

### Character & judgment
- **Register**: energetic-consumer + utilitarian-ops — consumer-app warmth wrapping a work queue.
- **Why it works**: the page's one decision ("what do I do?") is answered before any data appears; six recent cards with pills give resume-context in a two-second scan; the rail's three bars quantify performance without demanding action.
- **Why not boring**: question-headline hero instead of a title; white-on-indigo action cards; per-status pill hues; target carets on bars.
- **Boring twin**: a "Broker Home" title bar, a 20-row submissions grid with a Status text column, buttons for the three actions above it, and productivity as three plain numbers.
- **What to steal**: three-verbs-only hero for infrequent operators; tinted-text status pills; actual/target composite value + marker on the bar.
- **Risks**: Hold's amber-on-cream ≈3.4:1 (est.) and pill hues carry meaning without a legend; hero consumes ~30% of viewport every visit (cost rises with daily use); "SUB123456" repeated across all demo cards would mask real scan patterns; 3-across cards will stack tall on mobile.

### Code cross-check
- none — no SAIL for this example on the page.
