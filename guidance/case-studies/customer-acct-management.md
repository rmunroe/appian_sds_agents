# Customer Account Management (INSURECORP "My Account")

**Pattern**: [Record views](../patterns/record-views.md) — tabbed self-service variant: the customer's own record as a portal home (Overview\* | Claims | Preferences), rare tasks demoted to tabs.

## Scenario

- **Persona**: occasional-customer — auto policyholder ("Jane", primary insured) checking her account monthly or less; not an operator.
- **Domain**: consumer P&C insurance ("INSURECORP" fictional carrier); bank-blue self-service portal, bank-statement tone for money and coverage.
- **Ranked tasks**: 1. Confirm next payment (amount, date, source, autopay). 2. Review/edit who and what is covered. 3. Jump to claims history or preferences.

## Data model

Account 1—1 PaymentPlan ($123.45, due Jul 1, source "Pine Street Bank xxxx3456", autopay flag + rule text); 1—n InsuredDriver (n=3: name, role PRIMARY/SPOUSE/DEPENDENT CHILD, age, sex); 1—n Vehicle (n=2: year/make/model) 1—n Coverage (type, deductible or per-person/per-incident limits; more via "Show More"); 1—n Claim (own tab).

## Skeleton

```
HEADER-CONTENT bg=#FAFCFF contentsPadding=NONE
├─ CARD(style:#fff, padding:NONE)                       ← header slot
│  └─ CARD("My Account" LARGE_PLUS BOLD, style:#1155cc, padding:MORE)
└─ CARD(style:TRANSPARENT, padding:LESS)
   └─ TABS ×3 (Overview* | Claims | Preferences)
      └─ COLUMNS [MEDIUM_PLUS:WIDE]
         ├─ SECTION "Payment"
         │  └─ CARD(shadow,no-border)
         │     ├─ SECTION "NEXT PAYMENT" → SBS $123.45 | Due July 1 (divider=BELOW)
         │     └─ SECTION "PAYMENT SOURCE" → SBS bank | Edit; SBS TAG(AUTOPAY) + note
         ├─ SECTION "Insured Drivers"
         │  └─ CARD(shadow) → 3× SECTION(role caps) → SBS stamp | name+age | Edit
         └─ SECTION "Vehicles & Coverage"
            └─ CARD(shadow) → 2× SECTION("VEHICLE n") → COLUMNS [name+Edit : 4 coverage fields]
```

Everything fits one desktop viewport; density 3 — three cards, ~15 data values, card `padding: "STANDARD"`, sections `marginBelow: "MORE"`. The only money figure is the first bold value under the first section — task 1 wins top-left. Columns MEDIUM_PLUS:WIDE ≈42:58 (OBSERVED), `stackWhen: {"PHONE", "TABLET_PORTRAIT"}`.

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| brand blue | `#1155cc` | header band card AND the AUTOPAY tag — same hex, one-color discipline |
| header outer | `#fff` | outer header card (padding NONE) framing the band |
| page background | `#FAFCFF` | headerContentLayout backgroundColor — blue-tinted near-white |
| person stamps | `#e12e8b` / `#118bf1` / `#569a38` | driver initial stamps (J/S/B) — the page's only non-brand color |
| card surface | default white | content cards: `style: "NONE"`, `showShadow: true`, `showBorder: false` |
| links | SAIL default blue, #1c6fdc (est., unoverridden) | Edit ×6, Show More ×2 |
| labels/notes | `SECONDARY` token (#6c6c75 est.) | caps eyebrows, autopay rule text |

Top INSURECORP navbar and active-tab underline are site chrome outside this expression. No colored card accents, charts, icons, or photos.

## Signature moves

1. Instead of the default grey page title → full-bleed brand band via card-in-card: outer `#fff` card with `padding: "NONE"` wrapping an inner `#1155cc` card with `padding: "MORE"`, in the header slot, with page `contentsPadding: "NONE"`.
2. Instead of grids for repeated records → stacked `a!sectionLayout`s inside one card as record separators, via the eyebrow register: `labelSize: "SMALL"` + `labelColor: "SECONDARY"` + `labelHeadingTag: "H3"` + authored-caps labels + `divider: "BELOW"`; roles ("PRIMARY", "SPOUSE") are eyebrows, not a "Role" field.
3. Instead of buttons → every action is a quiet "Edit" link (`linkStyle: "STANDALONE"`), right-pinned via `width: "MINIMIZE"` or `align: "RIGHT"` — same lever that pins "Due July 1" opposite $123.45.
4. Instead of a checkbox/boolean → autopay is a filled brand-blue `a!tagItem` fused to its plain-language rule sentence ("Withdraw balance due each month on due date", SECONDARY).
5. Instead of borders → shadow-only cards (`style: "NONE"`, `showShadow: true`, `showBorder: false`) reading as hairline elevation on the `#FAFCFF` tint.
6. One hex, three jobs: `#1155cc` does header band, tag, and (site-chrome) accent; the stamp trio appears only where identity matters — and is decorative (white initials on `#118bf1`/`#569a38` run ~2.5–3:1, so roles stay in text).

## Boring twin (what a lazy build would do — avoid this)

One white column of bordered boxes under a grey "My Account" heading; every value a default labeled field ("Amount: $123.45", "Autopay: Yes"); EDIT buttons on each box; claims dumped below the fold; no tabs, tag, or stamps.

## Annotated SAIL excerpts

Source: [../sail/sources/customer-acct-management.sail](../sail/sources/customer-acct-management.sail) (line refs below).

**1. Card-in-card full-bleed brand band (L2–27, L564–565)**

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!headingField(text: "My Account", marginBelow: "NONE",
              size: "LARGE_PLUS", fontWeight: "BOLD")
          },
          marginBelow: "NONE", height: "AUTO",
          style: "#1155cc", showBorder: false, padding: "MORE"
        )
      },
      marginBelow: "NONE", height: "AUTO",
      style: "#fff", showBorder: false, padding: "NONE"
    )
  },
  contents: { /* … */ },
  backgroundColor: "#FAFCFF",
  contentsPadding: "NONE"
)
```

`contentsPadding: "NONE"` plus a padding-NONE outer card lets the inner `#1155cc` card run edge-to-edge — the brand band is nested cards, not a header component.

**2. The eyebrow-section record grammar + one-line money scan (L45–78)**

```sail
a!sectionLayout(
  label: "NEXT PAYMENT",            /* caps typed into the label string */
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: a!richTextItem(text: "$123.45",
              size: "MEDIUM_PLUS", style: "STRONG"))
        ),
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: a!richTextItem(text: "Due July 1", size: "MEDIUM_PLUS")),
          width: "MINIMIZE"          /* pins the date to the right edge */
        )
      },
      alignVertical: "MIDDLE"
    )
  },
  labelHeadingTag: "H3",
  labelSize: "SMALL",
  labelColor: "SECONDARY",
  divider: "BELOW"
)
```

The card's internal grammar in miniature: small grey caps eyebrow (H3 under the card's H2 outer section — a proper heading tree), bold value, right-pinned secondary value, divider as record separator; amount and due date share one scan line.

**3. Boolean as tag + rule sentence (L111–137)**

```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(
      item: a!tagField(labelPosition: "COLLAPSED",
        tags: {
          a!tagItem(text: "AUTOPAY", backgroundColor: "#1155cc")   /* exact header hex */
        }),
      width: "MINIMIZE"
    ),
    a!sideBySideItem(
      item: a!richTextDisplayField(labelPosition: "COLLAPSED",
        value: a!richTextItem(
          text: "Withdraw balance due each month on due date",
          color: "SECONDARY"))
    )
  },
  alignVertical: "MIDDLE"
)
```

Replaces "Autopay: Yes" — a filled brand tag states the status, the fused SECONDARY sentence states its consequence; tag blue is exactly the header hex.

**4. Driver record row — stamp | stacked fields | right Edit (L165–223, condensed)**

```sail
a!sectionLayout(
  label: "PRIMARY",                  /* role as eyebrow, not a "Role:" field */
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!stampField(labelPosition: "COLLAPSED", text: "J",
            size: "TINY", backgroundColor: "#e12e8b", contentColor: "STANDARD"),
          width: "MINIMIZE"
        ),
        a!sideBySideItem(
          item: {                    /* a sideBySideItem can hold a LIST of fields */
            a!richTextDisplayField(labelPosition: "COLLAPSED",
              value: a!richTextItem(text: "Jane", size: "MEDIUM_PLUS", style: "STRONG")),
            a!richTextDisplayField(labelPosition: "COLLAPSED",
              value: a!richTextItem(text: "44-year-old female", size: "MEDIUM"))
          }
        ),
        a!sideBySideItem(
          item: { /* "Edit" richTextItem, safeLink, linkStyle "STANDALONE", align: "RIGHT" */ }
        )
      },
      marginBelow: "NONE",
      alignVertical: "MIDDLE"
    )
  },
  labelSize: "SMALL", labelColor: "SECONDARY", divider: "BELOW"
)
/* ×2 more: "SPOUSE" ("S" #118bf1), "DEPENDENT CHILD" ("B" #569a38);
   last one: divider "NONE", marginBelow "NONE" */
```

Repeated records without a grid: one section per record, name stacked over age inside a single sideBySideItem, quiet right-aligned Edit link; the last record sets `divider: "NONE"` so no rule trails at the card bottom.

Also (L29–31, L549–562; see skeleton): page `contentsPadding` NONE means a TRANSPARENT card with `padding: "LESS"` re-insets the tab block. Claims/Preferences are stub tabItems and links are placeholder safeLinks — real builds fill or hide the stubs and use record actions.

## Skeleton SAIL

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(              /* full-bleed brand band — excerpt 1 */
      contents: {
        a!cardLayout(
          contents: {
            a!headingField(text: "My Account", marginBelow: "NONE",
              size: "LARGE_PLUS", fontWeight: "BOLD")
          },
          marginBelow: "NONE", height: "AUTO",
          style: "#1155cc", showBorder: false, padding: "MORE"
        )
      },
      marginBelow: "NONE", height: "AUTO",
      style: "#fff", showBorder: false, padding: "NONE"
    )
  },
  contents: {
    a!cardLayout(              /* transparent inset wrapper */
      contents: {
        a!tabLayout(
          tabs: {
            a!tabItem(
              label: "Overview",
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      /* ── left: Payment, Insured Drivers ── */
                      contents: {
                        a!sectionLayout(
                          label: "Payment",
                          contents: {
                            a!cardLayout(
                              contents: {
                                /* eyebrow section "NEXT PAYMENT" (excerpt 2), divider "BELOW";
                                   eyebrow section "PAYMENT SOURCE": SBS bank | Edit MINIMIZE,
                                   SBS AUTOPAY tag (excerpt 3) | SECONDARY rule,
                                   divider "NONE", marginBelow "NONE" */
                              },
                              marginBelow: "STANDARD", height: "AUTO", style: "NONE",
                              showShadow: true, showBorder: false, padding: "STANDARD"
                            )
                          },
                          isCollapsible: false, labelHeadingTag: "H2",
                          marginBelow: "MORE", labelSize: "MEDIUM", labelColor: "STANDARD"
                        ),
                        a!sectionLayout(
                          label: "Insured Drivers",
                          contents: {
                            a!cardLayout(
                              contents: {
                                /* 3× driver eyebrow sections (excerpt 4 shape):
                                   "PRIMARY" J #e12e8b · "SPOUSE" S #118bf1 ·
                                   "DEPENDENT CHILD" B #569a38; last divider "NONE" */
                              },
                              marginBelow: "STANDARD", height: "AUTO", style: "NONE",
                              showShadow: true, showBorder: false, padding: "STANDARD"
                            )
                          },
                          labelHeadingTag: "H2", marginBelow: "MORE",
                          labelSize: "MEDIUM", labelColor: "STANDARD"
                        )
                      },
                      width: "MEDIUM_PLUS"
                    ),
                    a!columnLayout(
                      /* ── right: Vehicles & Coverage ── */
                      contents: {
                        a!sectionLayout(
                          label: "Vehicles & Coverage",
                          contents: {
                            a!cardLayout(
                              contents: {
                                a!sectionLayout(
                                  label: "VEHICLE 1",
                                  contents: {
                                    /* COLUMNS [1:1]:
                                       left — "2021 Polestar 2" MEDIUM_PLUS STRONG,
                                         char(10), "Edit" STANDALONE safeLink;
                                       right — 4 labeled fields (labelPosition "ABOVE"):
                                         Comprehensive "$500 Deductible", Collision,
                                         Bodily Injury (limits via char(10)),
                                         Property Damage + "Show More" link */
                                  },
                                  labelHeadingTag: "H3", labelSize: "SMALL",
                                  labelColor: "SECONDARY", divider: "BELOW"
                                )
                                /* ×1 more: "VEHICLE 2" ("2009 Saab 9-5"),
                                   same shape, divider "NONE", marginBelow "NONE" */
                              },
                              marginBelow: "STANDARD", height: "AUTO", style: "NONE",
                              showShadow: true, showBorder: false, padding: "STANDARD"
                            )
                          },
                          labelHeadingTag: "H2", marginBelow: "MORE",
                          labelSize: "MEDIUM", labelColor: "STANDARD"
                        )
                      },
                      width: "WIDE"
                    )
                  },
                  stackWhen: { "PHONE", "TABLET_PORTRAIT" },
                  marginAbove: "NONE", marginBelow: "NONE"
                )
              }
            ),
            a!tabItem(label: "Claims"),
            a!tabItem(label: "Preferences")
          },
          marginBelow: "NONE", contentsPadding: "STANDARD"
        )
      },
      marginBelow: "NONE", height: "AUTO",
      style: "TRANSPARENT", showBorder: false, padding: "LESS"
    )
  },
  backgroundColor: "#FAFCFF",
  contentsPadding: "NONE"
)
```

## Full source

`sail/sources/customer-acct-management.sail` — load only if emulating this page end-to-end.
