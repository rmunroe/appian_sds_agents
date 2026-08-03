# Analysis: ux-tags

Page: `corpus/pages/ux-tags.md` (section: components). No SAIL source on page — all colors pixel-estimated. Orange circles/arrows (#F29939 est.) in several images are documentation annotation overlays, not UI.

## attribute_tag.png

### Identification
- **Image**: attribute_tag.png | **Source page**: ux-tags | **Alt/caption**: "When displaying details about one item, tags can be used to draw attention to important attributes of that item"
- **Device frame**: desktop
- **Marker**: neutral (orange annotation ring + arrow OBSERVED around the REFERRAL tag — doc overlay)
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: HR onboarding coordinator / recruiter; daily-operator working a queue of incoming hires
- **Domain & brand context**: corporate HR / talent acquisition; Appian-branded demo app ("appian" logo, dark utility chrome); internal ops feel
- **Top 3 user tasks (ranked)**: 1. Check onboarding readiness vs. start date. 2. Chase overdue/at-risk tasks and their owners. 3. Look up the hire's details (contacts, team, hiring timeline).
- **Implied requirements**: "Must show % tasks complete and days-to-start without scrolling"; "Overdue tasks must be flagged and sorted first"; "Every task needs a named owner with role"; "Recruiting funnel dates must show elapsed time between stages"; "Referral status must be visible at identity level, not buried in fields"
- **Data model sketch**: NewHire (first/middle/last, title, dept=Engineering, office=HQ, school=University of Virginia, start 8/5/2019, referral flag, email, phones, candidate type=University, past employee=No) —1:N→ Task (name, assignee, assignee role, due delta; 60 total, 50 done) —N:1→ Staff (Eliza Burgess, Tracy Ball, Brandon Silva…); 1:5 Milestones (Applied 11/5/2018 → Phone Intvw → Onsite → Offer Accepted → Start); 1:3 support team (Manager/Recruiter/Trainer); tasks grouped into 5 departments (Recruiting 7/8, HR 14/18, Finance 9/9, IT 8/11, Engineering 12/14) OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ TOPNAV dark ×3 tabs (NEW HIRES selected) + grid icon + avatar + logo
├─ link "< Back to all new hires"
├─ BILLBOARD h≈180 style=solid #404E64 content=avatar+name+REFERRAL tag | SBS ×3 (Dept/Office/School)
├─ KPI-ROW [donut 83% + "50 of 60" + "Starts in 10 days" | milestone timeline ×5 with day-gap connectors 4d/7d/35d/227d]
└─ COLUMNS [≈1:1]
   ├─ SECTION none: dept progress bars ×5 → people cards ×3 (SBS avatar+name+role) → FORM-style detail grid 3-col ×4 rows
   └─ GRID(10 rows visible) cols = PRE-ONBOARDING TASK | ASSIGNED TO | DUE↑
```
- **Above the fold**: everything shown — banner, gauge+timeline, both columns
- **Reading order**: F
- **Hierarchy rationale**: identity banner first (who + the one handling-changing attribute); readiness strip second (task 1: donut + countdown); task grid gets the tallest zone and red flags (task 2)
- **Density**: 4 — 10 task rows, 5 progress bars, 3 people, 12-field detail grid and a 5-stage timeline in one viewport
- **Ratios & spacing**: body columns ≈ [1:1]; compact rows (`spacing: "DENSE"`-like grid), banner padding ≈ `MORE`, white gutters between zones ≈ `marginBelow: "STANDARD"`

### Styling specifics (OBSERVED)
- **Palette**: page bg #FFFFFF; topnav #2F2F2F (est.); selected tab #5BA5CA (est.); banner #404E64 (est.); accent/link blue #316598 (est.); bar fill #485B7A (est.); success green #58BD38 (est.); overdue red #CD2B3D (est.); REFERRAL tag #A93193 (est.) with white text; gauge/bar remainder #DDDDDD (est.)
- **Color application points**: nav selection; banner background; person-name links; donut fill; five progress bars; Finance bar flips green at 100%; due deltas red only when negative (-3d, -1d); one magenta tag — the only warm saturated hue on the page
- **Typography moves**: name ≈ LARGE_PLUS white with mixed weight ("Kathy" bold, "Gregory" light); job title all-caps SMALL; column headers all-caps SMALL gray; milestone labels all-caps SMALL bold over STANDARD dates; 83% ≈ MEDIUM_PLUS bold; task names STANDARD bold; field labels bold over regular values
- **Imagery stance**: circular photo avatars (hire ≈110px, staff small); no illustration
- **Card treatment**: flat borderless zones on white; banner is the only filled block
- **Signature moves**: instead of listing "Referred By" only in the detail grid, they promoted it to a saturated a!tagField beside the name via the banner's side-by-side; instead of a date table, milestones render as an icon timeline with elapsed-days connectors; instead of raw due dates, signed deltas (-3d…10d) pre-compute urgency; instead of one completion number, per-department bars with in-bar % labels localize the lag (IT 73%)

### Component inventory (OBSERVED → INFERRED)
- a!headerContentLayout with dark styled bar; a!tagField(tags: a!tagItem(text: "REFERRAL", backgroundColor: "#A93193")) inside a!sideBySideLayout INFERRED; a!gaugeField(percentage: 83, secondaryText) INFERRED; milestone strip = richText icons + a!sideBySideLayout chain INFERRED; a!progressBarField ×5 with conditional green color INFERRED; task list = a!gridField(sort DUE asc) with images+links INFERRED; a!columnsLayout [1:1]
- Charts: none — gauge + progress bars only
- Interactive affordances: nav tabs, back link, person record links, sortable DUE column (↑ arrow OBSERVED)

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — grayscale-blue working surface, zero decoration beyond avatars
- **Why it works**: the single #A93193 tag against an all-cool palette is unmissable (the page's stated lesson); red appears exactly twice, on the two overdue items; the timeline turns five dates into a story (227d offer-to-start gap visible at a glance)
- **Why not boring**: magenta tag in the banner rather than a field row; day-gap connectors between milestones; 100% bar flips green; mixed-weight name typography
- **Boring twin**: white page titled "New Hire Details", 15 label/value rows including "Referral: Yes", a "Tasks complete: 50/60" text line, and a grid of raw due dates — urgency and referral status both require reading every row.
- **What to steal**: promote the one attribute that changes handling (referral, VIP, escalated) into a saturated tag beside the record title; render due dates as signed deltas, colored only when negative.
- **Risks**: white on #5BA5CA tab ≈ 2.4:1 contrast (fails AA); red/green bar semantics need a non-color cue; the [1:1] composite stacks very long on mobile.

### Code cross-check
- none — no SAIL source on this page.

## new_tag.png

### Identification
- **Image**: new_tag.png | **Source page**: ux-tags | **Alt/caption**: "A tag is used to highlight a newly added item in a list"
- **Device frame**: desktop
- **Marker**: neutral (orange ring + arrow around the NEW tag — doc overlay)
- **UI type**: portal (employee self-service home)

### Use-case reconstruction (INFERRED)
- **Persona**: any employee ("Charles"), occasional-customer cadence — visits when something breaks or a request is due
- **Domain & brand context**: internal HR/IT services portal; corporate-campus hero photo; institutional-friendly tone
- **Top 3 user tasks (ranked)**: 1. Route to the right help category. 2. Jump to a saved favorite action. 3. Ask a natural-language question via search.
- **Implied requirements**: "Must route six service domains in one glance"; "Search must teach its own usage via example queries"; "Frequent actions must be reachable without category navigation"; "Newly launched services must be discoverable without an announcement page"
- **Data model sketch**: ServiceCategory ×6 (name, blurb, icon); FavoriteLink ×4 per user; HelpfulLink ×4 (label, icon, isNew flag — "Submit Expense Report" tagged NEW); people links with roles (Karen Walton — Benefits Coordinator; Mischa Franklin — Facilities Manager) OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈340 img=glass-campus overlay=center-band,dark scrim content="Hello, Charles."+"What do you need help with?"
└─ COLUMNS [≈2.9:1]
   ├─ SEARCH full-width (italic example placeholder + icon button)
   │  └─ GRID(3-col × 2 rows) CARD(icon+title+subtitle, border, tall)
   └─ BOX "Favorites" ×4 icon links
      └─ BOX "Helpful Links" ×4 icon links (+NEW tag on row 2)
```
- **Above the fold**: hero, search, all six category cards, both right-rail boxes
- **Reading order**: F — hero question → search → card grid, rail last
- **Hierarchy rationale**: the question headline frames the page as a dialog (task 3); six equal cards = no forced priority among domains (task 1); favorites rail keeps power paths one click (task 2)
- **Density**: 2 — editorial: one hero, six airy cards, two link boxes; huge negative space inside cards
- **Ratios & spacing**: main:rail ≈ [2.9:1]; card padding ≈ `MORE`; even ≈24px gutters between cards

### Styling specifics (OBSERVED)
- **Palette**: page bg #FFFFFF; single accent #316598 (est.) for every icon and link; NEW tag #598039 (est.) with white text; card borders #DDDDDD (est.); subtitle gray ≈ #757575 (est.); hero scrim ≈ 55% black band (est.)
- **Color application points**: category icons, link icons/text, search button icon and border — all one blue; the sole green NEW tag; nothing else colored
- **Typography moves**: hero question ≈ EXTRA_LARGE white over SMALL greeting; card titles ≈ LARGE_PLUS dark; card subtitles STANDARD gray; box headings ≈ MEDIUM bold; links STANDARD
- **Imagery stance**: one photographic billboard; flat glyph icons ≈ MEDIUM_PLUS in cards, SMALL inline in links; no photos elsewhere
- **Card treatment**: 1px border, no shadow, white fill (a!cardLayout showBorder: true default look)
- **Signature moves**: instead of a nav menu, six bordered icon cards act as the nav; instead of a "New!" text note, a green a!tagField sits right-aligned on the link row; instead of generic placeholder text, the search teaches with two quoted example queries; greeting is personalized on the scrim

### Component inventory (OBSERVED → INFERRED)
- a!billboardLayout(marginBelow, overlay: a!barOverlay(position: "MIDDLE", style: "DARK")) INFERRED; a!cardLayout ×6 as links with a!richTextIcon(color: "ACCENT", size MEDIUM_PLUS) INFERRED; a!textField(placeholder) + icon a!buttonWidget; Favorites/Helpful Links = bordered a!cardLayout or a!boxLayout with richText icon links; a!sideBySideLayout row hosting link + a!tagField(a!tagItem(text: "NEW", backgroundColor: "#598039")) INFERRED
- Charts: none
- Interactive affordances: cards-as-links, search box, favorite/quick links, external-link icon on "Time Management System"

### Character & judgment
- **Register**: calm-clinical + institutional — one hue, generous space, service-desk politeness
- **Why it works**: strict monochrome (#316598 everywhere) makes the lone #598039 NEW tag the only chromatic outlier — discoverability without a banner; the conversational headline + example queries lower search anxiety; six-card symmetry keeps choice load flat
- **Why not boring**: personalized scrim greeting; example-query placeholder; NEW tag as inline launch announcement; icon+title+subtitle cards instead of a link list
- **Boring twin**: a bulleted sitemap of departments under a stock banner, "NEW!" typed in red text after the link, and a bare search box labeled "Search".
- **What to steal**: keep utility portals one-hue so a single semantic tag can carry "look here"; right-align the tag on the link row via side-by-side.
- **Risks**: white headline needs that scrim on busy photos (present); right-aligned tag can wrap under the link at narrow widths; six cards → single column on phone pushes rail far down.

### Code cross-check
- none — no SAIL source on this page.

## tag_lists.png

### Identification
- **Image**: tag_lists.png | **Source page**: ux-tags | **Alt/caption**: "'Secondary' background color is most often the best choice, especially when displaying multiple tags"
- **Device frame**: desktop
- **Marker**: neutral (four orange arrows point at the gray tag rows — doc overlay)
- **UI type**: record-view (faculty profile)

### Use-case reconstruction (INFERRED)
- **Persona**: department chair / academic administrator reviewing faculty, or student vetting a professor; weekly-to-occasional cadence
- **Domain & brand context**: university faculty directory; scholarly, softly branded via artwork billboard
- **Top 3 user tasks (ranked)**: 1. Assess the professor's output — browse/search publications by topic. 2. Check teaching load and ratings history. 3. Grab contact/office details.
- **Implied requirements**: "Publications must be searchable and sortable"; "Each publication needs topic classification visible at a glance"; "Teaching quality must be comparable across terms"; "Summary stats (tenure, rating, impact) must live in the header"
- **Data model sketch**: Professor (name, title, school, office=Benedict 302, phone, email, education ×3, facultySince=1998, studentRating=4.5, impactGrade=B+) —1:N→ Publication ×4 (title, venue, date, authors, topic tags ×2–3) —M:N→ Topic (HISTORY, LITERATURE, REVIEW, TRADITIONS, ANTHOLOGY, PSYCHOLOGY, PERSPECTIVE PIECE); —1:N→ ClassSection (code JPN nnn, name, term, enrollment or star rating; 3 current, 10 past; JPN 101 Fall '16 rated ≈2.5 red) OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈420 img=samurai-scroll-panorama overlay=bottom-band,dark-gradient
│  content=avatar + "PROFESSOR"/name | KPI-ROW ×3 (Faculty Since 1998 | Student Rating ★4.5 | Impact Grade B+?)
└─ COLUMNS [≈1:1.8:1.9]
   ├─ FORM-style contact stack (TITLE/OFFICE/TELEPHONE/EMAIL/EDUCATION, icon bullets)
   ├─ CARD("Publications", #F0F0F0 header) = search + sort dropdown + UPDATE button + list ×4 (icon+title link, citation line, TAG-ROW ×2–3 gray)
   └─ CARD("Current Classes") list ×3 + CARD("Past Classes") list ×10 (code, link, term, ★rating)
```
- **Above the fold**: banner + all three columns; Past Classes list fully visible
- **Reading order**: F — banner stats, then left-to-right columns
- **Hierarchy rationale**: banner carries the three evaluation KPIs (tenure, rating, impact) because assessment is the visit's purpose; Publications is the widest, toolbar-equipped column (task 1); tags classify each pub without stealing color from links
- **Density**: 3 — three populated columns, 4 pubs + 13 class rows, comfortable padding (borderline 4 on the right rail)
- **Ratios & spacing**: columns ≈ [1:1.8:1.9]; panel header bars #F0F0F0 (est.) with `LESS`-style padding; list rows ≈ `marginBelow: "EVEN_LESS"`

### Styling specifics (OBSERVED)
- **Palette**: page bg #FFFFFF; link/accent #316598 (est.); tag bg #DCDCDC (est.) with #595959 (est.) text; panel header #F0F0F0 (est.); star green #58BD38 (est.); low-rating red #CD2B3D (est.); banner scrim = bottom-up black gradient (est.)
- **Color application points**: every title/class/email link blue; blue circular icon bullets left rail; green stars (rating) in banner and Past Classes; one red 2.5★ row (JPN 101); gray tags — deliberately the least colorful element
- **Typography moves**: name ≈ LARGE_PLUS white, mixed weight ("Margaret" light, "Walton" bold); "1998" ≈ EXTRA_LARGE light; "B+" ≈ LARGE; left-rail labels all-caps SMALL gray; pub titles ≈ MEDIUM link-blue bold; citations STANDARD gray; tags all-caps SMALL
- **Imagery stance**: full-bleed historical artwork billboard; photo avatar; flat blue glyph icons; green/red star glyphs
- **Card treatment**: thin-bordered panels with flat #F0F0F0 header strips; no shadows
- **Signature moves**: instead of colored category chips per topic, all 12 tags wear one muted #DCDCDC — metadata whispers while links speak; instead of numeric ratings, green stars that flip red below threshold; instead of a plain header, domain artwork under a text-protecting gradient; UPDATE as an outline (not solid) button keeps the toolbar quiet

### Component inventory (OBSERVED → INFERRED)
- a!billboardLayout(overlay: a!barOverlay(position: "BOTTOM", style: "DARK")) INFERRED; a!tagField(size: "SMALL", tags ×2–3, backgroundColor: "SECONDARY") per publication INFERRED — this is the page's named "Secondary" usage; a!textField(placeholder: "Type to search") + a!dropdownField("Most Recent") + a!buttonWidget(label: "UPDATE", style outline); richText star icons colored #58BD38/#CD2B3D; a!columnsLayout ×3; class lists as richText rows, not grids
- Charts: none
- Interactive affordances: pub search/sort/update, title links, class links, help "?" icon on Impact Grade

### Character & judgment
- **Register**: institutional + premium-editorial — scroll-painting hero over an otherwise sober academic layout
- **Why it works**: with 12 tags on screen, the uniform gray keeps the Publications panel scannable — links and green stars remain the only signal colors (exactly the page's caption); banner KPIs answer "is this professor good?" before any scrolling
- **Why not boring**: artwork billboard with gradient scrim; letter-grade KPI (B+) beside stars; red-star exception row; mixed-weight name
- **Boring twin**: gray header with name and title, publications as a bulleted citation list with comma-separated keywords, ratings as "4.5/5" text — no topic scanning, no quality flags.
- **What to steal**: when tags appear in multiples per row, drop them to SECONDARY gray; reserve saturated tag colors for singular flags elsewhere.
- **Risks**: #595959 on #DCDCDC ≈ 4.9:1 — passes AA but only at adequate size; white name depends on gradient density over busy art; three columns need deliberate stack order on tablet.

### Code cross-check
- none — no SAIL source on this page.

## Component: Tags — inline placement & text casing (page: ux-tags) [tier B rollup]
Official variant vocabulary: page names "Secondary" background color; casing options mixed-case vs all-caps; Inline Tags pattern for side-by-side placement.

### tag_side_by_side.png
- **Produces it**: a!sideBySideLayout — richText item name + star icons + a!tagField (Inline Tags pattern, per page text)
- **Looks like**: "Anne's Coffee Shop" #2A2A2A (est.), 4.5 stars #F19D38 (est.), tag #316598 (est.) white mixed-case "Local Favorite", one centered row
- **Use when**: one flag beside an item's name | **Avoid when**: many tags per item — clutter
- **Styling hooks**: tag backgroundColor, sideBySide alignVertical CENTER, item spacing
- **Hexes**: above
- **Marker**: neutral

### tag_text_capitalization.png
- **Produces it**: a!tagItem text authored as ALL-CAPS vs Mixed Case — no param; pure content convention
- **Looks like**: identical #DDDDDD (est.) chips, near-black text; caps row reads as uniform equal-height blocks, mixed-case row has ragged x-height
- **Use when**: caps for balanced badge look | **Avoid when**: mixing both casings in one interface
- **Styling hooks**: none — text content only
- **Hexes**: n/a — casing is the dimension
- **Marker**: neutral (both acceptable per page text)

### Page rollup
Default choice for most cases is SECONDARY gray background + ALL-CAPS 1–2-word text, because multiple tags must read as quiet uniform metadata; reserve one saturated color (#316598 accent, #A93193 referral, #598039 new — all est.) for the single attribute that must pop, placed inline via side-by-side.

## tag_text_do.png + tag_text_dont.png

### Principle: Tag with keywords, not sentences
- **DO shows**: three chips — FICTION / HISTORICAL / STAFF FAVORITE — 1–2-word all-caps attributes on #DDDDDD (est.); equal-height, instantly scannable row
- **DON'T shows**: two phrase-length chips — 'Featured in "Staff Favorites" for Septem…' and "Won Pulitzer Prize for Fiction"; the first truncates with an ellipsis, chips balloon to sentence width and read as buttons/messages, not attributes
- **Rule**: tag text is a concise keyword of one or two words; sentences belong in body text or tooltips
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: keep a!tagItem text ≤2 words; tags don't wrap — long text gets cut (OBSERVED truncation); move detail to adjacent richText or the item's record view
