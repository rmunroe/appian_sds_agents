# Insurance Quote Review (INSURECORP returning-shopper portal)

**Pattern**: [Record views](../patterns/record-views.md) — customer-facing offer variant: one quote record rendered as a sales page; drill-in rows instead of related-record grids.

## Scenario

- **Persona**: occasional-customer — returning retail insurance shopper ("Welcome back, Karen!"), single pre-purchase session, zero training, price-sensitive.
- **Domain**: direct-to-consumer auto carrier "INSURECORP", Geico-style funnel; sibling of the ins-quote-wizard flow (same $113.50/mo quote).
- **Ranked tasks**: 1. Decide and buy (monthly vs. prepaid). 2. Verify/edit quote inputs — coverages, vehicles, drivers. 3. Be convinced the price is good (dollar-itemized discounts, savings gauge).

## Data model

Customer(Karen) 1—1 Quote{monthly $113.50, sixMonth $646.95 w/ prepay discount, Auto}; 1—n Discount ×3 ($180.90 Multi-Vehicle, $143.25 Multi-Driver, $211.60 Safe Driving; ≈$42.90/mo rollup); 1—n Vehicle ×2; 1—n Driver ×2; 1—n Coverage ×4 (BI 50k/100k, UM/UIM BI 50k/100k, PD 75k, MedPay 25k/50k); MarketComparison{24% below area avg}.

## Skeleton

```
HEADER-CONTENT bg=#333 (whole page in header slot; contents:{})
├─ CARD(hero, style=#1155cc, showBorder=false)
│  └─ COLUMNS [empty:WIDE_PLUS:empty]
│     └─ logo, then COLUMNS [AUTO:MEDIUM]: greeting LARGE STRONG + #ffe599 subtitle
│        + SBS(Purchase Now OUTLINE LARGE | "start a new quote" underline) | car illustration
├─ CARD(main band, style=#1155cc)
│  ├─ COLUMNS [empty:WIDE_PLUS:empty] → COLUMNS [AUTO:MEDIUM] ≈2.2:1
│  │  ├─ CARD("Your coverage details", white SEMI_ROUNDED, no border)
│  │  │  ├─ CARD(price SBS $113.50/Mo –or– $646.95/6Mos*, border + ACCENT bar TOP)
│  │  │  ├─ "Auto Insurance" + 4 linked rows (icon|label|value|chevron)
│  │  │  └─ CARD(SECTION ×4 coverage lines, divider=BELOW, Edit OUTLINE SECONDARY each)
│  │  └─ CARD("Your discounts") ×3 mini-CARDs bar TOP #674ea7|#e69138|#6aa84f + TINY stamp
│  │     └─ CARD("Your savings", GAUGE 24% + copy)
│  └─ spacer COLUMNS marginAbove/Below=EVEN_MORE
└─ CARD(footer disclaimers, style=#333, padding=EVEN_MORE)
```

Density 2 — editorial: hero ≈30% of viewport, ~10 content rows visible, STANDARD card padding. Register: energetic-consumer + institutional. `stackWhen: {"PHONE", "TABLET_PORTRAIT"}` throughout.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| brand blue | `#1155cc` | hero + main-band card slabs (style param) |
| page base / footer | `#333` | headerContentLayout backgroundColor AND footer card |
| hero subtitle | `#ffe599` | second-level type on the blue field |
| savings green | `#38761d` | "$42.90/mo" rollup in the discounts row |
| discount trio | `#674ea7` / `#e69138` / `#6aa84f` | per-discount decorativeBarColor + matching stamp fill |
| white | `#ffffff` | "start a new quote" underline link, stamp glyphs |
| theme ACCENT | token (≈#4277e4 est. render) | price-card top bar, gauge fill, CTA label — NOT #1155cc |
| content surfaces | default white | flat SEMI_ROUNDED cards, showBorder:false — the blue field separates |
| vestigial | `#056CF2` | footer decorativeBarColor, position "NONE" — dead |

## Signature moves

1. Instead of a body → the whole page stacks in the `a!headerContentLayout` **header slot** (`contents: {}`) as three full-bleed color-slab cards (#1155cc, #1155cc, #333); `backgroundColor: "#333"` keeps overscroll footer-colored.
2. Instead of page-width chrome → empty flank `a!columnLayout(contents: {})` pairs center a `width: "WIDE_PLUS"` column in every slab; an empty columnsLayout with `marginAbove/Below: "EVEN_MORE"` pads band depth.
3. Instead of grids for vehicles/drivers/discounts → tappable rows: `a!cardLayout(link: a!dynamicLink(...))` wrapping sideBySide icon | label | value | bold chevron; the expanded row swaps `angle-right-bold` for `angle-down-bold`.
4. Instead of labels or legends → each discount is hue-coded **twice**: `decorativeBarColor` (position TOP) mirrored exactly by the `a!stampField` `backgroundColor` on the same card.
5. Instead of `a!kpiField` → prices are hand-built rich text: a LARGE run with a nested STRONG item for the figure, then a sibling MEDIUM item for "/ Month" — one baseline, two sizes.
6. Instead of a progress meter → `a!gaugeField(percentage: 24.0, primaryText: a!gaugePercentage())` as marketing copy ("24% lower"); the "solid white" hero CTA is really `style: "OUTLINE"` inverted by the colored card.

## Boring twin (what a lazy build would do — avoid this)

White page, "Quote Summary" formLayout, a gridField of coverages with edit icons, discounts as a read-only list, blue SOLID button bottom-right — accurate, and indistinguishable from an internal admin screen.

## Annotated SAIL excerpts

Source: [../sail/sources/ins-quote-review.sail](../sail/sources/ins-quote-review.sail) (line refs below).

**1. Full-bleed color-slab stacking in the header slot (L1–3, 144–150, 840–845, 885–897; structure only)**

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(              /* slab 1: hero */
      contents: { /* logo, greeting, CTA, illustration */ },
      height: "AUTO", style: "#1155cc", marginBelow: "NONE", showBorder: false),
    a!cardLayout(              /* slab 2: everything transactional */
      contents: { /* two-column quote content + EVEN_MORE spacer */ },
      height: "AUTO", style: "#1155cc", marginBelow: "NONE", showBorder: false),
    a!cardLayout(              /* slab 3: legal footer */
      contents: { /* logo | disclaimer rich text */ },
      height: "AUTO", style: "#333", padding: "EVEN_MORE",
      marginBelow: "STANDARD", showBorder: false)
  },
  contents: {},                /* body intentionally empty */
  backgroundColor: "#333"      /* matches slab 3 → seamless overscroll */
)
```

Header-slot cards render edge-to-edge with zero page gutter — the whole trick behind the banded look.

**2. Drill-in row: a!cardLayout(link:) as list item (L258–327; ×3 more at 328–486)**

```sail
a!cardLayout(
  contents: {
    a!sectionLayout(label: "", marginBelow: "NONE", contents: {
      a!sideBySideLayout(alignVertical: "MIDDLE", items: {
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextIcon(icon: "hand-holding-usd", size: "MEDIUM_PLUS") })),
        a!sideBySideItem(width: "AUTO", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "3 discounts" }, size: "MEDIUM") })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "$42.90/mo" }, color: "#38761d",
            size: "MEDIUM", style: { "STRONG" }) })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { a!richTextIcon(icon: "angle-right-bold") },
            color: "STANDARD", size: "MEDIUM", style: { "STRONG" }) }))
      })
    })
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  height: "AUTO", style: "NONE", marginBelow: "STANDARD"
)
/* ×3 more rows, same shape: car "2 vehicles" · user-friends "2 drivers" ·
   umbrella "Coverage" — the expanded one uses angle-down-bold + showShadow: false */
```

The `link` param makes the whole hairline card the tap target — a related list compressed to one glanceable row; the money column is optional (vehicle/driver rows are icon | label | chevron). Real builds swap the placeholder dynamicLink for record links or local-state toggles.

**3. Hue-coded discount rail: bar echoed in stamp (L660–697; trio 660–773)**

```sail
a!cardLayout(
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(width: "MINIMIZE",
          item: a!stampField(labelPosition: "COLLAPSED", icon: "car",
            backgroundColor: "#674ea7", contentColor: "STANDARD", size: "TINY")),
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(text: { "$180.90 " }, size: "MEDIUM_PLUS"),
              a!richTextItem(text: { "/ Year" }, size: "MEDIUM"),
              char(10),
              a!richTextItem(text: { "Multi-Vehicle Discount" }, size: "MEDIUM")
            }))
      },
      alignVertical: "MIDDLE")
  },
  height: "AUTO", style: "NONE", marginBelow: "STANDARD",
  decorativeBarPosition: "TOP",
  decorativeBarColor: "#674ea7"       /* exact same hex as the stamp fill */
)
/* ×2 more: user-friends #e69138 "$143.25 / Year Multi-Driver" ·
   thumbs-up #6aa84f "$211.60 / Year Safe Driving" — both contentColor: "#ffffff" */
```

One hue per discount, applied twice (bar + stamp): three value chips, not a bullet list; amounts in yearly dollars, not percentages. White on #e69138 ≈2.2:1 — decorative only; the name carries the meaning.

**4. Hand-built price strip from nested richTextItem sizes (L173–251, condensed)**

```sail
a!cardLayout(
  contents: {
    a!sideBySideLayout(
      alignVertical: "MIDDLE", marginBelow: "NONE",
      stackWhen: { "TABLET_LANDSCAPE", "PHONE" },
      items: {
        a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: {
            a!richTextItem(                 /* LARGE run wraps a STRONG item */
              text: { a!richTextItem(text: { "$113.50" }, style: { "STRONG" }), " " },
              size: "LARGE"),
            a!richTextItem(text: { "/ Month" }, size: "MEDIUM")
          })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "– or –" }, size: "MEDIUM") })),
        a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: {
            a!richTextItem(
              text: { a!richTextItem(text: { "$646.95" }, style: { "STRONG" }), " " },
              size: "LARGE"),
            a!richTextItem(text: { "/ 6 Mos*" }, size: "MEDIUM")
          },
          align: if(a!isPageWidth({ "TABLET_LANDSCAPE", "PHONE" }), "LEFT", "RIGHT")))
      }
    )
    /* + SMALL SECONDARY "*With prepayment discount" footnote, same breakpoint-flipped align */
  },
  height: "AUTO", style: "NONE", padding: "STANDARD", marginBelow: "STANDARD",
  showBorder: true, showShadow: false,
  decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT"
)
```

KPI typography without `a!kpiField`: STRONG item nested inside a LARGE run for the figure, sibling MEDIUM item for the unit — one baseline, hierarchy by size. This is the page's ONLY `showBorder: true` card, plus the ACCENT bar: the decision data gets the sole outlined element; `align` flips LEFT when the row stacks.

Also: the hero illustration column exists twice with paired `showWhen: a!isPageWidth(...)` (L26–50 phone copy, L109–131 wide copy) — reflow by swap, not squeeze.

## Skeleton SAIL

```sail
a!headerContentLayout(
  header: {
    /* every slab centers content identically: empty column | "WIDE_PLUS" column |
       empty column, stackWhen PHONE/TABLET_PORTRAIT — written out in slab 1 only */
    /* ── slab 1: hero ── */
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                /* logo imageField "MEDIUM", then a!columnsLayout(
                     alignVertical "MIDDLE", stackWhen PHONE/TABLET_PORTRAIT ):
                   · phone-only illustration col — width "MEDIUM",
                     showWhen: a!isPageWidth({"PHONE","TABLET_PORTRAIT"})
                   · text col: "Welcome back, Karen!" LARGE STRONG + char(10)×2 +
                     #ffe599 MEDIUM_PLUS subtitle; SBS Purchase Now (OUTLINE LARGE,
                     MINIMIZE) | "Or, start a new quote" #ffffff UNDERLINE, marginAbove "MORE"
                   · wide-only illustration col — width "MEDIUM", size "FIT", align "END",
                     showWhen: not(a!isPageWidth({"PHONE","TABLET_PORTRAIT"})) */
              },
              width: "WIDE_PLUS"),
            a!columnLayout(contents: {})
          },
          marginBelow: "MORE", stackWhen: { "PHONE", "TABLET_PORTRAIT" })
      },
      height: "AUTO", style: "#1155cc", marginBelow: "NONE", showBorder: false),
    /* ── slab 2: quote content (same centering wrapper) ── */
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(width: "AUTO",  /* left: coverage details */
              contents: {
                a!cardLayout(
                  contents: {
                    /* "Your coverage details" LARGE; price-strip card — excerpt 4;
                       "Auto Insurance" MEDIUM; ×4 drill-in rows — excerpt 2;
                       coverage card (style "NONE"): ×4 a!sectionLayouts,
                       divider "BELOW" (last "NONE"), name STRONG + char(10) limits |
                       Edit OUTLINE SECONDARY in MINIMIZE item */
                  },
                  height: "AUTO", style: "NONE", shape: "SEMI_ROUNDED",
                  padding: "STANDARD", marginBelow: "NONE", showBorder: false)
              }),
            a!columnLayout(width: "MEDIUM", /* right: persuasion rail */
              contents: {
                a!cardLayout(
                  contents: {
                    /* "Your discounts" LARGE + ×3 hue-coded mini-cards — excerpt 3 */
                  },
                  height: "AUTO", style: "NONE", shape: "SEMI_ROUNDED",
                  padding: "STANDARD", marginBelow: "MORE", showBorder: false),
                a!cardLayout(
                  contents: {
                    /* "Your savings" LARGE */
                    a!gaugeField(labelPosition: "COLLAPSED",
                      percentage: 24.0, primaryText: a!gaugePercentage())
                    /* + "…premium that's " STRONG "24% lower" " than the average…" */
                  },
                  height: "AUTO", style: "NONE", shape: "SEMI_ROUNDED",
                  padding: "STANDARD", marginBelow: "STANDARD", showBorder: false)
              })
          },
          stackWhen: { "PHONE", "TABLET_PORTRAIT" })
        /* + depth spacer: empty 2-col a!columnsLayout,
           marginAbove/Below "EVEN_MORE" */
      },
      height: "AUTO", style: "#1155cc", marginBelow: "NONE", showBorder: false),
    /* ── slab 3: legal footer ── */
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(width: "MEDIUM", contents: { /* logo imageField MEDIUM */ }),
            a!columnLayout(contents: { /* disclaimer rich text, runs split by char(10) */ })
          },
          stackWhen: { "PHONE", "TABLET_PORTRAIT" })
      },
      height: "AUTO", style: "#333", padding: "EVEN_MORE",
      marginBelow: "STANDARD", showBorder: false)
  },
  contents: {},
  backgroundColor: "#333"
)
```

## Full source

`sail/sources/ins-quote-review.sail` — load only if emulating this page end-to-end.
