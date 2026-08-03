# Analysis: ux-event-history-list

Page has no SAIL source; all colors are pixel estimates. Tier overrides called out per image.

## eventHistoryCommentsExample_24-4.png

### Identification
- **Image**: eventHistoryCommentsExample_24-4.png | **Source page**: ux-event-history-list | **Alt/caption**: ds-images/eventHistoryCommentsExample_24-4.png (heading: Comment list)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: marketing campaign manager, mid-level, weekly-manager cadence (plans campaigns, coordinates via discussion)
- **Domain & brand context**: B2B IT vendor running green-marketing campaigns; neutral-white product UI with a single vivid blue accent
- **Top 3 user tasks (ranked)**: 1. Review campaign facts (dates, segments, strategy) 2. Discuss events with teammates via comments and @mentions 3. Monitor activity across this and related campaigns
- **Implied requirements**: "Must let users comment and @mention without leaving the record"; "Must interleave human comments and system events in one stream"; "Must show which record each event belongs to"; "Must support sorting, filtering, and subscribing to the stream"
- **Data model sketch**: Campaign (title, goLive: May 2024, endDate: Nov 30 2024, segments[4], strategy text, hero image) 1—n Event/Comment (author→User, timestamp, body, mentions[]→User, source record link, type: comment | system-event); related Campaigns (Tech Upgrades, Remote Work Essentials); watcher count (0). Events reference two records ("Eco-Friendly IT Solutions", "Remote Work Essentials") — stream aggregates multiple record types OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COLUMNS [2:1]
├─ PANE[left] campaign summary
│  ├─ SBS image(≈200px sq) + title/field-value pairs + tag row ×4
│  ├─ SECTION "STRATEGY" body ×3 paragraphs
│  └─ SECTION "SIMILAR CAMPAIGNS" thumbnail cards ×2
└─ PANE[right] EVENT-FEED(comment list)
   ├─ composer: avatar + "Add a comment" input
   ├─ toolbar: New To Old · Filters | Subscribe · watch-count
   └─ event/comment cards ×5 visible
```
- **Above the fold**: full campaign summary, both similar-campaign thumbnails, composer + ~4.5 feed cards
- **Reading order**: Z — title/facts left, then down strategy, then right rail scanned vertically
- **Hierarchy rationale**: campaign title is EXTRA_LARGE because identity anchors the record (task 1); composer sits at the very top of the feed so contribution (task 2) needs zero scrolling; per-card record links serve cross-campaign monitoring (task 3)
- **Density**: 3 — two zones, ~5 feed items + ~10 record facts per viewport, generous paragraph spacing
- **Ratios & spacing**: columns ≈ [2:1]; feed cards separated by ≈12px white gaps, internal padding ≈ STANDARD; vertical divider between panes ≈ none (white gutter)

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; feed card bg #f2f2f2 (est.); accent blue #2626f0 (est.); avatar green #27a570 (est.); text near-black #222222 (est.); metadata gray #6e6e6e (est.)
- **Color application points**: segment tags (solid blue, white text); @mentions (bold blue inline); composer avatar (solid green initials "DH"); everything else neutral — no header bar in crop
- **Typography moves**: campaign title ≈ EXTRA_LARGE bold; field labels SMALL gray over MEDIUM values; "STRATEGY"/"SIMILAR CAMPAIGNS" SMALL all-caps gray section labels; feed names STANDARD bold with SMALL gray timestamps
- **Imagery stance**: photos — AI-style campaign art (~200px) + thumbnail cards; circular user photos ≈36px in feed
- **Card treatment**: feed cards filled #f2f2f2 (est.), no border, square-ish corners; footer record-link zone separated by an internal divider
- **Signature moves**: instead of a plain comment box, the composer pairs a colored initials avatar with the input, making authorship visible pre-post; instead of hiding provenance, every card footers a link-icon + source-record name; instead of styling system events differently by color, "System" gets a gear-icon avatar in the same slot as user photos; sort/filter/subscribe/watch-count are compact bordered chips on one toolbar row

### Component inventory (OBSERVED)
- a!eventHistoryListField(style: comment list, pageSize ≈5, userImageStyle: photo) INFERRED; a!columnsLayout ≈[2:1]; a!tagField for segments; a!buttonArrayLayout-like toolbar chips (New To Old, Filters, Subscribe); kebab (⋮) overflow menu on user comments only — system/plain events lack it OBSERVED
- Chart types: none
- Interactive affordances: comment input, @mention links, sort toggle, filters, subscribe, watcher count, per-comment overflow menu, record links per card

### Character & judgment
- **Register**: warm-community + premium-editorial — avatars, mentions, and discussion beside a big-imagery campaign brief
- **Why it works**: gray card fills separate the social stream from the white editorial pane without borders; mixed comment/system events share one chronology so "what happened" and "what was said" never fork; @mentions in accent blue make people the most clickable thing in the feed
- **Why not boring**: green initials avatar in the composer personalizes before typing; watcher-count eye chip (0) exposes audience; per-card record-link footers turn a comment list into a cross-campaign activity hub; solid-blue segment tags give the record one loud identity row
- **Boring twin**: a white page with a "Comments" heading, a textarea at the bottom, plain gray text rows with no avatars, no mentions, no source-record links — chronology present, collaboration invisible.
- **What to steal**: put the composer above the feed, not below; footer each aggregated event with its source record; reserve one accent for people-links and tags
- **Risks**: #2626f0 tags/links on gray #f2f2f2 remain AA-ish but thin gray metadata (#6e6e6e est. on #f2f2f2) is borderline; two-column layout will force the feed below the summary on mobile — composer then lands mid-page

### Code cross-check
none — page has no SAIL source

## eventHistoryListPreviewExample.png

### Identification
- **Image**: eventHistoryListPreviewExample.png | **Source page**: ux-event-history-list | **Alt/caption**: ds-images/eventHistoryListPreviewExample.png (heading: Preview list)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page

### Use-case reconstruction (INFERRED)
- **Persona**: regional sales rep ("Welcome, Jane", Mid-Atlantic Region), daily-operator
- **Domain & brand context**: wholesale/distribution order management; Appian-branded demo, single plum accent on white/gray — institutional but personable
- **Top 3 user tasks (ranked)**: 1. Clear today's task queue (order reviews) 2. Look up customers and launch order actions 3. Monitor recent order events and delivery performance
- **Implied requirements**: "Must show open tasks with deadlines without scrolling"; "Must expose per-customer actions from the list"; "Must give a glanceable feed of latest order events with a path to the full history"; "Must track sales target progress at page top"
- **Data model sketch**: Rep 1—n Tasks (name, isNew, deadline; 7 items); Rep 1—n Customers (name, phone, email, lastOrder→Order; 8 of 10); Order 1—n Events (actor→User, verb: Delivered/Shipped/Approved/Reviewed, timestamp, orderId tag; 5 of 24); delivery KPIs (83% on-time, 91% issue-free); sales target 59%; monthly counters (4 accounts, 19 orders, 23 avg items)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (navbar #212645 est.)
├─ WELCOME BAND: name (LARGE plum) + SALES TARGET progress 59% + KPI-ROW ×3
└─ COLUMNS [1:2:1] on gray canvas
   ├─ SECTION "My Tasks" GRID(2-col, 7 rows) + SECTION "Actions" stacked outline buttons ×3
   ├─ SECTION "My Customers" GRID(3-col + ACTIONS per row, 8 rows, pager)
   └─ SECTION "Deliveries" CHART(donut ×2) + SECTION "My Orders" EVENT-FEED(preview, 5 rows + View All)
```
- **Above the fold**: everything shown — tasks, customers, both donuts, all 5 feed rows
- **Reading order**: F — welcome/KPI band, then left-to-right down the three columns
- **Hierarchy rationale**: customers get the widest column because order actions are the revenue task; tasks sit left (first-read) for the daily queue; the event feed is a narrow right-rail "Medium-width" column exactly as the page prescribes for preview lists
- **Density**: 4 — ~30 data rows plus 6 KPIs/charts in one viewport, compact row heights, working-tool spacing
- **Ratios & spacing**: columns ≈ [1:2:1]; white cards on #f4f4f4 (est.) canvas; My Orders card padding NONE — divider lines run flush to card edges OBSERVED

### Styling specifics (OBSERVED)
- **Palette**: navbar #212645 (est.); page bg #f4f4f4 (est.); card bg #ffffff; primary plum #9a2b71 (est.); tag chip bg #eeeeee (est.); label gray #757575 (est.); text #222222 (est.)
- **Color application points**: plum on section headers, all links (tasks, customers, orders), "New" tags, progress bar fill, both donut arcs, "View All (24)"; navbar the only dark surface; KPI numbers plain near-black
- **Typography moves**: "Welcome, Jane" LARGE plum; section headers MEDIUM bold plum; KPI labels SMALL all-caps gray over LARGE numbers; feed rows STANDARD bold name + regular verb, SMALL gray timestamp
- **Imagery stance**: circular profile photos (~40px) in feed and navbar; small line icons on buttons/contacts; no illustration
- **Card treatment**: flat white, hairline #dddddd (est.) borders, square corners, no shadow
- **Signature moves**: instead of multi-hue semantics, one plum does every interactive/brand job (links, tags, charts, progress); instead of a table, recent activity is an avatar feed with actor-first sentences ("Linda Johnson Delivered Order"); instead of a page-level chrome KPI block, the sales-target bar shares the welcome band; order IDs demoted to gray chips so names/verbs carry the scan

### Component inventory (OBSERVED)
- a!eventHistoryListField(style: preview, previewListPageSize: 5, userImageStyle: photo, "View All (24)" opens full dialog of pageSize ≈25) INFERRED from page text; a!gridField ×2 with record links and row ACTIONS dropdowns; a!gaugeField/donut ×2; a!progressBarField; a!tagField ("New", "Order 125"); stacked a!buttonArrayLayout (ADD CUSTOMER / CREATE ORDER / UPDATE INVENTORY)
- Chart types: donut/gauge ×2, custom colorScheme no — plum brand color
- Interactive affordances: nav tabs, per-row ACTIONS menus, task/customer/order record links, pager (1–8 of 10), View All (24)

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — dense operator home kept quiet by a one-accent palette
- **Why it works**: the preview list obeys its own guidance (5 rows, Medium-width column, card padding NONE so dividers hit card edges); every zone answers one question and links deeper; 59% target bar beside the greeting makes performance ambient, not a chart destination
- **Why not boring**: actor-avatar feed instead of an "Order Log" table; monochrome plum discipline where a lazy build would scatter status colors; View All (24) count advertises depth before the click; twin donuts compress delivery QA to two numbers
- **Boring twin**: a four-widget dashboard with a bar chart of sales, a paginated orders grid with timestamp columns, default blue links, and a "Recent Activity" table without faces — same data, no scan rhythm.
- **What to steal**: preview feed in a Medium right rail with an explicit View All count; padding NONE when a divider-bearing list lives in a card; one accent for all interactivity
- **Risks**: plum links at SMALL sizes near AA limits on white; three columns collapse long on mobile — feed lands last; photos-only avatars degrade if users lack photos (page's own Initials guidance)

### Code cross-check
none — page has no SAIL source

## eventHistoryList_cardPadding.png

Tier override: batch suggested A; this is a side-by-side comparison crop of one card in two padding treatments, not a full page → analyzed as a Tier C principle pair contained in a single image (left "No Padding" = DO per page text, right "Standard Padding" = the consequence).

### Principle: Zero the card padding so the list runs flush
- **DO shows**: "No Padding" — preview list in a card with padding NONE; row dividers span the full card width, avatars and "View All (24)" sit flush to the card edge; list and card read as one component
- **DON'T shows**: "Standard Padding" — same list inset by a white frame; divider lines stop short of the card edges and float mid-card, rows look like a widget pasted inside a widget
- **Rule**: when a component draws its own full-width dividers, wrap it in a card with padding "NONE"; the card supplies the boundary, the component supplies internal structure
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!cardLayout(padding: "NONE", contents: a!eventHistoryListField(...)); page text CODE-VERIFIED-adjacent guidance: any other padding "will impact the length of the divider lines"

## eventHistoryList_fullPreviewCorrect.png + eventHistoryList_fullPreviewIncorrect.png

Tier C DO/DON'T pair (siblings under "Full list"). Both show the same record view: navbar, "James Sheehan | Customer ID: 2214", tabs Summary / Order History (active plum) / Documents; toolbar (search "Search Events for Screenshots" + SEARCH, EVENT TYPE, DATE RANGE, sort icon), "Expand All Details" link, 10 avatar rows with Order tags, one expandable row (Katie Thomas Denied Order, chevron), pager 1–10 of 16.

### Principle: Center a full-list feed in a Wide middle column
- **DO shows**: full list placed in the middle of a columns layout (flanking Default/AUTO columns empty, middle ≈ WIDE); search, filters, rows, and the expand chevron share one ~900px reading column; controls stack in two compact rows
- **DON'T shows**: same component dropped bare on the interface; EVENT TYPE and DATE RANGE dropdowns stretch enormously, rows run ~1999px edge-to-edge, and the row chevron strands far right of its text — dead space dominates and eye travel breaks the actor→event→tag scan
- **Rule**: when an event history full list is the page's main component, constrain it: COLUMNS [DEFAULT : WIDE : DEFAULT] with the list in the middle
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!columnsLayout(columns: {a!columnLayout(width:"AUTO"), a!columnLayout(width:"WIDE", contents: a!eventHistoryListField(style: full, pageSize: 25–50)), a!columnLayout(width:"AUTO")}) — widths per page text

## Component: Event History List — User Image Style (page: ux-event-history-list)

Tier override: batch suggested A for all three; each is a 952x672 cropped fragment of the same 5-row preview list (identical rows: Linda Johnson / Sam Miller / John Doe ×2 / Linda Johnson + "View All (24)" link in blue #2929f0 est.), differing only in the user-image dimension → Tier B variant rollup.
Official variant vocabulary: Profile Photo · Initials · None (User Image Style); User Color Scheme applies when initials render.

### eventHistoryList_profilePhoto.png — Profile Photo
- **Produces it**: a!eventHistoryListField(userImageStyle: photo)
- **Looks like**: ~80px circular photos with hairline gray ring, left of bold name + event verb, timestamp + gray Order tag beneath
- **Use when**: most users have profile photos (missing ones fall back to initials) | **Avoid when**: photo coverage is sparse — mixed photo/initials rows look inconsistent
- **Styling hooks**: user image style; divider lines; tag chips
- **Pairs well with**: collaboration-heavy streams, comment list, customer-facing records
- **Hexes**: none — photos
- **Marker**: neutral

### eventHistoryList_initials.png — Initials
- **Produces it**: a!eventHistoryListField(userImageStyle: initials, userColorScheme: predefined | custom hex)
- **Looks like**: solid color circles with white 2-letter initials; per-user deterministic colors — LJ/JD indigo #4a63a8 (est.), SM violet #a561d8 (est.)
- **Use when**: most users lack photos — uniform, still person-differentiating | **Avoid when**: real faces matter for recognition
- **Styling hooks**: User Color Scheme (predefined or custom hex)
- **Pairs well with**: internal ops tools, large user bases without photo hygiene
- **Hexes**: #4a63a8 (est.), #a561d8 (est.) — color is the variant dimension here
- **Marker**: neutral

### eventHistoryList_none.png — None
- **Produces it**: a!eventHistoryListField(userImageStyle: none)
- **Looks like**: avatar column removed; name/event text flush left; rows shorter and quieter, name still bold
- **Use when**: reclaiming horizontal space (narrow columns) or simplifying | **Avoid when**: fast actor recognition drives the scan
- **Styling hooks**: user image style only
- **Pairs well with**: Narrow/Medium side columns, dense summary views, timeline-adjacent placements
- **Hexes**: none
- **Marker**: neutral

### Page rollup
Default choice for most cases is Profile Photo because faces maximize actor recognition and it self-falls-back to initials per user; switch to Initials app-wide when photo coverage is poor (consistency beats occasional faces), and to None only when space or visual quiet outranks recognition.

## eventHistoryList_timelineExample.png

### Identification
- **Image**: eventHistoryList_timelineExample.png | **Source page**: ux-event-history-list | **Alt/caption**: ds-images/eventHistoryList_timelineExample.png (heading: Timeline)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: account manager / customer-service rep working orders, daily-operator
- **Domain & brand context**: food-service wholesale distribution (burger patties, fries, condiments); same Appian plum-on-white demo brand
- **Top 3 user tasks (ranked)**: 1. Confirm order status and delivery outcome at a glance 2. Verify line items and totals 3. Trace the order's process history / reach the right people
- **Implied requirements**: "Must show delivery status and on-time-ness first"; "Must present full milestone chronology without extra detail rows"; "Must itemize the invoice with totals"; "Must surface customer tier and both internal contacts"
- **Data model sketch**: Order 125 1—n Events (7: Created→Updated ×2→Reviewed→Approved→Shipped→Delivered; actor→User, time, date); 1—n LineItems (7: name, #SKU, unitPrice, qty, total; totals 52 / $995.48); ShippingStatus (Delivered, On Time, tracking #1338940266182); Customer (James Sheehan, Gold Status, phone, email, shipping/billing addresses); Contacts ×2 (Account Manager, Sales Representative)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (navbar #212645 est.)
├─ TITLE "Order 125" + TABS ×4 (Summary active, solid plum)
└─ COLUMNS [1:2:1]
   ├─ SECTION "History" EVENT-FEED(timeline: year chip, date rail, dot spine, 7 bordered event cards, "7 items")
   ├─ SECTION "Items" GRID(4-col, 7 rows + TOTAL row)
   └─ SECTION "Shipping Status" + SECTION "Customer" + SECTION "Contacts"
```
- **Above the fold**: all 7 timeline events, all 7 line items + total, full right rail
- **Reading order**: F — title/tabs, then History → Items → status rail
- **Hierarchy rationale**: Items takes the widest column because money/qty verification is the record's core; timeline sits left as a narrow chronological spine answering "where is it in process"; Delivered + green On Time is the right rail's largest text because status is the #1 glance task
- **Density**: 3 — three full zones, ~20 rows of data, yet airy card/row spacing
- **Ratios & spacing**: columns ≈ [1:2:1] with hairline vertical dividers; timeline cards ≈ STANDARD padding, ≈8px gaps; Items rows roomy with divider lines

### Styling specifics (OBSERVED)
- **Palette**: navbar #212645 (est.); page bg #ffffff; primary plum #9a2b71 (est.); success green #2ebe2e (est.) "On Time"; gold tag bg #d7a51d (est.); border gray #d9d9d9 (est.); metadata gray #757575 (est.)
- **Color application points**: plum on section headers, active tab fill, year chip, timeline dots, customer-name link, truck-icon tint + pale plum icon disc; green only on "On Time"; gold only on "Gold Status"; table fully neutral
- **Typography moves**: "Order 125" LARGE bold; section headers MEDIUM bold plum; timeline: SMALL caps month over LARGE bold day in the date rail, card titles STANDARD bold with SMALL gray "actor · time"; "Delivered" ≈ MEDIUM_PLUS bold; table headers SMALL all-caps; SKUs SMALL gray under item names
- **Imagery stance**: styled icons (truck in pale plum circle ~48px); contact profile photos ~48px; no illustration
- **Card treatment**: timeline event cards white with hairline border, no shadow, square corners; columns separated by rule lines, not cards
- **Signature moves**: instead of one timestamp string per row, the date rail splits MAR/8 typographically and lets the plum dot spine dedupe same-day events; instead of a status column, a solid-plum "2023" year chip anchors the era once; instead of coloring statuses, only two semantic exceptions exist (green on-time, gold tier) on an otherwise plum/neutral page; event cards carry title-first ("Delivered Order") with actor demoted to gray metadata — the mirror of the preview list's actor-first rows
- 
### Component inventory (OBSERVED)
- a!eventHistoryListField(style: timeline, pageSize ≈7 shown, "7 items" count, no tags configured) INFERRED; a!columnsLayout [1:2:1]; a!gridField invoice (7 rows + totals); a!tagField ("Gold Status"); a!buttonArrayLayout-free page — tabs are record views; contact cards = image + stacked text
- Chart types: none
- Interactive affordances: record tabs ×4, customer link, phone/email links, pager none (all 7 events fit)

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — an order file, quietly branded
- **Why it works**: the timeline shows milestones exactly as the page prescribes (events without extra details — no expand affordances, no tags); status/verification/people occupy separate columns so no zone competes; "7 items" count closes the feed with certainty
- **Why not boring**: date-rail typography (caps month over big day) reads calendar-like at a glance; year chip is a chronological landmark most builds omit; green and gold are singular, findable exceptions; SKU-as-gray-subline keeps the invoice scannable
- **Boring twin**: a "History" grid with Timestamp/User/Action columns beside the invoice table, statuses rainbow-coded, addresses in a labeled field stack — accurate, unscannable, and colorless in hierarchy.
- **What to steal**: timeline style for milestone-only histories in a side column; split date typography on the rail; reserve semantic hues for one status word and one tier tag
- **Risks**: page suggests Narrow width when tags are absent — here the History column keeps extra whitespace right of cards; green #2ebe2e (est.) on white is low-contrast at bold-only sizes; three columns reflow long on mobile with contacts last

### Code cross-check
none — page has no SAIL source
