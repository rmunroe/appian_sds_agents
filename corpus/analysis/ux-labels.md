# Analysis: ux-labels

Source page: `corpus/pages/ux-labels.md` (SAIL Design System > Guidance > Labels). No SAIL source on the page, so all colors are pixel-estimated. Recurring accent/section-header/link blue across images: #2e6da3 (est.). Tier-C do/don't pairs appear in page order; the four tier-B position crops — including `ux_labels_excluded.png`, overridden A→B (see note in its section) — are rolled up in one component section at the end, per template.

## ux_labelPositionAboveDo.png + ux_labelPositionAboveDont.png

### Principle: Label wide components above, never beside
- **DO shows**: 5-row employee grid (Name / Title / Department / Phone Number / right-aligned Date Hired; zebra rows #f8f8f8 (est.); "5 items" footer) with its bold label on its own line — the grid keeps the full image width. The demo label narrates itself: "Labels Above Have More Room for Long Values". OBSERVED.
- **DON'T shows**: identical grid with an adjacent label, "Long Grid Labels Wrap When Adjacent" — the label wraps to two lines and reserves a ~13%-wide left gutter, squeezing all five columns. OBSERVED.
- **Rule**: wide components (grids, charts) and long labels take the above position; adjacent pays twice (gutter + wrap).
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!gridField(label: …, labelPosition: "ABOVE")`.
- **Marker**: do/dont pair

## ux_label_adjacent_do.png + ux_label_adjacent_dont.png

### Principle: Read-only values take adjacent labels so blanks stay legible
- **DO shows**: five record attributes as bold right-aligned labels beside left-aligned values (Name / Department / Title / Number / Start Date). The empty "Title" value reads as an obvious blank slot on its own row; five fields fit in 308px of height. OBSERVED.
- **DON'T shows**: same fields with labels above — the blank "Title" becomes an ambiguous white gap between "Title" and "Number", and the stack grows to 548px (~1.8×) for identical data. OBSERVED.
- **Rule**: non-editable record attributes get ADJACENT (or JUSTIFIED); the above position hides missing values and roughly doubles vertical scroll.
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: read-only fields with `labelPosition: "ADJACENT"`.
- **Marker**: do/dont pair

## ux_labels_consistent.png

### Principle: One label position per section
- **DO shows**: none (DON'T-only image; the DO is any single-position form — see the redundant/tone DO images).
- **DON'T shows**: three-field form mixing positions — "Title" adjacent, "Description" above, "Category" adjacent (dropdown "--- Select a Category ---"). Inputs start at two different left edges (Title/Category boxes ~34% in, Description textarea flush left), so the eye re-finds the margin at every field. OBSERVED.
- **Rule**: pick one labelPosition for all sibling fields in an interface/section — the one that best balances every field's needs.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: identical `labelPosition` value across a section's fields.
- **Marker**: dont

## ux_label_redundant_do.png + ux_label_redundant_dont.png

### Principle: Hoist the shared noun into the section header
- **DO shows**: blue #2e6da3 (est.) section header "Award Details" over a two-column [1:1] form; concise labels "Title", "Recipient" (left) and "Description" (tall textarea, right). OBSERVED.
- **DON'T shows**: same form relabeled "Award Title", "Award Recipient", "Award Description" — "Award" repeated three times directly beneath a header that already says it, lengthening every label for zero added information. OBSERVED.
- **Rule**: when related inputs share a context word, say it once in the section label and shorten the field labels.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: `a!sectionLayout(label: "Award Details")` + context-free field labels.
- **Marker**: do/dont pair

## ux_format_do.png + ux_format_dont.png

### Principle: Title case, no trailing colons
- **DO shows**: two adjacent-position fields — "Table Name" beside its text value and "People with Access" beside two avatar user chips on #f0f0f0 (est.); labels title-cased with no punctuation. OBSERVED.
- **DON'T shows**: the same pair as "Table Name:" and "People with access:" — trailing colons plus mixed capitalization (title vs. sentence case) between two neighboring labels. OBSERVED.
- **Rule**: never end a field or section label with ":"; capitalize consistently, preferring title case.
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: wording only — colon-free, title-cased `label` text.
- **Marker**: do/dont pair

## ux_labels_tone_do.png + ux_labels_tone_dont.png

### Principle: Keep one tone across a form's labels
- **DO shows**: "Case Information" section (header blue #2e6da3 (est.)) with terse noun labels — "Title" textbox, "Description" textarea. OBSERVED.
- **DON'T shows**: identical form where the textarea label turns conversational — "What seems to be the problem?" — directly under the clipped "Title", so one form speaks in two registers. OBSERVED.
- **Rule**: labels on one form share a register; default to concise, direct noun phrases over chatty questions.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: wording only; no params involved.
- **Marker**: do/dont pair

## ux_labels_rich_text_do.png + ux_labels_rich_text_dont.png

### Principle: Let rich text headers replace the field label
- **DO shows**: rich text with its own hierarchy — gray #666 (est.) "Agenda" ≈ LARGE, "Top 3" / "Lower Priority" ≈ MEDIUM, numbered + nested bullet lists, inline link/bold/italic — everything sharing one flush-left edge; no field label. OBSERVED.
- **DON'T shows**: identical content with an adjacent field label "Agenda" (STANDARD bold black): the whole block indents ~130px, internal headers no longer align with the page edge, and the label duplicates the top heading's job. OBSERVED.
- **Rule**: rich text with headers takes the above position or no label at all; adjacent breaks alignment.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!richTextDisplayField(labelPosition: "COLLAPSED", value: {a!richTextItem(size: "LARGE", …), …})`.
- **Marker**: do/dont pair

## ux_labels_links.png

### Principle: Link text names the destination — never "link", never the URL
- **DO shows**: none (DON'T-only image; the implied DO is "Timesheets", "Benefits", "Calendar").
- **DON'T shows**: three blue #2e6da3 (est.) links prefixed "Link to Timesheets / Benefits / Calendar", then a "Supporting Document" field whose display text is a raw Google Slides URL wrapping across two lines — unreadable and unscannable. OBSERVED.
- **Rule**: use descriptive display text; drop filler words like "link"; show a URL only when users explicitly need the address itself.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: `a!linkField(links: a!safeLink(label: "Timesheets", uri: …))`.
- **Marker**: dont

## Component: field label position — `labelPosition` (page: ux-labels)

Official variant vocabulary (named by page text): ABOVE · ADJACENT · JUSTIFIED · COLLAPSED. Page notes: mobile always renders labels above regardless of setting, and an empty `label` under `"ABOVE"`/`"ADJACENT"` still reserves blank space — only `"COLLAPSED"` removes it.

### uxdg_labels_compared.png — ABOVE vs ADJACENT vs JUSTIFIED
- **Produces it**: `labelPosition` on any field; italic gray placeholders name each variant.
- **Looks like**: ABOVE = bold label on its own line, full-width field; ADJACENT = right-aligned label in a reserved left gutter (~30% here); JUSTIFIED = flush-left label in the same gutter. OBSERVED.
- **Use when**: picking the page's one position. **Avoid when**: n/a — reference strip.
- **Styling hooks**: `labelPosition`, `placeholder`.
- **Pairs well with**: any input.
- **Hexes**: none — position is the dimension.
- **Marker**: neutral

### uxdg_labels_adjacent.png — ADJACENT
- **Produces it**: read-only fields, `labelPosition: "ADJACENT"`, under `a!sectionLayout(label: "Onboarding Details")`.
- **Looks like**: bold right-aligned labels hugging their values; the label column's left edge is ragged against the flush-left #2e6da3 (est.) header. OBSERVED.
- **Use when**: fastest label→value scanning of record attributes. **Avoid when**: beside left-aligned headers/content where the ragged edge shows.
- **Styling hooks**: `labelPosition`.
- **Pairs well with**: record summary panes.
- **Hexes**: none.
- **Marker**: neutral

### uxdg_labels_justified.png — JUSTIFIED
- **Produces it**: same fields, `labelPosition: "JUSTIFIED"`.
- **Looks like**: labels flush left, aligned exactly with the section header; values sit in a fixed right column, so short labels get a wide label→value gap. OBSERVED.
- **Use when**: adjacent's ragged edge unbalances the page. **Avoid when**: the gap weakens label–value pairing.
- **Styling hooks**: `labelPosition`.
- **Pairs well with**: left-aligned section headers.
- **Hexes**: none.
- **Marker**: neutral

### ux_labels_excluded.png — COLLAPSED (label excluded)
Tier override: the batch table suggests tier A, but this is a single chart crop with no page chrome (no title, nav, or sibling zones) — a cropped fragment, so tier B per protocol rule 4.
- **Produces it**: `a!columnChartField(labelPosition: "COLLAPSED")` — no field label rendered. INFERRED from page text.
- **Looks like**: grouped column chart in a 1px #e5e5e5 (est.) white card; Budget blue #4a9edb (est.) vs Spent green #69b445 (est.) across four departments; axis titles ("Amount ($)", "Department") + centered legend carry all labeling. OBSERVED.
- **Use when**: a lone grid/chart is already named by the page or section title. **Avoid when**: assistive tech expects a per-field text label (page's a11y caution).
- **Styling hooks**: `labelPosition`, series colors.
- **Pairs well with**: single-component report pages.
- **Hexes**: above.
- **Marker**: neutral

### Page rollup
Default choice for most cases is ABOVE because it survives wide components and long labels without wrapping, keeps one left edge, and matches mobile (which always renders labels above). Switch to ADJACENT/JUSTIFIED for dense read-only attribute lists — blanks stay legible and vertical scroll roughly halves — choosing JUSTIFIED when adjacent's ragged edge clashes with left-aligned headers. Use COLLAPSED when a title or section header already describes the lone component; never fake it with an empty label, which still reserves space.
