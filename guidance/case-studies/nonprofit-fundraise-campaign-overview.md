# Nonprofit Fundraising Campaign Overview

**Pattern**: [patterns/landing-pages-visitor.md](../patterns/landing-pages-visitor.md) — mission-landing variant with an executive-overview lower half: dark editorial full-bleed, illustration hero, two tonal data cards.

## Scenario
- **Persona**: fundraising/development director, weekly-manager cadence; also the default landing for all staff (site nav: HOME | MY TASKS | CASES) (INFERRED).
- **Domain**: environmental nonprofit "Boreas Foundation" (polar-bear logo; penguin/iceberg/aurora art) — mission-first, calm, premium-editorial + warm-community register.
- **Tasks**: 1. Check progress toward the annual goal. 2. Compare donor-channel mix across three years. 3. Jump to MY TASKS / CASES (a showWhen:false variant adds "NEW CAMPAIGN").

## Data model
AnnualGoal(year, goal, actual): 2023 goal $85,000,000 (↑13%), 2022 goal $75,000,000, 2022 actual $73,291,578 → attainment 97.7 displayed "98%". DonationMix(year × channel): {Existing Donors, Online Campaigns, Direct Outreach} × 2021–2023. Hidden KPI strip (CODE-VERIFIED, unrendered) implies CampaignMetrics(dollarsToTarget 82.9%, retention 74.2%, newDonorsToTarget 91.6%, recurringRate 48.5%, activeCampaigns 11). Rendered image shows 2020/2021 copy; code refreshed to 2022/2023 — same design.

## Skeleton
```
HEADER-CONTENT bg=#333F48 contentsPadding=EVEN_MORE
├─ CARD(hero, style=#333F48, borderless)
│  └─ COLUMNS [pad:MEDIUM_PLUS:WIDE:pad] alignV=MIDDLE
│     ├─ H1 LIGHT LARGE — 4-line mission sentence
│     └─ illustration size=FIT (iceberg+penguins, bg-matched)
├─ CARD(KPI-ROW ×5 + "NEW CAMPAIGN" OUTLINE, style=#eee) [showWhen=false — absent from pixels]
└─ COLUMNS [pad:MEDIUM_PLUS:WIDE:pad] spacing=STANDARD
   ├─ CARD(goal figures + GAUGE 98%, style=#394c5a)
   └─ CARD(3× CHART(donut) + one shared manual legend, style=#394c5a)
```
Density 2 — editorial: two content cards under a half-viewport hero, empty flanking columns; Z-pattern read (headline → illustration → goal card → donut trio); no scroll implied. Donut card takes WIDE vs the goal card's MEDIUM_PLUS (~3:2) because the 3-year comparison needs horizontal room.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| page + hero card | #333F48 | headerContentLayout bg + hero card style — same hex floats the illustration |
| content cards | #394c5a | goal card + donut card: one step lighter, showBorder false, no shadow |
| series blue | #619ed6 | donut series 1 + gauge color + legend dot — one hex links both cards |
| series green | #6ba547 | donut series 2 legend dot |
| series yellow | #f7d027 | donut series 3 legend dot (echoes site logo/tab gold — OBSERVED chrome, not SAIL) |
| parked strip | #eee | showWhen:false KPI card |
| semantic tokens | POSITIVE · NEGATIVE · SECONDARY | delta arrow/carets · KPI icons |
| gauge track | ≈#d9dce0 (est.) | unfilled gauge ring |

Donuts use `colorScheme: "CLASSIC"`; the hand-built legend dots are hard-hexed to match CLASSIC's first three colors. Type: H1 LARGE fontWeight LIGHT (MEDIUM_PLUS on phone/tablet-portrait); $85,000,000 and ↑13% at LARGE_PLUS; ALL-CAPS STANDARD labels ("2022 GOAL" / "2022 ACTUAL") over LARGE values. White text throughout is the default-on-dark render.

## Signature moves
1. Instead of white page + bordered cards → full-bleed #333F48 with a same-hex borderless hero card and one-shade-lighter #394c5a content cards — flat tonal layering, zero borders or shadows.
2. Instead of a photo billboard → `a!columnsLayout(alignVertical: "MIDDLE")` pairs a LIGHT LARGE 4-line mission H1 with background-matched flat art (`size: "FIT"`), so the illustration reads as scenery, not a boxed image; empty flanking columnLayouts give a poster frame.
3. Instead of three auto-legends → `seriesLabelStyle: "NONE"` + `showDataLabels: false` on all three donuts, plus ONE hand-built sideBySideLayout legend: exact-hex circle richTextIcons, centered by empty sideBySideItems at both ends.
4. Instead of a progress bar → `a!gaugeField(percentage: 97.7, primaryText: a!gaugePercentage(), color: "#619ed6")` — the gauge reuses series blue, visually stitching the goal card to the chart card.
5. Instead of deleting the ops variant → a fully built 5-KPI strip + NEW CAMPAIGN button parked behind `showWhen: false` on its card — flip one flag to turn mission landing into ops overview (risk: dead code invites drift).
6. Instead of fixed sizing → responsive dials: H1 size and illustration column width switch via `a!isPageWidth`; content columns stack even at DESKTOP_NARROW; but the donut row locks `stackWhen: {"NEVER"}` so the year sequence always reads left→right (cramped on phones).

## Boring twin (what a lazy build would do — avoid this)
A white page with a "Campaign Overview" title bar, a stock-photo billboard, five bordered KPI cards, one pie chart with its default legend, and a blue FILLED button in a toolbar.

## Annotated SAIL excerpts
Source: guidance/sail/sources/nonprofit-fundraise-campaign-overview.sail (line refs below).

**Poster hero (L5–43)** — empty flanking columns center the pair; H1 size and image column width are responsive; the card behind it (L46) shares the page hex.
```
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),
    a!columnLayout(
      contents: {
        a!headingField(
          fontWeight: "LIGHT",
          headingTag: "H1",
          marginBelow: "NONE",
          text: "Saving the Earth's polar habitats through the power of crowdsourced gifting.",
          size: if(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }), "MEDIUM_PLUS", "LARGE")
        )
      },
      width: "MEDIUM_PLUS"
    ),
    a!columnLayout(
      contents: {
        a!imageField(labelPosition: "COLLAPSED",
          images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE()) },
          size: "FIT")
      },
      width: if(a!isPageWidth({ "TABLET_PORTRAIT" }), "MEDIUM", "WIDE")
    ),
    a!columnLayout(contents: {})
  },
  alignVertical: "MIDDLE",
  marginBelow: "NONE",
  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
)
```

**Parked ops strip (L51–357, card props L351–357)** — a complete 5-cell KPI band (same cell grammar as the campaign dashboard) plus an OUTLINE "NEW CAMPAIGN" button, disabled at the card level. Keep or delete deliberately.
```
a!cardLayout(
  contents: { /* 5 KPI columns, spacing "SPARSE", showDividers true,
    + a!buttonWidget("NEW CAMPAIGN", style: "OUTLINE", size: "LARGE") */ },
  height: "AUTO",
  showWhen: false,
  style: "#eee",
  padding: "STANDARD",
  marginBelow: "NONE",
  showBorder: false
)
```

**Prior-year block + gauge (L424–473)** — ALL-CAPS caps labels over LARGE values in one rich text (char(10) stacking); the gauge sits beside it at width MINIMIZE and rounds 97.7 to "98%" via a!gaugePercentage().
```
a!sideBySideLayout(
  items: {
    a!sideBySideItem(
      item: a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          "2022 GOAL",
          char(10),
          a!richTextItem(text: { "$75,000,000" }, size: "LARGE"),
          char(10), char(10),
          a!richTextItem(text: { "2022 ACTUAL" }, size: "STANDARD"),
          char(10),
          a!richTextItem(text: { "$73,291,578" }, size: "LARGE")
        }
      )
    ),
    a!sideBySideItem(
      item: a!gaugeField(
        labelPosition: "COLLAPSED",
        percentage: 97.7,
        primaryText: a!gaugePercentage(),
        color: "#619ed6",
        size: "MEDIUM",
        marginBelow: "NONE"
      ),
      width: "MINIMIZE"
    )
  },
  alignVertical: "MIDDLE",
  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
)
```

**Legend-less donut trio (L551–611)** — three same-height donuts in a stackWhen-NEVER row; year labels sit in a matching 3-column row above (L495–549, also stackWhen NEVER); an empty #394c5a spacer card (L488–494) pads the card top.
```
a!columnsLayout(
  columns: {
    a!columnLayout(
      contents: {
        a!pieChartField(
          labelPosition: "COLLAPSED",
          series: {
            a!chartSeries(label: "Chart Series 1", data: 1),
            a!chartSeries(label: "Chart Series 2", data: 2),
            a!chartSeries(label: "Chart Series 3", data: 3)
          },
          showDataLabels: false,
          colorScheme: "CLASSIC",
          style: "DONUT",
          seriesLabelStyle: "NONE",
          height: "SHORT"
        )
      }
    ),
    /* ×2 more donut columns, same shape — data 2/2/2 and 4/3/1 */
  },
  marginBelow: "STANDARD",
  stackWhen: { "NEVER" }
)
```

**One shared hand-built legend (L613–659)** — replaces three per-chart legends; empty sideBySideItems at both ends center the dot+label trio; circle icons carry the exact series hexes.
```
a!sideBySideLayout(
  items: {
    a!sideBySideItem(),
    a!sideBySideItem(
      item: a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextIcon(icon: "circle", color: "#619ed6"),
          " Existing Donors"
        }
      ),
      width: "MINIMIZE"
    ),
    /* ×2 more: "#6ba547" Online Campaigns, "#f7d027" Direct Outreach */
    a!sideBySideItem()
  },
  spacing: "SPARSE",
  marginBelow: "MORE"
)
```

## Skeleton SAIL
```
a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!columnsLayout( /* poster hero: empty col | H1 LIGHT responsive |
          image FIT | empty col — see excerpt */ )
      },
      height: "AUTO", style: "#333F48", padding: "STANDARD",
      marginBelow: "NONE", showBorder: false
    ),
    a!cardLayout(
      /* parked ops strip — showWhen: false, style: "#eee" — see excerpt */
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: { a!richTextItem(text: { "2023 Goal" }, size: "MEDIUM_PLUS") }
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(item: a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: { a!richTextItem(text: { "$85,000,000" }, size: "LARGE_PLUS") }
                    )),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(icon: "arrow-up", color: "POSITIVE",
                            size: "LARGE_PLUS"),
                          a!richTextItem(text: { "13%" }, size: "LARGE_PLUS",
                            style: { "STRONG" })
                        }
                      ),
                      width: "MINIMIZE"
                    )
                  },
                  marginBelow: "MORE",
                  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
                ),
                a!sideBySideLayout( /* 2022 GOAL/ACTUAL block + gauge 97.7
                  color "#619ed6" — see excerpt */ )
              },
              height: "AUTO", style: "#394c5a", padding: "STANDARD",
              marginBelow: "STANDARD", showBorder: false
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!cardLayout(  /* empty bg-matched spacer */
                  contents: {},
                  height: "AUTO", style: "#394c5a",
                  marginBelow: "NONE", showBorder: false
                ),
                a!columnsLayout(
                  columns: {
                    a!columnLayout(contents: {
                      a!richTextDisplayField(labelPosition: "COLLAPSED",
                        value: { a!richTextItem(text: { "2021" }, size: "MEDIUM_PLUS") },
                        align: "CENTER")
                    }),
                    /* ×2 more year labels: 2022, 2023 */
                  },
                  marginBelow: "MORE",
                  stackWhen: { "NEVER" }
                ),
                a!columnsLayout( /* 3 donut columns, stackWhen NEVER — see excerpt */ ),
                a!sideBySideLayout( /* single hand-built legend — see excerpt */ )
              },
              height: "AUTO", style: "#394c5a", padding: "STANDARD",
              marginBelow: "STANDARD", showBorder: false
            )
          },
          width: "WIDE"
        ),
        a!columnLayout(contents: {})
      },
      spacing: "STANDARD",
      stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
    )
  },
  backgroundColor: "#333F48",
  contentsPadding: "EVEN_MORE"
)
```

## Full source
`sail/sources/nonprofit-fundraise-campaign-overview.sail` — load only if emulating this page end-to-end.
