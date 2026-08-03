# Inputs (a!textField, a!radioButtonField, a!checkboxField, a!dropdownField, pickers, a!fileUploadField)

Field-level entry controls for forms. Reach for structured choices (radios/checkboxes/cards/dropdown)
before free text; reach for [form-layout.md](form-layout.md) for the page scaffold and
[grids.md](grids.md) for editable-grid entry. Not for display-only values — see the
data-value-display pattern.

## Variants

**Choice control by option count** (corpus decision ladder):
- ≤5 options, single-select → `a!radioButtonField`; multi-select → `a!checkboxField`.
- Prominent choices needing big tap targets → `choiceStyle: "CARDS"` (either field). Cards come with
  selection state (accent border + corner check) free. Avoid >5 card choices.
- Moderately long browseable list → `a!dropdownField` / `a!multipleDropdownField`, logically sorted.
- Unbrowseably long or entity-typed → pickers (`a!pickerFieldUsers`, records pickers).
- Typed scalar entry → `a!textField` (text), `a!integerField` / `a!floatingPointField` (numbers),
  `a!dateField` / `a!dateTimeField` (dates), `a!paragraphField` (long text) — all standard SAIL inputs
  sharing the label/placeholder/instructions/validation hooks below.

**Choice layout/position** (official vocabulary):
- `choiceLayout: "STACKED"` (default choice) vs `"COMPACT"` — Compact ONLY for 1-word labels
  (Yes/No/Maybe) that cannot wrap.
- `choicePosition: "START"` (default) vs `"END"` — End ONLY inside width-constrained containers
  (filter panes, narrow columns). Never in full-width forms.
- Cards + long wrapping labels → override to `choicePosition: "START"` so control and reading origin coincide.

**Input shape** (site/portal branding config, not per-field): Squared vs Semi-rounded applies to every
input on the site — see [styling-mechanics](../styling/styling-mechanics.md).

## Styling hooks

- `label` — always set; `labelPosition: "ABOVE"` default, `"ADJACENT"` for wide settings panels,
  `"COLLAPSED"` only when context labels the field (then set `accessibilityText`).
- `placeholder` — format hints only ("The 10 digit number on your invoice"), never a label substitute
  (placeholders vanish on entry). Pickers: short sentence-case verb phrase ("Select an employee").
  File upload: name the expected doc + format ("Drop resume here (pdf)").
- `helpTooltip` — one-time guidance for new users; use `instructions` for always-needed info instead.
- `characterLimit` + `showCharacterCount: false` when limits are generous (names, addresses) —
  validation still fires at the cap; show the counter only when users will plausibly hit it.
- `align: "LEFT"` (default) — keep it; right-aligned values break the label→value scan line in LTR.
- `a!paragraphField(height: "SHORT")` inside editable grids so row heights align.
- Read-only display of entered data: prefer rich-text label/value pairs over disabled inputs.

## Idioms

**Card choices with uniform fields** (ins-quote-wizard-1, kanban add-task form):
```
a!radioButtonField(
  choiceStyle: "CARDS",
  choiceLabels: { "Auto", "Home", "Business" },   /* every card: same field set */
  /* icon + primaryText + secondaryText populated for ALL choices, or none */
)
```

**Filter-pane compact choices** (End position earns its keep only here):
```
a!paneLayout( panes: { a!pane( width: "MEDIUM", contents: {
  a!checkboxField(label: "Status", choicePosition: "END", choiceLayout: "STACKED", ...)
}), ... })
```

**Segmented control alternative**: for 2–4 mode switches (not data entry), the corpus uses
`a!tagField` + `a!dynamicLink` with conditional accent fill instead of radios — see
[sail/cookbook.md](../sail/cookbook.md) and the restaurant-order case study.

## Top don't

**Never use placeholder text as the field label** (severity: always). The hint disappears the moment
the user types, clearing behavior varies by device, and screen readers may skip it — users mid-form
forget what the field was. `label:` names the field; `placeholder:` hints at format.
