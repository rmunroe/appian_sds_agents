# Portal home page (Boreas Foundation)

**Pattern**: [portals](../patterns/portals.md) — public landing/marketing variant: billboard hero with in-hero nav, then stacked full-bleed content bands.

## Scenario
- Persona: prospective donor, first-time public visitor; visits rarely, one decision — care, then give.
- Domain: "Boreas Foundation," Antarctic conservation NGO; cinematic-documentary brand (monochrome photography, tracked-out white type, one gold accent).
- Ranked tasks: 1. absorb the cause ("Antarctica needs help") 2. donate via one-screen quick-pick 3. explore the org (How to Help / Our Story / Contact Us).

## Data model
Static marketing content — no records, no grids: Organization(name, logo); NavTab ×4; Pillar ×3 (photo, icon, title, body: Conservation / Research / Education); GiftAmount ×6 ($5–$250 + Other, $25 preselected); FooterLink ×7.

## Skeleton
```
HEADER-CONTENT contentsPadding=NONE
├─ BILLBOARD h=EXTRA_TALL (≈610px) media=monochrome peak photo overlay=full,SEMI_DARK
│  ├─ COLUMNS [NARROW_PLUS:flex:MEDIUM_PLUS] — logo | spacer | TABS ×4 (transparent cards, white)
│  └─ "A N T A R C T I C A   N E E D S   H E L P" EXTRA_LARGE white centered (char(10)×9 push-down)
├─ CARD(band #f3f3f3, padding=MORE) SECTION "What We Do"
│  ├─ gold rule (empty EXTRA_NARROW card, decorativeBar TOP=ACCENT) + "What We Do" LARGE centered
│  └─ CARD-GROUP cardWidth=NARROW ×3 — each: BILLBOARD h=SHORT + TINY stamp + MEDIUM STRONG title + centered body
├─ CARD(band #fcfcfc, padding=MORE) — donation COLUMNS [1:1]: heading + radio CARDS + Donate | bordered photo
└─ CARD(band #111, decorativeBar TOP #351c75) — footer: logo | links ×4 | links ×3
```
Density 1 (marketing-airy): hero ≈58% of the first viewport; every band centers a WIDE_PLUS column between empty flex columns.

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| billboard fallback | #f0f0f0 | all four billboards (hero + 3 pillar photos) |
| band 1 | #f3f3f3 (bar #efefef) | "What We Do" band card |
| band 2 | #fcfcfc (bar #efefef) | donation band card |
| band 3 | #111 (bar #351c75) | footer band card |
| hero text | #ffffff | nav tab labels + headline (hard-coded richTextItem color) |
| accent | theme "ACCENT" — renders gold #eac251 (est.) | section rule, "Start Helping Today" START bar, Donate SOLID button. Never hard-coded in the expression |
| body text | #222222 (est.) | pillar titles/body (default STANDARD color) |

Color discipline: gold appears exactly twice above the fold (logo gradient, section rule); all else is white-on-photo or near-black-on-gray, saving the accent for the donate flow.

## Signature moves
1. Instead of a site header bar → nav lives inside the hero photo: TRANSPARENT borderless `a!cardLayout` tabs with white MEDIUM rich text and `link: a!dynamicLink(...)`, placed in the billboard's `a!fullOverlay(style: "SEMI_DARK")`.
2. Instead of a tab-underline text style → the selected indicator is a hand-drawn underline: an empty `a!cardLayout(showBorder: true)` in an EXTRA_NARROW column under the label, with state mirrored into `accessibilityText`.
3. Instead of one white page → three full-bleed bands: self-colored cards (#f3f3f3 → #fcfcfc → #111) butt-joined with `marginBelow: "NONE"` under `contentsPadding: "NONE"`.
4. Instead of thumbnail `a!imageField`s in bordered boxes → flush-media pillar cards: shell `padding: "NONE"` + inner `a!billboardLayout(height: "SHORT", marginBelow: "NONE")` + padded TRANSPARENT inner card; icon as TINY TRANSPARENT `a!stampField` (the ring is the stamp's own rendering).
5. Instead of a LARGE left-aligned title → letter-spaced all-caps headline (literal spaces: "A N T A R C T I C A …") pushed into the lower hero by char(10)×9, size stepped EXTRA_LARGE → LARGE_PLUS → LARGE per breakpoint via `showWhen: a!isPageWidth(...)`.
6. Instead of a labeled gift-amount dropdown → `a!radioButtonField(choiceLayout: "COMPACT", choiceStyle: "CARDS")` quick-pick with $25 preselected, followed by one LARGE SOLID Donate button.

## Boring twin (what a lazy build would do — avoid this)
A dark site-header bar with left logo and default tabs; "Antarctica Needs Help" as a LARGE left-aligned title on white; three bordered sectionLayouts with thumbnail imageFields and left-aligned text; a labeled dropdown for gift amount; stacked footer links on white.

## Annotated SAIL excerpts
Source: guidance/sail/sources/portal-home-page.sail.

### Card-as-tab nav with hand-drawn underline (L44–97, condensed)
```sail
a!cardLayout(                            /* whole tab = one link target */
  contents: {
    a!cardLayout(
      contents: {
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: a!richTextItem(text: { "Welcome" }, color: "#ffffff",
                                size: "MEDIUM", style: { "STRONG" }),
          preventWrapping: true, align: "CENTER"
        )
      },
      height: "AUTO", style: "TRANSPARENT", padding: "LESS",
      marginBelow: "NONE", showBorder: false,
      accessibilityText: "Navigation Tab (Selected)"
    ),
    a!columnsLayout(                     /* the "underline" */
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!cardLayout(contents: {}, height: "AUTO", style: "NONE",
                         padding: "NONE", marginBelow: "NONE", showBorder: true)
          },
          width: "EXTRA_NARROW"
        ),
        a!columnLayout(contents: {})
      },
      spacing: "NONE", stackWhen: { "NEVER" }
    )
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  height: "AUTO", style: "TRANSPARENT", padding: "NONE",
  marginBelow: "NONE", showBorder: false
)
```
The underline is an empty bordered card centered by flex columns — a card border, not a text style. Unselected tabs (L100–207) are the same card minus the columns block; selection state lives only in `accessibilityText`.

### Breakpoint-gated headline with char(10) positioning (L219–242)
```sail
a!richTextDisplayField(
  labelPosition: "COLLAPSED",
  value: {
    char(10), char(10), char(10), char(10), char(10),
    char(10), char(10), char(10), char(10),      /* push type into lower hero */
    a!richTextItem(
      text: { "A N T A R C T I C A   N E E D S   H E L P" },
      color: "#ffffff",
      size: "EXTRA_LARGE"
    )
  },
  showWhen: a!isPageWidth({ "DESKTOP_WIDE" }),
  align: "CENTER",
  marginAbove: "EVEN_MORE"
)
/* three siblings repeat the block: DESKTOP → LARGE_PLUS (L243); DESKTOP_NARROW/
   TABLET → LARGE (L267); PHONE → char(10)×4 + color "STANDARD" (L297) */
```
Tracking is literal spaces in the string; vertical placement is a char(10) stack. Brittle (screen readers announce blank lines; the PHONE variant's `color: "STANDARD"` risks contrast on the darkened photo) — but it is how this page places type deep inside a billboard overlay.

### Centered accent rule from a decorative bar (L327–348)
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),
    a!columnLayout(
      contents: {
        a!cardLayout(
          contents: {},
          height: "AUTO", style: "TRANSPARENT",
          marginBelow: "NONE", showBorder: false,
          decorativeBarPosition: "TOP"     /* bar takes the theme ACCENT */
        )
      },
      width: "EXTRA_NARROW"
    ),
    a!columnLayout(contents: {})
  },
  marginAbove: "MORE", marginBelow: "NONE", stackWhen: { "NEVER" }
)
```
A short centered gold rule above "What We Do": an empty transparent card whose only visible piece is its decorative bar. It renders gold #eac251 (est.) via the theme — the hex is not in the expression.

### Flush-media pillar card (L360–410, condensed)
```sail
a!cardLayout(
  contents: {
    a!billboardLayout(                     /* photo bleeds to card edges */
      backgroundMedia: a!webImage(source: "https://…"),
      backgroundColor: "#f0f0f0", height: "SHORT", marginBelow: "NONE"
    ),
    a!cardLayout(                          /* padded text block */
      contents: {
        a!stampField(icon: "leaf", backgroundColor: "TRANSPARENT",
                     contentColor: "STANDARD", size: "TINY", align: "CENTER"),
        a!richTextDisplayField(value: a!richTextItem(text: { "Conservation" },
          size: "MEDIUM", style: { "STRONG" }), align: "CENTER"),
        a!richTextDisplayField(value: { "…body copy…" }, align: "CENTER")
      },
      height: "AUTO", style: "TRANSPARENT", padding: "STANDARD",
      marginBelow: "NONE", showBorder: false
    )
  },
  height: "AUTO", style: "NONE", padding: "NONE", marginBelow: "MORE"
)
```
Edge-to-edge card media = `padding: "NONE"` shell + inner SHORT billboard (an imageField would leave a gutter). The billboards, not imageFields, are what make the three color photos land after the grayscale hero.

## Skeleton SAIL
```sail
/* labelPosition: "COLLAPSED" on every display field — mostly omitted below for brevity */
a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundMedia: a!webImage(source: "https://…monochrome-antarctic-peak…"),
      backgroundColor: "#f0f0f0",
      height: "EXTRA_TALL",
      marginBelow: "NONE",
      overlay: a!fullOverlay(
        style: "SEMI_DARK",
        contents: {
          a!columnsLayout(                    /* nav row inside the hero */
            columns: {
              a!columnLayout(
                contents: { a!imageField(/* logo; size: PHONE/TABLET_PORTRAIT ? "MEDIUM" : "FIT" */) },
                width: "NARROW_PLUS"
              ),
              a!columnLayout(contents: {}),   /* flex spacer pushes tabs right */
              a!columnLayout(
                contents: {
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(contents: { /* selected tab card — see excerpt 1 */ })
                      /* ×3 more tabs: "How to Help", "Our Story", "Contact Us" —
                         same link-card, no underline block, accessibilityText "…(Not Selected)" */
                    },
                    alignVertical: "TOP", spacing: "NONE"
                  )
                },
                width: "MEDIUM_PLUS"
              )
            },
            alignVertical: "MIDDLE",
            stackWhen: { "PHONE", "TABLET_PORTRAIT" }
          ),
          a!richTextDisplayField(/* headline, DESKTOP_WIDE variant — see excerpt 2 */)
          /* ×3 more headline variants gated by a!isPageWidth */
        }
      )
    )
  },
  contents: {
    a!cardLayout(                             /* ── band 1: "What We Do" ── */
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),     /* flex | WIDE_PLUS | flex centering shell */
            a!columnLayout(
              contents: {
                a!columnsLayout(/* centered accent rule — see excerpt 3 */),
                a!richTextDisplayField(
                  value: a!richTextItem(text: { "What We Do" }, size: "LARGE"),
                  align: "CENTER", marginBelow: "MORE"
                ),
                a!cardGroupLayout(
                  cards: {
                    a!cardLayout(/* pillar card "Conservation" — see excerpt 4 */)
                    /* ×2 more pillars: microscope/"Research", chalkboard-teacher/"Education" */
                  },
                  cardWidth: "NARROW"
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
        )
      },
      height: "AUTO", style: "#f3f3f3", padding: "MORE",
      marginBelow: "NONE", showBorder: false, decorativeBarColor: "#efefef"
    ),
    a!cardLayout(                             /* ── band 2: donation ── */
      contents: {
        /* same flex | WIDE_PLUS | flex centering shell; inside it, COLUMNS [1:1]: */
        a!columnsLayout(
          columns: {
            a!columnLayout(
              contents: {
                a!cardLayout(                 /* heading with accent side-bar */
                  contents: { a!sideBySideLayout(/* "Start Helping Today" LARGE */) },
                  height: "AUTO", style: "TRANSPARENT", padding: "NONE",
                  marginBelow: "MORE", showBorder: false,
                  decorativeBarPosition: "START", decorativeBarColor: "ACCENT"
                ),
                a!radioButtonField(
                  choiceLabels: { "$5", "$25", "$50", "$100", "$250", "Other" },
                  choiceValues: { 1, 2, 3, 4, 5, 6 },
                  labelPosition: "COLLAPSED", value: 2, saveInto: {},
                  choiceLayout: "COMPACT", choiceStyle: "CARDS"
                ),
                a!buttonArrayLayout(
                  buttons: {
                    a!buttonWidget(label: "Donate", icon: "hands-helping",
                                   size: "LARGE", style: "SOLID")
                  },
                  align: "START", marginAbove: "MORE"
                )
              }
            ),
            a!columnLayout(
              contents: {
                a!cardLayout(                 /* bordered photo, no padding */
                  contents: { a!imageField(images: a!webImage(source: "https://…"), size: "FIT") },
                  height: "AUTO", style: "TRANSPARENT", padding: "NONE",
                  marginBelow: "NONE", showBorder: true, showShadow: false
                )
              }
            )
          },
          marginAbove: "EVEN_MORE", marginBelow: "EVEN_MORE",
          stackWhen: { "PHONE", "TABLET_PORTRAIT" }
        )
      },
      height: "AUTO", style: "#fcfcfc", padding: "MORE",
      marginBelow: "NONE", showBorder: false, decorativeBarColor: "#efefef"
    ),
    a!cardLayout(                             /* ── band 3: footer ── */
      contents: {
        /* centering shell; inside: logo column (width: "AUTO", a!imageField size "MEDIUM")
           + two NARROW_PLUS columns of a!linkField(a!safeLink(...)) ×4 and ×3,
           stackWhen: { "PHONE", "TABLET_PORTRAIT" } */
      },
      height: "AUTO", style: "#111", padding: "MORE",
      marginBelow: "NONE", showBorder: false,
      decorativeBarPosition: "TOP", decorativeBarColor: "#351c75"
    )
  },
  contentsPadding: "NONE"
)
```

## Full source
`sail/sources/portal-home-page.sail` (786 lines) — load only if emulating this page end-to-end.
