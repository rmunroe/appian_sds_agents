# Analysis: ins-quote-review

## insurance_quote_returning_portal.png

### Identification
- **Image**: insurance_quote_returning_portal.png | **Source page**: ins-quote-review | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) insurance quote review"
- **Device frame**: desktop (3360x2100 retina; screenshot crops mid-content — the CODE-VERIFIED #333 disclaimer footer and bottom spacer are below the captured viewport)
- **Marker**: neutral
- **UI type**: portal (tier A as suggested, no override) — customer-facing quote-review landing for a returning shopper.

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — returning retail insurance shopper ("Welcome back, Karen!") in a single pre-purchase session; zero training, price-sensitive.
- **Domain & brand context**: direct-to-consumer auto carrier "INSURECORP" (white shield logo); Geico/Progressive-style funnel; sibling of the ins-quote-wizard flow (same $113.50/mo quote).
- **Top 3 user tasks (ranked)**: 1. Decide and buy (Purchase Now vs. monthly/prepaid comparison). 2. Verify and edit quote inputs — coverage limits, vehicles, drivers. 3. Be convinced the price is good (itemized discounts, savings gauge).
- **Implied requirements**: "Must show monthly and discounted 6-month prepay prices at the top of the content zone"; "Must let the user drill into discounts/vehicles/drivers and edit each coverage line without restarting"; "Must quantify value with dollar-itemized discounts and a market comparison"; "Must offer an escape hatch to start a new quote"; "Must carry data-sourcing/state-availability disclaimers".
- **Data model sketch**: Customer(Karen) 1–1 Quote{monthly $113.50, sixMonth $646.95, prepayDiscount, product: Auto}; Quote 1–n Discount ×3 ($180.90 Multi-Vehicle, $143.25 Multi-Driver, $211.60 Safe Driving; ≈$42.90/mo rollup); 1–n Vehicle (2); 1–n Driver (2); 1–n Coverage{type, limits} ×4 (BI 50k/100k, UM/UIM BI 50k/100k, PD 75k, MedPay 25k/50k); MarketComparison{24% below area average}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#333 (entire page in header slot; contents:{})
├─ CARD(hero, style=#1155cc, showBorder=false)
│  └─ COLUMNS [empty:WIDE_PLUS:empty]
│     ├─ logo MEDIUM
│     └─ COLUMNS [AUTO:MEDIUM] greeting LARGE + #ffe599 subtitle + SBS(CTA, link) | isometric car illustration align=END
├─ CARD(main band, style=#1155cc)
│  ├─ COLUMNS [empty:WIDE_PLUS:empty]
│  │  └─ COLUMNS [AUTO:MEDIUM]
│  │     ├─ CARD("Your coverage details", white SEMI_ROUNDED, showBorder=false)
│  │     │  ├─ CARD(price SBS: $113.50/Mo –or– $646.95/6Mos*, showBorder=true, decorativeBar TOP ACCENT)
│  │     │  ├─ "Auto Insurance" + 4 linked rows (icon|label|value|chevron): 3 discounts $42.90/mo · 2 vehicles · 2 drivers · Coverage▾
│  │     │  └─ CARD(SECTION ×4 coverage lines, divider=BELOW, Edit OUTLINE SECONDARY each)
│  │     └─ CARD("Your discounts") ×3 mini-CARDs bar TOP #674ea7|#e69138|#6aa84f + TINY stamp
│  │        └─ CARD("Your savings", GAUGE 24% + copy)
│  └─ spacer COLUMNS marginAbove/Below=EVEN_MORE
└─ CARD(footer disclaimers, style=#333, padding=EVEN_MORE) [cropped]
```
- **Above the fold**: hero (logo, greeting, CTA, illustration) + price strip + first two linked rows + two discount cards.
- **Reading order**: F — hero text→illustration, then left coverage column with right persuasion rail.
- **Hierarchy rationale**: greeting + white CTA are the largest/highest elements (task 1: convert); the price strip is the first content element, isolated by border + accent bar (the decision anchor); value justification (discounts/gauge) gets the narrow right rail — supporting, not primary.
- **Density**: 2 — editorial: hero consumes ~30% of viewport, ~10 content rows visible, STANDARD card padding with MORE/EVEN_MORE band margins.
- **Ratios & spacing**: center band WIDE_PLUS flanked by empty columns; content split [AUTO:MEDIUM] ≈ 2.2:1 observed; rows marginBelow STANDARD; hero columnsLayout marginBelow MORE; spacer EVEN_MORE both sides.

### Styling specifics (CODE-VERIFIED)
- **Palette**: band bg #1155cc; page base + footer #333; content cards default white; hero subtitle #ffe599; savings green #38761d; discount trio #674ea7 (purple), #e69138 (orange), #6aa84f (green); link/stamp-glyph white #ffffff; vestigial #056CF2 (footer decorativeBarColor with position NONE — invisible). Theme token ACCENT (price bar, gauge fill, CTA label) renders ≈#4277e4 (est., profile-shifted sample).
- **Color application points**: full-bleed band slabs; hero subtitle; price-card top bar; per-discount decorative bar + matching stamp fill; green $42.90/mo rollup; gauge arc; CTA label. Headings and row text stay neutral dark.
- **Typography moves**: greeting LARGE STRONG white; subtitle MEDIUM_PLUS #ffe599; card titles LARGE (regular weight); prices LARGE STRONG with MEDIUM "/ Month" suffix in one rich-text run; discount amounts MEDIUM_PLUS + MEDIUM "/ Year"; rows MEDIUM; footnote SMALL SECONDARY right-aligned; coverage names STRONG at STANDARD; buttons render uppercase.
- **Imagery stance**: flat isometric spot illustration (blue car on road tile with trees) + white logo; elsewhere styled icons only (richTextIcon hand-holding-usd/car/user-friends/umbrella + bold chevrons; stamp icons car/user-friends/thumbs-up).
- **Card treatment**: outer whites flat (showBorder:false, shape:SEMI_ROUNDED) — separation comes from the blue field, not borders; price card showBorder:true + showShadow:false + accent bar; linked rows style:"NONE" hairline cards; mini-cards flat with colored top bars.
- **Signature moves**: (1) Instead of a body, the whole page stacks in the headerContentLayout header slot (contents:{}) as three full-bleed cards — #1155cc, #1155cc, #333 — with backgroundColor:"#333" so overscroll matches the footer. (2) Instead of a grid, drill-in rows are a!cardLayout(link: a!dynamicLink) wrapping sideBySide icon|label|value|chevron. (3) Instead of labels, each discount is hue-coded twice: decorativeBarColor mirrored by stampField backgroundColor. (4) Instead of a!kpiField, prices are hand-built from nested richTextItem sizes. (5) a!gaugeField repurposed as a marketing stat ("24% lower"), not progress.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#333", contents:{}); a!cardLayout(style:"#1155cc"|"#333"|"NONE", height:"AUTO", showBorder:false, shape:"SEMI_ROUNDED"); empty-flank a!columnsLayout centering with width:"WIDE_PLUS"; a!cardLayout(link:a!dynamicLink(...)) ×4; decorativeBarPosition:"TOP" with "ACCENT"/#674ea7/#e69138/#6aa84f; a!stampField(size:"TINY", backgroundColor per hue, contentColor:"#ffffff"|"STANDARD"); a!gaugeField(percentage:24.0, primaryText:a!gaugePercentage()); a!buttonWidget("Purchase Now", style:"OUTLINE", size:"LARGE") — renders white-filled on the colored card; Edit = a!buttonWidget(style:"OUTLINE", color:"SECONDARY") ×4; a!sectionLayout(divider:"BELOW"|"NONE"); responsive: stackWhen PHONE/TABLET_PORTRAIT throughout, illustration column swapped via showWhen a!isPageWidth (START/MEDIUM on small, END/FIT on large), price alignment flips LEFT/RIGHT by breakpoint.
- Chart types: gauge only; no custom colorScheme (default accent fill, ~#dddddd est. track).
- Interactive affordances: Purchase Now, "start a new quote" underline link, 4 drill-in rows (Coverage expanded — angle-down vs angle-right), 4 Edit buttons.

### Character & judgment
- **Register**: energetic-consumer + institutional — saturated brand-blue canvas, first-name greeting and playful illustration over sober neutral content cards and legal footer.
- **Why it works**: the only bordered+accent-barred element is the price strip, so the eye lands on the decision data first; icon|count|chevron rows compress vehicles/drivers/discounts to one tappable glance each; the dollar-itemized discount rail and 24% gauge answer "am I getting a deal?" beside the buy decision.
- **Why not boring**: full-bleed #1155cc canvas instead of default white/gray chrome; #ffe599 warm-yellow subtitle for second-level hierarchy on blue; tri-hue bar+stamp discount cards instead of a bullet list; a gauge as sales copy; white-filled CTA popping off the blue field.
- **Boring twin**: white page, "Quote Summary" formLayout, a gridField of coverages with edit icons, discounts as a read-only list, blue SOLID button bottom-right, disclaimer paragraph inline — accurate, and indistinguishable from an internal admin screen.
- **What to steal**: header-slot full-bleed banding with matched backgroundColor; cardLayout(link:) drill-in rows with trailing chevron; decorative-bar-echoed-in-stamp color coding.
- **Risks**: white icon on #e69138 stamp ≈2.2:1 (decorative but weak); underline is the only cue for "start a new quote"; on PHONE everything stacks to one very tall column; SECONDARY-outline Edit buttons can read disabled.

### Code cross-check (guidance/sail/sources/ins-quote-review.sail, 897 lines)
- **Code-verified palette**: #1155cc ×2 (ln 146, 842); #333 ×2 (887, 896); #ffe599 (67); #ffffff ×3 (96, 707, 745); #38761d (292); #674ea7 ×2 (668, 696); #e69138 ×2 (706, 734); #6aa84f ×2 (744, 772); #056CF2 (892, dead — decorativeBarPosition:"NONE"); tokens ACCENT/SECONDARY/STANDARD.
- **Notable techniques**: all-in-header with contents:{} (ln 1–2, 894–896); empty-column centering + WIDE_PLUS (5–8, 820–822); responsive illustration swap via paired showWhen a!isPageWidth columns (44–70 vs 129–151); linked-row cards a!cardLayout(link:a!dynamicLink) (343, 396, 449, 501); breakpoint-flipped price alignment (234–239, 255–259); empty columnsLayout as EVEN_MORE spacer (826–839).
- **Corrections**: the "solid white" CTA is actually style:"OUTLINE" inverted by the colored card (97–101); the blue on price bar/gauge/CTA label is the theme ACCENT, not #1155cc (samples ≈#4277e4 vs band ≈#2458c5 — screenshot color profile shifts all pixels, so code hexes govern); footer card and spacer exist in code but are cropped from the screenshot.
