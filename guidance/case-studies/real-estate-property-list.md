# Real estate property list (Thatcher)

**Pattern**: [lists-and-grids](../patterns/lists-and-grids.md) — media-forward card list variant: photo-first record cards in a wrapping card group, framed by hand-built rail + menu navigation.

## Scenario
- Persona: residential listing agent at boutique luxury brokerage "Thatcher."; daily-operator — checks listing health each morning, adds listings weekly.
- Domain: luxury residential real estate, Palm Springs / Coachella Valley ($1.69M–$2.15M inventory); premium boutique brand — serif wordmark on near-black chrome, single oxblood accent.
- Ranked tasks: 1. scan my listings' status + momentum (tag + days-on-market) 2. create a new listing (one click) 3. jump to other listing slices (New / Search / Sold) or modules (dashboard, customers, lending, performance, team).

## Data model
Listing(photo, status ∈ {new-listing, open-house-scheduled, no-offers-received, price-reduced}, askingPrice, daysOnMarket, beds, baths, sqFt, street, city, state, zip); Agent 1—N Listing ("My Listings"). 5 listings shown.

## Skeleton
```
HEADER-CONTENT header={} contentsPadding=NONE (dark "Thatcher." top bar = site chrome, NOT in the expression)
└─ COLUMNS [EXTRA_NARROW:AUTO] spacing=NONE stack=NEVER
   ├─ PANE[left] icon rail: 6× CARD(icon link, #232020) + 1 active CARD(#990000) + 2× CARD(spacer EXTRA_TALL, #232020)
   └─ COLUMNS [NARROW_PLUS:AUTO] spacing=NONE dividers=on
      ├─ PANE[left] menu: SECTION "Properties" + BUTTON(New Listing, SOLID FILL) + 4× CARD(SBS icon+label link) + 2 spacers
      └─ CARD(well #f0f0f0, padding=MORE)
         └─ GRID(card-group cardWidth=NARROW_PLUS → 3+2 wrap)
            └─ per card: CARD(ROUNDED, pad NONE) = BILLBOARD h=SHORT_PLUS overlay=TOP tag → SBS price|days → specs+address
```
Density 2 (editorial — the corpus anchor for 2): 5 content cards + 6 nav icons per viewport, photo ≈60% of card height, everything above the fold.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| rail / chrome | #232020 | icon-rail cells + rail spacer cards |
| active nav | #990000 | active rail cell (Properties) |
| content well | #f0f0f0 | wrapper card behind the card grid; also billboard fallback |
| tag: new listing | #ff9900 | photo-corner tag (white text ≈2.2:1 — fails WCAG AA; darken in reuse) |
| tag: open house scheduled | #38761d | photo-corner tag ×2 |
| tag: no offers received | #cc0000 | photo-corner tag |
| tag: price reduced | #3c78d8 | photo-corner tag |
| menu secondary text | #666666 | inactive menu labels |
| site accent | symbolic "ACCENT"/"SOLID" — renders ≈#990000 (est.) | "My Listings" active row, New Listing button; comes from site branding, not this SAIL |

Color reserved for status and selection: prices, specs, addresses stay neutral dark; card bg is default white.

## Signature moves
1. Instead of a navigation component → an icon rail hand-built from stacked #232020 `a!cardLayout`s (`link` + `tooltip`, centered MEDIUM_PLUS `a!richTextIcon`); active module = same cell with `style: "#990000"`. 6 modules in ~70px of width.
2. Instead of column background props (which don't exist) → full-height rail illusion: two empty `height: "EXTRA_TALL"` styled cards appended below the nav cells (rail L116–127, menu twin L417–430).
3. Instead of a status column → all-caps `a!tagField` overlaid on each photo via `a!billboardLayout` + `a!fullOverlay(alignVertical: "TOP", style: "NONE")` — one saccade per card yields identity + status.
4. Instead of a grid row per listing → ROUNDED `padding: "NONE"` photo-first cards in `a!cardGroupLayout(cardWidth: "NARROW_PLUS")`, wrapping 3+2; the #f0f0f0 `padding: "MORE"` well lifts the white cards without heavy borders.
5. Instead of a "Days" column → price and days-on-market share one SBS row (MEDIUM_PLUS price left; SECONDARY calendar icon + "42d" right, MINIMIZE) so the stale listing self-reports.
6. Instead of responsive stacking → column shedding: nav columns carry `showWhen: not(a!isPageWidth({...}))` so small screens drop navigation, not content (note: New Listing disappears with it — the analysis flags this as a real cost).

## Boring twin (what a lazy build would do — avoid this)
A white page with an a!gridField — columns Address, Price, Beds, Status, Days — default blue accent, New Listing button top-right, paging bar. Status as plain text, no photos, no rail.

## Annotated SAIL excerpts
Source: guidance/sail/sources/real-estate-property-list.sail.

### Rail cell + full-height illusion (L31–47, L116–127)
```sail
a!cardLayout(                              /* active rail cell */
  contents: {
    a!richTextDisplayField(
      labelPosition: "COLLAPSED",
      value: { a!richTextIcon(icon: "home", size: "MEDIUM_PLUS") },
      align: "CENTER"
    )
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  tooltip: "Properties",
  height: "AUTO",
  style: "#990000",                        /* inactive cells: "#232020" */
  marginBelow: "NONE",
  showBorder: false
),
/* …after the last nav cell: */
a!cardLayout(height: "EXTRA_TALL", style: "#232020",
             marginBelow: "NONE", showBorder: false)   /* ×2 */
```
The whole "sidebar" is stacked link-cards; the label lives in `tooltip` (touch/screen-reader weak — the analysis flags it). Columns have no background param, so the trailing empty EXTRA_TALL cards extend the rail color toward the viewport bottom.

### Status tag riding the photo (L451–472)
```sail
a!billboardLayout(
  backgroundMedia: a!webImage(source: "https://…exterior…"),
  backgroundColor: "#f0f0f0",
  height: "SHORT_PLUS",
  marginBelow: "NONE",
  overlay: a!fullOverlay(
    alignVertical: "TOP",
    contents: {
      a!tagField(
        labelPosition: "COLLAPSED",
        tags: {
          a!tagItem(text: "NEW LISTING", backgroundColor: "#ff9900")
        }
      )
    },
    style: "NONE"                          /* no scrim — tag sits raw on the photo */
  )
)
```
Status-on-imagery: the tag occupies the photo's top-left corner (first fixation per card). Authored uppercase; four semantic hexes across the five cards.

### Price | days-on-market row, then specs (L476–517, condensed)
```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(
      item: a!richTextDisplayField(
        value: { a!richTextItem(text: { "$1,695,000" }, size: "MEDIUM_PLUS") }
      )
    ),
    a!sideBySideItem(
      item: a!richTextDisplayField(
        value: {
          a!richTextItem(text: { a!richTextIcon(icon: "calendar"), " 2d" },
                         color: "SECONDARY", size: "MEDIUM")
        }
      ),
      width: "MINIMIZE"
    )
  },
  alignVertical: "MIDDLE", marginBelow: "STANDARD"
),
a!richTextDisplayField(
  value: {
    a!richTextItem(text: { "3 Beds  " }, size: "STANDARD"),
    "•  2.5 Baths  •  2,403 Sq. Ft.",
    char(10),
    a!richTextItem(text: { "12345 Maple Ave, Palm Springs, CA 92262" }, size: "SMALL")
  }
)
```
Asking price and momentum in one glance line; a char(10) inside one rich text field stacks specs over the SMALL address without an extra component.

### Column shedding + the menu/content seam (L129–132, L439–440, L882–890)
```sail
/* icon rail column */  width: "EXTRA_NARROW",
                        showWhen: not(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }))
/* menu column */       width: "NARROW_PLUS",
                        showWhen: not(a!isPageWidth({ "PHONE" }))
/* inner columnsLayout */ spacing: "NONE", stackWhen: { "NEVER" }, showDividers: true
/* outer columnsLayout */ spacing: "NONE", stackWhen: { "NEVER" }
```
Both nav tiers shed rather than stack; `stackWhen: {"NEVER"}` + `spacing: "NONE"` keep the panes flush, and `showDividers: true` draws the single hairline seam between menu and content well.

## Skeleton SAIL
```sail
/* labelPosition: "COLLAPSED" on every display field — mostly omitted below for brevity */
a!headerContentLayout(
  header: {},                              /* dark "Thatcher." top bar is site chrome, not SAIL */
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(                    /* ── icon rail ── */
          contents: {
            a!cardLayout(height: "AUTO", style: "#232020",
                         marginBelow: "NONE", showBorder: false),   /* top spacer */
            a!cardLayout(/* rail cell: tachometer/"My Dashboard", style "#232020" — see excerpt 1 */),
            a!cardLayout(/* ACTIVE cell: home/"Properties", style "#990000" */)
            /* ×4 more cells: street-view/Customers, university/Lending,
               line-chart/Performance, users/Team — all "#232020" */,
            a!cardLayout(height: "EXTRA_TALL", style: "#232020",
                         marginBelow: "NONE", showBorder: false)    /* ×2, full-height fill */
          },
          width: "EXTRA_NARROW",
          showWhen: not(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }))
        ),
        a!columnLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(            /* ── menu column ── */
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "Properties", labelSize: "MEDIUM",
                              labelColor: "STANDARD", divider: "NONE",
                              contents: {
                                a!buttonArrayLayout(
                                  buttons: {
                                    a!buttonWidget(label: "New Listing", icon: "plus-circle",
                                                   size: "LARGE", width: "FILL", style: "SOLID")
                                  },
                                  align: "START"
                                )
                              }
                            )
                          },
                          style: "NONE", padding: "STANDARD",
                          marginBelow: "NONE", showBorder: false
                        ),
                        a!cardLayout(      /* active menu row */
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(item: a!richTextDisplayField(value: { "   " }),
                                                 width: "MINIMIZE"),   /* literal-space gutter */
                                a!sideBySideItem(item: a!richTextDisplayField(value: {
                                  a!richTextIcon(icon: "user-circle-o", color: "ACCENT",
                                                 size: "MEDIUM_PLUS") }), width: "MINIMIZE"),
                                a!sideBySideItem(item: a!richTextDisplayField(value: { "  " }),
                                                 width: "MINIMIZE"),
                                a!sideBySideItem(item: a!richTextDisplayField(value: {
                                  a!richTextItem(text: { "My Listings" }, color: "ACCENT",
                                                 size: "MEDIUM", style: { "STRONG" }) },
                                  preventWrapping: true), width: "AUTO")
                              },
                              alignVertical: "MIDDLE", spacing: "DENSE", marginBelow: "NONE"
                            )
                          },
                          link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                          style: "NONE", padding: "LESS", marginBelow: "NONE", showBorder: false
                        )
                        /* ×3 more rows: sun-o/"New Listings", search/"Search Listings",
                           handshake-o/"Sold Properties" — icon color "SECONDARY", text "#666666" */,
                        a!cardLayout(height: "EXTRA_TALL", style: "NONE",
                                     marginBelow: "NONE", showBorder: false)   /* ×2 */
                      },
                      style: "NONE", padding: "NONE", marginBelow: "NONE", showBorder: false
                    )
                  },
                  width: "NARROW_PLUS",
                  showWhen: not(a!isPageWidth({ "PHONE" }))
                ),
                a!columnLayout(            /* ── content well ── */
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardGroupLayout(
                          cards: {
                            a!cardLayout(  /* listing card, ×5 total */
                              contents: {
                                a!billboardLayout(/* photo + TOP tag overlay — see excerpt 2 */),
                                a!cardLayout(
                                  contents: {
                                    /* price|days SBS + specs/address — see excerpt 3 */
                                  },
                                  style: "NONE", padding: "STANDARD",
                                  marginBelow: "NONE", showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO", style: "NONE", shape: "ROUNDED",
                              padding: "NONE", marginBelow: "STANDARD"
                            )
                            /* ×4 more listing cards — tags: #38761d "OPEN HOUSE SCHEDULED" ×2,
                               #cc0000 "NO OFFERS RECEIVED", #3c78d8 "PRICE REDUCED" */
                          },
                          cardWidth: "NARROW_PLUS"
                        )
                      },
                      style: "#f0f0f0", padding: "MORE",
                      marginBelow: "STANDARD", showBorder: false
                    )
                  }
                )
              },
              spacing: "NONE", stackWhen: { "NEVER" }, showDividers: true
            )
          }
        )
      },
      spacing: "NONE", stackWhen: { "NEVER" }
    )
  },
  backgroundColor: "TRANSPARENT",
  contentsPadding: "NONE"
)
```

## Full source
`sail/sources/real-estate-property-list.sail` (896 lines) — load only if emulating this page end-to-end. Note: the preview image and source drifted on row-2 card order; trust the source.
