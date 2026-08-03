# Form Layout (a!formLayout)

Top-level layout for structured data collection: title bar + contents + button footer, with built-in button placement, fixed-on-scroll behavior, first-input focus, and form-level validations. Cannot nest inside other layouts. NOT when sections are sequential steps (wizard layout), independent any-order sections (tab layout inside a form), all-visible-at-once sections (section layouts inside a form), or 2–3 independently scrolling columns (pane layout inside a form).

## Variants (Title Bar Template)
- **Full** (a!headerTemplateFull) — solid brand band, white icon/title/secondary. Default: "generally looks good on all kinds of forms"; corpus reuses the header hue as the SUBMIT hue.
- **Simple** (a!headerTemplateSimple) — white bar, icon + title + secondary; least chrome, most field room. For data-heavy forms, especially dialogs; add an icon so the header stands out; show the title bar divider under long secondary text.
- **Image** (a!headerTemplateImage) — taller illustrated band; billboard feel. For customer-facing/portal forms. Image size also scales the title type; choose the smaller size in dialogs; the image auto-hides on narrow screens, so never put content in it.
- **Sidebar** (a!headerTemplateSidebar) — full-height colored side column for persistent supporting content (checklist, SLAs, contacts). Dialogs of Medium width or smaller collapse it to a header.

## Styling hooks
- **contentsWidth**: "FULL" · "WIDE" · "MEDIUM" · "NARROW" · "EXTRA_NARROW". Standalone single-column forms: Narrow-ish, so field length ≈ expected answer length; record-action dialogs: "FULL" and let the record type's Dialog Box Size control width.
- **Form Background Color**: "White" (default) · "Transparent" (standard site/portal light gray shows through — use whenever contents are mostly cards/boxes so white surfaces pop) · "Charcoal Scheme" / "Navy Scheme" / "Plum Scheme" (dark; apply to ALL site pages or none) · custom hex, with two trailing digits 00–FF for transparency; keep contents/background contrast accessible.
- **Buttons** (a!buttonLayout): primary = Solid, right; secondary = Outline, left; stacked on narrow widths with primary on top; with multiple buttons, list order = prominence (first primary most prominent/leftmost, first secondary least). Never hand-arrange — every custom arrangement in the corpus is a DON'T.
- **Dividers + fixing**: title bar divider; button divider; fix title bar and buttons in scrolling dialogs (record-action dialogs auto-fix them by default).
- **validations** for cross-field rules; **Automatically focus on first input** for entry forms.

## Structure rules
- One narrow column: users scroll happily but scan poorly across columns; a!sideBySideLayout only for semantically paired fields (First/Last Name; City/State/Zip), never for whole sections.
- Constrain each input to its answer length (corpus DOB = three mini boxes dd|mm|yyyy; short ZIP beside full-width Address).
- Group with cards + headings: icon-chip section headers over white a!cardLayout groups on a tinted page (forms-checklist example).
- Match the title verb in the submit button ("Open a New Case" → OPEN CASE); always include CANCEL; add a save-progress button for long forms.

## Idioms
1. **Either-or validation** (form_layout_validation_message): don't mark both fields Required. A gray "--or--" line between Phone and Email + validations: "Enter either a phone number or an email address to continue" — the banner renders full contents width directly above the blocked NEXT button, phrased as the fix.
2. **Dense record-action dialog** (simple-header-example): simple header with a violet icon chip, ~10 fields in one column inside a bordered box, fixed CANCEL/CREATE footer with divider; only Start Date | End Date pair up side-by-side.
3. **Sidebar as decision support** (sidebar-template-example): saturated yellow #f6b60d (est.) sidebar holds SLA copy permanently beside the Priority radio-cards it explains; dark-on-yellow text for contrast; one violet accent shared by selection state and OPEN CASE.

## Top don't
Adding empty columns to center form content (always): contentsWidth already centers the contents AND the button row together; empty flanking a!columnLayout children break that contract, so CANCEL/SUBMIT land far outside the field block's edges — a visibly misaligned footer.
