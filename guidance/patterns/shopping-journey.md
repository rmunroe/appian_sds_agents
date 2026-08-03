# Online Shopping Journey

Flow anatomy for browse → detail → cart → checkout → confirm — officially "familiar eCommerce
patterns for apps where users browse, select, and check out items," covering retail goods and
non-retail items (services, permits, certificates).

## When this pattern

- A catalog of items users select, configure, and commit to, with a cart or an equivalent staged
  commitment; success = funnel completion.
- Every stage must answer: what is this item, what does it cost, what happens next.

Nearest alternatives: [Portals](portals.md) — service directory with no cart at all ·
[Visitor landing pages](landing-pages-visitor.md) — the acquisition page *before* the catalog ·
record views — one item, no purchase path.

Flow map (each stage is one page or in-page state):
```
retail:     category listing → item details (+ cart rail) → checkout → confirmation
non-retail: directory → item details/config → [gate: questionnaire] → checkout
```

## Anatomy

Stage skeletons (CODE-VERIFIED except the gated-config stage, which has no SAIL on the page).

**1 · Category listing** — density 2, photography-led; "click on a card to navigate to the
corresponding item details page" (official):
```
HEADER-CONTENT bg=WHITE contentsPadding=NONE
└─ COLUMNS [AUTO : EXTRA_NARROW]            ← dedicated cart-chip column, upper right (official)
   └─ COLUMNS [NARROW nav | AUTO]
      ├─ search field + category link-list (active marker glyph, invisible on siblings)
      └─ SECTION h1 (labelSize=LARGE_PLUS, labelHeadingTag=H1)
         ├─ toolbar: sort ▾ + type ▾ + pager ▾ "1 of 3" + Show All safeLink
         └─ GRID(2-col) CARD(padding NONE: BILLBOARD h=MEDIUM_PLUS + overlay tag,
              name MEDIUM, price STANDARD STRONG)
```

**2 · Item details + cart** — breadcrumbs return to the listing; the cart expands in place and ✕
restores the minimized chip (both official):
```
COLUMNS [AUTO detail | MEDIUM cart]
├─ breadcrumbs (safeLinks + "/" separators)
├─ COLUMNS spacing=SPARSE [gallery | config]
│  ├─ BILLBOARD h=EXTRA_TALL + 3 thumbnail CARDs (BILLBOARD SHORT, padding EVEN_LESS)
│  └─ H1 + price MEDIUM_PLUS + radio CARDS options + qty stepper + ADD TO CART (OUTLINE LARGE)
└─ cart rail: band-header CARD + bordered receipt CARD(h=EXTRA_TALL:
     line items, taxes/shipping, total, CHECK OUT SOLID FILL)
```

**3 · Checkout** — "multiple steps into one page": completing Delivery collapses it to a concise
summary and auto-expands Payment (official):
```
COLUMNS [empty | WIDE_PLUS | empty]         ← centered via empty flanking columns
└─ H1 + COLUMNS [form | MEDIUM summary]
   ├─ BAND delivery → collapsed summary CARD (2-line icon-prefixed prose + EDIT OUTLINE SECONDARY)
   ├─ BAND payment  → expanded form CARD (card fields, billing radio CARDS default "same as shipping")
   └─ BAND order summary → receipt CARD (line item, taxes, shipping, total, PLACE ORDER SOLID LARGE FILL)
```

Cross-stage rules:
- **The cart is a layout state, not an overlay**: minimized icon + count chip in its own
  EXTRA_NARROW column ⇄ expanded MEDIUM rail. The expanded cart shows the same math as checkout —
  trust built early.
- **Button hierarchy inversion**: the funnel outranks the page. Add to Cart is OUTLINE; the only
  SOLID button on any stage is the money action (Check Out / Place Order), adjacent to the total
  it commits.
- **Band headers**: a filled band card with icon + all-caps label titles each panel (cart,
  delivery, payment, order summary) — one visual language across the whole journey.
- **Label grammar**: noun form for places ("Checkout page"), verb form for actions
  ("Check out now") (official).

## Variants

- **Retail (photo-led)**: billboard photo cards; merchandising tags float on imagery via
  `a!fullOverlay(alignVertical:"TOP")` in deliberately non-semantic hues; gallery detail page with
  selectable thumbnails.
- **Non-retail directory**: for citizen/employee portals "where retail-style features, such as
  product photos and filtering, are not appropriate" (official). Photo grid → icon tiles (centered
  icon LARGE_PLUS + label MEDIUM); a popular-services 2×2 shelf serves the majority path; category
  rail of flush cards (`marginBelow:"NONE"`) with a solid-fill selected state; header = dark band
  card + `a!headingField(size:"LARGE_PLUS", fontWeight:"LIGHT", headingTag:"H1")`.
- **Non-retail config**: decision-ladder form ordered by dependency (who → type → how many →
  start); radio CARDS with the price inside the label ("Short Form ($25)") so comparison happens
  in the selector; micro-explainer notes attached to each decision; a "you will need" preflight
  panel in a MEDIUM sidebar.
- **Gated item**: when an item "cannot simply be added to the shopping cart," a required
  questionnaire "can be launched in place of adding selected items directly to the cart"
  (official) — the CTA becomes START QUESTIONNAIRE (OUTLINE + directional icon: a flow begins,
  not a submit).

## Component roster

[card-layout](../components/card-layout.md) (product tiles as links, receipt cards, band headers) ·
[billboard-layout](../components/billboard-layout.md) (product imagery + overlay tags) ·
[columns-layout](../components/columns-layout.md) (stage grids, cart-chip column, centering) ·
[inputs](../components/inputs.md) (radio CARDS, dropdown toolbar, stepper field) ·
[buttons](../components/buttons.md) (OUTLINE page actions vs one SOLID funnel action) ·
[tags](../components/tags.md) (merchandising overlays) ·
[section-layout](../components/section-layout.md) (H1 titling, receipt-row dividers) ·
[images](../components/images.md) (cart thumbnails, size SMALL).

## Layout decisions by data shape

- **Catalog size**: 2-col photo grid at density 2; pagination as a dropdown ("1 of 3") + Show All
  link, not a pager bar. ~10 categories → nav rail; 4-item popular shelf covers the 80% path.
- **Options per item**: 1–4 choices → radio CARDS (`choiceLayout:"COMPACT"` for short labels,
  `"STACKED"` for priced descriptions). Quantity → stepper recipe: minus button (SMALL, OUTLINE,
  SECONDARY, `disabled` at floor) + bare integerField + plus button.
- **Receipt math**: rows via `a!sectionLayout(divider:"BELOW")`; Total typography inverts — value
  MEDIUM_PLUS STRONG outranks its MEDIUM STRONG label.
- **Cart lines**: thumbnail SMALL + "Qty:1 @ price" SMALL SECONDARY + remove icon; lock the rail
  (`height:"EXTRA_TALL"`) so line count doesn't pump the layout.
- **Payment rows**: side-by-side widths `2X` + default + an empty item as spacer for exp/CVV
  sizing; "mm/yy" placeholder. Caveat (CODE-VERIFIED corpus flaw): integerField for card numbers
  strips leading zeros and blocks spaces — use masked text in real builds.
- **Fold**: each stage should fit one viewport; a multi-item cart breaks this — collapse completed
  stages aggressively and keep summaries to 2 lines.

## Mobile behavior

- Listing and detail stack via `stackWhen: PHONE, TABLET_PORTRAIT, TABLET_LANDSCAPE,
  DESKTOP_NARROW` (CODE-VERIFIED).
- Stack order: nav → title/toolbar → product grid; on detail: gallery → config → cart rail. The
  cart lands last when stacked — default it to the minimized chip on phone.
- Checkout's flanking empty columns collapse; the WIDE_PLUS column goes full width; the summary
  stacks under the active stage — keep PLACE ORDER beside the total, not orphaned.
- The 2-col product grid linearizes to one card per row; thumbnails keep `spacing:"DENSE"`.

## Top 3 don'ts

1. **Don't hide the cart behind a header icon + badge** (the corpus boring twin). Give it
   architecture: a chip in its own EXTRA_NARROW column when minimized, a MEDIUM rail when open.
2. **Don't make Add to Cart the SOLID button.** One SOLID per page = the funnel action;
   page-local actions stay OUTLINE. Boring twin: solid ADD TO CART beside a shouting price.
3. **Don't rebuild checkout as a multi-page wizard** with a milestone bar and finished forms
   re-shown read-only. Stages live on one page; completed ones collapse to icon-prefixed prose +
   EDIT, and the next auto-expands.

## Exemplars

| case study | what to steal |
|---|---|
| [restaurant-order](../case-studies/restaurant-order.md) | Browse pane + live receipt pane for pick-and-review flows; segmented control built from link-tags |
| [real-estate-property-list](../case-studies/real-estate-property-list.md) | Tag-on-billboard overlay for status-on-imagery; tinted padded well that lifts white item cards |
| [ins-quote-review](../case-studies/ins-quote-review.md) | Review-before-commit page: drill-in rows as `a!cardLayout(link:)` with trailing chevron; full-bleed header-slot banding |
