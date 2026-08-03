# My Health Site

**Pattern**: [patterns/portals.md](../patterns/portals.md) — consumer portal home: personalized identity band + two-pane body (time-ordered logistics rail | tabbed reference library), everything on one no-scroll viewport.

## Scenario
- **Persona**: patient ("Brittany", 25) — occasional-customer cadence; logs in between visits to check appointments and records, no operational rhythm (INFERRED).
- **Domain**: outpatient healthcare network ("Community Health Partners") — retail-health consumer brand: clinical teal warmed by a magenta accent; walk-in-clinic app, not hospital EHR.
- **Tasks**: 1. Request an appointment. 2. Confirm upcoming appointment logistics (when / with whom / where). 3. Browse own record categories (meds, allergies, labs) and drill in.

## Data model
Patient(name, sex, DOB, photo) 1—* Appointment(type, datetime, provider+credential, practice, address1–3); Patient 1—* per category — Condition, Allergy(+reaction), Medication(+dose), Immunization, Procedure, LifestyleFactor, LabResult — each category surfaced as one concatenated summary string on its tile.

## Skeleton
```
HEADER-CONTENT bg=#F0F6F7
├─ CARD(header slot, style=#0E3842, showBorder=false, padding=STANDARD)
│  └─ SBS [avatar MEDIUM_PLUS | H1 greeting + icon demographics | CTA solid #C22966]
│     alignV=MIDDLE spacing=SPARSE
└─ PANE[left NARROW_PLUS bg=#F0F6F7 | center AUTO bg=white] dividers=none
   ├─ SECTION "Upcoming Appointments"
   │  ├─ CARD ×3 (SEMI_ROUNDED, border #DCE6E8, padding STANDARD)
   │  └─ BUTTON "View All Appointments" centered
   └─ SECTION "My Health"
      └─ CARD(border #DCE6E8, padding NONE)
         └─ TABS ×6 (Health Summary active, contentsPadding MORE)
            └─ GRID(2-col via cardGroup cardWidth=NARROW_PLUS) ×7 tiles, bar START #1E798F
```
Density 3 (~10 cards + 6 tabs in one viewport, STANDARD padding); F-pattern read: band left→right, down the rail, then the tile grid.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| identity band | #0E3842 | header-slot card fill (site nav bar matches, ≈#0E3842 est., chrome) |
| primary accent | #C22966 | hero CTA fill + all 7 category tile icons |
| secondary accent | #1E798F | decorative START bars on record tiles |
| page/pane tint | #F0F6F7 | headerContentLayout bg + left pane bg (tint-only zoning) |
| card border | #DCE6E8 | every card + the tab card |
| muted metadata | #6b6b6b | provider/address icons + text in appointment cards |
| secondary text | SECONDARY token | tile summary strings |
| right pane / cards | #FFFFFF (est.) | pane default — not set in code |

Tab underline + "View All Appointments" magenta come from site-level accent config, not this source. Type: greeting H1 fontWeight REGULAR; section H2s MEDIUM SEMI_BOLD; card titles H3 EXTRA_SMALL/SMALL SEMI_BOLD; metadata SMALL; no all-caps anywhere.

## Signature moves
1. Instead of a plain page title → the header slot hosts `a!cardLayout(style: "#0E3842", showBorder: false)` wrapping one sideBySideLayout: avatar photo | REGULAR-weight H1 greeting over an icon demographic micro-row (venus, "•", birthday-cake) | the page's only solid button.
2. Instead of saturated color everywhere → single-accent discipline: #C22966 appears only on the CTA and category icons, so the lone SOLID button on dark teal is unmissable.
3. Instead of a read-only record grid → `a!cardGroupLayout(cardWidth: "NARROW_PLUS")` tiles with `decorativeBarPosition: "START"` (#1E798F), magenta icon, and angle-right chevron — categorical drill-down as tappable tiles.
4. Instead of wrapping long clinical strings → `preventWrapping: true` truncates tile secondary text so all 7 tiles hold one height (drill-in must exist to recover the full text).
5. Instead of pane divider lines → `showPaneDividers: false` + left pane bg = page bg #F0F6F7: zones separated by tint alone.
6. Instead of a floating tab strip → `a!tabLayout` nested in `a!cardLayout(padding: "NONE", borderColor: "#DCE6E8")` so the strip runs flush to the card edge.

## Boring twin (what a lazy build would do — avoid this)
A white page titled "Patient Portal" with appointments in a read-only grid (Date / Provider / Location columns) and the health summary as a two-column label-value columnsLayout — default blue outline buttons, unstyled tabs, no header band, no icons. Technically identical data, zero warmth.

## Annotated SAIL excerpts
Source: guidance/sail/sources/my-health-site.sail (line refs below).

**Masthead as one card (L3–88)** — the entire personalized band is a header-slot cardLayout; demographics are icon+text sideBySideItems separated by a literal "•"; the CTA hard-codes the accent. Source comments direct swapping the demo button for a record action (L64, L215).
```
a!cardLayout(
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!imageField(labelPosition: "COLLAPSED",
            images: a!webImage(source: "https://images.unsplash.com/..."),
            size: "MEDIUM_PLUS", style: "AVATAR"),
          width: "MINIMIZE"
        ),
        a!sideBySideItem(
          item: {
            a!headingField(text: "Good afternoon, Brittany!", headingTag: "H1",
              marginBelow: "EVEN_LESS", fontWeight: "REGULAR"),
            a!sideBySideLayout( /* venus "Female" • birthday-cake "25 years old" */ )
          },
          width: "MINIMIZE"
        ),
        a!sideBySideItem(
          item: a!buttonArrayLayout(buttons: {
            a!buttonWidget(label: "Request Appointment", size: "LARGE",
              color: "#C22966", icon: "calendar", style: "SOLID")
          }, marginBelow: "NONE")
        )
      },
      alignVertical: "MIDDLE", spacing: "SPARSE"
    )
  },
  marginBelow: "NONE", height: "AUTO", style: "#0E3842",
  showBorder: false, padding: "STANDARD"
)
```

**Tint-only pane zoning (L91–97)** — no divider lines; the rail reads as a zone because its bg equals the page bg while the main pane stays default white.
```
a!paneLayout(
  showPaneDividers: false,
  panes: {
    a!pane(
      backgroundColor: "#F0F6F7",
      width: "NARROW_PLUS",
      contents: { ... }
    ),
    a!pane(contents: { ... })
  }
)
```

**Optional-address join (L188–207)** — the suite line concatenates only when present; grey building icon hangs left in a DENSE, TOP-aligned sideBySide.
```
a!richTextItem(
  text: fv!item.address1 & if(
    a!isNullOrEmpty(fv!item.address2),
    {},
    { ", " & fv!item.address2 }
  ),
  color: "#6b6b6b",
  size: "SMALL"
),
char(10),
a!richTextItem(text: fv!item.address3, color: "#6b6b6b", size: "SMALL")
```

**Record tile grammar (L283–351)** — one forEach makes 7 dissimilar categories scan as one system: teal bar + magenta icon + SMALL SEMI_BOLD label + truncated summary + chevron.
```
a!forEach(
  items: local!healthSummaryData,
  expression: a!cardLayout(
    contents: {
      a!sideBySideLayout(
        items: {
          a!sideBySideItem(item: a!sideBySideLayout(items: {
            a!sideBySideItem(
              item: a!richTextDisplayField(labelPosition: "COLLAPSED",
                value: a!richTextIcon(icon: fv!item.icon,
                  size: "MEDIUM_PLUS", color: "#C22966")),
              width: "MINIMIZE"),
            a!sideBySideItem(item: {
              a!headingField(text: fv!item.label, headingTag: "H3",
                size: "SMALL", fontWeight: "SEMI_BOLD", marginBelow: "EVEN_LESS"),
              a!richTextDisplayField(labelPosition: "COLLAPSED",
                value: a!richTextItem(text: fv!item.secondaryText, color: "SECONDARY"),
                preventWrapping: true, marginBelow: "NONE")
            })
          }, spacing: "SPARSE", marginBelow: "NONE")),
          a!sideBySideItem(
            item: a!richTextDisplayField(labelPosition: "COLLAPSED",
              value: a!richTextIcon(icon: "angle-right", size: "MEDIUM_PLUS")),
            width: "MINIMIZE")
        },
        alignVertical: "MIDDLE"
      )
    },
    marginBelow: "NONE", borderColor: "#DCE6E8", padding: "STANDARD",
    shape: "SEMI_ROUNDED",
    decorativeBarPosition: "START", decorativeBarColor: "#1E798F"
  )
)
```

**Flush tab card (L235–237 + L359–372)** — tabs live inside a padding-NONE bordered card; `contentsPadding: "MORE"` restores breathing room inside the active tab; 5 sibling tabs are label-only stubs.
```
a!cardLayout(
  contents: {
    a!tabLayout(
      tabs: {
        a!tabItem(label: "Health Summary", contents: { ... }),
        a!tabItem(label: "Care Summaries"),
        /* ×4 more label-only tabItems */
      },
      marginBelow: "NONE",
      contentsPadding: "MORE"
    )
  },
  borderColor: "#DCE6E8", padding: "NONE", shape: "SEMI_ROUNDED"
)
```

## Skeleton SAIL
```
a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!sideBySideLayout(
          items: {
            a!sideBySideItem(
              item: a!imageField(labelPosition: "COLLAPSED",
                images: a!webImage(source: "https://images.unsplash.com/..."),
                size: "MEDIUM_PLUS", style: "AVATAR"),
              width: "MINIMIZE"
            ),
            a!sideBySideItem(
              item: {
                a!headingField(text: "Good afternoon, Brittany!",
                  headingTag: "H1", fontWeight: "REGULAR", marginBelow: "EVEN_LESS"),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: { a!richTextIcon(icon: "venus"), " ",
                        a!richTextItem(text: "Female") })),
                    a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
                      labelPosition: "COLLAPSED", value: "•")),
                    a!sideBySideItem(width: "MINIMIZE",
                      item: /* birthday-cake + "25 years old", same shape */ )
                  },
                  alignVertical: "MIDDLE"
                )
              },
              width: "MINIMIZE"
            ),
            a!sideBySideItem(
              /* swap for a large call-to-action record action in production */
              item: a!buttonArrayLayout(buttons: {
                a!buttonWidget(label: "Request Appointment", size: "LARGE",
                  color: "#C22966", icon: "calendar", style: "SOLID")
              }, marginBelow: "NONE")
            )
          },
          alignVertical: "MIDDLE", spacing: "SPARSE"
        )
      },
      marginBelow: "NONE", height: "AUTO", style: "#0E3842",
      showBorder: false, padding: "STANDARD"
    )
  },
  contents: {
    a!paneLayout(
      showPaneDividers: false,
      panes: {
        a!pane(
          backgroundColor: "#F0F6F7", width: "NARROW_PLUS",
          contents: {
            a!headingField(text: "Upcoming Appointments", headingTag: "H2",
              size: "MEDIUM", fontWeight: "SEMI_BOLD"),
            a!forEach(
              items: local!appointments, /* 3 maps: appointment, provider, date,
                address1–3, practice, icon */
              expression: a!cardLayout(
                shape: "SEMI_ROUNDED", borderColor: "#DCE6E8",
                marginBelow: "STANDARD", padding: "STANDARD",
                contents: {
                  a!headingField(headingTag: "H3", size: "EXTRA_SMALL",
                    fontWeight: "SEMI_BOLD", text: fv!item.appointment,
                    marginBelow: "NONE"),
                  a!richTextDisplayField( /* date, SMALL */ ),
                  a!richTextDisplayField( /* user-md icon + provider, #6b6b6b SMALL */ ),
                  a!sideBySideLayout( /* building icon | address lines
                    with a!isNullOrEmpty guard — see excerpt */ )
                }
              )
            ),
            a!buttonArrayLayout(align: "CENTER",
              buttons: { a!buttonWidget(label: "View All Appointments") })
          }
        ),
        a!pane(
          contents: {
            a!headingField(text: "My Health", headingTag: "H2",
              size: "MEDIUM", fontWeight: "SEMI_BOLD"),
            a!cardLayout(
              contents: {
                a!tabLayout(
                  tabs: {
                    a!tabItem(
                      label: "Health Summary",
                      contents: {
                        a!cardGroupLayout(
                          labelPosition: "COLLAPSED",
                          cardWidth: "NARROW_PLUS",
                          marginAbove: "NONE", marginBelow: "NONE",
                          cards: a!forEach(
                            items: local!healthSummaryData, /* 7 maps:
                              icon, label, secondaryText */
                            expression: a!cardLayout( /* record tile —
                              see excerpt above */ )
                          )
                        )
                      }
                    ),
                    /* ×5 more label-only tabItems: Care Summaries, Vitals,
                       Health Records, Tobacco History, Forms & Documents */
                  },
                  marginBelow: "NONE", contentsPadding: "MORE"
                )
              },
              borderColor: "#DCE6E8", padding: "NONE", shape: "SEMI_ROUNDED"
            )
          }
        )
      }
    )
  },
  backgroundColor: "#F0F6F7"
)
```

## Full source
`sail/sources/my-health-site.sail` — load only if emulating this page end-to-end.
