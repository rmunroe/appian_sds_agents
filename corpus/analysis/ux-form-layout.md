# Analysis: ux-form-layout

Page: `corpus/pages/ux-form-layout.md` (section: components) — Form Layout. No SAIL source on page, so all colors are pixel-estimated. Recurring doc-schematic palette used by many images below: backdrop gray #f0f0f1 (est.), white form surface #ffffff, primary solid button blue-violet #3c10e9 (est.), outline button = white bg + #3c10e9 (est.) border/text, annotation green #2ecc71 (est.), annotation label navy #0d1450 (est.), input border #d5d5d7 (est.) 1px square-cornered, labels bold dark #222222 (est.).

## form_layout_example_updated.png

### Identification
- **Image**: form_layout_example_updated.png | **Source page**: ux-form-layout | **Alt/caption**: "form_layout_example" (Introduction)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (annotated anatomy schematic of a!formLayout)

### Use-case reconstruction (INFERRED)
- **Persona**: none — documentation diagram with placeholder content; audience is the low-code designer learning the layout's three zones
- **Domain & brand context**: Appian SAIL docs; deliberately generic ("Form", "Form description")
- **Top 3 user tasks (ranked)**: 1. Identify the three form zones 2. See default button placement/styling 3. Map zones to parameters (Title Bar / Contents / Buttons)
- **Implied requirements**: "Must show all three zones in one viewport"; "Zone boundaries must be unambiguous"; "Placeholder text must not distract from structure"
- **Data model sketch**: none — fields are literally named after their component types (Text, Paragraph, Dropdown "--- Select a Value ---")

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM
├─ TITLE-BAR h≈240 style=dark-fill #404040 (est.), title "Form" + secondary "Form description"
├─ CONTENTS (centered, ≈60% page width)
│  ├─ text input "Text"
│  ├─ paragraph "Paragraph"
│  └─ dropdown "Dropdown"
└─ BUTTONS: outline "CANCEL" left · solid "SUBMIT" right
```
- **Above the fold**: everything (single-viewport schematic)
- **Reading order**: single-column
- **Hierarchy rationale**: dark title bar is the largest mass → anchors identity; contents get the central widest zone → main work; buttons pinned last → completion
- **Density**: 2 — three inputs + two buttons in a full viewport, generous white space
- **Ratios & spacing**: contents inset from both edges (≈ Medium width); large gap between title bar and first field; buttons row aligned to contents edges

### Styling specifics (OBSERVED)
- **Palette**: page bg #f0f0f1 (est.), form surface #ffffff, title bar #404040 (est.), title/secondary text #ffffff / #d9d9d9 (est.), primary button #3c10e9 (est.), input borders #d5d5d7 (est.); annotation green #2ecc71 (est.) boxes + navy #0d1450 (est.) labels ("Title bar", "Contents", "Buttons")
- **Color application points**: dark fill only in title bar; violet only on the two buttons; everything else neutral
- **Typography moves**: title ≈ LARGE bold white; field labels ≈ STANDARD bold; placeholder italic gray #8a8a8a (est.); button labels all-caps
- **Imagery stance**: none
- **Card treatment**: flat white sheet; zones outlined only by the doc's green annotation strokes
- **Signature moves**: instead of a plain text heading, the title bar takes a full-width dark fill (title bar template/style); instead of hand-placed buttons, primary right / secondary left comes free from a!buttonLayout inside a!formLayout

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(titleBar: dark-styled template, contents: {a!textField, a!paragraphField, a!dropdownField}, buttons: a!buttonLayout(primaryButtons: SOLID "SUBMIT", secondaryButtons: OUTLINE "CANCEL"))
- Charts: none | Interactive affordances: none beyond inputs

### Character & judgment
- **Register**: calm-clinical, institutional — neutral grays, one accent hue, zero decoration
- **Why it works**: three green outlines map 1:1 to the three layout parameters; dark title bar shows styling is built-in, not custom chrome; default button placement teaches the convention by example
- **Why not boring**: dark #404040 (est.) header instead of default white; all-caps violet buttons give one deliberate accent; annotation layer is the actual content
- **Boring twin**: a white page with an H1, three unlabeled inputs, and two gray buttons both left-aligned — no zone boundaries, nothing to learn from
- **What to steal**: name the three zones in your own form specs; keep exactly one accent hue for actions
- **Risks**: placeholder-only labels are unlocalizable advice; #d9d9d9-on-#404040 secondary text (est.) is near the 4.5:1 boundary

### Code cross-check
- none — no SAIL source on page

## form_layout_contents.png
Tier override: table says A, but this is the same schematic as form_layout_example_updated.png re-annotated for one parameter → treated as tier B callout crop.
- **Produces it**: a!formLayout(contents: {…}) — green box isolates the Contents zone only
- **Looks like**: identical form; single green outline around the three inputs, navy "Contents" label at left
- **Use when**: explaining which components land in the form body (any non-top-level layout/component)
- **Avoid when**: n/a — doc illustration
- **Styling hooks**: none in the zone itself; width governed by Contents Width
- **Hexes**: same schematic palette as above
- **Marker**: neutral

## form_layout_titleBar.png
Tier override: A→B — same schematic, annotation isolates the title bar zone.
- **Produces it**: a!formLayout(titleBar: a!formTitleBar(...)) with a dark-styled template
- **Looks like**: full-bleed charcoal #404040 (est.) band, white LARGE "Form" + gray secondary line; green outline + navy "Title bar" callout; body left unannotated
- **Use when**: pointing designers at title bar template options (simple/full/image/sidebar)
- **Avoid when**: n/a
- **Styling hooks**: template choice, background style, divider, fix-on-scroll
- **Marker**: neutral

## form_layout_button_placement_vertical.png
Tier override: A→B — cropped single-field demo, not a real page. Sibling of the next two under "Buttons parameter".
- **Produces it**: a!buttonLayout(primaryButtons: {SOLID}, secondaryButtons: {OUTLINE}) at desktop width
- **Looks like**: white card: "Title", one Text input, "SECONDARY" outline pinned left, "PRIMARY" solid #3c10e9 (est.) pinned right — opposite edges, same row
- **Use when**: showing the default LTR side-by-side placement rule
- **Avoid when**: narrow containers (buttons stack instead)
- **Styling hooks**: none — placement is automatic
- **Marker**: neutral

## form_layout_button_placement_stacked.png
- **Produces it**: same a!buttonLayout when container is too narrow for side-by-side
- **Looks like**: narrow card; full-width solid "PRIMARY" on top, full-width outline "SECONDARY" below — primary-first stacking, both stretched to contents width
- **Use when**: showing responsive/mobile behavior — primary stays topmost
- **Avoid when**: n/a — automatic
- **Styling hooks**: none; stacking is width-triggered
- **Marker**: neutral

## form_layout_button_placement_multiple.png
- **Produces it**: a!buttonLayout(primaryButtons: {2×}, secondaryButtons: {2×})
- **Looks like**: left group "FIRST","SECOND" both outline (secondaries, least-prominent first/leftmost); right group "FIRST" solid + "SECOND" outline (primaries, most-prominent first/leftmost)
- **Use when**: ordering multiple actions — list position = visual position
- **Avoid when**: >2 primaries; prominence dilutes (INFERRED)
- **Styling hooks**: list order only; first primary auto-gets SOLID
- **Marker**: neutral

## form_layout_validation_message.png

### Identification
- **Image**: form_layout_validation_message.png | **Source page**: ux-form-layout | **Alt/caption**: "form_layout_validation_message" (Validations parameter)
- **Device frame**: desktop (dialog-proportioned card)
- **Marker**: neutral
- **UI type**: wizard-step (BACK/NEXT footer)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer completing a contact-info step of a multi-step intake
- **Domain & brand context**: generic CRM/registration; neutral institutional styling
- **Top 3 user tasks (ranked)**: 1. Provide phone OR email 2. Understand why NEXT is blocked 3. Move on
- **Implied requirements**: "Either-or requirement must not mark both fields required"; "Cross-field errors must appear at form level, near the buttons"; "Error must state the resolution, not just the failure"
- **Data model sketch**: Contact{phoneNumber?, emailAddress?} — at least one required (cardinality enforced by form-level validation, not per-field Required)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM (white card on #f0f0f1 (est.))
├─ TITLE "Contact Details" + helper "Enter one of the following:"
├─ CONTENTS
│  ├─ input "Phone Number"
│  ├─ text "--or--" (gray, centered-left)
│  └─ input "Email Address"
├─ VALIDATION banner (full contents width)
└─ BUTTONS: outline "BACK" left · solid "NEXT" right
```
- **Above the fold**: everything
- **Reading order**: single-column
- **Hierarchy rationale**: banner sits directly above the buttons that triggered it — error is read exactly where the blocked action lives; "--or--" makes the either-or contract visible between the two inputs
- **Density**: 2 — two inputs, one banner, two buttons per viewport
- **Ratios & spacing**: inputs full contents width; banner same width as inputs; STANDARD-plus gaps

### Styling specifics (OBSERVED)
- **Palette**: page #f0f0f1 (est.), card #ffffff, title #222222 (est.), validation bg #fdeaea (est.) with border #e8b7bc (est.) and text #d92637 (est.), buttons #3c10e9 (est.)
- **Color application points**: red only in the validation banner; violet only on buttons; nothing else colored
- **Typography moves**: title LARGE bold; labels STANDARD bold; "--or--" gray #8a8a8a (est.) lowercase; banner text STANDARD regular red
- **Imagery stance**: none
- **Card treatment**: flat white card, no border/shadow visible
- **Signature moves**: instead of marking both fields Required, a form-level a!validationMessage carries the cross-field rule; instead of a generic "Form invalid", the message names the fix ("Enter either a phone number or an email address to continue")

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(validations: "Enter either a phone number or an email address to continue", buttons: a!buttonLayout(primaryButtons: "NEXT" SOLID, secondaryButtons: "BACK" OUTLINE)); a!textField ×2; "--or--" via a!richTextDisplayField (INFERRED)
- Charts: none | Affordances: wizard back/next

### Character & judgment
- **Register**: calm-clinical — error state without alarm styling beyond the tinted banner
- **Why it works**: banner adjacency to NEXT ties cause to blocked action; either-or is triple-encoded (helper text, "--or--", validation copy); no false-positive red on the fields themselves
- **Why not boring**: "--or--" inline connector is a cheap, rare touch; resolution-phrased error copy; helper line "Enter one of the following:" pre-empts the error
- **Boring twin**: both fields marked required with red asterisks, per-field "A value is required" errors firing on both, generic alert at top of page out of eyeshot of the buttons
- **What to steal**: put cross-field validations in formLayout validations, phrased as the fix; visualize either-or with an inline "--or--"
- **Risks**: red #d92637 on #fdeaea (est.) is fine, but color-only encoding of the banner needs its text (it has it); "--or--" may read oddly to screen readers

### Code cross-check
- none — no SAIL source on page

## form_layout_dark_colors.png
Tier override: A→B — three-scheme comparison collage, one variant each. Official variant vocabulary (page names it): "Charcoal Scheme", "Navy Scheme", "Plum Scheme" (Form Background Color parameter; color IS the variant dimension).

### Charcoal
- **Produces it**: a!formLayout(backgroundColor: "CHARCOAL_SCHEME")
- **Looks like**: page #1e2122 (est.), inner box #272b2d (est.), white title/labels, white input wells, CANCEL = white-outline ghost, SUBMIT stays #4a0be5 (est.)
- **Use when**: neutral dark UI, no brand hue
- **Marker**: neutral

### Navy
- **Produces it**: backgroundColor: "NAVY_SCHEME"
- **Looks like**: page #172029 (est.), box #1c2938 (est.) — cool blue-black; same white inputs/violet SUBMIT
- **Use when**: dark scheme with a cooler corporate cast
- **Marker**: neutral

### Plum
- **Produces it**: backgroundColor: "PLUM_SCHEME"
- **Looks like**: page #1b1226 (est.), box #261c33 (est.) — violet-black; SUBMIT violet nearly blends with surface (contrast risk, OBSERVED)
- **Use when**: expressive dark branding; apply to ALL site pages or none (page rule)
- **Marker**: neutral

## form_layout_transparent.png
Tier override: A→B — split A/B composite (navy header band, green labels "White" | "Transparent", green divider), not a navigable page. Color IS the variant dimension.
- **Produces it**: a!formLayout(backgroundColor: "WHITE") vs "TRANSPARENT" on the same Create Project form
- **Looks like**: left half pure #ffffff page; right half standard site gray #efeff0 (est.) showing through; identical fields (Project Name*, Description* 0/4000, Status, Priority), CANCEL outline / CREATE solid #3c10e9 (est.), required asterisks #4141f0 (est.)
- **Use when**: choosing page ground — "Transparent" inherits the site/portal gray
- **Avoid when**: content is bare fields needing a white ground
- **Styling hooks**: backgroundColor value only
- **Marker**: neutral

## form_layout_transparent_compare.png
Tier note: listed A/neutral, but functionally a guideline comparison — analyzed as a tier-C-style principle pair (≤120 words).

### Principle: Give cards a contrasting ground
- **DO shows**: "Transparent background" version — same Create Project form on site gray #efeff0 (est.); the white fields-card pops; CANCEL outline + steel-blue SUBMIT #33689f (est.)
- **DON'T shows**: "White background" version — white card edges dissolve into the white page; only a faint #dcdcdc (est.) border separates the Details box, so grouping reads weakly
- **Rule**: when contents are mostly cards/boxes, set form background "Transparent" (or a tinted hex) so card surfaces stand out
- **Severity**: usually
- **Category**: color
- **SAIL implication**: a!formLayout(backgroundColor: "TRANSPARENT") with a!cardLayout groups inside; white-on-white needs no extra chrome to fake separation
- **Marker**: neutral comparison (page frames white as acceptable but weaker here)

## form_layout_titleBarDivider.png
- **Produces it**: a!formLayout(isTitleBarDividerVisible: true) — simple template title bar
- **Looks like**: white dialog on #f0f0f1 (est.); "Create Project" + small helper; hairline #d9d9d9 (est.) divider under the title bar; green callout + navy "Title Bar Divider" label pointing at it
- **Use when**: long secondary text or scrolling dialogs need the header visually separated
- **Avoid when**: minimal single-field forms — extra line is noise
- **Styling hooks**: boolean only; pairs with fixed title bar
- **Marker**: neutral

## form_layout_button_divider.png
- **Produces it**: a!formLayout(isButtonDividerVisible?) — divider above the button row (same dialog as previous image)
- **Looks like**: hairline #d9d9d9 (est.) above CANCEL/CREATE; green "Button Divider" callout; both dividers frame the contents zone top and bottom
- **Use when**: fixed/sticky buttons over scrolling content need a boundary
- **Avoid when**: short forms where buttons obviously terminate the card
- **Styling hooks**: boolean only
- **Marker**: neutral

## header-template-compare.png
Tier override: A→B — four-variant comparison collage on pale blue #ddeefb (est.). Official variant vocabulary (page names it): **simple, full, image, sidebar** title bar templates. Same "License Application" form in all four; header steel blue #2f7ab8 (est.).

### Simple
- **Produces it**: titleBar: a!headerTemplateSimple(icon, title, secondaryText)
- **Looks like**: white bar; blue round icon + dark-blue title, gray helper; least chrome
- **Use when**: data-heavy forms, dialogs
- **Marker**: neutral

### Full
- **Produces it**: a!headerTemplateFull
- **Looks like**: solid #2f7ab8 (est.) band, white icon/title/secondary; strong brand stripe, modest height
- **Use when**: default recommendation for most forms
- **Marker**: neutral

### Image
- **Produces it**: a!headerTemplateImage
- **Looks like**: taller band; title left, spot illustration right; billboard feel
- **Use when**: customer-facing/portal forms; watch height in dialogs
- **Marker**: neutral

### Sidebar
- **Produces it**: a!headerTemplateSidebar
- **Looks like**: full-height colored left column: illustration, stacked title, secondary, lighter "More info" box #5b96c8 (est.)
- **Use when**: form benefits from persistent supporting context; needs wide dialogs
- **Marker**: neutral

## ux-full-header-template-choose.png
- **Produces it**: a!formLayout(titleBar: a!headerTemplateFull(icon, "License Application", secondaryText), contents width ≈ MEDIUM)
- **Looks like**: steel-blue #3d84c4 (est.) band, white icon chip + bold title + lighter helper; body #fafafa (est.) with First/Last Name side-by-side, Email full-width; CANCEL outline, SUBMIT solid matching the header blue — header hue reused as the action hue
- **Use when**: default title bar for most forms
- **Avoid when**: dialog height is precious
- **Styling hooks**: template color, icon
- **Marker**: neutral

## simple-header-example.png

### Identification
- **Image**: simple-header-example.png | **Source page**: ux-form-layout | **Alt/caption**: "simple-header-example" (Choosing a title bar template)
- **Device frame**: desktop (record-action dialog with X close)
- **Marker**: neutral
- **UI type**: form

### Use-case reconstruction (INFERRED)
- **Persona**: internal comms/office coordinator, occasional cadence, creating a company event
- **Domain & brand context**: workplace-operations app; neutral styling with a single violet accent
- **Top 3 user tasks (ranked)**: 1. Enter title/description 2. Categorize (department, category, location) 3. Attach flyer and set dates
- **Implied requirements**: "Dialog must maximize vertical room for many fields"; "Required vs optional must be scannable"; "Flyer upload must accept drag/paste"; "Event needs start and end dates"
- **Data model sketch**: Event{title*, description*(≤4000), showInFeed:bool, department→ref, category→ref, flyer:file, startDate*, endDate*, officeLocation*→ref, locations*→ref[]} — starred per blue asterisks

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM (dialog, scrollbar visible)
├─ TITLE-BAR simple: violet round icon + "Create Event" + helper, divider below
├─ CONTENTS = BOX(border #e0e0e0 (est.))
│  ├─ Title*, Description* (0/4000)
│  ├─ checkbox "Show event details in feed"
│  ├─ Department, Category dropdowns
│  ├─ Flyer: UPLOAD + dashed drop zone
│  ├─ SBS Start Date* | End Date* (calendar pickers)
│  └─ Office Location*, Locations* dropdowns (clipped)
└─ BUTTONS (fixed): outline CANCEL · solid CREATE
```
- **Above the fold**: title bar through ~Locations; buttons pinned visible at bottom — fixed footer while content scrolls (OBSERVED: content clipped behind button bar)
- **Reading order**: single-column
- **Hierarchy rationale**: simple white header spends ≈120px only, leaving the viewport to ten fields — exactly the page's advice for data-heavy dialogs; single column keeps required flow linear; only dates pair up (related range)
- **Density**: 3 — ~9 labeled inputs visible in one dialog viewport, STANDARD gaps
- **Ratios & spacing**: inputs full box width; date pair ≈ [1:1] with wide gutter; box padding ≈ MORE

### Styling specifics (OBSERVED)
- **Palette**: dialog #ffffff, box border #e0e0e0 (est.), icon + asterisks + CREATE #3c10e9 (est.), labels #222222 (est.), placeholders italic #8a8a8a (est.), dashed dropzone border #c9c9c9 (est.)
- **Color application points**: violet on header icon, required asterisks, checkbox?, primary button — one hue, four touchpoints
- **Typography moves**: title LARGE bold with icon; labels STANDARD bold; placeholders italic; char counter gray right-aligned
- **Imagery stance**: styled icon only (round violet calendar chip)
- **Card treatment**: single bordered BOX wraps all fields (border, no shadow)
- **Signature moves**: instead of a colored band, the icon alone carries brand in the title bar; instead of ad-hoc footers, fixed buttons + divider come from the layout; drop zone advertises "Drop or paste file here"

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(titleBar: a!headerTemplateSimple(icon: calendar, …), isTitleBarFixed, buttons fixed); a!textField, a!paragraphField(characterLimit:4000), a!checkboxField, a!dropdownField ×4, a!fileUploadField, a!dateField ×2 in a!sideBySideLayout, a!boxLayout/a!cardLayout wrapper
- Charts: none | Affordances: file drag-drop, dialog close X

### Character & judgment
- **Register**: calm-clinical — white surfaces, hairlines, one accent
- **Why it works**: header thrift buys field room; asterisk color doubles as the action color, so "what's required" and "what to press" share one signal; date pairing is the only horizontal grouping and mirrors user mental model
- **Why not boring**: violet icon chip prevents an anonymous white header; dashed paste-aware dropzone; live 0/4000 counter
- **Boring twin**: a full-color banner eating 25% of the dialog, all ten fields double-columned to "fit", generic gray submit
- **What to steal**: simple header + fixed buttons for dense dialogs; reserve side-by-side for semantically paired fields only
- **Risks**: long dialog still scrolls (Locations clipped); italic gray placeholders are low-contrast; box-in-dialog border nesting could double up if more cards are added

### Code cross-check
- none — no SAIL source on page

## image-header-portal.png

### Identification
- **Image**: image-header-portal.png | **Source page**: ux-form-layout | **Alt/caption**: "image-header-portal" (Choosing a title bar template)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (public portal)

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public job applicant, one-shot session
- **Domain & brand context**: employer careers portal; indigo brand, friendly flat illustration — recruiting warmth on an institutional base
- **Top 3 user tasks (ranked)**: 1. Pick preferred country + office 2. Track progress across 4 steps 3. Advance (NEXT) without losing prior steps
- **Implied requirements**: "Applicant must see where they are in a 4-step flow"; "Location choice must be tap-friendly, not a dropdown"; "Selected state must be unmistakable"; "Search must shortcut long country/office lists"; "Back/cancel must always be available"
- **Data model sketch**: Application{personalInfo✓, contactInfo✓, locationPreference{country: US, office: Headquarters-McLean}, applicationDetails…}; Office{name, city} ×{Headquarters/McLean VA, NYC WeWork/New York NY, Remote WFH/United States}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM (portal)
├─ TITLE-BAR image-template h≈450 bg #111b56 (est.)
│  ├─ title EXTRA_LARGE "Apply to Work with Us" + secondary
│  └─ illustration right (3 figures, violet ellipse portals)
└─ COLUMNS [NARROW:AUTO]
   ├─ WIZARD milestone-vertical 3/4 "Location Preference" (2 done ●, active ○, future gray)
   └─ CONTENTS
      ├─ question MEDIUM "What is your preferred location?"
      ├─ SECTION "Select Country": search input + GRID(3-col) card-choice ×6 (US selected)
      ├─ SECTION "Select Office": search input + GRID(3-col) card-choice ×3 (Headquarters selected)
      └─ BUTTONS: outline BACK + text CANCEL left · solid NEXT right
```
- **Above the fold**: billboard header + stepper + country grid; office grid likely needs a short scroll (INFERRED from 1616px height)
- **Reading order**: F — header, then left stepper, then question and grids
- **Hierarchy rationale**: billboard sells the employer before asking anything (task 3 of brand, task 1 of user comes right after); stepper owns a permanent narrow column because orientation persists across steps; selected cards get the only saturated accent in the body
- **Density**: 2 — one question, two card grids, generous padding; editorial pacing for a public audience
- **Ratios & spacing**: stepper:content ≈ [1:3.5]; card grid gutters ≈ STANDARD; cards ≈ 3-up equal width

### Styling specifics (OBSERVED)
- **Palette**: header #111b56 (est.) deep indigo, illustration violets #6a5ae8/#8b7ff0 (est.), body #ffffff, card borders #d9d9d9 (est.), selection violet-blue #2d16e8 (est.) (2px border + corner triangle badge + white check), stepper done-dot/link #2322f0 (est.), NEXT #2d16e8 (est.), future-step gray #b9b9b9 (est.)
- **Color application points**: header field, illustration, stepper dots/labels, selected-card border+badge, primary button — all one indigo-violet family
- **Typography moves**: hero title EXTRA_LARGE white; step labels STANDARD (active bold dark, done as blue links); question MEDIUM regular; card labels STANDARD; office cards add gray SMALL secondary line (city)
- **Imagery stance**: flat illustration in header only; no photos; no icons in body cards
- **Card treatment**: choice cards = 1px border, white fill, square corners; selected = thick accent border + checkmark badge (cards-as-radio pattern)
- **Signature moves**: instead of dropdowns, card-choice grids for country/office via a!cardChoiceField-style selection; instead of a top progress bar, vertical milestone stepper in its own column; instead of a flat nav row, BACK (outline) and CANCEL (plain link) get distinct de-emphasis tiers below NEXT (solid)
- **Note**: header illustration hides on narrow screens (page tip; responsive image template)

### Component inventory (OBSERVED → INFERRED)
- a!formLayout or wizard with titleBar: a!headerTemplateImage(background #111b56 (est.), image right); a!milestoneField(orientation:"VERTICAL", active:3); a!textField search ×2; a!cardChoiceField ×2 (single-select, checkmark badges); a!buttonLayout(primary NEXT SOLID; secondary BACK OUTLINE + CANCEL LINK)
- Charts: none | Affordances: search-to-filter, selectable cards, wizard nav

### Character & judgment
- **Register**: energetic-consumer over institutional base — hero illustration and card pickers on a strict indigo system
- **Why it works**: one hue family from header to NEXT reads as one brand; selection is triple-coded (border weight, badge, check) so state survives colorblindness; tap-target cards suit an external audience that hates dropdowns
- **Why not boring**: illustrated indigo billboard instead of a gray toolbar; countries as cards, not a select; done-steps restyled as blue links (revisitable, INFERRED)
- **Boring twin**: white page titled "Application — Step 3 of 4", two dropdowns (Country, Office), horizontal breadcrumb, gray Continue button
- **What to steal**: image header for public forms; card-choice grids for low-cardinality high-stakes picks; milestone column for ≥3-step public flows
- **Risks**: indigo header + violet illustration is heavy above the fold on laptops; card grids cost vertical space vs dropdowns; CANCEL-as-link may be missed

### Code cross-check
- none — no SAIL source on page

## form-column-do.png + form-column-dont.png

### Principle: One narrow column for form content
- **DO shows**: License Application dialog (navy #131b56 (est.) full header) with Demographic then Contact sections stacked in one column; side-by-side used only for genuinely related fields (First/Last Name; City/State/Zip); Marital Status as a radio-card grid
- **DON'T shows**: same dialog with Demographic and Contact as two parallel columns — two competing reading paths, ragged whitespace under unequal columns, no clear end of section
- **Rule**: stack sections in a single column; users scroll happily but scan poorly across columns
- **Severity**: usually
- **Category**: forms | layout
- **SAIL implication**: keep contents single-column at Narrow-ish width; reserve a!sideBySideLayout/a!columnsLayout for semantic field pairs, never for whole sections

## form_layout_do_narrrow_width.png + form_layout_dont_narrrow_width.png

### Principle: Size contents width to the fields, not the screen
- **DO shows**: Create Project page in an Appian site (navy top bar) with Contents Width "Narrow" — form block centered ≈40% of viewport; Status|Priority pair share the row; focused input ringed violet #3c10e9 (est.); buttons align to the block
- **DON'T shows**: identical form at full width — Project Name input stretches ~90% of a 2596px screen, eye travel from label to buttons is enormous, dividers span the void
- **Rule**: single-column forms get "Narrow"/"Medium" contents width so field length ≈ expected input length
- **Severity**: usually (exception: dialogs use "Full" + dialog size, per page)
- **Category**: forms | layout
- **SAIL implication**: a!formLayout(contentsWidth: "NARROW"); centering comes free — no wrapper columns

## form-columns-do-buttons.png + form-columns-dont-buttons.png

### Principle: Center with contentsWidth, not empty columns
- **DO shows**: schematic Form (charcoal #404040 (est.) title bar) at narrow contents width — CANCEL/SUBMIT sit flush with the field block's left/right edges; margins are auto-generated
- **DON'T shows**: same form "centered" by flanking dashed empty columns (annotated "Empty Columns"); the button row ignores them, so CANCEL/SUBMIT land far outside the fields' edges — visibly misaligned footer
- **Rule**: never add empty columns to fake centering; the layout already centers contents and keeps buttons aligned
- **Severity**: always
- **Category**: forms | layout
- **SAIL implication**: contentsWidth handles centering for contents AND a!buttonLayout together; empty a!columnLayout children break that contract

## forms-fixed-width.png

### Identification
- **Image**: forms-fixed-width.png | **Source page**: ux-form-layout | **Alt/caption**: "Example of a form to register a new student" (Constrain input width and group related fields)
- **Device frame**: desktop (browser mock)
- **Marker**: neutral
- **UI type**: form (inside a portal/site)

### Use-case reconstruction (INFERRED)
- **Persona**: school registrar/admin, weekly cadence, enrolling students at "Baxley" university
- **Domain & brand context**: higher-ed portal; plum sidebar + graduation photo billboard = institutional warmth
- **Top 3 user tasks (ranked)**: 1. Enter student identity + contact 2. Enter address 3. Know what happens after submit
- **Implied requirements**: "Field widths must telegraph expected input length"; "Name and address parts must group on shared rows"; "Post-submit process must be explained beside the form"; "Required fields flagged inline"
- **Data model sketch**: Student{firstName*, middleName, lastName*, email*, dob{dd,mm,yyyy}, address1*, address2, city*, state, zip*}; sidebar nav implies Directory/Calendar/Services modules

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PORTAL
├─ PANE[left] nav w≈230 bg #2e2440 (est.) 6 items, "Services" active
└─ CONTENT bg #efeff1 (est.)
   ├─ BILLBOARD photo h≈300 (graduation crowd)
   ├─ CARD(form, overlaps billboard)
   │  ├─ icon chip + "New Student" LARGE
   │  ├─ SBS [1:1:1] First* | Middle | Last*
   │  ├─ Email* (≈⅔ width)
   │  ├─ DOB: Day/Month/Year mini-inputs (dd|mm|yyyy)
   │  ├─ Address 1*, Address 2 (full)
   │  └─ SBS City* | State(dropdown) | ZIP*
   └─ CARD(right rail "What Happens Next", numbered list ×2)
```
- **Above the fold**: billboard, name row, email, DOB, addresses, city row, sidebar card
- **Reading order**: F — photo, title, then label-input rows; right card read on demand
- **Hierarchy rationale**: identity fields first (task 1); DOB shrunk to three tiny boxes because content is 2+2+4 digits; explainer card parked outside the fill path so it informs without interrupting
- **Density**: 3 — ~9 inputs + nav + aside per viewport with comfortable padding
- **Ratios & spacing**: form card:aside ≈ [2.6:1]; name trio equal thirds; DOB inputs ≈60–80px each; STANDARD row gaps

### Styling specifics (OBSERVED)
- **Palette**: sidebar #2e2440 (est.) plum, active item highlight #3c3154 (est.), page #efeff1 (est.), cards #ffffff, icon chip + asterisks violet-blue #3d3ff0 (est.), labels #1f1f1f (est.), photo billboard purples/blacks
- **Color application points**: brand plum in nav only; violet on icon chip + required asterisks; photo carries all remaining color
- **Typography moves**: page title LARGE bold with round icon; labels STANDARD bold; DOB sub-labels SMALL ("Day","Month","Year"); aside title STANDARD bold; numbered list body SMALL/STANDARD
- **Imagery stance**: photographic billboard + one styled icon chip
- **Card treatment**: white cards, hairline borders, form card overlapping the photo (negative-margin move)
- **Signature moves**: instead of uniform full-width inputs, widths encode expected length (dd/mm/yyyy the extreme case); instead of helper text inside the form, a separate "What Happens Next" card; form card overlaps billboard for depth

### Component inventory (OBSERVED → INFERRED)
- Site/portal nav + a!formLayout-style card: a!sideBySideLayout ×3 (names, DOB, city/state/zip) with explicit widths; a!textField(characterLimit-sized), a!dropdownField(State), required asterisks; a!cardLayout right rail with numbered rich text; billboard image header
- Charts: none | Affordances: nav links, dropdown, form fill

### Character & judgment
- **Register**: institutional + warm-community — plum brand and celebratory photo over a strict form grid
- **Why it works**: input width = answer length (zip vs address) reduces error and scanning cost; related fields share rows so the form reads as address-book lines; process transparency card lowers submit anxiety
- **Why not boring**: photo billboard with overlapping card; three-box DOB instead of a lone date picker; right-rail expectations list instead of a confirmation surprise
- **Boring twin**: every input full-width in one endless column, DOB as a bare text field, no nav context, submit into the unknown
- **What to steal**: size inputs to data; keep a "what happens next" card beside consequential forms; overlap card on billboard for instant hierarchy
- **Risks**: photo contrast behind the white card is fine, but text over photo would fail; three DOB boxes cost extra tabs and validation; State optional while City/Zip required reads inconsistent (OBSERVED asterisks)

### Code cross-check
- none — no SAIL source on page

## forms-checklist.png
Tier note: listed B, but it is a complete page screenshot — treated as compact tier A per protocol rule 4.

### Identification
- **Image**: forms-checklist.png | **Source page**: ux-form-layout | **Alt/caption**: "Example of a form to create a new checklist" (Use cards and headings to group related content)
- **Device frame**: desktop (browser mock, Appian app)
- **Marker**: neutral
- **UI type**: form (configuration builder)

### Use-case reconstruction (INFERRED)
- **Persona**: ops/config admin, occasional cadence, defining reusable checklist templates
- **Domain & brand context**: internal Appian workflow app; near-monochrome with violet accents
- **Top 3 user tasks (ranked)**: 1. Name/describe the checklist 2. Define recommendation conditions (field=value, and/or) 3. Extend with more conditions/groups
- **Implied requirements**: "Details and Conditions must read as separate steps"; "Condition rows must be repeatable and removable"; "Match logic (any/all) must be explicit"
- **Data model sketch**: Checklist{name*, description, matchType:{any|all}, conditions[{field*, operator:=, value*}], conditionGroups[]}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PAGE bg #f7f8fa (est.)
├─ TITLE "Create Checklist" + helper
├─ SECTION icon-chip "Details" / caption
│  └─ CARD(SBS Name* | Description)
└─ SECTION icon-chip "Conditions" / caption
   └─ CARD(Match radios (Any/All) · Field* = Value* · ✕ · +Add Condition · +Add Condition Group)
```
- **Above the fold**: everything
- **Reading order**: single-column
- **Hierarchy rationale**: icon-chip headings segment the page into two labeled steps; white cards carve field clusters out of the gray page; add-links sit inside the card they extend
- **Density**: 3 — two compact zones, working-tool spacing
- **Ratios & spacing**: cards full content width; Name|Description ≈ [1:1]; icon chips ≈40px squares

### Styling specifics (OBSERVED)
- **Palette**: page #f7f8fa (est.), cards #ffffff with border #e3e5e8 (est.), icon chips violet glyph #4536dd (est.) on lilac #eceafc (est.), links/radio #4536dd (est.), disabled Value dropdown fill #ececec (est.), appian logo magenta #d6006d (est.)
- **Color application points**: violet confined to icon chips, selected radio, add-links, asterisks — pure action/structure coding
- **Typography moves**: page title MEDIUM_PLUS bold; section headings STANDARD bold with SMALL gray captions; labels SMALL/STANDARD bold
- **Imagery stance**: styled icons only (document, checklist glyphs in chips)
- **Card treatment**: flat white, 1px border, generous padding — cards as grouping, not decoration
- **Signature moves**: instead of bare a!sectionLayout headings, icon-chip + caption pairs; instead of one big card, one card per concern; inline "=" between Field and Value makes the rule read as a sentence
- **Marker**: neutral

### Component inventory (OBSERVED → INFERRED)
- a!sectionLayout ×2 with icon chips; a!cardLayout ×2; a!sideBySideLayout (Name|Description, Field=Value); a!radioButtonField (Match, horizontal); a!dropdownField ×2; remove ✕ icon-button; a!linkField "+ Add Condition"/"+ Add Condition Group" (dynamic list add, INFERRED)
- Charts: none | Affordances: repeatable condition rows, and/or toggle

### Character & judgment
- **Register**: utilitarian-ops, calm-clinical
- **Why it works**: heading+card rhythm makes a config tool feel like a two-question form; the gray page/white card contrast does the grouping the DON'T images fake with columns
- **Why not boring**: lilac icon chips give each section an identity; sentence-shaped condition row; caption text under each heading explains the section's contract
- **Boring twin**: one white page, two h3s, fields stacked edge to edge, "Add" button of unclear scope
- **What to steal**: icon-chip section headers; card-per-concern grouping on a tinted page
- **Risks**: gray-filled Value dropdown reads disabled vs the white Field (state ambiguity); small captions near contrast floor

### Code cross-check
- none — no SAIL source on page

## sidebar-template-example-ds.png

### Identification
- **Image**: sidebar-template-example-ds.png | **Source page**: ux-form-layout | **Alt/caption**: "sidebar-template-example-ds.png" (Choosing a title bar template)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (support-case intake)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer filing a support case, anxious about response time
- **Domain & brand context**: customer-support portal; bold yellow brand + playful isometric illustration = approachable SaaS
- **Top 3 user tasks (ranked)**: 1. Describe the issue 2. Pick the right priority (knowing SLAs) 3. Attach evidence + contact info, submit
- **Implied requirements**: "SLA expectations must be visible while choosing priority"; "Description must support rich text"; "Priority must be one-of-three, defaulted sensibly"; "Attachments optional but easy"; "Sidebar guidance must not scroll away"
- **Data model sketch**: Case{description:richtext, priority:{Low|Standard|Urgent} default Standard, attachments:file[], contactName, contactEmail}; SLA{Low:4-7d, Standard:1-2d, Urgent:2h/24×7} — read off sidebar copy

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM
├─ PANE[left] w≈31% bg #f6b60d (est.)  ← sidebar title bar template
│  ├─ isometric illustration
│  ├─ title "Open a New Case" + helper paragraph
│  └─ 3× icon+bold-label+line SLA explainers (Low/Standard/Urgent)
└─ PANE[right] white
   ├─ "Description" rich-text editor (B I U S link lists ⓘ)
   ├─ "Priority" radio-card row ×3 (Standard selected)
   ├─ "Attachments" UPLOAD + dashed drop zone
   ├─ SBS Contact Name | Contact Email Address
   └─ divider + outline CANCEL · solid OPEN CASE
```
- **Above the fold**: everything — one-screen form
- **Reading order**: Z across panes — yellow context column, then top-to-bottom form
- **Hierarchy rationale**: the biggest surface is guidance, not inputs — priority SLAs sit permanently beside the Priority control they explain; description editor is the tallest input because it's the highest-value field; buttons end the scan at bottom-right
- **Density**: 3 — five field groups + explainer column in one viewport, comfortable gaps
- **Ratios & spacing**: panes ≈ [1:2.2]; contact pair [1:1]; editor height ≈ 3× a text input; button divider full content width

### Styling specifics (OBSERVED)
- **Palette**: sidebar #f6b60d (est.) saturated golden yellow; illustration purples/magentas #5b2d8f/#e0447e (est.) + periwinkle base #aab4f0 (est.); content #ffffff; selected radio-card border + radio dot + OPEN CASE #2d16e8 (est.); dashed dropzone #c9c9c9 (est.); dark text #222222 (est.)
- **Color application points**: yellow only in the sidebar; violet only on selection + primary button; icons in sidebar are dark glyphs — complementary yellow/violet split (OBSERVED)
- **Typography moves**: sidebar title LARGE bold dark-on-yellow; SLA labels STANDARD bold with SMALL regular lines; field labels STANDARD bold; editor toolbar icon-only
- **Imagery stance**: isometric illustration, sidebar only; utility glyphs (↓, ○, ⚠) prefix each SLA tier
- **Card treatment**: priority options as radio-cards (1px border; selected 2px violet + filled radio); dropzones dashed; otherwise flat
- **Signature moves**: instead of helper text under a dropdown, the sidebar template turns SLA education into permanent page furniture; instead of plain radios, bordered radio-cards make priority feel like a deliberate choice; dark-on-yellow header text (not white) keeps contrast
- **Note**: at Medium-or-smaller dialog widths the sidebar collapses to a header (page tip)

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(titleBar: a!headerTemplateSidebar(background #f6b60d (est.), image, title, secondaryText + rich content)); a!richTextEditorField? (styled paragraph with toolbar, OBSERVED); a!radioButtonField styled as cards or a!cardChoiceField(radio) ×3; a!fileUploadField; a!textField ×2 in a!sideBySideLayout; a!buttonLayout(primary "OPEN CASE" SOLID, secondary CANCEL OUTLINE); isButtonDividerVisible: true (OBSERVED hairline)
- Charts: none | Affordances: rich-text controls, selectable priority cards, drag/paste upload

### Character & judgment
- **Register**: warm-community + utilitarian-ops — sunny guidance column wrapped around a strict, single-column working form
- **Why it works**: SLA copy adjacent to the Priority row converts a guess into an informed choice; complementary yellow/violet keeps 2 hues with clear jobs (context vs action); verb match "Open a New Case" → "OPEN CASE" button
- **Why not boring**: saturated yellow sidebar where competitors use gray; isometric spot art; radio-cards with visible selection weight; 24/7 urgency explained instead of implied
- **Boring twin**: centered white form titled "Submit Ticket", Priority as a bare dropdown with no SLA hints, attachments behind a tiny link, blue submit
- **What to steal**: sidebar template as a home for decision-support copy; match title verb to primary button; radio-cards for consequential one-of-N choices
- **Risks**: yellow demands dark text everywhere (white would fail contrast); sidebar consumes ~⅓ width — collapses on tablets; icon-only editor toolbar needs tooltips/a11y labels

### Code cross-check
- none — no SAIL source on page

## image-header-do.png + image-header-dont.png

### Principle: Scale the image header to the dialog, not the reverse
- **DO shows**: "Apply to Work with Us" dialog with a modest navy #111b56 (est.) image header (~30% of dialog height): title on one line, small illustration right; "Step 3 of 4", question, and the country card grid all visible
- **DON'T shows**: same dialog with a larger image size — header swells to ~45% of the dialog, title text auto-enlarges and wraps to three lines ("Apply to / Work with / Us"), illustration balloons, pushing the form below the fold → unnecessary scrolling
- **Rule**: in dialogs, pick the smaller image-header size; image size also scales title type (OBSERVED)
- **Severity**: usually (always on short dialogs)
- **Category**: layout | forms
- **SAIL implication**: a!headerTemplateImage(imageSize: small/medium) — remember it hides automatically on narrow screens, so never put content in the image

## form_layout_drag_from_palette.gif

### Interaction: Drag a form layout from the palette (gif: form_layout_drag_from_palette.gif)
- **State chart**: 1. Blank interface in designer — palette shows TOP LEVEL LAYOUTS (FORM, WIZARD, CARD HEADER, BILLBOARD HEADER, PANES…), canvas says "Drag and drop from palette", right rail offers "Select a template" thumbnails (OBSERVED f0) → 2. designer drags the FORM chip across the canvas (magenta drag highlight, OBSERVED f16) → 3. drop scaffolds a full form: title bar + contents + buttons (INFERRED — alt text; frames f32/f48/f63 are blank delta frames)
- **SAIL mechanism**: other — designer-tooling drag-drop that generates the a!formLayout scaffold
- **UX purpose**: orientation — shows FORM lives under TOP LEVEL LAYOUTS and only on blank interfaces
- **Replicate when**: documenting designer workflows | **Cost**: n/a — tooling behavior, not SAIL
- Note: frame extraction lost the drop/result states (transparent GIF deltas)

## form_layout_focus_true.gif

SKIPPED: all five extracted frames (f0–f29) are blank — f0 is a featureless #f0f0ef (est.) field and the rest are empty delta frames, so no interaction pixels are observable. Page context (INFERRED, from text only): with Automatically focus on first input = true, the form loads with the cursor already active in the first field.

## form_layout_focus_false.gif

SKIPPED: same extraction artifact — all five frames blank/near-blank; nothing observable. Page context (INFERRED): with the parameter off, the form loads with no field focused; the user must click into the first input.

## form_layout_fixed_header.gif

### Interaction: Fixed title bar while scrolling (gif: form_layout_fixed_header.gif)
- **State chart**: 1. "ESG WORLD 2024" event-registration form (cream page #f2f1e9 (est.), gold accents #a08a1c (est.), focused first field, radio-card Ticket Type) at top (OBSERVED f0) → 2. user scrolls; fields (Last Name → Organization Name → Job Title) slide up while the logo/title region persists at top (partially OBSERVED f26 — delta frame ghosting) → 3. deeper fields (Accessibility Needs 0/4000, Tshirt Size) reached, title bar still pinned (partially OBSERVED f79; f53/f105 blank)
- **SAIL mechanism**: other — a!formLayout fix-title-bar-on-scroll (isTitleBarFixed-style parameter)
- **UX purpose**: orientation — form identity stays visible on long forms/dialogs
- **Replicate when**: scrolling record-action dialogs (page: fix title bar AND buttons) | **Cost**: none — boolean; costs vertical space on short screens

## form_layout_form_width.gif

### Interaction: Contents width progression Full → Extra Narrow (gif: form_layout_form_width.gif)
- **State chart**: 1. Create Project form at "Full": vivid blue #2621f0 (est.) full-bleed title bar, fields spanning the whole 2716px viewport, Status|Priority side-by-side (OBSERVED f0) → 2–5. width steps down through "Wide", "Medium", "Narrow", "Extra Narrow", contents re-centering with growing side margins while the title bar stays full-bleed (INFERRED — alt text + page text; frames f38–f151 are blank delta frames)
- **SAIL mechanism**: other — contentsWidth parameter re-layout
- **UX purpose**: orientation — one lever tunes line length without restructuring
- **Replicate when**: choosing width for standalone forms (page default advice: Narrow-ish for single-column; Full only inside dialogs) | **Cost**: none — single enum

## Page rollup (tier B variants)
Default title bar choice is the **full** header template because it carries brand color at modest height and "generally looks good on all kinds of forms" (page text) — drop to **simple** for data-heavy dialogs, reach for **image** on customer-facing portals, and **sidebar** when persistent guidance (SLAs, checklists, contacts) earns a whole column. Default background is **White**; switch to **Transparent** the moment contents live in cards/boxes. Dark schemes (Charcoal/Navy/Plum) are all-pages-or-nothing. Button placement, ordering, and styling should always be left to a!buttonLayout defaults — every "custom" arrangement shown on this page (empty columns, wide contents) is a DON'T.
