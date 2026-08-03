# Analysis: ux-designing-for-your-users

Page has NO SAIL source; all palettes are pixel-sampled `(est.)`. Three brands appear: "Thatcher." bank (mortgage wizard), "Sailaway Cruises" (exec dashboard), "Panthère Insurance" (consumer quote wizard).

## complex_form.gif

### Interaction: paper-form scroll (gif: complex_form.gif)
SKIPPED: decorative/motivational, no interaction teaching content. Frames f0–f109 are an auto-scrolling scan of the paper Fannie Mae Form 1003 / Freddie Mac Form 65 "Uniform Residential Loan Application" (8 dense pages of black-and-white boxed tables, checkbox rows, signature lines; intermediate frames are GIF delta frames, mostly blank). It is the "before" artifact motivating the mortgage_1–3 wizard redesign — no SAIL UI, no state changes to chart. OBSERVED.

## cruise_1.png

### Identification
- **Image**: cruise_1.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/cruise_1.png ("Example: An information-rich dashboard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-executive

### Use-case reconstruction (INFERRED)
- **Persona**: cruise-line route/revenue executive; monthly-exec cadence, reviewing one route's financial performance per sitting.
- **Domain & brand context**: cruise operator "Sailaway Cruises"; travel-premium brand tempered by corporate steel-blue chrome.
- **Top 3 user tasks (ranked)**: 1. Judge route health from headline KPIs (occupancy, price, satisfaction). 2. Inspect occupancy trend and drill into a weak/strong month. 3. Check revenue mix and operational context (itinerary, vessel, position).
- **Implied requirements**: "Must expose the three route KPIs without reading the body"; "Must show 13 months of occupancy trend with per-month drill-down in place"; "Must rank revenue categories by contribution"; "Must keep vessel/itinerary reference data one glance away"; "Must fit one route on one screen with minimal scrolling".
- **Data model sketch**: CruiseRoute{code CBN-234, period Jan 2017–Jan 2018, name "7-Day Western Caribbean", avgOccupancy 102.1%, avgPaxPrice $936.49, satisfaction 4.63} —1:1→ Vessel{MV Saarinen, registry Bermuda, class Supreme, in-service 2013-05-19, homePort Miami, features[3 icons]}; ItineraryDay ×7{day, port→record link, arrival, departure}; RevenueCategory ×5+{name, revenue $219.0M…$6.5M, contribution 72.85%…2.18%}; MonthlyMetric ×13{month, occupancy 99–105.5}; CabinClass{Lux 103.9, Suites 110.4, …}. OBSERVED labels/values.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV bg=#335e81 (CRUISES active #3783b8 + white underline | SHIPS | EMPLOYEES | VENDORS | avatar+logo)
├─ BILLBOARD h≈370(logical≈220) photo=aerial-beach overlay=bottom-band,dark≈55%
│  └─ COLUMNS [2:1:1:1] eyebrow+title | KPI ×3 (label+?icon / icon+colored value)
└─ COLUMNS [2:3:3]
   ├─ SECTION "VESSEL" (photo card, flag+name-link, label/value ×5) └─ SECTION "CURRENT POSITION" (embedded map+pin)
   ├─ SECTION "ITINERARY" GRID(4-col × 7 rows) └─ SECTION "REVENUE BREAKDOWN" GRID(3-col × 5 rows, sorted desc)
   └─ SECTION "METRICS" TABS ×3 pill + CHART(line, 13 pts) + CHART(bar-h yellow, by cabin class)
```
- **Above the fold**: nav, full billboard + 3 KPIs, all six section starts; horizontal bar chart partially cut at bottom — modest scroll remains.
- **Reading order**: F — billboard title → KPI trio rightward, then columns left→right.
- **Hierarchy rationale**: KPIs live in the billboard so task 1 completes before any scanning; METRICS gets the widest right column and the only interactive tabs (task 2); reference data (vessel/map) is narrowest, leftmost, glanceable not dominant.
- **Density**: 4 — six labeled zones, 12 grid rows, 13-point line chart and 2 bar rows in one viewport; compact grid rows (~40px logical) but full section gaps.
- **Ratios & spacing**: body ≈ [2:3:3]; section label to content gap tight (≈ marginBelow "LESS"); grids borderless with hairline row rules #ededed (est.).

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; nav #335e81 (est.); active tab/links/tab-pill #3783b8 (est.); KPI green #58bd38 (est.); KPI red #ec3955 (est.); bar yellow #f2d050 (est.); line #87b4e7 (est.); section labels #767676; values #222222; billboard overlay ≈55% black band (est.).
- **Color application points**: nav bar + active tab; billboard KPI values (semantic green/red); every drillable noun (ports, revenue categories, vessel name) in link blue #3783b8; tab pill fill; chart series; feature icons.
- **Typography moves**: billboard title white bold ≈ EXTRA_LARGE with SMALL white eyebrow above; KPI values ≈ LARGE bold colored, labels SMALL bold white; section headers all-caps #767676 ≈ STANDARD/MEDIUM; grid text STANDARD with right-aligned numerics; label/value pairs bold-left, plain right-aligned.
- **Imagery stance**: photos carry identity (billboard aerial beach, vessel photo, satellite map); glyph icons only as accents (bed/$ KPI icons, star rating, feature icons).
- **Card treatment**: none — flat white page; zones separated purely by all-caps labels and whitespace, no borders/shadows.
- **Signature moves**: (1) Instead of a text page title, a!billboardLayout with bottom dark overlay bar carrying title + KPI trio. (2) Instead of boxed a!kpiField defaults, hand-built rich-text KPIs: white icon + green/red value colored by performance vs target (102.1% green, $936.49 red). (3) Instead of chart-only metrics, a pill tab row (OCCUPANCY solid #3783b8 / PRICE / SATISFACTION) switching one chart region. (4) Revenue grid pre-sorted by Contribution with visible ↓ arrow — argument built into the data. (5) 4.5 white stars + numeric 4.63 doubling the satisfaction encoding.

### Component inventory (OBSERVED, INFERRED constructs)
- a!billboardLayout(backgroundMedia: photo, overlayPositionBar:"BOTTOM", overlayStyle:"DARK") with a!columnsLayout of a!richTextDisplayField KPIs; body a!columnsLayout ×3; a!sectionLayout labels likely rich-text all-caps rather than default section labels; a!gridField ×2 (itinerary; revenue with sortable Contribution); a!lineChartField(height compact), a!barChartField horizontal with custom yellow colorScheme; embedded Google map (a!webContentField or image); a!richTextItem links (a!recordLink/a!dynamicLink) on ports/categories/vessel.
- Chart custom colorScheme: yes (yellow #f2d050 bars; light-blue line).
- Interactive affordances: metric tabs, in-place month drill-down (see cruise_drill_down.gif), record links throughout, sortable grid, "View larger map".

### Character & judgment
- **Register**: authoritative-executive + premium-editorial — dense sorted numerics under a resort-photo billboard.
- **Why it works**: KPIs answer "is this route healthy?" in the header band (green/green/red reads in ~1s); consistent all-caps #767676 labels make six zones scannable as a table of contents; every noun that has a record is a blue link, so drill paths are self-evident.
- **Why not boring**: photo billboard with KPI overlay instead of gray title bar; semantic red on the price KPI (admitting a miss on the hero); tabbed in-place metrics instead of three stacked charts; borderless sections — whitespace + label discipline instead of card chrome.
- **Boring twin**: white page titled "Route CBN-234", three default boxed KPI cards, then five bordered a!sectionLayouts stacked full-width with default-palette charts and an unsorted revenue table; no links, map on a separate tab.
- **What to steal**: billboard-as-header with KPI overlay trio; all-caps gray section-label system on a flat page; pre-sorted contribution column with visible sort arrow.
- **Risks**: white/green/red text over photo depends on the 55% band (photo highlights could break AA); red/green KPI semantics fail colorblind users without icons; 3-column body will stack long on phone; "?" help targets tiny.

### Code cross-check
none — no SAIL source on this page.

## cruise_billboard.png

Tier override: listed A, treated as annotated teaching crop (tier B style) — it is cruise_1 with the billboard outlined in orange #f4ae56 (est.) and the rest whitewashed ≈50%; a fresh tier-A pass would duplicate cruise_1.

- **Produces it**: a!billboardLayout(backgroundMedia: aerial photo, overlayPositionBar:"BOTTOM", overlayStyle:"DARK") containing a!columnsLayout: [eyebrow "CBN-234 / Jan 2017 - Jan 2018" SMALL white + title "7-Day Western Caribbean" EXTRA_LARGE bold white] : 3 rich-text KPI columns (bold SMALL white label + ? icon; icon + LARGE value: 102.1% #58bd38 (est.), $936.49 #ec3955 (est.), stars + 4.63 #58bd38 (est.)).
- **Teaches**: the billboard doubles as page header AND KPI strip — scannable without reading the body; size+color+icon rich text makes metrics legible on photo (page text's stated point). OBSERVED.
- **Marker**: neutral

## cruise_drill_down.gif

### Interaction: metrics in-place drill-down (gif: cruise_drill_down.gif)
- **State chart**: (1) METRICS shows monthly OCCUPANCY line chart (cruise_1 state) → (2) click a month point → (3) chart region replaced in place: "← Back to all months" link, "August 2017" + green "103.5%", GRID Departure|APCD|PCD|Occupancy ×4 weekly rows, "Active Promotions" row (Kids Sail badge) → (4) back link restores the chart; tab pills persist throughout. OBSERVED f0; f7–f27 are near-blank GIF delta frames — sequence reconstructed from f0 + cruise_1 + page text (INFERRED).
- **SAIL mechanism**: showWhen toggle — chart link writes local!selectedMonth, section swaps chart ↔ detail grid; back link nulls it.
- **UX purpose**: progressive disclosure; dashboard frame stays constant for orientation.
- **Replicate when**: a chart point invites "why?" | **Cost**: low — one local + two showWhen branches.

## cruise_sections.png

Tier override: listed A, treated as annotated teaching crop (tier B style) — cruise_1 with orange #f4ae56 (est.) boxes drawn around the five body sections (VESSEL, ITINERARY, METRICS, REVENUE BREAKDOWN, CURRENT POSITION), billboard whitewashed.

- **Produces it**: three a!columnsLayout columns ≈[2:3:3], each stacking a!sectionLayouts whose labels are all-caps #767676 rich text ("VESSEL", "CURRENT POSITION" | "ITINERARY", "REVENUE BREAKDOWN" | "METRICS").
- **Teaches**: the page body is a set of consistently-labeled modules — identical label treatment per zone lets a viewer learn page structure by scanning five words; zones need no borders when labels + whitespace do the separation. OBSERVED.
- **Marker**: neutral

## insurance_1.png

### Identification
- **Image**: insurance_1.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/insurance_1.png ("Example: An easy-to-use price quote wizard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page (wizard start)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer / first-time-public — policyholder or prospect requesting a home-insurance quote; zero training, abandonment-prone.
- **Domain & brand context**: consumer P&C carrier "Panthère Insurance"; reassuring, low-pressure direct-to-consumer feel.
- **Top 3 user tasks (ranked)**: 1. Start the quote (single CTA). 2. Feel reassured it's quick and covers their situation. 3. Reach other portal areas (coverage, claims, offers) if quoting isn't the goal.
- **Implied requirements**: "Must present exactly one action on the start screen"; "Must set the expectation of speed ('in just minutes')"; "Must signal breadth of insurable things pre-form"; "Must avoid any form field on the first screen".
- **Data model sketch**: none on screen beyond nav entities (Coverage, Quote, Claims, Offers); icon quintet enumerates insurable domains {health, life/person, home, car, pet}. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV bg=#e3e3e3 (MY COVERAGE | GET A QUOTE active #254571 | MY CLAIMS | SPECIAL OFFERS | avatar+logo)
└─ BILLBOARD h≈full-viewport illustration bg=#dde5e7 skyline=#bbc8cf overlay=center-stack
   ├─ icons ×5 #8fa1cc (EKG-heart, person, home, car, paw)
   ├─ tagline "We'll help you protect everything that's important" #767676
   ├─ headline "Get a personalized quote in just minutes" #332f7f
   └─ BUTTON "START NOW" solid #3b3691
```
- **Above the fold**: everything — the page is one viewport.
- **Reading order**: single-column centered stack.
- **Hierarchy rationale**: headline is the largest element (task 2's promise of speed); START NOW is the only saturated fill on the page (task 1); icons sit above as a 2-second breadth story (task 2).
- **Density**: 1 — one idea, one button, ≥60% of viewport is empty illustration field.
- **Ratios & spacing**: content stack centered horizontally, positioned in upper 40%; skyline strip occupies bottom ~35% as pure decoration.

### Styling specifics (OBSERVED)
- **Palette**: header #e3e3e3, header glyphs #444444, active tab #254571 (est.); billboard field #dde5e7 (est.), skyline silhouette #bbc8cf (est.); icons #8fa1cc (est.); tagline #767676; headline #332f7f (est.); CTA #3b3691 (est.) with white text.
- **Color application points**: active nav tab; icon row; headline; single CTA — indigo family only, everything else neutral.
- **Typography moves**: headline ≈ LARGE_PLUS regular-weight indigo (sentence case, conversational); tagline STANDARD gray; CTA all-caps STANDARD on solid; nav all-caps SMALL.
- **Imagery stance**: flat illustration (two-tone city skyline incl. ferris wheel) + glyph icons; deliberately no photo — softer than stock imagery.
- **Card treatment**: none — one flat illustrated field.
- **Signature moves**: (1) Instead of starting with form fields, a full-viewport illustrated billboard whose only control is START NOW. (2) Instead of listing products in text, five icons enumerate insurable things in one glance. (3) Instead of brand-loud photography, a two-tone #dde5e7/#bbc8cf skyline keeps contrast low so the indigo CTA is the darkest object. (4) Speed promise written into the headline copy itself.

### Component inventory (OBSERVED, INFERRED constructs)
- a!billboardLayout(backgroundMedia: illustration, overlayStyle none/full-transparent) or full-height styled card; a!richTextDisplayField(icon row, size MEDIUM icons; tagline; headline size LARGE_PLUS color hex), a!buttonArrayLayout(single a!buttonWidget style SOLID, align CENTER).
- Chart types: none.
- Interactive affordances: one button; site nav tabs.

### Character & judgment
- **Register**: warm-community + institutional — "We'll help you protect everything that's important" over restrained indigo/gray chrome.
- **Why it works**: exactly one clickable element in the content area — task funneling is absolute; the promise "in just minutes" pre-answers the effort question that kills quote starts; icons communicate scope with zero reading.
- **Why not boring**: quote flows usually open on a form — this opens on an illustrated promise; two-tone skyline instead of stock-photo house; the CTA's #3b3691 is the page's only saturated fill, giving it disproportionate pull.
- **Boring twin**: "Get a Quote" H1 top-left on white, a dropdown for product type, ZIP field, Continue bottom-right, and a hero stock photo of a family on a porch.
- **What to steal**: the one-action landing before any wizard; icon-quintet scope preview; saturate only the CTA.
- **Risks**: #8fa1cc icons and #767676 tagline on #dde5e7 are decorative-contrast only (~2.5–4:1); page text itself flags the tradeoff — extra click vs reassurance; verify the tall billboard doesn't push CTA below fold on short laptop viewports.

### Code cross-check
none — no SAIL source on this page.

## insurance_2.png

### Identification
- **Image**: insurance_2.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/insurance_2.png ("Example: An easy-to-use price quote wizard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: same first-time-public quote seeker as insurance_1.
- **Domain & brand context**: Panthère Insurance consumer funnel, question 1.
- **Top 3 user tasks (ranked)**: 1. Pick what to insure (Home/Car/Pet). 2. Understand what each choice covers before committing. 3. Not feel lost (question phrasing carries orientation).
- **Implied requirements**: "One question per screen"; "Answer choices must be full-card click targets"; "Each choice must carry a plain-language definition"; "Selection must advance the wizard without a separate Next click".
- **Data model sketch**: QuoteRequest.assetType ∈ {Home: "House, townhome, or condo and its contents", Car: "Personal automobiles and their passengers", Pet: "Cats, dogs, and exotic animals"}. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (as insurance_1)
├─ HEADLINE "What do you want to protect?" #332f7f centered
└─ COLUMNS [1:1:1] centered, ≈27% margins each side
   └─ CARD(icon #8fa1cc → title bold #332f7f LARGE → 2-line definition #222222, white bg, 1px border, portrait ≈290×430 logical)  ×3
```
- **Above the fold**: everything; no forward button, no back link (first question).
- **Reading order**: single-column: question → card row left-to-right.
- **Hierarchy rationale**: question is the only large text (task 3 orientation); three equal cards force a choice with no default (task 1); definitions sit inside the click target (task 2).
- **Density**: 1 — one question, three targets, vast whitespace inside portrait cards.
- **Ratios & spacing**: 3 equal columns with wide outer gutters; icon/title/description center-aligned with generous vertical padding (cards ~60% empty).

### Styling specifics (OBSERVED)
- **Palette**: page #ffffff; headline/card titles #332f7f (est.); icons #8fa1cc (est.); descriptions #222222; card border ≈#d9d9d9 1px (est.); header as insurance_1.
- **Color application points**: headline, card titles, icons — indigo family only; no buttons on page.
- **Typography moves**: question ≈ LARGE_PLUS regular indigo; card titles bold ≈ LARGE; definitions STANDARD centered 2-liners.
- **Imagery stance**: single glyph icon per card (home/car/paw), MEDIUM, periwinkle.
- **Card treatment**: white, thin 1px border, flat — no shadow, no fill; whole card is the affordance.
- **Signature moves**: (1) Instead of a radioButtonField + Next, cards ARE the answers — click selects and advances (no forward button exists). (2) Instead of terse labels, each card embeds its own definition, killing the "does condo count?" doubt inline. (3) Portrait cards oversized far beyond content → large motor targets (page text's stated rationale). (4) Question-as-headline replaces any visible stepper.
- 
### Component inventory (OBSERVED, INFERRED constructs)
- a!columnsLayout ×3 with a!cardLayout(link: a!dynamicLink writing assetType + step, showBorder:true) each containing a!richTextDisplayField stack; alternatively a!cardChoiceField(cardTemplateTile) with auto-advance saveInto.
- Chart types: none.
- Interactive affordances: 3 card links; nav tabs.

### Character & judgment
- **Register**: warm-community + calm-clinical — conversational second-person question, sterile white field.
- **Why it works**: decision cost is minimal (3 options, mutually exclusive, defined); zero competing chrome — nothing else on the page is clickable; card targets ≈290×430 logical px are near-impossible to miss.
- **Why not boring**: no Next button at all — selection is navigation; definitions inside targets instead of helper text under a radio group; three-across symmetry with no pre-selection avoids steering.
- **Boring twin**: "Product Type *" dropdown with Home/Car/Pet, helper text below, Back/Next buttons bottom-left, progress bar "Step 1 of 4".
- **What to steal**: card-as-answer auto-advance; definition-in-target; question-as-title orientation.
- **Risks**: flat 1px-border cards give weak clickability affordance (no hover state visible in a static shot); no visible progress indicator — acceptable at 4 steps, dangerous if the flow grows; three cards will stack tall on phone.

### Code cross-check
none — no SAIL source on this page.

## insurance_3.png

### Identification
- **Image**: insurance_3.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/insurance_3.png ("Example: An easy-to-use price quote wizard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step

### Use-case reconstruction (INFERRED)
- **Persona**: same first-time quote seeker; has chosen Home.
- **Domain & brand context**: Panthère funnel, question 2 — dwelling type.
- **Top 3 user tasks (ranked)**: 1. Classify their dwelling (House vs Condo). 2. Resolve edge cases (townhouse? duplex?) from definitions. 3. Back out if the previous answer was wrong.
- **Implied requirements**: "Binary questions get exactly two cards"; "Definitions must absorb edge cases ('single family home, townhouse, or duplex')"; "Back must be available from question 2 onward"; "Layout pattern must repeat from prior step for learnability".
- **Data model sketch**: QuoteRequest.homeType ∈ {House: "single family home, townhouse, or duplex", Condo: "multi-family building in which you own a unit"}. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (as insurance_1)
├─ HEADLINE "Is your home a house or a condo?" #332f7f centered
├─ COLUMNS [1:1] centered — CARD(House: home icon) | CARD(Condo: building icon), landscape ≈450×280 logical
└─ LINK "← Go back" indigo, centered
```
- **Above the fold**: everything.
- **Reading order**: single-column: question → two cards → escape hatch.
- **Hierarchy rationale**: identical grammar to insurance_2 so step 2 costs zero re-learning; cards widen to fill the 2-up row (constant total width, bigger targets); Go back is a quiet link, not a button — present but non-competing.
- **Density**: 1 — one binary question per viewport.
- **Ratios & spacing**: two equal columns, same outer gutters as insurance_2; single-line definitions leave cards ~65% empty.

### Styling specifics (OBSERVED)
- **Palette**: identical system to insurance_2 (#332f7f headings (est.), #8fa1cc icons (est.), #222222 body, ~#d9d9d9 borders (est.), white page).
- **Color application points**: headline, card titles, icons, Go back link — indigo only.
- **Typography moves**: as insurance_2; definitions single-line here.
- **Imagery stance**: one glyph per card (house / multi-story building).
- **Card treatment**: white, 1px border, flat, full-card link.
- **Signature moves**: (1) Card count tracks answer count — 3-up becomes 2-up wider cards rather than leaving a ghost column. (2) Edge cases legislated in the definition line instead of a help icon. (3) Back is a text link with ← glyph, visually one register below the answer cards — reversal is possible but never the salient action.

### Component inventory (OBSERVED, INFERRED constructs)
- a!columnsLayout ×2 of a!cardLayout(link) as insurance_2; a!richTextDisplayField "← Go back" with a!dynamicLink decrementing step, align CENTER.
- Chart types: none.
- Interactive affordances: 2 card links, go-back link.

### Character & judgment
- **Register**: warm-community + calm-clinical.
- **Why it works**: the repeated template means the user's second decision is faster than the first (learned grammar); definitions preempt the #1 dwelling-type confusion (townhouse) that would otherwise cause mis-quotes.
- **Why not boring**: refuses a Yes/No radio in favor of two labeled artifacts with icons; the question reads like a person ("Is your home a house or a condo?"), not a schema field ("Dwelling type *").
- **Boring twin**: radio pair House/Condo under a bold field label, tooltip icon for definitions, Back/Next buttons bottom-left.
- **What to steal**: scale card width to option count; put the edge case in the definition; back-as-link below answers.
- **Risks**: same affordance/progress caveats as insurance_2; centered Go back link is small (~90×20 logical) — modest target.

### Code cross-check
none — no SAIL source on this page.

## insurance_4.png

### Identification
- **Image**: insurance_4.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/insurance_4.png ("Example: An easy-to-use price quote wizard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (form)

### Use-case reconstruction (INFERRED)
- **Persona**: same first-time quote seeker; final data entry before the quote.
- **Domain & brand context**: Panthère funnel, home-details step.
- **Top 3 user tasks (ranked)**: 1. Confirm/adjust four home facts. 2. Fire the quote (GET QUOTE). 3. Sense the finish line ("Almost there!").
- **Implied requirements**: "Rating inputs must be ≤4 and one row"; "Every field must carry a plausible default (2018 / 1501-1750 sq ft / Frame / None)"; "Ranges instead of exact numbers wherever tolerable"; "Copy must acknowledge progress in words".
- **Data model sketch**: QuoteRequest{yearBuilt: 2018, sqftRange: "1501-1750 sq ft", construction: Frame, pool: None} — all enumerations. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (as insurance_1)
├─ HEADLINE "Almost there! Please tell us a few more things about your home." centered
├─ COLUMNS [1:1:1:1] centered — DROPDOWN ×4 (Year Built | Square Footage | Construction | Swimming Pool), bold labels above
├─ BUTTON "GET QUOTE" solid #3b3691 centered
└─ LINK "← Go back" centered
```
- **Above the fold**: everything.
- **Reading order**: single-column: reassurance → one input row → CTA.
- **Hierarchy rationale**: the headline spends its size on emotion ("Almost there!") not schema; the four dropdowns sit in one row to look like one small chore; GET QUOTE is the lone solid fill — the reward action.
- **Density**: 1 — four controls and a button on a full viewport (page otherwise empty).
- **Ratios & spacing**: 4 equal columns spanning the same center band as prior steps' cards; CTA centered beneath with a full blank row separating.

### Styling specifics (OBSERVED)
- **Palette**: white page; headline #332f7f (est.); labels #222222 bold; dropdown borders ≈#d9d9d9 (est.); CTA #3b3691 (est.); Go back indigo link.
- **Color application points**: headline + CTA + back link only.
- **Typography moves**: headline ≈ LARGE_PLUS; field labels STANDARD bold; dropdown values STANDARD; CTA all-caps.
- **Imagery stance**: none — first imagery-free step in the flow.
- **Card treatment**: none; bare fields on white.
- **Signature moves**: (1) Every dropdown ships pre-answered with the statistically-safe default — the step can be legitimately completed with zero interactions. (2) Square footage as ranges ("1501-1750 sq ft") — precision the user actually has. (3) Progress reassurance in copy ("Almost there!") instead of a progress bar. (4) The verb on the button is the payoff ("GET QUOTE"), not "Next".
 
### Component inventory (OBSERVED, INFERRED constructs)
- a!columnsLayout ×4 of a!dropdownField(labelPosition:"ABOVE", defaults set); a!buttonArrayLayout(a!buttonWidget "GET QUOTE" style SOLID, align CENTER); rich-text go-back link.
- Chart types: none.
- Interactive affordances: 4 dropdowns, submit button, back link.

### Character & judgment
- **Register**: warm-community + calm-clinical — exclamatory reassurance over a clinical one-row form.
- **Why it works**: perceived effort ≈ four flicks of a dropdown; defaults convert "fill this form" into "check our guesses", the cheapest cognitive mode; the single solid button leaves no doubt about the exit.
- **Why not boring**: the only traditional form in the flow is compressed to one row; conversational headline where a stepper would be; enumerated ranges dodge the "go find your sq ft" errand.
- **Boring twin**: vertical stack of six labeled text inputs (Year built*, Sq ft*, …) with blank values, validation asterisks, Submit bottom-left.
- **What to steal**: default-everything dropdown row; ranges over exact numerics; name the button after the reward.
- **Risks**: defaults can be submitted unread → mispriced quotes (worth an inline review later — insurance_5 shows no recap); four columns will stack on phone into a taller-feeling form; no field-level help if "Frame" construction confuses.

### Code cross-check
none — no SAIL source on this page.

## insurance_5.png

### Identification
- **Image**: insurance_5.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/insurance_5.png ("Example: An easy-to-use price quote wizard")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (results / plan comparison)

### Use-case reconstruction (INFERRED)
- **Persona**: same first-time quote seeker at the payoff screen.
- **Domain & brand context**: Panthère funnel terminus — pricing presentation, conversion moment.
- **Top 3 user tasks (ranked)**: 1. Pick a coverage option (ideally the recommended one). 2. Compare price vs coverage levels across the three. 3. Go back and tweak inputs if prices surprise.
- **Implied requirements**: "Must present exactly 3 options"; "Must visually nominate a default ('BEST FOR MOST PEOPLE')"; "Price must dominate each card"; "Coverage lines must align across cards for row-wise comparison"; "CTA must be reachable without reading details".
- **Data model sketch**: QuoteOption ×3 {label: HIGHER DEDUCTIBLE | BEST FOR MOST PEOPLE | ENHANCED COVERAGE; premium: $57/$65/$79 per mo; coverageHome: $300k/$300k/$350k; belongings: $200k/$200k/$300k; liability: $500k/$500k/$750k; deductible: $2,500/$1,000/$1,000}. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (as insurance_1)
├─ HEADLINE "Here are your personalized coverage options!" centered
├─ COLUMNS [1:1:1] centered
│  └─ CARD ×3: all-caps label → $XX /mo EXTRA_LARGE → BUTTON "CHOOSE THIS QUOTE" solid →
│     4× (all-caps label / value) stacked, centered
│     (center card bg #edf4f6 tint; side cards #f7f8f4)
└─ LINK "← Go back" centered
```
- **Above the fold**: everything (cards ≈865 logical px tall).
- **Reading order**: single-column then row-wise across cards — aligned rows make horizontal comparison work.
- **Hierarchy rationale**: price is each card's largest object (task 2's first axis); the middle card's tint + "BEST FOR MOST PEOPLE" pre-answers task 1 for satisficers; CHOOSE buttons sit above the details so deciders don't scroll past data they won't read.
- **Density**: 2 — three structured cards, ~15 aligned data points, wide margins.
- **Ratios & spacing**: three equal columns, same center band as insurance_2; generous row spacing between label/value pairs (~2 line-heights).

### Styling specifics (OBSERVED)
- **Palette**: page #ffffff; recommended card bg #edf4f6 (est.), flanking cards #f7f8f4 (est.), 1px borders ≈#d9d9d9 (est.); headline #332f7f (est.); prices #222222; card/coverage labels #767676 all-caps; buttons #332f7f (est.) white text.
- **Color application points**: headline, three identical CTAs, the center card's blue tint — the tint is the only differentiator color on the page.
- **Typography moves**: prices EXTRA_LARGE bold with SMALL "/mo" suffix; option labels all-caps STANDARD #767676; coverage labels all-caps SMALL bold #222222 over STANDARD values; headline ≈ LARGE_PLUS.
- **Imagery stance**: none — numbers are the imagery.
- **Card treatment**: filled (subtle tints) + 1px border, flat; tint difference #edf4f6 vs #f7f8f4 encodes recommendation.
- **Signature moves**: (1) Recommendation by tint + label, not by size/badge — all three stay equal-width so comparison feels fair. (2) CTA duplicated identically per card, placed above the fold of each card's details. (3) Deductible row exposes the real tradeoff ($2,500 vs $1,000) that explains the $8 price gap. (4) Exclamatory headline frames results as delivered value ("your personalized coverage options!").

### Component inventory (OBSERVED, INFERRED constructs)
- a!columnsLayout ×3 of a!cardLayout(style: light hex fill, showBorder:true) each containing rich-text label, rich-text price (size EXTRA_LARGE), a!buttonWidget(style SOLID), stacked rich-text label/value pairs; go-back rich-text link.
- Chart types: none.
- Interactive affordances: 3 choose buttons, go-back link.

### Character & judgment
- **Register**: warm-community + institutional — friendly exclamation over an actuarial comparison table.
- **Why it works**: satisficers click the tinted middle card in seconds; maximizers get perfectly row-aligned label/value pairs for scanning; identical CTAs remove any dark-pattern steering beyond the gentle tint.
- **Why not boring**: pricing-page 3-card idiom imported into an enterprise wizard instead of a results grid; CTA-above-details ordering; recommendation encoded in the quietest possible channel (a background tint).
- **Boring twin**: a!gridField with columns Option/Price/Home/Belongings/Liability/Deductible, radio in column 1, Continue bottom-right.
- **What to steal**: 3-option presentation with a tinted default; price-first card anatomy; aligned label/value rows across sibling cards.
- **Risks**: #edf4f6 vs #f7f8f4 distinction is faint for low-vision users (label carries it, but only in #767676 gray); three tall cards stack very long on phone putting option 3 far below; no recap of the inputs behind "personalized" — surprises force full restarts via Go back.

### Code cross-check
none — no SAIL source on this page.

## mortgage_1.png

### Identification
- **Image**: mortgage_1.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/mortgage_1.png ("Example: Reimagining a complex form")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (form) — the digital reimagining of complex_form.gif's paper 1003.

### Use-case reconstruction (INFERRED)
- **Persona**: primary evidence is split — nav reads MY TASKS / MY CUSTOMERS / NEW APPLICATION / PRODUCTS & SERVICES, i.e. a bank-side loan officer or broker (daily-operator) keying an application, while the page text frames the design for a first-time borrower; either way the operator may be guiding a novice applicant live, so the UI is tuned novice-safe.
- **Domain & brand context**: retail mortgage lender "Thatcher." — serif logotype + deep plum chrome, traditional-trustworthy banking.
- **Top 3 user tasks (ranked)**: 1. Complete this step's fields correctly. 2. Know where they are in the 8-step application. 3. Move forward/backward without losing work.
- **Implied requirements**: "One topic per screen (vs the paper form's 8-page wall)"; "Named progress for all 8 steps always visible"; "Field widths must telegraph expected content length"; "Constant form width across browser sizes" (the annotation image's point); "Optional steps flagged inline ('Demographic Data (Optional)')".
- **Data model sketch**: Application{steps: Getting Started ✓, About the Applicant (current), Assets, Income, Other Real Estate, Additional Questions, Demographic Data(Optional), Final Review}; Applicant{firstName, mi, lastName, suffix, email+confirm, phone{number, type ∈ Mobile|Home|Office}, mailingAddress{street/PO, unit, city, state=VA, zip}}. OBSERVED labels.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV bg=#641e44 (MY TASKS | MY CUSTOMERS | NEW APPLICATION active #442235+white underline | PRODUCTS & SERVICES | avatar+logo)
└─ COLUMNS [MEDIUM:AUTO:WIDE:AUTO]   ← per mortgage_column_widths annotation
   ├─ CARD(progress rail bg=#fafafa: 8 milestones — ✓#58bd38 done | ➤ bold current | ○ todo)
   ├─ (spacer)
   ├─ FORM "Basic Information" #862369
   │  ├─ "NAME" #767676 caps → COLUMNS [wide:tiny:wide:tiny] First/M.I./Last/Suffix
   │  ├─ "CONTACT" → COLUMNS [1:1] Email/Confirm → COLUMNS [1:1] Telephone(placeholder xxx-xxx-xxxx)/Type radios ×3 inline
   │  ├─ "MAILING ADDRESS" → Street+Unit → City/State(VA dropdown)/ZIP
   │  └─ divider → BUTTON "GO BACK" outline | BUTTON "CONTINUE" solid, far right
   └─ (spacer)
```
- **Above the fold**: entire step — rail, 11 inputs, both buttons.
- **Reading order**: F — rail anchors left, then title → field groups top-down → CONTINUE at bottom-right terminus.
- **Hierarchy rationale**: title states the topic (task 1); the rail is the only other visual anchor (task 2); CONTINUE is the only solid fill (task 3 forward bias).
- **Density**: 2 — one form zone, 11 inputs per viewport, AUTO spacer columns hold ~20% of width empty.
- **Ratios & spacing**: [MEDIUM : AUTO : WIDE : AUTO]; rail items ≈2 line-heights apart; field rows ≈1.5; button row separated by a full-width 1px divider.

### Styling specifics (OBSERVED)
- **Palette**: nav #641e44, active tab #442235 (est.) + white underline; accent #862369 (est.) on title, both buttons, selected radio; done-check green #58bd38 (est.); rail bg #fafafa; borders/inputs #dddddd; field labels #222222 bold; group labels #767676 all-caps; page #ffffff.
- **Color application points**: chrome plum; accent strictly on title + actions + selection states; green only for completed steps; zero decorative color in the form body.
- **Typography moves**: title ≈ LARGE_PLUS plum; group labels all-caps SMALL gray; field labels STANDARD bold; current rail item bold vs regular siblings; buttons all-caps.
- **Imagery stance**: none beyond avatar/logo — pure form.
- **Card treatment**: rail = flat filled #fafafa card with 1px border; form area borderless on white.
- **Signature moves**: (1) Instead of a horizontal milestone bar, a persistent left rail card naming all 8 steps with 3 icon states (✓ #58bd38 / ➤ current bold / ○ pending). (2) Instead of full-width fluid columns, [MEDIUM:AUTO:WIDE:AUTO] — empty AUTO gutters absorb resize so rail and form measure never change. (3) Input widths encode expected answer length (M.I./Suffix ≈4ch, state dropdown narrow). (4) All-caps #767676 micro-headers group fields with no boxes or dividers. (5) GO BACK (outline) and CONTINUE (solid) pushed to opposite ends of the divider — destructive-ish and progressive actions can't be confused.

### Component inventory (OBSERVED, INFERRED constructs)
- a!columnsLayout(width:"MEDIUM"|"AUTO"|"WIDE"|"AUTO"); rail: a!cardLayout(style light, showBorder) of a!richTextDisplayField items (a!richTextIcon check/chevron/circle + text); a!textField ×8 with proportional column widths; a!radioButtonField(choiceLayout:"COMPACT") for phone Type; a!dropdownField(State); a!buttonArrayLayout GO BACK style OUTLINE / CONTINUE style SOLID.
- Chart types: none.
- Interactive affordances: rail (display-only), radios, dropdown, back/continue.

### Character & judgment
- **Register**: institutional + calm-clinical — plum banking chrome over a spare, label-disciplined form.
- **Why it works**: the paper form's ~8 pages become one titled topic per screen, so working memory holds one schema at a time; the rail answers "how much is left?" permanently (8 named steps, one glance); sized inputs act as silent format hints (M.I. can't invite a full name).
- **Why not boring**: plum #641e44/#862369 identity where enterprise forms default to blue/gray; icon-state checklist rail instead of "Step 2 of 8"; deliberate emptiness — two AUTO columns spent on nothing but stability; (Optional) admitted right in a step name.
- **Boring twin**: full-width form titled "Application — Step 2", every field 100% width stacked, a percent-complete bar on top, Back/Next adjacent bottom-left, section borders around each group.
- **What to steal**: the 3-state named rail; spacer-column recipe for constant measure; content-length-proportional field widths.
- **Risks**: #862369 white-text buttons ≈5:1 — fine, but the #767676 caps labels on #fafafa run near AA at SMALL; radio/rail glyphs are small targets; rail card likely stacks above the form on phone, costing a viewport before fields.

### Code cross-check
none — no SAIL source on this page.

## mortgage_2.png

### Identification
- **Image**: mortgage_2.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/mortgage_2.png ("Example: Reimagining a complex form")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (collection manager, empty state)

### Use-case reconstruction (INFERRED)
- **Persona**: as mortgage_1; now at step 4 (Income), rail shows Getting Started/About the Applicant/Assets ✓.
- **Domain & brand context**: Thatcher. mortgage application.
- **Top 3 user tasks (ranked)**: 1. Add one or more income sources. 2. Legitimately declare having none. 3. Review what's been added (grid).
- **Implied requirements**: "Repeating data (0..n incomes) gets a grid + add-flow, not inline repeated fields"; "Empty state must say why the grid is blank"; "Skipping must be an explicit assertion, not a silent Continue"; "The constructive action must carry the only solid emphasis".
- **Data model sketch**: IncomeSource[0..n]{source, type, annualIncome} — grid columns Source | Type | Annual Income (right-aligned header); current count 0 ("No sources specified"). OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV + rail (as mortgage_1; ✓×3, Income current)
└─ FORM "Sources of Income"
   ├─ GRID(3-col, empty) → centered empty-state row "No sources specified"
   ├─ BUTTON "ADD INCOME SOURCE" solid #862369, centered
   └─ divider → BUTTON "GO BACK" outline | BUTTON "NO INCOME SOURCES" outline, right
```
- **Above the fold**: everything; page is ~40% empty below the buttons.
- **Reading order**: single-column: title → grid → add → exits.
- **Hierarchy rationale**: the empty grid sits first as the step's "document"; ADD INCOME SOURCE is centered directly beneath it and is the lone solid fill (task 1); both exit buttons are demoted to outline (tasks 2/3 are secondary).
- **Density**: 2 — one empty grid, three buttons; whitespace dominates.
- **Ratios & spacing**: same [MEDIUM:AUTO:WIDE:AUTO] frame; add-button centered on the grid's axis; exit row separated by the full divider.

### Styling specifics (OBSERVED)
- **Palette**: identical system to mortgage_1 (#641e44 nav, #862369 accent (est.), #fafafa rail, #dddddd grid rules, #767676/#222222 text, white page).
- **Color application points**: title + three buttons only; grid is monochrome.
- **Typography moves**: title ≈ LARGE_PLUS plum; grid headers STANDARD bold (Annual Income right-aligned); empty-state line STANDARD regular centered; buttons all-caps.
- **Imagery stance**: none.
- **Card treatment**: grid with 1px #dddddd header rule and outer hairline; otherwise flat.
- **Signature moves**: (1) The forward path is forked and labeled by meaning: solid ADD INCOME SOURCE vs outline NO INCOME SOURCES — skipping requires asserting a fact, not clicking "Next" past an empty grid. (2) Empty state text inside the grid body ("No sources specified") keeps the schema visible before data exists. (3) Add-button centered under the grid it feeds (spatial cause→effect), not parked in the corner.
 
### Component inventory (OBSERVED, INFERRED constructs)
- a!gridField(columns Source/Type/Annual Income, emptyGridMessage) or read-only gridLayout; a!buttonArrayLayout(ADD solid, align CENTER) launching the mortgage_3 sub-flow; bottom a!buttonArrayLayout(GO BACK outline | NO INCOME SOURCES outline).
- Chart types: none.
- Interactive affordances: add-flow trigger, declarative skip, back.

### Character & judgment
- **Register**: institutional + calm-clinical.
- **Why it works**: 0..n data is the classic paper-form disaster (blank repeated boxes); here the grid+add pattern shows structure without demanding it; the labeled skip prevents both accidental omission and guilt-clicking.
- **Why not boring**: "NO INCOME SOURCES" as a button label is a deliberate speech act — rare and effective; primary emphasis assigned by consequence (add = solid) rather than by position (continue ≠ primary).
- **Boring twin**: five blank Source/Type/Amount input rows with a "+ Add row" link, and a Next button that happily submits all-blank.
- **What to steal**: declarative skip buttons for optional collections; solid-for-constructive/outline-for-exits emphasis rule; empty-state copy inside the grid.
- **Risks**: two outline buttons at opposite ends read as equal weight — users may click NO INCOME SOURCES intending "next" despite the label; no inline edit/delete affordances visible yet for filled states (unproven here).

### Code cross-check
none — no SAIL source on this page.

## mortgage_3.png

### Identification
- **Image**: mortgage_3.png | **Source page**: ux-designing-for-your-users | **Alt/caption**: ds-images/mortgage_3.png ("Example: Reimagining a complex form")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (sub-flow step 1 of the add-income flow)

### Use-case reconstruction (INFERRED)
- **Persona**: as mortgage_1; inside the "Add Income Source" child flow launched from mortgage_2.
- **Domain & brand context**: Thatcher. mortgage application.
- **Top 3 user tasks (ranked)**: 1. Classify the income type (8 options). 2. Proceed to type-specific detail fields (NEXT). 3. Abort back to the grid without side effects (CANCEL).
- **Implied requirements**: "Type must be chosen first so later fields can branch per type"; "Sub-flow must not advance the main rail (Income stays current)"; "Sub-flow verbs must differ from main-flow verbs (CANCEL/NEXT vs GO BACK/CONTINUE)"; "Default the most common type (Employment pre-selected)".
- **Data model sketch**: IncomeSource.type ∈ {Employment (selected), Independent Contractor, Self Employment/Business, Military Pay, Social Security, Pension, Rental Income, Other} — the branch key for subsequent screens. OBSERVED.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV + rail (unchanged from mortgage_2 — sub-flow doesn't touch milestones)
└─ FORM "Add Income Source"
   ├─ "Select type of income" bold label
   ├─ RADIO ×8 vertical, Employment pre-selected #862369
   └─ divider → BUTTON "CANCEL" outline | BUTTON "NEXT" solid, right
```
- **Above the fold**: everything.
- **Reading order**: single-column.
- **Hierarchy rationale**: one classification question owns the screen (it decides the rest of the flow); NEXT solid right mirrors the main flow's muscle memory; CANCEL replaces GO BACK because leaving discards, not navigates.
- **Density**: 2 — eight radios, two buttons.
- **Ratios & spacing**: same frame as siblings; radio rows ≈1 line-height apart, single left-aligned column (no multi-column radio grid).

### Styling specifics (OBSERVED)
- **Palette**: identical Thatcher system; selected radio dot #862369 (est.); other hexes as mortgage_1.
- **Color application points**: title, selected radio, NEXT fill, CANCEL outline — nothing else.
- **Typography moves**: title ≈ LARGE_PLUS plum; question label STANDARD bold; radio labels STANDARD; buttons all-caps.
- **Imagery stance**: none.
- **Card treatment**: none — bare controls on white inside the WIDE column.
- **Signature moves**: (1) Verb discipline: CANCEL/NEXT inside the sub-flow vs GO BACK/CONTINUE outside — the button pair itself tells you which flow level you're in. (2) Milestone rail deliberately frozen during the sub-flow — child steps don't pollute macro progress. (3) Type-first sequencing so the next screen can render only Employment-relevant fields. (4) Most-common option pre-selected rather than forcing a null choice.

### Component inventory (OBSERVED, INFERRED constructs)
- a!radioButtonField(choiceLayout:"STACKED", 8 choices, default Employment); a!buttonArrayLayout(CANCEL outline | NEXT solid); same rail/columns scaffold.
- Chart types: none.
- Interactive affordances: radio group, next/cancel.

### Character & judgment
- **Register**: institutional + calm-clinical.
- **Why it works**: classification-before-detail keeps every later screen short and relevant (the paper 1003 shows all professions' boxes to everyone); eight stacked radios stay one-glance scannable; frozen rail avoids the "why did my progress bar move backwards?" confusion.
- **Why not boring**: it resists card-choice theatrics — for a staff-adjacent 8-way classification, a plain radio stack is the faster tool, and the design knows it; the CANCEL/NEXT verb swap is a quiet but rigorous state cue.
- **Boring twin**: a "Type" dropdown embedded in one giant income form showing all fields for all types at once, Save button bottom.
- **What to steal**: sub-flow verb switching; branch-on-type wizards for polymorphic records; defaulting the modal answer.
- **Risks**: 8 radios approach the comfortable stack limit (past ~10, grouping or dropdown wins); "Other" invites junk data without a follow-up description field (unverified here); no visible sub-step indicator if the child flow runs long.

### Code cross-check
none — no SAIL source on this page.

## mortgage_column_widths.png

Tier override: listed A, treated as annotated teaching diagram (tier B style) — it is mortgage_1 in a gray frame with orange #f4ae56 (est.) measurement bars and caps labels below: MEDIUM (rail) | AUTO | WIDE (form) | AUTO, plus an orange "COLUMNS" chip; a tier-A pass would duplicate mortgage_1.

- **Produces it**: a!columnsLayout(columns: a!columnLayout(width:"MEDIUM") rail card, a!columnLayout(width:"AUTO") empty, a!columnLayout(width:"WIDE") form, a!columnLayout(width:"AUTO") empty).
- **Teaches**: fixed-word widths (MEDIUM, WIDE) pin the rail and form to constant measures at any browser width; the two AUTO columns are deliberately empty shock absorbers taking all remaining space — the caption's exact point. Steal as the standard "stable wizard" recipe. OBSERVED.
- **Marker**: neutral
