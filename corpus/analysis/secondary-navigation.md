# Analysis: secondary-navigation

Page context: "Secondary Navigation" (section: patterns) teaches manually-built sub-navigation beyond the built-in tab layout / site sidebar: vertical patterns (basic, sections, custom-header combos, icons, collapsible, two-level, color guidance, prominent-selected) and horizontal patterns (manual card tabs, framed tabs). Most demos share one fictional site — "Boreas Foundation" — whose chrome repeats across images: dark-slate top bar #2d3843 (est.) with HOME / MY TASKS / CASES caps tabs (active = STRONG + #FFCD00 underline), waffle + avatar right; demo content is an H1 "Dashboard" over six empty outlined placeholder boxes (Income, Expenses, Profit and Loss / Hiring, Attrition, Customer Satisfaction) in a 3×2 grid. Rule-of-thumb from page text: vertical when >6 tabs / multi-level / long labels; horizontal when <7 tabs and horizontal space matters. Every vertical pattern uses the same core trick, CODE-VERIFIED throughout: each nav row is an `a!cardLayout(link: a!dynamicLink(...), showBorder: false, padding: "NONE"–"EVEN_LESS")` containing an `a!sideBySideLayout` of a "❘" rich-text bar glyph + label, where the bar's color flips between accent and the row's own background color (invisible spacer) to mark selection without shifting alignment.

## image95.png

### Identification
- **Image**: image95.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Basic vertical navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — secondary-navigation pattern demo over a placeholder dashboard
- Tier A as listed (full-page screenshot); no override.

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit case-management staffer (program officer), daily-operator hopping between case queues
- **Domain & brand context**: "Boreas Foundation" — charitable foundation; institutional, restrained
- **Top 3 user tasks (ranked)**: 1. Switch among Dashboard / My Cases / Overdue Cases / All Cases views 2. Reach Advanced Search 3. Consult Knowledge Base
- **Implied requirements**: "Second nav level must not compete with the site header"; "Selected page must be identifiable at a glance"; "Nav must add zero visual chrome on white pages"; "Labels must fit long phrases (Advanced Search, Knowledge Base) — hence vertical"
- **Data model sketch**: Page{name, selected?} ×6; demo dashboard implies metrics entities (Income, Expenses, P&L, Hiring, Attrition, CSAT) — placeholders only

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
├─ header: CARD(spacer, padding LESS, borderless)
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] nav ×6 CARD("❘"+label, link, padding NONE)
   └─ PANE[center] SECTION "Dashboard" + GRID(3-col × 2 rows of placeholder boxes)
```
- **Above the fold**: everything — nav, title, all six placeholder zones
- **Reading order**: F — nav rail scanned first, then title, then row-major boxes
- **Hierarchy rationale**: "Dashboard" H1 ≈ EXTRA_LARGE dominates because orientation is the demo's point; nav is typographically quiet (MEDIUM) since task 1 is switching, not reading; selected row alone gets two cues (bar + STRONG)
- **Density**: 2 — six empty zones + one nav rail; generous white space (pattern demo, not a working screen)
- **Ratios & spacing**: nav column `width: "NARROW"` vs `AUTO` content (≈1:5.5 OBSERVED); nav cards padding "NONE", marginBelow "NONE" (rows touch, ≈44px pitch); content cards style "NONE", padding "STANDARD"

### Styling specifics (CODE-VERIFIED)
- **Palette**: page/backgroundColor "WHITE" #ffffff; nav card style "#ffffff"; labels + selected bar color "ACCENT" (renders ≈#1f6fba est. site blue); unselected bars "#ffffff" (invisible); site chrome #2d3843 (est.) + #FFCD00 underline; placeholder box borders #d9d9d9 (est.)
- **Color application points**: accent only on nav labels/selected bar and site-header underline; content is grayscale; no fills anywhere in the nav
- **Typography moves**: nav labels size "MEDIUM", selected adds style "STRONG"; bar "❘" size "LARGE"; H1 ≈ EXTRA_LARGE; box labels ≈ MEDIUM STRONG; no all-caps in nav
- **Imagery stance**: none (avatar photo in chrome only)
- **Card treatment**: flat borderless cards throughout (showBorder: false); nav invisible until hover/selection
- **Signature moves**: instead of a boxed menu component, borderless white link-cards sit directly on the white page — nav reads as text; instead of moving a highlight element, an always-present "❘" glyph flips color #ffffff→ACCENT so selection never reflows; instead of icon affordances, selection = bar + weight only

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"WHITE") with empty header card spacer; a!columnsLayout(NARROW+AUTO); per row a!cardLayout(style:"#ffffff", padding:"NONE", showBorder:false, link:a!dynamicLink()) → a!sideBySideLayout(alignVertical:"MIDDLE", spacing:"DENSE") of two a!richTextDisplayField items ("❘" LARGE; label MEDIUM/STRONG)
- Chart types: none (empty placeholder cards)
- Interactive affordances: 6 nav dynamicLinks; cards-as-links

### Character & judgment
- **Register**: institutional + utilitarian-ops — monochrome chrome, single accent, zero decoration
- **Why it works**: bar+bold double-codes selection (works color-blind); NARROW column caps label length drift; zero-chrome nav keeps the placeholder content visually primary
- **Why not boring**: the "❘" glyph-as-selection-bar (typography doing UI work); invisible same-color spacer bars preserving alignment; nav that disappears into the page instead of a gray sidebar box
- **Boring twin**: a bordered gray sidebar card with a!richTextItem links underlined blue, selected page shown by underline only, sitting in a MEDIUM column that steals a third of the page.
- **What to steal**: color-flip spacer glyphs for stateful indicators; NARROW+AUTO columns for rail nav; borderless link-cards as menu rows
- **Risks**: hue-only distinction between selected/unselected label weight is subtle at MEDIUM size; no hover surface shown; blue-on-white links need the site accent to stay ≥4.5:1

### Code cross-check
- **Code-verified palette**: nav cards #ffffff on WHITE background; ACCENT labels/bar; unselected bar #ffffff
- **Notable techniques**: dynamicLink on cardLayout (whole row clickable); sideBySide spacing "DENSE" + alignVertical "MIDDLE"; empty header card as top spacer; content cards style "NONE"
- **Corrections**: none — pixels match code

## image1.png

### Identification
- **Image**: image1.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Vertical navigation with sections")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — sectioned dark-sidebar navigation demo over placeholder dashboard
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: case-management daily-operator with a larger page inventory (9 pages) needing grouping
- **Domain & brand context**: Boreas Foundation nonprofit; institutional with a bold yellow brand accent
- **Top 3 user tasks (ranked)**: 1. Jump between case views (Dashboard/My Cases/Overdue/All Cases) 2. Reach resources (Popular Links/Knowledge Base/Training) 3. Get help (Report an Issue/Support Forum)
- **Implied requirements**: "9+ pages must be grouped under labeled categories"; "Selected page must survive dense dark UI (hence filled highlight)"; "Sidebar must read as one continuous band full-height"; "Category labels must not be clickable-looking"
- **Data model sketch**: Section{label} 1—* Page{name, selected}; sections CASES(4), RESOURCES(3), HELP(2)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] dark rail: SECTION "CASES" hdr → 4 rows (row1 selected, yellow fill)
   │  ├─ SECTION "RESOURCES" hdr → 3 rows
   │  └─ SECTION "HELP" hdr → 2 rows (+ filler card to full height)
   └─ PANE[center] SECTION "Dashboard" + GRID(3-col × 2 placeholder boxes)
```
- **Above the fold**: all nav sections and all six placeholder zones
- **Reading order**: F — rail top-to-bottom, then content rows
- **Hierarchy rationale**: yellow selected row is the single highest-contrast element (dark rail makes the fill pop) because "where am I" is the pattern's job; yellow caps section headers rank second — wayfinding before content; content H1 stays biggest type but lower salience than the color block
- **Density**: 2 — one rail + six empty zones; padding "EVEN_LESS" rows are compact but page is airy
- **Ratios & spacing**: [NARROW:AUTO] ≈ 1:6.5; nav rows padding "EVEN_LESS", headers "LESS", marginBelow "NONE" (continuous band); content padding "MORE"

### Styling specifics (CODE-VERIFIED, base pattern)
- **Palette**: rail #3B464E; section-header text #FFCD00; selected row fill #FFCD00 with #3b464e bar + near-black STANDARD text; unselected rows #3B464E with auto-white STANDARD text; page backgroundColor "WHITE". Functional variant parameterizes the same skeleton: nav #020A51, headers #FCB858, selected fill #2322F0 (locals in code)
- **Color application points**: yellow at exactly two semantic points — category labels and the selected row; everything else slate/white; content colorless
- **Typography moves**: section headers STRONG caps (functional wraps `upper(fv!item)`); items size "MEDIUM", selected STRONG; bar "❘" LARGE; dark cards rely on SAIL auto-inverting STANDARD text to white
- **Imagery stance**: none
- **Card treatment**: flat borderless stacked cards; the rail is literally a stack of same-color cards + tall filler card to reach viewport bottom
- **Signature moves**: instead of indenting children, non-clickable yellow caps headers partition the rail; instead of a left-bar-only selected state, the whole row floods #FFCD00 (fill + dark text = strongest state on dark UI); instead of one sidebar container, per-row cards let each row take link, color, and padding independently

### Component inventory (CODE-VERIFIED)
- a!localVariables(local!selectedTab, color locals) + a!forEach over section/page maps (functional); rows = a!cardLayout(style: if(selected, #FFCD00, navBg), padding:"EVEN_LESS", link:a!dynamicLink(saveInto: local!selectedTab)) → sideBySide "❘"+label; header rows = cardLayout(style: navBg, padding:"LESS") with STRONG colored richText
- Chart types: none
- Interactive affordances: 9 row links; selected state persisted in local!selectedTab

### Character & judgment
- **Register**: utilitarian-ops + institutional — dark ops rail, two-color discipline
- **Why it works**: filled selected row survives peripheral vision on a dark rail (bar-only would vanish); caps yellow headers create scannable chunks of ≤4 items; continuous #3B464E band (marginBelow NONE + filler card) reads as one surface, not stacked boxes
- **Why not boring**: brand yellow doing double duty (wayfinding labels + selection); glyph bar retained inside the filled row for left-edge continuity; the functional/base twin blocks show the palette is 3 swappable locals — theming as configuration
- **Boring twin**: a light-gray sidebar with bold black section labels, blue link text, selected page underlined; sections separated by divider lines; rail ends where items end, leaving a ragged bottom.
- **What to steal**: full-row fill for selected state on dark rails; non-interactive caps headers as separators; EXTRA_TALL filler card to run rails to the fold
- **Risks**: yellow #FFCD00 on #3B464E header text ≈ 7:1 (fine) but yellow fill relies on text darkness for contrast; 9 items + 3 headers approaches scroll on short viewports; STANDARD auto-inversion means custom mid-tone rail colors could break text contrast

### Code cross-check
- **Code-verified palette**: base #3B464E / #FFCD00 (matches pixels); functional locals #020A51 / #FCB858 / #2322F0 (alternate theme, not the screenshot)
- **Notable techniques**: palette as three locals (~lines 553-561); forEach over a!map page lists; if()-swapped card style + text STRONG per selection; upper() for header caps
- **Corrections**: screenshot renders the base pattern, not the functional locals — palette claims anchored to base block

## image80.png

### Identification
- **Image**: image80.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Vertical navigation under custom header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — nav placement demo (basic rail under a full-width custom page header)
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: caseworker inside the CASES area, daily-operator; all sub-pages share one context
- **Domain & brand context**: Boreas Foundation; yellow brand header signals an area-level workspace
- **Top 3 user tasks (ranked)**: 1. Move among Cases sub-views (Overview/My/Overdue/All) 2. Create a case (NEW CASE) 3. Search/reference (Advanced Search, Knowledge Base)
- **Implied requirements**: "Header must brand the whole Cases area, so nav belongs *under* it" (page text: sub-views of 'Cases'); "Area-level action (NEW CASE) must live in the header, not the content"; "Nav must stay chrome-free on the gray card page"
- **Data model sketch**: Case area → sub-pages ×6; content zones My Cases, Alerts, All Cases, Performance imply Case{owner, dueDate, status} lists + KPIs

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ header: CARD(#FFCD00 est., "Cases"+folder icon left, NEW CASE white button right)
└─ COLUMNS [NARROW:AUTO] on gray page bg
   ├─ PANE[left] basic nav ×6 (Overview selected: blue bar+STRONG)
   └─ PANE[center] COLUMNS [≈2:1] ×2 rows → CARD(My Cases) CARD(Alerts) / CARD(All Cases) CARD(Performance)
```
- **Above the fold**: header band, full nav, all four content cards
- **Reading order**: Z — header band (title→action), then F down nav and cards
- **Hierarchy rationale**: full-width yellow band outranks everything because area identity is the lesson; nav drops to third place (quiet text rail) since it inherits context from the band; wide:narrow card columns put queue lists over alerts
- **Density**: 2 — four empty zones, one rail, one band
- **Ratios & spacing**: nav ≈ 1:6 vs content; content split ≈ [2:1]; card gaps ≈ STANDARD; band padding ≈ STANDARD, full-bleed
- Site-tab state: CASES is the active top tab (yellow underline) — three nav levels visible (site tab → header → rail)

### Styling specifics (OBSERVED — no SAIL for this variant)
- **Palette**: header band #FFCD00 (est., matches code family), band text/icon near-black #222 (est.); NEW CASE button white #ffffff fill, dark label, + icon; page bg #eeeeee (est.); cards #ffffff with soft shadow; nav links ≈#1f6fba (est.), selected bar same blue; headings #222 (est.)
- **Color application points**: yellow = area band only; blue = nav links + selected bar only; content monochrome; button is white-on-yellow (inverse chip)
- **Typography moves**: band title ≈ MEDIUM_PLUS STRONG with leading folder icon; card headings MEDIUM STRONG; nav MEDIUM with STRONG selected; button label SMALL caps
- **Imagery stance**: styled icons only (folder glyph, plus glyph)
- **Card treatment**: white cards with subtle shadow on gray (est. shadow default of pattern content, showBorder false); nav transparent — no bounding card (per this page's color guidance)
- **Signature moves**: instead of stacking the rail beside the header, the header spans full width and the rail starts *below* it — encoding "these pages are children of Cases"; instead of a colored SOLID button, a white button on yellow reads as the band's own action; nav placed directly on gray (transparent) per the transparent-background rule

### Component inventory (INFERRED — pattern section shows no SAIL for this image)
- a!headerContentLayout with a!cardLayout(style:"#FFCD00") header (sideBySide: icon+title left, a!buttonArrayLayout right, buttonWidget style:"OUTLINE"/white SOLID); nav = basic-pattern card rows (see image95); content = a!columnsLayout of bordered-less white cards
- Chart types: none (placeholders)
- Interactive affordances: 6 nav links, NEW CASE action, site tabs

### Character & judgment
- **Register**: institutional + utilitarian-ops
- **Why it works**: hierarchy is spatial — band *above* rail unambiguously parents the nav (contrast image23 where the rail flanks the header); the single action sits where the area is named; transparent rail keeps three nav levels from becoming three boxes
- **Why not boring**: full-bleed brand-yellow band as area marker; inverse white button; nav-on-gray with zero container chrome
- **Boring twin**: gray page with an H1 "Cases", a blue SOLID New Case button floating in content, and the same nav wrapped in a white bordered card — three boxed strips stacking chrome on chrome.
- **What to steal**: put area-scoped actions in the area header; use header-above-rail vs rail-beside-header to encode page parentage; drop nav containers on card-based pages
- **Risks**: yellow band + yellow site-tab underline double-signal; white button on yellow needs border to survive; blue links on #eeeeee slightly lower contrast than on white

### Code cross-check
- none for this image — no SAIL block accompanies the custom-header variants

## image23.png

### Identification
- **Image**: image23.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Vertical navigation next to custom header")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — nav placement demo (contrasting rail beside custom header + KPI strip)
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: development/fundraising manager, weekly-manager cadence, monitoring campaign KPIs
- **Domain & brand context**: Boreas Foundation fundraising ops; dashboard-flavored workspace
- **Top 3 user tasks (ranked)**: 1. Read campaign health KPIs (gift dollars, retention, new donors, recurring rate, active campaigns) 2. Launch NEW CAMPAIGN 3. Switch to case views via rail
- **Implied requirements**: "Pages may each carry their own custom header, so nav must sit *beside* headers" (page text); "Rail needs contrasting fill to hold its own against colored headers"; "KPIs must precede detail zones"; "Primary action visible without scrolling"
- **Data model sketch**: Campaign{giftDollarsToTarget 82.9% ▲1.9, donorRetention 74.2% ▼2.3, newDonorsToTarget 91.6% ▲3.0, recurringGiftRate 48.5% ▼5.1, activeCampaigns 11}; 6 metric zones below

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COLUMNS [NARROW:AUTO] full height under site bar
├─ PANE[left] dark rail #3B464E: 6 rows (My Dashboard selected: white bar+STRONG)
└─ PANE[right]
   ├─ CARD(#FFCD00 est. band: palette icon + "My Dashboard")
   ├─ KPI-ROW ×5 (white strip, dividers) + SOLID blue NEW CAMPAIGN btn
   └─ GRID(3-col × 2 white CARDs on gray)
```
- **Above the fold**: rail, band, all 5 KPIs, action button, all six cards
- **Reading order**: F within right pane after a left rail glance; KPI strip scans left→right
- **Hierarchy rationale**: yellow band + adjacent full-height rail split "where am I" (rail) from "what is this page" (band); KPI strip outranks content because numbers are the page's payload; blue button is the sole saturated-cool element → terminal action
- **Density**: 3 — 5 KPIs + button + 6 zones + 6-item rail in one viewport, comfortable padding
- **Ratios & spacing**: rail ≈ 1:6.5; KPI cells ≈ equal fifths with hairline dividers #e0e0e0 (est.); cards on #f0f0f0 (est.) with STANDARD-ish gaps

### Styling specifics (OBSERVED — no SAIL for this variant; rail matches image22's code)
- **Palette**: rail #3B464E (CODE-VERIFIED via contrasting-pattern block), selected text/bar white #ffffff, unselected #D0D7DC (CODE-VERIFIED family); band #FFCD00 (est.); KPI strip #ffffff; values #222 (est.); deltas green #3a9c36 (est.) / red #cc2222 (est.); NEW CAMPAIGN #1a6bb5 (est.) SOLID white text; page #f0f0f0 (est.)
- **Color application points**: semantic green/red only in KPI deltas; yellow only in band (+site underline); blue only on the action; rail monochrome
- **Typography moves**: KPI labels caps SMALL gray; KPI values ≈ LARGE STRONG with leading glyph icons; deltas SMALL with ▲/▼; band title MEDIUM_PLUS STRONG; rail MEDIUM/STRONG-selected
- **Imagery stance**: styled icons (money, person, refresh, megaphone) as KPI anchors; avatar in chrome
- **Card treatment**: band and KPI strip are flat full-width cards; content cards white + soft shadow; rail flat fill
- **Signature moves**: instead of header spanning the page, the rail runs full height and the header lives inside the content pane — nav peers with, not child of, the page; instead of kpiField defaults, a hand-built sideBySide KPI strip fused to the band (band+strip read as one header unit); delta arrows colored while values stay black (state vs. data separation)

### Component inventory (INFERRED)
- Rail per image22's CODE-VERIFIED pattern (cards #3B464E, "❘" white/invisible flip, padding "NONE"); band a!cardLayout(style:"#FFCD00"); KPI strip a!cardLayout(white) → a!columnsLayout ×5 of richText stacks (caps label / icon+value / arrow+delta) + a!buttonWidget(style:"SOLID") right; content a!columnsLayout ×3
- Chart types: none (placeholders)
- Interactive affordances: 6 rail links, NEW CAMPAIGN button, site tabs

### Character & judgment
- **Register**: utilitarian-ops + authoritative-executive — ops rail plus KPI-first header
- **Why it works**: contrasting rail beside a colored band prevents two adjacent colored bars from stacking (which under-header placement would cause); KPI strip's five equal cells with caps labels make the numbers the visual rhythm; one saturated action button = unmistakable CTA
- **Why not boring**: band+KPI fusion as a two-layer header; icon-led KPI values; disciplined three-hue split (yellow identity / blue action / red-green state)
- **Boring twin**: white page, H2 "My Dashboard", a!kpiField row with default gray labels, button lost at top right, nav in a bordered white card — no full-height rail, no color logic.
- **What to steal**: full-height contrasting rail when pages carry their own headers; fuse KPI strip to the page band; reserve one hue per role (identity/action/state)
- **Risks**: #D0D7DC unselected text on #3B464E ≈ 8:1 (fine) but small caps KPI labels in gray flirt with 4.5:1; five KPI cells + button will wrap poorly on tablet; two adjacent yellow surfaces (site underline, band) on some pages

### Code cross-check
- none for this composite image — rail styling verified against the contrasting-background SAIL block (see image22)

## image14.png

### Identification
- **Image**: image14.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Icon-only vertical navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — icon-rail navigation demo over placeholder dashboard
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: expert daily-operator who has memorized destinations; page text explicitly warns off occasional users
- **Domain & brand context**: Boreas Foundation case management
- **Top 3 user tasks (ranked)**: 1. Switch pages with minimal horizontal cost 2. Preserve max width for dashboard content 3. Recover labels via hover tooltips
- **Implied requirements**: "Nav must cost almost no horizontal space" (page text: minimize footprint); "Every icon must carry a tooltip"; "Selected icon must be unmistakable"; "Not for occasional-user audiences" (NN/g citation in page text)
- **Data model sketch**: Page{icon, tooltip} ×6 — tachometer/Dashboard, user/My Cases, clock-o/Overdue Cases, folder-open/All Cases, search/Advanced Search, lightbulb-o/Knowledge Base

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
└─ COLUMNS [EXTRA_NARROW:AUTO]
   ├─ PANE[left] icon rail: 6 icon CARDs (row1 #FFCD00 selected) + EXTRA_TALL filler
   └─ PANE[center] SECTION "Dashboard" (H1) + GRID(3-col × 2 placeholders)
```
- **Above the fold**: entire rail and all six placeholder zones
- **Reading order**: single-column content after a rail glance; rail is vertical icon stack
- **Hierarchy rationale**: rail shrinks to glyph width because content width is the whole point; yellow selected cell is the only color block — position beacon; H1 remains the largest text since icons abdicate labeling
- **Density**: 2 — same six empty zones; rail near-zero footprint
- **Ratios & spacing**: `width: "EXTRA_NARROW"` rail vs AUTO (≈1:26 OBSERVED); icon cards ≈square via centered MEDIUM_PLUS glyphs; marginBelow "NONE" continuous band

### Styling specifics (CODE-VERIFIED)
- **Palette**: rail cards #3B464E; selected card #FFCD00 with near-black icon (auto-inverted STANDARD); unselected icons auto-white; content on WHITE; placeholder borders #d9d9d9 (est.)
- **Color application points**: yellow only on the selected cell; icons monochrome; content colorless
- **Typography moves**: no nav text at all — icons size "MEDIUM_PLUS", align "CENTER"; content H1 via a!sectionLayout(labelSize:"LARGE_PLUS", labelHeadingTag:"H1"); box labels MEDIUM STRONG
- **Imagery stance**: styled glyph icons (FontAwesome names in code: tachometer, user, clock-o, folder-open, search, lightbulb-o), auto-white on slate
- **Card treatment**: flat borderless stacked cards + EXTRA_TALL #3B464E filler card extending the rail to the fold
- **Signature moves**: instead of labels, tooltip-per-card (`tooltip: "Dashboard"` etc.) carries names; instead of shrinking a labeled rail, a purpose-built EXTRA_NARROW column makes icon width a layout constant; selected state = full-cell flood fill, the only state legible at 40px width

### Component inventory (CODE-VERIFIED)
- Per row: a!cardLayout(style:"#3B464E"/"#FFCD00", link:a!dynamicLink(), tooltip:<page>, marginBelow:"NONE", showBorder:false) → a!richTextDisplayField(align:"CENTER", a!richTextIcon(icon:…, size:"MEDIUM_PLUS")); filler a!cardLayout(height:"EXTRA_TALL"); a!columnsLayout(EXTRA_NARROW+AUTO); content a!sectionLayout H1
- Chart types: none
- Interactive affordances: 6 icon links with tooltips

### Character & judgment
- **Register**: utilitarian-ops — glyphs, dark rail, zero ornament
- **Why it works**: EXTRA_NARROW reclaims ~200px vs a labeled rail (compare image22) for the 3-column dashboard; flood-fill selection reads peripherally where a bar could not; conventional metaphors (clock=overdue, folder=all) lower recall cost
- **Why not boring**: 40px-wide nav as a design commitment, not a collapsed afterthought; tooltip-backed minimalism; yellow cell doubling as brand moment
- **Boring twin**: same six items with labels crammed into a NARROW rail at SMALL size, ellipsizing "Knowledge Base", selected shown by underline — costs width *and* legibility.
- **What to steal**: tooltips on every icon-only control; EXTRA_NARROW column for icon rails; flood-fill selected cell at glyph scale
- **Risks**: page text itself flags first-use usability (tooltip discovery required); lightbulb/search metaphors collide semantically; six icons is near the memorability ceiling; hover tooltips dead on touch devices

### Code cross-check
- **Code-verified palette**: #3B464E rail, #FFCD00 selected, WHITE page — matches pixels
- **Notable techniques**: tooltip param on cardLayout; EXTRA_TALL filler; sectionLayout labelHeadingTag H1 for a11y; align CENTER richTextIcon
- **Corrections**: none

## image98.gif

### Interaction: Collapsible vertical navigation (gif: image98.gif; frames image98_f0.png, image98_f1.png)
- **State chart**: expanded labeled rail (NARROW, yellow selected "Dashboard" row, « control at stack bottom) → user clicks « ("Collapse navigation bar") → rail swaps to EXTRA_NARROW icon-only column (yellow selected icon cell, » control) → click » restores labels. Content grid reflows wider on collapse (frames show 3-col boxes stretching).
- **SAIL mechanism**: showWhen toggle — `local!navExpanded` flips via a!dynamicLink(value:false/true) on the «/» cards; two parallel columnLayouts (`width:"NARROW", showWhen: local!navExpanded` and `width:"EXTRA_NARROW", showWhen: not(...)`), both styled #3B464E with #FFCD00 selected and tooltips on collapsed icons (CODE-VERIFIED).
- **UX purpose**: progressive disclosure — user chooses label comfort vs content width.
- **Replicate when**: expert screens where width is contested but labels aid onboarding. | **Cost**: every nav item is authored twice (labeled + icon variants) — duplication risk when pages change.

## image28.png

### Identification
- **Image**: image28.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Icon-only vertical navigation with secondary vertical navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list — property-listing workspace demonstrating two-level rail nav
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: real-estate listing agent, daily-operator managing an inventory pipeline
- **Domain & brand context**: "Thatcher." — upscale residential brokerage; serif wordmark, black/deep-red identity, premium feel
- **Top 3 user tasks (ranked)**: 1. Scan my active listings' status (NEW LISTING / OPEN HOUSE / PRICE REDUCED / NO OFFERS) 2. Create a listing (NEW LISTING button) 3. Move between Properties sub-views (My/New/Search/Sold) and app areas (icon rail)
- **Implied requirements**: "Two nav tiers must nest visually (area rail → section panel)" (page text: secondary+tertiary with site tabs); "Status must be readable off card photos at a glance"; "Days-on-market must accompany price"; "Primary create action lives in the section panel"
- **Data model sketch**: Listing{price $1,695,000…, status tag, daysOnMarket 2d–42d, beds 3–5, baths 2.5–4.5, sqft 2,178–3,219, address (Palm Springs/Palm Desert/Cathedral City/Hot Springs CA)} ×5; Area{icon} ×6; PropertiesView ×4

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COLUMNS [EXTRA_NARROW : NARROW_PLUS : AUTO]
├─ PANE[left] black icon rail ×6 (home cell filled #990000)
├─ PANE[mid] white panel: SECTION "Properties" + NEW LISTING solid btn
│  └─ 4 icon+label rows (My Listings selected: red icon+text STRONG)
└─ PANE[right] gray bg GRID(3-col, 5 CARD(photo+tag, price+days, specs, address))
```
- **Above the fold**: full rails, first card row, most of second
- **Reading order**: hub-and-spoke — rail → panel → card grid scanned row-major
- **Hierarchy rationale**: listing photos dominate area because inventory is the work object; red is rationed to nav-selected states + the create button, so wayfinding and primary action share one signature hue; prices lead each card's text block (largest data type) matching task 1
- **Density**: 3 — 5 media cards + 2 nav tiers + button in viewport, editorial white space inside cards
- **Ratios & spacing**: EXTRA_NARROW : NARROW_PLUS : AUTO (CODE-VERIFIED) ≈ 1:5:22; card grid 3-col with ≈STANDARD gutters; panel rows spacious (≈STANDARD padding)

### Styling specifics (CODE-VERIFIED where noted)
- **Palette**: icon rail #232020, selected cell #990000 (both CODE-VERIFIED); top bar near-black #1b1b1b (est.); panel #ffffff; selected/section accents "ACCENT" → dark red ≈#990000; unselected panel text #666666 with SECONDARY icons (CODE-VERIFIED); content backgroundColor #f0f0f0 (CODE-VERIFIED); status tags: NEW LISTING #ff9900, OPEN HOUSE SCHEDULED #38761d, PRICE REDUCED #3c78d8, NO OFFERS RECEIVED #cc0000 (all CODE-VERIFIED stamp backgroundColors); days-on-market SECONDARY gray
- **Color application points**: red = selected rail cell, selected panel item, NEW LISTING button; four semantic tag hues on photos; everything else neutral
- **Typography moves**: panel header "Properties" MEDIUM_PLUS STRONG; prices MEDIUM_PLUS STRONG; days MEDIUM SECONDARY with calendar icon; specs STANDARD with "·" separators; addresses SMALL; tags caps on colored chips
- **Imagery stance**: large photography (5 exterior shots) as card heroes — rare in this corpus, sets premium tone
- **Card treatment**: white cards, borderless with soft elevation on #f0f0f0; photos full-bleed to card top with overlaid tag chips
- **Signature moves**: instead of one nav container, three nested surfaces darken with generality (black rail → white panel → gray canvas); status as photo-overlay stamps (a!stampField-style chips) rather than a grid column; days-on-market paired right-aligned against price — urgency beside value; icon rail EXTRA_NARROW + panel NARROW_PLUS keeps two nav tiers under ~25% width

### Component inventory (CODE-VERIFIED core)
- Icon rail: a!cardLayout(style:"#232020"/"#990000", tooltip:"Properties" etc., link) + centered a!richTextIcon(MEDIUM_PLUS) — icons tachometer, home, street-view, university, line-chart, users; panel: a!sectionLayout("Properties") + a!buttonWidget("NEW LISTING", icon:"plus-circle", width:"FILL", style:"SOLID") + rows of sideBySide icon(ACCENT/SECONDARY)+label(ACCENT STRONG / #666666); content section backgroundColor:"#f0f0f0"; listing cards with stamp chips (backgroundColors above), richText price/spec stacks
- Chart types: none
- Interactive affordances: 6 rail links (tooltips), 4 panel links, FILL-width create button, cards presumably record links

### Character & judgment
- **Register**: premium-editorial + utilitarian-ops — photo-led cards on an ops scaffold
- **Why it works**: three-surface value ramp (black/white/gray) makes nesting legible without lines; single accent red across both nav tiers ties them into one system; tag chips exploit photo real estate for status without widening cards
- **Why not boring**: dark-red-on-black selected cell (tone-on-tone, not high-vis yellow); serif brand + photography inside an Appian pattern; four-hue semantic tag vocabulary
- **Boring twin**: a gridField of listings (address, price, status columns), nav as two stacked white bordered cards with blue links, photos relegated to thumbnails.
- **What to steal**: EXTRA_NARROW+NARROW_PLUS two-tier rail budget; stamp-chips over imagery for status; one accent hue across nav levels
- **Risks**: #990000 on #232020 selected cell ≈ 2:1 luminance — findable but low-vision hostile; icon-only outer rail inherits tooltip-dependence; 3-col photo grid drops to 1-col awkwardly on tablet; orange tag on bright sky photos can wash out

### Code cross-check
- **Code-verified palette**: #232020 / #990000 rail; #f0f0f0 canvas; tag hexes #ff9900 #38761d #3c78d8 #cc0000
- **Notable techniques**: tooltip'd icon cards; buttonWidget width "FILL" inside NARROW_PLUS column; stamp backgroundColor chips; ACCENT/SECONDARY icon color roles
- **Corrections**: selected rail cell is the "Properties" home icon (tooltip in code) — matches pixels; none otherwise

## image70.png

### Identification
- **Image**: image70.png | **Source page**: secondary-navigation | **Alt/caption**: "img" (heading: "Vertical navigation with transparent page background")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — color-guidance demo: basic rail rendered directly on a gray card-page background
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: same Boreas caseworker as image95; daily-operator
- **Domain & brand context**: Boreas Foundation
- **Top 3 user tasks (ranked)**: 1. Switch case views 2. Read dashboard zones 3. Reach search/reference pages
- **Implied requirements**: "On card-based pages the nav must sit on the page background itself — no divider, no bounding card" (page text verbatim intent); "Cards must stay the only elevated surfaces"; "Nav legibility must survive a non-white canvas"
- **Data model sketch**: identical to image95 — Page ×6, placeholder metric zones ×6

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=gray #eeeeee (est.)
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] nav ×6 directly on gray (Dashboard selected: blue bar+STRONG)
   └─ PANE[center] SECTION "Dashboard" + GRID(3-col × 2 white CARDs w/ shadow)
```
- **Above the fold**: everything
- **Reading order**: F
- **Hierarchy rationale**: white cards pop forward on gray, so content zones now carry elevation hierarchy; nav stays flat/transparent — deliberately the *least* dressed element; H1 anchors top-left
- **Density**: 2 — six placeholder zones + rail
- **Ratios & spacing**: [NARROW:AUTO] as image95; card gaps ≈ STANDARD; nav rows compact (padding NONE)

### Styling specifics (OBSERVED; structure matches image95's CODE-VERIFIED block)
- **Palette**: page bg #eeeeee (est.) — the "TRANSPARENT"/scheme option the sections pattern exposes as local!headerContentBackgroundColor; nav labels ≈#1f6fba (est.) ACCENT, selected bar same; cards #ffffff with soft shadow; H1 #222 (est.)
- **Color application points**: accent confined to nav text/bar; white reserved for elevated cards; no nav container color at all
- **Typography moves**: as image95 — MEDIUM labels, STRONG+bar selected, H1 EXTRA_LARGE-equivalent
- **Imagery stance**: none
- **Card treatment**: content cards = white + shadow (elevated); nav = zero treatment — the teaching point
- **Signature moves**: instead of boxing the nav to separate it from gray, the pattern removes *all* nav chrome so cards alone read as content; selection bar works identically on gray because unselected spacer bars inherit invisibility (color-matched); gray canvas turns card whiteness into the grouping device

### Component inventory (INFERRED from image95 structure)
- a!headerContentLayout(backgroundColor:"TRANSPARENT"-equivalent gray); nav card rows as image95 with card style matching page bg; content cards default white with shadow (a!cardLayout shape/shadow defaults)
- Chart types: none
- Interactive affordances: 6 nav links

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — gray field, white islands, one accent
- **Why it works**: contrast inversion (white-on-gray cards vs gray-on-white of image95) gives elevation semantics for free; navless-chrome avoids a third surface level competing with cards; blue links remain legible on #eeeeee
- **Why not boring**: the restraint itself — a nav that is pure typography on the canvas; consistent bar glyph carrying selection across background variants
- **Boring twin**: the same page with the nav wrapped in its own white card with a border and divider line — three surface levels, nav competing with content cards for elevation.
- **What to steal**: on card-based pages, render rail nav directly on the canvas; keep unselected indicator glyphs background-colored; let background swaps (WHITE↔gray) re-theme without touching nav code
- **Risks**: ACCENT blue on gray loses a little contrast vs white; flat nav can be missed by users trained on boxed menus; selected-state hue dependence as in image95

### Code cross-check
- none specific — this variant reuses the basic-pattern SAIL (image95) with a non-white page background (the sections functional block exposes exactly this via local!headerContentBackgroundColor)

## image22.png

### Identification
- **Image**: image22.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Vertical navigation with contrasting background color")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — contrasting-rail color-guidance demo over placeholder dashboard
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: Boreas caseworker; daily-operator on a site where this rail persists on all/most pages (page text's precondition)
- **Domain & brand context**: Boreas Foundation
- **Top 3 user tasks (ranked)**: 1. Always-visible orientation across the site 2. Switch case views 3. Reach search/reference
- **Implied requirements**: "Nav must be prominent against the page background" (page text); "Use only if all/most pages share it — visual consistency"; "Selected state must work on a dark surface"
- **Data model sketch**: Page ×6 as image95

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] full-height #3B464E rail ×6 rows (+filler): Dashboard selected (white bar+STRONG)
   └─ PANE[center] SECTION "Dashboard" + GRID(3-col × 2 placeholder boxes)
```
- **Above the fold**: everything; rail runs to viewport bottom
- **Reading order**: F
- **Hierarchy rationale**: the rail is now the highest-contrast surface on the page (dark block on white) because prominence *is* this variant's requirement; selection downgrades to bar+weight since fill contrast is spent on the rail itself; content unchanged
- **Density**: 2 — rail + six empty zones
- **Ratios & spacing**: [NARROW:AUTO] ≈ 1:6.5; rows padding "NONE", marginBelow "NONE"; continuous band via stacked same-color cards + filler

### Styling specifics (CODE-VERIFIED)
- **Palette**: rail cards #3B464E on WHITE page; selected row: bar "❘" color "STANDARD" (auto-white on dark) + label STANDARD STRONG (white); unselected: bars #3B464E (invisible), labels #D0D7DC; content colorless
- **Color application points**: one dark neutral block; no accent hue anywhere in the nav — prominence via value contrast, not chroma
- **Typography moves**: labels MEDIUM; selected STRONG; bar LARGE; H1 as prior demos
- **Imagery stance**: none
- **Card treatment**: flat borderless card stack; no dividers between rows (color continuity does the work)
- **Signature moves**: instead of tinting with brand color, a desaturated slate carries prominence while staying quiet; instead of a fill or accent for selection, white-vs-#D0D7DC text plus the white bar — a two-step gray ramp; spacer bars color-matched to #3B464E keep the left edge stable

### Component inventory (CODE-VERIFIED)
- Row cards a!cardLayout(style:"#3B464E", padding:"NONE", marginBelow:"NONE", link:a!dynamicLink()) → sideBySide("❘" STANDARD/#3B464E, label STANDARD/#D0D7DC, MEDIUM, STRONG-when-selected); filler cards; a!columnsLayout(NARROW+AUTO); backgroundColor "WHITE"
- Chart types: none
- Interactive affordances: 6 row links

### Character & judgment
- **Register**: utilitarian-ops + institutional
- **Why it works**: dark rail anchors the layout on otherwise white pages (prominence requirement met with zero chroma); #D0D7DC→#ffffff+STRONG selected ramp is legible yet calm; matches the site-header darkness so chrome reads as one family
- **Why not boring**: no-accent selected state done purely with a neutral ramp; the same "❘" mechanism surviving a background inversion unchanged (structure identical to image95 — only four color values differ)
- **Boring twin**: a navy sidebar with white text, selected item highlighted solid brand blue with white text — louder, and it breaks when page content also uses blue.
- **What to steal**: value-contrast (not hue) for persistent rails; #D0D7DC as muted-on-dark text tone; identical row structure across light/dark variants for painless theming
- **Risks**: page text's own caveat — inconsistent if only some pages use it; #D0D7DC at MEDIUM is comfortable but STRONG-only selection difference needs the bar as backup; dark rail beside dark site bar can merge corners

### Code cross-check
- **Code-verified palette**: #3B464E rail, STANDARD (white) selected text/bar, #D0D7DC unselected, WHITE page
- **Notable techniques**: color:"STANDARD" exploiting auto-inversion on dark cards; padding "NONE" rows; invisible spacer bars in rail color
- **Corrections**: none

## image78.png

### Identification
- **Image**: image78.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "More prominent selected page style for vertical navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — selected-state emphasis variant of the contrasting dark rail
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: Boreas caseworker on visually dense pages (page text: users may struggle to spot the highlighted page)
- **Domain & brand context**: Boreas Foundation
- **Top 3 user tasks (ranked)**: 1. Instantly re-locate current page amid dense content 2. Switch views 3. Treat page identity as more significant than the site tab (page text's stated condition)
- **Implied requirements**: "Selected page must outrank the site-tab highlight"; "Signal must survive dense page content"; "Rail otherwise unchanged from contrasting pattern"
- **Data model sketch**: Page ×6 (Dashboard selected, My Cases, Overdue, All Cases, Advanced Search, Knowledge Base)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=WHITE
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] #3B464E rail: row1 = full-width #FFCD00 flood "Dashboard", rows2-6 muted
   └─ PANE[center] SECTION "Dashboard" + GRID(3-col × 2 placeholders)
```
- **Above the fold**: everything
- **Reading order**: F — the yellow row is the page's first fixation point
- **Hierarchy rationale**: selected row becomes the single most saturated element on screen (yellow flood on slate) per the pattern's brief; everything else inherits image22's quiet ramp; content untouched so the demo isolates one variable
- **Density**: 2 — rail + six placeholder zones
- **Ratios & spacing**: [NARROW:AUTO]; rows padding "EVEN_LESS" (slightly taller than image22's NONE), marginBelow "NONE"

### Styling specifics (CODE-VERIFIED)
- **Palette**: rail #3b464e; selected card #FFCD00 with bar "❘" STANDARD (near-black on yellow) + label STANDARD STRONG (near-black); unselected bars #3b464e (invisible), labels STANDARD auto-white; page WHITE
- **Color application points**: brand yellow at exactly one point — the selected row (site-tab underline uses the same hue at smaller scale, deliberately outranked)
- **Typography moves**: labels MEDIUM; selected STRONG; auto text-inversion gives white-on-slate / black-on-yellow from the same "STANDARD" token
- **Imagery stance**: none
- **Card treatment**: flat borderless stack; flood-fill selected card is the only "raised" perception
- **Signature moves**: instead of intensifying the bar or text, the *card style itself* flips (#3b464e→#FFCD00) — one param produces the whole state; brand accent reserved exclusively for "you are here"; bar glyph retained inside the flood for edge continuity with sibling patterns

### Component inventory (CODE-VERIFIED)
- Rows a!cardLayout(style: selected ? "#FFCD00" : "#3b464e", padding:"EVEN_LESS", marginBelow:"NONE", link) → sideBySide("❘" + label, MIDDLE, DENSE); filler card; NARROW+AUTO columns
- Chart types: none
- Interactive affordances: 6 row links

### Character & judgment
- **Register**: utilitarian-ops + institutional
- **Why it works**: yellow-on-slate ≈ 9:1 luminance pop locates the page from peripheral vision (the stated dense-page problem); auto-inverted black text keeps the yellow row readable (≈10:1); one-variable difference from image22 makes the family easy to systematize
- **Why not boring**: full-row brand flood instead of the timid underline/bar defaults; the same row component yielding three prominence tiers across sibling patterns (bar-only → text-ramp → flood)
- **Boring twin**: dark rail where selection is a slightly lighter gray row (#4a565f) — invisible exactly on the dense pages this pattern targets.
- **What to steal**: escalate selection prominence by swapping card fill, not adding ornament; keep one hue exclusively for location state; reuse identical row markup across prominence tiers
- **Risks**: yellow row can fight yellow site-tab underline (two "current" signals, different levels); flood state draws eye permanently — overkill on calm pages (page text scopes it to dense ones); #FFCD00 fails as text color elsewhere — must stay a fill

### Code cross-check
- **Code-verified palette**: #3b464e rail, #FFCD00 selected card, STANDARD auto-inverting text, WHITE page
- **Notable techniques**: single if() on card style as the entire state change; padding "EVEN_LESS" for taller touch target; same sideBySide row anatomy as siblings
- **Corrections**: none

## insurance_account_page_manual_tabs.png

### Identification
- **Image**: insurance_account_page_manual_tabs.png | **Source page**: secondary-navigation | **Alt/caption**: none (heading: "Basic horizontal navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal — customer self-service account page with manual card tabs
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: auto-insurance policyholder, occasional-customer checking payment and coverage
- **Domain & brand context**: "INSURECORP" — consumer insurance portal; saturated trust-blue branding
- **Top 3 user tasks (ranked)**: 1. Confirm next payment ($123.45, due July 1) and autopay 2. Review vehicles & coverage limits 3. Jump to Claims / Preferences tabs
- **Implied requirements**: "Three peer areas (Overview/Claims/Preferences) must be one click apart"; "Payment amount+due date visible first"; "Coverage limits per vehicle without navigation"; "Household drivers editable inline"; "Manual tabs (not tabLayout) to allow full-bleed billboard styling / URL control" (page intro rationale)
- **Data model sketch**: Account{nextPayment 123.45, dueDate Jul 1, source 'Pine Street Bank xxxx3456', autopay:true} 1—* Driver{name, role PRIMARY/SPOUSE/DEPENDENT CHILD, age, sex: Jane 44F, Sharif 42M, Benjamin 16M} 1—* Vehicle{'2021 Polestar 2','2009 Saab 9-5'} 1—* Coverage{type, deductible $500, limits $250k/person, $500k/incident, $100k property}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ header: CARD(#1155cc, "My Account" LARGE white, padding MORE)
│  └─ TABS ×3 manual (Overview selected: #65c7ee underline strip)
└─ COLUMNS [≈2:3] on gray
   ├─ SECTION "Payment" → CARD(NEXT PAYMENT $123.45 | Due July 1 ÷ PAYMENT SOURCE + AUTOPAY tag)
   │  └─ SECTION "Insured Drivers" → CARD(3 avatar rows + Edit links)
   └─ SECTION "Vehicles & Coverage" → CARD(VEHICLE 1 SBS coverage cols ÷ VEHICLE 2 …)
```
- **Above the fold**: billboard, tabs, payment card, both vehicles' coverage summaries
- **Reading order**: Z — brand → billboard title → tab row, then two-column F
- **Hierarchy rationale**: "My Account" at ≈EXTRA_LARGE white owns the top because orientation matters most for occasional users; payment card leads the left column (money task #1); coverage gets the wider column since it is the deepest content (4 coverage types × 2 vehicles)
- **Density**: 3 — ~12 data clusters in viewport with generous card padding; consumer-comfortable
- **Ratios & spacing**: content columns ≈ 2:3; tab cells NARROW each (CODE-VERIFIED), left-aligned run ending mid-band; card padding ≈ MORE; section gaps ≈ STANDARD

### Styling specifics (CODE-VERIFIED for header/tabs; content OBSERVED)
- **Palette**: billboard + tab band #1155cc; selected-tab underline #65c7ee; unselected underline #1155cc (invisible trick); white content wrapper card #fff (all CODE-VERIFIED); page canvas #efefef (est.); AUTOPAY chip #1155cc-family blue (est. #1155cc); Edit/Show More links #1155cc (est.); avatar chips pink #d5317e / blue #2f8fdd / green #43a047 (all est.); caps labels #6b6b6b (est.)
- **Color application points**: one brand blue for billboard, chip, links; light-blue reserved solely for "current tab"; avatar colors the only polychrome; content otherwise monochrome
- **Typography moves**: title ≈ EXTRA_LARGE white; tab labels MEDIUM white (selected STRONG); caps SMALL gray eyebrow labels (NEXT PAYMENT, PAYMENT SOURCE, PRIMARY, VEHICLE 1); amounts/names MEDIUM_PLUS STRONG; coverage values STANDARD
- **Imagery stance**: styled avatar initial-chips only; no photos
- **Card treatment**: white cards with soft shadow on gray; hairline internal dividers #e5e5e5 (est.)
- **Signature moves**: instead of a!tabLayout chrome, each tab is a NARROW column of two stacked borderless cards — label card + 4px underline card whose style flips #1155cc↔#65c7ee (underline appears only under the current tab); tabs sit *inside* the billboard so nav inherits brand color; AUTOPAY as a filled chip beside its explanation line rather than a checkbox row
- (Manual tabs enable full-bleed color continuity the built-in component wouldn't give — the pattern's reason to exist.)

### Component inventory (CODE-VERIFIED header; content INFERRED)
- Header a!cardLayout(style:"#1155cc", padding:"MORE") + a!columnsLayout of NARROW tab columns: cardLayout(label, style:"#1155cc") over cardLayout(underline, style: selected ? "#65c7ee" : "#1155cc", padding:"EVEN_LESS"), both showBorder:false, link:a!dynamicLink; wrapper card #fff marginBelow "MORE"; content: sectionLayouts + white cards, sideBySide avatar rows, richText caps eyebrows, tag-style AUTOPAY chip, Show More links
- Chart types: none
- Interactive affordances: 3 tab links, Edit ×5, Show More ×2, NEW-style actions none (read-mostly)

### Character & judgment
- **Register**: calm-clinical + institutional — big blue trust field, gray canvas, no urgency devices
- **Why it works**: underline-card trick yields a crisp selected state with zero layout shift (invisible twin underline always present); billboard-embedded tabs make three areas feel like one branded surface; caps-eyebrow + big-value rhythm lets an occasional user find $123.45 in seconds
- **Why not boring**: full-bleed billboard with in-band tabs instead of a white tab strip; light-blue-on-blue selected signal (tonal, not boxed); role-labeled avatar chips humanizing a policy record
- **Boring twin**: white page, a!tabLayout default gray tabs above an H2 "My Account", payment and coverage stacked full-width, drivers in a 3-column grid — no brand surface, standard chrome.
- **What to steal**: stacked label+underline cards for custom tabs; put horizontal tabs inside the page's brand band; invisible twin elements to avoid selection reflow
- **Risks**: white MEDIUM tab text on #1155cc passes, but #65c7ee underline is decorative-thin (~4px) for low vision; 3 tabs fine — pattern degrades past ~6 (page's own vertical/horizontal rule); billboard consumes ~25% viewport before content

### Code cross-check
- **Code-verified palette**: #1155cc band/tab cells, #65c7ee selected underline, #fff wrapper
- **Notable techniques**: two-card tab cells (~lines 4740-4790); underline via padding "EVEN_LESS" card; NARROW tab columns; marginBelow "NONE" stacking
- **Corrections**: none — billboard blue reads brighter on screen but code fixes #1155cc

## horizontal_tabs_framed.png

### Identification
- **Image**: horizontal_tabs_framed.png | **Source page**: secondary-navigation | **Alt/caption**: "horizontal tabs" (heading: "Framed horizontal navigation")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page — university student portal home with framed tab navigation
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: undergraduate student ("Karen"), daily/weekly check-ins on schedule and degree progress
- **Domain & brand context**: "Baxley" university (crest logo); collegiate deep-purple identity, friendly greeting tone
- **Top 3 user tasks (ranked)**: 1. Check today's/this week's class schedule (times, rooms) 2. Track path to graduation (credits, requirement checklist) 3. Act on registration window (REGISTER NOW) / hop to Academics, Housing, Career Services, Financial Aid
- **Implied requirements**: "Selected tab must blend seamlessly into the content frame" (heading's promise); "Schedule must show per-day time/course/location without clicks"; "Degree progress must combine quantitative (credits) and checklist views"; "Time-sensitive registration call-out must be prominent"; "Greeting + weather personalizes the daily visit"
- **Data model sketch**: Student{name Karen, degree 'Bachelor of Science (BS)', term Spring 2022, requiredCredits 120, completed 92, inProgress 15} 1—* Requirement{label, met?: GPA ✓, standing ✓, degree classes ○, electives ✓} 1—* ScheduleEntry{day Mon/Tue/Wed, start 9:00AM…, end, course 'CS 3100 Data Structures & Algorithms II', 'KOR 2020 Intermediate Korean II'…, room Thompson 404/Flores A201/Orborne Hall/Phillips 329}; Weather{62°F Cloudy, high 71, low 54}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#230f3d
├─ header: brand row + "Good morning, Karen!" + weather SBS (right)
├─ TABS ×5 (Home selected = #f3f0f6 card w/ #674ea7 top bar; others #402e57)
└─ FRAME CARD #f3f0f6 (selected tab merges into it)
   └─ COLUMNS [≈2:1]
      ├─ SECTION "My Class Schedule" → CARD(Monday rows×3) CARD(Tuesday, ACCENT start-bar, rows×2) CARD(Wednesday rows×3)
      └─ SECTION "My Path to Graduation" → CARD(ring+degree, credits ×3, checklist ×4)
         └─ CARD(promo: illustration + "Spring Semester Class Registration is Now Open" + REGISTER NOW)
```
- **Above the fold**: greeting, weather, tab row, Monday+Tuesday cards, full graduation card, promo card top
- **Reading order**: Z — greeting/weather across, tab row, then two-column F inside the frame
- **Hierarchy rationale**: greeting is the largest header text (daily-visit warmth) while tabs stay compact; schedule takes the wide column because it is the recurring daily task; graduation card leads the rail with the ring graphic; promo card sits last but is the only tinted card — time-boxed action gets chroma, not position
- **Density**: 3 — ~8 schedule rows, 3 credit stats, 4-item checklist, promo, 5 tabs in one viewport with airy card padding (matches the "university student dashboard" balanced anchor)
- **Ratios & spacing**: schedule:rail ≈ 2:1; tab cells NARROW + spacer column on desktop widths (CODE-VERIFIED a!isPageWidth guard); frame padding ≈ STANDARD; day-card internal rows divided by hairlines

### Styling specifics (CODE-VERIFIED)
- **Palette**: page/backgroundColor #230f3d; unselected tabs #402e57 (top bar color-matched #402e57 = invisible); selected tab + content frame #f3f0f6 with decorativeBarColor #674ea7 (TOP); day cards white, today (Tuesday) decorativeBarPosition "START" #674ea7-family ACCENT, siblings' start-bars "#fff" invisible (CODE-VERIFIED base pattern); promo card lavender #e9e2f4 (est.); checklist ✓ green #34a853 (est.), open item gray ring; REGISTER NOW outline purple ≈#674ea7 (est.); text near-black on light, white on purple
- **Color application points**: purple family owns chrome (bg, tabs, bar, promo text, button); green only on met requirements; weather/greeting white; schedule content monochrome
- **Typography moves**: greeting ≈ LARGE STRONG white; tab labels MEDIUM (selected STRONG dark, unselected white PLAIN — CODE-VERIFIED if()); section titles MEDIUM_PLUS STRONG; times STRONG STANDARD; caps eyebrows (REQUIRED/COMPLETED/IN-PROGRESS CREDITS) SMALL gray over EXTRA_LARGE-feel numerals 120/92/15; promo headline MEDIUM STRONG purple
- **Imagery stance**: flat illustration (reading figure + plant) in promo; glyph icons (grad-cap in ring, location pins, info dots, weather cloud)
- **Card treatment**: white cards, borderless, soft elevation on the #f3f0f6 frame; frame itself is a giant flat card on the dark page
- **Signature moves**: instead of an underline, the selected tab *is* the frame — same #f3f0f6 fill fused seam-lessly, with a #674ea7 decorativeBarPosition:"TOP" cap (folder-tab metaphor via two params); unselected tabs carry an invisible matching top bar so all tabs keep identical height (no jump on switch); today's schedule card flagged by a START decorative bar while siblings hold invisible #fff bars — alignment-stable "today" marker; dark #230f3d canvas frames the light content like a matte
- **Accessibility move (CODE-VERIFIED)**: dynamicLink labels append "(Selected)"/"Not Selected"; accessibilityText "Selected tab"

### Component inventory (CODE-VERIFIED)
- a!localVariables(local!tabs: a!map(name,id)×5, local!selectedTab) + a!forEach NARROW tab columns: a!cardLayout(style: if(sel,"#f3f0f6","#402e57"), decorativeBarPosition:"TOP", decorativeBarColor: if(sel,"#674ea7","#402e57"), link:a!dynamicLink(saveInto: local!selectedTab)) with preventWrapping richText; spacer column showWhen a!isPageWidth(TABLET_LANDSCAPE…DESKTOP_WIDE); frame card style "#f3f0f6"; header richText greeting + weather sideBySide ("62°F" STRONG etc.); day cards with decorativeBarPosition "START" (#fff vs ACCENT); choose()/match on local!selectedTab swaps framed contents
- Chart types: progress ring (custom/stamp composition; no chartField) — colorScheme n/a
- Interactive affordances: 5 stateful tabs, info icons, Show-more-style checklist tooltips (ⓘ), REGISTER NOW button, per-course rows (likely record links)

### Character & judgment
- **Register**: warm-community + institutional — first-name greeting, weather, illustration atop collegiate purple
- **Why it works**: tab-merges-into-frame removes the boundary between "nav" and "content" so switching feels like flipping folder tabs (the framed promise, executed with two card params); invisible twin decorative bars (tabs' TOP, days' START) deliver state without reflow; credits trio + checklist pairs number-progress with named next steps
- **Why not boring**: near-black purple canvas around a light frame (matte-and-artwork composition rare in enterprise UI); weather strip in an app header; folder-tab metaphor built from cardLayout primitives; tinted promo card as the only chromatic content surface
- **Boring twin**: white page, blue default tabLayout across the top, schedule as a single grid with a Day column, progress as a bare percentage bar, registration notice as a yellow banner alert at top.
- **What to steal**: decorativeBar TOP + shared fill for seamless selected tabs; color-matched invisible bars for stable geometry; dark page matte framing light content; append selection state to link labels for screen readers
- **Risks**: white-on-#402e57 unselected tabs ≈ 8:1 (fine) but PLAIN weight makes them recede for low vision; frame metaphor needs the spacer column — on narrow widths tabs compress (code guards with isPageWidth); ⓘ-only explanations hide requirement details behind hover; promo illustration + ring are decorative weight on slow connections

### Code cross-check
- **Code-verified palette**: #230f3d page, #402e57 unselected tabs, #f3f0f6 selected tab/frame, #674ea7 decorative bar; weather strings "62°F"/"71°"/"54°" match pixels
- **Notable techniques**: decorativeBarPosition/Color as tab cap (~functional lines 5583-5596); a!isPageWidth spacer column; preventWrapping tab labels; dynamicLink label + accessibilityText selection announcements; a!map-driven forEach tabs
- **Corrections**: none — pixels match the functional pattern exactly (including weather)
