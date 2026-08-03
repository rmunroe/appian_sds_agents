# Analysis: ux-mobile-considerations

## interface_designer_mobile_ffp.png

### Identification
- **Image**: interface_designer_mobile_ffp.png | **Source page**: ux-mobile-considerations | **Alt/caption**: ds-images/interface_designer_mobile_ffp.png
- **Device frame**: desktop (Interface Designer in browser) containing a tablet-landscape preview frame
- **Marker**: neutral
- **UI type**: other — design-tool screenshot demonstrating device width preview, embedding a landing-page example

### Use-case reconstruction (INFERRED)
- **Persona**: dual. (1) Appian low-code designer, daily-operator, checking responsiveness before shipping. (2) Embedded UI persona: returning insurance customer, occasional-customer, reviewing a saved quote.
- **Domain & brand context**: consumer auto insurance, "INSURECORP" brand; friendly direct-to-consumer feel (saturated blue, isometric illustration).
- **Top 3 user tasks (ranked)**: 1. Preview the interface at a phone/tablet width without leaving the designer. 2. Verify the landing layout holds at Tablet (Landscape). 3. (embedded) Purchase the quoted policy via the single CTA.
- **Implied requirements**: designer must offer canned device-width presets (8 icons visible: full, 3 desktops, tablet portrait/landscape, phone portrait/landscape); preview must render true SAIL responsive behavior; returning customer must see price, discounts, and one purchase CTA on one screen.
- **Data model sketch**: Customer (Karen); Quote (auto insurance; $113.50/month or $646.95/6 mos with prepayment discount; 3 applied discounts totaling $42.90/mo); Discount (Multi-Vehicle $180.90/yr, Multi-Driver $143.25/yr, Safe Driving $211.60/yr).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
DESIGNER-CHROME (toolbar: name, PREVIEWING, palette/device/globe icons, TEST, SAVE, appian logo)
└─ DEVICE-PREVIEW-STRIP (8 width icons; "Tablet (Landscape)" selected, tooltip)
   └─ PREVIEW frame=tablet-landscape
      ├─ BILLBOARD h≈55% style=#1a56c8 content=logo+welcome+CTA+car illustration
      └─ COLUMNS [1:1]
         ├─ CARD("Your coverage details", price box w/ blue top bar, discounts row)
         └─ CARD("Your discounts", 3 accent-bar stat rows)
```
- **Above the fold**: entire preview — billboard plus top of both cards.
- **Reading order**: Z — logo → "Welcome back, Karen!" → PURCHASE NOW → left card → right card.
- **Hierarchy rationale**: greeting is largest because re-engagement is the page's job (task 3); PURCHASE NOW is the only solid button on the billboard; discounts are itemized with color accents to reward scanning.
- **Density**: 2 — editorial: one hero message plus two content cards per viewport.
- **Ratios & spacing**: cards ≈[1:1] with wide gutter; card padding ≈ MORE; billboard consumes ~half the tablet height.

### Styling specifics (OBSERVED)
- **Palette (est.)**: designer chrome white #ffffff with rainbow top edge (violet→pink→orange gradient); SAVE #2f36f5; preview page/billboard blue #1a56c8; subtitle yellow #f2df9a; cards #ffffff; accent bars: price #2323d8, purple #7b35a8, orange #e8912d, green #6aaa3c; savings green #2e7d32; text near-black #202020.
- **Color application points**: full-bleed billboard bg; yellow secondary sentence; thin top accent bars on price box and each discount card; circular icon discs matching each accent; green money amount; designer's blue SAVE.
- **Typography moves**: "Welcome back, Karen!" ≈ EXTRA_LARGE bold white; subtitle ≈ MEDIUM_PLUS yellow; card titles ≈ LARGE; prices ≈ LARGE_PLUS bold with SMALL "/ Month" qualifiers; footnote SMALL gray.
- **Imagery stance**: flat isometric car-on-road illustration on billboard; styled icons — white glyphs on colored discs (car, people, thumbs-up).
- **Card treatment**: flat white on saturated blue, no visible border (contrast does the separation); inner boxes hairline-bordered with colored top bars.
- **Signature moves**: instead of a white page with a header, the whole page is brand blue with white cards floating on it; instead of a gray subtitle, a yellow accent sentence; instead of uniform list rows, each discount gets a matched accent bar + icon disc; secondary action demoted to an underlined text link ("Or, start a new quote").

### Component inventory (OBSERVED → INFERRED)
- INFERRED: a!billboardLayout or page background color #1a56c8; a!cardLayout(showBorder:false) ×2; decorative accents as a!cardLayout(height:"EXTRA_SHORT", style:accent hex); a!richTextDisplayField for prices; a!buttonWidget for PURCHASE NOW; link component for "start a new quote"; drill-in row "3 discounts $42.90/mo ›" as card-as-link.
- Chart types: none.
- Interactive affordances: PURCHASE NOW, start-a-new-quote link, discounts drill-in chevron; designer chrome: PREVIEWING dropdown, device-width picker, TEST/SAVE.

### Character & judgment
- **Register**: energetic-consumer — saturated brand color, illustration, exclamation greeting.
- **Why it works**: one decision (purchase) gets one solid button; price and discounts are the only two info zones; accent-bar rows make three discounts scannable in a glance.
- **Why not boring**: page-level saturated blue instead of white; yellow accent line; per-row color coding tied to icon discs; isometric illustration adds brand warmth without photos.
- **Boring twin**: white page, gray toolbar-style header, quote amounts in a bordered table, three discounts as bullet text, default-blue buttons bottom-right.
- **What to steal**: preview every interface at tablet/phone widths from the designer before shipping; full-bleed brand color + borderless white cards for consumer landings; thin colored top bars to differentiate repeated stat cards.
- **Risks**: yellow-on-blue subtitle ≈3:1 contrast (est.) — borderline; white text over illustration area could collide on narrower widths; tooltip overlays the preview strip in the shot.

### Code cross-check
- none — no SAIL source on this page.

## Component: Mobile layout flattening (page: ux-mobile-considerations)
Official variant vocabulary (page section names): Flattened columns · Flattened buttons · Wrapping & scrolling

### mobileDesign_flattenedColumns_RN.png
- **Produces it**: a!columnsLayout — phones flatten columns to one column by default; override breakpoints via stackWhen.
- **Looks like**: OBSERVED — desktop "Shipping Address" two-column form (Address Lines | City/State/Zip) re-stacks on iPhone: first column's fields, then second's; orange/gray annotation boxes map the columns.
- **Use when**: field meaning survives a straight top-to-bottom read. | **Avoid when**: sense depends on fields sitting side by side.
- **Styling hooks**: stackWhen width list.
- **Pairs well with**: address/detail forms.
- **Hexes**: none (annotation orange #e8762c est. is doc markup).
- **Marker**: neutral

### flattened_buttons_RN.png
- **Produces it**: a!buttonLayout(primaryButtons, secondaryButtons) rendered in the iOS/Android app.
- **Looks like**: OBSERVED — desktop row (secondaries GO BACK/CANCEL left, outline; primaries right, SAVE & PUBLISH solid navy #1d5a96 est., SAVE DRAFT outline) becomes a single-column, full-width stack: primaries above secondaries.
- **Use when**: labels read sensibly as a ranked stack. | **Avoid when**: relying on left/right spatial grouping.
- **Styling hooks**: SOLID vs OUTLINE style ranks the stack visually.
- **Pairs well with**: form footers, wizard steps.
- **Marker**: neutral

### wrapping_and_scrolling_RN.png
Tier override: batch suggested A; treated as tier B — an annotated two-phone teaching composite, not a reverse-engineerable full-page UI.
- **Produces it**: a!milestoneField with many steps; a!gridField with many columns, on phone widths.
- **Looks like**: OBSERVED — two iPhones flagged "Requires Horizontal Scrolling" (orange arrows): left, onboarding page whose milestone bar (Accepted Offer → New Hire Information → IT Accounts Created → HR…) overflows; right, a vendor grid (name links, logo images, codes; "1 - 50 of 302") wider than the screen.
- **Use when**: never — avoid these configurations on narrow targets. | **Avoid when**: any phone-first audience.
- **Styling hooks**: fewer milestone steps; trim grid columns.
- **Marker**: neutral (cautionary)

### Page rollup
Default choice for most cases is keeping Appian's automatic flattening and ordering content so a single-column read still makes sense, because phones will flatten columns and button rows no matter what; the designer's real job is auditing that order and avoiding width-hungry components (many-step milestones, many-column grids) on narrow screens.

## mobileSiteTabs_do.png + mobileSiteTabs_dont.png

### Principle: Write site page titles for the narrowest screen
- **DO shows**: OBSERVED — four site tabs CREATE NEW / GET NEXT / MY DISPUTES / SUMMARY with icons on web (dark active tab, red active icon on mobile); every label fits intact in the phone tab bar.
- **DON'T shows**: OBSERVED — verbose titles CREATE NEW DISPUTE / GET NEXT DISPUTE / MY ASSIGNED DISPUTES / SUMMARY REPORT fit on web but truncate on the phone to "Create New Dis…" and "My Assigned Di…".
- **Rule**: a title that fits desktop tabs can still truncate on mobile — trim to 1–2 words and let icons carry the rest.
- **Severity**: usually
- **Category**: mobile + labeling
- **SAIL implication**: site object page display names (not interface params); pair each page with a distinctive icon since text is first to shrink.

## ios_more_menu.png

### Identification
- **Image**: ios_more_menu.png | **Source page**: ux-mobile-considerations | **Alt/caption**: ios_more_menu.png; page caption "Site with more than five pages on an iOS device."
- **Device frame**: phone (iPhone with Dynamic Island)
- **Marker**: neutral
- **UI type**: other — auto-generated iOS "More" overflow navigation page of a site

### Use-case reconstruction (INFERRED)
- **Persona**: insurance policyholder, occasional-customer, self-serving on Appian Mobile.
- **Domain & brand context**: consumer auto insurance (tabs: My Claims, My Quotes, Vehicles); plum-branded chrome.
- **Top 3 user tasks (ranked)**: 1. Jump between the four primary pages via the tab bar. 2. Reach overflow pages (Resources, About, Contact) through More. 3. Contact the insurer.
- **Implied requirements**: the site has 7 pages but iOS shows only 5 slots, so the fifth becomes a system More menu; overflow pages must stay reachable in ≤2 taps; brand color must carry through header and tab bar; each page needs an icon because the More list leans on them.
- **Data model sketch**: navigation only — Pages ×7: Home, My Claims, My Quotes, Vehicles + overflow Resources, About, Contact.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER(plum, hamburger, title "More")
├─ LIST ×3 rows (icon disc + label + chevron, hairline dividers)
│   … empty white body …
└─ TAB-BAR ×5 (Home | My Claims | My Quotes | Vehicles | More←selected, white block)
```
- **Above the fold**: everything; body is mostly empty white below three rows.
- **Reading order**: single-column.
- **Hierarchy rationale**: system-generated utility page — uniform rows, no hero; the selected "More" tab inverts to a white block so users know which mode they're in; tab bar keeps the four primary pages one tap away.
- **Density**: 1 — three list rows on a full phone screen (auto-generated overflow, not designed density).
- **Ratios & spacing**: full-width rows h≈110px; generous tap targets; no indentation.

### Styling specifics (OBSERVED)
- **Palette (est.)**: header + tab bar plum #6d2b5c; body #ffffff; icon discs/glyphs blue #2b32e8; labels #1c1c1e; chevrons #b5b5b8; dividers #e3e3e5; selected More segment: white bg, near-black dots icon + label.
- **Color application points**: brand plum confined to chrome; one accent blue for all row icons; selected tab shown by full inversion (white block) rather than a tint change.
- **Typography moves**: header title ≈ MEDIUM white; row labels ≈ MEDIUM black; tab labels SMALL white.
- **Imagery stance**: styled icons only — filled blue glyphs (question-circle, users, phone); white glyphs in the tab bar.
- **Card treatment**: none — flat list with hairline dividers.
- **Signature moves**: instead of cramming 7 tabs, iOS replaces the fifth with More (platform behavior, the page's teaching point); selected-tab inversion; oversized colored icon discs double as tap affordance.

### Component inventory (OBSERVED → INFERRED)
- No SAIL components — this chrome is generated by Appian Mobile from the site object: page names + icons (question-circle, users, phone) INFERRED from site configuration.
- Chart types: none.
- Interactive affordances: 3 drill-in rows with chevrons; 5-slot tab bar; hamburger menu.

### Character & judgment
- **Register**: institutional + utilitarian-ops — system chrome, uniform rows, zero decoration.
- **Why it works**: overflow pages remain two taps away; icons repeat between site config and this list so recognition survives the demotion; inverted white tab makes the temporary mode obvious.
- **Why not boring**: it mostly is by design — the interesting choices are plum chrome carried into the tab bar, the white-block selected state, and honest emptiness instead of filler.
- **Boring twin**: burying all seven pages behind the hamburger alone, or seven microscopic tabs with 8pt labels.
- **What to steal**: cap mobile-first sites at five pages or page groups; give every page a distinctive icon; test what lands in the More bucket before shipping — the 6th and 7th pages lose visibility.
- **Risks**: large dead area on tall phones; "More" is a generic label users may not open; blue icons have no tie to the plum brand (est. system accent).

### Code cross-check
- none — no SAIL source on this page.

## ipad_site_pages.png

### Identification
- **Image**: ipad_site_pages.png | **Source page**: ux-mobile-considerations | **Alt/caption**: "site pages in an ipad"; demonstrates iPadOS 18 floating tab bar for site pages
- **Device frame**: tablet (iPad portrait)
- **Marker**: neutral
- **UI type**: dashboard-analytical

### Use-case reconstruction (INFERRED)
- **Persona**: sustainability/operations manager, weekly-manager cadence, tracking emissions against targets for a site.
- **Domain & brand context**: industrial/energy organization running a net-zero program ("Journey to Net-Zero Carbon 2035"); Eindhoven (NL) location selected; nature-themed green identity.
- **Top 3 user tasks (ranked)**: 1. Read the year's actual/offset/net impact. 2. Spot categories exceeding target (Transportation is over). 3. Navigate site pages (Overview | Plants | Take Action) and re-filter by year/location.
- **Implied requirements**: program KPIs must show actual, offsets, and net together; each emission category needs an instant over/under-target signal; year + location filterable; trend, transport mix, and worst plants visible on one portrait screen; site navigation must surface in the app header (floating tab bar) rather than in-page.
- **Data model sketch**: Emissions(year, site, category ∈ {Energy, Transportation, Waste}, actual MtCO2e, target: 915/1,067 · 2,387/1,910 · 563/623); Offsets(579); NetImpact(3,285 = 3,865 − 579); Plant(Grift, Wolderwijd, Rhenen × electric/gas/waste emissions, axis 0–500); TransportMode share (Sea, Truck, Rail, Air); monthly series by billing period (Jan–Nov '21).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
APP-HEADER (hamburger · floating TABS ×3 "Overview|Plants|Take Action" ← white annotation halo · share)
├─ BILLBOARD h≈35% style=sage illustration=clouds+sun content=title
│  └─ KPI-ROW ×3 (2021 ACTUAL IMPACT 3,865 | OFFSETS 579 | NET IMPACT 3,285; divider-separated)
├─ FILTER-BAR style=green (year dropdown | location dropdown)
├─ COLUMNS [1:1:1] "Energy Consumption|Transportation|Waste"
│  └─ CARD(stat + progress-vs-TARGET bar) ×3
└─ COLUMNS [1:1:1]
   ├─ CHART(line "Emissions over Time", 3 series)
   ├─ CHART(donut "Emissions by Transportation Mode")
   └─ CHART(stacked-bar-h "Top Plants by Total Emissions (All Time)")
```
- **Above the fold**: the entire dashboard fits one portrait viewport.
- **Reading order**: F — billboard KPIs → filter band → stat cards → chart row.
- **Hierarchy rationale**: the program goal + three headline KPIs get billboard scale (task 1); category target bars sit mid-page for exception-spotting (task 2); diagnostic charts come last as drill-down context.
- **Density**: 4 — 3 KPIs, 2 filters, 3 stat cards, and 3 charts in a single portrait viewport.
- **Ratios & spacing**: strict thirds [1:1:1] in both content rows; compact card padding ≈ LESS; tight section gaps.

### Styling specifics (OBSERVED; note — everything outside the annotation halo is dimmed by the doc's overlay, so hexes are estimated from darkened pixels)
- **Palette (est.)**: billboard sage #b8c7ab; filter band #7ba05a; page bg gray #d2d2d2 (dimmed white); cards #dedede; greens for identity: numbers/icons #2f6b2f, series #4a8f3c/#7fbf5f; under-target bar blue #2f5fc4; over-target bar red #c8102e; sun gold #dfc26a; text #1f1f1f.
- **Color application points**: green carries icons, KPI numbers, all three chart palettes; semantic blue/red reserved exclusively for the target bars; white dropdown fields pop on the green filter band; floating tab bar uses green only for the selected "Overview" label.
- **Typography moves**: mixed-weight title ("Journey to" regular, "Net-Zero Carbon" bold, "2035" green); KPI labels SMALL all-caps; KPI numbers EXTRA_LARGE; card stats LARGE_PLUS with SMALL unit suffix; "ASSOCIATED EMISSIONS" SMALL all-caps gray.
- **Imagery stance**: flat illustration (clouds, sun rays) inside the billboard; small green glyph icons beside each KPI.
- **Card treatment**: flat filled, no borders or shadows.
- **Signature moves**: single-hue green system so the one red bar is the only alarm on screen; KPI trio embedded inside the illustrated billboard instead of a separate card row; site pages ride the iPadOS floating tab bar (the doc's point) freeing the whole canvas; target tick + colored fill turns each category card into a one-glance compliance read.

### Component inventory (OBSERVED → INFERRED)
- INFERRED: a!billboardLayout(backgroundColor sage, overlay content) with a!sideBySideLayout KPI trio; a!dropdownField ×2 on a colored band (a!cardLayout style green); a!progressBarField-style target bars with conditional color; a!lineChartField(colorScheme custom greens); a!pieChartField(style:"DONUT"); a!barChartField(horizontal, stacking:"NORMAL"); site pages → floating tab bar is platform rendering, not SAIL.
- Chart types + custom colorScheme: line, donut, stacked horizontal bar — all on a shared green ramp (custom scheme yes).
- Interactive affordances: 3 site tabs, year + location dropdowns, hamburger, share.

### Character & judgment
- **Register**: calm-clinical + institutional — muted greens, uniform flat cards, no ornament beyond the billboard illustration.
- **Why it works**: whole program health in one screen with no scrolling; red-only-when-wrong makes the Transportation overage unmissable; consistent thirds grid aligns stats to their charts.
- **Why not boring**: sage illustrated billboard instead of a white header; three-weight title treatment; disciplined monochrome-green charts; OS-level tab bar instead of in-page tabs.
- **Boring twin**: white page, blue default chart palette, bordered KPI cards up top, tabs as in-page buttons, filters in a right rail.
- **What to steal**: reserve semantic color for exceptions only; put program KPIs inside the billboard; on iPadOS 18 let site pages live in the floating tab bar and reclaim the canvas.
- **Risks**: gray-on-gray small labels are low contrast (amplified by the dimming overlay); donut lacks data labels; on phones this stacks ~9 zones deep.

### Code cross-check
- none — no SAIL source on this page.

## Linkify_Phone_Numbers.png

### Identification
- **Image**: Linkify_Phone_Numbers.png | **Source page**: ux-mobile-considerations | **Alt/caption**: "/ux pages/Linkify Phone Numbers"
- **Device frame**: tablet (iPad landscape; InVision-hosted mock per status bar)
- **Marker**: neutral
- **UI type**: record-view — employee profile with native iOS call dialog open

### Use-case reconstruction (INFERRED)
- **Persona**: insurance-company employee viewing a colleague's profile, occasional use, wants to call him.
- **Domain & brand context**: insurer's internal social intranet (feed item: "Michael Cooper has launched a new critical priority Investigation called Insurance Fraud Investigation…"); grayscale, editorial-collage art direction.
- **Top 3 user tasks (ranked)**: 1. Call or email Michael (tap a linkified number → OS dial confirm). 2. Follow / give kudos. 3. Scan his latest activity.
- **Implied requirements**: phone numbers inside read-only Text/Paragraph components must auto-convert to tap-to-dial links (the feature being taught); multiple numbers must be labeled by type; the OS must confirm before dialing; contact block must sit above the feed.
- **Data model sketch**: Person(name Michael Cooper, title Sr. Manager, email, phone ×2 typed Mobile/Office, country USA, followers 175, following 452, kudos 16); NewsEvent(actor, action, object, priority).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
NAV-BAR(gray, red back-chevron, centered title)
├─ SECTION "Summary" (collapsible gray bar, red briefcase icon)
├─ BILLBOARD h≈390 photo=b&w crumpled paper
│  └─ PANE[left]: avatar circle + name + "Sr. Manager" + [FOLLOW][GIVE KUDOS] + stats ×3
├─ CONTACT list (email · 2 phone links ← orange annotation box · USA)
├─ SECTION "Latest News" EVENT-FEED
└─ OVERLAY: iOS dialog "(703) 555-2604" [Cancel | Call]
```
- **Above the fold**: all of it; feed truncates at one row.
- **Reading order**: F — identity block, contact rows, feed.
- **Hierarchy rationale**: identity billboard dominates (who am I calling?); the contact block is the lesson and is annotated; the OS dialog is deliberately captured to show the tap outcome.
- **Density**: 3 — one profile zone, a 4-row contact list, stats trio, feed start.
- **Ratios & spacing**: left identity pane ≈40% of billboard width; contact rows tight (≈32px); standard section gaps.

### Styling specifics (OBSERVED)
- **Palette (est.)**: nav #d4d4d4; billboard blacks #1e1e1e–#5a5a5a; body band #cfcfcf; content white #ffffff; tappable text blue #1466a8; iOS dialog buttons #007aff; back chevron/briefcase red #9d1c1c; "Latest News" navy #1f4e79; annotation orange #e8762c (doc markup).
- **Color application points**: page is near-grayscale; blue appears only on tappable text (email, both phone numbers, feed links) — which is exactly the linkify lesson; red confined to chrome accents.
- **Typography moves**: name ≈ LARGE white; role SMALL gray; stat numbers ≈ LARGE_PLUS white over SMALL bold labels; dialog number MEDIUM_PLUS bold; body STANDARD; buttons SMALL all-caps.
- **Imagery stance**: b&w photographic billboard (crumpled-paper texture) + circular avatar photo.
- **Card treatment**: flat gray bands; light-gray flat buttons (FOLLOW, GIVE KUDOS).
- **Signature moves**: grayscale everything so auto-blue links are the only affordance on the page; follower/kudos stats as an inline KPI trio inside the billboard; the native call dialog left in frame to teach the interaction, not just the link.

### Component inventory (OBSERVED → INFERRED)
- INFERRED: read-only a!textField / a!paragraphField rows carrying the numbers — iOS/Android auto-linkify them (the feature; no extra params); stats via a!sideBySideLayout; a!buttonArrayLayout for FOLLOW/GIVE KUDOS; feed as rich-text news entries. The (703) 555-2604 Cancel/Call dialog is iOS system UI, not SAIL.
- Chart types: none.
- Interactive affordances: tap-to-dial links ×2, mailto link, follow/kudos buttons, collapsible Summary, feed links.

### Character & judgment
- **Register**: warm-community + institutional — social profile mechanics inside corporate chrome.
- **Why it works**: "(Mobile)" / "(Office)" italic labels disambiguate two numbers; the OS confirm prevents accidental dialing; contact info sits high instead of buried in a details tab.
- **Why not boring**: art-directed b&w billboard; kudos gamification trio; link-blue-as-only-color discipline. (Tempered: this is an InVision-era mock; chrome predates current Appian Mobile.)
- **Boring twin**: white profile page, gray header, phone number as flat black text that mobile users must retype into the dialer.
- **What to steal**: keep phone numbers in read-only Text/Paragraph components so mobile linkifies them for free; label each number's type; design flows expecting the OS dial-confirm step.
- **Risks**: gray-on-gray labels are low contrast; full-grayscale UI can read as disabled; dated chrome may mislead about current rendering.

### Code cross-check
- none — no SAIL source on this page.
