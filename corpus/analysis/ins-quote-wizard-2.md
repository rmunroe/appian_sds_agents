# Analysis: ins-quote-wizard-2

## auto_insurance_quote_wizard_final_step.png

### Identification
- **Image**: auto_insurance_quote_wizard_final_step.png | **Source page**: ins-quote-wizard-2 | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) insurance quote wizard 2"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (final). Tier A as suggested — full-page 3360x2100, no override. CODE-VERIFIED: the .sail is byte-identical to ins-quote-wizard-1's (initial `stepNumber: 2`); the screenshot shows the 4th `choose()` branch (Quote, "6 of 6"), captured after navigation.

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer / first-time-public — anonymous consumer at the decision moment of an insurance acquisition funnel; one visit, high drop-off risk.
- **Domain & brand context**: direct-to-consumer P&C carrier ("INSURECORP"); Geico/Progressive-style quote flow; plum/magenta brand.
- **Top 3 user tasks (ranked)**: 1. Decide on the $113.50/mo offer (purchase). 2. Audit what the price includes; edit anything wrong. 3. Defer gracefully: email the quote to self.
- **Implied requirements**: "Must show the monthly price without scrolling"; "Must offer one solid CTA plus a no-pressure deferral path"; "Must let users inspect and edit every coverage limit without leaving the quote"; "Must show the journey complete (6/6)"; "Must capture an email on deferral"; "Must keep legal disclosures on every step" (footer, below fold).
- **Data model sketch** (read off pixels): Quote{premium $113.50/mo, discounts:3 → −$42.90/mo, vehicles:1, drivers:1, email}; Coverage 1..* per quote {name, per-person limit, per-accident limit} ×4 — Bodily Injury 50k/100k, UM/UIM 50k/100k, Property Damage 75k, Medical Payments 25k/50k.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#333 contentsPadding=NONE (whole page in header slot; contents:{})
├─ CARD(brand bar: logo + [ENGLISH|ESPAÑOL], style=#73245d)
├─ COLUMNS [spacer:NARROW_PLUS:WIDE:spacer] margins=EVEN_MORE
│  ├─ WIZARD-STEP 6/6 vertical rail: 6 TINY ACCENT stamps + connectors (desktop-only)
│  └─ content column:
│     ├─ title "Here's your personalized quote"
│     ├─ CARD(price fork, border, decorativeBar TOP ACCENT)
│     │  └─ SBS $113.50 /Month | PURCHASE NOW | – or – | SAVE FOR LATER (in-place swap → email + SEND QUOTE + ✕)
│     ├─ "Auto Insurance" label
│     ├─ CARD(link) ×3: "3 discounts $42.90/mo →" / "1 vehicle →" / "1 driver →"
│     ├─ CARD(link, "Coverage" + angle-down, marginBelow=NONE)  ← accordion header
│     └─ CARD(4× SECTION divider=BELOW: name + limits + EDIT)   ← accordion body
├─ CARD(spacer, h=SHORT_PLUS)
└─ CARD(footer: logo + legal, style=#333, h=TALL) — below fold
```
- **Above the fold**: everything except spacer and dark footer — brand bar, 6-stamp rail, title, price card, three summary rows, expanded Coverage with all four limit blocks.
- **Reading order**: F — magenta rail anchors left, then title → price card → rows down the center column.
- **Hierarchy rationale**: price card is the only bordered-and-decorated block, directly under the title (task 1); PURCHASE NOW is the sole solid fill, SAVE FOR LATER demoted to outline (task 3); the audit compresses into card-link rows with chevrons (task 2).
- **Density**: 2 — one decision on screen; ~9 content blocks per viewport, EVEN_MORE margins, wide empty gutters.
- **Ratios & spacing**: centered via empty flanking columns [empty:NARROW_PLUS:WIDE:empty], marginAbove/Below EVEN_MORE; price card padding STANDARD; rows marginBelow STANDARD; stepper rows spacing NONE (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED via SAIL; renderings est.)
- **Palette**: brand bar #73245d; page base #333 (below fold only); content on white #ffffff (cards style:"NONE"); accent = token "ACCENT" rendering ≈#af2b9b (est.); savings green #38761d; text ≈#222222 (est.) + muted #666666; borders/dividers/connector ≈#d4d4d4 (est.); other branches carry #efefef, #434343, #f8eff3, #BF04A0, #d9d9d9, #056CF2.
- **Color application points**: brand slab; six stamp fills; price-card top bar; SOLID CTA fill; OUTLINE CTA border+text; ENGLISH chip text; one green amount. Row icons/chevrons stay near-black.
- **Typography moves**: title LARGE; "$113.50" LARGE+STRONG with "/ Month" MEDIUM; row labels MEDIUM; coverage names STANDARD+STRONG over plain limit lines; step labels STANDARD, STRONG only on "Quote"; buttons render uppercase (title-case in code).
- **Imagery stance**: styled icons only — white glyphs in accent stamps, near-black MEDIUM_PLUS row icons; no photos on this branch.
- **Card treatment**: price card = thin border + ACCENT decorativeBar TOP, showShadow:false; summary rows = default thin-border white cards, flat; structural slabs = flat style-hex color, showBorder:false.
- **Signature moves**: (1) Instead of a "success" hero, the price sits in the page's only decorated card — decorativeBarPosition:"TOP" + ACCENT as spotlight. (2) Instead of navigating away, "Save for Later" swaps the card's contents in place via two sideBySideLayouts with complementary showWhen on local!showSaveForLater. (3) Instead of a read-only table, each category is a card-as-link; the Coverage row flips its chevron to angle-down-bold and butts against the detail card (marginBelow NONE) to fake an accordion. (4) Limits as sectionLayouts divider:"BELOW" with right-aligned OUTLINE/SECONDARY Edit buttons. (5) A single green #38761d amount flags "money saved".

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#333", contentsPadding:"NONE"); a!cardLayout(style hex|"NONE", decorativeBarPosition:"TOP" decorativeBarColor:"ACCENT", showShadow:false, link:a!dynamicLink, height:"AUTO"|"SHORT_PLUS"|"TALL"); a!stampField(size:"TINY", backgroundColor:"ACCENT"); a!sideBySideLayout(paired showWhen); a!buttonWidget(SOLID/OUTLINE LARGE; Edit = OUTLINE color:"SECONDARY"; language SMALL OUTLINE/LINK); a!textField(labelPosition:"COLLAPSED"); a!richTextIcon(angle-right-bold, angle-down-bold, times-circle + dynamicLink linkStyle:"STANDALONE"); a!sectionLayout(divider:"BELOW"); spacer columnLayouts; stackWhen incl. DESKTOP_NARROW.
- Chart types: none.
- Interactive affordances: purchase/save fork; in-place email capture with cancel; four card-links; four Edit buttons; language toggle; stepper display-only.

### Character & judgment
- **Register**: energetic-consumer + institutional — saturated accent CTA and savings framing over a sober, editable ledger of coverage limits.
- **Why it works**: monthly framing plus the visible −$42.90/mo line makes the price feel earned; the all-magenta 6/6 rail is a receipt of effort at the buy moment; purchase vs. defer is a true fork — solid vs. outline of the same accent — so hesitation has a sanctioned path.
- **Why not boring**: the only decorated border on the page crowns the price; the summary is tappable card-links, not a static table; deferral lives inside the price card via state swap, not a modal; one green number breaks a two-hue page.
- **Boring twin**: a white formLayout titled "Quote Summary" with a read-only key-value grid of coverages, total at the bottom, gray Back/Submit bottom-left, discounts in a footnote, progress as "Step 6 of 6" text.
- **What to steal**: paired-showWhen in-card state swap; card-as-link rows faking an accordion via marginBelow:"NONE"; decorativeBar TOP ACCENT as price spotlight.
- **Risks**: current-step cue is bold-text-only (all six stamps identical magenta); stampField accessibilityText contradicts visuals here ("Future Step" on completed/current stamps); stepper hidden below DESKTOP widths, so no progress context on tablet/phone; the 4-item price sideBySideLayout has no stacking control and will squeeze narrow; white-on-#af2b9b ≈5.8:1 passes AA with little margin.

### Code cross-check (guidance/sail/sources/ins-quote-wizard-2.sail, 2954 lines)
- **Code-verified palette**: #73245d ×6, #333 ×8, #666666 ×11, #d9d9d9 ×9, #056CF2 ×4, #efefef ×2, #434343 ×2, #f8eff3, #BF04A0, #38761d (line 2525); tokens ACCENT/STANDARD/SECONDARY. ACCENT is never a hex in code — ≈#af2b9b is pixel-estimated.
- **Notable techniques**: choose(local!stepNumber) branch-per-screen wizard, buttons write stepNumber (line 6; this branch starts 1899); stamp+connector stepper in EXTRA_NARROW columns, desktop-only showWhen (2332); save-for-later swap via complementary showWhen pair (2409, 2473); price card decorativeBar TOP ACCENT + showShadow:false (2482–2483); cards-as-links (2556–2714) with accordion join via marginBelow:"NONE" (2717–2718); whole page in header slot, contents:{} + backgroundColor #333 (2949–2951).
- **Corrections**: only 4 choose() branches exist — the rail advertises 6 steps but "Next: Your Vehicles" writes value 4, jumping straight to this Quote branch (Vehicles/Drivers/Coverage-Options screens unimplemented); button labels title-case in code, uppercase in render; footer decorativeBarColor #056CF2 inert (position "NONE"); nav bg sampled ≈#6a2b5b — code's #73245d wins.
