# Analysis: ux-buttons

Source page: `corpus/pages/ux-buttons.md` (SAIL Design System > Components > Buttons). No SAIL source on page, so all colors are pixel-estimated. Tier B crops are rolled up in one component section at the end of this file, per template. Accent blue recurring across every image: #2e6da3 (est.).

## ux_button_styles.gif

### Interaction: Button style tour (gif: ux_button_styles.gif)
- **State chart** (frames f0/f9/f18/f27/f36): (1) idle row of four buttons OBSERVED: `OUTLINE` (blue #2e6da3 (est.) border+text, white fill), `GHOST` (identical to outline at rest), `LINK` (text-only blue), `SOLID` (blue fill, white text) → (2–3) hand cursor sweeps across buttons (f9/f18 are delta frames, mostly transparent) → (4) f27: cursor hovers/presses; GHOST region flashes toward solid fill, SOLID darkens → (5) loop reset.
- **SAIL mechanism**: none in-app — demonstrates `a!buttonWidget(style: "OUTLINE"|"GHOST"|"LINK"|"SOLID")` hover/focus states.
- **UX purpose**: orientation — teaches that GHOST rests as outline but becomes solid on focus, so style ≠ static look.
- **Replicate when**: choosing among the four style values | **Cost**: none — built-in states.
- **Marker**: neutral

## primary_buttons.png

### Principle: One solid button per interface, never on Cancel
- **DO shows**: none (DON'T-only image; the DO is the page's default: exactly one SOLID for the top action).
- **DON'T shows**: two stacked form footers (top-border divider #e0e0e0 (est.)). Row 1: outline `CANCEL` left; right group has TWO solid blue `SAVE DRAFT` + `SUBMIT` — competing calls to action. Row 2: solid `CANCEL` left, outline `SUBMIT` right — the destructive/abandon action outshouts the submission. OBSERVED.
- **Rule**: exactly one SOLID button per interface, and never on cancel/delete actions.
- **Severity**: always
- **Category**: color
- **SAIL implication**: one `a!buttonWidget(style: "SOLID")` max per screen; secondary actions get `"OUTLINE"`; cancel gets OUTLINE/LINK, never SOLID.
- **Marker**: dont

## buttons_linkStyle.png + buttons_linkStyle_dont.png

### Principle: At most one LINK-style button, only to de-emphasize
- **DO shows** (buttons_linkStyle.png): footer with divider #d9d9d9 (est.): left `BACK` (outline) + `CANCEL` (link, text-only blue #2e6da3 (est.)); right `PLACE ORDER` (solid). Three-tier visual hierarchy = three action ranks. OBSERVED.
- **DON'T shows** (buttons_linkStyle_dont.png): `CANCEL` left, `SAVE DRAFT` + `SUBMIT` right — ALL rendered as bare text links; no fill or border anywhere, so nothing reads as the submit action and targets look like navigation. OBSERVED.
- **Rule**: LINK style is a demotion tool; more than one per group erases affordance and hierarchy.
- **Severity**: usually
- **Category**: color | layout
- **SAIL implication**: ≤1 `a!buttonWidget(style: "LINK")` per `a!buttonGroup`/footer; keep SOLID on the primary.
- **Marker**: do/dont pair

## ux_secondaryButtons.png

### Principle: Inline body buttons wear SECONDARY gray, not the accent
- **DO shows**: "Create New Survey" form (title ≈ LARGE #333 (est.), section header "Add Survey Questions" ≈ MEDIUM accent blue #2e6da3 (est.)). Editable grid (Question / Type / Required / Setup, red delete ✕ #d03a4b (est.), blue "+ Add Question" link). The inline `PREVIEW FORM` button is SECONDARY: gray text #6d6d6d (est.), gray border #c9c9c9 (est.). Footer `CANCEL`/`SUBMIT` keep accent blue (rendered pale ≈ #9dbcd8 (est.) — INFERRED disabled while form is empty). OBSERVED.
- **DON'T shows**: none pictured — INFERRED: accent-blue PREVIEW FORM would compete with SUBMIT.
- **Rule**: buttons acting inside form content are gray SECONDARY; only footer submission wears accent color.
- **Severity**: usually
- **Category**: color | forms
- **SAIL implication**: `a!buttonWidget(color: "SECONDARY", style: "OUTLINE")` for inline actions.
- **Marker**: do

## buttons_secondary_do.png

### Principle: Beside a destructive action, demote Cancel to SECONDARY
- **DO shows**: "Delete Photo?" confirmation dialog — title ≈ LARGE gray #6b6b6b (est.), body #333 (est.), hairline divider #d9d9d9 (est.). Footer: `CANCEL` left in SECONDARY (gray text #767676 (est.), border #d6d6d6 (est.)); `DELETE` right as NEGATIVE outline (red text+border #d03a4b (est.), white fill). Red is the only saturated hue on screen, so danger owns all color attention. OBSERVED.
- **DON'T shows**: none pictured — INFERRED: accent-blue CANCEL would visually rival DELETE and invite misclicks.
- **Rule**: when one action is destructive, its neighbors go gray so red stands alone.
- **Severity**: usually
- **Category**: color
- **SAIL implication**: `a!buttonWidget(label:"DELETE", color:"NEGATIVE", style:"OUTLINE")` + `a!buttonWidget(label:"CANCEL", color:"SECONDARY")`.
- **Marker**: do

## destructive_buttons.png

### Principle: NEGATIVE red only for real data loss
- **DO shows**: none (DON'T-only; DO is red reserved for persisted-data deletion).
- **DON'T shows**: "Employee ID" search fragment. Inline pair: `SEARCH` (blue outline #2e6da3 (est.)) + `RESET` (red outline #d03a4b (est.)); footer: red `CANCEL` left, blue `SEARCH` right. RESET merely clears a textbox and CANCEL abandons an unsaved view — both easily reversible, yet styled like deletions; red loses meaning and users hesitate. OBSERVED.
- **Rule**: NEGATIVE color = loss of persisted data only; never for reset/cancel of unsaved input.
- **Severity**: always
- **Category**: color
- **SAIL implication**: reset/cancel get `color: "SECONDARY"` (or default accent), reserving `color: "NEGATIVE"` for delete-type actions.
- **Marker**: dont

## buttons_inconsistentSize_dont.png

### Principle: One size per button group
- **DO shows**: none (DON'T-only; DO is uniform STANDARD size).
- **DON'T shows**: form footer (top divider #d9d9d9 (est.)) with right-aligned pair: `SAVE & PUBLISH` outline at standard height beside a visibly taller LARGE solid `SAVE DRAFT`. Mismatched heights make the group look broken, and the bigger+solid treatment lands on the lesser action (draft over publish). OBSERVED.
- **Rule**: every button in a group shares one `size` value.
- **Severity**: always
- **Category**: layout | density
- **SAIL implication**: identical `size` param across the `a!buttonGroup`; emphasis comes from `style`, not size mixing.
- **Marker**: dont

## buttons_gridToolbar.png

### Principle: Grid toolbars use SMALL + SECONDARY buttons
(Batch suggested tier A; overridden to tier C single — it is a toolbar+grid fragment with no page chrome, not a full-page UI.)
- **DO shows**: selection grid (HR performance domain — INFERRED from labels). Toolbar of three SMALL SECONDARY outline buttons `INITIATE ANNUAL REVIEW` / `VIEW INTERIM REVIEWS` / `REQUEST 360 FEEDBACK` (gray text #6d6d6d (est.), border #bdbdbd (est.)) sitting flush above a checkbox grid (columns First Name / Last Name / Department / Start Date; 3 of 4 rows checked, checkbox fill #2e6da3 (est.); zebra rows #f7f7f7/#ffffff (est.)). Gray+small keeps bulk actions from impersonating form submission. OBSERVED.
- **DON'T shows**: none pictured — INFERRED: accent-colored standard buttons here would read as page-level actions.
- **Rule**: buttons acting on grid selections = `size:"SMALL"` + `color:"SECONDARY"`, placed directly above the grid.
- **Severity**: usually
- **Category**: data-display | color
- **SAIL implication**: `a!buttonArrayLayout` of `a!buttonWidget(size:"SMALL", color:"SECONDARY", style:"OUTLINE")` above `a!gridField(selectable:true)`.
- **Marker**: do (page shows it as neutral illustration)

## buttons_largeSize_do.png

### Identification
- **Image**: buttons_largeSize_do.png | **Source page**: ux-buttons ("Large" size) | **Alt/caption**: ds-images/buttons_largeSize_do.png
- **Device frame**: desktop
- **Marker**: neutral (used as the DO for "Large draws attention to the main action")
- **UI type**: form (public sign-up / landing hybrid)

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public visitor creating an account; one-shot task, no cadence.
- **Domain & brand context**: education/creative-program vibe — radial colored-pencil hero photo suggests school, arts, or learning platform; friendly consumer brand.
- **Top 3 user tasks (ranked)**: 1. Complete sign-up. 2. Confirm what brand/service this is (hero). 3. none — page has exactly one action.
- **Implied requirements**: "Sign-up must need only 3 fields"; "Exactly one call-to-action, unmissable"; "Brand personality must survive a chrome-less page"; "Form must sit in a narrow readable column".
- **Data model sketch**: User(username, emailAddress, password) — 1 entity, 3 fields, no relations visible.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ BILLBOARD h≈450 overlay=none content=full-bleed photo (colored pencils, radial)
└─ COLUMNS [1:2:1] (form in center column)
   └─ FORM
      ├─ SECTION "Create an Account" (accent-colored title)
      ├─ 3× labeled TEXT fields, stacked
      └─ BUTTON "SIGN UP" (SOLID, LARGE, MINIMIZE width, left-aligned)
```
- **Above the fold**: hero + title + all three fields + button (whole page ≈ one viewport).
- **Reading order**: single-column
- **Hierarchy rationale**: hero brands first (biggest zone); accent-blue title names the task; LARGE solid button is the only saturated block in the form zone — matches task #1 having no competitors.
- **Density**: 1 — one idea per screen, ~5 elements below hero, massive side whitespace.
- **Ratios & spacing**: center column ≈ 1/3 page width; field gaps ≈ marginBelow "STANDARD"; hero-to-title gap generous ("MORE").

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; hero = multicolor photo (purples #5b4ea0, teal #2e8f8a, yellow #e8b71c, magenta #b3255e, all est.); accent #2e6da3 (est.) on title and button; labels/text #333333 (est.); field borders #cccccc (est.).
- **Color application points**: page title (accent), single button fill (accent), field borders (neutral) — nothing else colored; the photo carries all remaining color.
- **Typography moves**: title ≈ LARGE_PLUS in accent blue (not black); field labels STANDARD bold #333; button label uppercase, LARGE.
- **Imagery stance**: photographic full-bleed hero, no overlay text.
- **Card treatment**: none — flat page, no cards/borders.
- **Signature moves**: instead of default STANDARD button, LARGE size via `size:"LARGE"`; instead of black H1, title tinted with accent color echoing the button; instead of fill-width submit, MINIMIZE width aligned to the field column's left edge; instead of decorative sidebar, edge-to-edge `a!billboardLayout`-style photo.

### Component inventory (OBSERVED)
- `a!billboardLayout` (or full-width image) h≈450px; `a!columnsLayout` with narrow center; `a!textField` ×3 (labelPosition "ABOVE"); `a!buttonWidget(label:"SIGN UP", style:"SOLID", size:"LARGE", width: minimize-default)`.
- Chart types: none. Interactive affordances: 3 inputs + 1 button; no nav, no links visible.

### Character & judgment
- **Register**: energetic-consumer — colorful playful photo + single-action simplicity.
- **Why it works**: lone LARGE solid button = zero action ambiguity; title/button share one hue, wiring "Create an Account" to "SIGN UP"; 3 fields keep perceived effort trivial.
- **Why not boring**: radial pencil photo instead of stock abstract banner; accent-colored heading; oversized uppercase CTA; airy 1/3-width column instead of full-width form.
- **Boring twin**: white page, black "Register" H1 at top-left, three full-width fields, standard-size blue SUBMIT right-aligned in a gray footer bar — functional, forgettable, no brand signal.
- **What to steal**: use `size:"LARGE"` when a page has exactly one action; tint the page title with the accent color; cap public sign-up forms at 3 fields.
- **Risks**: hero pushes fields near the fold on short viewports; photo has no overlay so no contrast issue; white-on-#2e6da3 ≈ 4.9:1 passes AA; password field shows no requirements hint.

### Code cross-check
- none — no SAIL source on page.

## button_widths.png

### Principle: One width value per button group
- **DO shows**: none (DON'T-only strip; the two legal values are shown misused together).
- **DON'T shows**: one row, faint column split: `MINIMIZE` outline button hugging its text at far left; `FILL` outline button stretched across its whole (wider) column at right. Same style/color (#2e6da3 (est.)) but wildly different footprints — the row looks accidental, and FILL reads as more important purely by area. OBSERVED.
- **Rule**: never mix MINIMIZE and FILL widths within one button group/row.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: give every `a!buttonWidget` in a group the same `width` (default MINIMIZE on desktop; FILL only for stacked/responsive sets).
- **Marker**: dont

## minimizeButtonWidth.gif

### Interaction: Minimize-width term picker (gif: minimizeButtonWidth.gif)
- **State chart** (frames f0/f6/f12/f18/f24): (1) f0 phone-frame student-GPA screen: "Overall GPA" KPI 3.85 in green #3f8f29 (est.) with graduation-cap icon; row of four MINIMIZE-width buttons `1ST`(solid #2e6da3 (est.), selected) `2ND` `3RD` `4TH` (outline); value card "3.75 −0.22" (delta red #c0392b (est.)); "Yearly Average" list 2017–2020 on gray #efefef (est.) rows → (2–5) cursor sweeps left→right clicking each term (f6/f12/f18/f24 are delta frames; hover ring then solid state moves to 2ND…4TH) and the term-GPA value refreshes. OBSERVED.
- **SAIL mechanism**: selected-card state — buttons `saveInto` a local term var; style flips OUTLINE↔SOLID via conditional, value re-renders.
- **UX purpose**: orientation + feedback — minimize width lets four short-label buttons form a compact segmented filter on mobile.
- **Replicate when**: short-label single-choice filters | **Cost**: low — one local variable + conditional style.
- **Marker**: do

## buttonWidthFill.png + buttonWidthMinimizeDont.png

### Principle: Stacked button lists get FILL width
- **DO shows** (buttonWidthFill.png): left sidebar of six stacked outline buttons (`ADD LOG` … `ADD NEW LOG GROUP`, blue #2e6da3 (est.)) at FILL width — one uniform column edge, centered labels — beside a "New Log" form (Date, Log textarea). Reads as one tidy action menu. OBSERVED.
- **DON'T shows** (buttonWidthMinimizeDont.png): same sidebar with MINIMIZE width — six ragged widths (short `ADD LOG` vs long `ADD NEW LOG FOLDER`), left-aligned jagged edge that looks accidental and makes targets unequal. OBSERVED.
- **Rule**: vertically stacked buttons with differing label lengths must share FILL width.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `width:"FILL"` on each stacked `a!buttonWidget`; for record actions, prefer `a!recordActionField(style:"SIDEBAR")` which does this automatically.
- **Marker**: do/dont pair

## loading_indicator_example.gif

### Interaction: Button loading indicator (gif: loading_indicator_example.gif)
- **State chart** (frames f0/f7/f14/f21/f27): (1) f0: "Email" textbox pre-filled `dorothy.vaughan@test.com`, solid `REGISTER` button #2e6da3 (est.), cursor over it → (2) click: label swaps to a white circular spinner on a paled/disabled blue fill (f7, delta frame) → (3–4) spinner rotates (f14/f21) while the button stays non-clickable → (5) f27 blank: form replaced — INFERRED submission finished and UI advanced. OBSERVED.
- **SAIL mechanism**: `a!buttonWidget(loadingIndicator: true)` — built-in busy state during `saveInto`/integration round-trip.
- **UX purpose**: feedback — signals in-flight work so users don't double-click or refresh.
- **Replicate when**: any button firing integrations, large writes, or slow queries | **Cost**: trivial — one boolean param.
- **Marker**: do

## buttons_location_do.png + button_location.png

### Principle: Footer = leave/submit only; content actions stay inline
- **DO shows** (buttons_location_do.png): "Create New Survey" — survey-question grid ("What is your age?" / Text) with inline SECONDARY `PREVIEW FORM` (gray #6d6d6d (est.)) inside the body; footer holds only `CANCEL` (outline) left and `CLOSE` (solid #2e6da3 (est.)) right — both exit the form. OBSERVED.
- **DON'T shows** (button_location.png): footer row crams `SUBMIT` (solid) + `ADD ITEM` + `ADD NOTE` + `CANCEL` together — content-editing actions sit where only submit/navigation belongs, so users risk clicking SUBMIT while aiming to add; CANCEL also strays to the far right. OBSERVED.
- **Rule**: form-footer button group is reserved for whole-form submit/exit; part-of-content actions go inline next to that content.
- **Severity**: always
- **Category**: forms | layout
- **SAIL implication**: `a!formLayout(buttons:…)` gets only submit/cancel `a!buttonWidget`s; content actions live in `a!buttonArrayLayout` (SECONDARY, often SMALL) within the body.
- **Marker**: do/dont pair

## button_position.png

### Principle: Submit right (most-common first), back/cancel left
- **DO shows**: footer split into two groups: left `GO BACK` then `CANCEL` (outline #2e6da3 (est.), back left-most); right `SAVE & PUBLISH` (SOLID, first/left-most of its group) then `SAVE DRAFT` (outline). Primary action is both solid and first where the eye lands in the submission group. OBSERVED.
- **DON'T shows**: none pictured — INFERRED: cancel mixed into the right group or primary last would scramble scanning order.
- **Rule**: submission buttons right-aligned with the most-used first (solid); back/cancel left-aligned, back outermost.
- **Severity**: usually
- **Category**: forms | layout
- **SAIL implication**: `a!formLayout` `buttons: a!buttonLayout(primaryButtons: …, secondaryButtons: …)` — primary list renders right, secondary left.
- **Marker**: do

## button_availability.png

### Principle: Disable, don't hide, temporarily unavailable buttons
- **DO shows**: HR review grid toolbar — `INITIATE ANNUAL REVIEW` and `VIEW INTERIM REVIEWS` enabled (SECONDARY small outline, gray #6d6d6d (est.)); `REQUEST 360 FEEDBACK` rendered disabled (text ≈ #b9b9b9, fill #f5f5f5, both est.) because the current selection (1 row checked of "1 – 5 of 20") doesn't qualify. The option stays discoverable at a stable position instead of vanishing. OBSERVED.
- **DON'T shows**: none pictured — INFERRED: hiding it would make the layout jump and the feature undiscoverable. (Page caveat: with many state-dependent buttons, hide instead to cut clutter.)
- **Rule**: state-dependent buttons default to `disabled: true`, not `showWhen: false`, unless many toggle at once.
- **Severity**: contextual
- **Category**: forms | data-display
- **SAIL implication**: `a!buttonWidget(disabled: not(<selection test>))` on grid-toolbar actions.
- **Marker**: do

## relatedActionsShortcuts_dont.png

### Principle: Keep related-action titles short enough for shortcut buttons
- **DO shows**: none (DON'T-only; DO = concise titles, ≤3 shortcuts).
- **DON'T shows**: record view "James Porter" (breadcrumb `Records / Appian Corporate Directory`, solid-blue `Summary` tab #2e6da3 (est.), gray-scale billboard hero with circular avatar). Top-right shortcut buttons truncate mid-word: `UPDATE MY PERSONAL INFORMA...` / `UPLOAD OR DELETE MY PICTURES...` (outline blue; red dashed ring = doc annotation, not UI). Verbose titles turn primary record actions into unreadable ellipses. OBSERVED.
- **Rule**: related-action titles must be short verb phrases; put elaboration in description text, and expose ≤3 shortcuts.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: terse record-action `title`s (e.g. "Update Info"); details via `description`; limit shortcuts on the record view header.
- **Marker**: dont

## Component: Button — variant crops (page: ux-buttons) [tier B rollup]
Official variant vocabulary: style OUTLINE (default) / SOLID / GHOST / LINK · color ACCENT (default) / NEGATIVE / SECONDARY · size SMALL / STANDARD (default) / LARGE · width MINIMIZE (desktop default) / FILL (mobile default) · shape Squared (default) / Semi-rounded / Rounded · uppercase labels (default) vs per-button capitalization.

### ux_button_colors.png
- **Produces it**: `a!buttonWidget(color: "ACCENT"|"NEGATIVE"|"SECONDARY")` × `style: "OUTLINE"|"SOLID"`
- **Looks like**: 2×3 matrix — outline row over solid row for the three colors.
- **Use when**: picking semantic color | **Avoid when**: >1 custom color per interface.
- **Styling hooks**: `color`, `style`.
- **Pairs well with**: SECONDARY+OUTLINE/LINK for subdued actions.
- **Hexes**: accent #2e6da3 (est.); negative #d03a4b (est.); secondary gray text #5b5b5b on #ececec solid fill, border #cfcfcf (all est.).
- **Marker**: neutral

### buttons_size.png
- **Produces it**: `a!buttonWidget(size: "SMALL"|"STANDARD"|"LARGE")`
- **Looks like**: three outline accent buttons stepping up in padding and label size (SMALL ≈ STANDARD text, LARGE ≈ MEDIUM).
- **Use when**: STANDARD by default | **Avoid when**: mixing sizes in one group; mobile renders one size only.
- **Styling hooks**: `size`.
- **Pairs well with**: SMALL→toolbars, LARGE→lone page CTA.
- **Marker**: neutral

### small_button.png
- **Produces it**: `a!buttonWidget(size:"SMALL", color:"SECONDARY")` beside `a!textField` in `a!sideBySideLayout`
- **Looks like**: "Search contacts" placeholder box + gray `SEARCH` button at exactly textbox height.
- **Use when**: button must match input height inline | **Avoid when**: form submission.
- **Styling hooks**: `size`, `color`.
- **Pairs well with**: search fields, columns layouts.
- **Marker**: neutral

### branding-preview-icon.svg
- **Produces it**: designer chrome, not SAIL — the Branding preview menu icon in the interface editor toolbar.
- **Looks like**: CODE-VERIFIED from SVG source: 14×14 single-path painter's palette (4 paint dots + thumb hole), `fill: #222222`.
- **Use when**: previewing site/portal shape+capitalization branding while editing | **Avoid when**: n/a.
- **Styling hooks**: none.
- **Pairs well with**: shape/capitalization variants below.
- **Marker**: neutral

### button_squared.png
- **Produces it**: site/portal Branding "Squared" shape (default); no per-button param.
- **Looks like**: solid button, 0px corner radius, white uppercase label on saturated indigo #2a22ee (est.) — a branded accent, proving shape crops inherit site accent color.
- **Use when**: dense enterprise/institutional feel | **Avoid when**: brand wants softness.
- **Styling hooks**: Branding > button shape only.
- **Marker**: neutral

### button_semi_rounded.png
- **Produces it**: Branding "Semi-rounded" shape.
- **Looks like**: same indigo solid with ≈6–8px radius — softened but still rectangular.
- **Use when**: middle ground between corporate and friendly | **Avoid when**: n/a.
- **Styling hooks**: Branding > button shape (site/portal-wide).
- **Marker**: neutral

### button_rounded.png
- **Produces it**: Branding "Rounded" shape.
- **Looks like**: full pill (radius = half height), same indigo; label appears to float without a box edge.
- **Use when**: consumer-facing warmth | **Avoid when**: labels are long — pill ends eat horizontal space.
- **Styling hooks**: Branding > button shape.
- **Marker**: neutral

### button_capitalization.png
- **Produces it**: Branding "Use uppercase capitalization for button labels" off → per-button label casing.
- **Looks like**: stacked indigo solids: `BUTTON` (uppercase default) vs `Button` (mixed case) on pale gray #f5f5f7 (est.).
- **Use when**: brand voice needs sentence case — then keep casing consistent everywhere | **Avoid when**: mixing casings across one site.
- **Styling hooks**: Branding toggle + button `label` casing.
- **Marker**: neutral

### Page rollup
Default choice for most cases is `a!buttonWidget(style:"OUTLINE", color: accent, size:"STANDARD", width: minimize)` with squared shape and uppercase labels, because the page frames every other variant as a deliberate escalation (SOLID/LARGE for the one primary action), demotion (SECONDARY, LINK), or semantic signal (NEGATIVE = persisted-data loss), and shape/capitalization belong to site branding, not individual interfaces.
