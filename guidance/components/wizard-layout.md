# Wizard Layout (a!wizardLayout / a!wizardStep)

Top-level layout that organizes a long form into sequential steps, with a generated title bar, milestone, and Next/Back/Cancel footer — it cannot be nested in other layouts. Use a plain [Form Layout](form-layout.md) for simple forms, [Tab Layout](tab-layout.md) inside a form when sections are order-independent, stacked [Section Layout](section-layout.md)s when everything should be visible at once.

## Variants

`style` (milestone) — 7 values: "DOT_VERTICAL" (default), "DOT_HORIZONTAL", "CHEVRON_VERTICAL", "CHEVRON_HORIZONTAL", "LINE_VERTICAL", "LINE_HORIZONTAL", "MINIMAL" (spellings per corpus analyses; page names them in prose and quotes `"MINIMAL"`).

- **Vertical styles** — rail left of contents (~1/4 width): use for >5 steps or long labels; balances whitespace beside narrower contents widths.
- **Horizontal styles** — bar above contents (~70px tall); chevrons encode direction; crowds beyond a few short labels.
- **"MINIMAL"** — no milestone, an auto "Step 2 of 3" counter instead: for 1–2-step wizards; small screens fall back to minimal automatically — pair it with step headings so context survives.
- Milestone state colors observed: current #2322f0 (est.), completed #5468f5 (est.), future #d8d8d8 (est.) — done/current/next reads at a glance with no checkmarks.

**Title bar template** — text, a header component (simple, full, image, or sidebar), or billboard/card layout(s): the wizard's one branding surface (demo bars: charcoal #3a3a3a (est.), government navy #101b2d (est.)); keep the step body neutral.

## Styling hooks

- `backgroundColor`: "White" (default — right inside record-action dialogs), "Transparent" (standard site light-gray shows through — full pages), "Charcoal"/"Navy"/"Plum" schemes, or hex.
- **Step Contents Width**: "Full" / "Wide" / "Medium" / "Narrow" / "Extra Narrow" — governs line length of the step column only. In dialogs always "Full", and control width via the dialog size; avoid "Auto" dialog height (step heights differ → jumpy).
- `a!wizardStep(label, instructions, contents, validations, validationGroup, showWhen)` + Disable Next Button. One `label` string renders in both the milestone and the step heading — keep it a 2–3-word noun phrase. `instructions` renders as muted gray #6c6c6c (est.) under the heading: put per-step guidance there, never as ad-hoc rich text in `contents`.
- Scrolling steps: `isTitleBarFixed` + fixed buttons, with `showButtonDivider: true` fencing the footer (hairline #e3e3e3 est.).
- Buttons: custom `primaryButtons` render left of the non-configurable NEXT; `secondaryButtons` sit beside BACK; Cancel is auto-added. All customs at size "STANDARD"; solid accent style is reserved for Next and last-step Submit only; make sure the width fits every button on one row.

## Idioms

1. Canonical dialog wizard (anatomy figure + quote demo):
```
WIZARD bg #ffffff
├─ TITLE-BAR dark template "Request a Quote" + subtitle
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE dot-vertical ×3 (About You active)
│  └─ STEP: heading ≈LARGE + gray instructions + FORM (columns-chunked)
└─ FOOTER: divider · CANCEL(link) | NEXT(solid accent)
```
2. Guidance beside a risky input (birth-certificate DO): required `a!fileUploadField` + a tinted #eef1f8 (est.) card listing acceptable documents with an info icon — upload rejections prevented in-step; required asterisks in brand accent, not alarm red.
3. Field chunking inside a step (quote demo): `a!columnsLayout` rows — [1:1] First/Last, [1:1:1] City/State/Zip — instead of a monotone full-width stack; the 2-col/3-col rhythm mirrors how people chunk an address.

## Top don't

Section headings inside a step must be at least one size-ladder step smaller and quieter than the step heading (`a!sectionLayout(labelSize: "SMALL"/"MEDIUM", labelColor: "SECONDARY")`). The DON'T sets Name/Contact/Address larger than the heading in accent bold: hierarchy inverts, the step reads as three separate forms, and the real title recedes. Runner-up (usually): never pair a vertical tab pattern in step contents with a vertical milestone — two adjacent rails with competing selection states; switch the milestone to horizontal or minimal.
