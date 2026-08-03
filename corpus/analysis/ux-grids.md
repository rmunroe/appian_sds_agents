# Analysis: ux-grids

Page: `corpus/pages/ux-grids.md` (section: components). Official styling vocabulary named by the page and used below: spacing `STANDARD`/`DENSE`; border style `STANDARD`/`LIGHT`; selection style `ROW_HIGHLIGHT`/`CHECKBOX`; column widths `AUTO` / fixed (`ICON`,`NARROW`,`WIDE`) / relative (`1X`…`10X`) / `DISTRIBUTE` (editable); record action placement in-column vs `TOOLBAR` above grid. Tier B sections use the variant template; tier C sections are DO/DON'T principles; a tier-B page rollup closes the file.

## regular_grid.png + bad_grid_example.png

### Principle: Keep grid values concise and consistently formatted
- **DO shows**: 5-column employee grid (Name↑ sorted, Department, Title, Phone, right-aligned Start Date), 10 uniform-height rows, zebra shading #f7f7f7 (est.), one format per column (phones `321-789-4560`, dates `May 08, 2017`), paging `1 – 10 of 20` bottom-right. OBSERVED
- **DON'T shows**: product grid where one row balloons to ~5× height — unscaled product photo, a full marketing paragraph in Description, mixed date formats (`02/01/2015` vs `Yesterday`), inconsistent name formats (`Wine Glass` vs `#803184041 Large (20oz)…`), an empty cell. Scanability collapses. OBSERVED
- **Rule**: A grid is for scanning — concise values, one consistent format and image size per column; paragraphs belong in record views.
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: format values before binding (a!dateField display, text() patterns); link to record for prose; fixed thumbnail size in a!imageField; sortable columns need atomic values.

## logical_sort_order.png

- **Produces it**: a!gridField with initialSorts: a!sortInfo(field: "tenure", ascending: false) on the "Tenure (in Years)" column; bold label above via label or a!richTextDisplayField. OBSERVED sort glyph ↓ right of header.
- **Looks like**: "Longest Tenured Employees" grid, 4 rows zebra-striped, tenure descending 15→3.
- **Use when**: one column ranks importance | **Avoid when**: users expect alphabetical lookup.
- **Styling hooks**: initialSorts, sortField per column, zebra shading.
- **Pairs well with**: user filters, search (next image).
- **Hexes**: none (color not the variant dimension)
- **Marker**: neutral

## commonly_used_filters.png

- **Produces it**: record-type-backed a!gridField inheriting search box + user filters ("Title", "Department" dropdowns, "Clear Filters" reset link), or manual filter row above the grid. INFERRED from page text recommending Record Type source.
- **Looks like**: labeled Search input + two dropdowns (Department preset to "Sales") + blue #2276bf (est.) Clear Filters link with reset icon, sitting flush above the tenure grid.
- **Use when**: lists exceed one page | **Avoid when**: <10 rows with obvious sort.
- **Styling hooks**: userFilters, showSearchBox, filter layout columns.
- **Pairs well with**: logical default sort; batch size tuning.
- **Hexes**: none
- **Marker**: neutral

## grids_editable_grid_reordering.gif

### Interaction: Editable grid row reordering (gif: grids_editable_grid_reordering.gif)
- **State chart**: hover 6-dot drag handle (leftmost column) → cursor becomes grab hand OBSERVED f55/f82 → press and drag row vertically → sibling rows shift to open a drop gap → release; row order persists, Save/Cancel still pending. INFERRED from delta frames (f27/f109 near-blank; analysis anchored on complete f0).
- **SAIL mechanism**: a!gridLayout (editable grid) with row reordering enabled — drag-handle column rendered automatically; order changes update the underlying list value.
- **UX purpose**: feedback — direct manipulation of row order instead of up/down buttons.
- **Replicate when**: users curate sequence (onboarding checklists, priority queues) | **Cost**: low config, but only meaningful when order is a saved field.
- Frame f0 context: "My Tasks" LARGE bold title; boxed input cells; Priority dropdowns; Due Date + calendar buttons; red #cf3222 (est.) X delete per row; "+ Add Row" link; CANCEL outline / SAVE filled #3030f0 (est.) buttons.

## grid_recordActions_column.png

- **Produces it**: a!recordActionField(style: "ICON", display: "ICON") inside the last grid column — pencil glyph only, per page caption "Icon Only" style.
- **Looks like**: case grid (blue record-link Names, lowercase status/priority text, right-aligned dates) with a single small blue #2276bf (est.) pencil icon per row in an unlabeled trailing column.
- **Use when**: exactly one high-frequency row action | **Avoid when**: several actions per row (see DON'T below).
- **Styling hooks**: style/display params; column width `ICON`.
- **Pairs well with**: record links in first column.
- **Hexes**: none
- **Marker**: neutral

## grid_recordActions_dont.png

### Principle: One action per grid cell
- **DO shows**: (sibling image grid_recordActions_column.png) a single icon-only related action per row in a dedicated `ICON`-width column. OBSERVED
- **DON'T shows**: same case grid whose trailing cell stacks two text links "Edit Case" / "Clone Case" on two lines in every row — taller rows, doubled link noise competing with the Name record links, ambiguous tap targets. OBSERVED
- **Rule**: A grid cell holds at most one action; move additional related actions to a toolbar above the grid or split them into separate columns.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: one a!recordActionField per column, or grid-level recordActions rendered as `TOOLBAR` with selection instead of per-row link stacks.

## grid_recordActions_above.png

- **Produces it**: a!gridField(recordActions: {list action "New Item", related actions "Edit Case", "Reassign Case"}, actionsDisplay: "TOOLBAR") on a record-backed grid with checkbox selection; per caption, toolbar style requires record data.
- **Looks like**: three compact all-caps outlined buttons (+ NEW ITEM, ✎ EDIT CASE, ↗ REASSIGN CASE; white fill, gray #c9c9c9 (est.) border, dark text) left-aligned above the grid; row 2 checkbox checked blue #2276bf (est.).
- **Use when**: multiple actions and/or bulk selection | **Avoid when**: single obvious per-row action.
- **Styling hooks**: actionsDisplay, selection style.
- **Pairs well with**: checkbox selection; icon-only column action for the one hot action.
- **Hexes**: none
- **Marker**: neutral

## grid_alignment_new.png

- **Produces it**: a!gridColumn(align: "END") on Qty and Amount; default `START` on Item, Department, Date; header alignment follows column. OBSERVED right-aligned quantitative columns.
- **Looks like**: "Orders" read-only grid, 3 zebra rows; `$5,000`/`$400`/`$300` and `10`/`50`/`100` flush right for cross-row comparison; dates left.
- **Use when**: read-only quantitative columns | **Avoid when**: editable grids (see next).
- **Styling hooks**: align per column + matching header.
- **Pairs well with**: right-aligned dates only if qualitative preference says otherwise.
- **Hexes**: none
- **Marker**: neutral

## editable_grid_alignment.png

- **Produces it**: a!gridLayout with a!textField/a!integerField cells — every input left-aligned, including Qty (`10`) and Amount (`5000`); boxed cell borders #d7d7d7 (est.).
- **Looks like**: same "Orders" data as editable grid; all values start-aligned inside input boxes.
- **Use when**: any editable grid, per page rule (left alignment for all field types) | **Avoid when**: read-only comparison of magnitudes.
- **Styling hooks**: none needed — default input alignment.
- **Pairs well with**: read-only twin using END alignment after save.
- **Hexes**: none
- **Marker**: neutral

## grid_tasks_good_example.png + grid_colorful_bad_example.png

### Principle: Spend color only where attention must go
- **DO shows**: Tasks grid (LIGHT border, 8 rows) that stays neutral except: red↑/green↓ priority arrows (#c0392b / #58a618 est.), gray dash for middle priority, and a pale-red "Overdue" tag (bg #f8e1e4, text #c5313e est.) on just 2 rows. Two non-neutral hues total; links muted blue #3f72af (est.). OBSERVED
- **DON'T shows**: same data where every row carries blue progress bars, saturated High/Not Prioritized/Low pills (#d63d3d/#efb929/#4cb944 est.), status conveyed only by text color (Accepted green #7dc243, Pending low-contrast gray #b0b0b0 est.), plus green dots and red triangles beside every date — 5+ hues, nothing stands out, colorblind users lose the status signal. OBSERVED
- **Rule**: ≤2 non-neutral colors per grid; color marks exceptions, never decoration, and never text-color-only meaning.
- **Severity**: always
- **Category**: color
- **SAIL implication**: neutral defaults; a!richTextIcon color for semantic marks; a!tagField(showWhen) for exceptions; pair color with icon/text shape.

## grid_column_status_with_icon.png

- **Produces it**: a!richTextDisplayField cell: a!richTextIcon(icon: "spinner"/"times"/"list-check"/"check") + status text; semantic color only on terminal states — red X #cf3130 (est.) Cancelled, green check #43a047 (est.) Complete; neutral near-black icons for In Progress / Under Review.
- **Looks like**: Status column crop, icon+label pairs, 5 rows.
- **Use when**: statuses need pre-attentive differentiation | **Avoid when**: icon meanings aren't obvious.
- **Styling hooks**: icon choice, color, altText.
- **Pairs well with**: column header even when icon-only (a11y rule on page).
- **Hexes**: #cf3130 / #43a047 (est.) — color is the emphasis dimension
- **Marker**: neutral

## grid_tags_column_good_example.png + grid_cases_colorful_tags_example.png

### Principle: Mute tags that appear in every row
- **DO shows**: "Activity Monitoring" grid whose Category tags use desaturated pastel fills with dark text — lavender #ded8ec, mint #ddeeea, peach #f7ddc4, gray #d9d9d9 (est.) — so slate-blue complexity dots (#4c6e91 est.) and a lone red warning triangle still pop; empty cells show hyphens. OBSERVED
- **DON'T shows**: "Cases" grid where all 10 rows carry saturated Issue Type pills — dark teal #2e5f5c, vivid purple #9b30f0, dusty red #b05461, periwinkle #7b86e8, bright green #6fce6a, navy #2f5d8a, orange #efa031 (est.) — 7 competing hues that outshout links, status, and dates. OBSERVED
- **Rule**: When a tag column is present on every row, restrict it to a small muted palette; save bright fills for rare, urgent values.
- **Severity**: usually
- **Category**: color
- **SAIL implication**: a!tagItem backgroundColor with muted customs, not STANDARD accent hues per value.

## grid_column_status_tag_good_example.png

### Principle: Tag only the values that need emphasis
- **DO shows**: Status column where "Active" renders as a pale-green tag (bg #c8e6b8 est., dark text) and "Inactive" stays plain gray text — the tag exists only for the state users scan for. OBSERVED
- **DON'T shows**: (counterpart pattern in grid_cases_colorful_tags_example.png above: pills on every row) tagging all values equalizes them and re-creates noise. INFERRED from page caption "highlight only the most important values".
- **Rule**: Use a tag as a highlighter, not a datatype — bind it conditionally to the notable value.
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: a!tagField(tags: if(fv!row.status="Active", a!tagItem(...), null)) or rich text fallback for non-tagged values.

## grid_consolidated_columns.png

### Principle: Consolidate related fields into one readable column
- **DO shows**: "Contacts" grid where Name cell stacks bold name over a muted `email · phone` line, and Address stacks street over city/state/zip — 6 columns of raw data compressed to 4, rows held to 2 lines; trailing Edit column uses a boxed pencil icon button. OBSERVED
- **DON'T shows**: none pictured; implied alternative is 7 single-value columns fighting for horizontal space. INFERRED
- **Rule**: Group logically-related minor fields under their primary field; sort the column by that primary value; cap consolidated cells at 2–3 lines.
- **Severity**: contextual
- **Category**: density
- **SAIL implication**: a!richTextDisplayField per cell — a!richTextItem(style: "STRONG") + char(10) + secondary items color "SECONDARY"; sortField = primary field.

## grid_column_concise_values.png + grid_column_redundant_values.png

### Principle: Move repeated words into the header
- **DO shows**: column headed "Review Status" with values `Cancelled`, `In Progress`, `Complete` — each cell only the varying word. OBSERVED
- **DON'T shows**: column headed "Status" whose every cell repeats the noun — `Review Cancelled`, `Review in Progress`, `Review Complete` — widening the column and slowing scan. OBSERVED
- **Rule**: The header carries the shared context; cells carry only what differs row to row.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: rename a!gridColumn(label) and strip the shared prefix when formatting the value expression.

## gridEmptyCells_do.png + gridEmptyCells_dont.png

### Principle: Mark empty cells with a hyphen, not words
- **DO shows**: "Employees" grid whose Extension Number column shows a right-aligned en-dash `–` for the 3 rows without extensions; real values (`455`, `765`) stay instantly distinguishable. OBSERVED
- **DON'T shows**: identical grid printing `Not Applicable` in those cells — the longest string in the column, visually heavier than the actual data it stands in for, widening the column and reading as a value. OBSERVED
- **Rule**: Absence should look like absence: a quiet dash aligned with the data, never prose like "N/A"/"Not Applicable".
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: if(isnull(fv!row.ext), "–", fv!row.ext) in the column expression; keep column alignment unchanged.

## grid_scrolling_fixed_columns.gif

### Interaction: Horizontal scroll with fixed column widths (gif: grid_scrolling_fixed_columns.gif)
- **State chart**: grid renders with fixed-width columns whose total exceeds grid width → horizontal scrollbar appears automatically OBSERVED f0 → user drags scrollbar right; leftmost Name column slides out, Team column fully revealed OBSERVED f23 → drags back; Name returns, Team clips again OBSERVED f34. (f11/f45 are near-blank delta frames.)
- **SAIL mechanism**: grid refresh none — pure a!gridField with fixed a!gridColumn widths (e.g. "NARROW"/"WIDE"); horizontal scrolling auto-enables on overflow.
- **UX purpose**: orientation — spreadsheet-like width constancy as viewport changes.
- **Replicate when**: widths must stay predictable across screen sizes | **Cost**: none to build; users pay a scroll for off-canvas columns.

## grid_weighted_columns.png

Tier override: batch suggests A, but this is a device-mockup comparison figure (monitor + phone frames around the same grid), not a full-page UI — analyzed as a comparison pair.

### Principle: Relative widths tuned for one screen size break on another
- **DO shows**: (monitor frame) "Employees" grid with relative widths — Name widest, Start Date right-aligned, Role/Team comfortable; proportions look deliberate on a wide viewport. OBSERVED
- **DON'T shows**: (phone frame) the same proportions compress every column to ~3–6 characters: headers fracture ("Star t Dat e"), dates wrap to three lines ("12/ 17/ 201 7") — unreadable, per page caption Start Date and Department are too narrow. OBSERVED
- **Rule**: Use relative (NX) widths only when the grid lives on one dominant screen size; prefer fixed widths (with scrolling) across mixed devices.
- **Severity**: contextual
- **Category**: mobile
- **SAIL implication**: a!gridColumn(width: "2X"…) vs fixed "NARROW"/"WIDE"; test narrow breakpoints before choosing.

## grid_auto_vs_distribute.png

Tier override: batch suggests A, but this is a stacked two-grid comparison crop, not a full page — analyzed as a comparison pair.

### Principle: Editable grids can't auto-size — plan widths yourself
- **DO shows**: (bottom) read-only "Glassware" grid with `AUTO` widths — Name narrow (~25%), Description wide (~55%) showing full sentences, Last Modified compact; space follows content. OBSERVED
- **DON'T shows**: (top) editable twin where default `DISTRIBUTE` gives each column an equal third: Description inputs clip mid-word ("…sle", "…the c") while Last Modified floats in excess whitespace. OBSERVED — page frames this as a capability gap, marker neutral.
- **Rule**: In editable grids set explicit weights/fixed widths per expected content; equal distribution wastes space and truncates long fields.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!gridLayout headerCells with explicit weights (e.g. 2:5:1) replacing all-DISTRIBUTE defaults; read-only a!gridField can rely on AUTO.

## grid_dense.png

- **Produces it**: a!gridField(spacing: "DENSE") — row height drops to roughly two-thirds of STANDARD; zebra #f7f7f7 (est.) and vertical dividers retained.
- **Looks like**: 3-row "Orders" grid with visibly compressed padding; right-aligned Date/Qty/Amount unchanged.
- **Use when**: long grids where vertical scrolling hurts | **Avoid when**: casual readers — page warns reduced whitespace harms readability.
- **Styling hooks**: spacing STANDARD/DENSE.
- **Pairs well with**: alternate row shading to keep scan lines.
- **Hexes**: none
- **Marker**: neutral

## grid_background_color.png

- **Produces it**: a!gridColumn(backgroundColor) on Amount — full-height pale blue #ddeefb (est.) column band; LIGHT borders elsewhere keep the band the loudest element.
- **Looks like**: Orders grid, one tinted money column; text/alignment unchanged.
- **Use when**: spotlighting one column, or conditional cell colors for heatmaps | **Avoid when**: several columns tinted — competing bands cancel out.
- **Styling hooks**: static color vs conditional expression per cell.
- **Pairs well with**: heatmap pattern (page cross-reference).
- **Hexes**: #ddeefb (est.) — color IS the variant
- **Marker**: neutral

## grid_shaded.png

- **Produces it**: a!gridField(shadeAlternateRows: true) — odd rows filled #f5f5f5 (est.), even rows white; vertical dividers and outer border present (STANDARD border).
- **Looks like**: Orders grid with zebra striping at STANDARD spacing.
- **Use when**: wide/many-column grids where the eye must track along a row | **Avoid when**: only a few rows — page calls shading unnecessary there.
- **Styling hooks**: shadeAlternateRows boolean.
- **Pairs well with**: DENSE spacing on long lists.
- **Hexes**: #f5f5f5 (est.)
- **Marker**: neutral

## grid_lightweight.png

- **Produces it**: a!gridField(borderStyle: "LIGHT") — outer border and vertical column dividers removed; rows separated only by hairlines #e5e5e5 (est.) on white.
- **Looks like**: Orders grid reduced to text plus faint horizontal rules.
- **Use when**: simple, few-column grids embedded in busy layouts | **Avoid when**: dense multi-column data needing cell boundaries.
- **Styling hooks**: borderStyle STANDARD/LIGHT.
- **Pairs well with**: cards/dashboards where extra rules add clutter.
- **Hexes**: none
- **Marker**: neutral

## grid_row_selection_paging.png + grid_row_selection_editable.png

### Principle: Row-highlight selection only where nothing else is clickable
- **DO shows**: read-only Orders grid with ROW_HIGHLIGHT — the selected row becomes a solid steel-blue #31618f (est.) band with white text and a pointer cursor; the whole row is unambiguously one target. OBSERVED
- **DON'T shows**: editable grid keeping the same blue band while Department/Date/Qty remain white input boxes inside it and Item cells render as blue links — three competing click targets per row; users can't tell row-select from field-edit from navigation. OBSERVED
- **Rule**: Mix of selection + interactive cell content demands CHECKBOX selection; reserve ROW_HIGHLIGHT for purely read-only rows.
- **Severity**: usually
- **Category**: forms
- **SAIL implication**: a!gridField(selectionStyle: "ROW_HIGHLIGHT") for display grids; selectionStyle "CHECKBOX" whenever cells contain links, inputs, or record actions.

## double_grid_scroll.gif

### Interaction: Double scrollbar trap on a fixed-height grid (gif: double_grid_scroll.gif)
- **State chart**: "Sales Dashboard" where a fixed-height grid is the only page content OBSERVED f0 → user scrolls the page; title scrolls away but the grid clips, exposing its own inner scrollbar beside the browser's OBSERVED f12 → user must grab the inner thumb to reach lower rows OBSERVED f36 cursor-on-scrollbar → orientation lost between two nested scroll contexts. (f24/f47 near-blank delta frames.) Marker: dont.
- **SAIL mechanism**: a!gridField(height: fixed) misapplied — height belongs where the header must stay visible amid other components, not on a solo grid.
- **UX purpose**: negative example — nested scrolling breaks orientation.
- **Replicate when**: never as shown; drop fixed height when the grid is the page | **Cost**: zero — omit the param.

## grid_with_scrolling_and_paging.png

### Principle: Never combine fixed-height scrolling with paging
- **DO shows**: none pictured; implied fix is one mechanism — full-height grid with paging, or scrolling with a large batch. INFERRED
- **DON'T shows**: "Employees" grid with a fixed height that clips row 4 mid-text ("Angela Cooper" half-visible), an inner scrollbar, AND a paging footer `1 – 5 of 25` — users must scroll inside a 5-row window, then page, to find anyone. OBSERVED
- **Rule**: Pick scrolling or paging, never both; and watch performance when removing paging in favor of huge batches (page note).
- **Severity**: always
- **Category**: layout
- **SAIL implication**: either height + large pageSize with no visible pager, or default auto height + a!pagingInfo batch of 5–50.

## Tier B page rollup

Default choices for most read-only grids: spacing `STANDARD`, border `STANDARD`, `AUTO` column widths, logical initial sort, record-type source for free search/filters, `END` alignment on quantitative columns — because the page presents each non-default (DENSE, LIGHT, fixed/relative widths, shading, column background, icon/tag emphasis, toolbar actions) as a situational tool, while defaults already balance density and readability. Editable grids differ on two defaults: all-left alignment and explicit (non-DISTRIBUTE) widths.
