# Analysis: calendar

Page context: "Calendar" pattern (section: patterns). Full SAIL source exists for both views → palettes and params CODE-VERIFIED. Demo data is a real-estate listing workflow (May 2026).

## calendar-month-view.png

### Identification
- **Image**: calendar-month-view.png | **Source page**: calendar | **Alt/caption**: none (heading: "Month view")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — calendar month view with detail panel (pattern widget, full-viewport)

### Use-case reconstruction (INFERRED)
- **Persona**: real-estate agent (Apex Horizon Realtors), daily-operator tracking listings, showings, and closing deadlines
- **Domain & brand context**: residential real-estate brokerage; calm, product-neutral styling with two semantic event hues
- **Top 3 user tasks (ranked)**: 1. See the selected day's schedule with full context 2. Scan how events/deadlines distribute across the month 3. Jump between days/months without leaving the page
- **Implied requirements**: "Must distinguish deadlines from events at a glance"; "Must show event detail without navigation (detail panel updates on date click)"; "Must dim past/other-month noise below current-month signal"; "Must expose today and the selected day as distinct states"
- **Data model sketch**: Event{datetime, date, title, type: Event|Deadline, icon, color, attendees[1..n], desc} ← titles/times/descriptions visible in panel; Day 1—* Event (CODE-VERIFIED against local!events)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
├─ SBS header: angle-left · "May 2026" · angle-right   [top-right: WEEK|MONTH toggle]
└─ COLUMNS [WIDE_PLUS:AUTO]
   ├─ CARD(month grid, style #FAFAFC border #eee SEMI_ROUNDED padding LESS)
   │  └─ GRID(7-col × 6 rows of date CARDs, DENSE spacing)
   └─ PANE[right] "Tuesday, May 19"
      └─ CARD ×3 (event detail: type row, title, desc)
```
- **Above the fold**: entire pattern — full month + 3 detail cards
- **Reading order**: F — header, then grid rows, then right panel
- **Hierarchy rationale**: month name is the only LARGE text → orients the time range (task 3); the grid card is ~70% of width → distribution scan is primary (task 2); selected-day panel gets a persistent column, not a popover → detail without navigation (task 1)
- **Density**: 3 — 42 date cells + 3 detail cards visible, but padding "LESS" and SMALL type keep it comfortable, not cramped
- **Ratios & spacing**: columns WIDE_PLUS:AUTO (≈ 72:28 observed); date cells height SHORT with DENSE column spacing and marginBelow LESS per row (CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: grid wrapper #FAFAFC on white page; current-month cells #FFF; other-month #F5F5FC; today #D2D2F980 (translucent periwinkle); selected border "ACCENT", default borders #EEE; secondary text #6C6C75; deadline #B2002C; event #2322f0; empty-state stamp #FAFAFC bg / #ddd icon
- **Color application points**: event-type icons+labels (flag=deadline red, calendar-day=event blue) in both grid and panel; today cell tint; selected-day accent border; nav icons #000; everything else neutral gray/white
- **Typography moves**: month title LARGE BOLD (H2); panel day header MEDIUM SEMI_BOLD (H3); weekday row SMALL all-caps #6C6C75; date numerals STANDARD (STRONG only for today); event titles/desc SMALL with STRONG titles — ladder narrows as information nests
- **Imagery stance**: styled icons only (richTextIcon SMALL, semantic colors)
- **Card treatment**: bordered flat cards, SEMI_ROUNDED; past-event panel cards drop the border and fill #FAFAFC (showBorder: datetime > now)
- **Signature moves**: instead of coloring whole day cells, they color only tiny event icons via richTextIcon(color:) — keeps 42 cells quiet; instead of a modal, day click saves into local!selectedDay and re-renders the right column (a!dynamicLink saveInto); instead of hiding past items, they de-border + gray-fill them (temporal layering); today vs selected are two independent visual channels (fill tint vs ACCENT border)

### Component inventory (CODE-VERIFIED)
- a!cardLayout(link: a!dynamicLink(saveInto: local!selectedDay), height:"SHORT", shape:"SEMI_ROUNDED", accessibilityText:"Selected") per date; nested a!forEach over rows→dates→events
- a!richTextDisplayField(preventWrapping:true) for in-cell event lines; a!headingField(headingTag:"H2"/"H3"); a!sideBySideLayout(spacing:"SPARSE", alignVertical:"MIDDLE") header; a!stampField empty state (icon "calendar-o", SMALL, centered)
- Charts: none | custom colors carried in event data maps (#B2002C / #2322f0)
- Interactive affordances: date cells as links, prev/next month richTextIcon links (caption+altText), WEEK/MONTH view toggle (OBSERVED in screenshot; not present in sample code)

### Character & judgment
- **Register**: calm-clinical — near-monochrome surface with exactly two semantic hues
- **Why it works**: three-layer gray system (#FFF / #F5F5FC / #FAFAFC) encodes month membership and time passage without legends; red/blue icon language is consistent between grid and panel, so the panel teaches the grid's code; preventWrapping keeps cell heights uniform so the grid stays scannable
- **Why not boring**: translucent today tint (#D2D2F980) layered under content instead of a loud "TODAY" badge; deadline red #B2002C is deep crimson, not alarm red — urgent yet composed; detail panel replaces the tired click-a-day-open-a-modal default
- **Boring twin**: a full-width HTML-table month with solid primary-color event pills, a "Today" button, and a modal on click; every cell bordered #000, weekend columns shaded dark.
- **What to steal**: encode "past" as border-loss + gray fill, not strikethrough; keep selected vs today on separate visual channels; pipe event color through data maps so type→color stays single-sourced
- **Risks**: SMALL gray-on-gray (#6C6C75 on #F5F5FC) other-month numerals near 4.5:1; truncated event titles in cells have no tooltip; 7-column grid will not stack on phones (pattern is desktop-oriented)

### Code cross-check
- **Code-verified palette**: as listed above — pixel estimates unnecessary
- **Notable techniques**: conditional style ternary today→current-month→other-month (~L324-328); showBorder driven by datetime comparison for past events (~L413); accessibilityText:"Selected" on the picked cell (~L312); char(10) line breaks inside richText event lists (~L363); empty-state card with stamp (~L482-507)
- **Corrections**: WEEK|MONTH toggle and its indigo solid/link button pair exist only in the screenshot, not in the sample SAIL — the page text ("toggle options on the same page") implies it but code omits it

## calendar-week-view.png

### week-view (page: calendar)
Official variant vocabulary: Month view · Week view

- **Produces it**: `a!columnsLayout(spacing:"NONE", showDividers:true)`, a!forEach day columns; event cards `style: if(past,"#FAFAFC", concat(fv!item.color,"1a"))`, showBorder:false (CODE-VERIFIED)
- **Looks like**: 7 divided columns, bold centered day headers, stacked tinted chips (icon + STRONG title + time)
- **Use when**: comparing one week day-by-day | **Avoid when**: events need context — surface it outside the columns
- **Styling hooks**: hex+"1a" alpha tints, #FAFAFC past, SEMI_ROUNDED, padding EVEN_LESS
- **Pairs well with**: month view via WEEK/MONTH toggle (OBSERVED)
- **Hexes**: #2322f0, #B2002C, #FAFAFC
- **Marker**: neutral

### Page rollup
Default to month view with detail panel; add week view only as a secondary toggle for short-window comparison, reusing the same event maps and color code.
