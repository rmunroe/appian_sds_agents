# Analysis: real-estate-property-list

## real_estate_property_list.png

### Identification
- **Image**: real_estate_property_list.png | **Source page**: real-estate-property-list (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) real estate property list"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list

### Use-case reconstruction (INFERRED)
- **Persona**: residential listing agent at boutique luxury brokerage "Thatcher."; daily-operator — checks listing health each morning, adds listings weekly.
- **Domain & brand context**: luxury residential real estate, Palm Springs / Coachella Valley (all five addresses OBSERVED are CA 922xx). Brand feel: premium boutique — serif wordmark on near-black chrome, single oxblood accent.
- **Top 3 user tasks (ranked)**: 1. Scan my listings' status and momentum (tag + days-on-market). 2. Create a new listing. 3. Jump to other listing slices (New / Search / Sold) or modules (dashboard, customers, lending, performance, team).
- **Implied requirements**: "Must show each listing's marketing status without opening the record"; "Must pair asking price with days-on-market"; "New Listing must be one click"; "Photos must dominate — agents recognize inventory visually"; "Must degrade on tablet/phone by shedding navigation, not content."
- **Data model sketch**: Listing(photo, status enum {new-listing, open-house-scheduled, no-offers-received, price-reduced}, askingPrice, daysOnMarket, beds, baths, sqFt, street, city, state, zip); Agent 1—N Listings ("My Listings"). 5 listings OBSERVED, $1.69M–$2.15M.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT header={} (dark site-chrome bar w/ serif logo sits above, outside expression)
└─ COLUMNS [EXTRA_NARROW:AUTO] spacing=NONE stack=NEVER
   ├─ PANE[left] icon rail: 6× CARD(icon-link, #232020) + 1 active CARD(#990000) + 2× CARD(spacer EXTRA_TALL, #232020)
   └─ COLUMNS [NARROW_PLUS:AUTO] spacing=NONE dividers=on
      ├─ PANE[left] menu: SECTION "Properties" + button(New Listing) + 4× CARD(SBS icon+label, link) + 2× CARD(spacer EXTRA_TALL)
      └─ CARD(#f0f0f0, padding=MORE)
         └─ GRID(card-group, cardWidth=NARROW_PLUS → 3+2 wrap)
            └─ per card: CARD(ROUNDED, pad NONE) = BILLBOARD h=SHORT_PLUS overlay=TOP,tag → SBS price|days → specs+address
```
- **Above the fold**: everything — all 5 property cards, full menu, full rail; no scrolling needed.
- **Reading order**: F — rail down the left, then menu column, then card grid rows left-to-right.
- **Hierarchy rationale**: photos largest because agents identify inventory by curb appeal (task 1); status tags occupy each photo's top-left corner — first fixation per card; the only saturated solid button is New Listing (task 2), alone in its column.
- **Density**: 2 — editorial (this page is the corpus anchor for 2): 5 content cards + 6 nav icons per viewport, photo ≈60% of card height, wrapper padding "MORE".
- **Ratios & spacing**: EXTRA_NARROW rail : [NARROW_PLUS menu : AUTO content], both columnsLayouts `spacing: "NONE"` (CODE-VERIFIED); card shell `padding: "NONE"`, text body `"STANDARD"`, cards `marginBelow: "STANDARD"`; menu rows `padding: "LESS"`, SBS `spacing: "DENSE"`.

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: rail/chrome #232020; active-nav #990000; content well #f0f0f0 (also billboard fallback); card bg default white; tags #ff9900 (new), #38761d (open house), #cc0000 (no offers), #3c78d8 (price reduced); menu secondary text #666666; site accent ≈#990000 (est.) — button and "My Listings" use symbolic `"SOLID"`/`"ACCENT"`, matching the rail's active red in pixels.
- **Color application points**: rail bg; active rail cell; New Listing button; active menu item text+icon (ACCENT); four status tags; secondary icons/text. Prices, specs, addresses stay neutral dark — color reserved for status and selection.
- **Typography moves**: section label "Properties" = MEDIUM (labelSize); menu items MEDIUM (active STRONG); prices MEDIUM_PLUS; specs STANDARD; addresses SMALL; days-on-market MEDIUM SECONDARY. All-caps status tags (authored uppercase). Serif logo is site chrome, not SAIL.
- **Imagery stance**: full-bleed exterior photos (a!webImage, Unsplash) in billboards at SHORT_PLUS; no illustrations; flat glyph icons (MEDIUM_PLUS in rail).
- **Card treatment**: structural cards all `showBorder: false`, flat; property cards `shape: "ROUNDED"`, `padding: "NONE"`, `showBorder` omitted → default light border (OBSERVED subtle edge on the well).
- **Signature moves**: instead of a nav component, an icon rail hand-built from stacked #232020 cards with `link` + `tooltip`, active state = style swapped to #990000; instead of a grid row per listing, photo-first ROUNDED cards in a!cardGroupLayout; instead of a status column, tags overlaid on photos via a!fullOverlay(alignVertical:"TOP", style:"NONE"); instead of column backgrounds, empty EXTRA_TALL cards fake full-height rails; literal `"   "` rich-text spacers tune icon-label gaps.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(header:{}, backgroundColor:"TRANSPARENT", contentsPadding:"NONE"); a!columnsLayout(spacing:"NONE", stackWhen:{"NEVER"}, inner showDividers:true); a!columnLayout(width:"EXTRA_NARROW"/"NARROW_PLUS") with `showWhen: not(a!isPageWidth({...}))`.
- a!cardLayout in four roles: nav cell (style hex, link, tooltip), spacer (height:"EXTRA_TALL"), well (style:"#f0f0f0", padding:"MORE"), listing card (shape:"ROUNDED", padding:"NONE", link).
- a!cardGroupLayout(cardWidth:"NARROW_PLUS"); a!billboardLayout(height:"SHORT_PLUS", overlay:a!fullOverlay(alignVertical:"TOP", style:"NONE")); a!tagItem(backgroundColor hex); a!sideBySideLayout(alignVertical:"MIDDLE", spacing:"DENSE"); a!sectionLayout(labelSize:"MEDIUM", divider:"NONE"); a!buttonWidget(icon:"plus-circle", size:"LARGE", width:"FILL", style:"SOLID"); a!richTextIcon/Item; a!dynamicLink throughout.
- Charts: none. Interactive affordances: cards-as-links (rail, menu rows, every listing card), one solid button; no inline search/filter widgets (Search Listings is a nav link).

### Character & judgment
- **Register**: premium-editorial + energetic-consumer — big photography and a serif luxury brand wrapped around a working tool.
- **Why it works**: status tags ride the photos, so one saccade per card yields identity + status; price and days-on-market share one SBS row, making the stale listing ($1.723M, 42d, #cc0000 tag) self-evident; the #f0f0f0 well makes white cards read as objects without heavy borders.
- **Why not boring**: near-black #232020 chrome + oxblood #990000 instead of default blue; edge-to-edge photos via padding:"NONE" under a ROUNDED shell; four-hue semantic tag system in all-caps; icon-only rail fits 6 modules in ~70px.
- **Boring twin**: a white page with an a!gridField — columns Address, Price, Beds, Status, Days — default blue accent, New Listing button top-right, paging bar. Status as plain text, no photos, no rail.
- **What to steal**: tag-on-billboard overlay for status-on-imagery; the #f0f0f0 padded well to lift white cards; nav rail built from colored link-cards with EXTRA_TALL spacers.
- **Risks**: white-on-#ff9900 tag ≈2.2:1 contrast (fails WCAG AA); icon-only rail depends on hover tooltips (touch/screen-reader weak); on PHONE both nav columns hide (`showWhen`), so New Listing and all filters vanish; five large remote images cost bandwidth.

### Code cross-check (guidance/sail/sources/real-estate-property-list.sail)
- **Code-verified palette**: #232020, #990000, #f0f0f0, #ff9900, #38761d, #cc0000, #3c78d8, #666666 — complete; all other colors are symbolic (ACCENT/SECONDARY/STANDARD/SOLID/NONE/TRANSPARENT).
- **Notable techniques**: responsive column shedding via `showWhen: not(a!isPageWidth({"PHONE","TABLET_PORTRAIT"}))` (L129–132, L439–440); full-height rail illusion via empty EXTRA_TALL styled cards (L116–127; menu twin L417–430); photo-corner status = billboard fullOverlay TOP + tagField (L451–472 et al.); responsive wrap via cardGroupLayout cardWidth:"NARROW_PLUS" (L870); menu/content seam via showDividers:true + spacing:"NONE" (L882–885).
- **Corrections**: the dark top bar with "Thatcher." logo/avatar is NOT in the expression (`header: {}`) — it is site-level chrome, so the black band and red accent also come from site branding; screenshot shows row 2 as [PRICE REDUCED, NO OFFERS RECEIVED] but source orders NO OFFERS 4th (L701) before PRICE REDUCED 5th (L785) — preview and source drifted; button red is `style: "SOLID"` resolving to site accent, not a hex in this SAIL.
