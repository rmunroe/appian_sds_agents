# Insurance Quote Wizard — Final Quote Step (INSURECORP funnel)

**Pattern**: [Forms](../patterns/forms.md) — wizard variant, the results/decision step (6 of 6). The step chassis — `choose(local!stepNumber)` machinery, vertical stepper build, brand bar, footer slab — is dissected in [ins-quote-wizard-1.md](ins-quote-wizard-1.md); this file covers only the final branch. Source is the SAME file rendered at branch 4 (`.sail` byte-identical to wizard-1's).

## Scenario

- **Persona**: occasional-customer / first-time-public — anonymous consumer at the decision moment of the acquisition funnel; one visit, high drop-off risk.
- **Domain**: direct-to-consumer P&C carrier "INSURECORP", Geico/Progressive-style flow; plum/magenta brand.
- **Ranked tasks**: 1. Decide on the $113.50/mo offer (purchase). 2. Audit what the price includes; edit anything wrong. 3. Defer gracefully: email the quote to self.

## Data model

Quote{premium $113.50/mo, discounts: 3 → −$42.90/mo, vehicles: 1, drivers: 1, email}; Coverage 1..* per quote {name, per-person limit, per-accident limit} ×4 — Bodily Injury 50k/100k, UM/UIM 50k/100k, Property Damage 75k, Medical Payments 25k/50k. UI state: `local!showSaveForLater` (price-card mode flag).

## Skeleton

```
HEADER-CONTENT bg=#333 contentsPadding=NONE (page in header slot; contents:{})
├─ CARD(brand bar: logo + [ENGLISH|ESPAÑOL], style=#73245d)      ← see wizard-1
├─ COLUMNS [empty:NARROW_PLUS:WIDE:empty] margins=EVEN_MORE
│  ├─ WIZARD-STEP 6/6 vertical rail: 6 TINY ACCENT stamps + connectors (desktop-only)
│  └─ content column:
│     ├─ "Here's your personalized quote" LARGE
│     ├─ CARD(price fork, border, decorativeBar TOP ACCENT)
│     │  └─ SBS $113.50 /Month | PURCHASE NOW | – or – | SAVE FOR LATER
│     │     (in-place swap → price | email field | SEND QUOTE | ✕)
│     ├─ "Auto Insurance" MEDIUM
│     ├─ CARD(link) ×3: "3 discounts $42.90/mo →" · "1 vehicle →" · "1 driver →"
│     ├─ CARD(link, "Coverage" + angle-down, marginBelow=NONE)   ← accordion header
│     └─ CARD(4× SECTION divider=BELOW: name + limits + EDIT)    ← accordion body
├─ CARD(spacer, h=SHORT_PLUS)
└─ CARD(footer legal, style=#333, h=TALL) — below fold
```

Density 2 — one decision on screen, ~9 content blocks per viewport, EVEN_MORE margins. Register: energetic-consumer + institutional. Everything above the fold except spacer/footer. The content column is the sibling ins-quote-review page's coverage column re-skinned into the wizard chassis (same $113.50 quote, same row grammar).

## Palette (code-verified unless marked est.)

| role | hex | applied to |
|---|---|---|
| brand bar | `#73245d` | top slab (style param) |
| page base / footer | `#333` | headerContentLayout backgroundColor + footer card — below fold here |
| work area | white via `style: "NONE"` | rail + content band |
| accent | token `ACCENT` (≈#af2b9b est.; never a hex in code) | all 6 stamp fills, price-card top bar, SOLID CTA fill, OUTLINE CTA border/text |
| savings green | `#38761d` (L2525) | the single "$42.90/mo" amount — only third color on the branch |
| muted | `#666666` | secondary text (rail labels use STANDARD sizes, STRONG only on "Quote") |
| vestigial | `#056CF2` | footer decorativeBarColor, position "NONE" — dead |

White-on-ACCENT ≈5.8:1 (est.) — passes AA with little margin. Row icons/chevrons stay near-black (`color: "STANDARD"`).

## Signature moves

1. Instead of a "success" hero → the price sits in the page's ONLY decorated card: `showBorder: true, showShadow: false, decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT"`, directly under the LARGE title.
2. Instead of navigating away → "Save for Later" swaps the price card's contents in place: two `a!sideBySideLayout`s with complementary `showWhen: not(local!showSaveForLater)` / `showWhen: local!showSaveForLater`; a `times-circle` icon with `a!dynamicLink(value: false, …)` cancels back.
3. Purchase vs. defer as a true fork → same accent, SOLID vs. OUTLINE, "– or –" rich text between; hesitation gets a sanctioned path instead of abandonment.
4. Instead of a read-only table → category rows are `a!cardLayout(link:)`; the Coverage row flips its chevron to `angle-down-bold` and butts against the detail card via `marginBelow: "NONE"` — a faked, always-open accordion.
5. Limits as a ledger → four `a!sectionLayout(divider: "BELOW")` blocks, name STRONG over plain limit lines, right-pinned `Edit` buttons (`style: "OUTLINE", color: "SECONDARY"`).
6. Receipt of effort → all six rail stamps render ACCENT at this step (vs. grey futures on earlier steps); current-step cue is the STRONG "Quote" label only.

## Boring twin (what a lazy build would do — avoid this)

A white formLayout titled "Quote Summary" with a read-only key-value grid of coverages, total at the bottom, gray Back/Submit bottom-left, discounts in a footnote, progress as "Step 6 of 6" text.

## Annotated SAIL excerpts

Source: [../sail/sources/ins-quote-wizard-2.sail](../sail/sources/ins-quote-wizard-2.sail) — branch 4 of the `choose()` spans L1899–2952. Step machinery, stepper build, brand bar, and footer excerpts: see [ins-quote-wizard-1.md](ins-quote-wizard-1.md) (identical file).

**1. The price fork card with in-place save-for-later swap (L2349–2484, condensed)**

```sail
a!cardLayout(
  contents: {
    a!sideBySideLayout(                        /* state A: buy-or-defer */
      alignVertical: "MIDDLE",
      showWhen: not(local!showSaveForLater),
      items: {
        a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
          value: {
            a!richTextItem(
              text: { a!richTextItem(text: { "$113.50" }, style: { "STRONG" }), " " },
              size: "LARGE"),
            a!richTextItem(text: { "/ Month" }, size: "MEDIUM")
          })),
        a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(
          align: "START", marginBelow: "NONE",
          buttons: { a!buttonWidget(label: "Purchase Now", size: "LARGE", style: "SOLID") })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "– or –" }, size: "MEDIUM") })),
        a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(
          align: "START", marginBelow: "NONE",
          buttons: { a!buttonWidget(label: "Save for Later", value: true,
            saveInto: local!showSaveForLater, size: "LARGE", style: "OUTLINE") }))
      }
    ),
    a!sideBySideLayout(                        /* state B: email capture */
      alignVertical: "MIDDLE",
      showWhen: local!showSaveForLater,
      items: {
        /* same $113.50 + "/ Month" price item */
        a!sideBySideItem(item: a!textField(label: "Your email address",
          labelPosition: "COLLAPSED", placeholder: "Your email address",
          saveInto: {}, refreshAfter: "UNFOCUS")),
        a!sideBySideItem(width: "MINIMIZE", item: a!buttonArrayLayout(
          align: "START", marginBelow: "NONE",
          buttons: { a!buttonWidget(label: "Send Quote", icon: "envelope-o",
            size: "LARGE", style: "OUTLINE") })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED", tooltip: "Cancel",
          value: { a!richTextIcon(icon: "times-circle",
            link: a!dynamicLink(value: false, saveInto: local!showSaveForLater),
            linkStyle: "STANDALONE") }))
      }
    )
  },
  height: "AUTO", style: "NONE", padding: "STANDARD", marginBelow: "STANDARD",
  showBorder: true, showShadow: false,
  decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT"
)
```

One card, two states: the paired `showWhen` on a boolean local swaps buy-fork for email-capture without modal or navigation — the price stays put in both, so the anchor never leaves the eye. The ✕ is a rich-text icon link (`linkStyle: "STANDALONE"`), not a button. Known risk: neither sideBySideLayout sets `stackWhen`, so the 4-item row squeezes on narrow widths.

**2. Faking an accordion: link-row butted to detail card (L2667–2724 head, condensed)**

```sail
a!cardLayout(                                  /* header row: "Coverage" */
  contents: {
    a!sectionLayout(label: "", divider: "NONE", marginBelow: "NONE", contents: {
      a!sideBySideLayout(alignVertical: "MIDDLE", items: {
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextIcon(icon: "umbrella", size: "MEDIUM_PLUS") })),
        a!sideBySideItem(width: "AUTO", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { "Coverage" }, size: "MEDIUM") })),
        a!sideBySideItem(width: "MINIMIZE", item: a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: { a!richTextItem(text: { a!richTextIcon(icon: "angle-down-bold") },
            color: "STANDARD", size: "MEDIUM", style: { "STRONG" }) }))
      })
    })
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  height: "AUTO", style: "NONE",
  marginBelow: "NONE",                         /* ← the accordion join */
  showShadow: false
),
a!cardLayout(                                  /* body: 4 coverage sections */
  contents: { /* excerpt 3 */ },
  height: "AUTO", style: "NONE", marginBelow: "STANDARD"
)
/* the 3 rows above it (L2491–2666) are the same shape with angle-right-bold,
   marginBelow "STANDARD", values "3 discounts $42.90/mo #38761d STRONG" ·
   "1 vehicle" · "1 driver" */
```

The "expanded" state is purely typographic and spatial: down-chevron instead of right, and `marginBelow: "NONE"` welds the header row to the body card so the pair reads as one open panel. Siblings keep `marginBelow: "STANDARD"` and right chevrons — implying they'd open the same way.

**3. The coverage ledger row: STRONG name, plain limits, quiet Edit (L2720–2757; ×4 to 2870)**

```sail
a!sectionLayout(
  label: "",
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(text: { "Bodily Injury Liability" }, style: { "STRONG" }),
              char(10),
              "$50,000/person",
              char(10),
              "$100,000/accident"
            })),
        a!sideBySideItem(width: "MINIMIZE",
          item: a!buttonArrayLayout(align: "START", marginBelow: "NONE",
            buttons: { a!buttonWidget(label: "Edit", style: "OUTLINE",
              color: "SECONDARY") }))
      },
      alignVertical: "TOP"
    )
  },
  divider: "BELOW"
)
/* ×3 more: UM/UIM BI 50k/100k · Property Damage $75,000/accident ·
   Medical Payments 25k/50k — the last uses divider: "NONE" */
```

A three-line rich text block (STRONG name + `char(10)` limit lines) beats a labeled field pair; `alignVertical: "TOP"` keeps the Edit button on the name line; SECONDARY-outline keeps four Edits from competing with Purchase Now.

**4. Final-step stepper state (delta only — build in wizard-1 excerpt 2; rail L1969–2332)**

At branch 4 every stamp is `backgroundColor: "ACCENT"` (piggy-bank through clipboard-check) and only the "Quote" label is STRONG, `accessibilityText: "Current Step (6 of 6)"` (L2312–2324). Two shipped defects to avoid: several completed-step *stamps* still say `accessibilityText: "Future Step"` (labels say "Completed Step (n of 6)"), and with all fills identical the current-step cue is bold text alone — keep fill or ring distinct for the current step.

## Skeleton SAIL

Branch 4's content column only — brand bar, rail, spacer, and footer are the chassis shown in [ins-quote-wizard-1.md](ins-quote-wizard-1.md).

```sail
/* choose() branch 4: a!headerContentLayout(header: { brand bar,
   white work-area card { COLUMNS [empty : NARROW_PLUS rail : WIDE ↓ : empty],
   marginAbove/Below "EVEN_MORE", stackWhen incl. DESKTOP_NARROW; spacer SHORT_PLUS },
   footer slab #333 TALL }, contents: {}, backgroundColor: "#333",
   contentsPadding: "NONE") */
a!columnLayout(
  contents: {
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextItem(text: { "Here's your personalized quote" },
        size: "LARGE") },
      marginBelow: "MORE"),
    /* price fork card — excerpt 1 (border + ACCENT top bar,
       paired-showWhen buy/defer ↔ email states) */
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextItem(text: { "Auto Insurance" }, size: "MEDIUM") }),
    a!cardLayout(                        /* linked summary row ×3 */
      contents: {
        a!sectionLayout(label: "", marginBelow: "NONE", contents: {
          a!sideBySideLayout(alignVertical: "MIDDLE", items: {
            /* icon MINIMIZE | label AUTO | (money MINIMIZE) | chevron MINIMIZE:
               hand-holding-usd "3 discounts" + "$42.90/mo" #38761d STRONG ·
               car "1 vehicle" · user-friends "1 driver" — all angle-right-bold */
          })
        })
      },
      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
      height: "AUTO", style: "NONE", marginBelow: "STANDARD"),
    /* Coverage header row, marginBelow "NONE" — excerpt 2 */
    a!cardLayout(                        /* accordion body */
      contents: {
        /* ×4 coverage sections — excerpt 3; divider "BELOW", last "NONE" */
      },
      height: "AUTO", style: "NONE", marginBelow: "STANDARD")
  },
  width: "WIDE"
)
```

## Full source

`sail/sources/ins-quote-wizard-2.sail` — load only if emulating end-to-end (set `local!stepNumber: 4` to land on this branch; the shipped default `2` renders the wizard-1 step). Byte-identical to `ins-quote-wizard-1.sail`.
