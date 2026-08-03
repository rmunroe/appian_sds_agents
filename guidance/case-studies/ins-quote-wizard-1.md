# Insurance Quote Wizard — Step Screen (INSURECORP funnel)

**Pattern**: [Forms](../patterns/forms.md) — wizard variant: one decision per full-page step, hand-built vertical stepper, single-expression step machinery. Final-step execution is covered in [ins-quote-wizard-2.md](ins-quote-wizard-2.md) (same source file).

## Scenario

- **Persona**: occasional-customer / first-time-public — anonymous consumer shopping an auto quote; zero training, high abandonment risk.
- **Domain**: direct-to-consumer P&C carrier "INSURECORP", Geico/Progressive-style acquisition funnel; bold plum/magenta brand.
- **Ranked tasks**: 1. Advance the wizard to reach a price. 2. Opt into bundle add-ons (carrier upsell). 3. See where they are and what's left.

## Data model

Quote{zipCode, stepNumber, bundleSelections[0..3]}; ProductLine{icon, primaryText, secondaryText} ×4 (Auto locked + Homeowners/Renters/Other Vehicles); later branches add Person{name, M.I., suffix, address, DOB}, Vehicle 1..n, Driver 1..n, Coverage options, final Quote{$113.50/mo, 3 discounts}. Steps: Bundled Savings → About You → Your Vehicles → Other Drivers → Coverage Options → Quote.

## Skeleton

Rendered branch: `local!stepNumber: 2` → step "Bundled Savings" (1 of 6); branch 1 is a pre-wizard ZIP landing.

```
HEADER-CONTENT bg=#333 contentsPadding=NONE (page in header slot; contents:{})
├─ CARD(brand bar, style=#73245d) → COLUMNS [AUTO:NARROW] logo | ENGLISH·Español, stackWhen=NEVER
├─ CARD(style=NONE, white work area)
│  ├─ COLUMNS [empty:NARROW_PLUS:WIDE:empty] margins=EVEN_MORE (LESS on PHONE)
│  │  ├─ WIZARD-STEP 1/6 vertical stepper, desktop-only:
│  │  │  TINY stamp+label rows alternating with connector-image rows, spacing=NONE
│  │  └─ FORM column:
│  │     ├─ "Save more with a bundled quote" LARGE
│  │     ├─ CARD-CHOICE(Auto, locked: maxSelections=1, saveInto={})
│  │     ├─ pitch MEDIUM ("25%" STRONG) + "What else…?" STRONG
│  │     ├─ CARD-CHOICE ×3 (Homeowners|Renters|Other Vehicles, maxSelections=3)
│  │     └─ SECTION divider=ABOVE → "NEXT: ABOUT YOU" SOLID LARGE align=END
│  └─ CARD(empty spacer h=SHORT_PLUS)
└─ CARD(footer legal, style=#333, h=TALL, padding=EVEN_MORE)
```

Density 2 — one decision on screen: 4 interactive cards + the 6-step rail per viewport, EVEN_MORE margins. Register: energetic-consumer + institutional. Everything above the fold, footer top included.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| brand bar | `#73245d` | top slab card (style param) |
| page base / footer | `#333` | headerContentLayout backgroundColor + footer card (h=TALL) |
| work area | white via `style: "NONE"` | stepper + form band, choice cards |
| accent | theme token `ACCENT` (≈#af2b9b est. render) | current-step stamp, selected card border + corner checkmark, card icons, SOLID CTA |
| future-step stamps | `#d9d9d9` fill / `#666666` glyph | steps 2–6 in the rail |
| landing branch only | `#efefef` hero, `#434343` headline, `#f8eff3` notice card, `#BF04A0` bar | branch 1 |
| savings green | `#38761d` | branch 4 discount rollup |
| vestigial | `#056CF2` | footer decorativeBarColor, position "NONE" — dead |

White-on-ACCENT ≈4.9:1 (est.) — near the AA edge for SMALL text; keep CTA text LARGE.

## Signature moves

1. Instead of a process model + N interfaces → the whole funnel is ONE expression: `choose(local!stepNumber, <branch per step>)` over four full-page `a!headerContentLayout`s; every nav button just writes a literal integer into `local!stepNumber`.
2. Instead of a milestone bar → a hand-built vertical stepper: TINY `a!stampField` circles and `a!imageField` connector images in EXTRA_NARROW columns with `spacing: "NONE"`; state = fill color + STRONG label; "(n of 6)" lives in `accessibilityText`.
3. Instead of the contents slot → page stacks in the header slot (`contents: {}`, `contentsPadding: "NONE"`, `backgroundColor: "#333"`) so the legal footer reads as a full-bleed slab; an empty `a!cardLayout(height: "SHORT_PLUS")` spaces above it.
4. Instead of one card template → `if(a!isPageWidth({"PHONE"}), …BarTextJustified, …BarTextStacked)` swaps the entire cardChoiceField per breakpoint.
5. Instead of a plain label for context → the already-chosen product is a locked choice card: `value: 1, saveInto: {}, maxSelections: 1` renders Auto permanently selected and inert.
6. Exactly one saturated element per screen → the SOLID LARGE next-step button, right-pinned in a `divider: "ABOVE"` section; language toggle and landing CTA stay OUTLINE/LINK.

## Boring twin (what a lazy build would do — avoid this)

A white `a!formLayout` titled "Step 1 of 6", a checkboxField of insurance types, disclaimer paragraph above gray Next/Back buttons bottom-left, brand color nowhere but the logo.

## Annotated SAIL excerpts

Source: [../sail/sources/ins-quote-wizard-1.sail](../sail/sources/ins-quote-wizard-1.sail) (2954 lines; branches at L8, 456, 1164, 1899).

**1. choose(local!stepNumber) step machinery (L1–7; nav CTAs at L127–133, 1054–1064, 1798–1808)**

```sail
a!localVariables(
  local!zipCode: null(),
  local!stepNumber: 2,          /* 1=landing · 2=step 1/6 · 3=step 2/6 · 4=step 6/6 */
  local!bundleSelections: {},
  local!showSaveForLater: false,
  choose(
    local!stepNumber,
    a!headerContentLayout( /* branch 1: ZIP-code landing page */ ),
    a!headerContentLayout( /* branch 2: "Bundled Savings" — this file */ ),
    a!headerContentLayout( /* branch 3: "About You" name/address/DOB form */ ),
    a!headerContentLayout( /* branch 4: "Quote" — see ins-quote-wizard-2.md */ )
  )
)

/* navigation = a button writing a literal branch index: */
a!buttonWidget(label: "Get Started", value: 2, saveInto: local!stepNumber,
  size: "STANDARD", style: "OUTLINE")                       /* landing */
a!buttonWidget(label: "Next: About You", value: 3, saveInto: local!stepNumber,
  size: "LARGE", style: "SOLID")                            /* step 1 → 2 */
a!buttonWidget(label: "Next: Your Vehicles", value: 4, saveInto: local!stepNumber,
  size: "LARGE", style: "SOLID")                            /* step 2 → (quote) */
```

Single-file wizard: no process model, no separate interfaces — each branch is a complete page and a button click re-renders the expression on a new branch. Demo scope: the labeled rail promises 6 steps but only steps 1, 2, and 6 have branches (branch 3's Next jumps to the finished quote).

**2. Hand-built vertical stepper: TINY stamps + connector images (L523–595 shape; full rail 523–890)**

```sail
a!sectionLayout(
  label: "",
  contents: {
    a!columnsLayout(                       /* step row: stamp | label */
      columns: {
        a!columnLayout(width: "EXTRA_NARROW",
          contents: {
            a!stampField(labelPosition: "COLLAPSED", icon: "piggy-bank",
              backgroundColor: "ACCENT", contentColor: "STANDARD", size: "TINY",
              align: "CENTER", marginBelow: "NONE",
              accessibilityText: "Completed Step")
          }),
        a!columnLayout(contents: {
          a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { a!richTextItem(text: { "Bundled Savings" },
              size: "STANDARD", style: { "STRONG" }) },
            preventWrapping: true, align: "LEFT",
            marginAbove: "NONE", marginBelow: "NONE",
            accessibilityText: "Current Step (1 of 6)")
        })
      },
      alignVertical: "MIDDLE", marginAbove: "STANDARD",
      marginBelow: "NONE", spacing: "NONE"
    ),
    a!columnsLayout(                       /* connector row: vertical line | empty */
      columns: {
        a!columnLayout(width: "EXTRA_NARROW",
          contents: {
            a!imageField(labelPosition: "COLLAPSED", size: "TINY", align: "CENTER",
              images: { a!documentImage(document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()) })
          }),
        a!columnLayout(contents: {})
      },
      alignVertical: "MIDDLE", marginBelow: "NONE", spacing: "NONE"
    )
    /* ×5 more step rows (portrait, car, user-friends, umbrella, clipboard-check),
       a connector row between each; future steps: backgroundColor "#d9d9d9",
       contentColor "#666666", label not STRONG, accessibilityText "Future Step (n of 6)" */
  },
  showWhen: a!isPageWidth(pageWidths: { "DESKTOP", "DESKTOP_WIDE" })
)
```

Stamp and connector share the same EXTRA_NARROW column width with `spacing: "NONE"`, so circles and line segments sit on one vertical axis; `preventWrapping` keeps labels to one line beside it. The rail column is `width: "NARROW_PLUS"` (L892) beside the WIDE form column. Known risk: `showWhen` hides the rail below DESKTOP — phones lose all progress cues right where abandonment peaks.

**3. cardChoiceField with responsive template swap + locked context card (L906–952; bundle trio 975–1045)**

```sail
if(
  a!isPageWidth({ "PHONE" }),
  a!cardChoiceField(
    label: "Insurance Options 1",
    labelPosition: "COLLAPSED",
    data: {
      a!map(id: 1, icon: "car", primaryText: "Auto", secondaryText: "Cars & SUVs")
    },
    cardTemplate: a!cardTemplateBarTextJustified(   /* horizontal row card */
      id: fv!data.id, primaryText: fv!data.primaryText,
      secondaryText: fv!data.secondaryText, icon: fv!data.icon
    ),
    value: 1, saveInto: {}, maxSelections: 1, validations: {}
  ),
  a!cardChoiceField(
    /* identical label/data/value, but: */
    cardTemplate: a!cardTemplateBarTextStacked( /* same four fields */ ),
    value: 1, saveInto: {}, maxSelections: 1, validations: {}
  )
)
/* second field, same if() swap (L975–1045): data = 3 maps —
   home "Homeowners" · building "Renters" · motorcycle "Other Vehicles" —
   value/saveInto: local!bundleSelections, maxSelections: 3 */
```

Reflow by swapping the whole field: `a!cardTemplateBarTextJustified` renders phone-friendly full-width rows, `…BarTextStacked` renders desktop tiles — one `if(a!isPageWidth(...))` around each field, data unchanged. The Auto card is context, not a question: `value: 1` with `saveInto: {}` shows the accent border + folded-corner checkmark forever. Selected state costs zero custom code.

**4. The one-exit CTA terminus (L1046–1073)**

```sail
a!sectionLayout(
  label: "",
  contents: {
    a!columnsLayout(columns: {
      a!columnLayout(contents: {}),          /* empty column pushes button right */
      a!columnLayout(contents: {
        a!buttonArrayLayout(align: "END", buttons: {
          a!buttonWidget(label: "Next: About You", value: 3,
            saveInto: local!stepNumber, size: "LARGE", style: "SOLID")
        })
      })
    })
  },
  divider: "ABOVE", marginAbove: "EVEN_MORE"
)
```

The section's `divider: "ABOVE"` draws the full-width rule separating work from navigation; the SOLID LARGE button (renders uppercase) is the screen's only saturated element, at the F-pattern terminus bottom-right.

## Skeleton SAIL

Branch 2 of the choose() (L456–1163) — the step-screen chassis every wizard step reuses.

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(                            /* brand bar */
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {
              a!imageField(labelPosition: "COLLAPSED",
                images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE()) },
                size: if(a!isPageWidth({ "PHONE" }), "FIT", "MEDIUM"))
            }),
            a!columnLayout(width: "NARROW", contents: {
              a!buttonArrayLayout(align: "END", marginBelow: "NONE", buttons: {
                a!buttonWidget(label: "ENGLISH", size: "SMALL",
                  width: "MINIMIZE", style: "OUTLINE"),
                a!buttonWidget(label: "Español", size: "SMALL",
                  width: "MINIMIZE", style: "LINK")
              })
            })
          },
          alignVertical: "MIDDLE",
          stackWhen: "NEVER"                 /* logo | language never stack */
        )
      },
      height: "AUTO", style: "#73245d", marginBelow: "NONE", showBorder: false
    ),
    a!cardLayout(                            /* white work area */
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),    /* centering flank */
            a!columnLayout(width: "NARROW_PLUS",
              contents: { /* vertical stepper — excerpt 2 */ }),
            a!columnLayout(width: "WIDE",
              contents: {
                a!richTextDisplayField(labelPosition: "COLLAPSED",
                  value: { a!richTextItem(text: { "Save more with a bundled quote" },
                    size: "LARGE") },
                  marginBelow: "MORE"),
                /* locked Auto cardChoiceField — excerpt 3 */
                a!richTextDisplayField(labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(size: "MEDIUM", text: {
                      "Save as much as ",
                      a!richTextItem(text: { "25%" }, style: { "STRONG" }),
                      " by bundling multiple policies today."
                    }),
                    char(10), char(10),
                    a!richTextItem(text: { "What else do you want to protect?" },
                      size: "MEDIUM", style: { "STRONG" })
                  },
                  marginAbove: "MORE", marginBelow: "MORE"),
                /* 3-option bundle cardChoiceField, maxSelections: 3 — excerpt 3 */
                /* CTA terminus section — excerpt 4 */
              }),
            a!columnLayout(contents: {})
          },
          marginAbove: if(a!isPageWidth({ "PHONE" }), "LESS", "EVEN_MORE"),
          marginBelow: if(a!isPageWidth({ "PHONE" }), "LESS", "EVEN_MORE"),
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
        ),
        a!cardLayout(contents: {},           /* spacer above footer */
          height: "SHORT_PLUS", style: "NONE",
          marginBelow: "STANDARD", showBorder: false)
      },
      height: "AUTO", style: "NONE", marginBelow: "NONE", showBorder: false
    ),
    a!cardLayout(                            /* legal footer slab */
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(width: "MEDIUM", contents: { /* logo imageField MEDIUM */ }),
            a!columnLayout(contents: {
              /* 3 disclaimer paragraphs in one rich text, split by char(10)×2 */
            })
          },
          stackWhen: { "PHONE", "TABLET_PORTRAIT" })
      },
      height: "TALL", style: "#333", padding: "EVEN_MORE",
      marginBelow: "STANDARD", showBorder: false,
      decorativeBarPosition: "NONE", decorativeBarColor: "#056CF2"  /* vestigial */
    )
  },
  contents: {},
  backgroundColor: "#333",
  contentsPadding: "NONE"
)
```

## Full source

`sail/sources/ins-quote-wizard-1.sail` — load only if emulating this page end-to-end. Identical to `ins-quote-wizard-2.sail`; the final quote branch (L1899–2954) is dissected in [ins-quote-wizard-2.md](ins-quote-wizard-2.md).
