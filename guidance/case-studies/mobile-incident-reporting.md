# Mobile Incident Reporting

**Pattern**: [patterns/forms.md](../patterns/forms.md) — mobile-first variant: a three-screen `choose()` micro-wizard (identify → confirm asset → request form) instead of one scrolling form.

## Scenario
- **Persona**: shopping-centre facilities staff / attending technician; occasional cadence — used one-handed at the machine, at the moment equipment fails (INFERRED).
- **Domain**: escalator/elevator OEM ("Möller") field service; monochrome-green engineering brand with consumer-app simplicity — no nav, no menus, no visible auth.
- **Tasks**: 1. Identify the asset via the 7-letter plaque code (QR affordance implied). 2. File a service request (type + description + photos). 3. Review service history before requesting.

## Data model
Equipment(code "ABCDEFG", model "Model 7100-Max Escalator", unit "3/F – 4/F Southwest", site "Appian Way Shopping Centre", address "Leeds LS2 7AU, UK", inServiceSince 2019-03-24) 1—n ServiceRequest(serviceType ∈ {Inspection, Repair}, problemDescription, photos[]); 1—n service-history entries.

## Skeleton
```
S1 HEADER-CONTENT bg=#e4f1df (full-bleed brand screen)
├─ CARD(logo SMALL start, style=#e4f1df, padding=MORE, no border)   ← header slot
├─ qrcode icon EXTRA_LARGE + sample code, centered, #b6d7a8
├─ instruction rich text MEDIUM centered
├─ COLUMNS [AUTO:NARROW_PLUS:AUTO] └─ FORM(text field, label COLLAPSED)
└─ COLUMNS [AUTO:NARROW_PLUS:AUTO] └─ "Go" SOLID LARGE FILL icon=arrow-right
S2 HEADER-CONTENT (white body)
├─ CARD(logo SMALL + product image MEDIUM center, style=#e4f1df)
├─ SBS(stamp TINY #127d21 + text MEDIUM) ×3 [tag=model | map-marker=address ×4 lines | calendar=in-service]
└─ SECTION divider=ABOVE └─ stacked LARGE FILL buttons: OUTLINE + SOLID
S3 HEADER-CONTENT (white body)
├─ CARD(logo SMALL + "Request Service" LARGE STRONG + model STANDARD, style=#e4f1df)
├─ FORM: cardChoiceField(barTextJustified ×2, icons) → paragraph h=MEDIUM → fileUpload
└─ SECTION divider=ABOVE └─ SBS(Cancel OUTLINE start | Submit Request SOLID end)
```
Density 1–2; each screen fits one phone viewport — the flow is designed foldless.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| brand surface | #e4f1df | header-slot cards on all 3 screens; entire S1 background |
| watermark | #b6d7a8 | EXTRA_LARGE qrcode icon + sample code text (decorative — ~1.6:1 on #e4f1df) |
| stamp green | #127d21 | TINY metadata stamp backgrounds (tag / map-marker / calendar) |
| action green | ≈#397a2f (est.) | SOLID buttons, outline borders, selected-card border — theme-supplied; no button color exists in code |
| canvas | #f3f3f3 (est.) | preview composite only, not SAIL |

Single-hue UI — no semantic reds/yellows anywhere. Buttons render all-caps (widget default); no display-size numerals: a doing UI, not a reading UI.

## Signature moves
1. Instead of a site header bar → a flat borderless `a!cardLayout(style: "#e4f1df", padding: "MORE", showBorder: false, marginBelow: "NONE")` in the header slot serves as the logo bar on all three screens.
2. Instead of a white first screen → `backgroundColor: "#e4f1df"` on S1's headerContentLayout makes a full-bleed native-splash brand screen; S2/S3 revert to white "work" surfaces.
3. Instead of a wizard framework → `choose(local!stepNumber, ...)` with buttons doing `value: n, saveInto: local!stepNumber` steps the whole flow inside one expression.
4. Instead of default blue → one hue at three strengths: #e4f1df surface → #b6d7a8 watermark → deep theme green on actions.
5. Instead of label:value pairs → TINY `a!stampField` icons (#127d21) in sideBySideLayouts form icon-keyed metadata rows.
6. Instead of radio buttons → `a!cardChoiceField` + `a!cardTemplateBarTextJustified` gives big illustrated, glove-friendly tap targets (selected = border + corner checkmark).

## Boring twin (what a lazy build would do — avoid this)
A white page titled "Report Incident" with an equipment-ID dropdown, stacked labeled fields, a default-blue Submit bottom-left, no imagery, and no asset-confirmation step. The S2 photo-confirm screen is the wrong-asset-dispatch safeguard — don't cut it.

## Annotated SAIL excerpts
Source: guidance/sail/sources/mobile-incident-reporting.sail (line refs below).

**Micro-wizard driver (L3–6 + L91–99)** — the whole 3-screen flow is `choose()` over one local; any button jumps steps via `value`/`saveInto`. No process model, no wizard layout.
```
a!localVariables(
  local!stepNumber: 1,
  choose(
    local!stepNumber,
    ...
    a!buttonWidget(
      label: "Go",
      icon: "arrow-right",
      size: "LARGE",
      width: "FILL",
      style: "SOLID",
      value: 2,
      saveInto: local!stepNumber
    )
```

**Empty-column centering (L64–83)** — flanking empty columns center a NARROW_PLUS field; `stackWhen: {"NEVER"}` keeps it centered on phones (risk: pinches on very narrow screens).
```
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),
    a!columnLayout(
      contents: { a!textField(labelPosition: "COLLAPSED", saveInto: {}) },
      width: "NARROW_PLUS"
    ),
    a!columnLayout(contents: {})
  },
  marginBelow: "MORE",
  stackWhen: { "NEVER" }
)
```

**Stamp metadata row with multi-line value (L180–219)** — icon-keyed rows replace field labels; the 4-line address breaks via char(10) with a STRONG first line; `alignVertical: "TOP"` hangs the stamp at line one.
```
a!sideBySideLayout(
  items: {
    a!sideBySideItem(
      item: a!stampField(
        labelPosition: "COLLAPSED", icon: "map-marker",
        backgroundColor: "#127d21", contentColor: "STANDARD", size: "TINY"
      ),
      width: "MINIMIZE"
    ),
    a!sideBySideItem(
      item: a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextItem(text: { "3/F – 4/F Southwest" }, size: "MEDIUM", style: { "STRONG" }),
          char(10),
          a!richTextItem(text: { "Appian Way Shopping Centre" }, size: "MEDIUM"),
          char(10),
          ...
        }
      )
    )
  },
  alignVertical: "TOP",
  marginAbove: "STANDARD",
  marginBelow: "LESS"
)
```

**Illustrated choice cards (L322–349)** — cardChoiceField with bar templates replaces radios; preselecting `value: 2` biases toward the common case (Repair).
```
a!cardChoiceField(
  label: "Service Type",
  data: {
    a!map(id: 1, icon: "stethoscope", primaryText: "Inspection",
      secondaryText: "Perform routine maintenance"),
    a!map(id: 2, icon: "wrench", primaryText: "Repair",
      secondaryText: "Fix a problem")
  },
  cardTemplate: a!cardTemplateBarTextJustified(
    id: fv!data.id, primaryText: fv!data.primaryText,
    secondaryText: fv!data.secondaryText, icon: fv!data.icon
  ),
  value: 2, saveInto: {}, maxSelections: 1, required: true
)
```

**Footer-action section (L366–406)** — a label-less sectionLayout with `divider: "ABOVE"` + `marginAbove: "MORE"` fakes a form footer; Cancel starts, Submit ends via two buttonArrayLayouts in one sideBySideLayout (same device used at L248–275 for S2's stacked FILL buttons).
```
a!sectionLayout(
  label: "",
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(item: a!buttonArrayLayout(
          buttons: { a!buttonWidget(label: "Cancel", size: "LARGE",
            width: "MINIMIZE", style: "OUTLINE") },
          align: "START")),
        a!sideBySideItem(item: a!buttonArrayLayout(
          buttons: { a!buttonWidget(label: "Submit Request", size: "LARGE",
            width: "MINIMIZE", style: "SOLID") },
          align: "END"))
      }
    )
  },
  divider: "ABOVE",
  marginAbove: "MORE"
)
```

## Skeleton SAIL
```
a!localVariables(
  local!stepNumber: 1,
  choose(
    local!stepNumber,
    /* ═ STEP 1 — identify asset (full-bleed brand screen) ═ */
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!imageField(labelPosition: "COLLAPSED",
              images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE()) },
              size: "SMALL", align: "START")
          },
          height: "AUTO", style: "#e4f1df", padding: "MORE",
          marginBelow: "NONE", showBorder: false
        )
      },
      contents: {
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: {
            a!richTextIcon(icon: "qrcode", color: "#b6d7a8", size: "EXTRA_LARGE"),
            char(10),
            a!richTextItem(text: { "ABCDEFG" }, color: "#b6d7a8", size: "STANDARD")
          },
          align: "CENTER", marginAbove: "MORE", marginBelow: "MORE"
        ),
        a!richTextDisplayField( /* instruction line, size MEDIUM, align CENTER */ ),
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: { a!textField(labelPosition: "COLLAPSED", saveInto: {}) },
              width: "NARROW_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          marginBelow: "MORE", stackWhen: { "NEVER" }
        ),
        /* identical empty|NARROW_PLUS|empty columns wrapper around: */
        a!buttonArrayLayout(buttons: {
          a!buttonWidget(label: "Go", icon: "arrow-right", size: "LARGE",
            width: "FILL", style: "SOLID", value: 2, saveInto: local!stepNumber)
        })
      },
      backgroundColor: "#e4f1df"
    ),
    /* ═ STEP 2 — confirm asset ═ */
    a!headerContentLayout(
      header: { /* same tinted card, plus product image MEDIUM, align CENTER */ },
      contents: {
        a!sideBySideLayout(
          items: {
            a!sideBySideItem(
              item: a!stampField(labelPosition: "COLLAPSED", icon: "tag",
                backgroundColor: "#127d21", contentColor: "STANDARD", size: "TINY"),
              width: "MINIMIZE"
            ),
            a!sideBySideItem(item: a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: { a!richTextItem(text: { "Model 7100-Max Escalator" }, size: "MEDIUM") }
            ))
          },
          alignVertical: "MIDDLE", marginAbove: "STANDARD", marginBelow: "LESS"
        ),
        /* ×2 more stamp rows, same shape: map-marker → 4-line address
           (first line STRONG, char(10) breaks, alignVertical "TOP");
           calendar → "In service since 24 Mar 2019" (marginAbove "EVEN_LESS") */
        a!sectionLayout(
          label: "",
          contents: {
            a!buttonArrayLayout(buttons: {
              a!buttonWidget(label: "View Service History", size: "LARGE",
                width: "FILL", style: "OUTLINE"),
              a!buttonWidget(label: "Request Service", size: "LARGE",
                width: "FILL", style: "SOLID", value: 3, saveInto: local!stepNumber)
            })
          },
          divider: "ABOVE", marginAbove: "MORE"
        )
      }
    ),
    /* ═ STEP 3 — request form ═ */
    a!headerContentLayout(
      header: {
        /* tinted card again: logo SMALL + "Request Service" LARGE STRONG
           + "Model 7100-Max Escalator" STANDARD — form keeps asset context */
      },
      contents: {
        a!cardChoiceField( /* 2 bar cards, value: 2 — see excerpt above */ ),
        a!paragraphField(label: "Problem Description",
          instructions: "Please include any diagnostic trouble codes",
          height: "MEDIUM", required: true, saveInto: {}),
        a!fileUploadField(label: "Photos", saveInto: {}),
        a!sectionLayout( /* footer: Cancel OUTLINE start | Submit SOLID end,
          divider: "ABOVE", marginAbove: "MORE" — see excerpt above */ )
      }
    )
  )
)
```

## Full source
`sail/sources/mobile-incident-reporting.sail` — load only if emulating this page end-to-end.
