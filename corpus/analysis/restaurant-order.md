# Analysis: restaurant-order

## restaurant-order.png

### Identification
- **Image**: restaurant-order.png | **Source page**: restaurant-order (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) restaurant order"
- **Device frame**: desktop (3314x1822 full-page preview)
- **Marker**: neutral
- **UI type**: other — point-of-sale / self-order screen (menu browse + live cart). Tier A, no override.

### Use-case reconstruction (INFERRED)
- **Persona**: counter staff at a POS terminal (daily-operator) or self-order kiosk customer (occasional-customer).
- **Domain & brand context**: casual Japanese restaurant; consumer food-app feel, closer to DoorDash than enterprise.
- **Top 3 user tasks (ranked)**: 1. Browse menu, add items. 2. Verify itemized order, pay. 3. Set order type and switch categories.
- **Implied requirements**: "Running total must stay visible while browsing"; "Adding an item must be one tap from its card"; "Order type must switch in place"; "Charges must be itemized (discount, tip, tax) before payment"; "Categories must switch without reload."
- **Data model sketch** (OBSERVED from labels): MenuCategory (×5) 1—* MenuItem(title, description, price, imageUrl). Order(#12138, type∈{Dine In, To Go, Delivery}) 1—* OrderLine(item, qty, lineTotal): Edamame ×1 $6.99, Agedashi Tofu ×2 $17.00. Charges: subtotal $23.99 (= line sum), discount 5% −$1.19, tip $5.00, tax $1.67, total $29.47.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PANE[left|right]  (a!paneLayout)
├─ PANE[left] bg=GRAY
│  ├─ HEADING "Menu" LARGE + date MEDIUM
│  └─ TABS ×5 (contentsPadding NONE, active=accent underline)
│     └─ CARD-GROUP cardWidth=NARROW (6 cards, wraps 4+2)
│        └─ CARD(photo + title + desc + SBS price|+btn; shadow, ROUNDED, no border)
└─ PANE[right] width=MEDIUM_PLUS bg=white
   ├─ HEADING "Order #12138" MEDIUM
   ├─ TAGS ×3 order-type (selected=ACCENT)
   ├─ COLUMNS [AUTO:XN:XN] "Item|Quantity|Price" + horizontalLine
   ├─ CARD(TRANSPARENT h=TALL pad=NONE) line-items ×2 (avatar|name+price|qty|total)
   ├─ COLUMNS totals (Sub total/Discount+tag/Tip/Tax | right-aligned amounts)
   ├─ horizontalLine + COLUMNS "Total | $29.47" MEDIUM_PLUS STRONG
   └─ BUTTON SOLID FILL "CONTINUE TO PAYMENT" icon=credit-card
```
- **Above the fold**: everything — single-viewport layout, independently scrolling panes; all cards and full receipt visible.
- **Reading order**: two parallel single-columns — F-scan over the card grid, top-to-bottom receipt scan right.
- **Hierarchy rationale**: food photos are each card's largest element — appetite drives task 1; right pane pins Total + solid CTA so task 2 never scrolls away; tabs under the title serve task 3.
- **Density**: 3 — 6 product cards + 5 tabs + ~10-row receipt per viewport, STANDARD card padding, MORE row margins.
- **Ratios & spacing**: rendered pane split ≈2:1 (right pane MEDIUM_PLUS); card padding STANDARD; receipt rows margin MORE; price/+ row spacing DENSE, EXTRA_NARROW button column (all CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED where params exist)
- **Palette**: left pane bg `"GRAY"` token (CODE-VERIFIED; renders ≈#f2f2f2 est.); right pane/cards default white #ffffff (est.); accent `"ACCENT"` token (CODE-VERIFIED; renders violet ≈#5c3fc2 est.); unselected tag bg `"#FFF"` (CODE-VERIFIED); `decorativeBarColor:"#000000"` (CODE-VERIFIED, not rendered); text ≈#222222 (est.). No semantic colors — the discount is an accent tag, not red.
- **Color application points**: accent on active-tab underline, selected order-type tag, "5% off" tag, "+" outline buttons, payment button. GRAY confined to the menu pane; all else neutral.
- **Typography moves** (CODE-VERIFIED): "Menu" LARGE SEMI_BOLD; date MEDIUM; card titles MEDIUM; menu prices MEDIUM_PLUS; "Order #12138" MEDIUM SEMI_BOLD; line-item names SMALL; receipt figures MEDIUM; Total MEDIUM_PLUS STRONG. Button all-caps via theme; code is sentence-case (OBSERVED).
- **Imagery stance**: photos — appetizing 1000×700 food shots, CDN-rounded corners; circular AVATAR thumbnails in the receipt; only two icons (plus, credit-card).
- **Card treatment**: menu cards `showShadow:true, showBorder:false, shape:"ROUNDED", padding:"STANDARD"`; receipt container `style:"TRANSPARENT", showBorder:false, padding:"NONE", height:"TALL"` (both CODE-VERIFIED).
- **Signature moves**: instead of a grid/table menu, photo cards via a!cardGroupLayout(cardWidth:"NARROW"); instead of radio buttons, tagField segmented control via a!dynamicLink + conditional ACCENT; instead of square SAIL images, CDN corner rounding (`mask=corners&corner-radius=25`); instead of labeled "Add" buttons, icon-only OUTLINE plus buttons baseline-aligned to price; instead of one scrolling page, paneLayout GRAY/white split.

### Component inventory (CODE-VERIFIED)
- a!paneLayout(left backgroundColor:"GRAY", right width:"MEDIUM_PLUS"); a!tabLayout(×5, contentsPadding:"NONE"); a!cardGroupLayout(cardWidth:"NARROW") over a!forEach of a!map; a!cardLayout(showShadow:true, showBorder:false, shape:"ROUNDED") and (style:"TRANSPARENT", height:"TALL", padding:"NONE", decorativeBarColor:"#000000"); a!imageField(size:"FIT") and (style:"AVATAR", size:"SMALL_PLUS"); a!tagItem(backgroundColor: if(selected,"ACCENT","#FFF"), link:a!dynamicLink); a!buttonWidget(icon:"plus", style:"OUTLINE") and (style:"SOLID", width:"FILL", icon:"credit-card"); a!columnsLayout(width:"EXTRA_NARROW", spacing:"DENSE"); a!sideBySideLayout(alignVertical:"BOTTOM"/"MIDDLE", width:"MINIMIZE"); a!horizontalLine; a!localVariables(local!selectedTag).
- Charts: none.
- Interactive affordances: category tabs, order-type tag links, per-card add buttons, payment button. No search or filters.

### Character & judgment
- **Register**: energetic-consumer — photo-led cards, pill CTA.
- **Why it works**: persistent receipt beside the menu removes browse↔cart context switching (paneLayout); right-aligned EXTRA_NARROW qty/price columns + horizontalLines read like a printed ticket; shadow-only ROUNDED cards on a GRAY pane make photos the figure, chrome the ground.
- **Why not boring**: CDN-side corner rounding SAIL can't do natively; tagField repurposed as stateful segmented control; icon-only "+" buttons instead of verbose "Add to cart"; GRAY/white pane split gives the cart its own "paper" surface.
- **Boring twin**: one white page with a category dropdown, an a!gridField of menu items with "Add" links, a second grid for the cart, totals as plain label/value pairs — zero appetite appeal, cart lost on scroll.
- **What to steal**: paneLayout GRAY browse pane + white summary pane for pick-and-review flows; the dynamicLink tag segmented control; CDN image rounding when the component lacks a radius param.
- **Risks**: icon-only plus buttons lack accessible labels; unselected "#FFF" tags on white have weak affordance/contrast; hardcoded "#FFF"/"#000000" bypass theming; external Unsplash dependency; stacked panes + TALL fixed-height line-item region will crowd mobile.

### Code cross-check
- **Code-verified palette**: only tokens/hexes in source: `"GRAY"` (pane), `"ACCENT"` (selected + discount tags), `"#FFF"` (unselected tags), `"#000000"` (decorativeBarColor). The violet accent comes from the site theme, not the expression.
- **Notable techniques**: paneLayout split, left `"GRAY"`, right `width:"MEDIUM_PLUS"` (lines 3–5, 148, 508); tag-as-segmented-control via a!dynamicLink saving fv!index, conditional ACCENT (158–179); Unsplash `mask=corners&corner-radius=25&w=1000&h=700` for uniform rounded photos (33–63); TRANSPARENT `height:"TALL"` padding-NONE card as scroll region for line items (217, 358–363); pseudo-table via right-aligned EXTRA_NARROW columns mirrored in header and rows (180–212).
- **Corrections**: `decorativeBarColor:"#000000"` renders no visible bar — dead param; the 4+2 card arrangement is NARROW wrapping, not a fixed grid; circular "+" buttons, ALL-CAPS button text, and the active-tab underline are theme defaults, not custom styling.
