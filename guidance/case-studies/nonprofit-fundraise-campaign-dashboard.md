# Nonprofit Fundraising Campaign Dashboard

**Pattern**: [patterns/dashboards.md](../patterns/dashboards.md) — operational variant: a daily-operator home tab (personal queue + portfolio monitor), light surfaces, shadow cards. For dark theme see [sales-perform-dashboard.md](sales-perform-dashboard.md).

## Scenario
- **Persona**: fundraising/campaign operations manager at a nonprofit foundation; daily-operator cadence — hourly task timestamps, overdue flags, live %-raised (INFERRED).
- **Domain**: wildlife/conservation nonprofit ("Boreas Foundation", polar-bear logo, penguin banner) — mission-warm veneer over a working ops tool (warm-community + utilitarian-ops).
- **Tasks**: 1. Monitor campaign performance (%-raised vs goal). 2. Clear my work queue (tasks, alerts). 3. Launch/administer campaigns and donors.

## Data model
Campaign(name = channel+geo, e.g. "Q3 Search Engine Marketing (US)"; startDate; endDate; goalAmountUSD $195k–$750k; pctRaised 19.5–33.8; category; 17 active) · Task(title, assignees: users/groups, timestamp/due, overdue flag) *—* User · Resource(label, type ∈ {download, link}) · Goal(metric, pctOfGoal) · Alert (zero in demo — empty state designed).

## Skeleton
```
HEADER-CONTENT bg=TRANSPARENT
├─ BILLBOARD h=EXTRA_SHORT overlay=none (photo-only masthead, marginBelow NONE)
├─ CARD(KPI-ROW ×5 dividers+SPARSE | ghost spacer | "NEW CAMPAIGN" SOLID LARGE)  ← flush to billboard
└─ COLUMNS [MEDIUM:AUTO:MEDIUM]
   ├─ SECTION "Alerts" → CARD(empty-state, fixed h=MEDIUM_PLUS)
   │  SECTION "My Tasks" → CARD(5× CARD(task,link) └ CARD(see-all link))
   ├─ SECTION "Active Campaigns" → CARD(GRID(5-col, pageSize 15 → "1–15 of 17"))
   └─ SECTION "Actions" → CARD(3× OUTLINE SECONDARY buttons FILL)
      SECTION "Resources" → CARD(4× CARD(stamp+label,link))
      SECTION "My Goals" → CARD(COLUMNS [1:1] gauge ×2)
```
Density 4 — 5 KPIs, 15 grid rows, 5 task cards, 7 labeled zones, all above the fold. Center column is AUTO (widest) because the campaign grid is the primary working object.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| empty-state icon | #d9d9d9 | EXTRA_LARGE bell-slash-o in the Alerts card |
| download stamp | #d7e5f3 bg / #3d85c6 icon | Resources rows typed "download" |
| link stamp | #d7f3e0 bg / #459b20 icon | Resources rows typed "external link" |
| calls gauge | #45818e | CALLS PLACED gauge fill |
| donors gauge | #a64d79 | NEW DONORS gauge fill |
| semantic tokens | ACCENT · POSITIVE · NEGATIVE · SECONDARY | assignee names + see-all link · carets · carets + OVERDUE tag bg · KPI icons + metadata |
| page bg | #f0f0f0 (est.) | theme render behind layout bg "TRANSPARENT" |
| cards | #ffffff (est.) | all shadow cards (style "NONE") |
| accent render | #316598 (est.) | theme accent as rendered (links, SOLID button) |

Card grammar everywhere: `style: "NONE", showBorder: false, showShadow: true` — shadow-not-border separation on the grey page. KPI values MEDIUM_PLUS STRONG under literal ALL-CAPS STANDARD labels; metadata SMALL SECONDARY.

## Signature moves
1. Instead of a tall hero with overlay text → an EXTRA_SHORT photo billboard butted flush to a white KPI card via `marginBelow: "NONE"` on both — brand plus portfolio health in one masthead (~330px).
2. Instead of a!kpiField → hand-built KPI cells: ALL-CAPS label, SECONDARY icon, MEDIUM_PLUS STRONG value, caret delta — in `a!columnsLayout(spacing: "SPARSE", showDividers: true)`.
3. Instead of coloring delta numbers → only caret icons take POSITIVE/NEGATIVE; digits stay STANDARD grey (color = direction only). Same restraint with buttons: the page's sole SOLID button is NEW CAMPAIGN; the three Actions buttons are `style: "OUTLINE", color: "SECONDARY", width: "FILL"`.
4. Instead of bordered list rows → nested cardLayouts, each with `link: a!dynamicLink(...)`, inside a container card with `padding: "NONE"` — whole-row click targets for tasks and resources.
5. Instead of one accent everywhere → pastel duotone stamps type-code resources (blue #d7e5f3/#3d85c6 = download, green #d7f3e0/#459b20 = external link); gauges take off-accent hues #45818e / #a64d79.
6. Instead of a blank region when the queue is clear → a designed empty state: char(10)×4 + EXTRA_LARGE #d9d9d9 icon + "No Alerts" SECONDARY MEDIUM, centered in a fixed `height: "MEDIUM_PLUS"` card.

## Boring twin (what a lazy build would do — avoid this)
A grey page title, four bordered a!kpiFields, the campaign grid dropped bare on the page background, actions as a bulleted link list, no imagery, everything default accent blue — and the Alerts section simply absent when empty.

## Annotated SAIL excerpts
Source: guidance/sail/sources/nonprofit-fundraise-campaign-dashboard.sail (line refs below).

**Flush billboard→KPI masthead (L3–10 + L304–307)** — the double `marginBelow: "NONE"` weld; the photo band and the white KPI card read as one masthead.
```
a!billboardLayout(
  backgroundMedia: a!webImage(source: "https://images.unsplash.com/..."),
  height: "EXTRA_SHORT",
  marginBelow: "NONE"
),
a!cardLayout(
  contents: { /* KPI columns + NEW CAMPAIGN button */ },
  height: "AUTO",
  padding: "STANDARD",
  marginBelow: "NONE"
)
```

**Hand-built KPI cell (L18–64)** — the repeated unit inside `a!columnsLayout(spacing: "SPARSE", showDividers: true)`; caret carries the semantic color, the delta digits do not.
```
a!columnLayout(
  contents: {
    a!richTextDisplayField(
      labelPosition: "COLLAPSED",
      value: { "GIFT DOLLARS TO TARGET" }
    ),
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
            a!richTextIcon(icon: "money", color: "SECONDARY", size: "MEDIUM_PLUS"),
            a!richTextItem(text: { " 82.9%" }, size: "MEDIUM_PLUS", style: { "STRONG" })
          })
        ),
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
            a!richTextIcon(icon: "caret-up", color: "POSITIVE", size: "STANDARD"),
            a!richTextItem(text: { "1.9%" }, color: "STANDARD", size: "STANDARD")
          }),
          width: "MINIMIZE"
        )
      },
      alignVertical: "MIDDLE"
    )
  }
)
```

**Ghost spacer + responsive button alignment (L252–293)** — a filler column exists only at full desktop width; the button flips END→START as the row stacks.
```
a!columnLayout(
  contents: {},
  width: "AUTO",
  showWhen: not(a!isPageWidth(
    { "DESKTOP_NARROW", "TABLET_LANDSCAPE", "TABLET_PORTRAIT", "PHONE" }
  ))
),
a!columnLayout(
  contents: {
    a!buttonArrayLayout(
      buttons: {
        a!buttonWidget(label: "NEW CAMPAIGN", icon: "plus-circle",
          size: "LARGE", style: "SOLID")
      },
      align: if(a!isPageWidth({ /* same 4 widths */ }), "START", "END"),
      marginBelow: "NONE"
    )
  },
  width: "NARROW"
)
```

**Designed empty state (L320–349)** — char(10) padding centers an oversized pale icon in a fixed-height card so the zone holds its footprint at zero alerts.
```
a!cardLayout(
  contents: {
    a!richTextDisplayField(
      labelPosition: "COLLAPSED",
      value: {
        char(10), char(10), char(10), char(10),
        a!richTextIcon(icon: "bell-slash-o", color: "#d9d9d9", size: "EXTRA_LARGE"),
        char(10),
        a!richTextItem(text: { "No Alerts" }, color: "SECONDARY", size: "MEDIUM")
      },
      align: "CENTER"
    )
  },
  height: "MEDIUM_PLUS",
  style: "NONE", marginBelow: "STANDARD",
  showBorder: false, showShadow: true
)
```

**Linked row card (L360–420; task list runs L358–727)** — rows are nested cards with `link:` inside a `padding: "NONE"` container card; title STRONG + preventWrapping; meta row splits assignees (ACCENT names) from a right-pinned SMALL SECONDARY timestamp. Overdue rows add `a!tagField(a!tagItem(text: "OVERDUE", backgroundColor: "NEGATIVE"), size: "SMALL")` (L532–541).
```
a!cardLayout(
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(
            text: { "Complete performance review for Pete Moody" },
            style: { "STRONG" }) },
          preventWrapping: true
        ))
      },
      marginBelow: "NONE"
    ),
    a!sideBySideLayout( /* meta row: hand-o-right icon + assignees (ACCENT names)
      | right-pinned width:"MINIMIZE" SMALL SECONDARY timestamp */ )
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  height: "AUTO", style: "NONE", marginBelow: "NONE",
  showBorder: false, showShadow: true
)
```

**Grid shell (L743–762)** — numeric/date columns right-aligned, pageSize 15. CORRECTION: this a!gridField has NO data parameter — the rendered toolbar (search, CATEGORY filter, export/filter/refresh) and 15 populated rows are docs-preview record-data injections; the snippet alone renders an empty grid. Wire `data` to a record type when reusing.
```
a!gridField(
  label: "Campaigns List",
  labelPosition: "COLLAPSED",
  columns: {
    a!gridColumn(label: "Name", width: "AUTO"),
    a!gridColumn(label: "Start Date", align: "END"),
    /* ×3 more, all align: "END": End Date, Goal Amount (USD), % Raised */
  },
  pageSize: 15
)
```

## Skeleton SAIL
```
a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundMedia: a!webImage(source: "https://images.unsplash.com/..."),
      height: "EXTRA_SHORT",
      marginBelow: "NONE"
    ),
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout( /* KPI cell "GIFT DOLLARS TO TARGET"
                      82.9% ▲1.9% — see excerpt */ ),
                    /* ×4 more KPI cells, same shape: DONOR RETENTION 74.2% ▼,
                       NEW DONORS TO TARGET 91.6% ▲, RECURRING GIFT RATE 48.5% ▼,
                       ACTIVE CAMPAIGNS 17 (no delta) */
                  },
                  spacing: "SPARSE",
                  stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" },
                  showDividers: true
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout( /* ghost spacer — see excerpt */ ),
            a!columnLayout( /* NEW CAMPAIGN SOLID LARGE, responsive align — see excerpt */ )
          },
          alignVertical: "MIDDLE",
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
        )
      },
      height: "AUTO", padding: "STANDARD", marginBelow: "NONE"
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Alerts",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: { a!cardLayout( /* empty state, height "MEDIUM_PLUS" — see excerpt */ ) }
            ),
            a!sectionLayout(
              label: "My Tasks",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!cardLayout( /* linked task row — see excerpt */ ),
                    /* ×4 more task rows, same shape (one adds OVERDUE tag) */
                    a!cardLayout( /* footer row, same linked-card grammar:
                      centered "See All Tasks ›" ACCENT STRONG rich text */ )
                  },
                  height: "AUTO", style: "NONE", padding: "NONE",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              }
            )
          },
          width: "MEDIUM"
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Active Campaigns",
              labelSize: "MEDIUM", labelHeadingTag: "H2", labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: { a!gridField( /* 5 columns, pageSize 15 — see excerpt */ ) },
                  height: "AUTO", style: "NONE", marginBelow: "STANDARD",
                  showBorder: false, showShadow: true
                )
              }
            )
          },
          width: "AUTO"
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout( /* "Actions" — same section+card shell around one
              a!buttonArrayLayout of 3× a!buttonWidget(width: "FILL",
              style: "OUTLINE", color: "SECONDARY"): Enroll New Donor (user-plus),
              Launch Quarterly Audit (search), New Campaign Category (plus-circle) */ ),
            a!sectionLayout(
              label: "Resources", labelSize: "MEDIUM", labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(labelPosition: "COLLAPSED",
                                icon: "download", backgroundColor: "#d7e5f3",
                                contentColor: "#3d85c6", size: "TINY"),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem( /* label STRONG, preventWrapping */ )
                          },
                          alignVertical: "MIDDLE"
                        )
                      },
                      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                      height: "AUTO", style: "NONE", marginBelow: "NONE",
                      showBorder: false, showShadow: true
                    ),
                    /* ×3 more resource rows, same shape — "link" type swaps stamp
                       to icon: "link", backgroundColor: "#d7f3e0", contentColor: "#459b20" */
                  },
                  height: "AUTO", style: "NONE", padding: "NONE",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              }
            ),
            a!sectionLayout(
              label: "My Goals", labelSize: "MEDIUM", labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!columnsLayout(
                      columns: {
                        a!columnLayout(
                          contents: {
                            a!richTextDisplayField( /* "CALLS PLACED", align CENTER */ ),
                            a!gaugeField(labelPosition: "COLLAPSED", percentage: 68.0,
                              primaryText: a!gaugeIcon(icon: "phone"),
                              color: "#45818e", size: "SMALL", align: "CENTER"),
                            a!richTextDisplayField( /* "68% of goal", align CENTER */ )
                          }
                        ),
                        a!columnLayout( /* NEW DONORS gauge, same shape:
                          percentage 100.0, icon "user", color "#a64d79",
                          caption "104%" POSITIVE STRONG */ )
                      }
                    )
                  },
                  height: "AUTO", style: "NONE", padding: "MORE",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
              }
            )
          },
          width: "MEDIUM"
        )
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
    )
  },
  backgroundColor: "TRANSPARENT"
)
```

## Full source
`sail/sources/nonprofit-fundraise-campaign-dashboard.sail` — load only if emulating this page end-to-end.
