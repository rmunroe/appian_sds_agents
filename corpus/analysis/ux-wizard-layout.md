# Analysis: ux-wizard-layout

Base demo UIs recurring across this page's screenshots: (1) a deliberately generic "Wizard / Wizard description" demo with steps Step 1 / Step 2 / Review, and (2) an insurance-style "Request a Quote / Customize your coverage" demo with steps About You / Coverage Options / Quote. Shared observed palette: dark title bar #3a3a3a (est.), page bg #ffffff, accent blue-violet #2322f0 (est.) on active milestone dot + NEXT + links, inactive milestone dots #c9c9c9 (est.), field borders #d9d9d9 (est.), docs annotation green #2ec26e (est.) (overlay, not part of the UI).

## Component: a!wizardLayout — tier B variant crops (page: ux-wizard-layout)
Official variant vocabulary: buttons via **Primary Buttons** / **Secondary Buttons** params; **Wizard Background Color**: "White" (default), "Transparent", "Charcoal Scheme", "Navy Scheme", "Plum Scheme", or hex.

### primary-buttons.png
- **Produces it**: `a!wizardLayout(primaryButtons: a!buttonLayout(...))` — custom buttons render to the LEFT of the auto-generated NEXT. OBSERVED: outline "PRIMARY" + solid "NEXT", right-aligned.
- **Looks like**: right-hand footer cluster; NEXT solid accent, custom primary outlined.
- **Use when**: a step needs an extra advancing/commit action | **Avoid when**: it would compete with Next for the solid-accent role.
- **Styling hooks**: `a!buttonWidget(style, size, color)`; Next itself not configurable.
- **Pairs well with**: `disableNextButtonWhen`, validation groups.
- **Hexes**: none (color not the variant dimension).
- **Marker**: neutral

### secondary-buttons.png
- **Produces it**: `a!wizardLayout(secondaryButtons: ...)` — custom buttons render NEXT TO the auto BACK. OBSERVED left cluster: outline "BACK", link-style "CANCEL" (auto-added on palette drag), outline "SECONDARY".
- **Looks like**: left-aligned trio opposing the primary cluster; Cancel de-emphasized as a borderless link.
- **Use when**: non-progression actions (cancel, save draft) | **Avoid when**: many buttons risk stacking in narrow dialogs.
- **Styling hooks**: `a!buttonWidget(style:"LINK"/"OUTLINE", size)`.
- **Pairs well with**: button divider; fixed footer in dialogs.
- **Hexes**: none.
- **Marker**: neutral

### wizard-layout-bg-comparison.png
- **Produces it**: `backgroundColor: "WHITE"` (default) vs `"TRANSPARENT"`.
- **Looks like**: split-screen of the same "About You" step; left half pure white, right half the standard site/portal light gray showing through.
- **Use when**: White inside record-action dialogs; Transparent on full site pages to blend with page chrome | **Avoid when**: Transparent inside a white dialog adds a pointless gray slab.
- **Styling hooks**: also accepts "CHARCOAL"/"NAVY"/"PLUM" schemes or custom hex.
- **Hexes**: White #ffffff vs Transparent #f2f2f5 (est.) — color IS the variant dimension.
- **Marker**: neutral

### Page rollup
Default choice for most cases is the auto-generated footer (Next/Back/Cancel) on a White background because dialogs are the wizard's primary host and the built-ins already encode the style guideline (solid accent reserved for Next/Submit); add custom buttons sparingly and keep them size "STANDARD".

## wizard-instructions.png

### Identification
- **Image**: wizard-instructions.png | **Source page**: ux-wizard-layout | **Alt/caption**: wizard step instructions
- **Device frame**: desktop
- **Marker**: neutral (annotated parameter illustration: green callout box on the instructions line)
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: deliberately generic demo — any occasional form-filler; the real audience is the Appian designer learning the `instructions` slot.
- **Domain & brand context**: none; placeholder content ("Wizard", "Step 1", generic Text/Paragraph/Dropdown fields).
- **Top 3 user tasks (ranked)**: 1. Read what the step wants ("Step 1 instructions") 2. Complete the three fields 3. Advance via Next.
- **Implied requirements**: "Guidance text must sit directly under the step label, above all inputs"; "Instructions must be visually subordinate to the heading"; "Progress context must stay visible while filling fields".
- **Data model sketch**: none recoverable — placeholder fields (Text, Paragraph, Dropdown) with no domain labels.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
WIZARD (bg #ffffff)
├─ TITLE-BAR dark #3a3a3a (est.) "Wizard" + subtitle
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE dot-vertical ×3 (Step 1 active, Step 2, Review)
│  └─ WIZARD-STEP 1/3
│     ├─ STEP-HEADING "Step 1" ≈ LARGE
│     ├─ INSTRUCTIONS "Step 1 instructions" ← annotated slot
│     └─ FORM (Text, Paragraph, Dropdown; 1-col)
└─ FOOTER: divider · CANCEL(link) | NEXT(solid)
```
- **Above the fold**: entire dialog.
- **Reading order**: single-column after the left milestone rail.
- **Hierarchy rationale**: step heading largest (task orientation); instructions immediately beneath in muted gray (task #1); inputs follow.
- **Density**: 2 — three inputs in a whole viewport, generous vertical gaps (~STANDARD marginBelow).
- **Ratios & spacing**: milestone rail ≈ 1/4 width, contents ≈ 3/4; step contents look "MEDIUM"-width with right whitespace.

### Styling specifics (OBSERVED)
- **Palette**: title bar #3a3a3a (est.), bg #ffffff, accent #2322f0 (est.), instructions gray #6c6c6c (est.), inactive dots #c9c9c9 (est.), field borders #d9d9d9 (est.), annotation #2ec26e (est.).
- **Color application points**: accent on active dot ring, NEXT fill, CANCEL link; all else neutral.
- **Typography moves**: title-bar title ≈ MEDIUM_PLUS bold white; step heading ≈ LARGE regular near-black; instructions ≈ STANDARD gray; field labels ≈ STANDARD bold.
- **Imagery stance**: none.
- **Card treatment**: flat; single hairline divider above footer.
- **Signature moves**: instructions rendered by a dedicated param (consistent size/color/position) instead of an ad-hoc rich-text block; dark title-bar template against a white body for instant frame/content separation.

### Component inventory (OBSERVED)
- `a!wizardLayout(style:"DOT_VERTICAL", showButtonDivider:true, titleBar: dark header template)`; `a!wizardStep(label:"Step 1", instructions:"Step 1 instructions", contents:{a!textField, a!paragraphField, a!dropdownField})`; auto NEXT + CANCEL.
- Chart types: none.
- Interactive affordances: Next/Cancel buttons; milestone is passive orientation.

### Character & judgment
- **Register**: calm-clinical + institutional — neutral grays, one restrained accent.
- **Why it works**: the instructions inherit a fixed muted style so they never compete with the LARGE heading; placement is invariant across steps, building habit.
- **Why not boring**: dark #3a3a3a (est.) title bar instead of default white chrome; violet-blue accent reserved for exactly three touchpoints; milestone whitespace kept empty rather than filled.
- **Boring twin**: a white-headered form where guidance is pasted as a bold rich-text paragraph above random fields, sized like the heading, with no progress rail.
- **What to steal**: put per-step guidance in `instructions`, never in `contents`.
- **Risks**: instructions gray on white is borderline for low-vision users; generic labels make the demo unmemorable.

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-button-divider.png

### Identification
- **Image**: wizard-layout-button-divider.png | **Source page**: ux-wizard-layout | **Alt/caption**: button divider
- **Device frame**: desktop
- **Marker**: neutral (green annotation box around the divider line)
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer requesting an insurance quote (self-service, first-time).
- **Domain & brand context**: insurance / financial services; sober, trust-oriented neutrals.
- **Top 3 user tasks (ranked)**: 1. Enter contact details 2. Understand progress (About You → Coverage Options → Quote) 3. Advance to coverage selection.
- **Implied requirements**: "Actions must be visually separated from a potentially scrolling form"; "Contact info captured before coverage"; "Preference of contact channel must be explicit".
- **Data model sketch**: QuoteRequest 1—1 Contact(firstName, lastName, email, phone, contactPreference[email|text], street, city, state, zip).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
WIZARD (bg #ffffff)
├─ TITLE-BAR dark "Request a Quote" + "Customize your coverage"
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE dot-vertical ×3 (About You active)
│  └─ WIZARD-STEP 1/3 "About You" + "Tell us about yourself"
│     ├─ COLUMNS [1:1] First/Last Name
│     ├─ COLUMNS [1:1:1] Email/Phone/Contact Preference(2 checkboxes)
│     ├─ Street Address (full)
│     └─ COLUMNS [1:1:1] City/State(dropdown)/Zip
└─ FOOTER: DIVIDER ← annotated · CANCEL(link) | NEXT(solid)
```
- **Above the fold**: entire dialog.
- **Reading order**: F — label-over-field rows scanned left→right, top→bottom.
- **Hierarchy rationale**: heading orients; multi-column rows compress related fields (name pair, address triplet); divider fences persistent actions from form flow.
- **Density**: 3 — nine inputs + milestone in one viewport, comfortable padding.
- **Ratios & spacing**: rail ≈ 1/4; row gaps ≈ STANDARD; divider is a full-width hairline #e3e3e3 (est.) directly above the footer.

### Styling specifics (OBSERVED)
- **Palette**: shared page palette (see intro); divider #e3e3e3 (est.).
- **Color application points**: accent only on active dot, NEXT, CANCEL link.
- **Typography moves**: step heading ≈ LARGE; instructions ≈ STANDARD gray; labels ≈ STANDARD bold near-black.
- **Imagery stance**: none.
- **Card treatment**: flat; hairline divider is the only internal border.
- **Signature moves**: `showButtonDivider:true` instead of a manually drawn `a!horizontalLine`; semantic field grouping via column ratios rather than section boxes.

### Component inventory (OBSERVED)
- `a!wizardLayout(showButtonDivider:true, style:"DOT_VERTICAL")`; `a!wizardStep(label:"About You", instructions:"Tell us about yourself")`; `a!columnsLayout` ×3; `a!textField` ×7, `a!checkboxField`(2 items), `a!dropdownField`(State); auto CANCEL/NEXT.
- Chart types: none.
- Interactive affordances: form inputs, Next/Cancel.

### Character & judgment
- **Register**: calm-clinical + institutional.
- **Why it works**: the divider gives the footer a stable "toolbar" reading even when Fix-buttons is on and content scrolls; column grouping mirrors mental chunks of an address form.
- **Why not boring**: 2-col/3-col rhythm instead of a monotone 1-col stack; checkboxes inline in the field grid; dark title bar.
- **Boring twin**: every field full-width in one long column, no divider, buttons floating ambiguously after the last input.
- **What to steal**: enable the button divider whenever the step can scroll.
- **Risks**: three-across fields will wrap on phones — acceptable since SAIL columns stack responsively (INFERRED).

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-button-sizes.png

### Principle: Use consistent button sizes
- **DO shows**: (text-only on page — no DO image) all custom buttons left at `size:"STANDARD"` so they match the non-configurable Next/Back.
- **DON'T shows**: "Request a Quote" footer where custom "SECONDARY" is rendered LARGE — visibly taller with bigger type than adjacent standard CANCEL, PRIMARY, NEXT — making the footer ragged and stealing prominence from NEXT.
- **Rule**: added primary/secondary wizard buttons must keep Size "Standard" to match the auto-generated pair.
- **Severity**: usually
- **Category**: forms
- **SAIL implication**: `a!buttonWidget(size:"STANDARD")` inside `primaryButtons`/`secondaryButtons`; Next/Back sizes are fixed by the layout.
- Note: singleton DON'T (no paired DO image under this heading).

## wizard-layout-contents-width.gif

### Interaction: Step contents width progression (gif: wizard-layout-contents-width.gif)
- **State chart**: (1) designer preview, blue #2322f0 (est.) title-bar wizard at default width — heading, contents box, CANCEL/NEXT span the canvas → (2) Styling tab > "Step Contents Width" dropdown opened; OBSERVED options: Default, Full, Wide, Medium, Narrow, Extra narrow → (3) narrower values selected in sequence → (4) contents column, step heading, and footer buttons re-center at each narrower width; title bar and milestone rail stay put.
- **SAIL mechanism**: other — `contentsWidth` enum re-render ("FULL" → "EXTRA_NARROW").
- **UX purpose**: orientation — demonstrates the param scopes only the step-contents column, not the wizard chrome.
- **Replicate when**: controlling line length of single-column forms on wide screens | **Cost**: one enum param; trivial.
- Frames are delta-optimized; f0/f40/f120 carry the readable states.

## wizard-layout-drag-from-palette.gif

### Interaction: Drag wizard layout from palette (gif: wizard-layout-drag-from-palette.gif)
- **State chart**: (1) blank interface — canvas placeholder "Drag and drop from palette", left palette lists TOP LEVEL LAYOUTS (FORM, WIZARD, CARD HEADER, BILLBOARD HEADER, PANES...), right panel shows "Select a template" thumbnails → (2) user grabs WIZARD; palette row outlines magenta #e0447c (est.) → (3) hatched drop-zone band appears mid-canvas → (4) on drop, a complete scaffold renders: title bar, dot-vertical milestone (Step 1 / Step 2 / Review), contents placeholder, CANCEL + NEXT; the config pane switches to Wizard Layout parameters.
- **SAIL mechanism**: other — design-time scaffolding that generates `a!wizardLayout` + three `a!wizardStep`s.
- **UX purpose**: orientation.
- **Replicate when**: starting any multi-step form (blank interfaces only — top-level layout) | **Cost**: none.

## wizard-layout-example-contents.png

### Identification
- **Image**: wizard-layout-example-contents.png | **Source page**: ux-wizard-layout | **Alt/caption**: example wizard step with contents highlighted
- **Device frame**: desktop
- **Marker**: neutral (green box + "Step contents" callout)
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: generic form-filler placeholder; real audience is the designer learning what the `contents` slot owns.
- **Domain & brand context**: none — same generic "Wizard / Wizard description" demo as wizard-instructions.png.
- **Top 3 user tasks (ranked)**: 1. Fill Text 2. Fill Paragraph 3. Pick Dropdown value, then Next.
- **Implied requirements**: "The step region must contain heading, instructions, and all inputs as one visual unit"; "Footer must sit outside the step region".
- **Data model sketch**: none — placeholder fields.

### Layout anatomy (OBSERVED)
- **Skeleton**: identical to wizard-instructions.png (dark title bar, [NARROW:AUTO] milestone rail + step column, footer). Annotation delta: the green box encloses the whole step column — "Step 1" heading, instructions line, Text, Paragraph, Dropdown — stopping just above the footer divider.
- **Above the fold**: entire dialog.
- **Reading order**: single-column.
- **Hierarchy rationale**: the callout teaches that heading + instructions render from the step's label/instructions params yet live inside the scrollable step region; only footer + title bar are chrome.
- **Density**: 2 — three inputs per viewport, generous gaps.
- **Ratios & spacing**: rail ≈ 1/4; contents ≈ 3/4 minus right margin.

### Styling specifics (OBSERVED)
- **Palette**: shared page palette (see intro); annotation #2ec26e (est.).
- **Color application points**: accent on active dot, NEXT, CANCEL; else neutral.
- **Typography moves**: heading ≈ LARGE; instructions ≈ STANDARD gray; labels ≈ STANDARD bold.
- **Imagery stance**: none.
- **Card treatment**: flat.
- **Signature moves**: contents region is width-governed by `contentsWidth`, so every component inherits a consistent column instead of per-field widths.

### Component inventory (OBSERVED)
- `a!wizardStep(contents: {a!textField, a!paragraphField, a!dropdownField})`; auto CANCEL/NEXT.
- Chart types: none.
- Interactive affordances: inputs + footer buttons only.

### Character & judgment
- **Register**: calm-clinical.
- **Why it works**: one bounded region makes the scroll/fixed split legible — everything in the box scrolls, everything outside persists.
- **Why not boring**: n/a — deliberately minimal teaching frame; the single accent NEXT is the only color event.
- **Boring twin**: a screenshot with no bounding box, leaving readers to guess whether the heading belongs to chrome or content.
- **What to steal**: treat the step region (heading→last input) as the unit you size and validate, not individual fields.
- **Risks**: none beyond the generic-demo blandness.

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-example.png

### Identification
- **Image**: wizard-layout-example.png | **Source page**: ux-wizard-layout | **Alt/caption**: wizard layout example
- **Device frame**: desktop
- **Marker**: neutral (four-zone anatomy diagram: green boxes + blue callouts "Milestone", "Title bar", "Step contents", "Buttons")
- **UI type**: wizard-step (canonical anatomy illustration for the Introduction)

### Use-case reconstruction (INFERRED)
- **Persona**: the page's canonical anatomy reference; end-user persona generic form-filler.
- **Domain & brand context**: none — "Wizard / Wizard description" placeholder.
- **Top 3 user tasks (ranked)**: 1. Orient via milestone 2. Complete step fields 3. Navigate with footer buttons.
- **Implied requirements**: "Every wizard must expose exactly four zones"; "Navigation must be dedicated chrome, never mixed into contents"; "Progress must be visible at all times".
- **Data model sketch**: none — placeholder fields (Text, Paragraph, Dropdown).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
WIZARD (bg #ffffff)
├─ TITLE-BAR dark #3a3a3a (est.) "Wizard" + secondary text   ← callout "Title bar"
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE dot-vertical ×3 (Step 1 ring, Step 2, Review) ← callout "Milestone"
│  └─ WIZARD-STEP 1/3: heading + instructions + FORM ×3       ← callout "Step contents"
└─ FOOTER: CANCEL(link) | NEXT(solid)                          ← callout "Buttons"
```
- **Above the fold**: entire dialog.
- **Reading order**: F — rail left, content right, actions bottom-right.
- **Hierarchy rationale**: four zones are boxed separately to teach the layout's fixed contract: chrome (title, milestone, buttons) is generated; only step contents is authored per step.
- **Density**: 2 — three inputs per viewport.
- **Ratios & spacing**: milestone rail ≈ 1/4 width; footer buttons pushed to opposite edges (Cancel left, Next right).

### Styling specifics (OBSERVED)
- **Palette**: title bar #3a3a3a (est.), bg #ffffff, accent #2322f0 (est.) (active dot, NEXT, CANCEL), inactive dots #c9c9c9 (est.), borders #d9d9d9 (est.), annotations #2ec26e (est.) with callout text #1d1db0 (est.).
- **Color application points**: accent restricted to progress + primary action + link; zero decorative color.
- **Typography moves**: title-bar title ≈ MEDIUM_PLUS bold white; step heading ≈ LARGE; labels ≈ STANDARD bold; instructions ≈ STANDARD gray.
- **Imagery stance**: none.
- **Card treatment**: flat white; dark bar is the only filled zone.
- **Signature moves**: instead of a hand-built form header, the layout supplies a templated title bar; instead of authored nav buttons, auto Next/Back/Cancel with fixed placement (primary right, secondary left).

### Component inventory (OBSERVED)
- `a!wizardLayout(titleBar: a!wizardTitleBarTemplate(...dark style), style:"DOT_VERTICAL", steps: {a!wizardStep(...)} ×3)`; auto footer buttons.
- Chart types: none.
- Interactive affordances: Next/Cancel; milestone passive.

### Character & judgment
- **Register**: calm-clinical + institutional — grayscale plus one accent.
- **Why it works**: zone separation matches the mental model "where am I / what do I do / how do I move"; opposite-edge button placement keeps destructive-ish Cancel far from Next.
- **Why not boring**: dark title bar anchors an otherwise white dialog; vertical milestone converts empty left margin into orientation; accent used exactly three times so the NEXT button is unmissable.
- **Boring twin**: a plain white form with an H2 title, fields stacked full-width, and Submit/Cancel side by side bottom-left — no progress indication, no zoning.
- **What to steal**: keep chrome auto-generated; spend design effort only inside step contents.
- **Risks**: none notable; milestone column becomes dead space on very narrow dialogs (SAIL responsively collapses it — INFERRED).

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-fixed-title-bar.gif

### Interaction: Fixed title bar while scrolling (gif: wizard-layout-fixed-title-bar.gif)
- **State chart**: (1) "Request a Quote" wizard, WHITE title-bar variant with hairline divider; step "Contact Information" shows ~9 inputs incl. an Additional Details rich-text editor → (2) user scrolls down; title + divider stay pinned at viewport top while milestone rail and fields slide beneath → (3) deeper scroll: top fields exit under the fixed bar, editor toolbar reaches mid-screen → (4) scroll back to top restores the full step.
- **SAIL mechanism**: other — `isTitleBarFixed: true` (only the title bar is fixed; the milestone scrolls with contents).
- **UX purpose**: orientation — form identity persists in long scrolling dialogs.
- **Replicate when**: any step likely to scroll (per guideline, pair with fixed buttons) | **Cost**: one boolean.
- Note: white title-bar template here vs the dark bars elsewhere on the page — evidence the bar is a styling template, not fixed chrome.

## wizard-layout-stacked-buttons.png

### Principle: Make sure buttons fit without stacking
- **DO shows**: (text-only on page — no DO image) wizard/dialog width sized so BACK, CANCEL, SECONDARY, PRIMARY, NEXT share one row.
- **DON'T shows**: "Request a Quote" step 2 (Coverage Options: three light-blue #eef4fe (est.) choice cards Less/Standard/More) where the footer is too narrow — SECONDARY wraps to a second row under BACK/CANCEL while PRIMARY/NEXT stay right — a ragged two-tier footer that breaks left/right action grouping and pushes tap targets apart.
- **Rule**: total button width must fit the step-contents/dialog width, or cut/shorten buttons.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: widen `contentsWidth` or the record-action dialog size; keep button count low; labels short; size "STANDARD".
- Bonus observation: completed milestone step renders filled accent dot + accent label ("About You"), current step bold ring, future gray.

## wizard-layout-step-heading.png

### Identification
- **Image**: wizard-layout-step-heading.png | **Source page**: ux-wizard-layout | **Alt/caption**: wizard layout showing the step heading
- **Device frame**: desktop
- **Marker**: neutral (green box on "Birth Name" heading + "Step heading" callout)
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public citizen ordering a vital record online; one-off, low familiarity, high stakes of getting names exactly right.
- **Domain & brand context**: government vital-records office; official, sober near-black-navy header conveys institutional authority.
- **Top 3 user tasks (ranked)**: 1. Enter birth name exactly as on the original certificate 2. Upload acceptable proof-of-name document 3. Progress through the 4-step request to Confirmation.
- **Implied requirements**: "Name must match the original certificate" (helper text enforces); "Proof of Name is mandatory before proceeding"; "A legal-name-change path must exist" (checkbox); "Users must know which documents are acceptable before uploading".
- **Data model sketch**: BirthCertificateRequest(firstName*, middleName, lastName*, suffix, nameDiffersFromLegal:boolean, proofOfNameDocs[1..n]); later steps imply BirthDate&Location, ParentalInformation entities.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
WIZARD (bg #ffffff)
├─ TITLE-BAR very-dark-navy #101b2d (est.) "Order Birth Certificate"
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE dot-vertical ×4 (Birth Name active, Birth Date & Location,
│  │   Parental Information, Confirmation)
│  └─ WIZARD-STEP 1/4
│     ├─ STEP-HEADING "Birth Name" ≈ LARGE ← annotated
│     ├─ COLUMNS [1:1:1:NARROW] First*(req) / Middle / Last* / Suffix(dropdown)
│     ├─ helper text + checkbox "name...different than...current legal name"
│     ├─ FILE-UPLOAD "Proof of Name*" (UPLOAD btn + dashed dropzone)
│     └─ CARD(info, fill #eef1f8 est.): info icon + acceptable documents list ×2
└─ FOOTER: CANCEL(link) | NEXT(solid)
```
- **Above the fold**: entire step.
- **Reading order**: single-column with one 4-across name row.
- **Hierarchy rationale**: step heading restates the milestone label at content scale (the annotated lesson); the name row leads because it is the step's core datum; guidance card sits below the upload it explains.
- **Density**: 3 — ~7 inputs plus guidance card in one viewport, comfortable padding.
- **Ratios & spacing**: rail ≈ 1/4; name row ≈ [1:1:1:0.5]; info card full contents width, padding ≈ STANDARD.

### Styling specifics (OBSERVED)
- **Palette**: title bar #101b2d (est.) (navy-black, darker than the #3a3a3a (est.) charcoal demos), bg #ffffff, accent #2322f0 (est.) (active dot, NEXT, CANCEL, required asterisks), info-card fill #eef1f8 (est.), helper gray #6c6c6c (est.), borders #d9d9d9 (est.).
- **Color application points**: required-field asterisks in accent (not red); info icon accent blue; NEXT solid accent; everything else neutral.
- **Typography moves**: title ≈ MEDIUM_PLUS bold white; step heading ≈ LARGE; labels ≈ STANDARD bold; helper + card body ≈ STANDARD/SMALL gray-on-tint.
- **Imagery stance**: styled icons only (info glyph, upload/file glyph).
- **Card treatment**: filled flat card (no border/shadow) for guidance; dashed border reserved for the dropzone.
- **Signature moves**: acceptance criteria moved into a tinted card with bullets instead of a paragraph of helper text; asterisks in brand accent instead of alarm red; conditional checkbox placed directly under the fields it modifies.

### Component inventory (OBSERVED)
- `a!wizardLayout(style:"DOT_VERTICAL", titleBar: dark navy template)`; `a!wizardStep(label:"Birth Name")` with `a!columnsLayout`, `a!textField(required:true)` ×2, `a!textField`, `a!dropdownField(label:"Suffix")`, `a!checkboxField`, `a!fileUploadField(required:true)`, `a!cardLayout(style: light tint)` + `a!richTextDisplayField` (icon + bullets); auto CANCEL/NEXT.
- Chart types: none.
- Interactive affordances: checkbox likely toggles a legal-name section (INFERRED showWhen); drag-drop upload; Next/Cancel.

### Character & judgment
- **Register**: institutional + calm-clinical — dark federal-feeling header, restrained single accent.
- **Why it works**: the heading repeats the milestone label so users on small screens or minimal style never lose context (the guideline this image illustrates); guidance card prevents upload rejections before they happen; 4-across name row mirrors how names are written.
- **Why not boring**: near-black navy header reads official rather than generic gray; accent-colored asterisks unify the palette; dashed dropzone + button offers two upload affordances in one control.
- **Boring twin**: gray header titled "Form", fields stacked one per row, "Upload proof" with no acceptable-document list, red asterisks, and no step heading — users mid-scroll would forget which step they're in.
- **What to steal**: restate the step label as a LARGE content heading; put document-acceptance rules in a tinted card adjacent to the upload.
- **Risks**: tinted card text at SMALL size nears contrast limits; 4-across name row will stack tall on phones; suffix dropdown minWidth.

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-step-indicators.png

### Identification
- **Image**: wizard-layout-step-indicators.png | **Source page**: ux-wizard-layout | **Alt/caption**: three versions of a wizard showing a vertical, horizontal, and minimal style
- **Device frame**: desktop (three stacked frames in one tall composite; green frame borders + labels "Horizontal milestone", "Vertical milestone", "Minimal")
- **Marker**: neutral
- **UI type**: wizard-step (style-selection comparison sheet)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer requesting an insurance quote; the composite's real audience is the designer choosing a milestone style.
- **Domain & brand context**: insurance quote flow; dark-navy institutional header.
- **Top 3 user tasks (ranked)**: 1. See where "Coverage Options" sits in the flow 2. Pick Less/Standard/More coverage 3. Move Next/Back.
- **Implied requirements**: "Progress indication must adapt to available space"; "Same step contents must work under any milestone style"; "When no milestone shows, a step counter must replace it".
- **Data model sketch**: QuoteRequest.coverageLevel ∈ {Less, Standard, More}; steps About You → Coverage Options → Quote.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COMPOSITE ×3 frames, identical content, milestone style varies
├─ [Horizontal] TITLE-BAR navy #202b3b (est.)
│  ├─ MILESTONE chevron-horizontal ×3 full-width: About You (done, #5468f5 est.)
│  │   ▸ Coverage Options (current, #2322f0 est., white bold) ▸ Quote (future, #d8d8d8 est.)
│  └─ heading + CARD-CHOICES [Less|Standard|More] + divider + BACK/CANCEL | NEXT
├─ [Vertical] TITLE-BAR
│  └─ COLUMNS [NARROW:AUTO]
│     ├─ MILESTONE line-vertical: About You (accent text), ▶ Coverage Options (bold + accent
│     │   pointer on the line), Quote (gray)
│     └─ heading + CARD-CHOICES + divider + footer
└─ [Minimal] TITLE-BAR
   └─ "Step 2 of 3" (SMALL bold) → heading → CARD-CHOICES → divider → footer
```
- **Above the fold**: each frame is a complete viewport.
- **Reading order**: horizontal: Z (milestone bar → heading → cards → footer); vertical: F; minimal: single-column.
- **Hierarchy rationale**: content held constant isolates the one variable — where progress lives; horizontal spends ~70px of height, vertical spends ~1/4 of width, minimal spends one text line.
- **Density**: 2 — one decision (3 choice cards) per viewport.
- **Ratios & spacing**: vertical rail ≈ 1/4 width; chevron bar full contents width; choice cards equal thirds with ≈ STANDARD gaps.

### Styling specifics (OBSERVED)
- **Palette**: title bar #202b3b (est.), bg #ffffff, current-step accent #2322f0 (est.), completed chevron #5468f5 (est.) (lighter accent tint), future #d8d8d8 (est.), choice-card fill #eef4fe (est.), annotations #2ec26e (est.).
- **Color application points**: milestone states (3-tone: light-accent done / full-accent current / gray future); NEXT solid; BACK outline; CANCEL link; card fills.
- **Typography moves**: step heading ≈ LARGE_PLUS; chevron labels ≈ STANDARD (white bold on current); "Step 2 of 3" ≈ SMALL bold; card labels ≈ MEDIUM_PLUS.
- **Imagery stance**: none.
- **Card treatment**: filled light-blue choice cards, subtle shadow, no border.
- **Signature moves**: chevron shapes encode direction, not just position; completed vs current distinguished by two accent tones rather than checkmarks; minimal style swaps chrome for a one-line counter instead of dropping context entirely.

### Component inventory (OBSERVED)
- `a!wizardLayout(style:)` — OBSERVED renderings correspond to "CHEVRON_HORIZONTAL", a vertical line/pointer style ("LINE_VERTICAL"-family), and "MINIMAL" (auto "Step 2 of 3" counter); choice cards ≈ `a!cardLayout` trio as selectable options (INFERRED `a!cardChoiceField`); auto BACK/CANCEL/NEXT.
- Chart types: none.
- Interactive affordances: card choices, footer nav.

### Character & judgment
- **Register**: institutional + calm-clinical.
- **Why it works**: three-tone chevron reads done/current/next at a glance; identical content across frames makes the trade-off (height vs width vs context) self-evident; choice cards give the step one big tap decision.
- **Why not boring**: milestone rendered as directional chevrons instead of numbered circles; oversized card targets instead of radio buttons; step counter fallback keeps minimal style honest.
- **Boring twin**: one screenshot of a numbered-circle stepper, coverage picked via a dropdown, and no comparison of alternatives.
- **What to steal**: hold content constant when demonstrating a style enum; use vertical styles for >5 steps or long labels, minimal for 1–2 steps (page guideline).
- **Risks**: horizontal chevron labels already near truncation at 3 steps; light-accent completed chevron on white is low-contrast for the label text.

### Code cross-check
- none — no SAIL source on this page.

## wizard-layout-with-vertical-tabs.png

### Principle: Avoid vertical tab patterns with vertical milestone styles
- **DO shows**: (text-only on page) tabs inside a step paired with a horizontal or minimal milestone, keeping one vertical nav element per screen.
- **DON'T shows**: generic "Wizard" demo, dot-vertical milestone (Steps 1–2 completed: filled accent dots + accent labels; Step 3 current) whose step contents embed a second vertical nav — tab list Workspace/Tasks/Requests/Calendar/My Time/Expenses with solid-accent selected row + icons — two adjacent vertical rails with competing selection states, content squeezed into the right third.
- **Rule**: never run two vertical navigation columns side by side; switch the milestone style, not the tabs.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: when contents include a vertical tab pattern (selected-card + showWhen), set wizard `style:"DOT_HORIZONTAL"` (or "MINIMAL"), not a vertical style.

## wizard-milestones.gif

### Interaction: Cycling milestone styles in the designer (gif: wizard-milestones.gif)
- **State chart**: (1) design view: wizard with solid-accent #2322f0 (est.) title bar, dot-vertical milestone (Step 1/Step 2/Review), "Drop component here" placeholder → (2) Styling tab opened; **Style** param renders as a row of 7 icon buttons → (3) hovering shows tooltips naming variants (OBSERVED "Dot horizontal", "Line horizontal") → (4) selecting each icon live-re-renders the canvas milestone (dots left → above → chevron/line variants → minimal counter).
- **SAIL mechanism**: other — `style` enum ("DOT_VERTICAL"..."MINIMAL") re-render.
- **UX purpose**: orientation — maps the 7-value style vocabulary to visuals without leaving the canvas.
- **Replicate when**: choosing a milestone style per step count/label length | **Cost**: one enum; designer-only interaction.
- Frames are delta-optimized; f0/f52/f156 carry the readable states.

## wizard-section-headings-small.png + wizard-section-headings-large.png (DO/DON'T pair)

### Principle: Choose an appropriate section heading size
- **DO shows** (wizard-section-headings-small.png): "About You" step whose section labels — Name, Contact, Address — render smaller than the LARGE step heading and in muted gray #757575 (est.); the step stays one form with quiet subdivisions.
- **DON'T shows** (wizard-section-headings-large.png): same step with Name/Contact/Address set larger than the step heading and in accent #2322f0 (est.) bold — hierarchy inverts, the page reads as three separate forms, and the real step title recedes.
- **Rule**: section headings inside a step must be at least one size-ladder step smaller than the wizard step heading, and quieter in color.
- **Severity**: always
- **Category**: typography
- **SAIL implication**: `a!sectionLayout(labelSize:"SMALL"/"MEDIUM", labelColor:"SECONDARY")` beneath `showStepHeading: true` (step heading ≈ LARGE); don't put accent color on section labels.

## wizard-step-label.png

### Identification
- **Image**: wizard-step-label.png | **Source page**: ux-wizard-layout | **Alt/caption**: wizard step labels
- **Device frame**: desktop
- **Marker**: neutral (two green boxes: milestone "Step 1" + heading "Step 1"; callouts "Step label in milestone" / "Step label in step heading")
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: generic form-filler; real audience is the designer learning that one `label` string renders in two places.
- **Domain & brand context**: none — generic "Wizard / Wizard description" demo.
- **Top 3 user tasks (ranked)**: 1. Locate current step in milestone 2. Confirm step identity via heading 3. Complete fields and advance.
- **Implied requirements**: "One label string must drive both milestone and step heading"; "Labels must stay short enough for the milestone rail"; "Redundant placement must survive when either element is hidden".
- **Data model sketch**: none — placeholder fields.

### Layout anatomy (OBSERVED)
- **Skeleton**: identical to wizard-instructions.png (dark title bar; [NARROW:AUTO] dot-vertical rail + step column; Text/Paragraph/Dropdown; CANCEL | NEXT). Annotation delta: the same string "Step 1" boxed at both render points.
- **Above the fold**: entire dialog.
- **Reading order**: single-column after the rail.
- **Hierarchy rationale**: label appears twice at two scales — rail placement answers "where am I", heading placement answers "what is this"; redundancy is the lesson.
- **Density**: 2 — three inputs per viewport.
- **Ratios & spacing**: rail ≈ 1/4; heading marginBelow ≈ LESS before instructions.

### Styling specifics (OBSERVED)
- **Palette**: shared page palette (see intro).
- **Color application points**: accent on active dot ring, NEXT, CANCEL only.
- **Typography moves**: the same string at two ladder points — milestone label ≈ STANDARD bold, step heading ≈ LARGE regular; instructions ≈ STANDARD gray.
- **Imagery stance**: none.
- **Card treatment**: flat.
- **Signature moves**: single-source label rendered at two scales (`label` powers milestone + heading) — no drift possible between nav and content.
- **Component inventory (OBSERVED)**: `a!wizardStep(label:"Step 1", instructions:"Step 1 instructions")` with wizard `showStepHeading:true`, `style:"DOT_VERTICAL"`; auto CANCEL/NEXT.
- Chart types: none. Interactive affordances: footer buttons only.

### Character & judgment
- **Register**: calm-clinical.
- **Why it works**: duplicated label keeps context when the milestone collapses on small screens (responsive fallback is minimal style).
- **Why not boring**: n/a beyond the shared demo restraint — the teaching value is the dual render, not visual flourish.
- **Boring twin**: a hand-typed page heading that no longer matches the milestone after a rename.
- **What to steal**: write step labels as short noun phrases (2–3 words) so they fit rails and chevrons; let the layout render them.
- **Risks**: long labels wrap the rail and crowd horizontal milestone styles.

### Code cross-check
- none — no SAIL source on this page.

## wizard_layout_titleBar.png

### Identification
- **Image**: wizard_layout_titleBar.png | **Source page**: ux-wizard-layout | **Alt/caption**: wizard_layout_titleBar
- **Device frame**: desktop (2× scale render of the generic demo)
- **Marker**: neutral (green frame around the entire title bar; callout "Title bar")
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: generic form-filler; designer audience learning the Title Bar Template parameter.
- **Domain & brand context**: none — "Wizard / Wizard description" demo.
- **Top 3 user tasks (ranked)**: 1. Identify the form ("Wizard") 2. Read its purpose (secondary text) 3. Proceed into step 1.
- **Implied requirements**: "Form identity must live in dedicated chrome above milestone and contents"; "Secondary text must be optional"; "Bar styling must come from a template, not hand-built layout".
- **Data model sketch**: none — placeholder fields.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
WIZARD
├─ TITLE-BAR full-width dark #3a3a3a (est.)  ← annotated as one zone
│  ├─ title "Wizard" bold white ≈ LARGE
│  └─ secondary "Wizard description" ≈ STANDARD #cfcfcf (est.)
├─ COLUMNS [NARROW:AUTO]: dot-vertical rail ×3 | Step 1 heading + instructions + FORM ×3
└─ FOOTER: CANCEL(link) | NEXT(solid #2322f0 est.)
```
- **Above the fold**: entire dialog.
- **Reading order**: single-column after the rail.
- **Hierarchy rationale**: the bar is the only filled band, so form identity outranks everything; no divider needed — the dark fill self-separates (showTitleBarDivider off here).
- **Density**: 2.
- **Ratios & spacing**: bar height ≈ 240px at 2× (~120px logical) with left-aligned text block; generous internal padding ≈ MORE.

### Styling specifics (OBSERVED)
- **Palette**: bar #3a3a3a (est.), title #ffffff, secondary #cfcfcf (est.), body bg #ffffff, accent #2322f0 (est.), annotation #2ec26e (est.).
- **Color application points**: the bar is the page's single large color block; accent reserved for dot ring/NEXT/CANCEL.
- **Typography moves**: title ≈ LARGE bold white; secondary ≈ STANDARD light gray; two-line lockup, no icon.
- **Imagery stance**: none.
- **Card treatment**: flat; filled band instead of bordered header.
- **Signature moves**: title bar accepts templates — plain text, header components (simple/full/image/sidebar), or billboard/card layouts — so branding scales from this text-on-charcoal minimum to imagery without changing the wizard body. Cross-ref: header-template-compare.png (same page section; analyzed under its primary page) catalogs those template options.
- **Component inventory (OBSERVED)**: `a!wizardLayout(titleBar: <template: text | header | billboard | card>, showTitleBarDivider:false, isTitleBarFixed available, style:"DOT_VERTICAL")`; `a!wizardStep(...)`; auto CANCEL/NEXT.
- Chart types: none. Interactive affordances: none in the bar (identity only).

### Character & judgment
- **Register**: calm-clinical + institutional.
- **Why it works**: a dark full-bleed band gives the dialog instant figure/ground separation; secondary text answers "why am I here" without consuming step space.
- **Why not boring**: charcoal fill instead of a default white header row; the bar doubles as the wizard's one branding surface via templates.
- **Boring twin**: white header with black text and a hairline rule, identical to every other dialog in the app.
- **What to steal**: brand the title bar (color or billboard template) and leave the step body neutral.
- **Risks**: dark bars need light logo/text variants; billboard templates could dwarf short wizards.

### Code cross-check
- none — no SAIL source on this page.
