# Analysis: ux-inputs

Page: `corpus/pages/ux-inputs.md` (section: guidance) — Inputs, Selection, and Pickers.
Note: no SAIL source on this page, so all hexes are pixel-estimated `(est.)`. Recurring accent across every crop is the Appian default selection blue ≈ #1c70b0 (est.); labels near-black #222 (est.); unselected borders #cbcbcb (est.); secondary text #6c6c6c (est.). Cross-ref: `branding-preview-icon.svg` appears on this page but is analyzed under its primary page.

## Component: Choice layout & style (page: ux-inputs)
Official variant vocabulary: Choice Layout = "Stacked" | "Compact"; Choice Style = "Standard" | "Cards"; Choice Position = "Start" | "End".

### ux_checkboxes.png
- **Produces it**: a!checkboxField(choiceLayout:"STACKED") over group 1; a!checkboxField(choiceLayout:"COMPACT") for "Yes/No/Maybe" group 2. OBSERVED: both on one screen.
- **Looks like**: "Subscribe to" — 3 stacked rows (2 checked, blue fill #1c72b8 est.); "Would you recommend…" — 3 short choices in one horizontal row.
- **Use when**: Compact only for 1-word labels that won't wrap | **Avoid when**: labels may wrap → Stacked.
- **Styling hooks**: choiceLayout; bold near-black field labels #222 (est.).
- **Pairs well with**: short survey questions, forms.
- **Marker**: neutral

### radio_buttons_cards_style_both_layouts.png
- **Produces it**: a!radioButtonField(choiceStyle:"CARDS") — stacked full-width cards, label "Thumbnail Size" adjacent-left (OBSERVED).
- **Looks like**: 3 white cards, 1px #cbcbcb (est.) borders, squared; radio circle at right (End = Cards default); selected "Small (75 x 75 px)" card carries blue border + filled dot #1a6da6 (est.).
- **Use when**: choices need prominence and a large click target | **Avoid when**: >5 choices.
- **Styling hooks**: choiceStyle, choicePosition; selection communicated by border color alone.
- **Pairs well with**: wizard steps, settings forms.
- **Marker**: neutral

### checkboxes_cards_style_both_layouts.png
- **Produces it**: a!checkboxField(choiceStyle:"CARDS"), stacked.
- **Looks like**: "Subscribe to" over 3 cards; checked cards (Monthly newsletter, Tips and tricks) get blue border #1a6da6 (est.) + blue checkbox at right; unchecked card stays gray-bordered.
- **Use when**: multi-select needing bigger targets/prominence | **Avoid when**: dense forms where Standard text rows suffice.
- **Styling hooks**: same as radio Cards; End position default.
- **Pairs well with**: preference/opt-in screens.
- **Marker**: neutral

### Page rollup
Default choice for most cases is Standard style + Stacked layout + Start position because labels stay adjacent to controls and wrapping is safe; escalate to Cards for prominence/click-target, and use Compact only for Yes/No-length labels.

## card-choices-same-values.png + card-choices-partial-values.png

### Principle: Give every card choice the same fields — all or none
- **DO shows**: "Select up to four activities" — 8 card choices in a 4-col × 2-row grid; every card = blue icon #2f74b5 (est.) + primary text + gray secondary text ("Individual/Group Activity"). Rows scan as an even lattice (OBSERVED).
- **DON'T shows**: same grid where Bowling lacks its icon and Golf/Soccer lack secondary text — text left edges shift, primary labels float at different vertical centers, grid reads broken (OBSERVED).
- **Rule**: on one interface, populate identical parameter sets (icon, primaryText, secondaryText) for every a!cardChoiceField option.
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: uniform a!cardChoiceTemplateTile(icon, primaryText, secondaryText) values across all choices; omit a field everywhere or nowhere.

## inputs_choiceposition_filterexample.png + inputs_choiceposition_dontexample.png

Tier override: filterexample was suggested tier A, but it is a cropped page fragment (no header; right-column property cards cut mid-photo), and it exists as the sanctioned counterpart to the DON'T — analyzed as a C pair (stated per protocol rule 4).

### Principle: Reserve Standard style + End position for width-constrained filter panes
- **DO shows**: real-estate filter pane (INFERRED: buyer-facing listing browser): "Property Features"/"Status" checkbox groups with boxes right-aligned at End; the narrow pane (~700px) keeps label→checkbox distance small. Docs spotlight the groups with a white highlight over a dimmed #d8d8d8 (est.) page; right column shows listing cards ($1,695,000; blue "PRICE REDUCED" tag #2e73b8 est.) (OBSERVED).
- **DON'T shows**: "Select License Type" fishing-license form, full-width; End-position radios sit ~1400px right of labels like "5-day ($10)" — an unscannable gulf (OBSERVED).
- **Rule**: End choice position is only usable when a pane/column/SBS constrains width; never in full-width forms.
- **Severity**: usually
- **Category**: forms
- **SAIL implication**: choicePosition:"END" only inside a!paneLayout / narrow a!columnsLayout; forms keep default "START".

## radio_choice_position_do.png

### Principle: With Cards style + long labels, move the control to Start
- **DO shows**: "Which of the following criteria do you meet?" — 4 full-width card radios with 2–6-line legalese labels (residency/military/student criteria); radios at left (Start), vertically centered; selected card = 2px blue border #1a6da6 (est.) + filled radio (OBSERVED). No DON'T sibling on the page.
- **DON'T shows**: (implied) Cards default End position would strand the radio far right of a paragraph-length label.
- **Rule**: when card-choice labels wrap to multiple lines, override Cards' End default with Start so control and reading origin coincide.
- **Severity**: contextual
- **Category**: forms
- **SAIL implication**: a!radioButtonField(choiceStyle:"CARDS", choicePosition:"START").

## ux_input_dropdown.png

Tier override: suggested A, but this is a single component with its menu open — a cropped fragment, so tier B (stated per protocol rule 4).

- **Produces it**: a!multipleDropdownField(label:"Parts Needed"), menu open, 3 values chosen.
- **Looks like**: focused field (blue border) shows comma-joined value "Oil Drain Plug, Oil Drain Plug Gasket, Oil Filter"; menu lists auto-parts alphabetically (Camshaft…Timing Belt, OBSERVED); selected rows filled steel blue #17669a (est.) with white text + white check; unselected rows white with pale-gray #ccc (est.) checks; scrollbar right.
- **Use when**: moderately long single/multi-select lists; sort logically (alphabetical here) | **Avoid when**: <5 choices (radios/checkboxes/cards) or unbrowseably long (picker).
- **Styling hooks**: none beyond label/placeholder — selection colors are system-fixed.
- **Pairs well with**: forms; grid filters.
- **Marker**: neutral

## ux_paragraph_fields.png

- **Produces it**: a!gridLayout editable grid ("Question | Type | Req'd | Advanced Setup") with a!paragraphField(height:"SHORT") in row 1 grid vs a taller height in grid 2 (OBSERVED comparison).
- **Looks like**: top grid — one-line paragraph matches the "Text" dropdown row height; icon columns (blue pencil #2077b5 est., gray reorder arrows #ccc est., red delete X #cc0000 est.) sit aligned; blue "+ Add Question" link. Bottom grid — ~3-line focused paragraph balloons the row; adjacent cells top-align over dead space.
- **Use when**: editable grids → height:"SHORT" to align with neighbors | **Avoid when**: taller heights inside grids (misalignment shown).
- **Styling hooks**: height parameter; grid row alignment.
- **Pairs well with**: form-builder style editable grids.
- **Marker**: neutral (page prose makes bottom the counter-example, INFERRED)

## ux_characterCount_hidden.png + ux_characterCount_shown.png

### Principle: Hide the character count unless users are likely to hit the limit
- **DO shows**: "Update Employee Details" form (Name, Street Address, City/State/ZIP in [2:1:1]-ish columns; outline CANCEL left, filled blue UPDATE #2b6cab est. right of a divider) with characterLimit set but counts hidden — inputs are clean rectangles (OBSERVED).
- **DON'T shows**: identical form where every text input carries a gray "0/100" pinned inside its right edge — four repeated counters add noise before the user types anything (OBSERVED).
- **Rule**: set showCharacterCount:false when limits are generous for the data (names, addresses); validation still fires at the cap.
- **Severity**: usually
- **Category**: forms
- **SAIL implication**: a!textField(characterLimit:100, showCharacterCount:false).

## stef_readonly_do.png

Tier override: suggested C (do), but this is a full-page record-view screenshot (title, tabs, two columns; only the bottom of History is cropped) — analyzed as tier A per protocol rule 4, marker kept as DO for the read-only STEF principle.

### Identification
- **Image**: stef_readonly_do.png | **Source page**: ux-inputs | **Alt/caption**: "interface that sets apart Issue Description in a separate card"
- **Device frame**: desktop
- **Marker**: do
- **UI type**: record-view

### Use-case reconstruction (INFERRED)
- **Persona**: facilities coordinator / maintenance dispatcher; daily-operator triaging building work orders
- **Domain & brand context**: university or corporate facilities management ("STU-" prefix suggests student/building system); maroon institutional brand
- **Top 3 user tasks (ranked)**: 1. Understand the reported issue well enough to act 2. See who owns/reported the request 3. Audit recent activity or update the request
- **Implied requirements**: "Must show full formatted issue narrative without editing", "Must expose request metadata (number, opened, source) at a glance", "Must list involved parties with roles", "Must provide update action from the header"
- **Data model sketch**: MaintenanceRequest(requestNumber 123-456-6789, opened Sep 13 2021 11:19 AM PDT, source "Mobile App (Employee)", title, issueDescription rich-text) — 1:N Party(name, role: Coordinator/Reporter/Assignee) — 1:N HistoryEvent(actor, action, timestamp May 15 2024 9:33 AM) (OBSERVED labels)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ Title "STU-23: Fix malfunctioning elevator…" + outline action button (right)
├─ TABS ×3 (Summary selected, News, Related Actions)
└─ COLUMNS [2:1]
   ├─ SECTION "Maintentance Request Details" → CARD(3-field SBS metadata row)
   │  └─ SECTION "Issue Description" → CARD(read-only STEF value)
   └─ SECTION "Involved Parties" → CARD ×3 (avatar+name+role)
      └─ SECTION "History" → CARD(EVENT-FEED, "Expand All Details" link)
```
- **Above the fold**: title, tabs, metadata card, full issue description, all three parties, first history entry
- **Reading order**: F
- **Hierarchy rationale**: page title + record ID biggest (orientation); Issue Description card visually dominant in the wide column (task 1); people/history relegated to narrow right rail (tasks 2–3)
- **Density**: 3 — two-column record with ~6 zones, roomy card padding (STANDARD est.)
- **Ratios & spacing**: COLUMNS ≈[2:1]; cards padding "STANDARD" (est.); sections separated ≈ marginBelow "MORE" (est.)

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff, card bg #ffffff with #d9d9d9 (est.) borders, brand maroon #5c1a1f (est.) on selected tab/links/names/button, avatar fills gray #b5b5b5 / blue #1a66c9 / green #2e7d32 / pink #e0559b (all est.), text near-black #222 (est.)
- **Color application points**: selected tab fill; outline action button border+text; person names; "Expand All Details" link; avatar initial circles (per-person hues)
- **Typography moves**: page title EXTRA_LARGE; section headers LARGE bold; body STANDARD; bold+italic run-in labels ("Intermittent Operation:") inside the STEF value; roles in gray STANDARD
- **Imagery stance**: none (initial-avatars only)
- **Card treatment**: flat white, 1px border, squared corners, no shadow
- **Signature moves**: instead of dumping the rich-text value inline under a label, they gave it SECTION "Issue Description" + its own CARD so its bold headings can't be mistaken for field labels; instead of a filled primary button they used an outline header action, keeping maroon for wayfinding; per-person avatar colors break the monochrome without touching layout

### Component inventory (OBSERVED)
- a!recordLayout-style header with a!buttonWidget(style:"OUTLINE"), tab bar; a!columnsLayout [2:1]; a!cardLayout ×~6; a!sideBySideLayout metadata row; read-only a!styledTextEditorField value (bold headings, bulleted list); stamp/avatar + rich text party cards; event-feed card with link
- Chart types: none
- Interactive affordances: tabs, header action button, "Expand All Details", per-event chevron/comment icons

### Character & judgment
- **Register**: institutional, calm-clinical — flat white cards, single maroon accent, no decoration
- **Why it works**: the STEF value's internal bold ("Issue:", "Symptoms:") stays unambiguous because the card boundary + section header claim the "label" role (the page's DO lesson); [2:1] split keeps narrative wide and people scannable; consistent maroon links signal every clickable
- **Why not boring**: maroon-filled selected tab (not underline); colored initial avatars; metadata as a 3-up SBS card instead of a label:value stack
- **Boring twin**: one full-width column, "Issue Description" as a plain bold label directly over the rich text (indistinguishable from the value's own bold), parties as a text list, default blue everywhere
- **What to steal**: wrap read-only rich-text in its own card under a section header; use [2:1] record anatomy; color avatars per person
- **Risks**: maroon-on-white outline button contrast is fine, but gray role text #6c6c6c (est.) trends low-contrast; typo "Maintentance" in section header (content QA, not design)

### Code cross-check
none — no SAIL source on this page

## ux_help_tooltip.png

- **Produces it**: a!textField(label:"Reconciliation Code", helpTooltip:"Identifies how orders are completed"), tooltip shown on hover/focus of the "?" icon.
- **Looks like**: bold label + blue circled-question icon #2077b5 (est.); charcoal #3a3a3a (est.) tooltip bubble with white STANDARD text floating above the empty input (OBSERVED).
- **Use when**: guidance new users need once — not every visit | **Avoid when**: info required every time (use instructions) or critical to completion.
- **Styling hooks**: none — tooltip look is system-fixed; only the string varies.
- **Pairs well with**: jargon-named fields (codes, IDs) on forms.
- **Marker**: neutral

## placeholder_text_do.png + placeholder_text_dont.png

### Principle: Placeholder hints at format; the label names the field
- **DO shows**: "Account Number" bold label above input whose italic gray #9b9b9b (est.) placeholder reads "The 10 digit number on your invoice" — format guidance layered on a persistent label (OBSERVED).
- **DON'T shows**: label omitted; empty input uses placeholder "Account Number" as the label, and a second, filled input ("1357924689") shows the consequence — once a value exists, nothing identifies the field (OBSERVED).
- **Rule**: never use placeholder text as a substitute for the field label; placeholders vanish on entry (and clearing behavior varies by device/browser).
- **Severity**: always
- **Category**: forms
- **SAIL implication**: always set label; placeholder reserved for format hints, e.g. a!textField(label:"Account Number", placeholder:"The 10 digit number on your invoice").

## picker_placeholder_do.png + picker_placeholder_dont.png

### Principle: Picker placeholders are short, sentence-case verb phrases
- **DO shows**: "Manager" label; picker placeholder "Select an employee" — 3 words, sentence case, signals search-select behavior distinguishing it from a plain text input (OBSERVED).
- **DON'T shows**: two labeled "Manager" pickers with placeholders "Search All Employees" (title-case caps) and "Start typing to view a list of employees" (8-word instruction) (OBSERVED).
- **Rule**: use sentence case and the shortest phrase that marks the field as a picker.
- **Severity**: usually
- **Category**: forms | labeling
- **SAIL implication**: a!pickerFieldUsers(label:"Manager", placeholder:"Select an employee").

## ux_fileuploadplaceholder.png + ux_fileuploadplaceholderdont.png

### Principle: Customize file-upload placeholder to name the expected file, tersely
- **DO shows**: "Resume" label; dashed-border drop zone (gray #ccc est. dashes, tray-upload icon button, doc+cursor glyph) with italic placeholder "Drop resume here (pdf)" — content and format in 4 words (OBSERVED).
- **DON'T shows**: same zone with "Please drag and drop a resume here for your application" — 10 words of politeness, no format hint (OBSERVED).
- **Rule**: replace the default "Drop files here" with a sentence-case phrase naming the expected document (and format), as short as possible.
- **Severity**: usually
- **Category**: forms | labeling
- **SAIL implication**: a!fileUploadField(label:"Resume", placeholder:"Drop resume here (pdf)").

## inputs_alignment_do.png + inputs_alignment_dont.png

### Principle: Left-align input values in left-to-right languages
- **DO shows**: "Account Number" label; value "1357924689" starts at the input's left edge, on the same vertical axis as the label — one reading line (OBSERVED).
- **DON'T shows**: two side-by-side "Account Number" inputs whose values hug the right edge, leaving a dead gap after the left-aligned labels; eye must jump to a ragged, box-width-dependent position (OBSERVED).
- **Rule**: keep align:"LEFT" (default) for inputs in LTR locales; right alignment breaks the label→value scan line.
- **Severity**: usually (numeric grid columns are a separate convention)
- **Category**: forms | layout
- **SAIL implication**: leave a!textField align at default; do not set align:"RIGHT" on form inputs.

## Component: Input shape — squared vs semi-rounded (page: ux-inputs)
Official variant vocabulary: Shape = "Squared (Default)" | "Semi-Rounded" (set in site/portal Branding, not per-component; preview via the Branding preview menu — icon analyzed under its primary page as `branding-preview-icon.svg`).

Shared observations across all 8 pairs: identical structure per pair — the ONLY delta is corner radius (0 vs ≈4–8px est.); 1px #cbcbcb (est.) borders, bold #222 (est.) labels, italic #9b9b9b (est.) placeholders. These crops use a demo brand whose accent is vivid blurple #2b29e0 (est.), unlike the steel blue elsewhere on the page — evidence that shape crops came from a differently-branded environment (INFERRED).

### checkboxes_squared.png / checkboxes_semi_rounded.png
- **Produces it**: a!checkboxField, site Branding shape Squared vs Semi-Rounded.
- **Looks like**: "Checkboxes" label, Option 1/2; sharp square boxes vs ≈4px-radius boxes (OBSERVED).
- **Use when**: match host site/portal brand tone | **Avoid when**: mixing shapes across one site.
- **Styling hooks**: Branding shape; CSS profile border-radius for finer control.
- **Pairs well with**: all other inputs sharing the shape.
- **Marker**: neutral

### cardchoices_squared.png / cardchoices_semi_rounded.png
- **Produces it**: a!cardChoiceField (tile template), Branding shape toggle.
- **Looks like**: tall tile — blurple #2b29e0 (est.) document icon, bold "Card choice", gray "Secondary text"; sharp vs ≈8px-radius card corners (OBSERVED).
- **Use when**: shape must echo brand cards | **Avoid when**: n/a — follows site setting.
- **Styling hooks**: Branding shape; CSS profile card radius.
- **Pairs well with**: wizard single-question steps.
- **Marker**: neutral

### picker_squared.png / picker_semi_rounded.png
- **Produces it**: a!pickerField*, Branding shape toggle.
- **Looks like**: "Picker Field" label, empty box; sharp vs rounded corners — indistinguishable from a text input when empty (OBSERVED; hence the placeholder guidance above).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape; input-box radius via CSS profile.
- **Pairs well with**: placeholder "Select …" phrasing.
- **Marker**: neutral

### dropdown_squared.png / dropdown_semi_rounded.png
- **Produces it**: a!dropdownField(placeholder:"Select a value"), shape toggle.
- **Looks like**: italic gray placeholder + black caret right; sharp vs rounded box (OBSERVED).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape only; caret fixed.
- **Pairs well with**: forms, filter bars.
- **Marker**: neutral

### input_squared.png / input_semi_rounded.png
- **Produces it**: a!textField, shape toggle.
- **Looks like**: "Input Field" label over an empty rectangle; corner radius is the sole difference (OBSERVED).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape; CSS profile input radius.
- **Pairs well with**: everything — the baseline input.
- **Marker**: neutral

### stef_squared.png / stef_semi_rounded.png
- **Produces it**: a!styledTextEditorField, shape toggle.
- **Looks like**: toolbar row (B / I / U glyphs + gray info dot right), divider, empty body, bottom-right resize handle; outer frame sharp vs rounded (OBSERVED).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape; toolbar not configurable here.
- **Pairs well with**: taller dialogs (keep resize corner visible per page prose).
- **Marker**: neutral

### file_squared.png / file_semi_rounded.png
- **Produces it**: a!fileUploadField, shape toggle.
- **Looks like**: outline all-caps UPLOAD button, doc+cursor glyph, truncated italic "Drop or paste fil…"; button + dotted zone corners sharp vs rounded (OBSERVED).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape affects button and zone together.
- **Pairs well with**: custom placeholder naming the expected file.
- **Marker**: neutral

### date_squared.png / date_semi_rounded.png
- **Produces it**: a!dateField with picker popup open, shape toggle.
- **Looks like**: "mm/dd/yyyy" italic placeholder + calendar icon button; popup with blurple #2b29e0 (est.) prev/next arrows and TODAY/CLEAR links, May/2025 dropdowns, all-caps day headers, today (12) on pale lavender #e6e4fa (est.); every surface (input, icon button, popup, inner dropdowns) squares vs rounds in sync (OBSERVED).
- **Use when**: per site brand | **Avoid when**: n/a.
- **Styling hooks**: Branding shape cascades to the popup chrome.
- **Pairs well with**: date-range filter rows.
- **Marker**: neutral

### Page rollup
Default choice for most cases is Squared because it is the platform default and needs no configuration; switch the site/portal Branding to Semi-Rounded only as a whole-brand decision — the setting cascades to every input surface at once (checkbox corners through calendar popups), so per-component mixing is impossible by design, and finer radii belong to CSS profile properties.
