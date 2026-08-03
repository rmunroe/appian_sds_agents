# Analysis: ux-page-width

## overview_page_width.png

### Identification
- **Image**: overview_page_width.png | **Source page**: ux-page-width | **Alt/caption**: ds-images/overview_page_width.png; page caption "Page widths compared: (L-R) 'Wide', 'Medium', and 'Narrow'"
- **Device frame**: desktop — a composite strip of three browser captures of the SAME interface at Wide, Medium, and Narrow. Analyzed once; the width comparison itself is the subject. (Tier A kept per batch despite composite format.)
- **Marker**: neutral
- **UI type**: form (wizard step), shown at three configured page widths

### Use-case reconstruction (INFERRED)
- **Persona**: telecom store rep / back-office CSR creating a customer account, daily-operator.
- **Domain & brand context**: consumer telecom retailer (nav: DEVICES, PLANS, ACCESSORIES, CUSTOMERS); black chrome with yellow brand accent, orange action color.
- **Top 3 user tasks (ranked)**: 1. Complete the Addresses step (billing + shipping) of the account wizard. 2. Resolve the flagged validation problems. 3. Continue to Payment / go back.
- **Implied requirements**: 4-step wizard (Basics → Addresses → Payment → Credit); billing and shipping captured side by side with a "Set as shipping address" shortcut; validation surfaced as a page-level banner; the form must stay usable at whichever page width the site sets — the width is a site-page setting, not part of the interface.
- **Data model sketch**: CustomerAccount; Address ×2 (billing, shipping): Street Address or PO Box, Apartment or Unit #, City, State (dropdown "Select a state"), ZIP.

### Layout anatomy (OBSERVED)
- **Skeleton** (identical in all three instances):
```
NAV-BAR(black, 4 items, active=CUSTOMERS yellow, avatar)
├─ TITLE "New Customer Account" + SMALL subtitle
├─ WIZARD-STEP 2/4 (Basics|Addresses|Payment|Credit; bar with current step accented)
├─ COLUMNS [1:1] FORM
│  ├─ SECTION "Billing Address" (orange heading, 5 fields, "Set as shipping address ⊕" link)
│  └─ SECTION "Shipping Address" (5 matching fields)
├─ VALIDATION band (pink, "Please correct the highlighted problems and try again")
└─ FOOTER: GO BACK left · CANCEL link + CONTINUE (solid orange) right
```
- **Above the fold**: the full form, in all three widths.
- **Reading order**: F — title, milestone, left column, right column, banner, actions.
- **Hierarchy rationale**: the comparison teaches that identical structure re-flows: Wide stretches inputs to ≈2× their Narrow measure while type sizes, gutters, and order never change; Narrow keeps short-content fields (city, ZIP) near their natural width, which is why the page text recommends Narrow/Medium for simple forms.
- **Density**: 3 — ~12 inputs, wizard bar, nav, and actions per viewport; standard working-form density.
- **Ratios & spacing**: two equal columns [1:1] at every width; constant gutters; only field width absorbs the extra pixels (Wide inputs ≈640px vs Narrow ≈300px, est. from scaled strip).

### Styling specifics (OBSERVED)
- **Palette (est.)**: nav black #1c1c1c; brand yellow #f0c000 (active tab block + avatar ring); page white #ffffff; section headings + CONTINUE orange #f08a00; milestone current-step orange; field borders #cfcfcf; validation band pink #f9dfe2 with red text #c23b3b; GO BACK white with gray border.
- **Color application points**: yellow strictly in the nav (active tab); orange triples as wayfinding (headings), progress (current step), and primary action (CONTINUE); red reserved for the validation band; everything else achromatic.
- **Typography moves**: page title ≈ LARGE; section headings ≈ MEDIUM orange; field labels SMALL bold; helper/subtitle SMALL gray; button labels SMALL all-caps.
- **Imagery stance**: none.
- **Card treatment**: none — open form on white; validation as a full-width tinted band.
- **Signature moves**: same UI captured at three widths to show width is configuration, not design; mirrored [1:1] address columns keep billing/shipping parity; black nav + yellow tab gives a strong brand frame to an otherwise deliberately plain form.

### Component inventory (OBSERVED → INFERRED)
- INFERRED: a!milestoneField(steps ×4, BAR style); a!columnsLayout [1:1]; a!textField ×8; a!dropdownField ×2 (State); a!linkField ("Set as shipping address" with ⊕ icon); validation banner (a!messageBanner-style display); a!buttonLayout(primaryButtons: CONTINUE solid orange; secondaryButtons: GO BACK; CANCEL as link).
- Chart types: none.
- Interactive affordances: wizard navigation, copy-address shortcut link, form fields, footer actions.

### Character & judgment
- **Register**: utilitarian-ops — dense-enough working form, zero decoration, strong chrome.
- **Why it works**: relative columns survive every width unchanged; the action color doubles as the wayfinding color so the eye lands on heading → current step → CONTINUE; validation interrupts at full width where it can't be missed.
- **Why not boring**: black/yellow brand chrome instead of default gray; orange section headings; three-up comparison makes the width lesson self-evident without prose.
- **Boring twin**: gray header, blue default buttons, one long single-column form that balloons to 900px inputs at Wide — exactly the stretched look the page warns about.
- **What to steal**: preview forms at every width the site might use; keep paired sections in mirrored columns; pick Narrow/Medium for one- and two-column forms to avoid dead field width.
- **Risks**: at Wide, ≈640px inputs hurt scanability and invite the excessive white space the doc cautions against; orange headings on white are ≈3:1 contrast (est.); yellow-on-black passes, but orange CONTINUE with white text is borderline (est.).

### Code cross-check
- none — no SAIL source on this page.

## page_width_wide_do.png + page_width_full_dont.png

### Principle: Choose "Wide" so the layout stays consistent across displays
- **DO shows**: OBSERVED — UCV "Course Sign-up" (red-branded; course list + FREN 101 detail card with Louvre photo + Selected Courses/credits rail) on a big desktop monitor AND a laptop; Wide caps content at 2,000dip, so both devices show the same composition with even margins.
- **DON'T shows**: OBSERVED — the same page set to "Full" on a very wide display: the three zones drift apart, the detail card floats orphaned mid-canvas, and well over half the screen becomes empty white/gray.
- **Rule**: pages viewed across a range of display widths get "Wide"; "Full" lets a typical-width design stretch into dead space and inconsistent layouts.
- **Severity**: contextual
- **Category**: layout
- **SAIL implication**: site-page width setting (no interface code); relative-width columns are what stretch, so the wider the canvas, the more they exaggerate.

## page_width_full_do.png

### Principle: Reserve "Full" for reliably wide, column-hungry screens
(Solo DO — its DON'T sibling is paired with the Wide example above.)
- **DO shows**: OBSERVED — a service-request operations grid on a large monitor: 13 columns (Request #, Customer, Created By, Progress bar, Status, Priority, Type, Created On, Duration, 4 metric columns), ~22 rows, search + three filter dropdowns, dark nav with orange active tab. Full width lets every column render unclipped and the grid earns the whole canvas.
- **DON'T shows**: none on this principle.
- **Rule**: use "Full" only when users reliably work on high-horizontal-resolution displays and the content is data-dense enough to spend the width.
- **Severity**: contextual
- **Category**: layout + data-display
- **SAIL implication**: width=Full site setting paired with a many-column a!gridField; filters row spans the same width so scanning stays aligned.
