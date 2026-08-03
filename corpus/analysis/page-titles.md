# Analysis: page-titles

Cross-refs (analyzed under their primary pages): `image44.png` (Title bar header) and `image11.png` (No page title — nav-tab-only identity) → see `corpus/analysis/page-headers.md`; `image47.png` (Prominent page title — SAIL here CODE-VERIFIES `a!sectionLayout(labelSize:"LARGE_PLUS", labelColor:"STANDARD", marginAbove/Below:"EVEN_MORE")`) and `image87.png` (Title bar header alternative — card `style:"#03122a"`, heading LARGE_PLUS LIGHT) → analyzed under their primary pages.

## image27.png

### Identification
- **Image**: image27.png | **Source page**: page-titles | **Alt/caption**: "screenshot of a dashboard with a divider line" (heading: "Standard page title with divider line")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical (team performance)

### Use-case reconstruction (INFERRED)
- **Persona**: branch sales manager at a mortgage lender, weekly-manager cadence; reviews loan-officer performance
- **Domain & brand context**: "Thatcher." — home-lending/financial brand; deep plum identity, serif wordmark; polished corporate
- **Top 3 user tasks (ranked)**: 1. Compare officers on closed loan value (leaderboard) 2. Check quarter progress against team goal 3. Spot satisfaction outliers and quarterly trends per officer
- **Implied requirements**: "Rankings must be personal (faces + ordinals), not just a sorted grid"; "Goal progress must distinguish closed vs closed+scheduled"; "Low satisfaction must be flagged semantically"; "Title must stay distinct from four competing section headings" (the divider's stated purpose)
- **Data model sketch**: LoanOfficer(name, avatar, closedValue $MM, satisfaction 1–5, quarterly closed value Q1–Q4) ×4; TeamGoal(target $15.00MM, closed $10.64MM=71%, closedPlusScheduled $16.37MM=109%) — all read off pixels (OBSERVED)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV plum (Thatcher., PERFORMANCE active underlined)
SECTION "Performance Dashboard" divider=ABOVE-CONTENT thin
└─ COLUMNS [1:1]
   ├─ CARD(rank list ×4: ordinal+avatar+name+$)  "Loan Value Leaderboard"
   │  CARD(rank list ×4: ordinal+avatar+name+score+stars) "Customer Satisfaction Leaderboard"
   └─ CARD(2× CHART(gauge) + fractions + caps labels) "Q4 Team Goals"
      CARD(CHART(column, grouped ×4 series)) "Quarterly Performance"
```
- **Above the fold**: title + divider, both leaderboards, both gauges, full column chart — the whole page
- **Reading order**: F — title, then left column (people) and right column (aggregates)
- **Hierarchy rationale**: H1 + full-width divider claims the top band so four plum section headings below can't be mistaken for the page title (exactly the documented rationale); leaderboards left because people-ranking is the manager's habitual first scan; goals/trends right as context
- **Density**: 3 — four content zones, ~20 data rows/marks visible, comfortable card padding (balanced product UI)
- **Ratios & spacing**: two equal columns; bordered cards with ≈STANDARD padding; title marginBelow ≈ STANDARD before section row

### Styling specifics (OBSERVED)
- **Palette**: nav/brand plum #6E1D45 (est.); section headings plum/magenta #A62667 (est.); page bg #FFFFFF; card borders #DDDDDD (est.); money values #757575 (est.) gray; gauge blue #2196D9 (est.), gauge green #21BA45 (est.); stars/scores green #21A044 (est.) / gray #9E9E9E (est.) / red #D42A2A (est.); chart series = 4-step plum→pink ramp #7A2050 → #E58BB8 (est.)
- **Color application points**: brand plum on nav, section headings, and chart ramp (identity); semantic green/gray/red only on satisfaction scores+stars; gauges blue (progress) vs green (achieved ≥100%); the H1 itself is neutral near-black — color marks sections, not the title
- **Typography moves**: page title LARGE, STANDARD color, H1, with thin divider below; section labels ≈ MEDIUM in accent plum; rank ordinals rendered as large numeral + small raised suffix ("1 ST") — typographic podium; names STANDARD STRONG; money ≈ LARGE_PLUS light-gray right-aligned; gauge numerals ≈ EXTRA_LARGE with small % ; all-caps SMALL labels under gauges
- **Imagery stance**: circular user avatars (photo) ×8; star glyph ratings; no decorative imagery
- **Card treatment**: border, no shadow, square corners, white fill — quiet frames
- **Signature moves**: instead of a grid sorted by value, a podium list (ordinal + avatar + big right number) via columns/sideBySide; instead of one gauge, paired gauges separating "closed" from "closed+scheduled" (71% blue / 109% green tells "behind now, ahead soon" in two marks); satisfaction encodes value twice (colored number + colored stars); chart ramp derived from brand hue rather than default multicolor
- **Density**: (above) 3

### Component inventory (OBSERVED)
- `a!sectionLayout(label:"Performance Dashboard", labelSize:"LARGE", labelHeadingTag:"H1", labelColor:"STANDARD", divider:"ABOVE_CONTENT"-equivalent per page spec: divider Above Content, weight Thin, color Standard)`
- Leaderboards: `a!cardLayout(showBorder:true)` + per-row `a!columnsLayout`/`a!sideBySideLayout` with `a!imageField` avatar (SMALL, circular), rich text ordinal + name, right-aligned value
- `a!gaugeField(size:"LARGE", primaryText: percentage)` ×2 with custom/semantic colors; caption rich text "$10.64MM / $15.00MM"
- `a!columnChartField(series ×4, custom colorScheme ramp, legend below, y-axis label "Closed Loan Value $MM")`
- Interactive affordances: nav only — a pure read dashboard

### Character & judgment
- **Register**: authoritative-executive — monochrome brand ramp, bordered cards, restrained semantics
- **Why it works**: the thin divider does real work — four plum MEDIUM headings sit directly below, and the neutral LARGE H1 + line still reads unambiguously as the page title; one brand hue stretched into a 4-step ramp keeps a 16-bar chart calm; faces + ordinals make rankings legible from 2 meters
- **Why not boring**: podium ordinals with raised suffixes; dual-gauge "now vs committed" framing; semantic tri-color satisfaction (green/gray/red) against an otherwise monochrome page; brand-hue chart instead of default palette
- **Boring twin**: "Performance Dashboard" as bold text with no divider, one 4-column grid of officers with numeric columns, a single blue progress bar, default multicolor column chart
- **What to steal**: divider-below-title whenever accent-colored section headings compete; monochrome categorical ramps from the brand hue; encode rank with ordinal+avatar rather than sort order alone
- **Risks**: plum ramp's two middle steps are close (series confusion for colorblind users — legend required); red 3.4 vs green 4.9 relies on color plus star fill (acceptable); gray $ values are low-contrast on white (≈4:1 borderline at that size)

## image73.png

### Identification
- **Image**: image73.png | **Source page**: page-titles | **Alt/caption**: "screenshot showing an image gallery page with a standard page title" (heading: "Standard page title")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (searchable image-card gallery)

### Use-case reconstruction (INFERRED)
- **Persona**: museum registrar / partner-institution curator browsing loanable artworks; occasional-customer cadence
- **Domain & brand context**: "HUGO Collection" — private art collection loan portal; gallery-white aesthetic with a single crimson brand accent
- **Top 3 user tasks (ranked)**: 1. Keyword-search the collection (query "cat" entered) 2. Narrow by category/era facets 3. Visually scan results and pick a work by image
- **Implied requirements**: "Search must dominate the page top"; "Results must lead with the artwork image"; "Title/artist metadata must stay subordinate to imagery"; "Facets must be optional, defaulting to Any"
- **Data model sketch**: Artwork(image, title incl. original-language titles e.g. 猫図, artist, category, era) — 6 full cards visible ("Two Children Teasing a Cat"/Carracci, "Cat Seen from Behind"/Kawabata Gyokushō, "Musk Cat"/Uto Gyoshi, "Tiger in Repose"/Barye, "A Cat Stealing Fish"/Recco, "Cat Watching a Spider"/Ōide Tōkō) + third row cropped (OBSERVED)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV white (logo block crimson, LOANS active bold)
SECTION "Search the Collection" (LARGE H1, no divider)
FORM-ROW [search input AUTO : BUTTON "SEARCH" : dropdown : dropdown]
GRID(3-col cards, 2.5 rows visible)
└─ CARD(image ≈16:10, title STRONG gray-brown, ✎ artist STRONG)
```
- **Above the fold**: title, full search bar, six result cards, third row peeking (scroll cue)
- **Reading order**: single-column funnel (title → search → results), then Z within the grid
- **Hierarchy rationale**: the LARGE title names the verb of the page ("Search…") because search is task 1; the input row is the only chrome between title and imagery; images get ~75% of each card since selection is visual
- **Density**: 2 — editorial: few zones, large imagery, breathing room
- **Ratios & spacing**: 3 equal columns, consistent gutters ≈ STANDARD; cards thin-bordered with inner white matte padding around images (gallery-mat effect)

### Styling specifics (OBSERVED)
- **Palette**: page bg #FFFFFF; nav text #4A4A4A (est.) on white (no dark site bar — chrome disappears behind content); brand crimson #C22557 (est.) on logo block + SEARCH button; card border #DDDDDD (est.); titles warm gray-brown #8A7A6A (est.) STRONG; artist names #3A3A3A (est.) with pen/brush icon; artwork photos supply all remaining color
- **Color application points**: exactly two crimson moments (logo, SEARCH button — the primary action); everything else neutral so paintings own the palette
- **Typography moves**: page title LARGE, STANDARD color, H1, no divider (nothing below competes — the documented contrast with image27); card titles STANDARD/MEDIUM STRONG in muted brown; artist line SMALL STRONG with leading glyph; bilingual titles rendered inline (CJK + English)
- **Imagery stance**: dominant photography — artwork reproductions edge-to-edge within card mattes
- **Card treatment**: border, white fill, no shadow, square corners — picture-frame minimalism
- **Signature moves**: instead of a dark branded site bar, a white nav lets the gallery start at the logo (museum-wall effect); instead of title+filters buried in a toolbar, the H1 itself is the search prompt; SEARCH button inherits the sole brand accent, making the primary action the only saturated UI element; italic "--- Any Category --- / --- Any Era ---" placeholders signal unfiltered state
- **Density**: (above) 2

### Component inventory (OBSERVED)
- `a!sectionLayout(label:"Search the Collection", labelSize:"LARGE", labelHeadingTag:"H1", labelColor:"STANDARD")` (per page spec)
- `a!sideBySideLayout`: `a!textField` (value "cat"), `a!buttonWidget(label:"SEARCH", style:"SOLID", color: brand crimson)`, `a!dropdownField` ×2 with placeholder dashes
- Results: `a!cardGroupLayout`/3-col `a!columnsLayout` of `a!cardLayout(showBorder:true, link: record)` each containing `a!imageField(size:"FIT")` + rich text title + icon+artist line
- Cards-as-links implied (whole-card click target); no pagination visible above fold

### Character & judgment
- **Register**: premium-editorial + institutional — white space, framed images, single accent
- **Why it works**: neutral everything (white nav, gray text, thin borders) cedes color to the artwork; the title's verb phrasing plus immediately-following input makes the page self-explaining; consistent card anatomy (image → title → artist) supports fast comparative scanning
- **Why not boring**: no dark chrome at all — rare in this corpus; muted brown card titles instead of default black (echoes archival labels); bilingual titles kept verbatim (authenticity over normalization); crimson used with extreme scarcity
- **Boring twin**: dark-blue site bar, "Loans" H1, filter sidebar with checkbox trees, results as a grid with thumbnail column + 5 text columns
- **What to steal**: title-as-verb over search pages; starve the UI of color when content is imagery; give result cards a strict image/title/byline anatomy; skip the divider when nothing below competes with the title
- **Risks**: gray-brown titles (~#8A7A6A on white) hover near 4.5:1 minimum; white nav offers weak wayfinding on scroll (no persistent band); image-heavy grid needs alt text per artwork for a11y and cropping rules for tall scrolls (works are cropped to landscape here)
