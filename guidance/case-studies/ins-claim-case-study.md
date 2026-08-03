# Insurance Claim Case Summary (INSURECORP customer claim view)

**Pattern**: [Record views](../patterns/record-views.md) — customer-facing status-record variant: one record's summary tab answering "where is my claim and what happens next?", with a process timeline as the left rail.

## Scenario

- **Persona**: occasional-customer — policyholder "Sharif" checking his auto claim every few days post-accident; copy addresses him in second person ("Your insurance adjuster has inspected your vehicle…").
- **Domain**: consumer P&C insurance (same "INSURECORP" brand as the agent home page, but the self-service portal side) — calm-clinical + institutional register, anxiety-reducing not energizing.
- **Ranked tasks**: 1. Learn claim status and what happens next. 2. Verify recorded facts (where/when/what, vehicle, damage). 3. Act — SEND MESSAGE or CANCEL CLAIM (record chrome).

## Data model

Claim(#123-45-6789) —1:6→ Milestone(name, date?, done): Loss Occurred Sep 13 · Claim Filed Sep 13 · Vehicle Inspected Sep 15 · Estimate Issued · Payment Sent · Claim Closed; —1:1→ Driver(Sharif, GOOD DRIVER DISCOUNT); —1:1→ Loss(Beverly Hills CA 90210 + cross-street, Sep 13 2021 3:00PM, Collision); —1:1→ Vehicle(2009 Saab 9-5, VIN, Not Drivable - Towed); —1:N→ InspectionPhoto ×4; —1:N→ DamageArea {R FRONT, FRONT, L FRONT, L REAR}; RepairStatus = waiting for estimate.

## Skeleton

```
HEADER-CONTENT bg=TRANSPARENT    (blue nav, claim title bar, CANCEL CLAIM/SEND MESSAGE, TABS ×4 = record chrome, NOT in this SAIL)
├─ HEADER: CARD("What's next?" guidance, #cfe2f3, no-border) + CARD(empty #fff spacer, marginBelow=MORE)
└─ COLUMNS [NARROW_PLUS : MEDIUM_PLUS : AUTO] stackWhen=PHONE,TABLET_PORTRAIT,TABLET_LANDSCAPE
   ├─ SECTION "Claim Progress"
   │  └─ timeline: 6× COLUMNS[EXTRA_NARROW stamp | name+date] alternating 5× COLUMNS[EXTRA_NARROW connector-img | empty], spacing=NONE
   ├─ SECTION "Insured Driver"  → CARD(SBS "S" stamp #118bf1 | Sharif | #45818e tag, shadow)
   │  SECTION "Details of Loss" → CARD(eyebrow sub-SECTIONs LOCATION(map embed) / DATE & TIME / TYPE OF LOSS, dividers BELOW)
   └─ SECTION "Insured Vehicle & Damage" → CARD(SBS car-stamp #a64d79 | model | VIN → GRID(4-col photos, DENSE) → condition → diagram + 4 NEGATIVE tags)
      SECTION "Repair Status" → CARD(empty state: clock #a4c2f4 EXTRA_LARGE + "Waiting for Estimate", padding=EVEN_MORE)
```

Density 3 (balanced record view): ~7 content zones in viewport, card `padding: "STANDARD"`, an airy single-purpose timeline rail, no data grids. The evidence-heavy vehicle/damage column gets the widest (`AUTO`) slot; sections `marginBelow: "MORE"`, outer labels MEDIUM/H2, card sub-labels SMALL/H3 SECONDARY with caps typed into the label strings.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| guidance banner fill | `#cfe2f3` | "What's next?" header card (borderless) |
| spacer white | `#fff` | empty header spacer card — the only explicit card hex |
| done milestones | `POSITIVE` token (renders ≈#5bbd38 est.) | 3 completed stamp backgrounds, white icons |
| future milestones | `#d9d9d9` bg / `#666666` content | 3 future stamp backgrounds/icons |
| damage severity | `NEGATIVE` token (renders ≈#cd2b3d est.) | 4 damage-area tags — the page's only red |
| person stamp | `#118bf1` | "S" driver stamp (entity-coded: blue = person) |
| vehicle stamp | `#a64d79` | car icon stamp (entity-coded: plum = vehicle) |
| discount tag | `#45818e` | GOOD DRIVER DISCOUNT tag |
| empty-state icon | `#a4c2f4` | oversized clock in Repair Status |
| card surface | default white | `style: "NONE"`, `showShadow: true`, `showBorder: false` |
| page bg | `TRANSPARENT` | site default grey (≈#f0f0f0 est.) shows through |

Chrome blue #2458c5 (est.) and the tab bar are site/record chrome — NOT in the expression; don't attribute them to this SAIL. No colored buttons or headings anywhere.

## Signature moves

1. Instead of a "Status: Vehicle Inspected" text field → a hand-built vertical timeline: TINY `a!stampField`s alternating with vertical-connector `a!imageField` rows, each row a `[EXTRA_NARROW | auto]` `a!columnsLayout` with `spacing: "NONE"` so stamps and connectors fuse into one rail.
2. Instead of color-only state → milestone done/future is encoded four redundant ways: `backgroundColor` POSITIVE vs `#d9d9d9`, `contentColor` STANDARD(white) vs `#666666`, name STRONG vs regular, date line present vs absent — progress reads even colorblind.
3. Instead of a damage-code list → `NEGATIVE` tags positioned around a top-down car diagram via three nested `a!columnsLayout`s with `NARROW_PLUS` centers and `align: "CENTER"`/`"END"` on the tags.
4. Instead of address text alone → a live pannable Google map inside the card, via `a!webContentField(source: <maps embed URL>, height: "SHORT", showBorder: true)` — the only bordered element on the page.
5. Instead of hiding the not-started section → a designed empty state: EXTRA_LARGE `#a4c2f4` clock `a!richTextIcon` + `char(10)` breaks + SECONDARY "Waiting for Estimate", in a card with `padding: "EVEN_MORE"`.
6. Instead of burying orientation in body copy → a `#cfe2f3` "What's next?" guidance card is the first content element (header slot), STRONG lead-in + plain sentence, answering task 1 before any data.

## Boring twin (what a lazy build would do — avoid this)

One wide "Claim Details" column of label:value pairs — "Status: Vehicle Inspected" as text, milestones in a read-only grid, damage as a comma-separated list, an address with no map, photos in an attachments list, bordered default cards. Everything present, nothing spatial, "what happens next?" answered nowhere.

## Annotated SAIL excerpts

Source: [../sail/sources/ins-claim-case-study.sail](../sail/sources/ins-claim-case-study.sail) (line refs below).

**1. Header-slot guidance banner + white spacer strip (L2–46)**

```sail
header: {
  a!cardLayout(
    contents: {
      a!cardLayout(
        contents: {
          a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { a!richTextItem(text: {
              a!richTextItem(
                text: { a!richTextIcon(icon: "arrow-circle-right"), " What's next? " },
                style: { "STRONG" }),
              "Your insurance adjuster has inspected your vehicle and will soon issue an itemized estimate of repair costs. "
            }, size: "MEDIUM") })
        },
        height: "AUTO", style: "#cfe2f3", padding: "STANDARD",
        marginBelow: "NONE", showBorder: false
      )
    },
    height: "AUTO", style: "NONE", padding: "NONE", marginBelow: "STANDARD"
  ),
  a!cardLayout(                       /* empty card as a white spacer strip */
    contents: {},
    height: "AUTO", style: "#fff", padding: "NONE",
    marginBelow: "MORE", showBorder: false
  )
}
```

The banner is a filled card in the header slot (STRONG inline lead-in, not a heading); an *empty* `#fff` card follows purely as a white band separating banner from grey page background.

**2. The stamp + connector-image vertical timeline (L57–141; future-step variant L310–352)**

```sail
/* milestone row — one per step */
a!columnsLayout(
  columns: {
    a!columnLayout(
      contents: {
        a!stampField(labelPosition: "COLLAPSED", icon: "car-crash",
          backgroundColor: "POSITIVE", contentColor: "STANDARD",
          size: "TINY", align: "CENTER", marginBelow: "NONE",
          accessibilityText: "Completed Step")
      },
      width: "EXTRA_NARROW"
    ),
    a!columnLayout(
      contents: {
        a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "Loss Occurred" },
            size: "STANDARD", style: { "STRONG" }) },
          preventWrapping: true,
          align: if(a!isPageWidth({ "PHONE" }), "CENTER", "LEFT"),
          marginAbove: "NONE", marginBelow: "NONE"),
        a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "September 13" }, size: "SMALL") },
          preventWrapping: true,
          align: if(a!isPageWidth({ "PHONE" }), "CENTER", "LEFT"),
          marginAbove: "NONE", marginBelow: "NONE")
      }
    )
  },
  alignVertical: "MIDDLE", marginBelow: "NONE", spacing: "NONE"
),
/* connector row — between every pair of stamps */
a!columnsLayout(
  columns: {
    a!columnLayout(
      contents: {
        a!imageField(labelPosition: "COLLAPSED",
          images: { a!documentImage(document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()) },
          size: "TINY", isThumbnail: false, style: "STANDARD", align: "CENTER")
      },
      width: "EXTRA_NARROW"
    ),
    a!columnLayout(contents: {})       /* empty right cell keeps the rail aligned */
  },
  alignVertical: "MIDDLE", marginBelow: "NONE", spacing: "NONE"
)
/* future steps (L310–352): backgroundColor "#d9d9d9", contentColor "#666666",
   accessibilityText "Future Step", name drops STRONG, no date row */
```

The whole timeline is 11 stacked `[EXTRA_NARROW | auto]` rows (6 stamps, 5 connector images) with `spacing: "NONE"` and every margin zeroed — the connector is a document image, not a component. `a!isPageWidth({"PHONE"})` flips text align to CENTER when stacked. Caveat: `#666666` on `#d9d9d9` is ≈2.4:1 contrast — the names carry the meaning and `accessibilityText` is set on every stamp.

**3. Live map inside the loss card (L568–605)**

```sail
a!sectionLayout(
  label: "LOCATION",
  labelSize: "SMALL", labelHeadingTag: "H3", labelColor: "SECONDARY",
  contents: {
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextItem(text: { "Beverly Hills, CA 90210" }, size: "MEDIUM_PLUS") }),
    a!webContentField(
      label: "Map", labelPosition: "COLLAPSED",
      source: "https://maps.google.com/maps?q=rodeo%20drive%20and%20wilshire&t=&z=15&ie=UTF8&iwloc=&output=embed",
      height: "SHORT",
      showBorder: true
    ),
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextItem(
        text: { a!richTextIcon(icon: "map-pin"), " Rodeo Dr and Wilshire Blvd" },
        size: "STANDARD") })
  },
  divider: "BELOW", marginBelow: "STANDARD"
)
```

Address (MEDIUM_PLUS) above, embedded Google Maps iframe (`height: "SHORT"`, the page's only border) in the middle, icon-led cross-street line below — the loss location becomes verifiable, not just readable. Third-party embed = privacy/perf/offline cost; keep it to one per page.

**4. NEGATIVE tags positioned around the car diagram (L790–913)**

```sail
a!sectionLayout(
  label: "DAMAGE SUMMARY",
  labelSize: "SMALL", labelHeadingTag: "H3", labelColor: "SECONDARY",
  contents: {
    a!columnsLayout(                       /* row above the diagram */
      columns: {
        a!columnLayout(contents: {}),      /* empty flanks center the cluster */
        a!columnLayout(
          contents: {
            a!columnsLayout(columns: {
              a!columnLayout(contents: {
                a!tagField(labelPosition: "COLLAPSED",
                  tags: { a!tagItem(text: "R FRONT", backgroundColor: "NEGATIVE") },
                  size: "SMALL", align: "CENTER")
              }),
              a!columnLayout(contents: {})
            }, alignVertical: "BOTTOM")
          },
          width: "NARROW_PLUS"
        ),
        a!columnLayout(contents: {})
      },
      alignVertical: "MIDDLE"
    ),
    a!columnsLayout(                       /* diagram row */
      columns: {
        a!columnLayout(contents: {
          a!tagField(labelPosition: "COLLAPSED",
            tags: { a!tagItem(text: "FRONT", backgroundColor: "NEGATIVE") },
            size: "SMALL", align: "END")   /* hugs the diagram's left edge */
        }),
        a!columnLayout(
          contents: {
            a!imageField(labelPosition: "COLLAPSED",
              images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE()) },
              size: "FIT", isThumbnail: false, style: "STANDARD")
          },
          width: "NARROW_PLUS"             /* top-down car diagram */
        ),
        a!columnLayout(contents: {})
      },
      alignVertical: "MIDDLE"
    )
    /* row below (L866–911): "L FRONT" + "L REAR" tags in a 2-col split
       inside the same empty-flank/NARROW_PLUS-center frame */
  }
)
```

Damage rendered spatially: three stacked `columnsLayout`s use empty flanking columns and a `NARROW_PLUS` center to park SMALL `NEGATIVE` tags at the diagram's corners. The diagram's red dots are baked into the image — only the four tags are live components. Alignment depends on those fixed widths; expect drift at odd viewport widths.

**5. Designed empty state for the pending section (L925–961)**

```sail
a!sectionLayout(
  label: "Repair Status",
  labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
  contents: {
    a!cardLayout(
      contents: {
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: {
            a!richTextIcon(icon: "clock-o", color: "#a4c2f4", size: "EXTRA_LARGE"),
            char(10),
            char(10),
            a!richTextItem(text: { "Waiting for Estimate" },
              color: "SECONDARY", size: "MEDIUM_PLUS")
          },
          align: "CENTER"
        )
      },
      height: "AUTO", style: "NONE", padding: "EVEN_MORE",
      marginBelow: "STANDARD", showBorder: false, showShadow: true
    )
  },
  marginBelow: "MORE"
)
```

The not-yet-started stage keeps its section instead of vanishing: one centered rich text field — oversized pale-blue icon, two `char(10)` breaks, SECONDARY caption — inside an extra-padded card. Tells the customer the absence is expected.

## Skeleton SAIL

```sail
a!headerContentLayout(
  header: {
    /* "What's next?" #cfe2f3 guidance card + empty #fff spacer card — excerpt 1 */
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          /* ── left rail: process timeline ── */
          contents: {
            a!sectionLayout(
              label: "Claim Progress",
              labelSize: "MEDIUM", labelColor: "STANDARD",
              contents: {
                /* 11 rows, all [EXTRA_NARROW | auto], spacing "NONE" — excerpt 2:
                   done ×3 (car-crash / check-circle-o ×2, POSITIVE, STRONG name + SMALL date)
                   interleaved with connector-image rows;
                   future ×3 (file-text-o / money / stamp, #d9d9d9 bg, #666666 icon,
                   plain name, no date) */
              }
            )
          },
          width: "NARROW_PLUS"
        ),
        a!columnLayout(
          /* ── middle: who + loss facts ── */
          contents: {
            a!sectionLayout(
              label: "Insured Driver",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(item: a!stampField(labelPosition: "COLLAPSED",
                          text: "S", backgroundColor: "#118bf1",
                          contentColor: "STANDARD", size: "SMALL"), width: "MINIMIZE"),
                        a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
                          value: { a!richTextItem(text: { "Sharif" },
                            size: "MEDIUM_PLUS", style: { "STRONG" }) })),
                        a!sideBySideItem(item: a!tagField(labelPosition: "COLLAPSED",
                          tags: { a!tagItem(text: "GOOD DRIVER DISCOUNT",
                            backgroundColor: "#45818e") }), width: "MINIMIZE")
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  height: "AUTO", style: "NONE", padding: "STANDARD",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              },
              marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "Details of Loss",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    /* eyebrow sub-sections (SMALL/H3/SECONDARY, divider "BELOW"):
                       "LOCATION"    — address MEDIUM_PLUS, webContentField map (excerpt 3),
                                       map-pin cross-street line
                       "DATE & TIME" — "Sep 13, 2021 3:00PM" MEDIUM_PLUS
                       "TYPE OF LOSS"— "Collision" MEDIUM_PLUS, no divider */
                  },
                  height: "AUTO", style: "NONE", padding: "STANDARD",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              },
              marginBelow: "MORE"
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          /* ── right (widest): evidence ── */
          contents: {
            a!sectionLayout(
              label: "Insured Vehicle & Damage",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    /* SBS: car stamp #a64d79 MINIMIZE | "2009 Saab 9-5" MEDIUM_PLUS STRONG |
                       VIN MEDIUM SECONDARY MINIMIZE (right-shoved) */
                    /* "INSPECTION PHOTOS": 4-col columnsLayout, spacing "DENSE",
                       imageFields size "FIT", isThumbnail: true (click-to-enlarge) */
                    /* "VEHICLE CONDITION": "Not Drivable - Towed" MEDIUM_PLUS, divider "BELOW" */
                    /* "DAMAGE SUMMARY": diagram + 4 NEGATIVE tags — excerpt 4 */
                  },
                  height: "AUTO", style: "NONE", padding: "STANDARD",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              },
              marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "Repair Status",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                /* empty-state card, padding "EVEN_MORE" — excerpt 5 */
              },
              marginBelow: "MORE"
            )
          },
          width: "AUTO"
        )
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" }
    )
  },
  backgroundColor: "TRANSPARENT"
)
```

Note `stackWhen` includes `TABLET_LANDSCAPE` — tablets get one long column (timeline first), a deliberate trade for the three-column desktop read. Nav bar, claim title, action buttons and tabs come from record chrome, not this expression.

## Full source

`sail/sources/ins-claim-case-study.sail` — load only if emulating this page end-to-end.
