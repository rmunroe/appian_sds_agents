# Analysis: online-shopping-journey

Five tier-A images across one journey (retail: image9 → image64 → image65; non-retail: image87 → image93). Cross-ref: forms-sidebar-for-eligibility-information.png ("Non-retail item details page", Order Fishing License) appears on this page but is analyzed under its primary page; its SAIL informs sibling hex estimates here (#1A2530 title bar, #F5F5F7 sidebar, #6C6C75 text).

## image9.png

### Identification
- **Image**: image9.png | **Source page**: online-shopping-journey | **Alt/caption**: none (heading: "Item category listing")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (e-commerce category browse)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer browsing a boutique storefront
- **Domain & brand context**: minimalist Japanese-inspired stoneware shop ("Otaru" bowls, $19.95–$39.95); red-square logo brand; gallery-like merchandising
- **Top 3 user tasks (ranked)**: 1. Browse items in a category and pick one. 2. Narrow/sort the set (price, type, search). 3. Keep sight of the cart.
- **Implied requirements**: "Category switch without losing context"; "Cart status always visible" (page prose: minimized shopping cart shortcut upper right); "Sort + type filter above the grid"; "Merchandising flags (NEW/POPULAR) on items"; "Card click navigates to item details" (page prose)
- **Data model sketch**: Category 1:N Product(name, price, photo, flag[NEW|POPULAR|none]); 6 categories + What's New; pagination 1 of 3

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (chrome: logo + HOME/SALE/STONEWARE/MY ACCOUNT)
HEADER-CONTENT bg=WHITE, contentsPadding NONE
└─ COLUMNS [AUTO : EXTRA_NARROW cart chip]
   └─ COLUMNS [NARROW nav | AUTO]
      ├─ search field + category link list (active = ACCENT bar + STRONG)
      └─ SECTION h1 "Dinnerware" LARGE_PLUS
         ├─ toolbar: sort dropdown + type dropdown + pager dropdown "1 of 3" + Show All
         └─ GRID(2-col) CARD(BILLBOARD h=MEDIUM_PLUS + tag overlay, name MEDIUM, price STRONG)
```
- **Above the fold**: header, full left nav, toolbar, first product row + top of second
- **Reading order**: F — nav rail, then title/toolbar, then grid
- **Hierarchy rationale**: photos dominate (product desirability is the sell); category title LARGE_PLUS anchors "where am I"; cart chip small but isolated in its own top-right column (task 3 needs presence, not size)
- **Density**: 2 — editorial two-column grid, large photography, wide gutters
- **Ratios & spacing**: nav NARROW vs AUTO grid; cart column EXTRA_NARROW (CODE-VERIFIED); product cards padding:"NONE" with text block padding STANDARD; marginBelow STANDARD between rows; stackWhen PHONE/TABLET_PORTRAIT/TABLET_LANDSCAPE/DESKTOP_NARROW (CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: page WHITE (backgroundColor:"WHITE"); site bar dark charcoal ≈#3b3b3b (est., chrome); brand/accent red (theme ACCENT — active category, cart icon, links); billboard fallback #f0f0f0; tags NEW #d82bd8 magenta, POPULAR #3f7eed blue (both CODE-VERIFIED)
- **Color application points**: active-category bar "❘" + label, category links, sort glyphs, Show All link, cart icon, overlay tags — photography otherwise carries the page
- **Typography moves**: h1 LARGE_PLUS via a!sectionLayout(labelSize:"LARGE_PLUS", labelHeadingTag:"H1"); active category MEDIUM STRONG vs siblings MEDIUM regular; product names MEDIUM; prices STANDARD STRONG (deliberately quiet); pager "of 3" STRONG
- **Imagery stance**: photos as a!billboardLayout(height:"MEDIUM_PLUS") inside link-cards
- **Card treatment**: flat white cards, padding NONE, photo flush; toolbar controls unboxed
- **Signature moves**: (1) active-category marker is a rich-text "❘" glyph colored ACCENT LARGE — and inactive rows keep the same glyph colored #ffffff (CODE-VERIFIED) so labels never shift: an invisible-character alignment hack; (2) cart minimized to an icon+count chip in its own EXTRA_NARROW column (card style:"STANDARD", padding:"LESS") with accessibilityText "Shopping Cart (Zero Items)"; (3) merchandising tags via a!fullOverlay(alignVertical:"TOP") in off-semantic hues (magenta/blue) — marketing pop, not status semantics; (4) pagination as a dropdown ("1" of 3) + Show All safeLink instead of a pager bar.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"WHITE", contentsPadding:"NONE"), a!textField(placeholder:"Search products…", accessibilityText), category a!cardLayout(link:a!dynamicLink, style:"#ffffff", padding:"NONE") rows, a!dropdownField ×3 (sort/type/page, labelPosition:"COLLAPSED") with icon prefixes (sort-amount-asc, cubes), a!billboardLayout(+a!webImage), a!tagField/a!tagItem(backgroundColor), a!safeLink "Show All", cards-as-links product tiles
- Charts: none | Interactive: search, 3 dropdowns, category links, product card links, cart chip link

### Character & judgment
- **Register**: premium-editorial + energetic-consumer — spare gallery layout with tiny saturated merchandising jolts
- **Why it works**: photography-first grid sells texture; one accent (red) reserved for wayfinding while tags get their own hues; the invisible-glyph trick keeps the category list optically perfect
- **Why not boring**: magenta NEW tag (off-palette on purpose); dropdown pager (compact, unusual); prices small/bold rather than shouty; cart chip architecture instead of a header icon button
- **Boring twin**: 3-col grid of bordered product cards with big blue prices, faceted checkbox filters left, numbered pagination bar bottom, cart in a global toolbar.
- **What to steal**: whitespace-preserving active markers via color-toggled glyphs; per-item overlay tags on billboards; EXTRA_NARROW utility column for persistent widgets.
- **Risks**: dropdown-as-pager is low-affordance; magenta/blue tag pair carries no learnable semantics; whole-card links with no hover cue; accessibilityText hardcodes "Zero Items" — would go stale with a filled cart.

### Code cross-check
- **Code-verified palette**: #ffffff, #f0f0f0, #d82bd8, #3f7eed; ACCENT tokens for red applications
- **Notable techniques**: invisible "❘" alignment (~ln 90–100 of block); fullOverlay(style:"NONE") tag float; stackWhen list incl. DESKTOP_NARROW; dropdown pager + safeLink Show All
- **Corrections**: site bar hue is chrome (header: {} in code), excluded from SAIL palette claims.

## image64.png

### Identification
- **Image**: image64.png | **Source page**: online-shopping-journey | **Alt/caption**: none (heading: "Item details page and cart")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (product detail) + persistent cart rail

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer evaluating one product pre-purchase
- **Domain & brand context**: same stoneware shop; single-item craft retail ($34.95 hand-crafted bowl)
- **Top 3 user tasks (ranked)**: 1. Inspect the item (photos, description, price). 2. Configure (color, quantity) and add to cart. 3. Review cart and proceed to checkout.
- **Implied requirements**: "Breadcrumbs return to listing" (page prose); "Cart expands in place; ✕ restores minimized state" (page prose); "Options chosen before add-to-cart"; "Gallery with selectable thumbnails"; "Line items removable from mini-cart"
- **Data model sketch**: Product(name, price, colorOptions, description, photos[4]); Cart(lineItems[product, qty, price], taxes, shipping, total) — 1 item, total $34.95

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (chrome)
HEADER-CONTENT bg=WHITE
└─ COLUMNS [AUTO detail | MEDIUM cart]
   ├─ breadcrumbs "Stoneware / Dinnerware"
   ├─ COLUMNS spacing=SPARSE [gallery | config]
   │  ├─ BILLBOARD h=EXTRA_TALL + 3 thumbnail CARDs (BILLBOARD SHORT, padding EVEN_LESS)
   │  └─ H1 LARGE_PLUS + price MEDIUM_PLUS + radio CARDS "Color" + stepper − [1] + + ADD TO CART + "Product Description"
   └─ CART RAIL: CARD(#666666 "SHOPPING CART" + ✕) over CARD(bordered: line item, Taxes/Shipping, Total, CHECK OUT)
```
- **Above the fold**: everything — full PDP and expanded cart
- **Reading order**: Z within detail (photo → title/price → options → CTA), cart rail read on demand
- **Hierarchy rationale**: hero photo largest (task 1); title/price top-right of the fold line; the only SOLID button on screen is CHECK OUT — the pattern ranks conversion above the page's own add action
- **Density**: 2 — two working columns, generous whitespace, single product
- **Ratios & spacing**: cart column width:"MEDIUM" (CODE-VERIFIED); gallery vs config ≈1:1 with spacing:"SPARSE"; thumbnails spacing:"DENSE"; stackWhen through DESKTOP_NARROW

### Styling specifics (CODE-VERIFIED)
- **Palette**: white page; cart header #666666 (CODE-VERIFIED) with white text; billboard fallback #f0f0f0; accent red (breadcrumb links, selected radio card, buttons, trash icon NEGATIVE); borders default gray
- **Color application points**: links, selection states, button outlines/fills, remove icon — red used solely as interaction color
- **Typography moves**: H1 LARGE_PLUS (labelHeadingTag:"H1"); price MEDIUM_PLUS regular (not bold — price as fact, not shout); cart title MEDIUM all-caps with icon; line-item qty "Qty:1 @ $34.95" SECONDARY SMALL; totals STRONG
- **Imagery stance**: billboard gallery (EXTRA_TALL hero + SHORT thumbnails in style:"STANDARD" cards)
- **Card treatment**: thumbnails as bordered cards padding EVEN_LESS; cart body showBorder:true, height:"EXTRA_TALL"; header band filled #666666
- **Signature moves**: (1) cart as an in-layout stateful rail (✕ collapses to the image9 chip) instead of a drawer/modal — pure showWhen-style state, no overlay tech; (2) button hierarchy inversion: Add to Cart is style:"OUTLINE" (LARGE, cart-plus icon) while Check Out is SOLID FILL — the funnel outranks the page; (3) quantity stepper from parts: minus a!buttonWidget(size:"SMALL", style:"OUTLINE", color:"SECONDARY", disabled:true at qty 1) + bare integerField + plus; (4) #666666 band as a reusable "panel title bar" idiom (repeated on checkout page).

### Component inventory (CODE-VERIFIED)
- a!radioButtonField(choiceLayout:"COMPACT", choiceStyle:"CARDS") for Color; a!buttonWidget stepper pair + "Add to Cart" (icon:"cart-plus", size:"LARGE", style:"OUTLINE"); breadcrumbs via sideBySide richText a!safeLinks + SECONDARY "/"; cart: a!imageField(size:"SMALL") thumb, trash-o icon color:"NEGATIVE", a!sectionLayout(divider:"BELOW") subtotal rows, "Check Out" a!buttonWidget(size:"LARGE", width:"FILL", style:"SOLID")
- Charts: none | Interactive: thumbnail links, radio cards, stepper, add/checkout, remove item, cart collapse ✕

### Character & judgment
- **Register**: premium-editorial — craft-object minimalism with red interaction accents
- **Why it works**: EXTRA_TALL hero gives the object presence; radio-as-cards makes the single option ("Hokkaido White") feel configured, keeping the layout stable for multi-option products; expanded cart mirrors the exact math shown at checkout, building trust early
- **Why not boring**: in-column cart with restore-to-chip behavior; OUTLINE primary page action; gray band headers instead of section labels; disabled minus at floor quantity (state honesty)
- **Boring twin**: image left, bold red price, solid ADD TO CART, cart hidden behind a header icon with a badge, description in tabs.
- **What to steal**: SOLID reserved for the money action; #666666 band headers for panel titling; stepper recipe with floor-disable.
- **Risks**: OUTLINE add-to-cart may underperform for first-time users; thumbnails lack selected-state marking; accessibilityText "Shopping Cart (Zero Items)" contradicts the 1-item cart (CODE-VERIFIED copy bug); white-on-#666666 ≈5.7:1 — fine, but small ✕ target.

### Code cross-check
- **Code-verified palette**: #666666, #f0f0f0, WHITE; NEGATIVE trash icon; ACCENT reds token-driven
- **Notable techniques**: cardLayout(height:"EXTRA_TALL") to lock cart panel height; sectionLayout dividers for receipt rows; radio CARDS choiceStyle
- **Corrections**: stale accessibilityText noted above — pixels (1 item) override the label's claim.

## image65.png

### Identification
- **Image**: image65.png | **Source page**: online-shopping-journey | **Alt/caption**: none (heading: "Checkout page")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (single-page staged checkout)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer completing purchase; one-time flow, abandonment-sensitive
- **Domain & brand context**: same stoneware shop; standard two-column checkout convention
- **Top 3 user tasks (ranked)**: 1. Enter payment details. 2. Confirm delivery info (already captured). 3. Verify order math and place the order.
- **Implied requirements**: "Multiple steps on one page" (page prose); "Completed Delivery collapses to a summary with Edit, Payment auto-expands" (page prose); "Order summary visible beside the form"; "Billing address defaults to shipping"; noun/verb label discipline: "Checkout page" vs "Check out now" (page prose)
- **Data model sketch**: Order(shipTo{name, address}, shippingMethod, payment{ccNumber, name, exp, cvv}, billingAddress[same|different], lineItems, taxes, shipping, total $34.95)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (chrome) + empty header CARD
└─ COLUMNS [empty | WIDE_PLUS | empty]  (centered)
   ├─ H1 "Check Out" LARGE_PLUS
   └─ COLUMNS [form | MEDIUM summary]
      ├─ BAND(#666666, truck "DELIVERY") → summary CARD(address + shipping + EDIT)
      ├─ BAND(#666666, credit-card "PAYMENT") → form CARD(cc#, name, exp 2X + cvv, billing radio CARDS)
      └─ BAND(#666666, cart "ORDER SUMMARY") → CARD(line item, Taxes −, Shipping Free, Total, PLACE ORDER)
```
- **Above the fold**: entire flow — both stages and the summary
- **Reading order**: single-column down the form; Z-hop to summary before committing
- **Hierarchy rationale**: completed Delivery compressed to 2 lines (don't re-read finished work); Payment expanded because it's the active stage; PLACE ORDER is the lone SOLID fill, spatially adjacent to the total it commits
- **Density**: 3 — one active form + one summary; balanced product-UI spacing
- **Ratios & spacing**: outer center column WIDE_PLUS (CODE-VERIFIED); summary column MEDIUM; bands marginBelow:"NONE" flush to their cards; cards padding STANDARD

### Styling specifics (CODE-VERIFIED)
- **Palette**: white page (backgroundColor:"WHITE", contentsPadding:"STANDARD"); stage bands #666666 (CODE-VERIFIED ×3) with white icon+all-caps labels; selected billing card = accent red border + filled radio; buttons: EDIT OUTLINE SECONDARY, PLACE ORDER SOLID red
- **Color application points**: bands (structure), selection states, single SOLID CTA — otherwise monochrome form
- **Typography moves**: H1 LARGE_PLUS; band labels STANDARD all-caps w/ icons (truck/credit-card/shopping-cart); field labels ABOVE bold; Total label MEDIUM STRONG vs value MEDIUM_PLUS STRONG (value outranks label); summary meta SECONDARY SMALL
- **Imagery stance**: one product thumbnail (a!imageField size:"SMALL"); icons for stage semantics and address lines (home/calendar SECONDARY)
- **Card treatment**: white cards under gray bands; summary card showBorder:true; delivery summary card bordered with EDIT right-aligned
- **Signature moves**: (1) wizard-without-a-wizard: stages as band-labeled sections that swap form↔summary in place (Delivery collapsed + Payment expanded) — progressive disclosure with zero step chrome; (2) the #666666 band idiom carried from image64, now as stage headers — one visual language across the journey; (3) completed-stage summary rewrites inputs into icon-prefixed prose ("Allison Moreno, 796 E. Studebaker Dr…" + "Free Economy Shipping"); (4) billing address as radio CARDS defaulting to "Same as shipping address" — the 90% path is one glance.
- 
### Component inventory (CODE-VERIFIED)
- a!integerField (Credit Card Number, Security Code), a!textField (Name on Card; Expiration placeholder "mm/yy"), sideBySide width:"2X" + default + empty item for field sizing, a!radioButtonField(choiceLayout:"STACKED", choiceStyle:"CARDS"), EDIT a!buttonWidget(style:"OUTLINE", color:"SECONDARY"), PLACE ORDER a!buttonWidget(size:"LARGE", width:"FILL", style:"SOLID"), receipt rows via sectionLayout dividers
- Charts: none | Interactive: Edit stage, form fields, radio cards, Place Order

### Character & judgment
- **Register**: calm-clinical — conversion page stripped of everything but the funnel
- **Why it works**: everything fits one viewport, so "how much is left?" is answered visually; band grammar (icon + caps) chunks the page into three legible stages; total and CTA share the summary card, closing the loop where the eye lands last
- **Why not boring**: in-place stage collapse instead of a step indicator; icon-prefixed summary prose instead of a disabled form; Total typography inversion (value > label)
- **Boring twin**: a 3-step wizard with milestone bar, delivery form re-shown read-only, order summary on a separate review step, gray Continue buttons.
- **What to steal**: collapse-completed-stages-to-prose pattern; single SOLID button rule per page; mm/yy placeholder + 2X/1X field width ratios for card rows.
- **Risks**: a!integerField for card number strips formatting/leading zeros and blocks spaces (CODE-VERIFIED type choice — real implementations need masked text); no card-brand or CVV hint iconography; stage bands aren't links (can't reopen Delivery except via EDIT); single-viewport luxury vanishes with multi-item carts.

### Code cross-check
- **Code-verified palette**: #666666 bands; WHITE bg; SOLID/OUTLINE button styles
- **Notable techniques**: empty flanking columnLayouts for centering; empty a!sideBySideItem() as spacer; radio CARDS for binary billing choice
- **Corrections**: integerField-for-CC flagged above; accessibilityText "Shopping Cart (Zero Items)" again stale on the summary card.

## image87.png

### Identification
- **Image**: image87.png | **Source page**: online-shopping-journey | **Alt/caption**: none (heading: "Non-retail item directory")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal (citizen service directory)

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public citizen on a state portal ("State.gov"); task-driven, low familiarity
- **Domain & brand context**: state government self-service; institutional navy, zero retail styling (page prose: for portals where product photos and filtering are not appropriate)
- **Top 3 user tasks (ranked)**: 1. Start a popular transaction (license renewal etc.). 2. Drill into a category (Business…Transportation). 3. Orient ("what can I do here?").
- **Implied requirements**: "Surface the 20% of services that serve 80% of visitors"; "Browse by category without search"; "Plain-language welcome"; "No commerce visuals"
- **Data model sketch**: Category(name) ×10 incl. Popular Services; Service(name, icon) — 4 popular shown; category 1:N services

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (chrome, State.gov)
HEADER: CARD(#03122a, padding MORE) breadcrumb "Home ›" + H1 "Online Self-Service" (LARGE_PLUS, LIGHT) + subtitle MEDIUM
└─ COLUMNS [empty | WIDE_PLUS | empty]
   └─ COLUMNS spacing=SPARSE [MEDIUM category rail | AUTO]
      ├─ rail: flush CARD list — "Popular Services" style=ACCENT, 9 white siblings
      └─ GRID(2×2) CARD(centered icon LARGE_PLUS ACCENT + label MEDIUM)
```
- **Above the fold**: hero band, full rail, all four service tiles
- **Reading order**: hub-and-spoke — hero orients, rail and tiles are parallel spokes
- **Hierarchy rationale**: navy band biggest for institutional identity + orientation question ("What can we help you do today?"); selected category solid blue = you-are-here; four oversized tiles because task 1 is the majority path
- **Density**: 2 — a few zones, huge whitespace reserve below
- **Ratios & spacing**: rail width:"MEDIUM" vs AUTO grid, spacing:"SPARSE" between; rail cards marginBelow:"NONE" (flush list-group); tiles padding STANDARD + char(10) vertical breathing (CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: header #03122a (CODE-VERIFIED); selected rail card style:"ACCENT" blue (≈#1c6fad est. rendered); tile icons color:"ACCENT"; white content; no other hues
- **Color application points**: header band, selection state, icons — a strict institutional triad (navy/blue/white)
- **Typography moves**: H1 a!headingField(size:"LARGE_PLUS", fontWeight:"LIGHT") — light-weight display type for gravitas without bulk; subtitle MEDIUM; rail + tile labels MEDIUM; breadcrumb STANDARD with chevron-right icon
- **Imagery stance**: styled icons only (id-card-o, car, certificate, paw at LARGE_PLUS ACCENT) — deliberately no photography
- **Card treatment**: rail cards flat/flush (style NONE, marginBelow NONE); tiles bordered white with centered stack
- **Signature moves**: (1) vertical nav built from flush cards with a solid-ACCENT selected state — a list-group without any nav component; (2) icon-tile grid replaces product cards: the "non-retail" translation of a shop window; (3) fontWeight:"LIGHT" hero over #03122a — federal-brand tone via two parameters; (4) question-as-subtitle turns a directory into a service desk.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(header: a!cardLayout(style:"#03122a", padding:"MORE")), a!headingField(LARGE_PLUS, LIGHT, H1), rail a!cardLayout(link:a!dynamicLink, style:"ACCENT"|"NONE", padding:"STANDARD", marginBelow:"NONE"), tiles a!cardLayout(link) with a!richTextIcon(color:"ACCENT", size:"LARGE_PLUS") + a!richTextItem(MEDIUM) + char(10) spacers, align:"CENTER"; stackWhen on tile columns
- Charts: none | Interactive: 10 rail links, 4 tile links, breadcrumb

### Character & judgment
- **Register**: institutional + calm-clinical
- **Why it works**: four tiles = four verbs ("Renew…", "Order…") — the page speaks in tasks, not org chart; selected-state solid fill is unambiguous for infrequent visitors; monochrome-plus-blue keeps trust cues intact
- **Why not boring**: light-weight display heading (rare in gov UIs); paw/certificate icons add warmth inside a strict palette; flush card nav instead of default section links
- **Boring twin**: alphabetical link list of 40 services under a gray banner, "Welcome to the portal" paragraph, no popular shortcuts.
- **What to steal**: popular-services tile shelf in front of full taxonomy; card-based selected nav state; verb-first labels.
- **Risks**: rail siblings have no hover/pressed affordance (plain white cards); tiles' large empty region below suggests unfinished feel at this viewport; icon metaphors (paw = hunting license) may misread; breadcrumb "Home ›" points nowhere visible.

### Code cross-check
- **Code-verified palette**: #03122a; ACCENT card + icon tokens
- **Notable techniques**: char(10) spacers for tile height; headingField fontWeight param; empty flanking columns for centering
- **Corrections**: none — pixels matched code.

## image93.png

### Identification
- **Image**: image93.png | **Source page**: online-shopping-journey | **Alt/caption**: none (heading: "Non-retail item details with required questionnaire")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (service configuration preceding a gated questionnaire). No SAIL block accompanies this image on the page — palette claims are pixel/sibling-based (est.), with sibling patterns on the same page providing likely values.

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public citizen ordering a vital record; single-session, compliance-bound
- **Domain & brand context**: State.gov portal (continuation of image87 journey via breadcrumb Home › Online Self Service)
- **Top 3 user tasks (ranked)**: 1. Choose certificate parameters (for whom, type, copies). 2. Understand eligibility/requirements before committing. 3. Launch the required questionnaire.
- **Implied requirements**: "Item cannot be added to cart directly — questionnaire launches instead" (page prose); "Price visible inside each option"; "Eligibility rules adjacent to the choices they govern"; "Prerequisites (documents) announced before the flow starts"
- **Data model sketch**: Order(recipient[myself|family member], certType[short $25|long $30], copies:int); Requirements(biographical info, proof of identity); cart reachable from header icon

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-BAR (chrome) 
HEADER: CARD(navy est. #03122a) breadcrumb + H1 "Order Birth Certificate" + cart icon right
└─ COLUMNS [main | MEDIUM sidebar]
   ├─ "About Birth Certificates" label+prose + ⓘ processing-time note
   ├─ radio CARDS "Birth Certificate For" (Myself ✓ | family member) + ⓘ eligibility prose
   ├─ radio CARDS "Certificate Type" (Short Form ($25) ✓ | Long Form ($30)) + ⓘ ×2 explainers
   └─ "Copies" stepper − [1] + + BUTTON "START QUESTIONNAIRE" (OUTLINE, arrow icon)
   └─ sidebar: CARD(gray est. #F5F5F7) "You will need" + 2 labeled requirements
```
- **Above the fold**: entire decision set through the CTA and sidebar
- **Reading order**: single-column decision ladder; sidebar consulted before commit
- **Hierarchy rationale**: choices ordered by dependency (who → type → how many → start); the requirements panel is visually parked right so it informs without interrupting; CTA last because everything above parameterizes it
- **Density**: 3 — one decision path plus reference rail; comfortable field spacing
- **Ratios & spacing**: main ≈2× sidebar (sidebar ≈ MEDIUM, matching sibling pattern widths); generous marginBelow between choice groups (≈"MORE", matching sibling code)

### Styling specifics (OBSERVED; est. hexes — no SAIL for this image)
- **Palette**: header navy #03122a (est.; CODE-VERIFIED on sibling image87 — note the other sibling detail pattern uses #1A2530); accent blue for selected radio cards, links, ⓘ icons, CTA (portal theme ACCENT); sidebar panel #F5F5F7 (est., matches sibling CODE-VERIFIED value); explainer text gray ≈#6C6C75 (est., sibling value); white canvas
- **Color application points**: selection borders + filled radios, info icons, CTA outline/icon, header band — nothing decorative
- **Typography moves**: H1 white ≈LARGE_PLUS; group labels ABOVE bold; option labels STANDARD with price inline; "You will need" ≈MEDIUM bold; requirement names bold over regular descriptions; ⓘ paragraphs STANDARD gray
- **Imagery stance**: none — icons only (info-circle, plus/minus, arrow-circle-right, cart)
- **Card treatment**: radio options as CARDS choiceStyle (selected = accent border + filled radio; unselected gray border); sidebar as flat filled panel
- **Signature moves**: (1) the journey's CTA swap — START QUESTIONNAIRE replaces Add to Cart when a gate exists (page prose confirms the questionnaire launches "in place of adding selected items directly to the cart"); (2) prices embedded in choice labels ("Short Form ($25)") so cost comparison happens inside the selector, no price table; (3) ⓘ micro-explainers interleaved after each decision, not centralized in help; (4) "You will need" preflight panel — abandonment insurance before a lengthy flow (cross-ref: Sidebar step indicator (simple) pattern renders the questionnaire itself; forms-sidebar-for-eligibility-information.png shows the same architecture for Fishing License).

### Component inventory (INFERRED from pixels + sibling code)
- a!radioButtonField(choiceLayout:"STACKED", choiceStyle:"CARDS") ×2; stepper = a!buttonWidget(icon:"minus", disabled at 1)/a!integerField/plus (sibling-verified recipe); a!buttonWidget("Start Questionnaire", style:"OUTLINE" with icon); a!richTextIcon("info-circle", color:"ACCENT") notes; sidebar a!cardLayout(style:#F5F5F7) or a!pane per sibling; header a!cardLayout(style: navy) with breadcrumb richText + H1 headingField
- Charts: none | Interactive: 2 radio groups, stepper, CTA, cart icon, breadcrumb links

### Character & judgment
- **Register**: institutional + calm-clinical — bureaucratic content delivered with consumer-checkout ergonomics
- **Why it works**: the decision ladder mirrors how a clerk would ask the questions; per-option pricing prevents the classic "how much?" hunt; requirements surfaced pre-flow set honest expectations for a 2–3 week government process (stated in the ⓘ note)
- **Why not boring**: e-commerce mechanics (radio cards, stepper, cart) transplanted onto a government form; explainers attached to their decisions instead of a FAQ; OUTLINE CTA with directional icon signals "flow begins" rather than "submit"
- **Boring twin**: a long static instructions page with a PDF form link, or a wizard that asks eligibility questions one screen at a time before showing prices.
- **What to steal**: price-in-label radios; requirements preflight panel; swap Add-to-Cart for Start-X when gating applies.
- **Risks**: no SAIL on page — replication requires borrowing sibling code; long ⓘ paragraphs stretch the form (family-eligibility note is 3 lines); "Copies" stepper meaning (copies of the same certificate) could use helper text; OUTLINE CTA slightly weak for the page's single action.

### Code cross-check
- none — no SAIL source for this image on the page; hexes marked est. against sibling CODE-VERIFIED values (#03122a header on image87's block; #F5F5F7/#6C6C75 in the forms-sidebar pattern block; #1A2530 title bar variant also present on this page).
