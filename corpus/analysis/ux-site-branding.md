# Analysis: ux-site-branding

Page: `corpus/pages/ux-site-branding.md` (section: guidance) — "Designing Sites and Portals". Images are site/portal object configuration examples (navigation bar, color scheme, branding), not SAIL interfaces, so no SAIL source exists anywhere on this page; all colors are pixel-estimated. Sections follow the batch table order; tier-C siblings are merged into DO/DON'T pairs.

## accentColor_dont.png

### Principle: Pick an accent color that is not near-black, not destructive-red, and not too pale
- **DON'T shows**: Three overlapping "New Customer" form crops, each with a bad accent color applied to the section heading + ADD CUSTOMER button. OBSERVED: (1) pale green #90ee7e (est.) — fails contrast on white page bg; (2) near-black charcoal #3b3b3b (est.) — indistinguishable from body text and from a default dark button; (3) red #f0142f (est.) — inset callout shows red ADD CUSTOMER sitting beside the red DELETE CUSTOMER destructive button, making safe and destructive actions identical.
- **DO shows**: none on page (DON'T-only example).
- **Rule**: Accent color needs ≥4.5:1 contrast on white and clear distance from both #000-family text and the destructive red.
- **Severity**: always
- **Category**: color | a11y
- **SAIL implication**: Site/portal object "Accent color" hex config; accent propagates to buttons, PRIMARY links, and section headings, so test it at every application point.

## branding_preview_selection.gif

### Interaction: Branding preview context switcher (gif: branding_preview_selection.gif)
- **State chart**: OBSERVED f0: interface object `INS_InsuranceQuote` in PREVIEWING mode renders a quote wizard step with default branding — serif headings, blue-violet #2622ec (est.) selected card border + NEXT: ABOUT YOU button → f27: designer opens the Branding preview dropdown in the toolbar; menu lists Default, INS Customer Service, INS Portal, INS Internal Site, INS_Quote with object-type icons → INFERRED (from page text): selecting a site/portal re-renders the same interface with that object's branding (colors, shapes, capitalization).
- **SAIL mechanism**: other — Appian Designer interface-object toolbar control, not SAIL.
- **UX purpose**: orientation (design-time WYSIWYG of site branding).
- **Replicate when**: n/a in SAIL; adopt the workflow — configure branding early, then design against it. | **Cost**: none.
- Note: frames f55/f83/f110 are blank white (GIF delta-frame extraction artifact); end state inferred, marked above.

## header-bar-simple.png + sidebar-simple.png

### Principle: Use a header bar, not a sidebar, for a handful of pages
- **DO shows**: "Maryland Safe Food Inspection" public-health dashboard with a dark-navy #0b1266 (est.) Mercury header bar holding 3 pages (HOME underlined white, FACILITIES, INSPECTIONS). Full viewport width goes to content: navy billboard with 3 donut KPI gauges (78/23/17%), then 3 white chart cards. OBSERVED.
- **DON'T shows**: identical dashboard forced into a sidebar layout: 3 items (Home = white selected pill with dark text, Facilities, Inspections) atop a tall empty navy #0d1560 (est.) column; ~15% of width spent, charts compressed, dead space below item 3. OBSERVED.
- **Rule**: Few pages → header bar; sidebar earns its width only with many items.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: Site/portal object Layout = "Header Bar" vs "Sidebar" (object config, not SAIL).

## loadingBar.png

### loadingBar (tier B)
- **Produces it**: Site/portal color scheme → "Loading bar color" hex.
- **Looks like**: thin (~6px) progress strip pinned above the header bar; pale blue #aecbe4 (est.) fill advancing left→right, unfilled remainder darker gray-blue #274b6b (est.), over a slate-blue #3d6a94 (est.) Helium header (Sailaway Cruises; selected CRUISES tab lighter #4d84b5 (est.)).
- **Use when**: always renders; choose a hue that pops against the header. | **Avoid when**: n/a — only avoid low-contrast picks.
- **Styling hooks**: loading bar hex only.
- **Pairs well with**: dark header colors (light bar reads instantly).
- **Hexes**: above — color is the variant dimension.
- **Marker**: neutral

## mercuryHighlightColor.png

### mercuryHighlightColor (tier B)
- **Produces it**: header bar color + "Selected highlight color" in the site object, Mercury style.
- **Looks like**: Knights claims site: light-blue #3f8fd2 (est.) bar, white logo + page names, selected CLAIMS CENTER underlined in gold #f5c518 (est.).
- **Use when**: Mercury/Oxygen — pick a highlight that contrasts the bar (complementary gold-on-blue here) so the active tab is unmistakable. | **Avoid when**: highlight ≈ bar color.
- **Styling hooks**: highlight hex; underline is the fixed Mercury affordance.
- **Pairs well with**: mid-to-dark saturated bar colors.
- **Hexes**: #3f8fd2 / #f5c518 (both est.)
- **Marker**: neutral

## nav-bar-logo.png

### nav-bar-logo (tier B)
- **Produces it**: Site/portal object "Logo" upload (or NONE).
- **Looks like**: annotated charcoal #383d40 (est.) Mercury bar: green callout arrows label the configurable white DOT logo (left) and the non-configurable appian wordmark (far right, after waffle menu + avatar). Selected Home carries an orange #f5a623 (est.) underline.
- **Use when**: always brand with a logo built for the bar color. | **Avoid when**: n/a; you cannot remove the Appian logo, so plan around it.
- **Styling hooks**: logo asset, NONE option.
- **Pairs well with**: transparent-background logo files.
- **Hexes**: n/a (color not the dimension).
- **Marker**: neutral

## navBar.png

### Principle: Avoid medium-brightness header colors that defeat the automatic text color
- **DON'T shows**: Sailaway Cruises Helium bar in mid-tone lavender #a8a3d0 (est.). Appian auto-assigned white text/icons, but white on this medium brightness washes out (CRUISES/SHIPS/EMPLOYEES/VENDORS barely legible); the selected-tab fill #8d88c2 (est.) is also nearly invisible against the bar. OBSERVED.
- **DO shows**: none under this sub-heading (the same cruise site appears with a legible dark bar in loadingBar.png — cross-ref).
- **Rule**: Pick clearly dark (gets white text) or clearly light (gets dark-gray text) bar colors; mid-brightness gives neither pairing enough contrast.
- **Severity**: always
- **Category**: color | a11y
- **SAIL implication**: header bar color hex in site/portal object; text/icon color is automatic and not overridable.

## navigation-bar-styles.png

Tier override: batch suggests A, but this is three stacked header-bar crops (a variant comparison), not a full-page UI → treated as tier B with the page's official style vocabulary.

### Component: Header bar style (page: ux-site-branding)
Official variant vocabulary: **Helium / Mercury / Oxygen** (all shown for the same INSURECORP site, plum #7b2150 (est.), white text).

### Helium
- **Produces it**: Style = Helium (sites only).
- **Looks like**: icons required above each page name; selected WELCOME = entire tab highlighted as a white block with dark text; logo on the RIGHT beside appian mark; display name "Insurance Hub" + user avatar right.
- **Use when**: you want always-visible page names + icon reinforcement. | **Avoid when**: portals (unavailable) or no good icons exist.
- **Styling hooks**: bar hex, highlight hex, icons, display name.
- **Marker**: neutral

### Mercury
- **Produces it**: Style = Mercury (sites + portals).
- **Looks like**: logo LEFT, page names left beside it, no icons; selected page underlined white; display name right.
- **Use when**: conventional logo-left brand layout; single-page sites where the page name should hide. | **Avoid when**: you need icons.
- **Styling hooks**: bar hex, underline highlight hex, display name replaces nav-menu icon.
- **Marker**: neutral

### Oxygen
- **Produces it**: Style = Oxygen (sites + portals).
- **Looks like**: logo + display name LEFT as a lockup; page names pushed RIGHT (underline highlight), then waffle icon + avatar + appian.
- **Use when**: display name should read as part of the brand lockup. | **Avoid when**: many pages (right-aligned list crowds the utility icons).
- **Styling hooks**: same as Mercury.
- **Marker**: neutral

### Page rollup
Default choice for most cases is Mercury because it is available everywhere (sites and portals), needs no icon assets, and matches the conventional logo-left / pages-left scanning pattern; pick Helium only when icon + always-visible-name reinforcement is worth building icons for.

## organized_header_bar_do.png + organized_header_bar_dont.png

### Principle: Cap top-level navigation by grouping related pages
- **DO shows**: INSURECORP plum #7b2150 (est.) Mercury bar with 6 top-level items; MY ACCOUNT is a page group whose open dropdown (same plum panel) reveals MY QUOTES / MY VEHICLES / MY CLAIMS; RESOURCES and CONTACT show chevrons. Bar stays scannable beside the hero ("Great rates…" + ZIP quote card). OBSERVED.
- **DON'T shows**: same site with all 10 pages flat — WELCOME through ARTICLES fill the entire bar edge-to-edge, no grouping chevrons; scanning cost jumps and truncation risk appears at narrower widths. OBSERVED.
- **Rule**: ≤8 top-level items (≤5 for mobile-first); fold siblings into page groups with clear titles.
- **Severity**: usually
- **Category**: layout | labeling
- **SAIL implication**: site/portal object pages + page groups config; group dropdown inherits the header bar color automatically.

## page-name-capitalization.png

### page-name-capitalization (tier B)
- **Produces it**: "Use uppercase capitalization for page titles" toggle (doesn't apply to Appian Mobile).
- **Looks like**: two DOT charcoal #383d40 (est.) bars: top preserves original casing (Home / Dashboard / Projects, selected bold + orange #f5a623 (est.) underline); bottom renders HOME / DASHBOARD / PROJECTS uppercase, same underline.
- **Use when**: uppercase for formal/institutional brand voice. | **Avoid when**: long page names (uppercase widens labels, truncates sooner).
- **Styling hooks**: the single toggle; interacts with button-label capitalization for consistency.
- **Pairs well with**: short 1–2 word page names.
- **Hexes**: n/a.
- **Marker**: neutral

## page_group_clear_page_title_do.png + page_group_clear_page_title_dont.png

### Principle: Title every page that lives inside a page group
- **DO shows**: INSURECORP site, plum #7b2150 (est.) Mercury bar, MY ACCOUNT selected (white underline + chevron). The page opens with "My Claims" at ≈EXTRA_LARGE dark gray #333 (est.) over a divider, then a Status Breakdown donut card (3-pink series) and List of Claims card with bold plum links. OBSERVED.
- **DON'T shows**: pixel-identical page minus the title — cards float under blank gray #f0f0f0 (est.); the bar still reads only the group name MY ACCOUNT, so nothing names the child page. OBSERVED.
- **Rule**: the nav highlight identifies the group; only an on-page title identifies the page.
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: make a page-name-matching title (section/heading text) the first element of every group child.

## portal-header-comparison1.png

### Identification
- **Image**: portal-header-comparison1.png | **Source page**: ux-site-branding | **Alt/caption**: "comparison of portal with and without navigation bar"
- **Device frame**: desktop — two full-viewport captures side by side, labeled "One-page portal (no header bar)" / "One-page portal (header bar)"
- **Marker**: neutral
- **UI type**: wizard-step (single-page portal quote funnel); the image's teaching dimension is the portal object's "Show navigation bar" toggle

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public insurance shopper; anonymous, single-visit cadence
- **Domain & brand context**: consumer insurance (INSURECORP), direct-to-consumer quote funnel; trust-blue accent, generous whitespace
- **Top 3 user tasks (ranked)**: 1. choose products to bundle 2. advance to the next wizard step 3. grasp the incentive ("Save as much as 25%")
- **Implied requirements**: must work unauthenticated; must show position in a 6-step flow; exactly one primary CTA per step; legal disclaimer must persist on every step; company branding must be visible (the reason the toggle exists)
- **Data model sketch**: Quote 1—n ProductSelection {Auto Cars & SUVs, Homeowners, Renters, Other Vehicles: name, subtitle, icon, selected}; steps Bundled Savings → About You → Your Vehicles → Other Drivers → Coverage Options → Quote

### Layout anatomy (OBSERVED)
- **Skeleton** (header-bar variant):
```
HEADER-BAR (blue #2622ec est., logo only — single page ⇒ no page names)
├─ COLUMNS [NARROW:AUTO]
│  ├─ WIZARD-STEP 1/6 vertical milestone rail (icon + label, connector line)
│  └─ FORM "Save more with a bundled quote"
│     ├─ CARD(Auto Cars & SUVs, selected: accent border + corner check)
│     ├─ text "Save as much as 25%…" / "What else do you want to protect?"
│     ├─ SBS CARD ×3 (Homeowners | Renters | Other Vehicles)
│     └─ BUTTON "NEXT: ABOUT YOU" right-aligned
└─ FOOTER charcoal #333333 est.: white logo + 3 disclaimer lines
```
Left variant is identical minus the header bar — content starts on bare white.
- **Above the fold**: the whole step, title through CTA, footer included
- **Reading order**: F — title → selected card → prompt → option row → CTA
- **Hierarchy rationale**: title is the only LARGE text and states the offer (task 3); pre-selected Auto card sits directly beneath it, confirming context (task 1); the CTA is the sole filled element, bottom-right (task 2)
- **Density**: 1 — one decision on screen; the option row uses <15% of the viewport, the rest is whitespace
- **Ratios & spacing**: milestone rail ≈20% width [NARROW:AUTO]; option cards equal-width SBS with small gaps; footer full-bleed

### Styling specifics (OBSERVED)
- **Palette**: page/card bg #ffffff; header bar + accent vivid blue #2622ec (est.); footer #333333 (est.); text near-black #1a1a1a (est.); card borders #d9d9d9 (est.)
- **Color application points**: header bar; current milestone icon (filled blue circle) vs gray upcoming steps; product-card icons; selected-card border + checkmark; NEXT button fill — one hue, six application points
- **Typography moves**: title LARGE regular; prompts STANDARD bold; card labels SMALL bold with lighter SMALL subtitles; CTA uppercase; disclaimers SMALL white-on-charcoal
- **Imagery stance**: styled line icons only (blue on white); no photos
- **Card treatment**: flat white, 1px light-gray border; selection = accent border + check badge
- **Signature moves**: instead of a "Step 1 of 6" caption, a vertical icon milestone rail; instead of a checkbox group, cards-as-choices; instead of generic "NEXT", the CTA names the destination ("NEXT: ABOUT YOU"); header bar hex equals the accent hex so the toggled-on bar reads as the same brand system

### Component inventory (OBSERVED)
- Portal object config: Show navigation bar ON/OFF (the compared dimension), logo, header bar color; portals get no nav menu, user menu, or Appian logo (cross-ref sites_vs_portals_navigation_bar.png)
- Interface: vertical milestone rail (a!milestoneField vertical or card list — INFERRED); a!cardLayout ×4 selectable with conditional accent border; a!buttonWidget accent fill; dark footer ≈ a!cardLayout(style:"#333333", showBorder:false) INFERRED
- Charts: none | Affordances: card selection, single CTA

### Character & judgment
- **Register**: energetic-consumer + calm-clinical — sells a 25% promise while showing exactly one decision on a white field
- **Why it works**: one accent hue marks everything interactive or selected; the pre-selected Auto card starts the form one step done; the destination-named CTA removes next-step uncertainty
- **Why not boring**: destination-named CTA; icon milestone rail as left furniture; selection as border+check on cards rather than checkboxes; charcoal legal band quarantines compliance text from the sell
- **Boring twin**: white page, "Get a Quote" H1, a checkbox list of four products, "Step 1 of 6" caption, gray Next button bottom-left, disclaimer as tiny inline gray paragraph
- **What to steal**: name the destination in wizard CTAs; reuse the accent hex as the portal header bar color; keep quote funnels at density 1
- **Risks**: with the bar off, zero branding above the fold (logo only in the footer) — the page text's argument for toggling it on; gray card subtitles likely fail 4.5:1; verify the accent's faded hover variant on dropdowns

### Code cross-check
none — no SAIL source on this page (portal object configuration example).

## sales_db_back_button.gif

### Interaction: Filters write URL parameters; browser Back restores them (gif: sales_db_back_button.gif)
- **State chart**: OBSERVED f0: Hourglass site (dusty-rose #d4a2a6 (est.) Mercury bar, SALES DASHBOARD underlined dark) at `…/sales-dashboard/page/home`; empty filter row (Product Category / Sale Type / Product Name); Top Selling Products rows with crimson #b02a4c (est.) purchased bars 80/79/76/68 beside a Sales by Region stacked-column chart → user commits a filter → f105/f158: list drops to matching rows, columns shrink and re-render OBSERVED → address bar gains the filter's query parameters, and browser Back restores the prior URL + selections INFERRED (delta frames omit browser chrome; behavior stated in page text).
- **SAIL mechanism**: grid refresh — filter variables bound to URL parameters; Refresh After = "Unfocus" so history gets one entry per committed value, not per keystroke.
- **UX purpose**: orientation — shareable, bookmarkable, back-button-safe filter state.
- **Replicate when**: users bookmark or share filtered dashboards. | **Cost**: URL-parameter wiring per filter.

## select-vehicle-tab-do.gif

### Interaction: Tab selection writes a URL parameter (gif: select-vehicle-tab-do.gif)
- **State chart**: OBSERVED f0: AU Auto Insurance "My Account" (white minimal bar, EXTRA_LARGE black title, Overview/Claims/Preferences tabs with thick black underline) at `…/sites/insurance?vehicle=1`; Vehicles & Coverage shows a VEHICLE 1 | VEHICLE 2 button-toggle (selected = blue #1f5fa8 (est.) fill/border) above a "2021 Polestar 2" coverage card → user clicks VEHICLE 2 → f38/f57: toggle and card visibly re-render (delta frames) OBSERVED → card now shows vehicle 2, URL flips to `?vehicle=2` INFERRED (deltas omit browser chrome; page text confirms).
- **SAIL mechanism**: selected-card/button-toggle state bound to a URL parameter; tab panels via showWhen.
- **UX purpose**: orientation — bookmarkable, shareable deep links to a tab.
- **Replicate when**: tabbed record/account views users bookmark. | **Cost**: one urlparameter binding per tab group.

## semi-rounded-input-shape-example.png

### Identification
- **Image**: semi-rounded-input-shape-example.png | **Source page**: ux-site-branding | **Alt/caption**: "This dashboard shows both semi-rounded inputs and semi-rounded cards displayed in a site. Use rounded cards and rounded inputs together…"
- **Device frame**: desktop (full-width top-of-page crop; content below the filter row is cut — tier A kept per batch, noting the crop)
- **Marker**: neutral
- **UI type**: dashboard-analytical

### Use-case reconstruction (INFERRED)
- **Persona**: weekly-manager — retail inventory/merchandising manager
- **Domain & brand context**: appian-branded retail inventory demo; navy corporate chrome, white work surface
- **Top 3 user tasks (ranked)**: 1. read the three inventory KPIs + trend direction 2. re-scope by date range 3. drill into top stocked products by category/location
- **Implied requirements**: KPIs must carry delta direction, magnitude, and trend shape; date range must be user-set (not preset-only); product drill-down filterable by two dimensions; brand border shape must apply uniformly (the image's teaching point)
- **Data model sketch**: InventorySnapshot {total $3,276.91, perStore $374.12, newOrders 1275, deltas ±$/%/n, daily series}; Product {category: Dresses…}; Location {New York…}

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-BAR Mercury navy #0f2032 est. (appian wordmark, 3 pages, blue underline on INVENTORY SUMMARY)
├─ TITLE-ROW "Inventory Summary" + Date Range: 2 date inputs right-aligned
├─ KPI-ROW ×3 CARD(label + EXTRA_LARGE number + delta + sparkline, semi-rounded, border)
└─ SECTION "Top Stocked Products By Category & Location"
   └─ COLUMNS [1:1] dropdown Category="Dresses" | dropdown Location="New York"
```
- **Above the fold**: everything captured; product list itself is below the crop
- **Reading order**: F — title, KPI row left→right, section title, filters
- **Hierarchy rationale**: KPI numbers are the largest ink (task 1); date inputs share the title row so scope is set before reading (task 2); filters lead the drill-down section (task 3)
- **Density**: 3 — three KPI cards + filter row in one band, comfortable padding
- **Ratios & spacing**: KPI cards equal thirds; filter dropdowns equal halves; STANDARD gaps

### Styling specifics (OBSERVED)
- **Palette**: bar #0f2032 (est.); page/card bg #ffffff; borders #d6d6d6 (est.); text #333333 (est.); nav underline #2196f3 (est.); positive green #34a853 (est.); negative red #ea4335 (est.)
- **Color application points**: nav underline; delta arrows/text; sparkline strokes (green up, red down); nothing else colored — semantics own the color budget
- **Typography moves**: page title LARGE light-weight; KPI labels MEDIUM bold; KPI numbers EXTRA_LARGE; deltas SMALL in semantic color; date placeholder italic gray
- **Imagery stance**: none (sparklines only)
- **Card treatment**: 1px border, flat, semi-rounded corners matching the inputs — the site-level Input shape echoed manually on cards
- **Signature moves**: instead of bare KPI numbers, number + arrow + % + sparkline quadruple-encodes trend; instead of preset ranges, two inline a!dateField inputs on the title row; instead of mixed radii, one semi-rounded radius across inputs, dropdowns, and cards

### Component inventory (OBSERVED)
- Site object: Input shape = "Semi-rounded" (applies to the date fields + dropdowns site-wide); card shape set per-component (page text: card/box shapes are component-level, not site-wide) — a!cardLayout(shape:"SEMI_ROUNDED", showBorder:true) INFERRED
- a!dateField ×2, a!dropdownField ×2, KPI cards with embedded sparkline line charts INFERRED
- Chart types: 3 sparklines, semantic 2-color scheme | Affordances: date + 2 dropdown filters

### Character & judgment
- **Register**: authoritative-executive + utilitarian-ops — big scannable numbers over a working filter surface
- **Why it works**: color appears only where it means something (deltas); sparkline gives shape context the ±% alone lacks; consistent radius makes chrome recede
- **Why not boring**: sparklines inside KPI cards; delta magnitude in both $ and %; single accent underline in the bar; uniform semi-rounded system shape
- **Boring twin**: squared default inputs, three flat KPI tiles with plain numbers and no trend, a "Last 30 days" preset dropdown, filters stacked vertically above the fold
- **What to steal**: mirror the site input radius on hand-built cards; put date-range scope on the title row; reserve red/green strictly for deltas
- **Risks**: red/green pairing needs the arrows it has (colorblind-safe only with them); italic gray placeholder likely <4.5:1; KPI cards are not clickable-looking — fine unless drill-down is expected

### Code cross-check
none — no SAIL source on this page.

## show-display-name.png

### show-display-name (tier B)
- **Produces it**: "Show display name in navigation bar" toggle; rendered position is dictated by the bar style.
- **Looks like**: two annotated DOT bars, green callouts on "Transportation Hub". Mercury (navy #14263d (est.)): name sits RIGHT with a chevron — it replaces the navigation menu icon and becomes that trigger. Oxygen (charcoal #33383d (est.)): name sits LEFT beside the logo as a brand lockup; the waffle nav icon stays. Selected HOME underline: cyan #4db8ff (est.) / amber #f5a623 (est.).
- **Use when**: multi-site orgs where the logo alone doesn't name the workspace. | **Avoid when**: Mercury/Helium users depend on seeing the standard nav-menu icon.
- **Styling hooks**: the toggle only; placement is style-determined (sidebar + Oxygen keep the nav icon; Helium + Mercury swap it out).
- **Pairs well with**: short display names (long ones crowd avatar + appian mark).
- **Hexes**: n/a — position, not color, is the dimension.
- **Marker**: neutral

## sidebar-complex.png

### Principle: Give many-page sites a sidebar
- **DO shows**: Maryland Safe Food Inspection on a deep-indigo #182274 (est.) sidebar: 7 top-level items — 5 pages + 2 page groups (Facilities collapsed "›", Reporting expanded with indented City/State/County). Every item carries an icon; selected Home is a white pill with dark text. Content still fits a navy billboard (state map, 3 donut gauges 78/23/17%) plus 3 chart cards. OBSERVED.
- **DON'T shows**: none under this heading — the inverse pair is header-bar-simple.png + sidebar-simple.png (cross-ref above).
- **Rule**: many top-level items plus groups → sidebar; the vertical stack scans fast and absorbs inline group expansion a header row can't.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: Layout = "Sidebar" (site/portal object); icons always display; group expansion is inline and collapse state is remembered per site.

## sidebar-highlight-do.png + sidebar-highlight-dont.png

### Principle: Make the selected sidebar item unmistakable
- **DO shows**: Maryland Safe Food Inspection sidebar, deep indigo #131c53 (est.): selected Home is a solid white pill with navy text + icon — a full inversion; unselected items stay white-on-indigo. OBSERVED.
- **DON'T shows**: identical sidebar where the Home pill is a marginally lighter navy #1d2a66 (est.) behind white text — at a glance nothing reads as selected. OBSERVED.
- **Rule**: sidebar selection renders as a background highlight, so the highlight hex must jump far from the sidebar hex (invert it or move several brightness steps).
- **Severity**: always
- **Category**: color | a11y
- **SAIL implication**: "Selected highlight color" vs sidebar color in the site/portal object — always evaluate the two hexes as a pair.

## sidebar-page-background-dont.png

### Principle: Don't paint the page background the sidebar's color
- **DON'T shows**: the food-inspection dashboard with its page background set to the sidebar's own dark navy #131c53 (est.): sidebar and canvas fuse into one field — no edge marks where navigation ends and content begins; the expanded Facilities children (Locations / Contact Directory / By Type) read as page content, and white chart cards float unanchored. OBSERVED.
- **DO shows**: none under this heading — the corrective is visible in sidebar-complex.png, same navy sidebar against a light gray canvas (cross-ref).
- **Rule**: sidebar hex ≠ page background hex; that contrast is what gives the layout its structure.
- **Severity**: usually
- **Category**: color | layout
- **SAIL implication**: pick a light neutral page/interface background against dark sidebar colors (sidebar hex lives in the site/portal object; page bg in the interface).

## siteColors_do_ex2.png + siteColors_dont_ex2.png

### Principle: Ship logos as transparent files that contrast the bar
- **DO shows**: Helium bar in near-black navy #23233c (est.), white icon+label tabs (selected USE CASES = lighter #5a5a66 (est.) block + white underline); the white appian wordmark sits directly on the bar — transparent background, strong contrast. OBSERVED.
- **DON'T shows**: the same bar in pale beige #e8e8e0 (est.) with black tabs; the logo file keeps an opaque white rectangle, so it renders as a mismatched white box stamped on the tinted bar. OBSERVED.
- **Rule**: logo files need transparent backgrounds and a colorway chosen for the configured bar color.
- **Severity**: always
- **Category**: color
- **SAIL implication**: Logo upload in the site/portal object — keep light/dark logo variants and re-verify after any header-color change.

## site_responsive_menu.gif

### Interaction: Header bar collapses into a menu when pages don't fit (gif: site_responsive_menu.gif)
- **State chart**: OBSERVED f0: INSURECORP claim detail on a white Mercury bar — 7 dark page names (MY CLAIMS underlined blue), blue breadcrumb band with CANCEL CLAIM / SEND MESSAGE, a 6-step claim milestone strip (3 green checks, 3 pending), driver/loss/vehicle cards → window narrows → f26: bar swaps to hamburger + centered logo, with the page list open as a vertical menu (Home … Contact) OBSERVED → f39/f51: content reflows in step — milestone strip compresses, cards stack OBSERVED → re-widening restores the horizontal bar INFERRED.
- **SAIL mechanism**: other — automatic site-level responsive collapse; interface stacking follows its own width rules.
- **UX purpose**: orientation — navigation stays reachable at any width.
- **Replicate when**: free — automatic for both layouts and Appian Mobile. | **Cost**: none; just keep page names short so collapse isn't premature.

## site_rounded_buttons.png

### Identification
- **Image**: site_rounded_buttons.png | **Source page**: ux-site-branding | **Alt/caption**: "This dashboard shows rounded buttons displayed in a site."
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-operational

### Use-case reconstruction (INFERRED)
- **Persona**: daily-operator — HR/workplace-safety coordinator tracking employee return-to-work health screening
- **Domain & brand context**: corporate employee-health program (appian-internal demo branding); restrained slate-blue chrome
- **Top 3 user tasks (ranked)**: 1. monitor questionnaire completion and readiness for the scoped population 2. re-scope by region/country/facility 3. watch risk categories (positive, exposure, symptoms, caregiving)
- **Implied requirements**: scoping must be one click, not dropdown digging; every rate must expose numerator/denominator; risk categories need % and raw counts; two-week trend visibility
- **Data model sketch**: Employee {region, country, facility, questionnaireStatus, readiness, riskFlags}; aggregates 559/932 completed (60%), 498/559 ready (89%), 61/559 not ready (11%); flags 2·6·22·31 of 61

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-BAR Helium slate #5b7f96 est. — 3 icon tabs (EMPLOYEES/FACILITIES/INCIDENTS)
├─ SUBNAV bar darker #3f5c70 est. ×3 — EMPLOYEE HEALTH selected
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] filter groups ×3 — REGIONS / COUNTRIES / FACILITIES as rounded pills
   └─ PANE[center]
      ├─ KPI-ROW ×3 donut gauges + stat list (4 label+progress-bar+count rows)
      └─ CHART(line, 2 series, 10–23 May)
```
- **Above the fold**: gauges, stat list, filters; line chart partially
- **Reading order**: F — subnav, gauges left→right, risk list, trend
- **Hierarchy rationale**: three donuts dominate the center (task 1); pill filters own the left rail (task 2); risk list sits right at equal height (task 3)
- **Density**: 3 — 3 gauges + 4 stat bars + 12 filter pills + 1 chart, comfortable padding
- **Ratios & spacing**: filter rail ≈25% [NARROW:AUTO] split by a hairline divider; gauges equal thirds of the center

### Styling specifics (OBSERVED)
- **Palette**: bars #5b7f96 / #3f5c70 (est.); page bg #ffffff; selected pills + stat bars blue #1f6cad (est.); gauge arcs blue #4a90d9, green #6abf4b, red #d9342b (all est.); gauge track #d8d8d8 (est.)
- **Color application points**: selected filter pills; donut arcs; stat progress fills; line-series strokes — chrome stays slate, semantics own the saturated hues
- **Typography moves**: gauge fractions (559/932) EXTRA_LARGE inside the rings; percentages MEDIUM_PLUS bold beneath; gauge + filter-group labels uppercase SMALL; stat counts MEDIUM bold blue
- **Imagery stance**: styled icons only (white tab icons)
- **Card treatment**: none — flat white zones separated by hairlines, no card borders
- **Signature moves**: instead of dropdown filters, rounded pill button-toggles grouped under uppercase labels (the site-level Button shape = Rounded made visible); instead of a bare %, fraction-inside-donut + % caption double-encodes each rate; red is spent exactly once (NOT READY)

### Component inventory (OBSERVED)
- Site object: Button shape = "Rounded" — every filter button renders as a pill (record actions and dialogs inherit the same shape site-wide)
- a!buttonArrayLayout filter groups; 3 fraction-style gauge donuts; 4 progress-bar stat rows; a!lineChartField (2 series); Helium bar + subnav row INFERRED as site pages + secondary in-page tabs
- Chart types: donut gauges ×3, line ×1; no custom colorScheme beyond semantic hues | Affordances: 12 filter toggles, subnav tabs

### Character & judgment
- **Register**: calm-clinical + utilitarian-ops — health data on flat white, zero decoration
- **Why it works**: one-click pills beat dropdowns for daily re-scoping; numerator/denominator visible in every ring so small samples can't hide; the single red arc makes the one bad state findable instantly
- **Why not boring**: pill-shaped toggle filters with filled selected state; fraction-in-ring gauges; two-tier bar separating app tabs (icons) from module tabs; counts and % paired on every risk row
- **Boring twin**: three dropdowns over a table, KPI tiles with bare percentages, default squared buttons, one blue for everything
- **What to steal**: set Button shape = Rounded when filters are button-toggles; show fractions inside gauges; budget red for exactly one state
- **Risks**: white text on mid-slate #5b7f96 is borderline contrast (cross-ref navBar principle); green/red gauge pair needs its text labels (present); pill rails grow tall as facility lists grow

### Code cross-check
none — no SAIL source on this page.

## site_sidebar_stacking_behavior.gif

### Interaction: Same screen width, sidebar steals width, columns stack sooner (gif: site_sidebar_stacking_behavior.gif)
- **State chart**: OBSERVED f0: food-inspection home in Header Bar layout — navy bar, billboard, three chart cards side-by-side (donut | line | bars) → layout switched to Sidebar at identical window width → f8: sidebar occupies the left rail and the same cards now stack vertically (donut card full-width, line chart pushed below) OBSERVED → f16: back to header bar, three-across returns OBSERVED (f24/f31 near-blank delta frames).
- **SAIL mechanism**: other — columns stackWhen evaluates page width, which the sidebar shrinks; identical stackWhen value, earlier trigger.
- **UX purpose**: orientation — designer caution to retest content at sidebar width.
- **Replicate when**: n/a; after any layout switch, re-verify stacking plus the user-collapsible sidebar state. | **Cost**: none.

## site_sidebar_vs_headerbar.png

Tier override: batch suggests A, but this is a config-to-render composite — two site-object "Navigation Bar" panels beside two cropped page renders — not a full-page UI → treated as tier B, matching the navigation-bar-styles.png override.

### Component: Navigation bar Layout (page: ux-site-branding)
Official variant vocabulary: **Header Bar / Sidebar** (Layout config, shown with its picker thumbnails and the Maryland Safe Food Inspection renders, navy #0d1440 (est.)).

### Header Bar
- **Produces it**: Layout = "Header Bar"; exposes the Style radio (Helium / ● Mercury / Oxygen).
- **Looks like**: horizontal page row on the bar (HOME underlined white), content gets full width; icons appear only in Helium style.
- **Use when**: few top-level pages; width-hungry content. | **Avoid when**: many pages/groups — the row crowds and collapses early.
- **Styling hooks**: bar hex, highlight hex, style, uppercase-page-names toggle.
- **Pairs well with**: billboard heroes; wide dashboards.
- **Marker**: neutral

### Sidebar
- **Produces it**: Layout = "Sidebar"; no Style options; adds "Show site display name in navigation bar" toggle.
- **Looks like**: vertical icon+label list, selected Home as a white pill; user-collapsible; content starts right of the rail.
- **Use when**: many pages/page groups; vertical scanning. | **Avoid when**: ~3 pages (dead rail space) or interfaces that stack early (cross-ref stacking gif).
- **Styling hooks**: bar hex, highlight hex; icons always display; collapse state remembered per site.
- **Pairs well with**: page groups (inline expansion).
- **Marker**: neutral

### Page rollup
Default choice for most cases is Header Bar because typical sites stay within ~8 top-level items and dashboards want the width; move to Sidebar once the page list outgrows one scannable row.

## sites_vs_portals_navigation_bar.png

### sites_vs_portals_navigation_bar (tier B)
- **Produces it**: the same navigation-bar branding rendered by a site vs a portal object (numbered legend figure for the page's element table).
- **Looks like**: two charcoal #33383d (est.) bars, DOT logo + "US Dept of Transportation" display name left, amber #f5a623 (est.) underline on Home. Site bar shows ⑴ logo ⑵ display name ⑶ page titles ⑷ waffle nav menu ⑸ user menu ⑹ appian mark; the portal bar stops after ⑶ — no nav menu, user menu, or Appian logo.
- **Use when**: reference for what chrome an anonymous portal audience will actually see. | **Avoid when**: n/a — informational.
- **Styling hooks**: same branding levers in both objects; elements 4–6 are site-only, and 6 is non-configurable.
- **Pairs well with**: portal-header-comparison1.png (the leaner portal bar in context).
- **Hexes**: n/a — element presence, not color, is the dimension.
- **Marker**: neutral

## tabColor.png

### Principle: For Helium and sidebars, monochrome works — highlight with a lighter shade of the bar
- **DO shows**: Sailaway Cruises Helium bar, slate blue #4d7194 (est.): selected SHIPS is a full-tab block in a lighter step of the same hue #6390b8 (est.) plus the white underline; white icon+label tabs; SAILAWAY CRUISES lockup right. The same-hue family stays calm while block + underline still separate the active tab cleanly. OBSERVED.
- **DON'T shows**: none under this heading — the failure mode is the same-brightness highlight in sidebar-highlight-dont.png; Mercury/Oxygen instead want contrast (mercuryHighlightColor.png). Cross-refs.
- **Rule**: block-highlight styles (Helium, sidebar) may go monochromatic if the highlight is a clearly lighter or darker shade of the bar hex.
- **Severity**: contextual
- **Category**: color
- **SAIL implication**: set the selected-highlight hex to a brightness-shifted bar hex; Helium's built-in underline adds the second cue for free.
