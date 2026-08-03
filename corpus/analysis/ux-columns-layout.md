# Analysis: ux-columns-layout

Source page: `corpus/pages/ux-columns-layout.md` (components section). No SAIL source anywhere on this page — every hex below is a pixel estimate `(est.)`.
Tier overrides: manifest marks `columns_layout_margins_example.png`, `columns_layout_vertAlign_example.png`, and `columns_layout_spacing_example.png` as tier A, but each is a labeled two-state parameter-comparison figure (same form rendered twice on a gray canvas), not a full-page UI — per protocol rule 4 they are analyzed as tier B. `columns_layout_basicform_example.png` and `columns_layout_sbs_example.png` are genuine full-page screenshots and keep tier A. `columns_layout_fixauto_example.png` + `columns_layout_fullfix_example.png` are siblings under "Negative space" and are grouped as one tier-C DO/DON'T pair.
GIF note: several extracted frames (autowidth f12, fixedwidth f12, relativewidth f12, pane f60) are blank/partial GIF-disposal artifact frames; behavior was read from the intact frames on either side.

## columns_layout_sbs_example.png

### Identification
- **Image**: columns_layout_sbs_example.png | **Source page**: ux-columns-layout | **Alt/caption**: "Dashboard interface example displaying a side by side layout within a columns layout"
- **Device frame**: desktop
- **Marker**: neutral (documentation figure — orange outline "1" marks the two main columns, teal outline "2" marks a side-by-side row; overlays are annotations, not UI)
- **UI type**: record-view (customer self-service account overview)

### Use-case reconstruction (INFERRED)
- **Persona**: auto-insurance policyholder; occasional-customer checking billing/coverage monthly
- **Domain & brand context**: consumer insurance ("INSURECORP"); trustworthy retail-financial feel, single strong brand blue
- **Top 3 user tasks (ranked)**: 1. Confirm next payment amount, date, and source 2. Verify who and which vehicles are covered (and at what limits) 3. Jump to edits or Claims/Preferences tabs
- **Implied requirements**: "Must show next payment + due date without scrolling"; "Must list every insured driver with household role"; "Must summarize per-vehicle coverage limits with progressive disclosure"; "Must offer inline Edit per driver/vehicle/payment source"; "Must keep claims one tab away"
- **Data model sketch** (OBSERVED labels): Account(nextPayment $123.45, due July 1, source Pine Street Bank xxxx3456, autopay) 1—* Driver(name, role PRIMARY|SPOUSE|DEPENDENT CHILD, age, sex: Jane 44 F, Sharif 42 M, Benjamin 16 M) and 1—* Vehicle(2021 Polestar 2, 2009 Saab 9-5) 1—* Coverage(type Comprehensive|Collision|Bodily Injury|Property Damage, deductible $500, limits $250,000/person, $500,000/incident, $100,000/incident)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ NAVBAR solid blue: INSURECORP brand + waffle + avatar
├─ BILLBOARD h≈220 overlay=none, solid #1959ce (est.), title "My Account" white
├─ TABS ×3 (Overview|Claims|Preferences) active=underline
└─ COLUMNS [2:3]                          ← annotation ①
   ├─ SECTION "Payment" → CARD(NEXT PAYMENT $123.45 + due; PAYMENT SOURCE + AUTOPAY tag)
   │  └─ SECTION "Insured Drivers" → CARD(3× SBS[avatar : name+age : Edit])   ← annotation ② on Jane row
   └─ SECTION "Vehicles & Coverage" → CARD(VEHICLE 1 [title+Edit : coverage stack] ─divider─ VEHICLE 2 …, Show More links)
```
- **Above the fold**: nav, full billboard, tabs, payment card, first two drivers, all of Vehicle 1's coverage
- **Reading order**: F — billboard title, then left payment card, sweep right to coverage
- **Hierarchy rationale**: money (task 1) owns top-left; drivers stack beneath it as the second glance; coverage detail gets the wide right column because it is the longest, most label-dense content
- **Density**: 3 — two content columns, three sections, ≈18 labeled values visible with comfortable card padding
- **Ratios & spacing**: main split ≈[2:3]; content stops ≈80% viewport width (right margin left empty); card padding ≈ STANDARD; section gaps ≈ marginBelow STANDARD

### Styling specifics (OBSERVED)
- **Palette**: billboard/nav blue #1959ce (est.), page bg #f7f8fa (est.), card bg #ffffff, link blue #2d6fd8 (est.), avatar pink #d2258e / blue #2d6fd8 / green #3e9c46 (est.), text #222222, secondary gray #6f7680 (est.), borders #e3e6ea (est.); annotation overlays orange #f6a938 + teal #35c4d0 (est.) — doc chrome, not UI
- **Color application points**: solid billboard block; AUTOPAY filled blue tag; Edit/Show More links; per-person avatar hues; active-tab underline
- **Typography moves**: page title LARGE_PLUS white; section headers MEDIUM bold; all-caps SMALL gray kickers (NEXT PAYMENT, PRIMARY, VEHICLE 1…); $123.45 and names MEDIUM_PLUS bold; coverage values STANDARD
- **Imagery stance**: no photos in content; colored initial avatars (~40px); photo avatar in nav only
- **Card treatment**: white, hairline border + faint shadow, squared corners
- **Signature moves**: instead of a photo billboard, a flat brand-blue block via billboard/header background; instead of a driver grid, role kickers over SBS rows (avatar : name : Edit); instead of burying payment method, an AUTOPAY tagField inline with the source; instead of dumping all limits, "Show More" truncation per vehicle

### Component inventory (OBSERVED)
- a!headerContentLayout + solid-color billboard/header; a!columnsLayout ≈[2:3]; a!cardLayout(showBorder/shadow subtle) ×3; a!sideBySideLayout for driver rows and vehicle title-vs-limits split; a!tagField ("AUTOPAY"); a!richTextDisplayField all-caps kickers; tab bar (record tabs or button array); a!linkField Edit/Show More
- Chart types: none
- Interactive affordances: 3 tabs, per-entity Edit links, Show More expanders, nav waffle/avatar

### Character & judgment
- **Register**: institutional + calm-clinical — one brand blue, white cards, no decorative imagery
- **Why it works**: payment card answers the #1 recurring question in the first fixation; all-caps role kickers make a 3-person household scannable in one pass; the [2:3] split matches content length (short money facts vs long coverage stacks)
- **Why not boring**: saturated solid-blue billboard instead of default white header; person-hued initial avatars; AUTOPAY as a filled tag rather than body text; kicker-over-value typography rhythm repeated in every card
- **Boring twin**: white page header, drivers and vehicles as two data grids with Name/Age/Relationship columns, payment method as a plain field row, no tags or avatars — accurate, unscannable, forgettable
- **What to steal**: solid brand-color billboard for consumer portals; all-caps kickers to label repeating rows; put the recurring money fact top-left of a [2:3]
- **Risks**: blue used for brand, links, tag, and avatar simultaneously (state vs identity blur); teal/orange overlays could be mistaken for UI in synthesis; long coverage stacks will push drivers far down when columns stack on phone

### Code cross-check
- none (no SAIL source on page)

## columns_layout_pane_example.gif

### Interaction: independent pane scrolling (gif: columns_layout_pane_example.gif)
- **State chart**: cursor in left FILTERS pane → scroll: filter stack advances (Property Features → Status → Listed/Offered date ranges → Listing Agent) while right listing cards do not move → cursor to right pane → scroll: cards advance ($1,695,000 NEW LISTING → $2,150,000 OPEN HOUSE SCHEDULED) while filters hold position
- **SAIL mechanism**: pane transition — a!paneLayout [left filters : center results], each pane owning its own scrollbar; columnsLayout cannot do this
- **UX purpose**: orientation — filters stay reachable beside an unbounded result list
- **Replicate when**: sidebar tools + long scrolling list (list/filter screens) | **Cost**: top-level layout commitment for the whole page. Chrome seen: plum nav #6e4b69 (est.), tag orange #f0942d / green #3f8f29 (est.)

## columns_layout_basicform_example.png

### Identification
- **Image**: columns_layout_basicform_example.png | **Source page**: ux-columns-layout | **Alt/caption**: "Basic columns layout example within a form layout"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form

### Use-case reconstruction (INFERRED)
- **Persona**: parent/guardian; first-time-public, completes once per field trip
- **Domain & brand context**: K-12 school communication; friendly-institutional, single green accent (permission-slip register)
- **Top 3 user tasks (ranked)**: 1. Grant or deny permission explicitly 2. Enter the student's name 3. Sign electronically and submit
- **Implied requirements**: "Must capture explicit consent OR refusal (not silence)"; "Must capture student name and guardian e-signature"; "Must be completable in under a minute"; "Must keep decision and inputs visible together without scrolling"
- **Data model sketch** (OBSERVED): PermissionSlip(studentName, permission ∈ {give, NOT give}, signature, submittedAt); one slip per student

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM "Field Trip Permission Form"
├─ COLUMNS [1:1]
│  ├─ "Student First and Last Name:" TEXT · "Please electronically sign this form below:" + DRAW SIGNATURE
│  └─ "Do you give your student permission to attend?" CHECKBOX ×2 (give / do NOT give)
└─ divider → CANCEL (outline, left) ·· SUBMIT (solid, right)
```
- **Above the fold**: the entire form
- **Reading order**: Z — title, name field, sweep right to the consent question, down to signature, ending on SUBMIT
- **Hierarchy rationale**: the consent question gets its own column at eye level because it is the legal point of the artifact; name+signature stack left as identity plumbing; SUBMIT is the only filled element, terminating the Z
- **Density**: 2 — three inputs and two buttons on a full desktop viewport; whitespace dominates every zone
- **Ratios & spacing**: columns [1:1]; title and footer separated by hairline rules; footer buttons pinned to opposite edges

### Styling specifics (OBSERVED)
- **Palette**: page/card bg #ffffff, text #333333 (est.), rules #e6e6e6 (est.), input border #d9d9d9 (est.), primary green #3f7d20 (est.) as SUBMIT fill and CANCEL border/text; no other hue anywhere
- **Color application points**: buttons only — the two greens are the entire color story
- **Typography moves**: title LARGE_PLUS bold; question/label text STANDARD bold (labels phrased as sentences with colons); button labels SMALL all-caps
- **Imagery stance**: none (small scribble glyph inside DRAW SIGNATURE button)
- **Card treatment**: single flat white sheet with hairline page border; no inner cards
- **Signature moves**: instead of field-name labels, full-sentence question labels ("Do you give your student permission to attend?"); instead of a lone opt-in box, paired opposite checkboxes forcing an explicit yes/no; instead of default accent blue, one school-green for both button roles (fill vs outline distinguishes them); signature as an outlined affordance button, not an empty canvas

### Component inventory (OBSERVED)
- a!formLayout(title, buttons); a!columnsLayout(2× a!columnLayout width AUTO); a!textField; a!checkboxField(choiceLabels: "I give permission", "I do NOT give permission"); a!signatureField ("DRAW SIGNATURE"); a!buttonLayout(primary SUBMIT solid, secondary CANCEL outline)
- Chart types: none
- Interactive affordances: text entry, checkboxes, signature capture, submit/cancel

### Character & judgment
- **Register**: warm-community + institutional — school paperwork made polite by plain language and one calm green
- **Why it works**: every required act (name, decision, signature, submit) is a distinct visual zone; the filled-vs-outlined green pair encodes primary/secondary without a second hue; nothing competes with the three inputs
- **Why not boring**: question-phrased labels read like the paper slip parents already know; the explicit "I do NOT give permission" option (rare in digital forms); monochrome-green button system
- **Boring twin**: one stacked column labeled Name / Permission (Yes-No dropdown) / Signature, default blue buttons bottom-left — functional, but the consent moment loses its dedicated column and the form reads as data entry rather than a decision
- **What to steal**: paired opposite checkboxes for consent; sentence-labels on public-facing forms; single-hue button pairs (fill = primary)
- **Risks**: two independent checkboxes permit both/neither checked — needs validation or radio semantics; right column's lower half is empty (stacked on phone, checkboxes drift far from SUBMIT); green-only affordances lean on shape for colorblind users (fill vs outline holds up)

### Code cross-check
- none

## columns_layout_margins_example.png

Tier override A→B: labeled comparison figure ("Standard" vs "Even More"), same permission form twice on gray canvas #f0f0f0 (est.).

## Component: columnsLayout margins (page: ux-columns-layout)
Official variant vocabulary: marginAbove/marginBelow = None (default) · Even Less · Less · Standard · More · Even More

### Standard
- **Produces it**: a!columnsLayout(marginAbove:"STANDARD", marginBelow:"STANDARD")
- **Looks like**: ≈20px (est.) band between the title rule and the two-column block, and again above the footer rule
- **Use when**: giving a column group breathing room from adjacent sections | **Avoid when**: section gaps already exist (double-spacing)
- **Styling hooks**: marginAbove/marginBelow ladder
- **Marker**: neutral

### Even More
- **Produces it**: marginAbove:"EVEN_MORE", marginBelow:"EVEN_MORE"
- **Looks like**: ≈64px (est.) voids above and below the identical content; the form grows roughly a third taller with nothing added
- **Use when**: airy landing/editorial compositions | **Avoid when**: task forms — it pushes SUBMIT toward the fold
- **Styling hooks**: same ladder
- **Marker**: neutral

## columns_layout_vertAlign_example.png

Tier override A→B: labeled comparison figure ("Top" vs "Bottom"), same form twice.

## Component: columnsLayout vertical alignment (page: ux-columns-layout)
Official variant vocabulary: Top (default) · Middle · Bottom (Middle not shown)

### Top
- **Produces it**: a!columnsLayout(alignVertical:"TOP")
- **Looks like**: both columns hang from one top line; the name field sits level with the first paragraph
- **Use when**: default reading posture — eyes enter both columns at the top | **Avoid when**: a short column should anchor to a neighbor's baseline
- **Styling hooks**: alignVertical
- **Marker**: neutral

### Bottom
- **Produces it**: alignVertical:"BOTTOM"
- **Looks like**: the shorter form column slides down; its last checkbox lands level with the left column's final text line, moving the empty space above the fields
- **Use when**: baseline-anchoring inputs against a taller text column | **Avoid when**: fields drop out of the natural eye path below their entry point
- **Styling hooks**: alignVertical
- **Marker**: neutral

## columns_layout_spacing_example.png

Tier override A→B: labeled comparison figure ("None" vs "Sparse"), same form twice.

## Component: columnsLayout column spacing (page: ux-columns-layout)
Official variant vocabulary: Standard (default) · None · Dense · Sparse

### None
- **Produces it**: a!columnsLayout(spacing:"NONE")
- **Looks like**: zero gutter — the left paragraph's rag nearly touches the name input; two columns read as one crowded block
- **Use when**: flush composites (edge-to-edge media, custom alignment) | **Avoid when**: text-bearing columns, as shown — crowding
- **Styling hooks**: spacing
- **Marker**: neutral

### Sparse
- **Produces it**: spacing:"SPARSE"
- **Looks like**: ≈48px (est.) gutter; a clean white channel separates prose from fields, at the cost of earlier line wraps
- **Use when**: low-density pages needing unmistakable column separation | **Avoid when**: horizontal space is scarce
- **Styling hooks**: spacing
- **Marker**: neutral

### Page rollup
Default choice for most cases is the shipped defaults — spacing "STANDARD" with margins "NONE" — because forms and dashboards get adequate separation from section structure alone; reach for SPARSE/More-margins only on airy editorial pages, and treat NONE spacing as a special-purpose flush tool, never a density hack.

## columns_layout_autowidth_example.gif

### Interaction: automatic width distribution (gif: columns_layout_autowidth_example.gif)
- **State chart**: permission form, two equal columns (text left, name+consent right) → window edge dragged narrower → both columns compress equally, paragraphs wrap taller → dragged wider → columns relax back to a 50/50 split (f12 is a blank artifact frame)
- **SAIL mechanism**: other — default a!columnLayout width:"AUTO" on both; the browser re-distributes available width evenly on every resize
- **UX purpose**: orientation — baseline fluid behavior before any width tuning
- **Replicate when**: peer columns of equal importance | **Cost**: none — it is the default

## columns_layout_relativewidth_example.gif

### Interaction: relative width scaling 2x/1x (gif: columns_layout_relativewidth_example.gif)
- **State chart**: left prose column at 2x, right form column at 1x → narrow: both shrink, ratio visibly stays 2:1 → widen: proportion unchanged at every intermediate width (f12 blank artifact frame)
- **SAIL mechanism**: other — a!columnLayout(width:"2X") beside width:"1X"
- **UX purpose**: orientation — proportional scaling for screens that get resized often
- **Replicate when**: dominant content plus a subordinate rail that should scale together | **Cost**: at extreme narrowness the 1x column becomes cramped before stacking — test the breakpoint range

## columns_layout_fixedwidth_example.gif

### Interaction: fixed width beside auto (gif: columns_layout_fixedwidth_example.gif)
- **State chart**: right column (name field + consent checkboxes) fixed at "Medium" ≈250px (est.) → resize narrower: right column width does not change; the auto left column absorbs the entire delta, prose wrapping into taller blocks → widen: left relaxes, right still constant
- **SAIL mechanism**: other — a!columnLayout(width:"MEDIUM") beside default AUTO
- **UX purpose**: orientation — a stable measure for the control cluster regardless of viewport
- **Replicate when**: inputs or action stacks must keep a constant width across devices | **Cost**: fixed columns can overflow small screens — pair with stackWhen

## columns_layout_autofixedCal_example.gif

### Interaction: fixed rails, automatic center (gif: columns_layout_autofixedCal_example.gif)
- **State chart**: agent home "Good morning, Denise" — My Tasks rail | month calendar | Actions+Conversations rail → window narrowed: both rails hold their width while the calendar column alone compresses (day cells shrink, task chips truncate to "Review new cl…") → window widened: calendar re-expands, chips read fully again
- **SAIL mechanism**: other — fixed-width outer a!columnLayouts flanking an AUTO center
- **UX purpose**: orientation — the main workspace stays the focus; side tools never reflow
- **Replicate when**: tri-pane operator homes (task rail + workspace + action rail; density-4 page) | **Cost**: the auto center takes all compression — verify it stays usable before the stack breakpoint

## columns_layout_relative2_example.gif

### Interaction: relative widths preserving hierarchy (gif: columns_layout_relative2_example.gif)
- **State chart**: coverage dashboard on vivid blue bg #2b46dd (est.) — "Your coverage details" (≈2x) beside "Your discounts" + "Your savings" (≈1x) → progressive narrowing: both columns shrink in proportion; discount labels wrap, EDIT rows compress, yet the $113.50/$646.95 price header, accent-bar discount cards (violet #7a5fa8 / orange #e2953f / green #62a844, est.) and 24% donut hold their positions → widening restores the original composition intact
- **SAIL mechanism**: other — relative column widths (2X/1X pattern)
- **UX purpose**: orientation — demonstrates the style rule that layout hierarchy must survive every window size
- **Replicate when**: sanity-checking any relative-width layout mid-resize | **Cost**: demands content that wraps gracefully (short labels, stacked cards)

## columns_layout_fixauto_example.png + columns_layout_fullfix_example.png

### Principle: Center fixed content between empty automatic rails
- **DO shows** (fixauto, marked Automatic | Fixed | Automatic): the "What We Do" band — heading with short blue rule #2b36d9 (est.) and three photo cards (Conservation, Research, Education) held to ≈70% of the viewport by two EMPTY auto-width side columns; body lines wrap at a readable ≈55–60 characters and the section keeps a focal center
- **DON'T shows** (fullfix, bracket marked Fixed): every column fixed and spanning the full screen — cards stretch edge-to-edge, lorem lines nearly double in measure, and the band loses its center; fixed-everything also risks overflow on smaller screens than the designer's
- **Rule**: cap content width with empty flanking AUTO columns; never fill the screen just because space exists, and never fix every column
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!columnsLayout[a!columnLayout(width:"AUTO", empty), fixed-width content column(s), a!columnLayout(width:"AUTO", empty)]

## columns_layout_stacking_example.gif

### Interaction: responsive stacking at a chosen breakpoint (gif: columns_layout_stacking_example.gif)
- **State chart**: two-column permission form → window dragged toward portrait-tablet width: columns compress but remain side by side → at the breakpoint the right column (name + consent checkboxes) drops below the prose column, both spanning full width (f20) → footer keeps CANCEL left / SUBMIT right
- **SAIL mechanism**: other — stackWhen set to "Portrait Tablet or narrower" (right/later columns stack beneath left)
- **UX purpose**: orientation — content stays readable instead of crushing at tablet width
- **Replicate when**: any multi-column form reachable from tablets/phones | **Cost**: column order becomes vertical order — put the column users must see first on the left
