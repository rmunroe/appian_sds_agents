# Analysis: ux-avoiding-clutter

## nested_comments_dont.png + nested__comments_do.png

### Principle: Let avatars and whitespace group repeating entries — not borders
- **DON'T shows**: three container levels — an outer "Comments" card (border #d9d9d9 est.), one bordered card per comment (avatar + bold name + right-aligned gray date), and a filled #efefef (est.) box around each message. Parallel borders sit ~16px apart; content is inset twice for zero information gain.
- **DO shows**: bare gray "Comments" heading (≈MEDIUM, #6e6e6e est.); each entry anchored by circular avatar + bold name with the date stacked beneath in SMALL gray; message as plain body text. Whitespace alone separates entries — same data, ~40% less chrome.
- **Rule**: when a repeating entry has a strong visual anchor (avatar, bold name), containers are redundant; never exceed one border level.
- **Severity**: usually
- **Category**: layout | density
- **SAIL implication**: replace nested a!cardLayout/a!boxLayout with stacked a!sideBySideLayout (a!imageField STANDARD avatar + rich text), marginBelow:"STANDARD"; no showBorder wrappers.

## nested_navigation_dont.png + nested_navigation_do.png

### Principle: Never wrap selectable cards in a wrapper card
- **DON'T shows**: six nav choices as bordered white cards (centered gray icon over blue #3c73a8 est. label) stacked inside a pale-blue #e9eef8 (est.) wrapper card; selected "Workspace" is a solid #44719f (est.) card. Wrapper border + item borders + selection fill = three competing rectangle signals; OBSERVED ~2× the vertical footprint of the DO.
- **DO shows**: flat left-nav list — small icon + blue label rows, no containers; selection is the page's only filled rectangle: a full-width #44719f (est.) bar with white icon+text. Selected state reads instantly; list height halves.
- **Rule**: in card-based navigation, selection highlight must be the only container-level emphasis; unnest everything else.
- **Severity**: always
- **Category**: layout | density
- **SAIL implication**: per-item a!cardLayout(showBorder:false, showShadow:false, link:…) with style/accent fill only when selected; no enclosing card/box around the list.

## billboard_image_clutter_dont.png + no_billboard_do.png

### Principle: Give the top of the page to data, not decorative photography
- **DON'T shows**: a h≈190px billboard of a busy stock photo (pen, keyboard, financial spreadsheet) with a dark ~60%-opacity bar overlay at right holding "SUMMARY / Annual Revenue $105M / Annual Budget $1.4M" in white. OBSERVED: spreadsheet digits showing through the scrim collide with the real figures — an entire strip of prime real estate carries two data points, illegibly.
- **DO shows**: (full analysis below) a record header that is entirely data — "FR" monogram avatar, title, status with orange warning icon, day counters, coordinator photo. Zero decorative pixels, more information, less height.
- **Rule**: use billboards only when the image itself informs; text over photos needs a quiet region or solid scrim.
- **Severity**: contextual
- **Category**: layout | color
- **SAIL implication**: delete a!billboardLayout; header = a!sideBySideLayout of a!imageField(avatar) + rich-text KPIs.

## no_billboard_do.png

Tier override: batch suggests C (DO), but this is a complete full-page UI screenshot (site nav, record header, two content columns of live data) → analyzed at tier A per protocol rule 4. Pair teaching captured above.

### Identification
- **Image**: no_billboard_do.png | **Source page**: ux-avoiding-clutter | **Alt/caption**: "alttext" [DO] — "subtle visual elements like icons, user avatar images, and rich text add visual appeal without wasting space"
- **Device frame**: desktop (1678x874)
- **Marker**: do
- **UI type**: record-view (customer-onboarding status page)

### Use-case reconstruction (INFERRED)
- **Persona**: onboarding coordinator (Becky Reid) — daily operator chasing tasks; secondarily her manager checking schedule health weekly.
- **Domain & brand context**: B2B financial-services client onboarding ("New Customer Onboarding" site, KYC Lead role, D-U-N-S/EIN fields); restrained enterprise brand, muted slate chrome.
- **Top 3 user tasks (ranked)**: 1. Is this onboarding on schedule? (status + day counters). 2. Which tasks are overdue and who owns them? (alerts, red rows). 3. What's next per phase, and what are the customer's reference facts?
- **Implied requirements**: "Schedule health visible without scrolling"; "Overdue tasks must name owner and age"; "Four-phase progression always summarized"; "Customer identifiers (EIN, DUNS, website) one glance away"; "Every person is a clickable follow-up path".
- **Data model sketch** (read off labels): Onboarding(status "Behind Schedule", daysElapsed 19, daysToGoLive 34, coordinator) 1—* Phase(Pre-Onboarding | Due Diligence | Account Creation | Closing; status) 1—* Task(name, dueOffset "-4d"…"10d", state pending/complete/overdue, assignee, actionDate); Customer(name, legalEntityName, EIN 869-69-3558, DUNS 012345678, HQ Pittsburgh PA, website); TeamMember(name, role) ×3. Alerts = Task where overdue.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ TOPBAR site nav ×4 (REQUESTS selected) + site name + avatar, bg #45697e (est.)
├─ SECTION "record header": ←back-link; FR monogram + title | KPI-ROW ×4 (Status, Days Elapsed, Days to Go-Live, Coordinator)
└─ COLUMNS [1:1]
   ├─ PANE[left]: phase bars ×4 — PRE-ONBOARDING ✓, DUE DILIGENCE ✓ (collapsed), ACCOUNT CREATION ▶ expanded (5 task rows), CLOSING (4 rows)
   └─ PANE[right]: SECTION "Alerts" → CARD(overdue, red-tint) ×2 · SECTION "Customer Summary" → 2-col field grid · SECTION "Onboarding Team" → avatar trio
```
- **Above the fold**: everything — the entire record fits one viewport.
- **Reading order**: F — header KPIs across, then down the phase list, right rail scanned on demand.
- **Hierarchy rationale**: "Behind Schedule" + day counters are the largest text after the title because task 1 is a yes/no health check; alerts duplicate overdue tasks top-right in tinted cards so task 2 needs no scanning; phases own the left column as the working surface.
- **Density**: 4 — ~13 task rows, 4 phase bars, 2 alert cards, 10 field/value pairs, and a team roster in one viewport with compact (~40px) rows.
- **Ratios & spacing**: columns ≈[1:1]; section header bands full-width; row padding tight (≈LESS); section gaps ≈STANDARD.

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; header bar #45697e (est.), selected tab #2e4d5c (est.); section/phase bands #efefef (est.); alert card bg #fdecea (est.) with border #f2c8c8 (est.); semantic red #d8343f (est.), green #4caf50 (est.), warning orange #f7981d (est.); link blue #2b6cab (est.); text #222222, secondary #6e6e6e (est.); monogram navy #17335c (est.).
- **Color application points**: header bar is the only large color block; everything else is semantic — green checks on completed phases/tasks, red for OVERDUE text + triangle icons + alert tint, orange status icon, blue on every link (tasks, people, back-link). No decorative color anywhere.
- **Typography moves**: title ≈EXTRA_LARGE; "Behind Schedule" and day numbers ≈LARGE; phase labels SMALL all-caps; task names STANDARD semibold links; "Pending" italic gray + silhouette avatar; labels bold over regular values in Customer Summary.
- **Imagery stance**: circular user photos (~36px) and one monogram logo avatar; small functional icons (calendar, clock, check, warning). No photos, no billboard — the page's entire argument.
- **Card treatment**: flat sections with filled gray band headers; alert cards filled light red with hairline border; no shadows, square corners.
- **Signature moves**: instead of a hero image, an "FR" monogram avatar + data-dense KPI strip names the record; instead of a status column buried in a grid, the countdown pair "Days Elapsed 19 / Days to Go-Live 34" renders as icon + LARGE number rich text; instead of one long task table, completed phases collapse to a one-line receipt ("Completed On Time" + green check); overdue tasks are duplicated into tinted right-rail alert cards for zero-scan triage.

### Component inventory (OBSERVED)
Site header (a!sitePage nav); a!richTextDisplayField header KPIs (a!richTextIcon + LARGE numbers); a!columnsLayout [1:1]; phase bars as a!cardLayout(style gray)/a!sectionLayout with collapse chevrons; task rows = a!sideBySideLayout (state icon + a!dynamicLink task + due rich text + assignee link + a!imageField avatar); alert cards a!cardLayout(tinted, hairline border); Customer Summary as 2-column label/value rich text; team roster a!sideBySideLayout ×3. Charts: none. Affordances: back-link, expand/collapse phases, task/person record links.

### Character & judgment
- **Register**: utilitarian-ops + urgent-triage — muted chrome with red spent exclusively on schedule risk.
- **Why it works**: visual interest comes only from information-bearing elements (avatars, semantic icons, monogram) so nothing competes with triage; red appears in exactly two rows + two cards, all genuinely overdue; phase accordion compresses two finished stages into two lines.
- **Why not boring**: monogram avatar gives brand presence without a billboard; four heterogeneous header KPIs (icon+status, 2 counters, person) share one strip; "Pending" encoded three ways (italic gray, clock icon, silhouette avatar) without color dependence; alert cards tinted rather than listed.
- **Boring twin**: a stock-photo billboard reading "Fall Rock Capital", one 15-row task grid with a Status column, customer facts on a second tab, no alerts rail — schedule health computed in the user's head.
- **What to steal**: monogram avatar + KPI strip as record header; collapse completed phases to one-line receipts; duplicate exceptions into a tinted alert rail.
- **Risks**: red/green state pair is icon-backed (safe), but gray #efefef bands on white are low-contrast section boundaries; small gray meta text (~SMALL #6e6e6e) borderline AA; two dense columns will stack very long on mobile.

### Code cross-check
none — no SAIL source on page.

## grid_clutter_dont.png + record_tabs_do.png

### Principle: Move secondary record data one click away
- **DON'T shows**: a 9-column case grid (Case Name link, Status, Priority/Impact arrow icons, Assignee, Created Date, Created By, Last Update, Last Updated By), zebra rows #f7f7f7 (est.), "1 – 10 of 30" pager. Three audit-metadata columns crowd the four triage columns; every row answers questions nobody asked yet.
- **DO shows**: (full analysis below) a customer record whose Summary tab keeps only KPIs, flags, activity, and actions — Contacts, Interactions, Cases, Opportunities each live behind one of 8 record tabs.
- **Rule**: list views carry identify-and-triage fields only; provenance and detail belong on the record view reached through navigation.
- **Severity**: usually
- **Category**: data-display | density
- **SAIL implication**: trim a!gridField columns to decision data; make the name a record link; record-type views supply the tab bar.

## record_tabs_do.png

Tier override: batch suggests C (DO), but this is a complete full-page UI screenshot (site chrome, record tabs, KPI strip, three content columns) → analyzed at tier A per protocol rule 4. Pair teaching captured above.

### Identification
- **Image**: record_tabs_do.png | **Source page**: ux-avoiding-clutter | **Alt/caption**: "alttext" [DO] — "tabular navigation for record views lets users find contacts, interactions, and cases when they need it"
- **Device frame**: desktop (1520x812)
- **Marker**: do
- **UI type**: record-view (customer-360 summary)

### Use-case reconstruction (INFERRED)
- **Persona**: relationship manager / coverage-team member — daily-operator cadence on a book of accounts.
- **Domain & brand context**: B2B account management ("Customer Transaction Lifecycle" site); sober enterprise styling, single blue accent.
- **Top 3 user tasks (ranked)**: 1. Gauge account health at a glance (coverage, stage, revenue, open opps, staleness). 2. Spot follow-ups and risks (flags, "45 Days Ago" in red). 3. Act — create case/opportunity, schedule meeting — or drill into a detail tab.
- **Implied requirements**: "Summary must fit one screen with no grids"; "Contacts/cases/interactions one click away, never inline"; "Stale-contact alarm must be pre-computed and prominent"; "Record actions always visible, not behind a menu"; "Activity feed names actors as links".
- **Data model sketch** (read off labels): Customer(name, coverageLevel Premium, stage Growth, relationshipMgr, lifetimeRevenue $4.6M Δ+$0.4M, valueOpenOpps $330K Δ12%, lastInteraction 45d) 1—* Flag(text, severity, date) ×5, 1—* Activity(actor, verb, object link, timestamp) ×4, 1—* Contact/Case/Opportunity/Interaction/News (behind tabs); 6 record actions.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ TOPBAR site nav ×2 (CUSTOMERS selected) + site name + avatar, bg #33617a (est.)
├─ SECTION title "Fall Rock Capital" (EXTRA_LARGE)
├─ TABS ×8 record views (Summary = solid chip; About…Related Actions = plain links) + hairline rule
├─ KPI-ROW ×6 bordered stat cards
└─ COLUMNS [2:3.5:1] (est.)
   ├─ SECTION "FLAGS": flag-icon feed ×5
   ├─ SECTION "RECENT ACTIVITY": avatar feed ×4
   └─ SECTION "ACTIONS": outlined button stack ×6
```
- **Above the fold**: everything; lower third of the viewport is deliberately empty.
- **Reading order**: F — title, tabs, KPI strip across, then three columns.
- **Hierarchy rationale**: KPI strip sits directly under the tabs because health-check is task 1; the only red text on the page ("45 Days Ago") marks task 2's entry point; actions get a permanent right rail because task 3 must never require hunting.
- **Density**: 3 — six KPI cards + three moderate columns (5 flags, 4 feed items, 6 buttons) with generous whitespace below; balanced product UI.
- **Ratios & spacing**: KPI cards equal sixths; columns ≈[2:3.5:1]; card padding ≈LESS; column labels SMALL all-caps gray.

### Styling specifics (OBSERVED)
- **Palette**: content sheet #ffffff on page bg #f0f0f0 (est.); header #33617a (est.), selected site tab #123f5a (est.); selected record tab fill #1e73b8 (est.) with white text; link blue #2b6cab (est.); positive green #3f9c46 (est.); alarm red #d0393e (est.); borders #d9d9d9 (est.); label gray #6e6e6e (est.); text #222222.
- **Color application points**: the solid selected-tab chip is the only saturated fill in the content area; green confined to the two KPI deltas (▲ +$0.4M, ▲ 12%); red confined to one KPI value and the top two flag icons; action buttons deliberately neutral (white, gray border, dark all-caps label).
- **Typography moves**: title EXTRA_LARGE semibold; KPI pattern = STANDARD gray label over MEDIUM bold value; column headers SMALL all-caps; feed actor names bold blue links; buttons SMALL all-caps.
- **Imagery stance**: circular avatars only (relationship-mgr KPI, four feed actors, site avatar) + small inline icons (medal, trend, calendar, flags); no photos or billboard.
- **Card treatment**: KPI cards hairline #d9d9d9 border, flat, square, no shadow; buttons OUTLINE style; content sheet edged by the gray page bg.
- **Signature moves**: instead of uniform number tiles, the KPI strip mixes media — text+icon (Premium ♛), person+avatar (Cindy McDougal), number+delta — inside one shared card silhouette; instead of a status field, a date KPI is weaponized as an alarm by rendering "45 Days Ago" in red; instead of an actions dropdown, six verb-first outlined buttons stack in an always-visible rail; instead of tab chrome, siblings are plain links and only the active view gets a solid chip.

### Component inventory (OBSERVED)
Record-type views as the tab bar (Summary/About/Contacts/…/Related Actions); KPI cards = a!cardLayout(showBorder:true) + a!sideBySideLayout with rich text (positive/negative styles for deltas — green ▲, red date); flags/activity feeds = a!sideBySideLayout rows (a!richTextIcon "flag" / a!imageField avatars + link text + gray timestamps); actions = record-action buttons rendered OUTLINE/SECONDARY. Charts: none. Affordances: 8 tabs, 6 action buttons, entity links throughout feeds, site nav.

### Character & judgment
- **Register**: utilitarian-ops with an authoritative-executive KPI strip — quiet chrome, decisive numbers.
- **Why it works**: 7 data domains sit off-screen behind tabs, so the summary answers "how is this account?" without one grid; the single red value creates an unmissable next action; heterogeneous KPI cards keep six different data types scannable in one silhouette.
- **Why not boring**: an avatar inside a stat card; solid-chip active tab against link-only siblings; severity-colored flag icons; the empty lower third — restraint as a feature.
- **Boring twin**: one scrolling page stacking a contacts grid, cases grid, and interactions grid under a "Customer Details" billboard, KPIs as a label/value list, actions hidden in a "…" menu.
- **What to steal**: mixed-media KPI cards sharing one border treatment; red reserved for a single staleness alarm; record actions as visible outlined buttons.
- **Risks**: 8 tabs approach wrapping on tablet widths; SMALL all-caps gray labels borderline AA; red date needs a non-color cue for color-blind users (calendar icon is present but not distinctive from the neutral KPIs).

### Code cross-check
none — no SAIL source on page.

## more_link_do.png

### Principle: Hide rare filters behind a disclosure link (DON'T sibling: grid_clutter_dont.png)
- **DO shows**: a filter bar of only the four daily filters — "Search cases" box + Status/Priority/Impact dropdowns (bold labels above, italic gray placeholders "All statuses…") — with a blue #2b6cb5 (est.) "More filters" dynamic link + chevron icon at the right edge. Grid beneath is the de-cluttered 6-column version of the DON'T's 9-column grid.
- **DON'T shows**: (grid_clutter_dont.png, same heading) the surface-everything alternative.
- **Rule**: default-visible controls = the few used constantly; the long tail appears on demand — progressive disclosure.
- **Severity**: usually
- **Category**: forms | density
- **SAIL implication**: a!richTextDisplayField with a!dynamicLink toggling local!showMoreFilters; extra filter row under showWhen; common filters remain a!dropdownField/a!textField.
