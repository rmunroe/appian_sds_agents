# Analysis: ux-columns-and-side-by-side

All colors pixel-estimated (no SAIL source on this page). `colsbs_1` and `colsbs_3` are the same UCV faculty-profile UI photographed twice with different instructional overlays (red = columns, orange = side-by-side); the full reverse-engineering lives under `colsbs_1`, and `colsbs_3` focuses on what its overlay adds. Tier override on `colsbs_6`: suggested A, treated as tier B — it is a cropped form fragment with teaching arrows, not a full-page UI.

## colsbs_1.png

### Identification
- **Image**: colsbs_1.png | **Source page**: ux-columns-and-side-by-side | **Alt/caption**: "Columns are used to define the overall content arrangement of this page: the billboard is divided into 2 columns and the main body is divided into 3 columns"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (faculty profile). Note: red numbered rectangles (`#ff0002 (est.)`) are documentation overlays marking column boundaries, not UI.

### Use-case reconstruction (INFERRED)
- **Persona**: academic-affairs staff / department administrator at a university; weekly-manager cadence (looking up faculty details, teaching load, performance), with occasional student/registrar visitors.
- **Domain & brand context**: higher education — "UCV" (University of Central Vermont, per the email domain). Collegiate identity: dark plum chrome, magenta accent, scholarly billboard art.
- **Top 3 user tasks (ranked)**: 1. Look up the professor's contact/office details. 2. Review teaching record — current load, enrollments, historical student ratings. 3. Browse/search publications.
- **Implied requirements**: "Contact info must be visible without scrolling"; "Every past class section must show its student rating at a glance"; "Publications must be searchable and re-sortable in place"; "Tenure, rating, and impact metrics must read within the header"; "Current classes must show live enrollment counts."
- **Data model sketch**: FACULTY(name, title, school, office, phone, email, education[3], facultySince=1998, studentRating=4.5, impactGrade=B+) —< PUBLICATION(type: BOOK|ARTICLE, title, venue/publisher, date, coauthors[], coverThumb) [4 shown] ; FACULTY —< CLASS-SECTION(courseCode JPN-xxx, title, term, enrollment 14/8/5, avgRating) [3 current, 11 past]. OBSERVED labels/values.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈35% viewport overlay=bottom-band,dark-scrim
│  └─ COLUMNS [1:1]            ← red "1","2"
│     ├─ SBS avatar-circle + ("PROFESSOR" kicker / name)
│     └─ KPI-ROW ×3 (Faculty Since 1998 | Student Rating ★4.5 | Impact Grade B+)
└─ COLUMNS [1:1.7:1.7]         ← red "1","2","3"
   ├─ stacked contact fields (TITLE/OFFICE/TELEPHONE/EMAIL/EDUCATION)
   ├─ BOX "Publications" (search + sort-dropdown + UPDATE btn; 4-item media list)
   └─ BOX "Current Classes" (3 rows) + BOX "Past Classes" (11 rows, star ratings)
```
- **Above the fold**: everything shown — billboard band plus the top of all three body columns; past-class list runs to the crop edge.
- **Reading order**: F — billboard band left-to-right (identity → metrics), then column tops left-to-right.
- **Hierarchy rationale**: identity (photo + LARGE name) is first because every task starts with "am I on the right person"; evaluation KPIs share the billboard so task-2 metrics are absorbed before scrolling; the two wide right columns hold the dense, scannable lists that tasks 2–3 actually work in.
- **Density**: 3 — balanced product UI: ~18 list rows + 4 media items + 5 contact groups in one viewport, comfortable padding, gray box headers.
- **Ratios & spacing**: billboard columns ≈[1:1]; body ≈[1:1.7:1.7] (narrow metadata rail, two wide work columns); boxes flat with `#f0f0f0 (est.)` header strips; item gaps ≈ STANDARD `marginBelow`.

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; nav `#501b3e (est.)`; accent/links `#c2198b (est.)`; rating stars `#1ac102 (est.)`; box headers `#f0f0f0 (est.)`; body text #222–#333 range (est.); billboard scrim: dark translucent band over artwork.
- **Color application points**: nav bar (plum); all links, email, and the UPDATE button outline (magenta); star ratings incl. half-stars (green, one poor rating in red/gray `#cc2b3e (est.)` range); box header strips (gray); billboard band text (white); red numbered squares = doc annotation only.
- **Typography moves**: name ≈ EXTRA_LARGE white with light-weight first name + bold surname; "PROFESSOR" kicker SMALL all-caps; KPI labels STANDARD bold white, values LARGE; contact labels SMALL all-caps gray; box headers STANDARD semibold; citation lines STANDARD gray.
- **Imagery stance**: full-bleed Japanese battle-scroll painting as billboard (subject-matter of the professor's field); circular avatar with white ring; publication cover thumbnails; tiny person-icons for enrollment.
- **Card treatment**: flat boxes — 1px borders + gray header strips, no shadows; page itself borderless white.
- **Signature moves**: (1) instead of a generic campus photo, the billboard artwork is drawn from the record's own discipline (Japanese literature → ukiyo-e scroll) via billboard backgroundMedia per record; (2) instead of a KPI row below the header, metrics sit inside the billboard's dark overlay band (columns within overlay); (3) instead of numeric ratings, green half-step stars give instant per-course quality scanning; (4) a letter-grade KPI ("Impact Grade B+") borrows academic vocabulary for the domain; (5) two-accent system — magenta for interaction, green only for ratings.

### Component inventory (OBSERVED, INFERRED constructs)
- `a!headerContentLayout` + `a!billboardLayout(backgroundMedia: scroll image, overlay: a!barOverlay(position:"BOTTOM", style: dark translucent))` containing `a!columnsLayout` [1:1]; `a!sideBySideLayout` for avatar+name.
- Body `a!columnsLayout` ×3; `a!boxLayout(style:"STANDARD")` ×3 ("Publications", "Current Classes", "Past Classes").
- Toolbar: `a!textField` (search placeholder), `a!dropdownField` ("Most Recent"), `a!buttonWidget("UPDATE", style outline/secondary)`.
- Publication rows: image thumb + rich text (type icon+label, magenta title link, citation) — media-list pattern.
- Class rows: record links (magenta) + rich-text star icons; enrollment counts + person icons.
- Charts: none. Custom colorScheme: n/a.
- Interactive affordances: in-box search/sort/update, record links throughout, nav tabs, avatar menu.

### Character & judgment
- **Register**: institutional + premium-editorial — collegiate plum/magenta plus museum-quality header art.
- **Why it works**: the dark scrim band keeps white KPI text legible over busy artwork; the [narrow:wide:wide] split matches information scent (metadata vs. working lists); a single magenta link color makes every clickable target self-evident among dense rows.
- **Why not boring**: discipline-specific billboard art personalizes each record; letter-grade + star KPIs instead of raw numbers; magenta-on-plum brand instead of default enterprise blue; half-star precision signals real data, not decoration.
- **Boring twin**: white page, name in plain LARGE black text, one long column stacking Contact → Publications → Classes as bordered sections, default blue links, ratings as "4.5/5" text, no header image or KPIs.
- **What to steal**: put record KPIs inside the billboard overlay band; source header imagery from the record's subject; give identity metadata a narrow first column and let work lists take the width.
- **Risks**: white text over artwork depends entirely on scrim opacity (some regions borderline); on phones the 3 columns flatten — contact rail stacks first, pushing classes far down; green/red star distinction weak for colorblind users; magenta links at SMALL sizes flirt with contrast minimums.

### Code cross-check
none — no SAIL source on this page.

## colsbs_3.png

### Identification
- **Image**: colsbs_3.png | **Source page**: ux-columns-and-side-by-side | **Alt/caption**: "The orange outlines show all the places in this UI where side by side layouts are used to precisely arrange components within the overall columns of the page"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view — identical UCV faculty profile as colsbs_1; this shot's content is the orange SBS census (`#f4a83c (est.)` outlines, doc overlay not UI).

### Use-case reconstruction (INFERRED)
- **Persona / Domain / Tasks / Requirements / Data model**: same as colsbs_1 (same pixels beneath the overlay).

### Layout anatomy (OBSERVED)
- **Skeleton**: same as colsbs_1. The overlay enumerates every `a!sideBySideLayout` instance inside those columns, ≈23 total:
  - Billboard: identity group (photo | kicker/name) and each KPI (label/value groups) — 4 outlined clusters.
  - Publications toolbar: search input | sort dropdown | UPDATE button as one 3-item SBS.
  - Each publication row (×4): cover thumbnail | text block (type, title, citation).
  - Each class row (×3 current, ×11 past): course code | title(+term) | right-aligned metric (enrollment or stars) — code and title cells outlined separately from the metric cell.
- **Counter-example inside the same shot** (OBSERVED): the left contact column has zero outlines — its icon+label rows are plain stacked fields/rich text, showing SBS is reserved for genuinely horizontal reading groups, not every icon-text pairing.
- **Above the fold / Reading order / Density / Ratios**: same as colsbs_1 (density 3; body ≈[1:1.7:1.7]).
- **Hierarchy rationale**: the overlay teaches the two-level system — columns set the macro zones (vertical reading), SBS handles micro alignment (horizontal reading: thumb-then-text, code-then-title-then-metric) that must survive as a row on mobile.

### Styling specifics (OBSERVED)
- **Palette / typography / imagery / cards**: same as colsbs_1; overlay stroke `#f4a83c (est.)` ~3px.
- **Signature moves**: repeated row template (code | link | metric) makes 14 class rows scannable as a virtual grid built from SBS, not `a!gridField` — keeping magenta record links and star rich text inside each row.

### Component inventory (OBSERVED → INFERRED)
- Same as colsbs_1, with the addition made explicit by the overlay: `a!sideBySideLayout` with `a!sideBySideItem(width:"MINIMIZE")` for thumbnails, codes, and metric cells; `width:"AUTO"` for titles; toolbar SBS aligns field + dropdown + button on one baseline.

### Character & judgment
- **Register**: institutional + premium-editorial (unchanged).
- **Why it works**: SBS keeps each row's members welded together horizontally on any device — exactly the relationships (thumb↔title, code↔rating) that would break if columns were misused for them.
- **Why not boring**: list "grids" hand-built from SBS rows keep rich content (icons, stars, links) that a plain data grid would flatten.
- **Boring twin**: the same data forced into three `a!gridField`s — losing thumbnails, star glyphs, and the tight toolbar.
- **What to steal**: use SBS for every thumbnail+text and label+metric row; MINIMIZE fixed cells, AUTO the title cell; never use columns for intra-row pairs.
- **Risks**: same as colsbs_1; additionally, hand-built SBS lists forgo grid affordances (sorting, selection) — acceptable here because the toolbar supplies sort.

### Code cross-check
none — no SAIL source on this page.

## colsbs_6.png

Tier override: batch suggested A; analyzed as tier B — cropped checkout-form fragment duplicated twice with instructional arrows (columns flow vs. SBS flow), not a full-page UI.

## Component: lateral arrangement — columns vs. side-by-side (page: ux-columns-and-side-by-side)
Official variant vocabulary: columns layout (vertical meaning) · side by side layout (horizontal meaning)

### columns flow (top half, red down-arrows `#ff686e (est.)`)
- **Produces it**: `a!columnsLayout` [1:1] — "Payment Information" | "Billing Address" (orange `#ffaa00 (est.)` MEDIUM headings).
- **Looks like**: two independent form stacks; big red arrows run top-to-bottom through each column.
- **Use when**: sections are read independently, top-to-bottom. | **Avoid when**: items form one horizontal phrase.
- **Styling hooks**: column count/widths; stacks flatten vertically on phones.
- **Pairs well with**: section headings, checkout/detail forms.
- **Marker**: neutral

### side-by-side flow (bottom half, blue right-arrows `#257fff (est.)`)
- **Produces it**: `a!sideBySideLayout` rows inside those columns — Card Number | CVV | card-brand icon; Month | Year; Street | Unit #; State | ZIP.
- **Looks like**: same form; blue arrows run left-to-right through each field group.
- **Use when**: fields are comprehended as one left-to-right unit. | **Avoid when**: relation between neighbors is incidental.
- **Styling hooks**: item widths (MINIMIZE icon cell), alignment; rows persist horizontally on mobile.
- **Pairs well with**: date/address/credit-card field groups, field+icon pairs.
- **Marker**: neutral

### Page rollup
Default choice is columns for macro page zones and side-by-side for micro field groups because meaning follows reading direction: columns are read down (and flatten on phones), SBS is read across (and stays a row) — misusing one for the other breaks either mobile stacking or field grouping.
