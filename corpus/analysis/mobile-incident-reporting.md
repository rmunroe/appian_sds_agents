# Analysis: mobile-incident-reporting

## mobile_incident_reporting.png

### Identification
- **Image**: mobile_incident_reporting.png | **Source page**: mobile-incident-reporting | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) mobile incident reporting"
- **Device frame**: phone — three phone frames composited on a #f3f3f3 (est.) canvas; alt says "desktop" but this is the mobile preview (source comment: "best viewed on mobile devices"). Tier A kept: the frames show the complete flow.
- **Marker**: neutral
- **UI type**: wizard-step ×3 (identify → record-view → form), one `choose()`-driven flow

### Use-case reconstruction (INFERRED)
- **Persona**: shopping-centre facilities staff or attending technician; occasional-customer cadence — used at the moment equipment fails, not daily.
- **Domain & brand context**: escalator/elevator OEM "Möller" field service; monochrome green brand — engineering sobriety with consumer-app simplicity.
- **Top 3 user tasks (ranked)**: 1. Identify the asset via the 7-letter plaque code (QR affordance implied). 2. File a service request (type, description, photos). 3. Review service history before requesting.
- **Implied requirements**: "Must work one-handed at the equipment's location"; "Must resolve an asset from a plaque code with zero login or navigation"; "Must let the user visually confirm the asset before dispatch"; "Must capture type + free text + photos on one screen"; "Must feel app-simple: no nav, menus, or visible auth".
- **Data model sketch**: Equipment(code "ABCDEFG", model "Model 7100-Max Escalator", unit "3/F – 4/F Southwest", site "Appian Way Shopping Centre", address "Leeds LS2 7AU, United Kingdom", inServiceSince 2019-03-24) 1—n ServiceRequest(serviceType ∈ {Inspection, Repair}, problemDescription, photos[]); 1—n history entries.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
S1 HEADER-CONTENT bg=#e4f1df (full-bleed brand screen)
├─ CARD(logo img SMALL start, style=#e4f1df, padding=MORE, no border)  ← header slot
├─ qrcode icon EXTRA_LARGE + code text, centered, #b6d7a8
├─ instruction rich text MEDIUM centered
├─ COLUMNS [AUTO:NARROW_PLUS:AUTO] └─ FORM(text field, label COLLAPSED)
└─ COLUMNS [AUTO:NARROW_PLUS:AUTO] └─ "Go" SOLID LARGE FILL icon=arrow-right
S2 HEADER-CONTENT
├─ CARD(logo SMALL start + product image MEDIUM center, style=#e4f1df)
├─ SBS(stamp TINY + text MEDIUM) ×3  [tag=model | map-marker=address ×4 lines | calendar=in-service]
└─ SECTION divider=ABOVE └─ stacked buttons ×2 LARGE FILL: OUTLINE + SOLID
S3 HEADER-CONTENT
├─ CARD(logo SMALL + "Request Service" LARGE STRONG + model STANDARD, style=#e4f1df)
├─ FORM: cardChoiceField(barTextJustified ×2, icons) → paragraphField h=MEDIUM → fileUploadField
└─ SECTION divider=ABOVE └─ SBS(Cancel OUTLINE start | Submit Request SOLID end)
```
- **Above the fold**: each screen fits one phone viewport; flow designed foldless (S1 shows the OS keyboard occupying the lower ~40%).
- **Reading order**: single-column on every screen.
- **Hierarchy rationale**: S1 makes field+Go the only actionable pair (task 1, kiosk-style); S2 leads with the product render so the user confirms the asset before committing; S3's header restates title + model so the form never loses asset context.
- **Density**: 1–2 — S1 is one field + one button per viewport (1); S2/S3 have a handful of zones with MORE padding (2).
- **Ratios & spacing**: empty side columns center a NARROW_PLUS middle (stackWhen: "NEVER"); header cards padding "MORE", marginBelow "NONE"; S1 blocks spaced "MORE"; metadata rows "LESS"/"EVEN_LESS"; action footers divider "ABOVE" + marginAbove "MORE".

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: brand surface #e4f1df (header cards + S1 backgroundColor); watermark green #b6d7a8 (QR icon + code text); stamp green #127d21; body bg default white; rendered action green ≈ #397a2f (est., theme — see corrections); composite canvas #f3f3f3 (est., not SAIL).
- **Color application points**: header cards; entire S1 background; stamp circles; solid buttons and outline-button borders/text; selected card border + corner checkmark; logo box. No semantic reds/yellows anywhere — single-hue UI.
- **Typography moves**: S3 header title LARGE STRONG over model name STANDARD; instructions and metadata MEDIUM; code text STANDARD; address block leads with a STRONG first line ("3/F – 4/F Southwest"); buttons render all-caps (widget default). No display-size numerals — a doing UI, not a reading UI.
- **Imagery stance**: logo image + one centered MEDIUM product render (escalator) in S2; styled icons carry the rest (qrcode, tag, map-marker, calendar, stethoscope, wrench, arrow-right).
- **Card treatment**: header cards flat filled (#e4f1df, showBorder: false); body has no decorative cards — only cardChoiceField templates.
- **Signature moves**: instead of a site header bar, a flat borderless cardLayout styled #e4f1df in the header slot is the logo bar on all three screens; instead of a white S1 body, backgroundColor "#e4f1df" makes a full-bleed brand screen (S2/S3 revert to white "work" surfaces); instead of a wizard framework, choose(local!stepNumber) + button saveInto steps the flow in one expression; instead of label:value pairs, TINY stamps in sideBySideLayouts form icon-keyed metadata rows; instead of radio buttons, cardChoiceField bar templates give big illustrated tap targets.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout ×3 (S1: backgroundColor "#e4f1df"); header slot a!cardLayout(style "#e4f1df", padding "MORE", showBorder false, marginBelow "NONE")
- a!imageField(size "SMALL" logo / "MEDIUM" product); a!richTextIcon("qrcode", EXTRA_LARGE, #b6d7a8)
- a!columnsLayout(empty | NARROW_PLUS | empty, stackWhen "NEVER") centering trick ×2
- a!stampField(tag/map-marker/calendar, backgroundColor "#127d21", size "TINY") in a!sideBySideLayout(width "MINIMIZE")
- a!buttonWidget(size "LARGE"; width "FILL" S1–S2, "MINIMIZE" S3; SOLID/OUTLINE; icon "arrow-right")
- a!cardChoiceField(maxSelections 1, required, value 2 preselected, a!cardTemplateBarTextJustified, icons stethoscope/wrench)
- a!paragraphField(height "MEDIUM", instructions, required); a!fileUploadField
- a!sectionLayout(divider "ABOVE", marginAbove "MORE") footer-action pattern ×2
- Charts: none. Affordances: step navigation via saveInto, card selection, file upload.

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — one muted green family, generous padding, zero decoration beyond a single product render.
- **Why it works**: the #e4f1df tint brands every screen without costing text contrast; the S2 photo-confirm step prevents wrong-asset dispatches; LARGE FILL buttons and card choices are glove-friendly targets.
- **Why not boring**: three-strength monochrome ramp (#e4f1df surface → #b6d7a8 watermark → deep green actions) instead of default blue; the EXTRA_LARGE QR icon doubles as watermark and instruction; the full-bleed tinted S1 reads like a native splash, not a web form; bar cards with corner checkmark replace radios.
- **Boring twin**: a white page titled "Report Incident" with an equipment-ID dropdown, stacked labeled fields, default-blue Submit bottom-left, no imagery and no asset-confirmation step.
- **What to steal**: header-slot flat card as brand bar; choose()+stepNumber micro-wizard; one hue at three strengths (surface/watermark/action).
- **Risks**: #b6d7a8 on #e4f1df is ~1.6:1 contrast — acceptable only because the code text is decorative; selection state depends on border+checkmark alone (colorblind-safe but subtle); stackWhen "NEVER" centering can pinch the NARROW_PLUS field on very narrow phones.

### Code cross-check
- **Code-verified palette**: #e4f1df, #b6d7a8, #127d21 — the only three hexes in `guidance/sail/sources/mobile-incident-reporting.sail`.
- **Notable techniques**: choose() wizard driven by button value/saveInto (ll. 3–6, 97–98, 264–265); reusable tinted header card (ll. 9–29, 117–149, 280–319); empty-column centering (ll. 64–111); stamp metadata rows (ll. 152–247); a!cardTemplateBarTextJustified choice cards (ll. 322–349); footer sections with divider "ABOVE" (ll. 248–275, 366–406).
- **Corrections**: rendered buttons/logo/selected-border sample ≈ #397a2f (est.) yet no button color exists in code — the action green comes from the environment theme; rendered stamps also sample ≈ #397a2f, not the coded #127d21 (theme/render drift). Code wins: cite #127d21.
