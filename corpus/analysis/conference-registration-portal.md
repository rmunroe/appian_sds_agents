# Analysis: conference-registration-portal

## ESG_conference_registration_portal.png

### Identification
- **Image**: ESG_conference_registration_portal.png | **Source page**: conference-registration-portal (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) conference registration portal"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (public landing-page hybrid — the page exists to host one registration form)

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public — global attendee (sustainability professional/advocate), one-time visit, no login.
- **Domain & brand context**: "ESG World 2023," free virtual conference on Environmental/Social/Governance topics. Brand feel: earthy-premium — cream paper tones, gold tree logo, deliberately not corporate blue.
- **Top 3 user tasks (ranked)**: 1. Register (6 fields, submit). 2. Switch among 8 languages. 3. Declare interest topics for personalization.
- **Implied requirements**: "Must complete registration on one screen, no login/payment" · "Must support 8 locales incl. RTL Arabic and CJK, switchable without scrolling" · "Must capture interests without making them feel required" · "Must reflow phone→desktop from one interface (stackWhen throughout, CODE-VERIFIED)" · "Brand must signal sustainability, not enterprise software."
- **Data model sketch**: Registration(firstName, lastName, email, country[~230 ISO values], organizationName, jobTitle) 1—* InterestSelection → 10 fixed E/S/G topic Interests (climate/carbon … labor standards); locale ∈ 8 languages. OBSERVED from labels.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#f8f6f0
├─ HEADER: CARD(empty, style=#f8f6f0, desktop-only)  ← invisible top band
└─ COLUMNS [AUTO:NARROW_PLUS:EXTRA_NARROW:WIDE:AUTO] (1st/3rd/5th empty)
   ├─ PANE[left] brand rail: logo (FIT) → intro rich text → SBS ×8 language links, stacked vertically
   └─ PANE[right] FORM
      ├─ SECTION "REGISTER NOW" LARGE/H1, divider BELOW
      ├─ SECTION "YOUR DETAILS" SMALL/H2 → COLUMNS [1:1] ×3 = 6 fields
      ├─ CARD(SECTION "YOUR INTERESTS" SMALL/H3 + GRID(2-col ×5 checkboxes), style=#f2ede1, no border)
      └─ BUTTONS align=END ("Register" SOLID + arrow-right)
```
- **Above the fold**: everything — brand, language switch, all fields, interests, submit in one viewport; bottom ~40% of left rail is empty cream.
- **Reading order**: Z — logo → "REGISTER NOW" → down the form → gold button bottom-right.
- **Hierarchy rationale**: "REGISTER NOW" is the only LARGE text and sole H1 — task 1 is the page. Form column WIDE vs brand NARROW_PLUS — action outweighs identity. Interests sit in a tinted card: optional cluster vs plain-background required fields.
- **Density**: 2 — one task, two zones, ~16 inputs per viewport, wide empty gutters, empty lower-left quadrant.
- **Ratios & spacing**: NARROW_PLUS : EXTRA_NARROW(spacer) : WIDE in empty AUTO gutters (CODE-VERIFIED); field rows marginAbove/Below "STANDARD"; intro marginBelow "EVEN_MORE"; H1 section marginBelow "MORE"; card padding "STANDARD".

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page bg #f8f6f0; card bg #f2ede1; links #111111, headings/labels #222222 (est.); accent gold #deaf3e (est., theme-level); logo gold #d7b23b (est.); inputs #ffffff with #dddddd (est.) borders; #1d659c in code but unrendered.
- **Color application points**: full-page cream tint; darker-cream grouping card; gold exactly twice — logo and submit button; all else monochrome ink. No colored icons, tags, or charts.
- **Typography moves**: "REGISTER NOW" ≈ LARGE (H1); "YOUR DETAILS"/"YOUR INTERESTS" ≈ SMALL (H2/H3); body ≈ STANDARD. All-caps typed into the label strings; current language gets STRONG+UNDERLINE vs plain siblings — typography-as-state.
- **Imagery stance**: one logo image (placeholder a!EXAMPLE_DOCUMENT_IMAGE → gold tree + black wordmark); no photos; single arrow-right button icon.
- **Card treatment**: filled, borderless (showBorder: false); no shadows anywhere.
- **Signature moves**: instead of default white, tint the whole page via backgroundColor "#f8f6f0"; instead of a bordered fieldset, group checkboxes with a darker filled cardLayout; instead of a nav dropdown, stack 8 plain-text dynamicLinks into an editorial rail (sideBySideLayout stackWhen on desktop); instead of size-matched headings, decouple labelHeadingTag (H1/H2/H3) from labelSize (LARGE/SMALL/SMALL).

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor: "#f8f6f0"); header = empty a!cardLayout(style: "#f8f6f0", padding: "STANDARD", desktop-only)
- a!columnsLayout(5 columns, stackWhen all non-desktop); a!imageField(size FIT/MEDIUM, align CENTER/START via a!isPageWidth)
- 8 language a!richTextItem links (linkStyle "STANDALONE", color "#111111") in a!sideBySideLayout(spacing "SPARSE", stackWhen desktop); "Select Language" a!dropdownField showWhen PHONE/TABLET_PORTRAIT
- a!sectionLayout ×3 (LARGE/H1 + divider "BELOW"; SMALL/H2; SMALL/H3); a!textField ×5 (labelPosition "ABOVE", refreshAfter "UNFOCUS"); Country a!dropdownField (searchDisplay "AUTO")
- 10 single-choice a!checkboxField (labelPosition "COLLAPSED") in 2-col rows; a!buttonArrayLayout(align "END") + a!buttonWidget("Register", icon "arrow-right", style "SOLID")
- Charts: none. Affordances: language links, searchable dropdowns, checkboxes, one submit.

### Character & judgment
- **Register**: premium-editorial + warm-community — paper-cream field, ink type, restrained gold; mission-driven event, not SaaS signup.
- **Why it works**: the two golds (#d7b23b logo, #deaf3e button, est.) bookend the Z-path — brand at entry, action at exit; the #f2ede1-on-#f8f6f0 tint shift groups 10 checkboxes with zero borders; whole task visible at once — friction matches "registration is free."
- **Why not boring**: cream page tint instead of white chrome; language switcher as a stacked editorial link rail (inverted stackWhen), not a dropdown; gold pill submit with dark text at END, not a blue bar; hierarchy by size inversion — H1 huge, H2/H3 small caps.
- **Boring twin**: white a!formLayout, Appian-blue title bar, one column of fields, interests as a bordered checkbox list labeled "Topics," language dropdown in a corner, default blue Submit bottom-left.
- **What to steal**: tint the page and group optional inputs with a one-step-darker filled card; split brand (NARROW_PLUS) from task (WIDE) with an EXTRA_NARROW spacer; decouple labelHeadingTag from labelSize for a11y-correct, visually free hierarchy.
- **Risks**: gold-on-cream button boundary is low-contrast (dark label is fine); empty lower-left quadrant on short screens; desktop rail + mobile dropdown = two language switchers to maintain; RTL "العربية" in an LTR stack needs bidi care.

### Code cross-check (guidance/sail/sources/conference-registration-portal.sail, 39 KB)
- **Code-verified palette**: #f8f6f0 (backgroundColor L1036; header card L13), #f2ede1 (card L1006), #111111 (links L110–209), #1d659c (decorativeBarColor L1011). Sampled pixels match within 1 unit (#f8f6f1/#f1ede2).
- **Notable techniques**: empty desktop-only header card tinted to match backgroundColor — a seamless spacer band (L3–17); empty AUTO gutters + empty EXTRA_NARROW spacer column control centering and pane gap (L21–22, L230, L1027); responsive component swap — link rail vs mobile dropdown via complementary showWhen (L217–226, L62–80), logo size/align via a!isPageWidth (L35–58); inverted stackWhen stacks the language SBS only on DESKTOP widths, creating the vertical rail (L221–226); heading-tag/size decoupling H1-LARGE (L235–236), H2-SMALL (L253–254), H3-SMALL (L843–844).
- **Corrections**: button gold is NOT in the SAIL — a!buttonWidget has only style: "SOLID" (L1016–1018); #deaf3e and the pill shape come from the site theme (accent + rounded shape), pixel-estimated. decorativeBarColor "#1d659c" (L1011) never renders — no decorativeBarPosition set; card-edge pixel scan shows direct #f8f6f1→#f1ede2 transition, no blue bar. Vestigial param.
