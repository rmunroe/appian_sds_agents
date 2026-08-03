# Conference Home Page (ESG World 2023)

**Pattern**: [Visitor landing pages](../patterns/landing-pages-visitor.md) — billboard-hero variant with editorial zig-zag body; density 1, photography-led, single CTA.

## Scenario

- **Persona**: prospective attendee — sustainability/ESG professional or exec; first-time-public, visits once or twice, decides, registers.
- **Domain**: "ESG World 2023" — global environmental/social/governance conference, Copenhagen + online. Premium, nature-forward; gold-on-cream restraint rather than eco-green cliché.
- **Ranked tasks**: 1. Register. 2. Absorb what/when/where (dates, city, hybrid option). 3. Switch language / skim attendees and topics.

## Data model

Static marketing content, no records or grids: Conference (name, year, dates "25–27 April, 2023", venue "Copenhagen, Denmark", hybrid flag) · ContentSection (eyebrow, heading, body, image, side) ×2 · Language ×8.

## Skeleton

```
HEADER-CONTENT bg=#f8f6f0
├─ BILLBOARD h=EXTRA_TALL (TALL_PLUS phone) overlay=full,top,style=NONE (SEMI_LIGHT phone)
│  │        media=photo(wind turbine in fog) fallback-bg=#f0f0f0 marginBelow=EVEN_MORE
│  ├─ COLUMNS [NARROW_PLUS:AUTO] — logo | SBS ×9 language links, spacing=SPARSE, right-aligned
│  └─ COLUMNS [EXTRA_NARROW:MEDIUM_PLUS:AUTO] — spacer | hero copy + CTA | empty
└─ SECTION "none" (centered editorial band)
   ├─ COLUMNS [AUTO:MEDIUM_PLUS:MEDIUM_PLUS:AUTO] marginBelow=EVEN_MORE — "ATTENDEES" text | photo
   └─ COLUMNS [AUTO:MEDIUM_PLUS:MEDIUM_PLUS:AUTO] marginBelow=EVEN_MORE — photo | "TOPICS" text (mirrored)
```

Above the fold: the entire billboard — logo, 8-language row, value-prop paragraph, dates, location, register CTA — nothing else. Hero copy stays MEDIUM_PLUS; there is no EXTRA_LARGE anywhere on the page (CODE-VERIFIED restraint) — the photo does the emotional work.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| page background | `#f8f6f0` | headerContentLayout backgroundColor — continues the photo's warm cast past the fold |
| billboard fallback | `#f0f0f0` | billboardLayout backgroundColor behind the photo |
| ink | `#111111` | language links (body text uses default STANDARD) |
| accent gold | theme `ACCENT` → #deaf3e (est.) | Register button (`style:"SOLID"`), "ATTENDEES"/"TOPICS" eyebrows — gold is theme-supplied, never a hex in the expression |
| logo gold | #dfc675 (est.) | gold tree logo image |
| photo fog | #d8c8bc (est.) | pale hero region that doubles as the text backdrop (art direction, not code) |

Three gold touchpoints total (logo, CTA, eyebrows); everything else is near-black on cream/photo. No semantic colors, no charts, no icons.

## Signature moves

1. Instead of the default dark billboard scrim → type sits raw on the photo's pale fog, via `a!fullOverlay(style: "NONE")` with a phone-only fallback `if(a!isPageWidth({"PHONE"}), "SEMI_LIGHT", "NONE")`. Only works with an art-directed pale region.
2. Instead of default white below the hero → cream continues the photo's temperature, via `backgroundColor: "#f8f6f0"` on the headerContentLayout — no hard white break at the fold.
3. Instead of a nav component or dropdown → 8 language links as plain `a!richTextItem(linkStyle: "STANDALONE", color: "#111111")` in a sideBySideLayout, right-aligned by an empty desktop-only first item; the active locale is marked purely by `style: {"STRONG", "UNDERLINE"}`.
4. Instead of hard-coding brand gold → `style: "SOLID"` on the button and `color: "ACCENT"` on eyebrows lean on the site theme; the pill shape and all-caps "REGISTER NOW" are theme/product rendering of the plain label "Register Now".
5. Instead of labeled sectionLayouts → gold all-caps STRONG eyebrows ("ATTENDEES", "TOPICS") mark sections; rows are centered by empty flanking columnLayouts and mirror image side per row (zig-zag).
6. Instead of cards and borders → zero boxes anywhere; hierarchy comes from the photograph's size, one saturated CTA, and inline STRONG on "Environmental/Social/Governance" and the date.

## Boring twin (what a lazy build would do — avoid this)

White page, dark site header, "ESG World 2023" as a LARGE heading, stock photo in a bordered cardLayout, three stacked bordered sections, blue "Register" button. Same content, every zone boxed, DARK overlay with white text.

## Annotated SAIL excerpts

Source: [../sail/sources/conference-home-page.sail](../sail/sources/conference-home-page.sail) (line refs below).

**1. Responsive billboard shell — height + scrim flip together (L3–14, L285–290)**

```sail
a!billboardLayout(
  backgroundMedia: a!webImage(source: "https://…turbine-in-fog…"),
  backgroundColor: "#f0f0f0",
  height: if(a!isPageWidth({ "PHONE" }), "TALL_PLUS", "EXTRA_TALL"),
  marginBelow: "EVEN_MORE",
  overlay: a!fullOverlay(
    alignVertical: "TOP",
    contents: { /* top bar + hero copy, below */ },
    style: if(a!isPageWidth({ "PHONE" }), "SEMI_LIGHT", "NONE")
  )
)
```

The page's riskiest choice: no scrim on desktop (ink text on the photo's fog), with a shorter hero AND a SEMI_LIGHT scrim added only on phone, where the crop can't guarantee a pale backdrop.

**2. Empty desktop-only sideBySideItem as right-aligner; typography-as-state (L51–76, condensed)**

```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(   /* contentless + desktop-only: absorbs width, pushes links right */
      showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" })
    ),
    a!sideBySideItem(
      item: a!richTextDisplayField(
        labelPosition: "COLLAPSED",
        value: {
          a!richTextItem(
            text: { "ENGLISH" },
            link: a!dynamicLink(),
            linkStyle: "STANDALONE",
            color: "#111111",
            style: { "STRONG", "UNDERLINE" }   /* active locale — the only state marker */
          )
        }
      ),
      width: "MINIMIZE"
    )
    /* ×8 more language items, same shape, without STRONG/UNDERLINE */
  },
  spacing: "SPARSE"
)
```

A nav bar built from nothing but rich-text links: the empty first item is the alignment trick; selection state is typographic, not chrome.

**3. Hero copy positioned with layout primitives only (L202–283, condensed)**

```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}, width: "EXTRA_NARROW"),   /* left indent rail */
    a!columnLayout(
      contents: {
        a!richTextDisplayField(   /* desktop-only vertical push into the fog band */
          labelPosition: "COLLAPSED",
          value: { char(10), char(10) },
          showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" }),
          marginAbove: "NONE", marginBelow: "NONE"
        ),
        /* value-prop paragraph, "25–27 April, 2023", "Copenhagen, Denmark" —
           all MEDIUM_PLUS, key phrases inline STRONG, marginAbove: "EVEN_MORE" */
        a!buttonArrayLayout(
          buttons: { a!buttonWidget(label: "Register Now", size: "LARGE", style: "SOLID") },
          align: "START"
        )
      },
      width: "MEDIUM_PLUS"
    ),
    a!columnLayout(contents: {})   /* flexible right gutter keeps copy left-of-center */
  }
)
```

SAIL has no absolute positioning: the copy block is placed with an EXTRA_NARROW spacer column, an empty flex column, and `char(10)` line breaks (brittle under zoom/screen readers — a knowing trade). The button's gold and pill come from the theme.

**4. Centered editorial band — empty flanks, eyebrow, mirrored twin (L294–349)**

```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),   /* empty flank centers the band */
    a!columnLayout(
      contents: {
        a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "ATTENDEES" }, color: "ACCENT", style: { "STRONG" }) }),
        a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "Top Experts from around the Globe" },
            color: "STANDARD", size: "MEDIUM_PLUS") }),
        a!richTextDisplayField(labelPosition: "COLLAPSED", value: { /* body copy */ })
      },
      width: "MEDIUM_PLUS"
    ),
    a!columnLayout(
      contents: {
        a!imageField(labelPosition: "COLLAPSED",
          images: { a!webImage(source: "…", altText: "…") },
          size: "FIT", isThumbnail: false, style: "STANDARD")
      },
      width: "MEDIUM_PLUS"
    ),
    a!columnLayout(contents: {})    /* empty flank */
  },
  marginBelow: "EVEN_MORE",
  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
)
/* second band (L351–407): same shape, mirrored — photo first, "TOPICS" text second */
```

No sectionLayout, no card: section identity is the gold caps eyebrow; centering is `[flex : MEDIUM_PLUS : MEDIUM_PLUS : flex]`; the zig-zag is just swapping which middle column holds the image.

## Skeleton SAIL

```sail
a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundMedia: a!webImage(source: "https://…turbine-in-fog…"),
      backgroundColor: "#f0f0f0",
      height: if(a!isPageWidth({ "PHONE" }), "TALL_PLUS", "EXTRA_TALL"),
      marginBelow: "EVEN_MORE",
      overlay: a!fullOverlay(
        alignVertical: "TOP",
        contents: {
          /* ── top bar: logo | language rail ── */
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!imageField(
                    labelPosition: "COLLAPSED",
                    images: { a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE()) },
                    size: if(
                      a!isPageWidth({ "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" }),
                      "MEDIUM", "FIT"
                    ),
                    isThumbnail: false, style: "STANDARD"
                  )
                },
                width: "NARROW_PLUS"
              ),
              a!columnLayout(
                contents: {
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(   /* empty right-aligner, desktop only */
                        showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" })
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: { a!richTextItem(text: { "ENGLISH" }, link: a!dynamicLink(),
                            linkStyle: "STANDALONE", color: "#111111",
                            style: { "STRONG", "UNDERLINE" }) }
                        ),
                        width: "MINIMIZE"
                      )
                      /* ×8 more language items (简体中文 … 日本語), same shape, plain */
                    },
                    spacing: "SPARSE"
                  )
                }
              )
            },
            alignVertical: "MIDDLE",
            stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" }
          ),
          /* ── hero copy block ── */
          a!columnsLayout(
            columns: {
              a!columnLayout(contents: {}, width: "EXTRA_NARROW"),
              a!columnLayout(
                contents: {
                  a!richTextDisplayField(labelPosition: "COLLAPSED",
                    value: { char(10), char(10) },
                    showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" }),
                    marginAbove: "NONE", marginBelow: "NONE"),
                  a!richTextDisplayField(labelPosition: "COLLAPSED", marginAbove: "EVEN_MORE",
                    value: {
                      a!richTextItem(size: "MEDIUM_PLUS", text: {
                        "ESG World is the most important global gathering … on ",
                        a!richTextItem(text: { "Environmental" }, style: { "STRONG" }),
                        /* ", Social, and Governance topics." — same inline-STRONG shape */
                        ""
                      })
                    }),
                  a!richTextDisplayField(labelPosition: "COLLAPSED", marginAbove: "EVEN_MORE",
                    value: { a!richTextItem(text: { "25–27 April, 2023" },
                      size: "MEDIUM_PLUS", style: { "STRONG" }) }),
                  a!richTextDisplayField(labelPosition: "COLLAPSED", marginBelow: "MORE",
                    value: {
                      a!richTextItem(text: { "Copenhagen, Denmark" }, size: "MEDIUM_PLUS"),
                      char(10),
                      a!richTextItem(text: { "And online worldwide" }, size: "MEDIUM"),
                      char(10)
                    }),
                  a!buttonArrayLayout(
                    buttons: { a!buttonWidget(label: "Register Now", size: "LARGE", style: "SOLID") },
                    align: "START"
                  )
                },
                width: "MEDIUM_PLUS"
              ),
              a!columnLayout(contents: {})
            }
          )
        },
        style: if(a!isPageWidth({ "PHONE" }), "SEMI_LIGHT", "NONE")
      )
    )
  },
  contents: {
    /* ── editorial band 1: eyebrow+heading+body | photo ── */
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!richTextDisplayField(labelPosition: "COLLAPSED",
              value: { a!richTextItem(text: { "ATTENDEES" }, color: "ACCENT", style: { "STRONG" }) }),
            a!richTextDisplayField(labelPosition: "COLLAPSED",
              value: { a!richTextItem(text: { "Top Experts from around the Globe" },
                color: "STANDARD", size: "MEDIUM_PLUS") }),
            a!richTextDisplayField(labelPosition: "COLLAPSED", value: { "…body copy…" })
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!imageField(labelPosition: "COLLAPSED",
              images: { a!webImage(source: "…", altText: "…") },
              size: "FIT", isThumbnail: false, style: "STANDARD")
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(contents: {})
      },
      marginBelow: "EVEN_MORE",
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }
    )
    /* ── editorial band 2 (L351–407): identical shape, mirrored —
         photo column first, "TOPICS" eyebrow + text second ── */
  },
  backgroundColor: "#f8f6f0"
)
```

## Full source

`sail/sources/conference-home-page.sail` — load only if emulating this page end-to-end.
