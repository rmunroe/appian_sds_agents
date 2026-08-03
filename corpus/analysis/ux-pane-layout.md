# Analysis: ux-pane-layout

Page: `corpus/pages/ux-pane-layout.md` (section: components). No SAIL source on this page — all colors are pixel estimates. Tier assignments from the batch table were kept; no overrides needed.

## pane_top_level.png

### Identification
- **Image**: pane_top_level.png | **Source page**: ux-pane-layout | **Alt/caption**: "pane_top_level.png" (heading: Pane layout as a top-level layout)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-operational

### Use-case reconstruction (INFERRED)
- **Persona**: order-fulfillment operations analyst / account manager at a distributor; daily-operator (date filters default to the current month window 01/01–01/25/2024)
- **Domain & brand context**: order management / supply-chain ops; restrained institutional green brand (Appian demo styling)
- **Top 3 user tasks (ranked)**: 1. Monitor order flow by status across the month. 2. Track delivered revenue against goal and pacing. 3. Slice orders by case number / priority / type / status / date to investigate subsets.
- **Implied requirements**: "Filters must stay visible while results scroll" (full-height pane); "Must compare Open vs Processing vs Delivered counts per day"; "Must show revenue progress vs target with a pacing verdict at a glance"; "Must switch between order-trend and revenue-vs-profit views without leaving the page"; "Per-customer breakdowns available below the fold"
- **Data model sketch**: Order/Case(caseNumber, priority, type, status[Submitted|Open|In Progress|Delivered], orderedDate, deliveredDate, customer, revenue, profit); daily aggregates Jan 1–19 OBSERVED on axis; goal $14.5M vs delivered $4.5M; Customer 1:n Orders (ORDERS BY CUSTOMER, CUSTOMER RANKINGS sections)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-HEADER (green bar: chart icon + "Order Summary", app grid, avatar AK, appian logo)
PANE-LAYOUT (top-level, hairline divider on)
├─ PANE[left w≈400px fixed, white] FORM "FILTERS" (1 text, 3 dropdowns, 4+ checkboxes, 2 date ranges)
└─ PANE[right AUTO, white]
   ├─ COLUMNS [2:1]
   │  ├─ SECTION "ORDERS ANALYSIS" CHART(line ×3 series, radio view-toggle)
   │  └─ SECTION "ORDERS DELIVERED" CHART(gauge "$4.5M") + goal "◉$14.5M" + TAG "AHEAD"
   └─ SECTION "ORDERS BY CUSTOMER" | SECTION "CUSTOMER RANKINGS" (cut at fold)
```
- **Above the fold**: full filter set through the Delivered date range, complete line chart, complete gauge; next section headers just visible at the cut — evidence the right pane scrolls independently
- **Reading order**: F
- **Hierarchy rationale**: line chart is the widest zone → task 1; gauge's EXTRA_LARGE dollar figure → task 2 glanceability; filters occupy a persistent left rail because they serve every task but lead none
- **Density**: 3 — two chart zones + ~10 filter controls per viewport, comfortable padding, more zones below fold
- **Ratios & spacing**: panes ≈ [27:73] (left fixed ≈400px); content columns ≈ [2:1]; chart blocks padding STANDARD; section gap ≈ marginBelow "MORE"

### Styling specifics (OBSERVED)
- **Palette**: header #266a4d (est.); pane/page bg #ffffff; chart-block fill #f3f4f4 (est.); series #86bf58 / #2e7d52 / #337ab0 (est.); gauge arc #2c6b4f (est.) on track #d9d9d9 (est.); tag "AHEAD" #5cb944 (est.) white text; section headers #6b6b6b (est.); values near-black #202020 (est.)
- **Color application points**: green on site header, one chart series, gauge arc, success tag (brand hue doubling as data/semantic color); blue reserved for the Delivered series; no colored buttons; neutral gray labels
- **Typography moves**: header title ≈ MEDIUM white; section headers ≈ STANDARD all-caps gray; filter labels STANDARD bold; gauge number EXTRA_LARGE; goal ≈ MEDIUM_PLUS; axis/legend SMALL
- **Imagery stance**: none — charts + small glyphs (calendar icons in date fields, ◉ goal icon)
- **Card treatment**: flat filled light-gray chart blocks, no borders or shadows; filter pane flat white; hairline pane divider
- **Signature moves**: instead of a filter toolbar above results, they pinned a full-height fixed-width filter pane via a!pane fixed width; instead of two stacked charts, a radio toggle swaps the dataset in one chart footprint; instead of a KPI row, gauge + goal + pacing tag compress "progress vs plan" into one cluster; instead of a multi-hue chart palette, brand green + one blue keeps ops calm

### Component inventory (OBSERVED → INFERRED)
- a!paneLayout(showDividers: true) with a!pane(width: fixed ≈"NARROW") + a!pane(width:"AUTO"); filters: a!textField, a!dropdownField ×3, a!checkboxField groups, paired a!dateField "to" side-by-sides
- a!radioButtonsField(choiceLayout:"COMPACT") view toggle; a!lineChartField(3 series, custom colorScheme INFERRED); gauge with center currency text (a!gaugeField INFERRED); a!tagField("AHEAD", green)
- Interactive affordances: persistent filters, chart view toggle; no row actions visible

### Character & judgment
- **Register**: utilitarian-ops, calm-clinical — white/gray surfaces with one working accent hue
- **Why it works**: persistent filters + independently scrolling results support the investigate loop (fold cut mid-section proves pane scroll); single green family makes the blue Delivered series and AHEAD tag read as meaning; EXTRA_LARGE $4.5M inside a thin ring gives instant pacing against the ◉$14.5M anchor
- **Why not boring**: radio toggle giving two analyses one footprint; gauge+goal+tag trio replacing the default KPI card row; all-caps letterspaced gray section labels; filter pane running true edge-to-edge full height rather than a floating card
- **Boring twin**: a header-content page with four bordered KPI cards, one full-width default-color line chart, and filters collapsed into an accordion above a grid; revenue shown without target or pacing
- **What to steal**: fix the filter pane and AUTO the content; pair every progress metric with target + pacing tag; reuse one brand hue across header/series/tags
- **Risks**: light-gray chart fills are weak zone separators; the two green series rely on a lightness gap (color-vision risk); small all-caps gray labels near 4.5:1 contrast floor

## pane_in_form.png

### Identification
- **Image**: pane_in_form.png | **Source page**: ux-pane-layout | **Alt/caption**: "pane layout in form layout example"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form

### Use-case reconstruction (INFERRED)
- **Persona**: shared-services / accounts-payable case-intake specialist; daily-operator triaging email-referred disputes
- **Domain & brand context**: finance operations (invoice/payment reconciliation); navy-indigo corporate brand, flat illustration
- **Top 3 user tasks (ranked)**: 1. Verify AI-prefilled case fields against the source email side-by-side. 2. Complete the one missing required field (Case Type). 3. Submit (OPEN CASE) or discard (CANCEL).
- **Implied requirements**: "Source email must remain visible while any field is edited"; "Auto-populated fields must be editable and flagged for human verification" (header copy states it); "Required fields visibly marked"; "Description needs rich-text authoring"; "Exactly one primary action plus an escape"
- **Data model sketch**: Case(caseType, title, status=Open, priority=Medium, description) derived-from Email(sender John Doe, recipient jane.doe@email.com, sent Jul 30 2025 08:19 PM, subject "Payment received does not match invoice #8423", channel "Referral Email", body); Invoice #8423 (billed $41,200, credited $38,700, delta $2,500)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM
├─ header band (navy) h≈330 title+subtitle + flat illustration (stacked documents, top-right)
├─ PANE-LAYOUT (no drawn divider; separation via pane fills)
│  ├─ PANE[left ≈50%, bg #f7f7f9 est.]
│  │  ├─ subject row: envelope icon chip + subject MEDIUM bold + "Referral Email" caption
│  │  └─ CARD(email: avatar "JD", from→to, timestamp, 4 body paragraphs)
│  └─ PANE[right ≈50%, white, own scrollbar] FORM (Case Type dd, Title*, Status* dd, Priority dd, Description rich-text)
└─ footer bar: CANCEL (outline, left) ……… OPEN CASE (solid, right)
```
- **Above the fold**: everything except the lower half of the Description editor (right-pane scrollbar OBSERVED)
- **Reading order**: Z — header instruction → left source → right fields → footer primary; then left↔right verification loop
- **Hierarchy rationale**: header instruction leads because the entire page is a verification task; the email subject is the largest body text since it is the ground truth being verified; form fields kept uniform so the empty required dropdown is the only gap
- **Density**: 3 — five inputs + one document card per viewport, STANDARD field gaps
- **Ratios & spacing**: panes ≈ [1:1]; email card padding ≈ "MORE"; field gap STANDARD; footer h≈90px

### Styling specifics (OBSERVED)
- **Palette**: header navy #121a5c (est.); illustration circle #2a3374 (est.) with pale docs #dfe3f5 (est.); left pane #f7f7f9 (est.); card/right pane #ffffff; primary button #2b3cd8 (est.); required asterisk / links #3949d6 (est.); avatar chip #e3e6fa bg / #3944c7 text (est.); body text #333333 (est.); timestamp gray #777 (est.)
- **Color application points**: navy only in the header band; blue only on primary button, CANCEL outline/text, required marks, avatar monogram; everything else neutral — a one-accent form
- **Typography moves**: title LARGE bold white; subtitle STANDARD white; email subject MEDIUM bold; labels STANDARD semibold with blue *; body STANDARD; timestamp SMALL; buttons all-caps
- **Imagery stance**: flat spot illustration in header; styled icons (envelope chip, rich-text toolbar glyphs)
- **Card treatment**: email as white card with hairline border/soft shadow (est.) sitting on the gray pane; panes separated by fill change, not a drawn rule — matches the page guideline "turn off pane dividers in forms with header and button footer dividers"
- **Signature moves**: instead of stacking source above form, a!formLayout hosts a!paneLayout for side-by-side evidence + entry with independent scroll; instead of white-on-white, the source pane gets a gray backgroundColor so reference material reads distinct from the work surface; instead of locking AI-filled fields, provenance is handled by header copy ("Please verify…"); instead of a stock billboard photo, a flat navy band + corner illustration

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(contents: a!paneLayout(panes: a!pane(bg gray) + a!pane(white)), buttons: a!buttonLayout(primary "OPEN CASE" SOLID, secondary "CANCEL" OUTLINE))
- a!dropdownField ×3 (Case Type placeholder "Select case type"; Status "Open"; Priority "Medium"), a!textField(Title, prefilled), rich-text editor with B/I/U/S/link/list toolbar (styled text editor component INFERRED)
- Email pane: a!cardLayout + a!richTextDisplayField; small mid-height chevron tab on the right edge (possible pane-collapse affordance or capture artifact — uncertain)
- Interactive affordances: form entry, rich-text toolbar, footer actions

### Character & judgment
- **Register**: calm-clinical — neutral surfaces, single blue accent, instructional tone
- **Why it works**: the [1:1] split mirrors the transcription-verification mental model (source left, target right, both OBSERVED at equal width); gray-vs-white pane fills separate reference from editable without adding a third divider to a form that already has header and footer bars; prefilled Status/Priority plus one empty required dropdown funnels attention to the only real decision
- **Why not boring**: side-by-side verification layout instead of a lone column; email rendered as a true artifact (avatar, from→to row, timestamp) rather than text pasted into a read-only paragraph; navy band + flat illustration for brand without photo weight; blue restricted to action/required semantics
- **Boring twin**: a single-column form with the email body dumped into a read-only paragraph field above the inputs, default white header, both buttons gray in one corner, and dividers drawn around every region
- **What to steal**: put source evidence in a gray pane beside any verify-and-submit form; let header copy carry AI provenance instead of locking fields; keep one accent hue for primary + required marks
- **Risks**: 50/50 panes will crush on narrow screens (needs a fixed width or stacking strategy); empty Case Type has no inline validation cue yet; italic gray placeholders (#999 est.) are low contrast; toolbar glyphs are small targets

## pane_in_hcl.png

### Identification
- **Image**: pane_in_hcl.png | **Source page**: ux-pane-layout | **Alt/caption**: "pane layout in header content layout example"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (media-card collection with filter rail)

### Use-case reconstruction (INFERRED)
- **Persona**: residential listing agent / brokerage staff; daily-operator browsing inventory
- **Domain & brand context**: real-estate brokerage; bold consumer brand — black chrome + crimson accent over listing photography
- **Top 3 user tasks (ranked)**: 1. Scan new-listing inventory visually (photo, price, freshness). 2. Narrow by features/status/dates/agent. 3. Switch portfolio views (New / My / Sold) and add a property.
- **Implied requirements**: "Brand header and portfolio tabs must persist while filters and results scroll independently" (the HCL use case); "Cards must lead with photo, price, days-on-market"; "Lifecycle status must be legible on top of photography"; "Nine filter facets always at hand"; "Create action prominent in the header"
- **Data model sketch**: Listing(listingNumber, price, status[New listing|Open house scheduled|Price reduced|No offers received], daysOnMarket 2d/15d/26d/33d/42d, beds, baths, sqft, address, photo, features[central air|outdoor kitchen|pool], listedDate, offeredDate, agent); tabs partition by ownership + lifecycle

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ header (near-black)
│  ├─ row: house icon + "Properties" LARGE bold white | CTA "+ NEW PROPERTY" (solid crimson)
│  └─ TABS ×3 ("New Listings" active: white text + red underline; others gray)
└─ PANE-LAYOUT
   ├─ PANE[left fixed ≈555px, white] FORM "FILTERS" ×9 groups
   └─ PANE[right AUTO, bg #efefef est.] GRID(3-col, 5 photo cards, row 2 cut at fold)
      └─ CARD(photo + overlay status banner, price, days chip, beds·baths·sqft, address)
```
- **Above the fold**: full header + tabs, filters through Listing Agent, first card row complete, second row cut — both panes clearly scroll under the fixed header
- **Reading order**: F
- **Hierarchy rationale**: photos dominate because the property is the product; price is the largest card text (buy/sell decisions are price-first); the only saturated red block is the create CTA + active tab marker
- **Density**: 2 — editorial: 5 large-imagery cards + one filter rail per viewport (the convention's density-2 anchor is exactly a real-estate property list)
- **Ratios & spacing**: panes ≈ [21.5:78.5]; card gutters ≈24px (est.); grid margin "MORE"; card text padding STANDARD, photo flush

### Styling specifics (OBSERVED)
- **Palette**: header #212121 (est., slight gradient); crimson #b0231a (est.) CTA + active-tab underline; content pane #efefef (est.); cards #ffffff; status banners orange #f2a12d, green #3f8f2b, blue #3c78c8, red #d01f1f (all est.); price #2b2b2b (est.); meta #555 (est.); days-on-market #8a8a8a (est.)
- **Color application points**: brand red only on CTA + active tab; status colors only as photo-overlay banners; dark header carries no color — photography supplies it
- **Typography moves**: app title LARGE bold white; tabs STANDARD; "FILTERS" SMALL all-caps gray; price ≈ MEDIUM_PLUS bold; meta STANDARD; address SMALL
- **Imagery stance**: full-bleed photos topping every card (~16:9); minimal glyphs otherwise
- **Card treatment**: white, hairline border (est.), no shadow, padding NONE around photo + STANDARD text block; gray pane fill makes cards read as cards
- **Signature moves**: instead of a page header that scrolls away, HCL + pane layout keeps brand/nav fixed over two independent scroll regions; instead of a "Status" text row, solid color-coded banners overlay each photo's top-left; instead of colored chrome, true black header lets listing photos carry all color; instead of proportional panes, fixed 555px filters + AUTO grid

### Component inventory (OBSERVED → INFERRED)
- a!headerContentLayout(header: dark bar + tab row with accent underline) wrapping a!paneLayout(a!pane fixed white; a!pane AUTO gray bg)
- Cards: a!cardLayout(padding NONE media) with photo + overlaid banner (billboard-with-bar-overlay or stamped tag INFERRED), price/meta rich text; days chip with calendar icon
- Filters: a!textField, a!dropdownField ×2, a!checkboxField ×2 groups, paired a!dateField ranges ×2, agent picker
- Interactive affordances: tabs, header CTA button, filter form, cards presumably links to records

### Character & judgment
- **Register**: premium-editorial, energetic-consumer — photography-forward with black chrome and one red punch
- **Why it works**: photo-led 3-column grid matches visual triage of inventory (image → price → meta, in observed size order); persistent black header anchors identity across two scrolling panes; overlay banners deliver lifecycle state without consuming card rows
- **Why not boring**: true-black chrome instead of a default light header; red used exactly twice (CTA, active tab); overlay status chips instead of a status column; borderless card separation via the #efefef (est.) pane fill
- **Boring twin**: white header, blue default buttons, filters collapsed above a paginated read-only grid with a Status text column and thumbnail images, every card shadowed on white
- **What to steal**: wrap pane layouts in HCL when nav must persist; overlay state chips on media; spend the brand accent only on CTA + active nav
- **Risks**: white on orange banner (#f2a12d est.) ≈2.4:1 — fails AA; gray inactive tabs on black borderline; photo weight on load; 3-col grid needs a reflow strategy below ~1200px content width

## pane_background_color_cards.png

### Identification
- **Image**: pane_background_color_cards.png | **Source page**: ux-pane-layout | **Alt/caption**: "Pane background color with cards" — page caption: "This dashboard uses a custom color scheme. The cards have a lighter hex value than the background color."
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: list (branded filter + card-grid dashboard)

### Use-case reconstruction (INFERRED)
- **Persona**: same brokerage listing staff as pane_in_hcl; daily-operator; this is the branding-forward variant
- **Domain & brand context**: real estate; assertive two-hue company branding (green + royal blue) rendered as full-height color fields
- **Top 3 user tasks (ranked)**: 1. Filter listings from the persistent blue rail. 2. Scan the white photo cards. 3. Site-level navigation via the green icon rail.
- **Implied requirements**: "Pane background must carry company brand while controls stay legible (white-on-blue input chrome)"; "Cards must be a lighter hex than the pane background" (page states the rule); "Full-height color sections must segment nav vs controls vs content"; "Brand colors must be consistent across site pages" (page's don't-mix-schemes guideline)
- **Data model sketch**: identical Listing records to pane_in_hcl OBSERVED ($1,695,000 / $2,150,000 / $1,945,000 / $2,092,000 / $1,723,000; same statuses, beds/baths/sqft, addresses) — same app, recolored

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PANE-LAYOUT (top-level; 3 full-height vertical color sections; no dividers)
├─ RAIL[green, w≈140px] appian logotype, active icon as white chip, app grid, avatar "AK", collapse ">"
│   (site nav rail or a narrow custom-green pane — ambiguous INFERRED)
├─ PANE[fixed ≈480px, bg #2a63c5 est.] FORM "FILTERS": white labels, transparent inputs w/ 1px white borders
└─ PANE[AUTO, bg #edeff1 est.] GRID(3-col ×2 rows, 5 white cards, all fully visible)
```
- **Above the fold**: entire page — grid ends mid-viewport with empty gray below
- **Reading order**: F
- **Hierarchy rationale**: saturation ladder (green rail → blue controls → gray content) pushes the eye rightward to the lightest layer, the white cards; the only white-filled chip in the rail marks the active nav item; card prices remain the biggest dark text
- **Density**: 2 — same editorial listing grid; large imagery, single control rail
- **Ratios & spacing**: sections ≈ [5.5:18.5:76]; filter pane padding STANDARD; card gutters ≈24px (est.)

### Styling specifics (OBSERVED)
- **Palette**: rail green #38c26a (est.); filter pane #2a63c5 (est.); content bg #edeff1 (est.); cards #ffffff; banners orange #f2a12d / green #3f8f2b / blue #3c78c8 / red #d01f1f (est.); labels/inputs white on blue; placeholders pale italic #dfe7f6 (est.); price near-black #2b2b2b (est.)
- **Color application points**: three vertical background fields do all the structural work; white reserved for interactive surfaces (inputs, active nav chip, cards); status color only on photo banners
- **Typography moves**: "FILTERS" SMALL all-caps white; labels STANDARD semibold white; price MEDIUM_PLUS bold; meta STANDARD gray — type hierarchy unchanged from the neutral variant, only surfaces recolored
- **Imagery stance**: listing photos in cards; white glyph icons in the rail
- **Card treatment**: flat white cards on gray, no borders/shadows; inputs render as transparent fills with white 1px borders — dark-background input chrome (INFERRED automatic for dark pane colors)
- **Signature moves**: instead of a white page with a logo, a custom pane backgroundColor (hex) turns the whole filter rail into a brand block; instead of dividers, adjacency of three background hues encodes nav/controls/content; content pane kept near-neutral so cards stay the lightest value on the page (the documented rule); two brand hues separated by width and role so they don't compete

### Component inventory (OBSERVED → INFERRED)
- a!paneLayout with a!pane(width fixed, backgroundColor custom "#2A63C5" est.) + a!pane(width "AUTO", backgroundColor "Gray"/custom est.); green rail = Appian site navigation with custom brand color (or third narrow pane)
- Filter fields as in pane_in_hcl (text, dropdowns, checkbox groups, date ranges, agent) rendered in light-on-dark chrome; cards identical to pane_in_hcl
- Interactive affordances: nav rail icons, filter form, card links, collapse chevron bottom-left

### Character & judgment
- **Register**: energetic-consumer — saturated brand fields framing photography
- **Why it works**: full-height color blocks give instant wayfinding (controls always "in the blue"); the lightness ladder lands attention on content, executing the page's card-lighter-than-background rule; white label text on #2a63c5 (est.) holds ≈4.9:1 contrast
- **Why not boring**: two-hue vertical branding instead of logo-only branding; zero drawn borders — color does structure; selection shown by inversion (white chip on green)
- **Boring twin**: white filter column with gray hairlines, default header bar, shadowed cards on white, brand present only as a logo in the corner
- **What to steal**: brand one pane, neutralize the content pane; keep cards the lightest hex on the page; let input chrome invert on dark fills rather than boxing white fields onto color
- **Risks**: pale italic placeholders on blue fall below 3:1; adjacent saturated green/blue can vibrate; focus states must survive the colored background; custom hexes must be applied consistently site-wide (page warns against mixing dark-scheme and light pages)

## pane_layout_drag_and_drop.gif

### Interaction: Insert a pane layout in design view (gif: pane_layout_drag_and_drop.gif; frames f0/f9/f19/f29/f38)
- **State chart**: (1) blank interface — palette left with "Top Level Layouts" (FORM, WIZARD, CARD HEADER, BILLBOARD HEADER, PANES, PANES WITH BILLBOARD HEADER, PANES WITH CARD HEADER), canvas placeholder "Drag and drop from palette", template gallery right (FORMS / PAGES / EXAMPLES) [f0] → (2) drag PANES: magenta-outlined ghost row follows cursor onto the canvas drop zone [f9] → (3) drop: canvas scaffolds two panes, each showing "Drop component here" [f19] → (4) right rail swaps gallery for Component Configuration: "Pane Layout" selected, Content/Behavior/Style tabs, "Panes" tree listing two Pane children + "+ ADD PANE" [f19] → (5) idle end state [f29/f38 blank deltas].
- **SAIL mechanism**: designer inserts a!paneLayout with two default a!pane children; ADD PANE appends more; only offered on blank interfaces (Top Level Layouts menu).
- **UX purpose**: orientation — how to start a pane-based page and where pane config lives.
- **Replicate when**: onboarding builders to top-level layouts. | **Cost**: none — product behavior, no SAIL authored.

## pane_padding_progression.gif

### Interaction: Pane padding value progression (gif: pane_padding_progression.gif; frames f0/f6/f13/f19/f25)
- **State chart**: three-pane SIU claim workspace — left entity chain (CLAIM → INSURED VEHICLE → DRIVER → OTHER VEHICLE → CLAIMANT "INJURED" → LOCATION OF LOSS), center claimant detail (red ALERT banner, tabs with CLAIMS HISTORY active, month timeline, 9-row claims table), right Decision panel (FILED–DECISION–PAYMENT stepper, "3 DAYS LEFT", APPROVE/DENY/SEND TO SIU cards, checklist, notes, SUBMIT DECISION). Padding steps None → EVEN_LESS → LESS → STANDARD → MORE → EVEN_MORE: f0 content flush to pane edges; each frame insets all three panes' content further (~8→40px est.); pane widths never change.
- **SAIL mechanism**: a!pane(padding:) stepped through its six enum values.
- **UX purpose**: feedback — padding is whitespace at pane borders, not between components.
- **Replicate when**: tuning edge spacing on multi-pane workbenches (NONE for flush rails; STANDARD default). | **Cost**: none — one enum parameter.

## pane_layout_width_do.gif + pane_layout_width_dont.gif

### Interaction: Pane widths under browser resize — DO fixed vs DON'T auto (frames f0/f34/f68/f102/f136 and f0/f35/f70/f105/f140)
- **State chart (DO, fixed filters)**: wide window — filter pane fixed ≈375px + AUTO card grid 3-across [f0] → drag window edge inward (resize cursor OBSERVED) → grid reflows 3→1 columns while filters keep exact width and legibility [f34/f68] → widen → grid restores [f102/f136].
- **State chart (DON'T, auto filters)**: at full width the proportional filter pane balloons to ≈50% of the viewport — inputs stretch ≈770px, cards squeeze until meta text wraps and banners truncate ("OPEN HOUSE SCHEDUL…") [f0] → narrowing shrinks both panes; filters crush toward ≈340px and fluctuate with every width [f35/f70/f105] → wide again, filters balloon again [f140].
- **SAIL mechanism**: a!pane(width: fixed value) vs width:"AUTO" during viewport resize.
- **UX purpose**: orientation — a fixed control pane keeps a consistent look across screen sizes; auto control panes distort both controls and content.
- **Replicate when**: any filter/tool rail beside a collection: fix the rail, AUTO the content. | **Cost**: none — one width value per pane.

## pane_layout_width_auto_example.png + pane_layout_width_wide_plus_example.png

### Principle: Give the main content pane AUTO width
- **DO shows**: plum-header (#6c4a64 est.) Listings page on a wide monitor — filter pane fixed ≈370px, content pane AUTO: the 3-across card grid stretches flush to the right screen edge, absorbing all surplus width.
- **DON'T shows**: same page with the content pane fixed (≈WIDE_PLUS): the grid stops a little past mid-screen, wrapping to 2+2+1 cards and stranding a ≈40%-width dead white strip on the right of the wide monitor.
- **Rule**: whenever any pane has a fixed width, at least one other pane must be AUTO so the layout fits every screen size.
- **Severity**: always
- **Category**: layout
- **SAIL implication**: a!pane(width:"AUTO") on the content pane; reserve fixed widths for control rails (filters), per the fixed-width DO above.
