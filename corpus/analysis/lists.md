# Analysis: lists

Page is a pattern gallery ("Choose the right style of list to show different types of data") — 13 images, every image has SAIL source on the page except image68.png. Tier assignments follow the batch table except image68 (overridden A→B; rationale in its section).

## image32.png

### Identification
- **Image**: image32.png | **Source page**: lists | **Alt/caption**: none (heading: "Photo gallery card record list")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (photo-card record list inside a site)

### Use-case reconstruction (INFERRED)
- **Persona**: residential listing agent at a boutique brokerage; daily-operator checking her book of business
- **Domain & brand context**: high-end real estate ("Thatcher." serif wordmark, $1.7M–$2.2M Palm Springs listings); premium consumer brand wrapped around an internal ops tool
- **Top 3 user tasks (ranked)**: 1. Scan my active listings and their market status. 2. Spot listings needing intervention (no offers, aging). 3. Create a new listing.
- **Implied requirements**: "Every listing must be recognizable by photo without opening it"; "Status must be readable at grid-scan distance"; "Days-on-market must sit next to price"; "New Listing must be one click from anywhere in the section"; "Related pools (New/Search/Sold) reachable from persistent sub-nav"
- **Data model sketch**: Listing(photo, statusTag, price, daysListed, beds, baths, sqft, address); agent 1:N listings; status enum of 4 visible values. OBSERVED fields: $1,695,000 · 2d · 3 Beds · 2.5 Baths · 2,403 Sq. Ft. · address line.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (dark, wordmark + avatar) + ICON-RAIL[left] (dark, active tile red)
HEADER-CONTENT
└─ COLUMNS [NARROW:AUTO]
   ├─ SECTION "Properties" + BUTTON(New Listing, SOLID red) + link-list ×4 (active red)
   └─ GRID(3-col, 2 rows) CARD(BILLBOARD h=SHORT_PLUS + tag overlay, price+days, beds/baths/sqft, address)
```
- **Above the fold**: all five listing cards, full sub-nav, New Listing button
- **Reading order**: F (sub-nav column, then row-wise card scan)
- **Hierarchy rationale**: photos biggest — recognition beats reading for task 1; status tags sit ON the photos so task 2 rides the same scan; the only solid-fill control is New Listing (task 3)
- **Density**: 2 — five cards per viewport, large imagery, generous card padding; this is the editorial anchor case
- **Ratios & spacing**: nav column NARROW vs AUTO content (CODE-VERIFIED width: "NARROW"); card padding NONE with photo flush to edges, inner text block padding STANDARD; marginBelow STANDARD between card rows

### Styling specifics (CODE-VERIFIED where noted)
- **Palette**: site bar + icon rail #232020 (CODE-VERIFIED style: "#232020"), brand red #990000 (CODE-VERIFIED, New Listing button/active accents), content bg #f0f0f0 (CODE-VERIFIED), card bg #ffffff, billboard fallback #f0f0f0 (CODE-VERIFIED); tag semantics: #ff9900 NEW LISTING, #38761d OPEN HOUSE SCHEDULED, #3c78d8 PRICE REDUCED, #cc0000 NO OFFERS RECEIVED (all CODE-VERIFIED); meta text #666666 (CODE-VERIFIED)
- **Color application points**: chrome bars, active nav tile + nav links, primary button, photo-overlay tags, days-on-market icon+text; nothing else colored — photos supply the rest
- **Typography moves**: prices ≈ MEDIUM_PLUS (CODE-VERIFIED size: "MEDIUM_PLUS"), section label MEDIUM (CODE-VERIFIED labelSize), listing meta STANDARD, address SMALL secondary; tags all-caps white
- **Imagery stance**: large photography (billboards), no icons inside cards except calendar glyph
- **Card treatment**: white, subtle border, shape: "SEMI_ROUNDED" (CODE-VERIFIED ×5), cards-as-links (a!cardLayout(link: a!dynamicLink))
- **Signature moves**: (1) instead of a status column, status rides the photo via a!fullOverlay(alignVertical:"TOP") + a!tagField(backgroundColor per status); (2) instead of one accent, a 4-hue tag language maps urgency (amber=new, green=event, blue=price action, red=stalled); (3) instead of padded image fields, padding:"NONE" cards with a!billboardLayout(height:"SHORT_PLUS") bleeding to card edges; (4) days-on-market pinned right of price via sideBySideLayout — the agent's aging metric always in the price's field of view.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"TRANSPARENT"), a!cardLayout(shape:"SEMI_ROUNDED", padding:"NONE", link:a!dynamicLink), a!billboardLayout(height:"SHORT_PLUS", backgroundColor:"#f0f0f0", overlay:a!fullOverlay), a!tagField/a!tagItem(backgroundColor:#hex), a!buttonWidget(style:"SOLID"), rich-text sideBySide meta rows, icon rail cards with tooltip:"My Dashboard"
- Charts: none
- Interactive: cards-as-links, sub-nav dynamic links, New Listing action

### Character & judgment
- **Register**: premium-editorial + utilitarian-ops — luxury photography and serif brand over a plain worklist mechanic
- **Why it works**: photo-first cards make 5 seven-figure assets identifiable in one sweep; tag hue does triage before text is read; near-black chrome (#232020) makes the brand red and warm photos pop
- **Why not boring**: tags overlaid on photos instead of a status column; semantic 4-color tag scale rather than a single accent; SEMI_ROUNDED flush-bleed photo cards; deep red #990000 as brand accent (not the default blue)
- **Boring twin**: a gridField with Address/Price/Status/Days columns, a toolbar "New" button, and thumbnails deferred to record views; single blue accent; status as plain text.
- **What to steal**: overlay tags on billboard cards for photo-identified records; keep the aging metric adjacent to the value metric; reserve solid fill for the single creation action.
- **Risks**: white-on-#ff9900 tag contrast ≈3:1 (borderline); brand red vs alarm red (#990000 vs #cc0000) can blur semantics; 3-col photo grid needs stackWhen behavior on phone (not shown).

### Code cross-check
- **Code-verified palette**: #232020, #990000, #f0f0f0, #ffffff, tags #ff9900/#38761d/#3c78d8/#cc0000, text #666666
- **Notable techniques**: fullOverlay(style:"NONE") to float tags without scrim (~ln 520–540 of block); card-as-link wrapping billboard + text; tooltip on icon-rail cards; sectionLayout(labelSize:"MEDIUM") for the nav header
- **Corrections**: none — pixels matched code.

## image96.png

### Identification
- **Image**: image96.png | **Source page**: lists | **Alt/caption**: none (heading: "Full page empty state message")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (empty state of the image32 photo-gallery list)

### Use-case reconstruction (INFERRED)
- **Persona**: same listing agent as image32, first-run or between listings
- **Domain & brand context**: same "Thatcher." brokerage app
- **Top 3 user tasks (ranked)**: 1. Understand why the list is blank. 2. Get nudged to the next action (add a listing). 3. Navigate to other listing pools that do have content.
- **Implied requirements**: "Empty list must announce itself, not look broken"; "Message must suggest the next step"; "Persistent nav and New Listing action must remain available"; page prose: more appealing than a blank page and an opportunity to suggest next steps
- **Data model sketch**: Listing set, cardinality zero — the whole point

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR + ICON-RAIL (identical chrome to image32)
HEADER-CONTENT
└─ COLUMNS [NARROW:AUTO]
   ├─ SECTION "Properties" + BUTTON(New Listing) + link-list ×4
   └─ CARD(#f0f0f0, h=EXTRA_TALL) → centered: illustration + headline + subtext
```
- **Above the fold**: everything; one message in a gray field
- **Reading order**: single-column (icon → headline → subtext)
- **Hierarchy rationale**: icon largest to signal state category (empty box); headline names the state; subtext converts it to encouragement
- **Density**: 1 — one idea on the whole canvas
- **Ratios & spacing**: message vertically centered in upper third of an EXTRA_TALL card (CODE-VERIFIED height: "EXTRA_TALL"); nav column unchanged from image32

### Styling specifics (CODE-VERIFIED where noted)
- **Palette**: chrome #232020, brand red #990000 (both CODE-VERIFIED); empty-state field #f0f0f0 (CODE-VERIFIED style: "#f0f0f0"); illustration coral red ≈#f26d6d (est., from cons!EMPTY_BOX asset); headline near-black; subtext #6a6a6a (CODE-VERIFIED)
- **Color application points**: only the illustration carries color inside the content area — and it echoes the brand red family
- **Typography moves**: headline "You don't have any active listings" MEDIUM_PLUS (CODE-VERIFIED), subtext "Now's a good time to add one!" STANDARD #6a6a6a; no all-caps
- **Imagery stance**: single flat illustration via a!documentImage(document: cons!EMPTY_BOX), a!imageField(size:"MEDIUM", style:"STANDARD")
- **Card treatment**: flat filled #f0f0f0 field, no border
- **Signature moves**: (1) instead of an empty grid, a designed announcement (illustration + 2 lines); (2) instead of embedding a duplicate CTA, the copy points at the ever-present red New Listing button; (3) illustration hue matched to brand accent so even the empty state is on-brand.

### Component inventory (CODE-VERIFIED)
- a!imageField + a!documentImage(cons!EMPTY_BOX), rich text headline/subtext, container a!cardLayout(height:"EXTRA_TALL", style:"#f0f0f0"), unchanged nav components from image32; headerContentLayout backgroundColor:"TRANSPARENT"
- Charts: none | Interactive: nav links + New Listing button only

### Character & judgment
- **Register**: warm-community + calm-clinical — friendly copy ("Now's a good time to add one!") in an otherwise quiet neutral field
- **Why it works**: state is unmistakable in under a second (box glyph + one sentence); tone converts absence into prompt; chrome persistence means the fix (New Listing) is already on screen
- **Why not boring**: constant-based illustration (cons!EMPTY_BOX) rather than a generic icon font glyph; two-tier type (MEDIUM_PLUS + gray STANDARD) instead of one lonely line; brand-tinted artwork
- **Boring twin**: white page with "No items found." in default gray STANDARD text, or an empty gridField header row with zero rows.
- **What to steal**: headline-names-the-state + subtext-names-the-action formula; store empty-state art as design constants for reuse.
- **Risks**: CTA is referenced but not adjacent (mild); subtext #6a6a6a on #f0f0f0 ≈4.6:1 — passes AA at STANDARD size but no margin.

### Code cross-check
- **Code-verified palette**: #232020, #990000, #f0f0f0, #6a6a6a
- **Notable techniques**: cons! constant for the illustration document; EXTRA_TALL card to force a full-viewport field; align:"CENTER" rich text stack
- **Corrections**: illustration hex not in code (asset-borne) — kept as est.

## image67.png

### Identification
- **Image**: image67.png | **Source page**: lists | **Alt/caption**: none (heading: "Message inbox")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (list-detail / master-detail inbox)

### Use-case reconstruction (INFERRED)
- **Persona**: grants/case coordinator at a nonprofit ("Boreas Foundation"); daily-operator triaging correspondence tied to cases
- **Domain & brand context**: foundation case management; sober slate-and-white utility styling
- **Top 3 user tasks (ranked)**: 1. Work unread messages top-down. 2. Read a message + its attachment without leaving the list. 3. Jump to case queues (My/Overdue/All Cases).
- **Implied requirements**: "Unread state visible per row and as a count"; "Selection must not navigate away from the list"; "Sender, audience, subject, and recency per row"; "Attachments downloadable from the reading pane"; "Adaptable to other list-detail contents" (page prose)
- **Data model sketch**: Message(from, to[], subject, time, isRead, body, attachments[name, size, type]); sender 1:N messages; attachment type drives icon ("pdf" → file-pdf-o)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (Boreas Foundation; tabs HOME/MY TASKS/CASES)
PANE-LAYOUT
├─ PANE[left w=NARROW bg=#3B464E] "Messages (2)" active + 5 nav links
├─ PANE[center w=MEDIUM bg=#f0f0f0] message list ×13 rows (selected = white card)
└─ PANE[right AUTO] reading pane: stamp+sender+audience, subject, body, divider, attachment card
```
- **Above the fold**: full triptych; ~13 list rows; entire message + attachment
- **Reading order**: F — nav rail, then list scan, then detail
- **Hierarchy rationale**: list pane gets the middle (task 1 is the loop); reading pane widest because task 2 is the payoff; nav is icon-less text rail, smallest, for occasional jumps
- **Density**: 4 — three working zones, 13 rows, compact list typography; built for all-day triage
- **Ratios & spacing**: panes ≈ [1 : 2.5 : 4]; list rows padding EVEN_LESS/NONE (CODE-VERIFIED), section dividers ABOVE/BELOW rather than boxed rows

### Styling specifics (CODE-VERIFIED where noted)
- **Palette**: nav pane #3B464E (CODE-VERIFIED ×9), list pane #f0f0f0 (CODE-VERIFIED), selected row #ffffff, sender stamps #990000 / #3d85c6 / #38761d / #351c75 (CODE-VERIFIED per-person stampColor), links ACCENT blue, site bar near-black (est. #2f3439, site chrome not in SAIL)
- **Color application points**: nav pane fill; per-person initial stamps (both list and reading pane); recipient names as ACCENT links; everything else grayscale
- **Typography moves**: subject in reading pane ≈ LARGE; row text STANDARD with unread rows style:"STRONG" (CODE-VERIFIED — weight is the unread signal); audience "to me, Rita Ramos…" SECONDARY; timestamps right-aligned SECONDARY; nav active item flagged with white left bar + "(2)" count
- **Imagery stance**: initials stamps only (a!stampField), one file-type icon
- **Card treatment**: list rows flat on gray with the selected row as a white card; attachment as a bordered white card with icon + name + "178KB"
- **Signature moves**: (1) instead of a grid link-out, a three-pane a!paneLayout keeps triage and reading in one screen; (2) instead of avatars, deterministic per-person stamp colors carried from list to detail (recognition thread); (3) unread = bold + count-in-nav, no badge pills; (4) attachment icon computed by concatenation: icon: "file-" & fv!item.type & "-o" (CODE-VERIFIED).

### Component inventory (CODE-VERIFIED)
- a!paneLayout(3 panes), a!pane(backgroundColor:"#3B464E" / "#f0f0f0", width NARROW/MEDIUM), a!stampField(backgroundColor: fv!item.stampColor, size TINY→LARGE), a!sectionLayout(divider:"BELOW"/"ABOVE"), rich-text rows via a!forEach over a!map data, a!dynamicLink row selection with a!save(local!selectedMessage, …)
- a!isPageWidth ×38 — the pattern ships a complete non-pane fallback for PHONE/TABLET_PORTRAIT
- Charts: none | Interactive: row selection, nav links, attachment link

### Character & judgment
- **Register**: utilitarian-ops — zero decoration, all mechanics
- **Why it works**: selection state is unmissable (white card on gray); the "(2)" nav count matches exactly two bold rows — three independent unread signals stay consistent; stamp color reuse in the header confirms "you're reading what you clicked"
- **Why not boring**: paneLayout full-height architecture (rare vs headerContent scroll pages); per-person color identity system; weight-as-state instead of badges; dark slate rail (#3B464E) distinct from the black site bar, giving depth without borders
- **Boring twin**: a message gridField (From/Subject/Date columns) whose rows open record views; unread shown by a blue dot column; attachments listed as plain links.
- **What to steal**: paneLayout for any list-detail loop; deterministic stamp colors per entity; computed icon names from data fields.
- **Risks**: body is lorem (no real-content judgment possible); white side-bar active indicator is subtle; #f0f0f0 vs #ffffff selected-row distinction may wash out on poor displays; three panes cannot survive tablet portrait — hence the coded fallback.

### Code cross-check
- **Code-verified palette**: #3B464E, #f0f0f0, stamps #990000/#3d85c6/#38761d/#351c75
- **Notable techniques**: a!isPageWidth branching (×38) for responsive variant; "file-" & type & "-o" icon composition; divider-based row separation; local!selectedMessage pattern
- **Corrections**: site top bar is chrome, not authored SAIL — excluded from palette claims.

## image25.png

Component: Discussion thread highlights (tier B). Official variant vocabulary: none (page invokes the Highlights List rule: few posts, link out for more).

### image25 — discussion highlights card
- **Produces it**: a!forEach posts: a!stampField(initials, backgroundColor:"ACCENT", size:"TINY") + name ACCENT STRONG + calendar-o timestamp SECONDARY SMALL + left(body,110) with "More" a!dynamicLink toggle; a!dividerLine separators; textField + POST OUTLINE button on top
- **Looks like**: five-post card, uniform blue stamps, two-line bodies, "View All (15) ›" footer
- **Use when**: recent-activity widget on a record | **Avoid when**: reading whole threads — go full page
- **Styling hooks**: stamp color, truncation length, labelSize:"SMALL"
- **Pairs well with**: record dashboards
- **Hexes**: none (ACCENT token)
- **Marker**: neutral

## image19.png

Component: Notifications highlights (tier B). Official variant vocabulary: none; unread vs read is the variant dimension. Header "Notifications" MEDIUM + "3 unread" SECONDARY; footer "View all Notifications (15) ›" over a horizontalLine.

### image19 — unread row
- **Produces it**: a!cardLayout(decorativeBarPosition:"START", decorativeBarColor:"#2322f0") + title a!richTextItem(color:"#2322f0", style:"STRONG")
- **Looks like**: electric-blue left bar + blue bold title; meta = user-circle name, calendar-o date, SECONDARY; ellipsis-v kebab right
- **Use when**: attention must survive a skim | **Avoid when**: most rows unread — bar loses meaning
- **Styling hooks**: decorativeBarColor, title color/weight
- **Hexes**: #2322f0 (bar, title, footer link)
- **Marker**: neutral

### image19 — read row
- **Produces it**: same card, decorativeBarColor:"#f3f3f3", title STRONG default dark
- **Looks like**: ghost bar preserves left alignment; only hue drops out
- **Use when**: resting state beside unread rows | **Avoid when**: n/a
- **Styling hooks**: decorativeBarColor swap only
- **Hexes**: #f3f3f3
- **Marker**: neutral

## image50.png

Component: Checklist (tier B). Official variant vocabulary: none; per-item status drives a color set. Header: "Required Documents" + "3 documents pending" SECONDARY + a!progressBarField(percentage:75, color:"#2322f0", style:"THICK"); two COLLAPSED-label dropdown filters (All Statuses / All Assignees).

### image50 — status-flagged checklist rows
- **Produces it**: a!forEach cards: left stamp cell (style: fv!item.card_color) with icon colored fv!item.decorative_bar; name = STRONG dynamicLink; calendar icon + due date; assignee SMALL SECONDARY; ellipsis-v kebab
- **Looks like**: slim stacked cards, color-flagged left edge per status
- **Use when**: tracking required items to completion | **Avoid when**: items carry no status — use link/document list
- **Styling hooks**: status pairs — red #F4CCCC/#FC0000 expired (exclamation-triangle, close), amber clock-o due-soon, blue spinner in-progress, green #D9EAD3 check-circle complete, gray #D9D9D9 not-started
- **Pairs well with**: onboarding/KYC record views
- **Hexes**: #2322f0; #F4CCCC/#D9EAD3/#D9D9D9/#FC0000
- **Marker**: neutral

## task-list.png

Component: Task list (tier B). Official variant vocabulary: status groups Backlog / Assigned / Blocked / Resolved. Header: a!headingField("Tasks", MEDIUM, BOLD) + a!multipleDropdownField(placeholder:"All") status filter; small group headings between sections.

### task-list — grouped task rows
- **Produces it**: white a!cardLayout(shape:"ROUNDED") per task: a!stampField(icon: status.icon, backgroundColor: status.backColor, contentColor: status.color, shape:"SEMI_ROUNDED"); title STRONG; milestone circle icon + label #6C6C75 SMALL; calendar-day due date; a!imageField(style:"AVATAR") or gray user stamp (#EDEDF2/#6C6C75) when Unassigned; a!recordActionField(style:"MENU_ICON")
- **Looks like**: soft-tinted status tiles on airy white cards
- **Use when**: status-grouped tasks inside a larger page; filter avoids navigating (page prose) | **Avoid when**: sort/bulk ops needed — use a grid
- **Styling hooks**: backColor/contentColor pairs — Backlog #EBF4FF/#115EBB inbox; Assigned #FFF5E6/#CC7600 user-check; Blocked #FDEDF0/#B2002C ban; Resolved #EDF7EE/#117c00 check-circle
- **Pairs well with**: onboarding plans; milestone dots #82C272/#00A88F/#005FAA
- **Hexes**: above (color IS the variant dimension)
- **Marker**: neutral

## image83.png

### Identification
- **Image**: image83.png | **Source page**: lists | **Alt/caption**: none (heading: "Document list")
- **Device frame**: desktop (widget-scale capture on page background; treated as tier A per batch — a complete pattern, not a crop of a larger shot)
- **Marker**: neutral
- **UI type**: list (document/attachment list)

### Use-case reconstruction (INFERRED)
- **Persona**: loan/KYC case reviewer; daily-operator opening applicant evidence
- **Domain & brand context**: financial services underwriting — filenames read bowan_paystub_11_2021.pdf, bowan_checking_statement, Assets Explanation.xlsx
- **Top 3 user tasks (ranked)**: 1. Open a specific document. 2. Identify file kind before opening. 3. Jump to the full attachment set.
- **Implied requirements**: "File type recognizable pre-click"; "Show size so users anticipate download weight" (page prose: file metadata); "Cap the inline list and offer See All"
- **Data model sketch**: Attachment(name, sizeKB, type[jpg|pdf|xlsx]); case 1:N attachments; 5 shown of N

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SECTION "Attachments" (labelSize MEDIUM)
└─ CARD(white, flat)
   ├─ ROW ×5: COLUMNS [EXTRA_NARROW tinted icon cell | AUTO name+size] + HR #eee
   └─ footer link "See All Attachments ›" centered
```
- **Above the fold**: all five rows + footer
- **Reading order**: single-column scan
- **Hierarchy rationale**: color cell first (type triage), filename STRONG second (target acquisition), size demoted below in SECONDARY
- **Density**: 3 — five two-line rows with comfortable padding in one widget
- **Ratios & spacing**: icon cell EXTRA_NARROW with columns spacing:"NONE" so the tint fills the full row height (CODE-VERIFIED); rows separated by a!horizontalLine(color:"#eee")

### Styling specifics (CODE-VERIFIED)
- **Palette**: page bg #f0f0f0 (est.), card #ffffff; type chips: PDF #cfe2f3 cell + #0b5394 icon, image #d9d2e9 + #674ea7, Excel #d9ead3 + #38761d; rules #eee; footer link ACCENT
- **Color application points**: only the icon cells and the footer link — filenames stay near-black
- **Typography moves**: section label MEDIUM; filename STANDARD STRONG; size SECONDARY below (e.g., "121KB"); footer link STRONG + chevron-right
- **Imagery stance**: styled icons only (file-pdf-o, file-image-o, file-excel-o on tinted cells)
- **Card treatment**: flat white; internal hairlines instead of per-row cards
- **Signature moves**: (1) instead of a gray icon column, a paired light-bg/dark-icon tint system per file type (blue/purple/green); (2) instead of padded thumbnails, padding:"NONE" + spacing:"NONE" makes the tint a full-bleed cell — reads as a designed table, not stacked fields; (3) instead of pagination, a single centered See-All link.

### Component inventory (CODE-VERIFIED)
- a!sectionLayout(labelSize:"MEDIUM"), a!cardLayout rows with nested cardLayout(style:"#cfe2f3"| "#d9d2e9"|"#d9ead3") icon cells, a!richTextIcon(color:#hex), a!horizontalLine(color:"#eee"), footer a!richTextItem(color:"ACCENT") + chevron-right, a!dynamicLink per row
- Charts: none | Interactive: row links, See All link

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical
- **Why it works**: type is legible from color alone at a glance (blue=pdf cluster obvious); STRONG filenames give a crisp scan line; metadata restraint (size only) keeps rows two lines tall
- **Why not boring**: full-height tinted cells (rare in SAIL, built from padding/spacing NONE); triadic type palette that still reads calm because tints are pale; centered See-All as a designed terminus instead of a dangling "more" link
- **Boring twin**: a gridField with Name/Type/Size columns and a paperclip icon per row, or a plain link list with uniform gray file icons.
- **What to steal**: pale-cell + saturated-icon pairing for categorical color; spacing:"NONE" trick for flush cells; cap-plus-See-All for widget lists.
- **Risks**: tint semantics unlabeled (icon glyph must carry meaning for colorblind users — it does); long filenames will wrap or truncate untested; whole-row link affordance is invisible until hover.

### Code cross-check
- **Code-verified palette**: #cfe2f3/#0b5394, #d9d2e9/#674ea7, #d9ead3/#38761d, #eee
- **Notable techniques**: nested card as color cell; commented-out alternates in source (/*color: "#C4C4C4"*/) show tuning history
- **Corrections**: none.

## image41.png

Component: Link list "Resources" (tier B). Official variant vocabulary: none; action type (download vs external link) is the variant dimension. Section label MEDIUM; rows in one white card with a!horizontalLine(color:"#eee") separators, each row a dynamicLink.

### image41 — download row
- **Produces it**: a!stampField(icon:"download", backgroundColor:"#d7e5f3", contentColor:"#3d85c6", size:"TINY") + label STRONG
- **Looks like**: pale-blue circular chip + bold one-line label ("Campaign Manager Playbook")
- **Use when**: fetching a file/asset | **Avoid when**: metadata matters — use document list
- **Styling hooks**: stamp bg/contentColor pair, TINY size
- **Hexes**: #d7e5f3 / #3d85c6
- **Marker**: neutral

### image41 — external-link row
- **Produces it**: same anatomy, a!stampField(icon:"link", backgroundColor:"#d7f3e0", contentColor:"#459b20")
- **Looks like**: pale-green chip signaling departure ("Google Ads Dashboard")
- **Use when**: curated resource shelf on portals | **Avoid when**: list needs status or ownership
- **Styling hooks**: icon + hue swap only — anatomy constant
- **Hexes**: #d7f3e0 / #459b20
- **Marker**: neutral

### Page rollup (tier-B list widgets)
Default choice: notifications-style highlight cards for attention feeds, link list for static resources, checklist for tracked obligations, task list for status-grouped work. All four share the recipe: forEach over a!map data + one saturated/pale color pair per semantic state; pick the widget by whether rows carry state (checklist/task) or not (link/notification).

## image86.png

### Identification
- **Image**: image86.png | **Source page**: lists | **Alt/caption**: none (heading: "Document thumbnail browser")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other (media/page-management workspace with list rail)

### Use-case reconstruction (INFERRED)
- **Persona**: records/document-control clerk assembling multi-page filings (demo shows FAA approach plates); daily-operator
- **Domain & brand context**: document ops in aviation/records management; tool-first, brandless charcoal workspace
- **Top 3 user tasks (ranked)**: 1. Verify page content and order. 2. Reorder pages. 3. Duplicate/delete a page.
- **Implied requirements**: "Selected page shown near full size"; "Reordering without drag-and-drop" (page prose: controls for reordering); "Page numbers always visible"; "Destructive and structural actions grouped in a toolbar"
- **Data model sketch**: Document 1:N Pages(number, image); selection state = current page (page 2 highlighted)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=CHARCOAL_SCHEME
└─ COLUMNS [NARROW thumb rail + arrow column | WIDE preview]
   ├─ rail: ×4 CARD(imageField FIT + number caption; selected=style ACCENT) with arrow-up/arrow-down pairs
   └─ preview: BUTTON-ROW (Duplicate Page / Delete Page / Move Up / Move Down, OUTLINE) + CARD(imageField FIT)
```
- **Above the fold**: 4 thumbnails, toolbar, full page preview
- **Reading order**: F — rail scan, then toolbar, then preview
- **Hierarchy rationale**: preview dominates (task 1 is verification); rail persists for orientation; reorder affordances duplicated (per-thumb arrows + toolbar) because task 2 is the pattern's reason to exist
- **Density**: 3 — two zones, large media, minimal chrome
- **Ratios & spacing**: rail ≈ 1/4 width (NARROW vs WIDE, CODE-VERIFIED); thumbnails padding EVEN_LESS; preview card padding NONE

### Styling specifics (CODE-VERIFIED)
- **Palette**: workspace backgroundColor:"CHARCOAL_SCHEME" (CODE-VERIFIED — renders ≈#1e2226 est.); selected thumbnail card style:"ACCENT" (blue); white document pages; toolbar buttons OUTLINE (light on dark); icon arrows white/dimmed gray
- **Color application points**: selection highlight only; everything else is achromatic so the documents are the brightest objects
- **Typography moves**: toolbar labels all-caps STANDARD; page numbers as small captions under thumbnails (color STANDARD on dark)
- **Imagery stance**: document raster images via a!imageField(size:"FIT") ×5
- **Card treatment**: thumbnails as cards with EVEN_LESS padding; selected card filled ACCENT; preview inside a plain card
- **Signature moves**: (1) instead of the default white page, CHARCOAL_SCHEME media-viewer chrome makes white documents pop (photo-editor idiom); (2) instead of drag-and-drop (unavailable in SAIL), honest per-item arrow icons plus toolbar Move Up/Move Down; (3) selection = whole-card ACCENT fill around the thumbnail, visible at squint distance.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"CHARCOAL_SCHEME"), a!cardLayout(style:"ACCENT") selection, a!imageField(size:"FIT") ×5, a!buttonWidget(style:"OUTLINE") ×4 (icons window-restore, trash-o, arrow-up, arrow-down), rich-text arrow icon pairs per thumbnail, a!dynamicLink thumbnail selection
- Charts: none | Interactive: thumbnail select, reorder arrows, toolbar actions

### Character & judgment
- **Register**: utilitarian-ops — a workbench, deliberately colorless
- **Why it works**: dark canvas maximizes document contrast; two reorder affordances serve both pointer precision (toolbar) and spatial habit (rail arrows); numbered captions survive reorders as a truth-check
- **Why not boring**: CHARCOAL_SCHEME is a rare palette choice in SAIL corpora; ACCENT-filled selection card instead of a border tweak; toolbar sits inside the dark canvas rather than a white header band
- **Boring twin**: white page, gridField of page numbers with up/down link columns, preview behind a click.
- **What to steal**: dark scheme for any media inspection surface; duplicate reorder affordances when drag is unavailable; FIT sizing for responsive media.
- **Risks**: dimmed arrows (first/last position) may read as broken on dark bg; icon-only rail arrows are small targets; OUTLINE button contrast on charcoal must be watched; no confirmation shown for Delete Page.

### Code cross-check
- **Code-verified palette**: CHARCOAL_SCHEME token, ACCENT selection, OUTLINE buttons
- **Notable techniques**: imageField size:"FIT"; labelColor:"SECONDARY" on Move Up (disabled-state signaling); per-thumb dynamicLink
- **Corrections**: charcoal hex is token-rendered — kept as token, est. only for pixels.

## contact-list.png

### Identification
- **Image**: contact-list.png | **Source page**: lists | **Alt/caption**: none (heading: "Contact list")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (people directory) — notable as the page's only dark-theme pattern

### Use-case reconstruction (INFERRED)
- **Persona**: any employee browsing a team/org directory; occasional use
- **Domain & brand context**: internal directory; sleek dark-neutral presentation suggests a design-forward org or embedded dark-mode site
- **Top 3 user tasks (ranked)**: 1. Find a person by face/name. 2. Grab their phone or email. 3. Skim the roster.
- **Implied requirements**: "Photo, name, and both contact channels per row" (page prose: secondary information like contact information or title); "Rows readable in dark environments"; "No navigation required to see contact data"
- **Data model sketch**: Contact(name, phone, email, photo) — flat 1:N list, 6+ rows

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#252326
├─ H1 "Contacts" (MEDIUM)
└─ CARD(#373438, SEMI_ROUNDED) ×n
   └─ SBS [avatar SMALL_PLUS | name H2 + (icon+phone) + (icon+email)]
```
- **Above the fold**: heading + ~5.5 rows
- **Reading order**: single-column scan
- **Hierarchy rationale**: avatar leftmost (fastest human lookup key); name above contact rows; phone before email (call-first assumption)
- **Density**: 2 — one entity per generous card, big avatars, no metadata beyond contact channels
- **Ratios & spacing**: avatar-to-text spacing:"SPARSE", icon-to-value spacing:"STANDARD", cards marginBelow:"STANDARD", padding:"STANDARD" (all CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: page #252326, cards #373438 (both CODE-VERIFIED); text/icons white via color:"STANDARD" auto-inversion; photos are the only saturated elements; no accent hue anywhere
- **Color application points**: none beyond photography — a deliberately accentless UI
- **Typography moves**: page title a!headingField(size:"MEDIUM", H1); names a!headingField(size:"SMALL", fontWeight:"REGULAR", H2, marginBelow:"EVEN_LESS") — semantic headings, not rich text; phone/email STANDARD
- **Imagery stance**: photos as a!imageField(style:"AVATAR", size:"SMALL_PLUS") circles
- **Card treatment**: filled #373438, shape:"SEMI_ROUNDED", showBorder:false, showShadow:false — separation by value contrast alone
- **Signature moves**: (1) instead of light-theme default, a two-step dark neutral stack (#252326/#373438) with no outlines or shadows; (2) instead of rich text names, headingField H2s — accessibility tree gets a real heading per person; (3) REGULAR font weight at SMALL heading size — quiet, editorial confidence; (4) icons colored "STANDARD" so the theme flips them white for free.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#252326"), a!forEach over a!map contacts, a!cardLayout(style:"#373438", shape:"SEMI_ROUNDED", showShadow:false), a!imageField(style:"AVATAR", size:"SMALL_PLUS"), a!headingField ×2 levels, a!richTextIcon("mobile-alt"/"envelope-o", color:"STANDARD"), a!sideBySideLayout(alignVertical:"MIDDLE")
- Charts: none | Interactive: none coded (static directory; rows are not links)

### Character & judgment
- **Register**: premium-editorial + calm-clinical — a directory that looks like a music-app artist list
- **Why it works**: photos carry all color against disciplined neutrals, so faces are found fast; consistent icon gutter aligns phone/email into scannable columns; card value-step (18→22% lightness est.) separates rows without borders
- **Why not boring**: full dark theme (unique on this page); accentless palette; semantic heading ladder (H1 MEDIUM → H2 SMALL REGULAR); SEMI_ROUNDED softening
- **Boring twin**: white gridField with Name/Phone/Email text columns and no photos, or light cards with blue link names.
- **What to steal**: hex-styled headerContentLayout + hex cards as the recipe for dark-mode SAIL; color:"STANDARD" for theme-proof icons; headingField-per-row for a11y.
- **Risks**: phone/email are plain text, not tel:/mailto: links or copy affordances; #373438-on-#252326 separation is subtle for low-quality displays; no search/filter shown for longer rosters.

### Code cross-check
- **Code-verified palette**: #252326, #373438
- **Notable techniques**: showShadow:false explicitly; marginBelow:"EVEN_LESS" tightening name-to-phone; AVATAR style imageField
- **Corrections**: name text renders white via heading default on dark — not an explicit color param.

## image68.png

Component: Simple event history (tier B). Official variant vocabulary: none. **Tier override: table suggested A; analyzed as B** — 972×528 standalone widget crop, five rows of one repeated anatomy, no page chrome, and no SAIL source on the page (unlike every sibling); variant-level treatment captures it fully. All hexes est. (pixels only).

### image68 — actor event row
- **Produces it**: (INFERRED) a!forEach + sideBySideLayout: a!stampField(initials, per-person backgroundColor) | line 1: name ACCENT STRONG + action + record link ACCENT ("Karen Anderson deleted record Case 12345"); line 2 timestamp SECONDARY ("May 4 at 3:38PM")
- **Looks like**: airy audit feed; stamp hues #3d85c6/#674ea7/#38761d/#990000 (est., echoing the inbox palette)
- **Use when**: who/what/when suffices | **Avoid when**: field-level before/after needed — use detailed event history (image4)
- **Styling hooks**: stamp color mapping; verb phrasing per action
- **Marker**: neutral

### image68 — system event row
- **Produces it**: same row, a!stampField(icon:"cog", backgroundColor ≈#e69138 est.); sentence starts at the record link ("Record Case 12349 was automatically archived") — no actor
- **Looks like**: gear glyph replaces initials; automation visually distinct from humans
- **Use when**: mixed human/automated trails | **Avoid when**: all events are system-generated
- **Styling hooks**: icon-vs-initials stamp; reserved automation hue
- **Marker**: neutral

## image4.png

### Identification
- **Image**: image4.png | **Source page**: lists | **Alt/caption**: none (heading: "Detailed event history")
- **Device frame**: desktop (standalone pattern render on white — no site chrome; kept tier A per batch: a complete page-scale pattern with full internal architecture)
- **Marker**: neutral
- **UI type**: list (audit timeline with change detail)

### Use-case reconstruction (INFERRED)
- **Persona**: compliance/QA analyst or case supervisor auditing record changes; weekly or incident-driven, reads deeply
- **Domain & brand context**: banking case management (values: "Set up new joint savings account", Case 12345 links, Pending→Active)
- **Top 3 user tasks (ranked)**: 1. Reconstruct exactly what changed, per field. 2. Attribute each change to actor + moment. 3. Scan activity chronology across days.
- **Implied requirements**: "Every event must expose field, old value, new value" (page prose: audit history with change details); "Day boundaries visible without reading timestamps"; "Record links jump to the affected case"; "Times sortable at a glance within a day"
- **Data model sketch**: Event(date, time, actor, action, recordLink, changes[field, oldValue, newValue]); day 1:N events; event 1:N field changes (2 shown per event)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COLUMNS [EXTRA_NARROW date rail | AUTO events]  showDividers:true → vertical rule
├─ DATE CHIP: CARD(style ACCENT "MAY") over CARD(white "6" MEDIUM_PLUS STRONG)
└─ per event: COLUMNS [time (right-aligned, AUTO) | detail]
   ├─ headline: actor ACCENT+STRONG + "edited record" + Case link ACCENT
   └─ mini-table SBS: FIELD | OLD VALUE (2X) | NEW VALUE (2X); rows Title, Status
```
- **Above the fold**: two day groups (MAY 6, MAY 5), six events, twelve change rows
- **Reading order**: F — date rail anchors, then per-event headline → table
- **Hierarchy rationale**: date chips are the only saturated blocks (chronology first); actor+record headline in accent bold (attribution second); change tables in quiet gray-headed columns (detail on demand)
- **Density**: 4 — nested tables per event, six events per viewport, minimal chrome
- **Ratios & spacing**: date column EXTRA_NARROW (CODE-VERIFIED); value columns width:"2X" vs field column 1X (CODE-VERIFIED ×36); events separated by spacing SPARSE; padding EVEN_LESS on chips

### Styling specifics (CODE-VERIFIED)
- **Palette**: white canvas; date-chip header style:"ACCENT" (blue ≈#2e6da4 est. rendering) over white body; actor + case links ACCENT; table headers SECONDARY gray; values color:"STANDARD"
- **Color application points**: date chips, actor names, record links — three chronology/attribution anchors; zero color in the data itself
- **Typography moves**: FIELD/OLD VALUE/NEW VALUE headers all-caps SECONDARY (label-as-column-header move); day number MEDIUM_PLUS STRONG; field names STRONG; long values truncated with ellipsis ("Set up new individual checkin…")
- **Imagery stance**: none — pure typography
- **Card treatment**: chips are nested borderless cards; events unboxed, separated by whitespace and the rail rule
- **Signature moves**: (1) instead of a text date header, a two-tone calendar-page chip (ACCENT month band + white day) built from two stacked cards; (2) instead of prose diffs ("changed X from A to B"), a three-column mini-table per event — scannable and comparable; (3) columnsLayout(showDividers:true) turns a layout divider into a timeline spine with right-aligned times butting against it.

### Component inventory (CODE-VERIFIED)
- a!columnsLayout(showDividers:true) ×several, a!cardLayout(style:"ACCENT") chips, a!richTextDisplayField ×82, a!sideBySideLayout tables with width:"2X" items, a!richTextItem(color:"ACCENT", style:"STRONG") actors, record links, align:"RIGHT" times
- Charts: none | Interactive: case links only — the audit itself is read-only

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — dense but entirely grayscale except navigational anchors
- **Why it works**: the calendar-chip metaphor makes day boundaries pre-attentive; identical table skeleton per event turns deep audit reading into pattern matching; the vertical rule + right-aligned times form a clean time axis without any timeline component
- **Why not boring**: physical calendar-page chip; label-row-as-header trick inside sideBySide layouts; divider-as-spine; disciplined two-hue system (accent + gray) across a dense surface
- **Boring twin**: a gridField of audit rows with a concatenated "Description" column, dates repeated in every row, no grouping.
- **What to steal**: two-card calendar chip; three-column diff table for any before/after display; showDividers as timeline spine.
- **Risks**: ellipsized values hide the very change being audited (needs expand/tooltip); five-column effective width collapses badly on phone; demo repeats identical events, so variance handling (multi-field diffs, long values) is unproven.

### Code cross-check
- **Code-verified palette**: style:"ACCENT" chips; SECONDARY headers; ACCENT links; no custom hexes in this block
- **Notable techniques**: showDividers:true (~6 occurrences) for the rule; width:"2X" ×36 fixing table geometry; nested card chip construction (block ln ~5546–5593)
- **Corrections**: chip blue is the theme ACCENT token, not a custom hex — pixel estimate demoted accordingly.
