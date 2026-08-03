# Conference Registration Portal (ESG World 2023)

**Pattern**: [Forms](../patterns/forms.md) — single-screen public variant, deliberately NOT the wizard variant: free registration fits one viewport (use the wizard variant when steps are dependent or paid).

## Scenario

- **Persona**: first-time-public — global attendee (sustainability professional/advocate), one-time visit, no login.
- **Domain**: "ESG World 2023," free virtual conference on Environmental/Social/Governance topics. Earthy-premium brand: cream paper tones, gold tree logo, deliberately not corporate blue.
- **Ranked tasks**: 1. Register (6 fields, submit). 2. Switch among 8 languages (incl. RTL Arabic, CJK) without scrolling. 3. Declare interest topics — without making them feel required.

## Data model

Registration(firstName, lastName, email, country[~230 ISO values], organizationName, jobTitle) 1—\* InterestSelection → 10 fixed E/S/G topic Interests (climate/carbon … labor standards); locale ∈ 8 languages.

## Skeleton

```
HEADER-CONTENT bg=#f8f6f0
├─ HEADER: CARD(empty, style=#f8f6f0, desktop-only)          ← invisible top band
└─ COLUMNS [AUTO:NARROW_PLUS:EXTRA_NARROW:WIDE:AUTO] (1st/3rd/5th empty)
   ├─ PANE[left] brand rail: logo (FIT) → intro rich text → SBS ×8 language links, stacked vertically
   │             (+ "Select Language" dropdown, phone/tablet-portrait only)
   └─ PANE[right] FORM
      ├─ SECTION "REGISTER NOW" LARGE/H1, divider BELOW
      ├─ SECTION "YOUR DETAILS" SMALL/H2 → COLUMNS [1:1] ×3 = 6 fields
      ├─ CARD(SECTION "YOUR INTERESTS" SMALL/H3 + GRID(2-col ×5 checkboxes), style=#f2ede1, no border)
      └─ BUTTONS align=END ("Register" SOLID + arrow-right)
```

Everything above the fold: brand, language switch, all fields, interests, submit in one viewport; density 2 — one task, two zones, ~16 inputs, wide empty gutters. "REGISTER NOW" is the only LARGE text and sole H1; form WIDE vs brand NARROW_PLUS — action outweighs identity.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| page tint | `#f8f6f0` | headerContentLayout backgroundColor (L1036) + empty header card (L13) |
| grouping card | `#f2ede1` | interests cardLayout style (L1006) — one step darker, borderless |
| link ink | `#111111` | 8 language links (L110–209) |
| heading/label ink | #222222 (est.) | headings, field labels |
| accent gold | #deaf3e (est., theme) | "Register" submit — SAIL has only `style: "SOLID"` (L1018); gold and pill are theme-supplied |
| logo gold | #d7b23b (est.) | tree logo (placeholder a!EXAMPLE_DOCUMENT_IMAGE) |
| inputs | #ffffff, #dddddd borders (est.) | text fields, dropdowns |
| vestigial | `#1d659c` | `decorativeBarColor` (L1011) — never renders (no decorativeBarPosition); do not copy |

Gold appears exactly twice — logo at entry, button at exit — bookending the Z-path; all else is monochrome ink on cream. No icons besides the button's arrow-right, no photos, no charts.

## Signature moves

1. Instead of a white a!formLayout with chrome → tint the whole page, via `backgroundColor: "#f8f6f0"` plus an empty same-hex header card as a seamless top band.
2. Instead of a bordered fieldset → group the 10 optional checkboxes with a one-step-darker filled card, via `a!cardLayout(style: "#f2ede1", showBorder: false)` — optional-vs-required signaled by tint shift; no borders or shadows anywhere.
3. Instead of a nav dropdown → 8 plain-text dynamicLinks stacked into an editorial rail, via **inverted** `stackWhen: {"DESKTOP_WIDE", "DESKTOP", "DESKTOP_NARROW"}` (stacks on desktop, horizontal on tablet), with a complementary-`showWhen` dropdown for phone/tablet-portrait.
4. Instead of size-matched headings → decouple `labelHeadingTag` from `labelSize`: H1-LARGE "REGISTER NOW", H2-SMALL "YOUR DETAILS", H3-SMALL "YOUR INTERESTS" — a11y-correct heading tree, visually inverted; all-caps typed into the label strings.
5. Instead of a blue Submit bottom-left → gold pill "Register" + `icon: "arrow-right"` at `align: "END"`; current language marked by `style: {"STRONG", "UNDERLINE"}` — typography-as-state, no chrome.
6. Instead of equal panes → brand NARROW_PLUS vs task WIDE, separated by an empty EXTRA_NARROW spacer column inside empty AUTO gutters — the whole frame is data-free columns.

## Boring twin (what a lazy build would do — avoid this)

White a!formLayout, Appian-blue title bar, one column of fields, interests as a bordered checkbox list labeled "Topics," language dropdown in a corner, default blue Submit bottom-left.

## Annotated SAIL excerpts

Source: [../sail/sources/conference-registration-portal.sail](../sail/sources/conference-registration-portal.sail) (line refs below).

**1. Invisible header band — empty card tinted to the page hex (L3–17)**

```sail
a!cardLayout(
  contents: {},
  height: "AUTO",
  showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" }),
  style: "#f8f6f0",        /* same hex as page backgroundColor (L1036) */
  padding: "STANDARD",
  marginBelow: "NONE",
  showBorder: false
)
```

The header slot holds an EMPTY card matching the page tint — a seamless spacer that pushes content down on desktop with no visible chrome.

**2. Two language switchers, complementary showWhen + inverted stackWhen (L62–80, L100–226 condensed)**

```sail
a!dropdownField(                       /* mobile switcher */
  label: "Select Language",
  labelPosition: "COLLAPSED",
  choiceLabels: { "ENGLISH", "简体中文", "हिन्दी", "ESPAÑOL", "FRANÇAIS", "العربية", "DEUTSCHE", "日本語" },
  choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8 },
  value: 1, saveInto: {}, searchDisplay: "AUTO",
  showWhen: a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })
),
a!sideBySideLayout(                    /* desktop editorial rail */
  items: {
    a!sideBySideItem(
      item: a!richTextDisplayField(labelPosition: "COLLAPSED",
        value: { a!richTextItem(text: { "ENGLISH" }, link: a!dynamicLink(),
          linkStyle: "STANDALONE", color: "#111111",
          style: { "STRONG", "UNDERLINE" }) }),     /* active locale */
      width: "MINIMIZE"
    ),
    /* ×7 more language items, same shape, plain */
    a!sideBySideItem()
  },
  showWhen: not(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })),
  spacing: "SPARSE",
  stackWhen: { "DESKTOP_WIDE", "DESKTOP", "DESKTOP_NARROW" }   /* INVERTED */
)
```

The non-obvious core: `stackWhen` listing DESKTOP widths turns a horizontal side-by-side into a vertical rail exactly where the left pane is tall; tablets keep it horizontal, phones swap to the dropdown. Cost: two switchers to maintain.

**3. Heading tag/size decoupling (L233–256)**

```sail
a!sectionLayout(
  label: "REGISTER NOW",
  labelSize: "LARGE",
  labelHeadingTag: "H1",     /* semantics ≠ size: only LARGE text on the page */
  labelColor: "STANDARD",
  contents: {
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { "Registration is free of charge for this year's virtual conference" },
      marginBelow: "STANDARD")
  },
  divider: "BELOW",
  marginAbove: "STANDARD",
  marginBelow: "MORE"
),
a!sectionLayout(
  label: "YOUR DETAILS",
  labelSize: "SMALL",        /* H2 renders SMALLER than H1 — hierarchy by inversion */
  labelHeadingTag: "H2",
  labelColor: "STANDARD",
  contents: { /* 3× two-column field rows */ }
)
```

Screen readers get a correct H1→H2→H3 tree; the eye gets one huge title and quiet caps sub-heads.

**4. Optional inputs grouped by tint, not borders (L839–877, L1005–1011 condensed)**

```sail
a!cardLayout(
  contents: {
    a!sectionLayout(
      label: "YOUR INTERESTS",
      labelSize: "SMALL",
      labelHeadingTag: "H3",
      labelColor: "STANDARD",
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {
              a!checkboxField(labelPosition: "COLLAPSED",
                choiceLabels: { "Climate change and carbon emissions" },
                choiceValues: { 1 }, saveInto: {})
            }),
            a!columnLayout(contents: { /* second checkbox, same shape */ })
          },
          marginAbove: "STANDARD", marginBelow: "STANDARD",
          stackWhen: { "PHONE" }
        )
        /* ×4 more 2-checkbox rows, same shape */
      }
    )
  },
  height: "AUTO",
  style: "#f2ede1",               /* one step darker than #f8f6f0 page = grouping */
  padding: "STANDARD",
  marginAbove: "STANDARD", marginBelow: "STANDARD",
  showBorder: false,
  decorativeBarColor: "#1d659c"   /* vestigial — inert without decorativeBarPosition */
)
```

Each topic is its own single-choice checkboxField so the 2-col grid reflows per row on phone; the darker fill marks "one optional cluster" with zero borders.

**5. The five-column frame — content in 2 of 5 columns (L20–23, L228–231, L1025–1034)**

```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),                          /* empty AUTO gutter */
    a!columnLayout(contents: { /* brand rail */ }, width: "NARROW_PLUS"),
    a!columnLayout(contents: {}, width: "EXTRA_NARROW"),   /* fixed pane gap */
    a!columnLayout(contents: { /* form */ }, width: "WIDE"),
    a!columnLayout(contents: {})                           /* empty AUTO gutter */
  },
  stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" }
)
```

Centering, gutters, and the brand/task gap are all data-free columns; below desktop the frame stacks to one column.

## Skeleton SAIL

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(          /* invisible spacer band, desktop only */
      contents: {},
      height: "AUTO",
      showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" }),
      style: "#f8f6f0", padding: "STANDARD", marginBelow: "NONE", showBorder: false
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),                          /* gutter */
        /* ── brand rail ── */
        a!columnLayout(
          contents: {
            a!imageField(
              labelPosition: "COLLAPSED",
              images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE(),
                altText: "ESG World 2023 Logo") },
              size: if(a!isPageWidth({ "TABLET_LANDSCAPE", "TABLET_PORTRAIT", "PHONE" }),
                "MEDIUM", "FIT"),
              isThumbnail: false,
              align: if(a!isPageWidth({ "TABLET_LANDSCAPE", "TABLET_PORTRAIT", "PHONE" }),
                "START", "CENTER"),
              marginAbove: "LESS", marginBelow: "MORE"
            ),
            a!dropdownField(          /* mobile language switcher */
              label: "Select Language", labelPosition: "COLLAPSED",
              choiceLabels: { "ENGLISH", /* …7 more locales… */ "日本語" },
              choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8 },
              value: 1, saveInto: {}, searchDisplay: "AUTO",
              showWhen: a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })
            ),
            a!richTextDisplayField(   /* intro with inline STRONG on E/S/G words */
              labelPosition: "COLLAPSED",
              value: { "ESG World 2023 is the most important global gathering … ",
                a!richTextItem(text: { "Environmental" }, style: { "STRONG" })
                /* ", Social, and Governance topics." */ },
              marginAbove: "STANDARD", marginBelow: "EVEN_MORE"
            ),
            a!sideBySideLayout(       /* desktop language rail — excerpt 2 */
              items: {
                /* 8× MINIMIZE items: #111111 STANDALONE dynamicLinks,
                   active locale STRONG+UNDERLINE; + trailing empty item */
              },
              showWhen: not(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })),
              spacing: "SPARSE",
              stackWhen: { "DESKTOP_WIDE", "DESKTOP", "DESKTOP_NARROW" }
            )
          },
          width: "NARROW_PLUS"
        ),
        a!columnLayout(contents: {}, width: "EXTRA_NARROW"),   /* pane gap */
        /* ── form pane ── */
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "REGISTER NOW", labelSize: "LARGE", labelHeadingTag: "H1",
              labelColor: "STANDARD",
              contents: {
                a!richTextDisplayField(labelPosition: "COLLAPSED",
                  value: { "Registration is free of charge for this year's virtual conference" },
                  marginBelow: "STANDARD")
              },
              divider: "BELOW", marginAbove: "STANDARD", marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "YOUR DETAILS", labelSize: "SMALL", labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(contents: {
                      a!textField(label: "First Name", labelPosition: "ABOVE",
                        saveInto: {}, refreshAfter: "UNFOCUS")
                    }),
                    a!columnLayout(contents: { /* "Last Name" textField, same shape */ })
                  },
                  marginAbove: "STANDARD", marginBelow: "STANDARD",
                  stackWhen: { "PHONE" }
                )
                /* ×2 more [1:1] rows: Email | Country dropdown (searchDisplay "AUTO",
                   ~230 choiceLabels), Organization Name | Job Title */
              }
            ),
            a!cardLayout(             /* interests cluster — excerpt 4 */
              contents: {
                a!sectionLayout(
                  label: "YOUR INTERESTS", labelSize: "SMALL", labelHeadingTag: "H3",
                  labelColor: "STANDARD",
                  contents: {
                    /* 5× [1:1] checkbox rows, stackWhen PHONE (excerpt 4 shape):
                       Climate change and carbon emissions/Air and water pollution,
                       Biodiversity/Deforestation, Energy efficiency/Water scarcity,
                       Community relations/Gender and diversity,
                       Data protection and privacy/Labor standards */
                  }
                )
              },
              height: "AUTO", style: "#f2ede1", padding: "STANDARD",
              marginAbove: "STANDARD", marginBelow: "STANDARD", showBorder: false
            ),
            a!buttonArrayLayout(
              buttons: { a!buttonWidget(label: "Register", icon: "arrow-right", style: "SOLID") },
              align: "END",
              marginAbove: "STANDARD"
            )
          },
          width: "WIDE"
        ),
        a!columnLayout(contents: {})                           /* gutter */
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" }
    )
  },
  backgroundColor: "#f8f6f0"
)
```

## Full source

`sail/sources/conference-registration-portal.sail` — load only if emulating this page end-to-end.
