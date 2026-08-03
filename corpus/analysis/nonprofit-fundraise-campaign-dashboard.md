# Analysis: nonprofit-fundraise-campaign-dashboard

## non_profit_fundraising_dash.png

### Identification
- **Image**: non_profit_fundraising_dash.png | **Source page**: nonprofit-fundraise-campaign-dashboard | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) non-profit fundraising campaign dashboard"
- **Device frame**: desktop (3360x2100, full-page site preview with nav chrome)
- **Marker**: neutral
- **UI type**: dashboard-operational (doubles as the "HOME" tab of the site — personal tasks/alerts alongside campaign monitoring)

### Use-case reconstruction (INFERRED)
- **Persona**: fundraising/campaign operations manager at a nonprofit foundation; daily-operator (hourly task timestamps, overdue flags, live %-raised)
- **Domain & brand context**: nonprofit ("Boreas Foundation", polar-bear logo, penguin banner → wildlife/conservation); mission-warm veneer over a working ops tool
- **Top 3 user tasks (ranked)**: 1. Monitor campaign performance (%-raised vs goal) 2. Clear my work queue (tasks, alerts) 3. Launch/administer campaigns and donors
- **Implied requirements**: "Must show portfolio health (5 KPIs + trend) without scrolling"; "Must list all ~17 campaigns with goal and progress in one grid"; "Must flag overdue tasks distinctly"; "Must track personal goals against quota"
- **Data model sketch**: Campaign (name = channel+geo, e.g. "Q3 Search Engine Marketing (US)"; startDate; endDate; goalAmountUSD $195k–$750k; pctRaised 19.5–33.8; category; 17 active); Task (title, assignees: users/groups, timestamp/due, overdue flag) *—* User; Resource (label, type: download|link); Goal (metric, pctOfGoal); Alert (0)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=TRANSPARENT
├─ BILLBOARD h=EXTRA_SHORT overlay=none (photo-only masthead, marginBelow NONE)
├─ CARD(KPI-ROW ×5 showDividers + BUTTON "NEW CAMPAIGN" SOLID LARGE, flush to billboard)
└─ COLUMNS [MEDIUM:AUTO:MEDIUM]
   ├─ SECTION "Alerts" → CARD(empty-state, fixed h=MEDIUM_PLUS)
   │  SECTION "My Tasks" → CARD(5× CARD(task,link) └ CARD(see-all link))
   ├─ SECTION "Active Campaigns" → CARD(GRID(5-col, 15 rows + toolbar + pager))
   └─ SECTION "Actions" → CARD(3× OUTLINE buttons FILL)
      SECTION "Resources" → CARD(4× CARD(stamp+label,link))
      SECTION "My Goals" → CARD(COLUMNS [1:1] gauge×2)
```
- **Above the fold**: everything — banner, KPI band, all three columns incl. 15 grid rows and pager "1 – 15 of 17"
- **Reading order**: F — banner/KPI strip across, then columns; wide center grid anchors
- **Hierarchy rationale**: full-width KPI band first because portfolio health (task 1) precedes detail; center column widest (AUTO) because the campaign grid is the primary working object; the page's only SOLID button (NEW CAMPAIGN) top-right isolates the headline action (task 3)
- **Density**: 4 — 5 KPIs, 15-row grid, 5 task cards, 7 labeled zones in one viewport; SMALL metadata rows
- **Ratios & spacing**: body columns MEDIUM:AUTO:MEDIUM (CODE-VERIFIED); KPI columns spacing "SPARSE" + dividers; card padding "STANDARD" (KPI band), "MORE" (goals), "NONE" (list containers); sections marginBelow "STANDARD"

### Styling specifics (OBSERVED; CODE-VERIFIED when SAIL present)
- **Palette**: page bg #f0f0f0 (est., theme — layout bg "TRANSPARENT"); cards #ffffff (est.); accent #316598 (est., render of ACCENT/SOLID); nav chrome #353f47 + gold #f8cd46 (est., site header); POSITIVE ≈ #5bbd38 (est.), NEGATIVE ≈ #cd2b3d (est.); CODE-VERIFIED: #d9d9d9 (empty-state icon), #d7e5f3/#3d85c6 (download stamps), #d7f3e0/#459b20 (link stamps), #45818e (calls gauge), #a64d79 (donors gauge); neutrals text #222222, secondary #666666–#767676, dividers #dddddd–#eeeeee (est.)
- **Color application points**: accent = grid name links, assignee names, "See All Tasks", pager, SOLID button; POSITIVE/NEGATIVE = caret icons only (delta text stays gray) + OVERDUE tag bg; pastel duotone stamps; two custom gauge hues; SECONDARY gray KPI icons; three OUTLINE SECONDARY buttons
- **Typography moves** (CODE-VERIFIED): KPI values MEDIUM_PLUS STRONG; KPI labels literal ALL-CAPS at STANDARD; section headers labelSize MEDIUM (H2); task titles STANDARD STRONG + preventWrapping; metadata SMALL SECONDARY; "No Alerts" MEDIUM SECONDARY; gauge captions ALL-CAPS
- **Imagery stance**: one photo billboard (penguins, Unsplash) + styled icons only (stamps TINY, richTextIcons SMALL–EXTRA_LARGE)
- **Card treatment**: uniformly style "NONE", showBorder false, showShadow true; KPI band card keeps default border (CODE-VERIFIED)
- **Signature moves**: instead of a tall hero with overlay text, an EXTRA_SHORT photo billboard butted flush to a white KPI card via marginBelow "NONE" on both; instead of a!kpiField, hand-built KPI columns (caps label + icon + MEDIUM_PLUS value + caret delta) in a dividered columnsLayout; instead of bordered list rows, nested linked cardLayouts (container padding "NONE") making every task/resource row clickable; instead of one accent everywhere, duotone stamps type-code resources (blue=download, green=external link); instead of a blank region, a designed empty state (char(10)×4 + EXTRA_LARGE #d9d9d9 icon in a fixed-height card)

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"TRANSPARENT"); a!billboardLayout(height:"EXTRA_SHORT", backgroundMedia:a!webImage); a!cardLayout ×12+ (style:"NONE", showShadow:true, showBorder:false, link:a!dynamicLink on rows); a!columnsLayout(spacing:"SPARSE", showDividers:true, stackWhen PHONE→DESKTOP_NARROW); a!sideBySideLayout(alignVertical:"MIDDLE", width:"MINIMIZE"); a!buttonWidget(style:"SOLID", size:"LARGE") + 3× (style:"OUTLINE", color:"SECONDARY", width:"FILL"); a!tagField(a!tagItem(backgroundColor:"NEGATIVE"), size:"SMALL"); a!gridField(5× a!gridColumn, numeric cols align:"END", pageSize:15); a!stampField(size:"TINY"); a!gaugeField(size:"SMALL", primaryText:a!gaugeIcon); rich text throughout
- Charts: none; gauges use single custom colors (no colorScheme)
- Interactive affordances: grid search, CATEGORY filter, export/filter/refresh, pager (record-data renderings, not in snippet); cards-as-links; 4 buttons

### Character & judgment
- **Register**: warm-community + utilitarian-ops — mission photo and soft shadows wrap a grid-and-queue working tool
- **Why it works**: flush billboard→KPI strip reads as one masthead (brand + health check in ~330px); single SOLID button among OUTLINE peers makes the primary action unmissable; shadow-not-border cards on #f0f0f0 keep 7 zones separable without line noise
- **Why not boring**: penguin masthead where a title bar would be; trend carets colored while delta digits stay gray (color = direction only); pastel duotone stamps instead of bare link icons; two off-accent gauge hues (#45818e, #a64d79); a deliberately designed "No Alerts" state
- **Boring twin**: gray page title, four bordered a!kpiFields, the campaign grid dropped bare on the page bg, actions as a bulleted link list, no imagery, everything default accent blue, Alerts section simply absent when empty
- **What to steal**: butt billboard to a KPI card with double marginBelow "NONE"; linked-nested-card lists (container padding "NONE") for clickable rows; fixed-height empty-state card with oversized pale icon
- **Risks**: green "104%" (#5bbd38 est.) on white ≈ 2.4:1 — fails AA; gray caps micro-labels borderline at small sizes; preventWrapping truncates task titles without tooltip; 5 KPI blocks stack into a long march on tablet (stackWhen incl. TABLET_LANDSCAPE)

### Code cross-check (guidance/sail/sources/nonprofit-fundraise-campaign-dashboard.sail)
- **Code-verified palette**: #d9d9d9 (L331); #d7e5f3+#3d85c6 (L830-831, 940-941); #d7f3e0+#459b20 (L868-869, 904-905); #45818e (L1002); #a64d79 (L1029); all other color is semantic tokens (SECONDARY, POSITIVE, NEGATIVE, ACCENT, STANDARD) or theme default
- **Notable techniques**: photo-only billboard flush to header card via marginBelow "NONE" ×2 (L3-9, L306); ghost spacer column via showWhen: not(a!isPageWidth({...})) (L252-265) + button align if(a!isPageWidth(...), "START", "END") (L277-288); char(10)×4 to center the empty state in a height:"MEDIUM_PLUS" card (L325-344); list-of-linked-cards inside a padding:"NONE" shadow card (L360-727); grid numeric columns align:"END", pageSize:15 (L743-755); gauges with a!gaugeIcon primaryText (L998-1032)
- **Corrections**: the rendered grid toolbar (search, CATEGORY dropdown, export/filter/refresh) and 15 populated rows/pager are NOT in the snippet — a!gridField has no data parameter (L743-755); docs preview injects sample record data; the snippet alone renders an empty grid. Site nav bar is site chrome, not SAIL. Gauge ring pixel reads (#53808c, #9b5377) are anti-aliased blends — code hexes govern. Accent/positive/negative hexes are theme renders, not code values.
