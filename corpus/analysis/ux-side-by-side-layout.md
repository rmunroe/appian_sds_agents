# Analysis: ux-side-by-side-layout

Component: Side by Side Layout (section: components). No SAIL source on page — all params INFERRED from figures + page text.
Official variant vocabulary (from page text): **Item width**: Automatically distribute (default) / Set Relative Width (1X–10X) / Use only as much space as necessary (minimal). **Item Spacing**: Standard (default), None, Dense, Sparse. **Margin Above/Below**: None (default), Even Less, Less, Standard, More, Even More. **Vertical Alignment**: Top (default), Middle, Bottom. **Stack When**: Never stack (default), Phone only, Portrait Tablet or narrower, Landscape Tablet or narrower, Narrow Desktop or narrower, Desktop or narrower, Custom.

Tier overrides: `colsbs_5.png`, `sidebyside_layout_margins_example.png`, `sidebyside_layout_spacing_example.png`, `sidebyside_layout_vertAlign_example.png` were suggested tier A by size, but each is a labeled variant-comparison figure (white demo panels on #f0f0f0 (est.) canvas) — cropped parameter demos, not full-page UIs → analyzed as tier B.

Cross-ref: `columns_layout_sbs_example.png` (dashboard with SBS nested inside a column) is analyzed under its primary page; on this page it illustrates the rule "columns/panes for page structure, SBS for fine-grained arrangement of small groups."

## colsbs_4.png

- **Produces it**: a!sideBySideLayout of three a!sideBySideItem text fields; First Name / Last Name wide-equal, M.I. narrow — width "1X" between "3X" siblings, or MINIMIZE on M.I. (INFERRED)
- **Looks like**: single name row; bold #333333 (est.) labels above thin-bordered inputs; tight ~16px gutters (OBSERVED)
- **Use when**: semantically-one-unit fields (name parts) must read as one row
- **Avoid when**: organizing page-level component groups — that's columns' job
- **Styling hooks**: per-item width, spacing
- **Marker**: neutral

## sidebyside_basicform_example.png

- **Produces it**: "Contact Us" a!formLayout; two a!sideBySideLayouts (First/M.I./Last; Email/Phone), all items default "Automatically distribute" — equal widths per row (OBSERVED); full-width paragraph Message below
- **Looks like**: baseline demo form; every input equal width regardless of expected content length
- **Use when**: peer fields of similar importance/length
- **Avoid when**: content lengths differ predictably (M.I. wastes width here) — switch to relative widths
- **Styling hooks**: none applied — this is the all-defaults reference
- **Marker**: neutral

## sidebyside_layout_margins_example.png

Override: suggested A → tier B (stacked "Standard" vs "Even More" comparison figure of the same Contact Us form).

### Standard
- **Produces it**: a!sideBySideLayout(marginAbove:"STANDARD", marginBelow:"STANDARD") (INFERRED)
- **Looks like**: comfortable ~20px breathing room above/below each row; form scans as one group (OBSERVED)
- **Use when**: normal form rhythm
- **Avoid when**: rows must sit flush (use None, the default)
- **Marker**: neutral

### Even More
- **Produces it**: marginAbove/marginBelow:"EVEN_MORE" (INFERRED)
- **Looks like**: ~90px voids isolate each row; form triples in height, rows read as disconnected islands (OBSERVED)
- **Use when**: deliberately isolating one row as its own zone
- **Avoid when**: multi-row forms — vertical sprawl breaks group scanning
- **Marker**: neutral

## sidebyside_layout_vertAlign_example.png

Override: suggested A → tier B (side-by-side "Top" vs "Bottom" comparison of one avatar+name card).

### Top
- **Produces it**: a!sideBySideLayout(alignVertical:"TOP") — default (INFERRED)
- **Looks like**: "Jane Smith" text pinned to top edge of tall circular #d63384 (est.) initial-avatar; name floats high, ragged baseline (OBSERVED)
- **Use when**: multi-line text should start at item top
- **Avoid when**: single-line text beside taller media — reads misaligned
- **Marker**: neutral

### Bottom
- **Produces it**: alignVertical:"BOTTOM" (INFERRED)
- **Looks like**: name hugs avatar's bottom edge
- **Use when**: baseline-anchoring text to media bottom
- **Avoid when**: avatar+name lockups — MIDDLE (not pictured) is the conventional choice; both extremes shown here look off-balance
- **Marker**: neutral

## sidebyside_layout_spacing_example.png

Override: suggested A → tier B (stacked "None" vs "Sparse" comparison of the two form rows).

### None
- **Produces it**: a!sideBySideLayout(spacing:"NONE") (INFERRED)
- **Looks like**: zero gutter — adjacent input borders touch and fuse into one segmented control (OBSERVED)
- **Use when**: composing attached clusters (input + button, segmented inputs)
- **Avoid when**: independent labeled fields — labels collide with neighbors' boxes
- **Marker**: neutral

### Sparse
- **Produces it**: spacing:"SPARSE" (INFERRED)
- **Looks like**: wide ~48px gutters; each field clearly its own object (OBSERVED)
- **Use when**: airy, low-density forms at wide widths
- **Avoid when**: many items per row — wide gutters starve the inputs themselves
- **Marker**: neutral

## sidebyside_layout_relativePIC.png

- **Produces it**: a!sideBySideItem(width:"3X"/"1X"/"3X") on name row; "2X"/"1X" on Email/Phone (page-text-confirmed labels)
- **Looks like**: annotation figure — orange #f7a942 (est.) outline boxes with X-factor labels overlaid on the Contact Us form; hexes are annotation ink, not UI (OBSERVED)
- **Use when**: teaching/planning proportional widths matched to expected content length (M.I., phone get less)
- **Avoid when**: n/a — schematic
- **Styling hooks**: width ratios only
- **Marker**: neutral

## sidebyside_layout_stacking_example.png

- **Produces it**: both layouts with Stack When = "Phone only" → stackWhen:{"PHONE"} (INFERRED); rendered at phone width
- **Looks like**: all six fields full-width, vertically stacked; label-above-input preserved; order First→M.I.→Last→Email→Phone→Message (OBSERVED)
- **Use when**: any form reachable on phones — rows of thirds are unusable at ~400px
- **Avoid when**: never-stack is defensible only for guaranteed-desktop tools
- **Styling hooks**: stackWhen breakpoint list
- **Marker**: neutral

## colsbs_5.png

Override: suggested A → tier B — two-state parameter demo (avatar "Large" top vs "Small" bottom) of one billboard header crop, not a full page.

- **Produces it**: billboard-style bar (dark scrim ~#3a3a3a at ~60% (est.) over illustrated artwork) containing a!sideBySideLayout: a!sideBySideItem(a!imageField(style:"AVATAR" circle, size:"LARGE"→"SMALL"), width:"MINIMIZE") + rich-text item taking remaining width (INFERRED)
- **Looks like**: white-bordered circular portrait; white text — "PROFESSOR" all-caps ≈SMALL over "Margaret Walton" ≈LARGE_PLUS with bold surname. Shrinking image Large→Small: minimal-width column contracts automatically, text block slides left; no manual re-layout (OBSERVED)
- **Use when**: fixed-size media beside flexible text (profile headers)
- **Marker**: neutral

## minimizeTextLinks.png + minimizeDropdown.gif (DO/DON'T pair)

### Principle: Reserve minimal width for items that cannot change width
- **DO shows**: activity feed (date rail + bordered event cards, "Bree Mercer edited…" rows); avatar, right-aligned timestamp, and short static links Comment / Track Case / Delete (blue #205b87 (est.), underlined) sit at minimal width, so the event sentence gets all remaining width (OBSERVED)
- **DON'T shows**: "Patient Intake Form" whose Symptoms multiselect dropdown has minimal width — each selection lengthens its value text, so the control itself widens and shoves the SUBMIT button around; layout jitters with every click (OBSERVED)
- **Rule**: MINIMIZE only fixed-width content — fixed-size images, static text/links, buttons, tags; never inputs whose rendered width follows user interaction
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!sideBySideItem(width:"MINIMIZE") around static items; interactive inputs keep AUTO or relative widths

## minimizeDropdown.gif

### Interaction: minimal-width dropdown reflow (gif: minimizeDropdown.gif)
- **State chart**: idle ~70px Symptoms dropdown beside SUBMIT → open list, check "Nausea" → control widens to fit value text → check Fatigue, Body aches, Congestion, Vomiting, Cramps, Loss of Appetite → value string "…Vomiting, Cramps, Loss of Appetite ⊗" grows ~5× wide, SUBMIT pushed right on every selection → loop resets (OBSERVED across frames f0–f63)
- **SAIL mechanism**: other — no state logic; width:"MINIMIZE" recomputing from content
- **UX purpose**: anti-pattern demo — shows layout instability, the visible cost of the DON'T
- **Replicate when**: never; cite it to justify AUTO widths on inputs | **Cost**: n/a
- **Marker**: dont

## sidebyside_layout_auto_example.gif

### Interaction: auto-distribute under window resize (gif: sidebyside_layout_auto_example.gif)
- **State chart**: Contact Us form at ~950px viewport → user drags browser edge wider → all items per row grow while staying exactly equal (3-way and 2-way splits hold) → drags narrower → equal shrink, no reflow or stacking (OBSERVED across frames f0–f124)
- **SAIL mechanism**: other — default "Automatically distribute" width recalculation on viewport resize; no code state
- **UX purpose**: orientation — teaches what the default does before the relative/minimal alternatives
- **Replicate when**: peer fields of equal importance | **Cost**: none — it is the default
- **Marker**: neutral

## sidebyside_layout_relative_example.gif

### Interaction: relative widths under window resize (gif: sidebyside_layout_relative_example.gif)
- **State chart**: same form with 3X/1X/3X and 2X/1X assignments → M.I. and Phone render narrow at start → window dragged wider → every item grows but 3:1:3 and 2:1 proportions hold constant → dragged back, proportions still hold (OBSERVED across frames f0–f118)
- **SAIL mechanism**: other — a!sideBySideItem(width:"3X"…) proportional distribution
- **UX purpose**: orientation — contrast with auto-distribute: width now encodes expected content length
- **Replicate when**: predictable length differences (initials, phone vs email) | **Cost**: trivial — one param per item
- **Marker**: neutral

## Page rollup

Default choice for most cases is **Automatically distribute** because equal peer widths are stable and free; switch to **relative (3X/1X…)** when content lengths differ predictably, and reserve **MINIMIZE** strictly for fixed-width media, static links/text, buttons, and tags (the DO/DON'T pair shows why). Pair any multi-item row with stackWhen "Phone only" or narrower. Spacing/margin defaults (Standard/None) are right for forms; None-spacing is a compositing tool, Even More margins an isolation tool — both exceptional. SBS formats small groups inside a structure owned by columns/panes (see cross-ref).
