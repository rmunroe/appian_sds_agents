# Analysis: comment-thread

Page context: "Comment Thread" pattern (section: patterns). SAIL source exists for all three variants (Full page, With replies and attachments, Widget) → CODE-VERIFIED throughout. Screenshots wrap the pattern in a "Boreas Foundation" demo site whose chrome is not in the snippets.

## comment-thread.png

### with-replies-and-attachments (page: comment-thread)
Official variant vocabulary: Full page · With replies and attachments · Widget

- **Produces it**: a!cardLayout per comment (border #eee, ROUNDED); collapsible sectionLayout "Replies (2)" EXTRA_SMALL; reply cards #FAFAFC borderless; attachment cardGroupLayout NARROW_PLUS DENSE, icon tile #EDEEFA/#152B99; stampField initials #e21496 TINY (CODE-VERIFIED)
- **Looks like**: bordered comment cards, magenta initial stamps, file chips ("PDF - 215 KB"), composer with compact file-drop + SOLID post button
- **Use when**: replies to specific comments or evidence attachments | **Avoid when**: a flat stream suffices
- **Styling hooks**: nested gray reply cards, disabled-until-input buttons, dropZoneStyle "COMPACT"
- **Pairs well with**: case/record detail (lost-package case shown)
- **Hexes**: #e21496, #EDEEFA, #152B99, #FAFAFC
- **Marker**: neutral

### Page rollup
Default is the Full page layout; add this replies+attachments variant only when threading/evidence is required, and keep the Widget for side-by-side placement.

## image39.png

### Identification
- **Image**: image39.png | **Source page**: comment-thread | **Alt/caption**: none (heading: "Full page")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — full-page discussion thread inside a case record

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit marketing team member, weekly collaborator brainstorming on a campaign case
- **Domain & brand context**: "Boreas Foundation" nonprofit; sober slate-and-gold institutional chrome around an airy white thread
- **Top 3 user tasks (ranked)**: 1. Read the topic post and skim all comments 2. Post a comment 3. Return to the topic list / switch record tabs
- **Implied requirements**: "Must keep long posts readable (measure ≈ 65-75 chars)"; "Must let users skim threads by scrolling, not paging"; "Must timestamp relatively ('4 days ago')"; "Must clamp long comments behind '...more'"
- **Data model sketch**: Topic{title, author, postedAt, body} 1—* Comment{author, avatar, body, postedAt}; "4 Comments" count visible; record tabs Summary/Ads/Gifts/Donors/Discussion imply Campaign 1—1 Discussion (OBSERVED labels)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (backgroundColor WHITE)
├─ site bar (dark slate) + record title "Q3 Search Engine Marketing (US)"
├─ TABS ×5 (Discussion selected)
└─ COLUMNS [empty:WIDE:empty]  ← centered reading column
   └─ SECTION "Let's brainstorm ideas…" (LARGE)
      ├─ back-link "‹ Back to all topics"
      ├─ SBS: avatar(SMALL) + author/date + post body (MEDIUM)
      ├─ "4 Comments" (MEDIUM STRONG)
      ├─ composer: avatar(TINY) + paragraphField + "POST COMMENT" (SOLID, align END)
      └─ comment rows ×4: avatar(TINY) + rich text block
```
- **Above the fold**: title, back link, full topic post, comment count, composer, first comment
- **Reading order**: single-column
- **Hierarchy rationale**: topic title is the only LARGE text → task 1; composer sits above the comment list → posting (task 2) is promoted over lurking; empty side columns exist purely to cap line length
- **Density**: 2 — one content zone, huge margins; editorial reading page
- **Ratios & spacing**: center column ≈ 46% of viewport (WIDE token between two empty columns); marginAbove/Below "MORE" between thread blocks (CODE-VERIFIED)

### Styling specifics (OBSERVED; CODE-VERIFIED where SAIL present)
- **Palette**: page/card bg #ffffff (backgroundColor:"WHITE" CODE-VERIFIED); site bar #2e3d45 (est.); nav underline gold #f0b428 (est.); selected tab pill #205f83 (est.); link/button blue #1c6a9e (est.); secondary text "SECONDARY" token (≈ #6c6c75)
- **Color application points**: chrome only (site bar, tab pill, gold accent); inside the thread color is limited to link blue and one SOLID button — content stays ink-on-white
- **Typography moves**: author names STRONG (MEDIUM on the post, STANDARD in comments); timestamps SECONDARY (STANDARD/SMALL); body MEDIUM for the post vs default for comments — the original post reads "louder" than replies; "...more" STRONG link truncation
- **Imagery stance**: circular photo avatars (style:"AVATAR"; SMALL for topic author, TINY for commenters)
- **Card treatment**: none — flat white; separation by whitespace alone
- **Signature moves**: instead of boxing each comment in a card, avatar+text rows with MORE margins (forum feel, less chrome); instead of fixed dates, relative timestamps; avatar size encodes role (SMALL poster vs TINY commenters); composer avatar mirrors "you" into the thread before you type
- **Component inventory (CODE-VERIFIED)**: a!sectionLayout(labelSize:"LARGE"), a!richTextItem(link: a!safeLink, linkStyle:"STANDALONE") back-link, a!imageField(style:"AVATAR", size:"SMALL"/"TINY"), a!paragraphField(height:"MEDIUM", refreshAfter:"UNFOCUS"), a!buttonArrayLayout(align:"END") + a!buttonWidget(style:"SOLID"), char(10) paragraph breaks, columnsLayout [EXTRA_NARROW + AUTO] for the post; no charts

### Character & judgment
- **Register**: warm-community + institutional — human avatars and relative time inside sober foundation chrome
- **Why it works**: centered WIDE column caps measure so lorem-length posts stay readable; a single SOLID button makes the one action unmistakable; avatar/name/timestamp rhythm gives fast scanning anchors
- **Why not boring**: empty flanking columns as deliberate negative space; "...more" clamp keeps the wall-of-text risk contained; role-scaled avatars
- **Boring twin**: full-width comments each in bordered gray cards, absolute datetimes, Reply/Edit/Delete icon rows on every comment, pagination every 10 comments.
- **What to steal**: empty-column centering for reading pages; promote the composer above the list; relative timestamps SECONDARY
- **Risks**: no reply/threading affordance at all (by design — see other variants); gray timestamp SMALL text borderline contrast; centered column wastes width on dense-monitor users

### Code cross-check
- **Code-verified palette**: backgroundColor "WHITE"; all other chrome colors are demo-site chrome outside the snippet (estimates above)
- **Notable techniques**: columnsLayout with two empty a!columnLayout(contents:{}) flanks + width:"WIDE" center (~L21-27,328-330); avatar column width:"EXTRA_NARROW" with spacing:"DENSE" (~L47-115); nested richTextItem "...more" link inside body text (~L188-197); a!safeLink for external navigation (~L39-45)
- **Corrections**: none — screenshot matches code; site chrome/tabs are extra-snippet

## image45.png

### Identification
- **Image**: image45.png | **Source page**: comment-thread | **Alt/caption**: none (heading: "Widget")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical — campaign summary with comment-thread side widget

### Use-case reconstruction (INFERRED)
- **Persona**: campaign manager, weekly-manager reviewing gift performance and team chatter in one place
- **Domain & brand context**: Boreas Foundation fundraising campaign ("Q3 Search Engine Marketing (US)")
- **Top 3 user tasks (ranked)**: 1. Check gift totals and performance breakdowns 2. Skim/append discussion without leaving the summary 3. Update or delete the campaign (record actions)
- **Implied requirements**: "Comments must live in their own column so threads scroll independently of data"; "KPIs must lead the page"; "Record actions must stay in the header, not the body"
- **Data model sketch**: Campaign{gifts:4150, uniqueDonors:4103, minGift:$5.00, maxGift:$1000.00} 1—* Gift{region, urbanicity, donorAge} (donut/bar categories) ; Campaign 1—* Comment (4 shown)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ site bar + record title + actions [UPDATE CAMPAIGN][DELETE CAMPAIGN]
├─ TABS ×5 (Summary selected)
└─ COLUMNS [≈2:1]
   ├─ PANE[left]
   │  ├─ SECTION "Gift Stats" → KPI-ROW ×4 (white card, dividers)
   │  └─ SECTION "Performance Breakdown" → CARD(GEOGRAPHIC: CHART(donut)×2; DEMOGRAPHIC: CHART(column))
   └─ PANE[right] SECTION "Comments" → composer + "4 Comments" + comment rows
```
- **Above the fold**: KPI band, both donuts, top of demographic chart, composer + first two comments
- **Reading order**: F — KPIs across, then down the charts; comments rail scanned second
- **Hierarchy rationale**: numbers get EXTRA_LARGE-ish weight and first position (task 1); comments occupy a persistent narrow rail (task 2) rather than a bottom section; destructive/record actions isolated in dark header (task 3)
- **Density**: 3 — six zones visible with comfortable card padding
- **Ratios & spacing**: main:rail ≈ 2:1; KPI card divided into 4 equal stat cells; gray page bg #efefef (est.) with white shadow cards

### Styling specifics (OBSERVED; widget portion CODE-VERIFIED)
- **Palette**: page bg #efefef (est.), cards #ffffff, site bar #2e3d45 (est.), gold accent #f0b428 (est.), donut purples #2d2a72/#5a55a5/#8a86c8/#b9b6de (est.), donut blues #1670c0/#4aa3e8/#a8d4f5 (est.), bar blue #5b9bd5 (est.), link blue #1c6a9e (est.), stamp fallback #3c78d8 (CODE-VERIFIED for "CH" initials stamp)
- **Color application points**: chart series only (monochromatic families per chart), KPI numerals near-black, gold reserved for page-title bar, blue for links/buttons
- **Typography moves**: KPI values ≈ LARGE_PLUS bold with STANDARD gray labels above; section headings MEDIUM STRONG ("Gift Stats", "Comments"); all-caps sub-labels GEOGRAPHIC/DEMOGRAPHIC = secondary headings in-card; comment names STRONG with SMALL SECONDARY timestamps
- **Imagery stance**: photo avatars (TINY) + initials-stamp fallback; no illustrations
- **Card treatment**: white cards with subtle shadow, no borders, on gray bg
- **Signature moves**: instead of one rainbow palette, each donut gets its own monochrome family (purples=region, blues=urbanicity) so adjacent charts don't bleed; comments as a column per the page's own guidance ("display comments in their own column… minimize paging"); a!sectionLayout(divider:"BELOW") separates composer from list (CODE-VERIFIED)
- **Component inventory**: widget = paragraphField composer + buttonArrayLayout END + richText "4 Comments" MEDIUM STRONG + avatar/stamp sideBySide rows (CODE-VERIFIED); dashboard = KPI band (pattern, not in snippet), 2× pie DONUT with LEGEND below, 1× column chart (% of total by age band) (OBSERVED)
- **Register**: authoritative-executive + warm-community — hard numbers left, human voices right
- **Why it works**: rail keeps conversation visible during data review (the page's stated intent); monochrome chart families keep 3 charts calm; record actions quarantined in the header
- **Why not boring**: per-chart color families instead of default multi-hue; all-caps in-card secondary labels create hierarchy without more cards; comments given equal-citizen column, not an afterthought tab
- **Boring twin**: full-width dashboard with comments in a separate "Discussion" tab nobody opens, rainbow default chart palette, Update/Delete buttons floating beside the KPIs.
- **What to steal**: side-rail comment column beside dashboards; one monochrome family per adjacent chart; divider:"BELOW" under composers
- **Risks**: rail comments get long — needs "...more" clamps (present in code); light blue #a8d4f5 slice labels-by-legend only, hover needed for values; donut pairs lack data labels

### Code cross-check
- **Code-verified palette**: stamp #3c78d8; contentColor "STANDARD"; the dashboard's chart colors are not in the snippet (estimates)
- **Notable techniques**: widget snippet is chrome-free — sectionLayout(divider:"BELOW") composer block (~L966-1005); "4 Comments" richText header (~L1006-1017); stampField initials fallback for avatar-less user (~L1144-1152)
- **Corrections**: none — snippet corresponds to the right rail only; left dashboard is out-of-snippet context
