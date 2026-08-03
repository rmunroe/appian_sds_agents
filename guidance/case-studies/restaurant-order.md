# Restaurant order (POS / self-order)

**Pattern**: [lists-and-grids](../patterns/lists-and-grids.md) — POS/self-order two-pane variant: media card grid to browse + persistent summary pane that never scrolls away.

## Scenario
- Persona: counter staff at a POS terminal (daily-operator) or self-order kiosk customer (occasional).
- Domain: casual Japanese restaurant; consumer food-app register (closer to DoorDash than enterprise).
- Ranked tasks: 1. browse menu, add items 2. verify itemized order, pay 3. set order type and switch categories.

## Data model
MenuCategory ×5 1—* MenuItem(title, description, price, imageUrl); Order(#12138, type ∈ {Dine In, To Go, Delivery}) 1—* OrderLine(item, qty, lineTotal): Edamame ×1 $6.99, Agedashi Tofu ×2 $17.00; Charges(subtotal $23.99, discount 5% −$1.19, tip $5.00, tax $1.67, total $29.47).

## Skeleton
```
PANE (a!paneLayout — full-height, independently scrolling panes)
├─ PANE[left] bg=GRAY
│  ├─ HEADING "Menu" LARGE SEMI_BOLD + date MEDIUM
│  └─ TABS ×5 contentsPadding=NONE (active underline = theme default)
│     └─ CARD-GROUP cardWidth=NARROW (6 cards, wraps 4+2)
│        └─ CARD(shadow, ROUNDED, no border): photo FIT → title MEDIUM → desc → SBS price MEDIUM_PLUS | "+" OUTLINE
└─ PANE[right] width=MEDIUM_PLUS bg=white
   ├─ HEADING "Order #12138" MEDIUM SEMI_BOLD
   ├─ TAGS ×3 order type (selected=ACCENT, else #FFF)
   ├─ COLUMNS [AUTO:XN:XN] "Item|Quantity|Price" + horizontalLine
   ├─ CARD(TRANSPARENT h=TALL pad=NONE) line items ×2 (avatar+name | qty | total)
   ├─ COLUMNS totals (Sub total / Discount+tag / Tip / Tax | right-aligned amounts)
   ├─ horizontalLine + COLUMNS "Total | $29.47" MEDIUM_PLUS STRONG
   └─ BUTTON SOLID FILL icon=credit-card "Continue to payment"
```
Density 3: 6 product cards + 5 tabs + ~10-row receipt per viewport; rendered pane split ≈2:1.

## Palette (code-verified unless marked est.)
| role | value | applied to |
|---|---|---|
| browse pane bg | token "GRAY" — renders ≈#f2f2f2 (est.) | left pane only; makes shadowed white cards the figure |
| accent | token "ACCENT" — renders violet ≈#5c3fc2 (est.) | selected order-type tag, "5% off" tag, active-tab underline, "+" OUTLINE buttons, payment button. From site theme, never a hex here |
| unselected tag | #FFF (hard-coded) | order-type tags at rest — weak affordance on white; prefer a token |
| dead param | #000000 `decorativeBarColor` | receipt card — renders nothing; do not copy |
| right pane / cards | default white #ffffff (est.) | order pane, menu cards |
| text | ≈#222222 (est.) | default STANDARD |

No semantic colors anywhere — even the discount is an ACCENT tag, not red.

## Signature moves
1. Instead of one scrolling page → `a!paneLayout`: GRAY browse pane + white `width: "MEDIUM_PLUS"` order pane; the running total and CTA stay pinned while the menu scrolls.
2. Instead of radio buttons for order type → tagField as segmented control: each `a!tagItem` gets `link: a!dynamicLink(value: fv!index, saveInto: local!selectedTag)` and a conditional ACCENT background.
3. Instead of a menu table → appetite-first photo cards via `a!cardGroupLayout(cardWidth: "NARROW")`; cards are `showShadow: true, showBorder: false, shape: "ROUNDED"` so shadow, not border, does the lifting.
4. Instead of square SAIL images → CDN-side corner rounding: Unsplash `w=1000&h=700&mask=corners&corner-radius=25` (L33 et al.) — imageField has no radius param, so the asset pipeline supplies it.
5. Instead of "Add to cart" labels → icon-only `a!buttonWidget(icon: "plus", style: "OUTLINE")` in an EXTRA_NARROW column, middle-aligned against the MEDIUM_PLUS price (add an accessible label in production; source has none).
6. Instead of a cart grid → printed-ticket receipt: right-aligned EXTRA_NARROW qty/price columns mirrored in header and rows, separated by `a!horizontalLine`s, capped by "Total" MEDIUM_PLUS STRONG.

## Boring twin (what a lazy build would do — avoid this)
One white page with a category dropdown, an a!gridField of menu items with "Add" links, a second grid for the cart, and totals as plain label/value pairs — zero appetite appeal, cart lost on scroll.

## Annotated SAIL excerpts
Source: guidance/sail/sources/restaurant-order.sail.

### tagField as a segmented control (L158–179)
```sail
a!tagField(
  tags: {
    a!forEach(
      items: { "Dine In", "To Go", "Delivery" },
      expression: {
        a!tagItem(
          text: fv!item,
          link: a!dynamicLink(
            value: fv!index,
            saveInto: local!selectedTag
          ),
          backgroundColor: if(
            local!selectedTag = fv!index,
            "ACCENT",
            "#FFF"
          )
        )
      }
    )
  },
  marginBelow: "MORE"
)
```
Tags become a stateful in-place switcher: the link writes `fv!index` into `local!selectedTag` (declared `local!selectedTag: 1`, L2) and the background flips ACCENT/white. Cost: hard-coded "#FFF" bypasses theming and unselected tags on white have weak affordance.

### Independent scroll regions — pane split + fixed-height line-item card (L3–5, 148–150, 508 and L217, 357–364)
```sail
a!paneLayout(                       /* full-height split; each pane scrolls on its own */
  panes: {
    a!pane(contents: { /* menu browse */ }, backgroundColor: "GRAY"),
    a!pane(contents: { /* order receipt */ }, width: "MEDIUM_PLUS")
  }
)
```
```sail
a!cardLayout(                       /* wraps the order line-item rows */
  contents: { /* line-item columnsLayouts ×2 */ },
  marginBelow: "STANDARD",
  height: "TALL",                   /* fixed height ⇒ region scrolls when order grows */
  style: "TRANSPARENT",
  showBorder: false,
  padding: "NONE",
  decorativeBarColor: "#000000"     /* dead param — renders no bar; omit */
)
```
Two nested scroll tricks: paneLayout keeps browse and receipt in parallel scroll contexts (task 2 never scrolls away), and the TRANSPARENT `height: "TALL"` padding-NONE card caps the line-item region so a long order scrolls inside the receipt instead of pushing Total and the payment button off-screen. Stacked panes + this fixed height will crowd PHONE — the analysis flags it.

### Price + icon-only add button row (L86–126, condensed)
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!sideBySideLayout(
        items: {
          a!sideBySideItem(item: a!richTextDisplayField(
            value: a!richTextItem(text: fv!item.price, size: "MEDIUM_PLUS"),
            marginAbove: "LESS", marginBelow: "NONE"
          ))
        },
        alignVertical: "BOTTOM"
      )
    }),
    a!columnLayout(
      contents: {
        a!buttonArrayLayout(
          buttons: { a!buttonWidget(icon: "plus", style: "OUTLINE") },
          marginAbove: "LESS", marginBelow: "NONE"
        )
      },
      width: "EXTRA_NARROW"
    )
  },
  marginBelow: "NONE", alignVertical: "MIDDLE", spacing: "DENSE"
)
```
The card's action row: price grows, the "+" hugs the right edge in an EXTRA_NARROW column; DENSE spacing + margins "LESS/NONE" keep the row tight to the card bottom. Circular button shape and ALL-CAPS button text elsewhere are theme defaults, not per-component styling.

### Receipt pseudo-table without a grid (L180–216)
```sail
a!columnsLayout(                    /* header row */
  columns: {
    a!columnLayout(contents: { a!richTextDisplayField(value: "Item") }),
    a!columnLayout(contents: { a!richTextDisplayField(value: "Quantity", align: "RIGHT") },
                   width: "EXTRA_NARROW"),
    a!columnLayout(contents: { a!richTextDisplayField(value: "Price", align: "RIGHT") },
                   width: "EXTRA_NARROW")
  },
  marginBelow: "NONE"
),
a!horizontalLine(marginAbove: "STANDARD", marginBelow: "NONE")
/* every line-item row repeats the same AUTO | EXTRA_NARROW | EXTRA_NARROW columns
   (avatar+name+price | qty | line total), so figures stay column-aligned (L219–356) */
```
No grid component: identical column shapes in header and rows plus horizontalLines read like a printed ticket, and right-aligned EXTRA_NARROW columns keep every figure flush.

## Skeleton SAIL
```sail
/* labelPosition: "COLLAPSED" on every display field — mostly omitted below for brevity */
a!localVariables(
  local!selectedTag: 1,
  a!paneLayout(
    panes: {
      a!pane(                                    /* ── left: menu browse ── */
        backgroundColor: "GRAY",
        contents: {
          a!headingField(text: "Menu", size: "LARGE", fontWeight: "SEMI_BOLD"),
          a!richTextDisplayField(value: a!richTextItem(text: "Tuesday, 24 Feb 2025", size: "MEDIUM")),
          a!tabLayout(
            contentsPadding: "NONE",
            tabs: {
              a!tabItem(
                label: "Appetizers",
                contents: {
                  a!cardGroupLayout(
                    marginAbove: "STANDARD",
                    cardWidth: "NARROW",
                    cards: a!forEach(
                      items: {
                        a!map(title: "Edamame", description: "…", price: "$6.99",
                              image: "https://…&w=1000&h=700&mask=corners&corner-radius=25&crop=center")
                        /* ×5 more items: Gyoza, Agedashi Tofu, Seaweed Salad,
                           Chicken Karaage, Takoyaki */
                      },
                      expression: a!cardLayout(
                        contents: {
                          a!imageField(images: a!webImage(source: fv!item.image),
                                       size: "FIT", marginBelow: "LESS"),
                          a!headingField(text: fv!item.title, size: "MEDIUM",
                                         marginBelow: "EVEN_LESS"),
                          a!richTextDisplayField(value: fv!item.description,
                                                 marginBelow: "EVEN_LESS"),
                          a!columnsLayout(/* price | "+" button — see excerpt 3 */)
                        },
                        showShadow: true, showBorder: false,
                        padding: "STANDARD", shape: "ROUNDED"
                      )
                    )
                  )
                }
              ),
              a!tabItem(label: "Sushi")
              /* ×3 more: Rice Bowls, Noodles, Desserts */
            }
          )
        }
      ),
      a!pane(                                    /* ── right: persistent order ── */
        width: "MEDIUM_PLUS",
        contents: {
          a!headingField(text: "Order #12138", size: "MEDIUM",
                         fontWeight: "SEMI_BOLD", marginBelow: "NONE"),
          a!tagField(/* order-type segmented control — see excerpt 1 */),
          a!columnsLayout(/* "Item | Quantity | Price" header — see excerpt 4 */),
          a!horizontalLine(marginAbove: "STANDARD", marginBelow: "NONE"),
          a!cardLayout(                          /* fixed-height line-item region */
            height: "TALL", style: "TRANSPARENT", showBorder: false,
            padding: "NONE", marginBelow: "STANDARD",
            contents: {
              a!columnsLayout(
                alignVertical: "MIDDLE", marginAbove: "MORE", marginBelow: "MORE",
                columns: {
                  a!columnLayout(contents: {
                    a!sideBySideLayout(
                      alignVertical: "MIDDLE",
                      items: {
                        a!sideBySideItem(width: "MINIMIZE",
                          item: a!imageField(images: a!webImage(source: "https://…"),
                                             size: "SMALL_PLUS", style: "AVATAR")),
                        a!sideBySideItem(item: {
                          a!headingField(text: "Edamame", size: "SMALL"),
                          a!richTextDisplayField(value: "$6.99")
                        })
                      }
                    )
                  }),
                  a!columnLayout(width: "EXTRA_NARROW", contents: {
                    a!richTextDisplayField(value: a!richTextItem(text: "1", size: "MEDIUM"),
                                           align: "RIGHT") }),
                  a!columnLayout(width: "EXTRA_NARROW", contents: {
                    a!richTextDisplayField(value: a!richTextItem(text: "$6.99", size: "MEDIUM"),
                                           align: "RIGHT") })
                }
              )
              /* ×1 more line-item row, same shape: Agedashi Tofu | 2 | $17.00 */
            }
          ),
          a!columnsLayout(                       /* totals block */
            marginAbove: "STANDARD",
            columns: {
              a!columnLayout(contents: {
                a!richTextDisplayField(value: a!richTextItem(text: "Sub total", size: "MEDIUM")),
                a!sideBySideLayout(alignVertical: "MIDDLE", items: {
                  a!sideBySideItem(width: "MINIMIZE",
                    item: a!richTextDisplayField(value: a!richTextItem(text: "Discount",
                          size: "MEDIUM"), marginBelow: "NONE")),
                  a!sideBySideItem(item: a!tagField(tags: {
                    a!tagItem(text: "5% off", backgroundColor: "ACCENT") }))
                }),
                a!richTextDisplayField(value: a!richTextItem(text: "Tip", size: "MEDIUM")),
                a!richTextDisplayField(value: a!richTextItem(text: "Tax", size: "MEDIUM"))
              }),
              a!columnLayout(contents: {
                /* "$23.99", "-$1.19", "$5.00", "$1.67" — each MEDIUM, align: "RIGHT" */
              })
            }
          ),
          a!horizontalLine(),
          a!columnsLayout(
            marginAbove: "STANDARD",
            columns: {
              a!columnLayout(contents: {
                a!richTextDisplayField(value: a!richTextItem(text: "Total", size: "MEDIUM_PLUS")) }),
              a!columnLayout(contents: {
                a!richTextDisplayField(value: a!richTextItem(text: "$29.47", size: "MEDIUM_PLUS",
                                       style: "STRONG"), align: "RIGHT") })
            }
          ),
          a!buttonArrayLayout(
            marginAbove: "MORE", marginBelow: "NONE", align: "CENTER",
            buttons: {
              a!buttonWidget(label: "Continue to payment", width: "FILL",
                             icon: "credit-card", style: "SOLID")
            }
          )
        }
      )
    }
  )
)
```

## Full source
`sail/sources/restaurant-order.sail` (512 lines) — load only if emulating this page end-to-end.
