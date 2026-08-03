# Analysis: ins-agent-home-page

## ins_agent_home_page.png

### Identification
- **Image**: ins_agent_home_page.png | **Source page**: ins-agent-home-page (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) insurance agent home page"
- **Device frame**: desktop (3456x2160, 2x retina, no browser chrome; tier A confirmed — full-page screenshot)
- **Marker**: neutral
- **UI type**: home-page (operational daily-driver)

### Use-case reconstruction (INFERRED)
- **Persona**: insurance agent "Denise Simmons" — individual contributor, daily-operator; this is the first screen of her workday.
- **Domain & brand context**: P&C insurance ("INSURECORP"); warm consumer-adjacent brand — orange logo + greeting accent and a hand-drawn neighborhood illustration soften a working tool.
- **Top 3 user tasks (ranked)**: 1. Clear today's assigned tasks, overdue first. 2. See today/this week in calendar context. 3. Catch up on @mention conversations and launch New Client/Claim/Quote.
- **Implied requirements**: "Overdue work must be flagged above the fold"; "Ownership (me vs. WeHo Office queue) visible per task"; "Month view with per-day task markers without leaving home"; "One-click creation of clients, claims, quotes"; "@mentions must carry linked-claim context inline."
- **Data model sketch** (OBSERVED off labels): Task(title, client, assignees 1..n, dueDateTime, overdue) ×5; CalendarEvent(date, category → bullet shape/color, title) ×6; Message(author, initials, timestamp, body, @mention, linkedClaim 0..1) ×2; Claim(number "#431-914-53", type AUTO|HOMEOWNER, date); people DS/YK/JK/CB; unit "WeHo Office".

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#f4f2f1 contentsPadding=MORE (top INSURECORP nav = site chrome, not in SAIL)
├─ SBS greeting: orange icon + "Good morning, Denise" + line-art illustration + date  marginBelow=EVEN_MORE
└─ COLUMNS [MEDIUM:AUTO:MEDIUM] spacing=SPARSE
   ├─ SECTION "My Tasks"+"View all tasks" → CARD(task, shadow no-border) ×5
   ├─ SECTION "Calendar"+"Go to full calendar" → CARD(month-nav bar / weekday row / GRID(7-col, 5 rows), dividers)
   └─ SECTION "Actions"+"Manage" → CARD(icon-stamp + label) ×3
      SECTION "Conversations"+"View all threads" → CARD(message + nested claim chip) ×2
```
- **Above the fold**: everything — a single-viewport composition; no scrolling implied.
- **Reading order**: F — greeting bar across, then left task rail down, sweeping right through calendar to actions/conversations.
- **Hierarchy rationale**: greeting is the largest text — orients and, with the right-edge date, anchors "today" (Nov 15 bold in grid); tasks sit leftmost because clearing work is task 1, and OVERDUE is the only saturated red on screen; calendar gets the AUTO center column because 7 day-columns need the width.
- **Density**: 4 — the conventions' level-4 anchor: 5 task cards + 35-cell month grid + 3 actions + 2 threads in one viewport, metadata at SMALL.
- **Ratios & spacing**: CODE-VERIFIED columns [MEDIUM:AUTO:MEDIUM], spacing SPARSE, stackWhen PHONE/TABLET_PORTRAIT; task cards padding STANDARD, marginBelow STANDARD; calendar card padding NONE; page contentsPadding MORE.

### Styling specifics (CODE-VERIFIED)
- **Palette**: page bg #f4f2f1 warm greige; cards white (style:"NONE"); headings #54514e grey-brown; metadata #666666/#555555; greeting icon #ee7955 orange; links = ACCENT token (renders ≈#4a72d1 (est.)); calendar chrome #f3f3f3 (phone variant #f7f7f7/#efefef); pastel identity set — stamps #d19fcb, #79b096, #ccc, #eccd5f, #9dd0aa; action stamps #de8cb7/#b094da/#6fbb62 (contentColor #ffffff); tags OVERDUE=NEGATIVE, AUTO #9db6d0, HOMEOWNER #9dd0ae; claim-chip tile #674ea7 on #d9d2e9; event bullets #6d9eeb circle, #93c47d square, NEGATIVE triangle.
- **Color application points**: identity/action stamps, tag backgrounds, calendar bullets + weekday header fills, claim-chip icon tile, ACCENT links/@mentions, greeting icon. No colored header bar, no colored buttons — color lives only in small chips, so red OVERDUE monopolizes alarm.
- **Typography moves**: greeting LARGE STRONG #54514e; date MEDIUM; section headers MEDIUM_PLUS STRONG; card titles STANDARD STRONG; metadata SMALL #666666; day numbers MEDIUM (today STRONG, adjacent month SECONDARY); all-caps weekday labels and tags. No EXTRA_LARGE anywhere.
- **Imagery stance**: one hand-drawn line illustration (imageField EXTRA_LARGE, hidden below desktop widths) + photo avatar in chrome; otherwise icon stamps only.
- **Card treatment**: shadow-not-border everywhere — showShadow:true, showBorder:false, shape ROUNDED, style NONE; nested claim chips invert it (showBorder:true, showShadow:false, SEMI_ROUNDED, padding NONE).
- **Signature moves**: instead of a stock picker, a hand-built month grid via 7-col a!columnsLayout(spacing:"NONE", showDividers:true) + a!horizontalLine rows + fixed-height transparent day cards; instead of bordered clickable rows, whole-card a!dynamicLink + shadow; instead of a KPI row, TINY pastel a!stampField as avatar-and-action language; instead of a text link, an embedded claim mini-card with EXTRA_NARROW icon-tile column; instead of one fluid layout, a separate phone agenda list and a duplicated medium-width calendar block.

### Component inventory (OBSERVED → CODE-VERIFIED)
a!headerContentLayout(backgroundColor:"#f4f2f1", contentsPadding:"MORE", header:{} — nav is site chrome); a!cardLayout ×117; a!sideBySideLayout ×91; a!richTextDisplayField ×162; a!columnsLayout ×20; a!stampField ×12 (size:"TINY", custom backgroundColor); a!tagField ×3; a!dropdownField ×2 (Day/Week/Month, value:3, hidden on PHONE); a!imageField ×1; a!horizontalLine ×12; a!dynamicLink ×22 (cards-as-links); a!isPageWidth ×18. Charts: none. Affordances: month chevrons, view dropdown, "View all" links, ellipsis + reply menus, every card clickable.

### Character & judgment
- **Register**: warm-community + utilitarian-ops — pastel chips, greeting, and line art wrapped around a dense working tool.
- **Why it works**: one red OVERDUE tag against a greige-plus-pastel field makes triage instant; #f4f2f1 canvas under white shadowed cards keeps ~11 zones legible with zero borders; greeting/date bar doubles as calendar context (bold 15 in grid).
- **Why not boring**: warm greige canvas instead of default white; hand-drawn neighborhood illustration filling dead header space; a coordinated 8-hex pastel stamp system standing in for avatars, actions, and tags; shape-coded calendar bullets (triangle/circle/square) encoding category and severity inside plain richText.
- **Boring twin**: white page, solid blue header bar, task a!gridField with due-date column, a 4-up KPI row, "Quick Links" buttons, notifications in a plain grid — and no calendar at all.
- **What to steal**: shadow-only clickable cards on a tinted page background; TINY pastel stampField as a unified identity/action language; bordered flat chip nested inside a shadowed card for linked records.
- **Risks**: SECONDARY adjacent-month numbers and the #ccc "+3" stamp run low-contrast; preventWrapping hard-truncates event titles ("Review new…"); pastel tag text on #9db6d0 is borderline; on phone the 3-column stack pushes Conversations far below the fold.

### Code cross-check (guidance/sail/sources/ins-agent-home-page.sail)
- **Code-verified palette**: all 23 hexes in Styling above are read from source (full census, none pixel-guessed) + tokens NEGATIVE/ACCENT/SECONDARY/STANDARD; only the ACCENT render value is (est.).
- **Notable techniques**: local!dayHeight:"SHORT" (L2) driving uniform transparent day cards (e.g. L1124); responsive local!headerPadding (L564) shrinks weekday-header padding off DESKTOP_WIDE; empty 1X spacer columns fake gutters at TABLET_LANDSCAPE/DESKTOP_NARROW (L90, L2819, L4281); whole duplicated calendar block for medium widths gated by showWhen:not(...) (L2837–4298) plus if(a!isPageWidth("PHONE")) agenda variant (L681); claim chip = bordered SEMI_ROUNDED card, padding NONE, EXTRA_NARROW #674ea7-on-#d9d2e9 icon tile, columnsLayout spacing NONE (L2539–2632).
- **Corrections**: rendered greeting icon is a waving hand but code L14 says icon:"sun" — screenshot likely from a newer revision; icon name unverified, color #ee7955 stands. Top INSURECORP nav bar is not in the SAIL (header:{}, L4) — site chrome, don't attribute. The header illustration is an empty imageField placeholder (L47 "/*Insert image here*/") — artwork not reproducible from source. "View all tasks" is a real a!dynamicLink (linkStyle STANDALONE, L126–133); "Manage"/"Go to full calendar"/"View all threads" are plain ACCENT text, non-interactive in the sample.
