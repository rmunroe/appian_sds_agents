# Analysis: forms

Page: `corpus/pages/forms.md` (section: patterns; SAIL Design System "Forms" page). All 16 batch images analyzed at tier A per full-page rule; two were tier-B suggestions overridden (noted inline). Inline SAIL exists for every pattern except `forms-dialog-company-event.png`, so palettes are CODE-VERIFIED where possible; line refs are into `corpus/pages/forms.md`.

## forms-dialog-company-event.png

### Identification
- **Image**: forms-dialog-company-event.png | **Source page**: forms ("Single-step form") | **Alt/caption**: "Example of a form dialog with fields that collect information required to create a company event"
- **Device frame**: desktop (record-action dialog, portrait 1436x1740)
- **Marker**: neutral
- **UI type**: form (single-step, in dialog). No SAIL on page for this image — all colors pixel-estimated.

### Use-case reconstruction (INFERRED)
- **Persona**: internal employee/office admin, occasional-customer cadence — creates an event a few times a month.
- **Domain & brand context**: corporate intranet / employee-engagement app; bright indigo brand reads as the Appian demo default.
- **Top 3 user tasks (ranked)**: 1. Enter title + description fast. 2. Schedule (start/end date-time). 3. Classify (department, category, location) and attach a flyer.
- **Implied requirements**: "Must be completable without leaving the current page (dialog)"; "Must keep Create/Cancel visible while scrolling"; "Must default news-feed publishing to on"; "Must capture start AND end as date+time".
- **Data model sketch**: Event{title, description(≤4000), postToNewsFeed:bool, department(1:n lookup), category(1:n lookup), flyer:doc 0..1, start:datetime, end:datetime, officeLocation(1:n lookup)}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
DIALOG
├─ HEADER slab (indigo) = stamp(calendar)+title+secondary, close ✕ top-right
├─ FORM single column on white card (gray dialog gutter behind)
│  ├─ Title* / Description*(char counter 0/4000)
│  ├─ ☑ Post event details in news feed
│  ├─ Department ▾ / Category ▾ / Flyer upload
│  ├─ SBS Start*[date|time] End*[date|time]
│  └─ Office Location ▾
└─ FIXED FOOTER: CANCEL (outline) ←→ CREATE (solid)
```
- **Above the fold**: header through Start/End row; scrollbar shows more below; footer pinned (matches page text: record-action dialogs auto-fix buttons).
- **Reading order**: single-column.
- **Hierarchy rationale**: title/description first = the only free-text effort; scheduling mid-form once identity is set; footer isolates the single primary verb.
- **Density**: 3 — 9 fields in one column, generous label spacing, no side chrome.
- **Ratios & spacing**: one column ≈85% of dialog width; label-above everywhere; even vertical rhythm ≈ marginBelow "STANDARD".

### Styling specifics (OBSERVED, est.)
- **Palette**: header + selection + buttons indigo #2322f0 (est.); dialog gutter #f0f0f2 (est.); form card #ffffff; labels #222222 (est.); placeholder italic #767676 (est.); field borders #cbcbcb (est.).
- **Color application points**: header slab; required asterisks; checked checkbox fill; CREATE fill; CANCEL border/text; close icon white. Nothing else is colored — one hue total.
- **Typography moves**: dialog title ≈LARGE white bold with icon stamp; secondary ≈STANDARD white; field labels STANDARD bold; buttons uppercase.
- **Imagery stance**: none (single calendar glyph in header).
- **Card treatment**: flat white content card with hairline border on gray gutter; fields flat outline style.
- **Signature moves**: (1) Instead of a plain title row, a!headerTemplateSimple-style indigo slab with icon stamp gives the dialog identity. (2) Checkbox pre-checked = opt-out (not opt-in) news-feed publishing. (3) Date+time as paired inputs per boundary instead of one datetime widget.

### Component inventory (OBSERVED → INFERRED)
- a!formLayout(titleBar: a!headerTemplateSimple(stampIcon: calendar), contents..., buttons: a!buttonLayout(primary CREATE SOLID, secondary CANCEL OUTLINE)) opened via record action "openInDialog"; a!textField, a!paragraphField(characterLimit:4000, showCharacterCount), a!checkboxField, 3× a!dropdownField, a!fileUploadField, 2× a!dateField + a!timeField in a!sideBySideLayout.
- Chart types: none. Interactive affordances: dialog close ✕, upload drop-zone.

### Character & judgment
- **Register**: institutional + calm-clinical — one brand hue, zero decoration beyond the header slab.
- **Why it works**: the indigo slab carries all brand energy so the field area stays quiet; fixed footer keeps Create reachable on a long form; required marks cluster early so effort is predictable.
- **Why not boring**: icon stamp + secondary line in the header (most dialogs get bare titles); checked-by-default feed toggle placed right under Description where its meaning is obvious; paired date|time inputs aligned as one visual row.
- **Boring twin**: a titleless white modal, fields dumped edge to edge, OK/Cancel bottom-right, no counter, no header color — indistinguishable from every CRUD popup.
- **What to steal**: headerTemplateSimple with stampIcon for dialog identity; character counter on the only long-text field; fixed button footer via record-action dialog.
- **Risks**: saturated #2322f0 on white passes AA only for large/bold text (≈4.6:1 — fine for the slab, thin for asterisks); dialog height forces scroll — End-user may miss Office Location; time inputs lack visible format hint.

### Code cross-check
- none — no SAIL for this pattern on the page.

## image35.png

### Identification
- **Image**: image35.png | **Source page**: forms ("Multi-step form: Single page") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (multi-section single page). NOTE: the page references image35.png twice — under "Multi-step form: Single page" (line 50) and again under "Multi-step form: Tab layout" (line 385). The pixels match the FIRST section's SAIL ("Create New Campaign", lines 52–369); the tab-layout code (lines 387–611, "Tax & Compliance Multi-Jurisdiction Form" with a!tabLayout) does not match this image — corpus scraping artifact; analyzed under Single page only.

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit marketing coordinator (Boreas Foundation), weekly-manager cadence — sets up campaigns routinely but not daily.
- **Domain & brand context**: nonprofit/foundation ops suite; charcoal nav + gold underline + steel-blue accent = restrained institutional brand.
- **Top 3 user tasks (ranked)**: 1. Name/describe the campaign. 2. Pick campaign type + visibility. 3. Set schedule with standard durations.
- **Implied requirements**: "Must show all three steps at once without a wizard"; "Must explain the consequence of Category and Internal flags at point of decision"; "Must nudge toward standard 30/60-day durations for comparability".
- **Data model sketch**: Campaign{title, summary(rich), category:enum(Fundraiser|Awareness|Lobbying), visibility:enum(Public|Internal), start:date, scheduleType:enum(Custom|30|60), end:date}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (charcoal, CASES active w/ gold underline)
FORM contentsWidth=WIDE
├─ title "Create New Campaign"
├─ SECTION "" (Description)  COLUMNS [AUTO:input] spacing=SPARSE
│  ├─ left: ⓘ icon + "Description" MEDIUM_PLUS STRONG (+guidance)
│  └─ right: Title text, Summary rich-text editor
├─ SECTION divider=ABOVE (Type)   left label+2 guidance paras SECONDARY
│  └─ right: "Category" + 3 icon CARDs (Fundraiser/Awareness/Lobbying) + Visibility CARDS-radio
├─ SECTION divider=ABOVE (Schedule) left label+guidance
│  └─ right: Start date, "End", Custom/30/60 CARDS-radio, End date
└─ BUTTON ROW divider: CANCEL outline ←→ CREATE solid
```
- **Above the fold**: nav, title, all of Description + Type sections; Schedule partially (full at 1367x1182 it all fits).
- **Reading order**: F — left mini-headers anchor each band, inputs read rightward.
- **Hierarchy rationale**: section headers moved into a left column so the input column stays short (page text: "reduces vertical scrolling and horizontal whitespace"); guidance text sits beside the exact field it governs; single CREATE at the end.
- **Density**: 3 — three content bands visible at once, SPARSE column gap, comfortable field spacing.
- **Ratios & spacing**: label column width:"AUTO" ≈40%, input column ≈60%; columnsLayout spacing:"SPARSE" (CODE-VERIFIED); sections divided divider:"ABOVE"; contentsWidth:"WIDE"; showButtonDivider:true.

### Styling specifics (CODE-VERIFIED lines 52–369; renders est.)
- **Palette**: page/card #ffffff; nav ≈#2e3a45 (est.) with gold underline ≈#f0c24c (est.); accent token "ACCENT" renders steel blue ≈#1f6ba2 (est.) — category icons, radio selection, CREATE fill; guidance color:"SECONDARY" ≈#6c6c75 (est.); dividers ≈#ededf2 (est.).
- **Color application points**: only the accent — 3 category icons (LARGE_PLUS), selected radio-card border/dot, CREATE button, CANCEL border. Section headers stay near-black.
- **Typography moves**: page title ≈MEDIUM_PLUS/LARGE bold; section headers richTextItem size:"MEDIUM_PLUS" style STRONG with leading a!richTextIcon (info-circle, folder-open, calendar); guidance STANDARD SECONDARY; card captions STANDARD SECONDARY; buttons uppercase.
- **Imagery stance**: styled icons only — ACCENT LARGE_PLUS glyphs centered in selection cards.
- **Card treatment**: category tiles a!cardLayout(style:"NONE", padding:"LESS", link:dynamicLink) — bordered white tiles; radios choiceStyle:"CARDS" choiceLayout:"COMPACT".
- **Signature moves**: (1) Instead of stacked sectionLayout labels, headers live in a parallel AUTO column with icon + STRONG rich text — a two-axis form. (2) Instead of a dropdown for category, three icon card-links act as a visual radio. (3) Instead of a bare End date, a CARDS radio (Custom/30/60) gates it — policy encoded as UI. (4) Consequence text ("dictates available templates…", "Mark campaigns as Internal…") is color SECONDARY beside the control, not in tooltips.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(titleBar: headerTemplateSimple, contentsWidth:"WIDE", showButtonDivider:true, isButtonFooterFixed:false); a!sectionLayout(label:"", divider:"ABOVE"); a!columnsLayout(spacing:"SPARSE") with width:"AUTO" label columns; a!richTextDisplayField headers; a!textField; a!styledTextEditorField(height:"MEDIUM", sizeLimit:4000); 3× a!cardLayout(link, style:"NONE", padding:"LESS") + richTextIcon(color:"ACCENT", size:"LARGE_PLUS"); a!radioButtonField(choiceLayout:"COMPACT", choiceStyle:"CARDS") ×2; a!dateField ×2; buttons Create SOLID / Cancel OUTLINE.
- Chart types: none. Interactive affordances: card-links as category picker; conditional End field implied by Custom selection.

### Character & judgment
- **Register**: utilitarian-ops + institutional — quiet chrome, guidance-heavy, single accent.
- **Why it works**: the left-label grid halves scan length per band (page's stated goal); consequences are read exactly when choosing (Type guidance sits beside Category cards); standard-duration nudge makes the org's reporting need the default path.
- **Why not boring**: icon card-picker instead of a third dropdown; icons in section headers give each band a glanceable identity; gold-underline nav + steel accent avoid default-blue sameness.
- **Boring twin**: one centered column, three a!sectionLayouts with plain labels "Description/Type/Schedule", dropdown for category, two naked date pickers, helper text hidden in instructions params.
- **What to steal**: AUTO-width label column with icon+STRONG rich text headers; CARDS radios for ≤3-option enums; consequence copy in SECONDARY beside the control.
- **Risks**: SECONDARY guidance ≈4.6:1 — near AA floor; card-picker selected state must be obvious (here only border) for color-blind users; two "End" labels (rich text + collapsed dateField) could confuse screen readers.

### Code cross-check (forms.md lines 52–369)
- **Code-verified palette/params**: everything structural above; colors in code are tokens only (ACCENT/SECONDARY) — hexes are pixel estimates.
- **Notable techniques**: richTextDisplayField-as-section-header (66–78); card-link tiles (162–192); choiceStyle CARDS radios (264–274, 330–340); divider:"ABOVE" sections (281, 353); contentsWidth WIDE + showButtonDivider (356–357).
- **Corrections**: none — render matches code; second page reference of this image under Tab layout is wrong (see Identification).

## image51.png

### Identification
- **Image**: image51.png | **Source page**: forms ("Using the wizard layout") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (a!wizardLayout, step 1/4)

### Use-case reconstruction (INFERRED)
- **Persona**: employee, first-time-public cadence — completes a return-to-work questionnaire once.
- **Domain & brand context**: corporate HR/compliance (COVID-era return-to-office); Appian-navy brand with flat illustration.
- **Top 3 user tasks (ranked)**: 1. Pick country + office. 2. Progress through health/exposure steps. 3. Submit certifications.
- **Implied requirements**: "Must show all 4 steps upfront"; "Must make location selection one-click from short lists"; "Must offer search when lists grow"; "Submit only on last step".
- **Data model sketch**: Questionnaire{country(6 options), office{name, city} (3 options), symptoms…, exposure…, certifications:docs}; card data via a!map(id, primaryText, secondaryText).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (appian, navy)
HEADER-TEMPLATE-IMAGE h≈220 bg=#020A51: title+secondary left, illustration right
WIZARD style=DOT_VERTICAL contentsWidth=MEDIUM
├─ rail: ○ Work Location (active ring) · ● gray ×3
└─ step: question MEDIUM → Select Country search → CARD-CHOICE 3×2
         → Select Office search → CARD-CHOICE ×3 (2-line)
FOOTER: CANCEL (link) ←→ NEXT (solid)
```
- **Above the fold**: everything (1207x811) — header, full rail, both card grids, footer.
- **Reading order**: F — rail left, question and grids rightward.
- **Hierarchy rationale**: dark billboard-style header carries instructions once; the single question ("Which office will you be returning to?") is the only MEDIUM text in the body; selected cards are the strongest ink on white.
- **Density**: 2 — one question, two option grids, generous margins (marginAbove:"MORE" between groups).
- **Ratios & spacing**: rail ≈22% width; contentsWidth:"MEDIUM" centers the work area; search fields width:"MEDIUM" columns; card grid 3-up.

### Styling specifics (CODE-VERIFIED lines 636–786; renders est.)
- **Palette**: header backgroundColor:"#020A51"; page #ffffff; selected card border/check-corner ≈#020A51–#1a2a6b (est., site accent navy); future dots ≈#c8c8cf (est.); NEXT fill navy (est. same accent); illustration purples/navy.
- **Color application points**: header slab; active-step ring; selected card border + corner checkmark; NEXT button. Everything else grayscale.
- **Typography moves**: header title ≈LARGE white bold, secondary STANDARD white; question richTextItem size:"MEDIUM" style PLAIN; card primaryText STANDARD, secondaryText SMALL gray; step labels STANDARD (active bold).
- **Imagery stance**: flat spot illustration (3 masked figures) inside headerTemplateImage(imageSize:"MEDIUM") — decoration only.
- **Card treatment**: cardChoiceField with cardTemplateBarTextStacked — thin gray borders, selected = thick navy border + filled corner triangle check (built-in selected state).
- **Signature moves**: (1) Instead of dropdowns, two a!cardChoiceField grids make 1-of-N selection one click and pre-scannable. (2) A type-ahead textField sits ABOVE each grid — search as progressive enhancement, not replacement. (3) showStepHeadings:false — the question itself is the heading, so the step name isn't repeated. (4) Submit button gated by showWhen:fv!isLastStep so NEXT/BACK come free from the wizard.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!wizardLayout(titleBar: a!headerTemplateImage(backgroundColor:"#020A51", imageSize:"MEDIUM"), style:"DOT_VERTICAL", contentsWidth:"MEDIUM", showStepHeadings:false); 4× a!wizardStep; a!cardChoiceField(cardTemplate: a!cardTemplateBarTextStacked, maxSelections:1) ×2; a!textField search stubs; primaryButtons Submit(SOLID, showWhen isLastStep, loadingIndicator), secondaryButtons Cancel(style:"LINK", validate:false).
- Chart types: none. Interactive affordances: card selection, search fields, wizard auto-scroll (page tip: nav must live in buttons params).

### Character & judgment
- **Register**: institutional + calm-clinical — navy authority, one question at a time, zero ornament in the body.
- **Why it works**: option counts are small enough to show all (6 countries, 3 offices) so recognition beats recall; the DOT_VERTICAL rail sets expectation of 4 steps; instructions live once in the header instead of repeating per step.
- **Why not boring**: illustrated navy billboard instead of a text title bar; card grids instead of two dropdowns; corner-check selected state reads instantly.
- **Boring twin**: "Step 1 of 4" text, two dropdowns labeled Country/Office, Next bottom-right, instructions as a gray paragraph above the fields.
- **What to steal**: cardChoiceField for short enums; search-above-grid pattern; showStepHeadings:false when the step content opens with its own question.
- **Risks**: selected-state relies on border weight + small check — low-vision users may miss it; header secondary text is long for phone; empty steps 2–4 in the pattern mean real budgets unknown.

### Code cross-check (forms.md lines 636–786)
- **Code-verified palette**: #020A51 header; all other colors are component defaults (no hexes) — navy accents in render are site theme, est.
- **Notable techniques**: wizardLayout style:"DOT_VERTICAL" (649); cardTemplateBarTextStacked with map data (694–708, 735–748); Submit showWhen fv!isLastStep (772); Cancel style:"LINK" (781).
- **Corrections**: "Select Country"/"Select Office" render as plain text fields — they are stub a!textFields, not functional pickers (placeholder-only, saveInto:{}).

## forms-donation.png

### Identification
- **Image**: forms-donation.png | **Source page**: forms ("Creating a custom wizard → Sidebar step indicator") | **Alt/caption**: "Example of a donation form allowing user to select the amount of money to donate and the frequency of donation"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (custom wizard, step 2/5)

### Use-case reconstruction (INFERRED)
- **Persona**: donor (member of the public), occasional-customer — sets up a recurring gift once.
- **Domain & brand context**: nonprofit (Boreas Foundation) donor portal; charcoal/gold chrome, steel-blue accent.
- **Top 3 user tasks (ranked)**: 1. Pick gift amount. 2. Pick frequency. 3. Move through the 5-step flow confidently.
- **Implied requirements**: "Must show all 5 steps and current position at all times"; "Must make amounts one-tap presets with an Other escape"; "Must keep Back/Cancel subordinate to Next".
- **Data model sketch**: RecurringGift{amount:enum($5…$1,000|Other), frequency:enum(Monthly|Quarterly|Annually)}; steps: Donor Information → Amount and Frequency → Payment Source → Tax Information → Confirmation.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (charcoal, HOME active gold underline)
PANE[left w=MEDIUM bg=#f0f0f0 pad=EVEN_MORE]
├─ "Set Up a Recurring Gift" MEDIUM_PLUS SEMI_BOLD
└─ MILESTONE VERTICAL DOT active=2 (5 steps)
PANE[right, white]
└─ COLUMNS [empty : MEDIUM_PLUS : empty]
   ├─ step title LARGE "Amount and Frequency"
   ├─ FORM Gift Amount CARDS-radio 3×3 (value $25)
   ├─ Frequency CARDS-radio ×3 (Monthly)
   └─ SECTION divider=ABOVE: [Back outline · Cancel link] ←→ [Next solid]
```
- **Above the fold**: everything — rail, title, both radio grids, buttons.
- **Reading order**: F — gray rail anchors, content column center-right.
- **Hierarchy rationale**: step title is the largest text (task orientation); amount grid before frequency mirrors decision order; Next isolated right as the only solid button.
- **Density**: 2 — two input groups on the whole viewport, EVEN_MORE margins around the heading.
- **Ratios & spacing**: pane width:"MEDIUM" ≈33%; content column width:"MEDIUM_PLUS" centered by empty flanking columns; heading marginAbove/Below:"EVEN_MORE"; button section divider:"ABOVE".

### Styling specifics (CODE-VERIFIED lines 802–957 functional / 963–1085 base)
- **Palette**: sidebar backgroundColor:"#f0f0f0"; page #ffffff; nav ≈#2e3a45 (est.) + gold ≈#f0c24c (est.); accent (milestone done dot, selected card border+dot, NEXT fill) ≈#1f6ba2 (est., token-level ACCENT); text near-black.
- **Color application points**: milestone completed dot + connector, active ring; selected radio-card border/dot; NEXT button; nav underline. Sidebar is neutral gray, not brand-colored.
- **Typography moves**: sidebar heading size:"MEDIUM_PLUS" fontWeight:"SEMI_BOLD" (H2); step title size:"LARGE" (H3) — content title outranks sidebar title; milestone labels STANDARD with active bold; buttons uppercase.
- **Imagery stance**: none.
- **Card treatment**: radios choiceStyle:"CARDS" choiceLayout:"COMPACT" — bordered white tiles, selected shows accent border + filled radio dot.
- **Signature moves**: (1) Instead of wizardLayout, a!paneLayout + a!milestoneField(orientation:"VERTICAL", stepStyle:"DOT") builds a custom sidebar wizard — full styling control. (2) Sidebar tinted #f0f0f0 so the white work area reads as "the task". (3) a!match on local!currentFormStep swaps step bodies in place; Back/Next just write the step index. (4) Nine amounts as a 3×3 CARDS grid with "Other" as the 9th cell — presets first, freedom last.
- (5) headingTag H2/H3 both set — semantic order kept even though visual order inverts (LARGE content title vs MEDIUM_PLUS sidebar).

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout > a!paneLayout(2 panes); a!pane(width:"MEDIUM", backgroundColor:"#f0f0f0", padding:"EVEN_MORE"); a!milestoneField(steps:local!formSteps, active:local!currentFormStep, stepStyle:"DOT", orientation:"VERTICAL"); a!match step switch; a!radioButtonField(choiceLayout:"COMPACT", choiceStyle:"CARDS") ×2; buttonArrayLayouts — Back OUTLINE (showWhen step>1), Cancel LINK, Next SOLID (showWhen step<length); headings with headingTag H2/H3.
- Chart types: none. Interactive affordances: milestone display-only; Back/Next mutate local!currentFormStep.

### Character & judgment
- **Register**: warm-community + calm-clinical — soft gray rail, generous whitespace, tap-friendly gift tiles.
- **Why it works**: the vertical DOT milestone "balances whitespace in simpler forms" (page's own rationale) — the rail fills the left third so the two-question step doesn't float; presets remove keyboard work at the exact moment of donor commitment; disciplined button grammar (solid/outline/link) ranks the three exits.
- **Why not boring**: tinted pane creates two-zone architecture without cards or borders; 3×3 money grid feels like a choice, not a form; step title LARGE gives each step a landing moment.
- **Boring twin**: single white column, "Step 2 of 5" text, amount as a dropdown and frequency as three plain radios, Back/Next glued together bottom-left.
- **What to steal**: pane+milestone custom wizard scaffold; #f0f0f0 sidebar tint; CARDS radios for money presets with Other.
- **Risks**: milestone labels not clickable (no back-jump by rail); gray-on-gray contrast of future dots is low; 3×3 grid wraps awkwardly on phone unless stacking is tuned.

### Code cross-check (forms.md lines 802–957; base variant 963–1085)
- **Code-verified palette**: #f0f0f0 pane; all accents are theme tokens (no hexes) — blue values est.
- **Notable techniques**: a!match(value: local!currentFormStep) step body swap (849–898); milestone bound to same local (824–829); Back/Next writing step index with showWhen guards (908–936); functional vs base pattern pair — base hardcodes active:1 and drops saveIntos.
- **Corrections**: functional variant uses fontWeight:"SEMI_BOLD", base uses "BOLD" for the same heading — render matches SEMI_BOLD.

## wizard-sidebar-step-indicator-simple.png

### Identification
- **Image**: wizard-sidebar-step-indicator-simple.png | **Source page**: forms ("Sidebar step indicator (simple)") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (a!wizardLayout default rail, step 1/4)

### Use-case reconstruction (INFERRED)
- **Persona**: citizen ordering a vital record, first-time-public — one-shot, low familiarity, high stakes of getting the name exactly right.
- **Domain & brand context**: government vital-records service; near-black navy header, indigo accent — sober civic brand.
- **Top 3 user tasks (ranked)**: 1. Enter birth name exactly as on certificate. 2. Upload proof of name. 3. Continue through 4 steps to confirmation.
- **Implied requirements**: "Must warn that the name must match the original certificate"; "Must handle name-change cases via checkbox branch"; "Must list acceptable ID documents at the upload point"; "Must keep the rail quiet because the page already has a bold header" (page's stated rationale).
- **Data model sketch**: Application{firstName*, middleName, lastName*, suffix(12 options), nameDiffers:bool, proofOfName:doc*}; steps Birth Name → Birth Date & Location → Parental Information → Confirmation.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-TEMPLATE-FULL bg=#03122a "Order Birth Certificate"
WIZARD rail=small dots (default), labels plain
└─ step: SBS name row [2X:2X:2X:AUTO(Suffix ▾)]
   ├─ hint SMALL #999999 · ☐ name-differs checkbox
   ├─ Proof of Name* UPLOAD drop-zone
   └─ CARD #f3f5f9: ⓘ acceptable documents bullet list
FOOTER (no divider): CANCEL link ←→ NEXT solid
```
- **Above the fold**: everything (1012x679).
- **Reading order**: F — rail left, one dense field cluster right.
- **Hierarchy rationale**: bold navy band is the only heavy element (title = orientation); the name row is first and widest (task 1); the info card is tinted, not bordered, so guidance reads as ambient help not alert.
- **Density**: 2 — one field row + upload + one card on the viewport; compact rail.
- **Ratios & spacing**: rail ≈25%; name widths 2X/2X/2X/AUTO (CODE-VERIFIED); info card padding:"STANDARD"; checkbox marginBelow:"EVEN_MORE"; showButtonDivider:false.

### Styling specifics (CODE-VERIFIED lines 1094–1270; renders est.)
- **Palette**: header backgroundColor:"#03122a"; hint color:"#999999"; info card style:"#f3f5f9" with icon color:"ACCENT"; accent (asterisks, active-dot ring, CANCEL link, NEXT fill) indigo ≈#2322f0 (est.); page #ffffff.
- **Color application points**: navy slab; indigo touches (required marks, ring, link, button); tinted info card. Rail dots gray.
- **Typography moves**: header title LARGE white; field labels STANDARD bold; hint SMALL #999999; card body STANDARD; step labels STANDARD, active bold.
- **Imagery stance**: none — a single info-circle icon.
- **Card treatment**: info card flat fill #f3f5f9, no border, STANDARD padding — the page's only container.
- **Signature moves**: (1) Instead of a decorated rail, the default wizard indicator is left minimal because the #03122a header already anchors the brand (explicit page rationale — one bold element per screen). (2) Acceptable-documents guidance in a tinted card at the upload control, with bullet lines built from char(10) — help at point of need. (3) Suffix dropdown width AUTO keeps the name row on one line. (4) showButtonDivider:false — footer floats, keeping the short step airy.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!wizardLayout(titleBar: a!headerTemplateFull(backgroundColor:"#03122a"), showStepHeadings:false, showButtonDivider:false); a!sideBySideLayout name row (widths 2X/2X/2X/AUTO); a!richTextDisplayField hint (#999999, SMALL); a!checkboxField; a!fileUploadField(required); a!cardLayout(style:"#f3f5f9", height:"AUTO"); richTextIcon(info-circle, color:"ACCENT"); Submit SOLID showWhen fv!isLastStep; Cancel style:"LINK".
- Chart types: none. Interactive affordances: checkbox reveals name-change branch (INFERRED); upload drop-zone.

### Character & judgment
- **Register**: institutional + calm-clinical.
- **Why it works**: exactly one saturated band (header) + one tinted card = clear visual budget; the hint under the name row pre-empts the most common rejection reason; 4 steps visible sets effort expectation for a bureaucratic task.
- **Why not boring**: near-black #03122a instead of default blue reads as a serious civic seal; the tinted guidance card breaks the white field run without alert-yellow panic; single-line name row respects how people write names.
- **Boring twin**: white title bar, four stacked text fields, instructions crammed into a required-message, guidance dumped as a paragraph under the upload.
- **What to steal**: quiet-rail-when-header-is-bold rule; #f3f5f9 guidance card with ACCENT info icon; suffix as AUTO-width side-by-side item.
- **Risks**: #999999 hint on white ≈2.8:1 — fails AA; empty steps 2–4 hide real length; drop-zone-only upload needs keyboard path (UPLOAD button present — ok).

### Code cross-check (forms.md lines 1094–1270)
- **Code-verified palette**: #03122a, #999999, #f3f5f9 + ACCENT token; indigo renders est.
- **Notable techniques**: no style param on wizardLayout → default rail (contrast with image51's explicit DOT_VERTICAL); char(10) bullet building inside one richTextDisplayField (1216–1225); marginBelow:"EVEN_MORE" checkbox spacing (1197).
- **Corrections**: none.

## auto_insurance_quote_wizard_bundled_savings.png

### Identification
- **Image**: auto_insurance_quote_wizard_bundled_savings.png | **Source page**: forms ("Sidebar step indicator with icons") | **Alt/caption**: none
- **Device frame**: desktop (3420x1740 retina)
- **Marker**: neutral
- **UI type**: wizard-step (custom icon-rail wizard, step 1/6). Siblings: step_1 landing analyzed in `ins-quote-wizard-1.md`; the Quote branch in `ins-quote-wizard-2.md` — same app, keep palettes consistent.

### Use-case reconstruction (INFERRED)
- **Persona**: anonymous insurance shopper, first-time-public — top of a D2C quote funnel, seconds of patience.
- **Domain & brand context**: consumer P&C carrier "INSURECORP"; plum/magenta brand over near-black #333 base.
- **Top 3 user tasks (ranked)**: 1. Confirm Auto and consider bundling (Homeowners/Renters/Other Vehicles). 2. Understand the 6-step journey ahead. 3. Advance to About You.
- **Implied requirements**: "Must upsell bundling before any personal data is asked"; "Must show journey length with recognizable icons"; "Must allow 0–3 bundle add-ons"; "Must keep legal disclaimers on every step (dark footer)".
- **Data model sketch**: QuoteDraft{product:Auto(locked selection), bundleSelections:0..3 of {Homeowners, Renters, Other Vehicles}}; steps Bundled Savings → About You → Your Vehicles → Other Drivers → Coverage Options → Quote.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[brand bar plum, INSURECORP logo]           ← OBSERVED; not in this branch's snippet
HEADER-CONTENT bg=#333 contents={} (page in header slot)
├─ CARD(white, flat)
│  └─ COLUMNS [empty : NARROW_PLUS : WIDE : empty] margins=EVEN_MORE
│     ├─ WIZARD-STEP 1/6 rail: TINY stamp piggy-bank ACCENT + STRONG label;
│     │   5× future stamps #d9d9d9/#666666 + connector images (desktop-only)
│     └─ content: "Save more with a bundled quote" LARGE
│        ├─ CARD-CHOICE Auto (selected, icon car, corner check)
│        ├─ "Save as much as 25%…" MEDIUM (25% STRONG) + "What else…" MEDIUM STRONG
│        ├─ CARD-CHOICE ×3 maxSelections=3 (home/building/motorcycle icons)
│        └─ SECTION divider=ABOVE → NEXT: ABOUT YOU (SOLID LARGE, →step 3)
├─ CARD spacer h=SHORT_PLUS
└─ CARD footer #333 h=TALL (logo + disclaimers) — below fold
```
- **Above the fold**: brand bar, full rail, title, both card-choice groups, CTA.
- **Reading order**: F — rail anchors left, content scans down the WIDE column.
- **Hierarchy rationale**: bundling pitch (title + 25% claim) precedes the ask; the single magenta stamp + bold label = "you are at step 1 of a known path"; one SOLID CTA labeled with the destination ("NEXT: ABOUT YOU") pre-frames the next ask.
- **Density**: 2 — one decision, ~6 blocks in the viewport, EVEN_MORE margins and empty flanking columns.
- **Ratios & spacing**: [empty:NARROW_PLUS:WIDE:empty]; columns marginAbove/Below:"EVEN_MORE"; rail rows spacing:"NONE"; stackWhen up to DESKTOP_NARROW (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED lines 1280–2254; renders est.)
- **Palette**: base/footer #333; brand bar #73245d (branch-1 code; sampled ≈#6a2b5b); accent token "ACCENT" renders magenta ≈#af2b9b (est.) — active stamp, card icons, selected border, CTA; future stamps backgroundColor:"#d9d9d9" contentColor:"#666666"; content on white; muted text #666666.
- **Color application points**: brand bar; 1 active stamp; 4 product icons; selected-card border + corner check; CTA fill. Future rail is deliberately gray.
- **Typography moves**: title richTextItem size:"LARGE"; persuasion line MEDIUM with STRONG "25%"; question MEDIUM STRONG; step labels STANDARD (STRONG active only); card secondaryText small gray; CTA size:"LARGE" uppercase render.
- **Imagery stance**: styled icons only on this branch (piggy-bank, portrait, car, users, umbrella, clipboard rail icons; car/home/building/motorcycle product icons).
- **Card treatment**: page slabs flat (style:"NONE"/hex, showBorder:false); card-choices thin border, selected = ACCENT border + filled corner triangle.
- **Signature moves**: (1) Instead of a!milestoneField, the rail is hand-built from a!stampField(TINY) + richText labels + EXAMPLE_VERTICAL_CONNECTOR images in EXTRA_NARROW columns — enabling per-step icons. (2) Rail hidden below DESKTOP via showWhen:a!isPageWidth (line 2051). (3) Marketing copy inline between inputs ("Save as much as 25%") — form as funnel. (4) CTA names the next step, not "Next". (5) Whole page composed in headerContentLayout's header slot with contents:{} and backgroundColor #333 so the footer bleeds dark to the viewport edge.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#333", contentsPadding:"NONE"); a!stampField(icon, size:"TINY", backgroundColor:"ACCENT"|"#d9d9d9", contentColor:"STANDARD"|"#666666", accessibilityText per state); a!imageField connector; a!cardChoiceField(cardTemplateBarTextStacked with icon, maxSelections:1 / 3); a!richTextDisplayField persuasion copy; a!buttonWidget("Next: About You", size:"LARGE", style:"SOLID", value:3 → local!stepNumber); a!sectionLayout(divider:"ABOVE"); stackWhen incl. DESKTOP_NARROW.
- Chart types: none. Interactive affordances: multi-select bundle cards; single CTA; rail display-only.

### Character & judgment
- **Register**: energetic-consumer + institutional — saturated magenta persuasion over disciplined gray structure.
- **Why it works**: bundling is asked before personal data, when motivation is highest and cost is one click; iconized rail turns 6 steps into a promise rather than a threat; a single solid CTA leaves no competing action (no Back on step 1).
- **Why not boring**: icon stamps instead of numbered dots; sales copy typeset in the form's own rich-text rhythm; destination-labeled CTA; locked "Auto" card shown selected as a receipt of intent from the landing page.
- **Boring twin**: "Step 1 of 6" breadcrumb, three checkboxes labeled Homeowners/Renters/Other, gray Next button, disclaimer paragraph under the checkboxes.
- **What to steal**: stamp+connector icon rail (with per-state background/contentColor); showWhen page-width gate for the rail; destination-labeled primary CTA.
- **Risks**: rail invisible on tablet/phone (no compact fallback); accessibilityText contradictions — active stamp says "Completed Step" while its label says "Current Step (1 of 6)" (lines 1702/1722); #666666 on #d9d9d9 stamp icons ≈3.6:1, marginal; white on est. #af2b9b ≈4.9:1 borderline for LARGE-only text.

### Code cross-check (forms.md lines 1280–3930, `choose(local!stepNumber…)` branch 2 = 1676–2254)
- **Code-verified palette**: #333, #73245d (branch 1), #efefef, #434343, #BF04A0, #666666, #d9d9d9, #056CF2 (inert, decorativeBarPosition:"NONE"), #f8eff3, #38761d; ACCENT/STANDARD tokens only for magenta — hex est.
- **Notable techniques**: choose() branch-per-screen with buttons writing local!stepNumber (1285–1286, 2156–2162); stamp rail rows spacing:"NONE" (1730); desktop-only rail (2051); footer card height:"TALL" style:"#333" (2242–2248).
- **Corrections**: the plum INSURECORP bar visible in pixels is NOT in this branch's code (only branch 1 carries #73245d cards) — screenshot comes from the fuller example app; only 4 choose branches exist for 6 advertised steps (Vehicles/Drivers/Coverage screens absent; About You's CTA jumps value 4 = Quote).

## auto_insurance_quote_wizard_about_you.png

### Identification
- **Image**: auto_insurance_quote_wizard_about_you.png | **Source page**: forms ("Sidebar step indicator with icons") | **Alt/caption**: "Example of an insurance quote form step that asks for user information."
- **Device frame**: desktop (3420x1740 retina)
- **Marker**: neutral
- **UI type**: wizard-step (custom icon-rail wizard, step 2/6; same app as bundled_savings — shared context not repeated).

### Use-case reconstruction (INFERRED)
- **Persona**: same anonymous shopper, now invested one step deep; abandonment risk peaks at the first PII ask.
- **Domain & brand context**: INSURECORP D2C quote funnel.
- **Top 3 user tasks (ranked)**: 1. Enter name/address/DOB with minimal friction. 2. Trust the data request (privacy reassurance). 3. Continue to vehicles.
- **Implied requirements**: "Must prefill what the funnel already knows (State, ZIP)"; "Must visibly complete step 1 in the rail"; "Must address privacy fear at the exact point of data entry"; "Must keep field row shapes matching data shapes (M.I. tiny, suffix narrow)".
- **Data model sketch**: Applicant{firstName, mi, lastName, suffix(9 opts), streetAddress, apt, city, state:"VA"(locked), zip:"22102"(locked), dob:date} — state/zip carried from the landing ZIP capture.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[brand bar plum INSURECORP]
HEADER-CONTENT bg=#333 (page in header slot)
├─ COLUMNS [empty : NARROW_PLUS : WIDE : empty]
│  ├─ rail 6: ✔piggy ACCENT ("Bundled Savings") · portrait ACCENT+STRONG ("About You")
│  │   · 4 future #d9d9d9 · connectors; desktop-only
│  └─ content: "Please tell us a bit about you" LARGE
│     ├─ SBS [First 4X : M.I. 1 : Last 4X : Suffix ▾ 2X]
│     ├─ SBS [Street 3X : Apt/Unit 1]
│     ├─ SBS [City 4X : State(RO) : ZIP(RO) : spacer 2X]
│     ├─ SBS [DOB date : spacer 2X]
│     ├─ CARD #f8eff3 decorativeBar=START: shield ACCENT LARGE + privacy promise
│     └─ SECTION divider=ABOVE → NEXT: YOUR VEHICLES (SOLID LARGE)
└─ spacer + footer #333 (below fold)
```
- **Above the fold**: rail, title, all four field rows, privacy card, CTA.
- **Reading order**: F.
- **Hierarchy rationale**: fields ordered by social convention (name → address → DOB); the privacy card sits after DOB — the most sensitive field — and before the CTA, converting hesitation into continuation; completed step 1 stays magenta as sunk-cost progress proof.
- **Density**: 2 — one form cluster (~9 inputs) in a WIDE column with 2X spacer slack on every row.
- **Ratios & spacing**: sideBySide widths 4X/default/4X/2X, 3X/default, 4X + trailing 2X spacers (CODE-VERIFIED); rows marginBelow:"MORE".

### Styling specifics (CODE-VERIFIED lines 2255–2930; renders est.)
- **Palette**: as bundled_savings (#333 base, #73245d bar, ACCENT ≈#af2b9b est., #d9d9d9/#666666 future stamps) plus privacy card style:"#f8eff3" with decorativeBarPosition:"START" (default ACCENT bar renders magenta).
- **Color application points**: 2 magenta stamps (done + current); shield icon; privacy-card left bar + pink fill; CTA. Read-only State/VA + ZIP values render as plain text — no box chrome.
- **Typography moves**: title LARGE; labels STANDARD bold above fields; privacy lead "Your information is safe with us." STRONG inline with plain continuation; rail current label STRONG.
- **Imagery stance**: styled icons (rail; shield richTextIcon size:"LARGE" color:"ACCENT").
- **Card treatment**: privacy card = flat tint + START decorative bar, padding:"STANDARD" — a callout, not an alert.
- **Signature moves**: (1) readOnly:true text fields for State/ZIP show carried-over data as fact, not editable form. (2) Privacy microcopy in a brand-tinted (#f8eff3 = magenta at ~5% alpha equivalent) card with shield icon — trust styled in brand color rather than warning yellow. (3) Field widths proportioned to content (M.I. one unit, suffix 2X) so the row itself communicates expected input length. (4) Trailing 2X spacer items stop City/DOB rows from stretching full WIDE width.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!sideBySideLayout ×4 with width-weighted items; a!textField(readOnly:true, value:"VA"/"22102"); a!dropdownField suffix; a!dateField DOB; a!cardLayout(style:"#f8eff3", decorativeBarPosition:"START"); a!richTextIcon(shield, ACCENT, LARGE); stamp rail as before (accessibilityText "Completed Step"/"Current Step (2 of 6)"); a!buttonWidget("Next: Your Vehicles", SOLID, LARGE, value:4).
- Chart types: none. Interactive affordances: single CTA; no Back (rail non-interactive) — OBSERVED gap.

### Character & judgment
- **Register**: energetic-consumer + calm-clinical — brand-colored trust cues wrapped around a strictly conventional address block.
- **Why it works**: prefilled read-only State/ZIP proves the funnel remembered the user (reciprocity before asking more); row widths mirror data shapes so the form looks faster than it is; privacy note is positioned at the objection point, not in a footer.
- **Why not boring**: pink #f8eff3 callout with START bar instead of a gray disclaimer; icon rail carries continuity; destination-labeled CTA ("NEXT: YOUR VEHICLES").
- **Boring twin**: ten equal-width stacked fields, editable state/zip that the user must retype, privacy link in the footer, generic Next.
- **What to steal**: readOnly echo of known data; decorativeBarPosition:"START" tinted callout; width-weighted sideBySide name rows.
- **Risks**: no Back affordance anywhere on the branch (rail is display-only) — users must trust browser back; M.I. default-width item can collapse too narrow on mid widths; est. magenta contrast as before; stamp a11y text vs visual mismatch persists.

### Code cross-check (forms.md branch 3 = lines 2255–2930)
- **Code-verified palette**: #f8eff3 privacy card (2817), #333, #d9d9d9, #666666; ACCENT token for magenta (est. hex).
- **Notable techniques**: readOnly prefill (2747–2762); privacy card (2783–2821); rail current-step STRONG label + "Current Step (2 of 6)" a11y (2540s); CTA value:4 → jumps to Quote branch (2834).
- **Corrections**: CTA promises "Your Vehicles" but value 4 lands on the Quote screen — only 4 of 6 steps implemented; brand bar again absent from this branch's code.

## auto_insurance_quote_wizard_confirmation.png

### Identification
- **Image**: auto_insurance_quote_wizard_confirmation.png | **Source page**: forms ("Providing confirmation and review pages → Review page") | **Alt/caption**: none
- **Device frame**: desktop (3420x1902 retina)
- **Marker**: neutral
- **UI type**: wizard-step (review/quote step 6/6). Near-duplicate capture of `auto_insurance_quote_wizard_final_step.png` analyzed in `ins-quote-wizard-2.md` (same Quote branch; this one is the forms-page inline copy, lines 4721–7371, shown with Coverage accordion expanded). Full tier-A given but kept lean; see sibling for the deepest treatment.

### Use-case reconstruction (INFERRED)
- **Persona**: shopper at decision moment — buy, verify, or defer.
- **Domain & brand context**: INSURECORP funnel terminus.
- **Top 3 user tasks (ranked)**: 1. Judge $113.50/mo. 2. Audit inclusions (discounts, vehicle, driver, coverage limits) and edit mistakes. 3. Defer via emailed quote.
- **Implied requirements**: "Price must be visible without scrolling"; "Every reviewed group must be re-editable in place"; "Deferral must not leave the page"; "Journey must read complete (6/6)".
- **Data model sketch**: Quote{premium:113.50/mo, discounts:3 (−$42.90/mo), vehicles:1, drivers:1, coverages ×4{name, per-person, per-accident}} — Bodily Injury 50k/100k; UM/UIM 50k/100k; Property Damage 75k; Medical Payments 25k/50k.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
[brand bar plum] → HEADER-CONTENT bg=#333
├─ COLUMNS [empty : NARROW_PLUS(rail 6/6 all-ACCENT, Quote STRONG) : WIDE : empty]
│  └─ "Here's your personalized quote" LARGE
│     ├─ CARD(border, decorativeBar TOP ACCENT): $113.50 LARGE STRONG | /Month MEDIUM
│     │   | PURCHASE NOW solid | – or – | SAVE FOR LATER outline  (showWhen-swaps to
│     │   $113.50 | email field | SEND QUOTE | ✕ on save-for-later)
│     ├─ "Auto Insurance" MEDIUM label
│     ├─ CARD-link rows: 💲 3 discounts →$42.90/mo #38761d · 🚗 1 vehicle · 👥 1 driver
│     ├─ CARD-link "Coverage" + angle-down (marginBelow NONE)
│     └─ CARD: 4× SECTION divider=BELOW {name STRONG + limits, EDIT outline SECONDARY}
└─ spacer + #333 footer (below fold)
```
- **Above the fold**: rail, title, price card, three rows, Coverage header + first 2–3 limit blocks (3420x1902 shows all four).
- **Reading order**: F.
- **Hierarchy rationale**: price card is the only bordered+decorated element (task 1); PURCHASE NOW the only solid fill; audit rows compress to one line each with chevrons (task 2) and expand only for Coverage.
- **Density**: 2 — single-decision page; ~10 blocks; wide gutters.
- **Ratios & spacing**: as siblings; price card padding:"STANDARD"; rows marginBelow:"STANDARD"; accordion join via marginBelow:"NONE" (CODE-VERIFIED 7133).

### Styling specifics (CODE-VERIFIED lines 4721–7371; renders est.)
- **Palette**: #333 base/footer; #73245d brand bar (branch 1); ACCENT magenta ≈#af2b9b (est.) — 6 stamps, price-card top bar, CTA fill, SAVE FOR LATER border; savings green #38761d (7 in code at 6941); grays #666666/#d9d9d9; white content.
- **Color application points**: price-card top bar; both CTAs; rail; one green amount — the only non-brand color on the page.
- **Typography moves**: "$113.50" LARGE+STRONG with "/ Month" MEDIUM appended; row labels MEDIUM; coverage names STANDARD STRONG over plain limit lines; buttons uppercase render.
- **Imagery stance**: styled icons (hand-holding-usd, car, user-friends, umbrella; MEDIUM_PLUS near-black).
- **Card treatment**: price card showBorder:true, showShadow:false, decorativeBarPosition:"TOP" decorativeBarColor:"ACCENT"; summary rows default bordered cards with link:a!dynamicLink; coverage container flat.
- **Signature moves**: (1) Save-for-later swaps the price card's contents in place via two sideBySideLayouts with complementary showWhen on local!showSaveForLater (6825/6889) — deferral without navigation. (2) Cards-as-links + chevron glyphs fake an accordion; the Coverage header butts the detail card with marginBelow:"NONE". (3) Green #38761d reserved solely for money saved. (4) Edit buttons OUTLINE + color:"SECONDARY" so four repeated actions never compete with PURCHASE NOW.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!cardLayout(link:…) rows; a!sideBySideLayout swap pair; a!textField email (labelPosition COLLAPSED); a!richTextIcon(times-circle with dynamicLink linkStyle:"STANDALONE"); a!sectionLayout(divider:"BELOW") ×4; a!buttonWidget PURCHASE NOW / SAVE FOR LATER / SEND QUOTE(icon envelope-o) all size:"LARGE"; EDIT OUTLINE SECONDARY ×4; stamp rail all-ACCENT.
- Chart types: none. Interactive affordances: purchase/defer fork, in-card email capture + cancel, 4 link rows, 4 edits.

### Character & judgment
- **Register**: energetic-consumer + institutional.
- **Why it works**: the −$42.90/mo line makes the premium feel discounted before judgment; everything reviewable is one tap from editable, honoring the page's own guidance ("review step helps users feel confident… quickly change any mistakes"); the completed magenta rail is a visual receipt of effort at the ask.
- **Why not boring**: only decorated border in the app crowns the price; deferral is a first-class outlined CTA, not a "maybe later" link; audit rows are tappable cards, not a static table.
- **Boring twin**: "Review your quote" over a key-value table, total at bottom, Submit/Back buttons, discounts in a footnote.
- **What to steal**: paired-showWhen in-card state swap; decorativeBar TOP ACCENT price spotlight; single-purpose green.
- **Risks**: 6/6 all-identical stamps make current-step cue bold-text-only; 4-item price sideBySide will crush on narrow widths (no stacking spec); rail hidden below DESKTOP; est. magenta-on-white AA margin thin.

### Code cross-check (forms.md lines 4721–7371; Quote branch 6633–7361)
- **Code-verified palette**: #333, #73245d, #38761d, #d9d9d9, #666666, #efefef, #434343, #BF04A0, #f8eff3, #056CF2(inert); ACCENT token (magenta est.).
- **Notable techniques**: showSaveForLater swap (6812–6890); decorativeBar TOP ACCENT (6898–6899); accordion join (7126–7135); Edit rows (7136–7250+).
- **Corrections**: this "Review page" code block is the entire 4-branch wizard repeated verbatim, not a standalone review pattern; brand bar again only in branch 1. Cross-ref: `ins-quote-wizard-2.md` documents the same screen from the guidance sources (2954-line variant with brand bar + language toggle in-branch).

## image60.png

### Identification
- **Image**: image60.png | **Source page**: forms ("Multi-level sidebar step indicator") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (custom multi-level sidebar wizard, step 3/6, sub-step 1/4)

### Use-case reconstruction (INFERRED)
- **Persona**: business owner registering as a motor-vehicle dealer with the state — first-time-public, long multi-session form.
- **Domain & brand context**: state government self-service portal ("State.gov"); navy + civic blue.
- **Top 3 user tasks (ranked)**: 1. Complete the current sub-step (facility Location). 2. Keep orientation in a 6-step / 4-sub-step process. 3. Save progress and return later.
- **Implied requirements**: "Must break 6 steps into sub-steps and only show sub-steps for the current step" (page rationale — reduces clutter); "Must offer Save My Progress for multi-session completion" (page rationale); "Must state facility compliance rules at the point of address entry"; "Must show completed steps as revisitable links".
- **Data model sketch**: DealerRegistration{steps: About You✔, Business Entity✔, Dealership Facility(current: Location→Structures and Services→Zoning Search→Zoning Approval), Salespeople, Dealer Plates, Surety Bond and Insurance}; Location{streetAddress, city, state, zip}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV white (State.gov logo)                ← OBSERVED, not in code
HEADER card #03122a pad=MORE: breadcrumb "Home › Online Self Service"
  + "Motor Vehicle Dealer Registration" LARGE_PLUS white
CONTENT
├─ spacer CARD EXTRA_SHORT
└─ COLUMNS [empty : MEDIUM(rail) : WIDE(form) : empty]
   ├─ rail: ✔ACCENT About You · ✔ACCENT Business Entity · ③ACCENT Dealership Facility STRONG
   │  ├─ sub-list (indent EXTRA_NARROW): ❘Location ACCENT STRONG · Structures and Services
   │  │   · Zoning Search · Zoning Approval (all ACCENT links; hidden pipes #ffffff)
   │  ├─ ④⑤⑥ #cccccc future steps · divider BELOW
   │  └─ [SAVE MY PROGRESS] outline SECONDARY
   └─ form: SECTION "Location" · Street Address · [City : State ▾ : ZIP]
      · CARD #f3f5f9 ⓘ compliance bullets ·  [BACK outline · CANCEL link] ←→ [NEXT solid]
```
- **Above the fold**: everything at 1999x1250.
- **Reading order**: F — rail as table of contents, form to the right.
- **Hierarchy rationale**: title band biggest (civic identity + task name); current step is the only STRONG label with a numbered stamp; sub-steps appear only under step 3, exactly as the page prescribes.
- **Density**: 3 — rail + 4 inputs + info card visible together; comfortable MORE padding.
- **Ratios & spacing**: [empty:MEDIUM:WIDE:empty] (CODE-VERIFIED); rail rows padding:"NONE" cards with EVEN_LESS spacer cards; sub-list indented by an EXTRA_NARROW spacer column; rail bottom divider:"BELOW".

### Styling specifics (CODE-VERIFIED lines 3943–4620; renders est.)
- **Palette**: header card style:"#03122a"; future stamps backgroundColor:"#cccccc"; info card style:"#f3f5f9"; hidden sub-pipes color:"#ffffff"; ACCENT token renders civic blue ≈#1478cd (est.) — check stamps, numbered stamp 3, sub-step links, active pipe, NEXT fill; white utility nav (site chrome).
- **Color application points**: completed/current stamps + their labels; sub-step link text; active "❘" pipe; info-circle icon; NEXT. Future steps deliberately gray-on-white with STANDARD labels.
- **Typography moves**: breadcrumb STANDARD white with chevron icon; title LARGE_PLUS; rail labels MEDIUM (current STRONG, completed colored ACCENT); sub-links MEDIUM; section label "Location" renders large; card bullets STANDARD.
- **Imagery stance**: none beyond stamps/icons.
- **Card treatment**: rail entries are borderless link-cards (style:"NONE", padding:"NONE", link:dynamicLink) — whole row clickable; info card flat #f3f5f9.
- **Signature moves**: (1) Two-level wizard rail built from stampFields + a text "❘" pipe glyph as the sub-step cursor — current sub-step gets an ACCENT pipe, siblings get an invisible #ffffff pipe to preserve alignment. (2) Sub-steps render only inside the active step (code has no sub-lists under steps 1–2, 4–6). (3) Completed steps colored ACCENT + check stamps and wrapped in dynamicLink cards = revisitable; future steps numbered gray = locked. (4) "Save My Progress" OUTLINE color:"SECONDARY" below a divider — present but subordinate.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(header card #03122a); a!stampField(icon:"check"|text:"3"|numbers, size:"TINY", backgroundColor ACCENT/#cccccc); link-wrapped a!cardLayouts as rail rows; richTextItem "❘" color ACCENT/#ffffff size LARGE; a!sectionLayout(divider:"BELOW"); a!buttonWidget("Save My Progress", OUTLINE, color:"SECONDARY"); form: a!sectionLayout("Location"), a!textField, a!dropdownField, a!cardLayout #f3f5f9 info, Back OUTLINE + Cancel LINK, Next SOLID.
- Chart types: none. Interactive affordances: clickable completed steps + sub-steps (dynamicLinks), Save My Progress, Back/Next.

### Character & judgment
- **Register**: institutional + calm-clinical — navy header, sober blues, regulation text upfront.
- **Why it works**: progressive disclosure of sub-steps keeps a ~15-node tree readable as ~9 rows; color encodes state consistently (blue=done/available, gray=locked, bold=here); compliance bullets sit beside the address they constrain, pre-empting rejected applications.
- **Why not boring**: the ❘-pipe cursor is a tiny, legible invention; numbered stamps for future steps double as a count; breadcrumb + title in one navy slab gives government-scale context without a mega-header.
- **Boring twin**: a flat 10-item milestone rail listing every sub-step at once, black labels throughout, requirements hidden behind a "?" icon, no save-and-return.
- **What to steal**: sub-steps-only-under-current-step; invisible-pipe alignment trick; Save My Progress placement under a divider.
- **Risks**: pipe cursor + bold are subtle current-sub cues; #cccccc numerals on white fail contrast (decorative, but they carry the count); whole-row link cards need focus states (dynamicLink label "Dynamic Link" is placeholder a11y text).

### Code cross-check (forms.md lines 3943–4620)
- **Code-verified palette**: #03122a, #cccccc, #f3f5f9, #ffffff pipes; ACCENT token (blue est.).
- **Notable techniques**: link-card rail rows (3997–4036); ❘ cursor with ACCENT vs #ffffff (4151, 4192–4196); EVEN_LESS spacer cards as rail rhythm (4037–4043); divider:"BELOW" + Save My Progress (4455–4470 approx).
- **Corrections**: white State.gov utility bar is site chrome, absent from code; "Location" heading in the form is a sectionLayout label, not a headingField.

## form_submission_confirmation.png

### Identification
- **Image**: form_submission_confirmation.png | **Source page**: forms ("Confirmation page") | **Alt/caption**: none
- **Device frame**: desktop (932x506)
- **Marker**: neutral
- **UI type**: form (post-submission confirmation step). **Tier override: B→A** — batch suggested B, but this is a complete page (site nav + title bar + contents + button), so full-page rule applies; kept compact.

### Use-case reconstruction (INFERRED)
- **Persona**: case submitter (customer-facing or internal), occasional cadence; needs closure + reference number.
- **Domain & brand context**: financial-services case management (client "Velfin Capital, Inc."), appian-navy brand.
- **Top 3 user tasks (ranked)**: 1. Confirm submission succeeded. 2. Capture case number #9378-837. 3. Know what happens next (email updates / phone escalation), then Close.
- **Implied requirements**: "Must confirm success in one glance (icon before words)"; "Must surface the generated case id"; "Must set follow-up expectations and an escalation channel"; "Must route the user back via a single button" (page rationale).
- **Data model sketch**: Case{id:#9378-837, client:Velfin Capital Inc., status:submitted, supportPhone:(480)284-7289}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV navy (appian; HOME/CASES•/REPORTS)     ← site chrome, not in code
HEADER-TEMPLATE-FULL bg=#020A51 "Create Case"
FORM contentsWidth=NARROW, all CENTER-aligned
├─ STAMP thumbs-up bg=POSITIVE
├─ "Case #9378-837 created for Velfin Capital, Inc." MEDIUM_PLUS (# STRONG)
├─ expectation paragraph STANDARD
└─ [CLOSE] SMALL SOLID
```
- **Above the fold**: everything — single-idea page.
- **Reading order**: single-column, center axis.
- **Hierarchy rationale**: green stamp first (emotional confirmation precedes information); case number bolded inside the sentence (the one thing to remember); the only action is Close.
- **Density**: 1 — one idea, four stacked elements, massive whitespace; NARROW contents width.
- **Ratios & spacing**: contentsWidth:"NARROW"; stamp marginBelow:"MORE"; button marginAbove:"MORE" (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED lines 4651–4710; renders est.)
- **Palette**: title bar backgroundColor:"#020A51"; stamp backgroundColor:"POSITIVE" (renders green ≈#12a24b est.) contentColor:"STANDARD" (white); nav navy ≈#0a1442 (est., site chrome); text near-black on white; CLOSE navy fill (theme accent est.).
- **Color application points**: navy slab; one green circle; one navy button — three inks total.
- **Typography moves**: headline size:"MEDIUM_PLUS" with nested STRONG case number; body STANDARD; everything align:"CENTER".
- **Imagery stance**: single icon stamp (thumbs-up), no illustration.
- **Card treatment**: none — bare white canvas.
- **Signature moves**: (1) Semantic token POSITIVE for the stamp instead of a brand hex — success reads instantly and theme-safely. (2) Case number typeset STRONG inside the sentence rather than as a labeled field. (3) Button size:"SMALL" — deliberately quiet exit after task completion. (4) Phone escalation embedded in prose, not a contact card — keeps density at 1.
- **Why-this-not-that**: a commented-out color:"SECONDARY" in code (line 4668) shows the author considered muting the headline and chose full-contrast instead.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(titleBar: a!headerTemplateFull(backgroundColor:"#020A51"), contentsWidth:"NARROW"); a!stampField(icon:"thumbs-up", backgroundColor:"POSITIVE", contentColor:"STANDARD", align:"CENTER"); a!richTextDisplayField(align:"CENTER", nested richTextItems); a!buttonArrayLayout(align:"CENTER") with Close(size:"SMALL", style:"SOLID").
- Chart types: none. Interactive affordances: Close only.

### Character & judgment
- **Register**: calm-clinical + institutional.
- **Why it works**: the page answers the three post-submit anxieties in order (did it work? → green stamp; what's my reference? → bold id; what now? → email/phone sentence); zero competing chrome makes the single button unmissable.
- **Why not boring**: it's minimal by design, but the personality is in restraint — semantic green used once, id inline-bolded, small Close instead of a shouting CTA.
- **Boring twin**: "Success!" heading, the case number buried in a gray info banner, plus Print/Home/New Case triple-button indecision.
- **What to steal**: POSITIVE stamp + centered NARROW column as the universal confirmation scaffold; inline-STRONG reference numbers.
- **Risks**: no copy-to-clipboard for the id; phone number not a tel: link; single Close depends on dialog context to land somewhere sensible.

### Code cross-check (forms.md lines 4651–4710)
- **Code-verified palette**: #020A51; POSITIVE/STANDARD tokens (green/white renders est.).
- **Notable techniques**: all-CENTER alignment trio (stamp/text/button); nested richTextItem STRONG id (4672–4679).
- **Corrections**: site nav bar absent from code; code's Close lacks navigation logic (display pattern only).

## approval-form.png

### Identification
- **Image**: approval-form.png | **Source page**: forms ("Review and approve form") | **Alt/caption**: none
- **Device frame**: desktop (758x962; dialog/task-pane width)
- **Marker**: neutral
- **UI type**: form (approval task). **Tier override: B→A** — batch suggested B by size, but this is a complete task form (title bar, two content cards, footer buttons), so full-page rule applies.

### Use-case reconstruction (INFERRED)
- **Persona**: claims supervisor/adjuster reviewer, daily-operator — clears an approval queue; each decision must take <1 minute.
- **Domain & brand context**: auto-insurance claims ops; cool blue-gray palette, near-zero chrome — pure task UI.
- **Top 3 user tasks (ranked)**: 1. Scan claim facts (amounts, risk). 2. Approve or Reject. 3. Justify (comments mandatory on reject).
- **Implied requirements**: "Must show decision-relevant facts beside the decision without navigation" (page rationale); "Must force a rationale only when rejecting"; "Must cap and count comment length (500)"; "Must fit a dialog (Contents Width adjustable per page tip)".
- **Data model sketch**: Claim{policyHolder:Jordan Miller, policyNumber:POL-7733219, claimType:Auto-Collision, incidentDate:2026-05-10, estimatedLoss:$4,250, deductible:$500, claimedAmount:$3,750, riskLevel:Low, vehicle:2023 Honda CR-V, adjuster:Alex Rivera, status:Pending Review}; Decision{approve|reject, comments≤500}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM bg=#F8F9FC
├─ title "Review CLM-99284-01" + secondary
├─ CARD(border #D6DCE8, ROUNDED) "CASE SUMMARY" (SMALL #152B99 caps)
│  └─ COLUMNS [1:1] 6+5 read-only fields; Risk = ↓#CC7600 icon+text; Vehicle = green tag
├─ CARD(same) "YOUR DECISION"
│  ├─ CARD-CHOICE ✔Approve(POSITIVE) | ✕Reject(NEGATIVE)
│  └─ Comments paragraph, 0/500 counter
└─ [CANCEL outline] ←→ [SUBMIT solid]
```
- **Above the fold**: title + full summary card + decision card header (at 758x962 nearly everything).
- **Reading order**: single-column of two zones; Z inside the summary grid.
- **Hierarchy rationale**: facts-then-verdict ordering; the two cards give the eye exactly two stops; decision options are icon-coded so the verdict row is scannable before reading.
- **Density**: 3 — 11 data points + 2 inputs in ~960px, STANDARD padding, two-column packing.
- **Ratios & spacing**: summary columns [1:1]; cards padding:"STANDARD", marginBelow:"STANDARD"; comments marginAbove:"LESS" (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED lines 7379–7594)
- **Palette**: page backgroundColor:"#F8F9FC"; card borders borderColor:"#D6DCE8", style:"NONE", shape:"ROUNDED"; section headings color:"#152B99"; risk icon color:"#CC7600"; vehicle tag backgroundColor:"#D4EDDA" textColor:"#0F5132"; decision icons POSITIVE/NEGATIVE tokens (green ✔ / red ✕, est. renders ≈#12a24b/#d9342b); SUBMIT indigo ≈#2431ef (est., theme accent).
- **Color application points**: two tiny caps headings; one amber arrow; one green tag; decision icons; SUBMIT. Field labels/values stay near-black — data is monochrome, signals are colored.
- **Typography moves**: page title ≈MEDIUM_PLUS bold with STANDARD secondary; card headings headingField size:"SMALL" fontWeight:"SEMI_BOLD" + upper() all-caps in brand navy; labels STANDARD bold; values regular.
- **Imagery stance**: styled icons only (arrow-down risk, check/times decision).
- **Card treatment**: white cards, hairline #D6DCE8 border, ROUNDED corners, flat (no shadow) on a #F8F9FC wash — soft two-layer depth.
- **Signature moves**: (1) upper("case summary") + SMALL + #152B99 = label-as-architecture instead of big section titles. (2) Risk and Vehicle break the read-only monotony with exactly one icon and one tag — semantic color rationed to signals. (3) cardChoiceField with iconColor POSITIVE/NEGATIVE makes the verdict a visual binary. (4) Conditional requirement `required: tointeger(local!decision)=2` — comments mandatory only on reject. (5) Page-vs-card contrast made with #F8F9FC/#D6DCE8, not shadows.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(backgroundColor:"#F8F9FC", titleBar: headerTemplateSimple(titleColor:"STANDARD"), showTitleBarDivider:false); a!cardLayout(style:"NONE", borderColor:"#D6DCE8", shape:"ROUNDED") ×2; a!headingField(size:"SMALL", color:"#152B99", fontWeight:"SEMI_BOLD"); readOnly a!textField ×9 + a!dateField; a!richTextDisplayField risk (icon #CC7600); a!tagField(#D4EDDA/#0F5132); a!cardChoiceField(cardTemplateBarTextStacked, iconColor:fv!data.color, maxSelections:1, required); a!paragraphField(characterLimit:500, showCharacterCount, conditional required); buttons Submit SOLID(loadingIndicator) / Cancel OUTLINE.
- Chart types: none. Interactive affordances: decision cards, comments, submit/cancel.

### Character & judgment
- **Register**: calm-clinical + utilitarian-ops — decision support with zero persuasion.
- **Why it works**: every fact needed for the verdict is on-screen (page's stated purpose); color appears only where meaning changes (risk, vehicle status, verdict); the reject path self-documents via conditional required comments.
- **Why not boring**: navy micro-caps headings give corporate polish without weight; icon-coded verdict cards beat a Yes/No dropdown; one amber arrow + one green tag lift an otherwise gray ledger.
- **Boring twin**: a single white column of 11 labeled read-only fields, a radio pair Approve/Reject, always-required comments, default gray page.
- **What to steal**: upper()+SMALL+brand-color heading recipe; POSITIVE/NEGATIVE iconColor decision cards; conditional required tied to the negative branch.
- **Risks**: read-only values look editable (boxed) in some render modes — here they render plain, fine; #CC7600 on white ≈3.9:1 borderline for small glyphs; tag green pair (#D4EDDA/#0F5132) is fine, but meaning of a "vehicle" tag color is unexplained.

### Code cross-check (forms.md lines 7379–7594)
- **Code-verified palette**: #F8F9FC, #D6DCE8, #152B99, #CC7600, #D4EDDA/#0F5132 + POSITIVE/NEGATIVE tokens; SUBMIT indigo is theme-level (est.).
- **Notable techniques**: shape:"ROUNDED" cards (7503, 7563); conditional required (7551); upper() headings (7400, 7508); currency values via a!currency locals (7385–7387).
- **Corrections**: none — pixels match code closely.

## forms-sidebar-for-decoration.png

### Identification
- **Image**: forms-sidebar-for-decoration.png | **Source page**: forms ("Displaying read-only details → Sidebar for decoration") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (single-step with decorative sidebarTemplate)

### Use-case reconstruction (INFERRED)
- **Persona**: internal staff/customer opening a support case, occasional cadence.
- **Domain & brand context**: Boreas Foundation service desk; charcoal nav + loud gold sidebar — the one playful surface in an otherwise sober suite.
- **Top 3 user tasks (ranked)**: 1. Describe the issue. 2. Set priority with correct expectations. 3. Attach evidence + contact info and submit.
- **Implied requirements**: "Must add visual interest to a simple form" (page's stated purpose); "Must set response-time expectations per priority BEFORE the user chooses one"; "Must collect contact fallback".
- **Data model sketch**: Case{description:rich, priority:enum(Low 4-7d | Standard 1-2d | Urgent 2h 24/7), attachments:docs, contactName, contactEmail}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV charcoal (CASES active gold underline)
SIDEBAR-TEMPLATE [left ≈27%, bg=#f5c024]
├─ illustration MEDIUM_PLUS
├─ "Open a New Case" + secondary #3B3B3B
└─ 3× SBS icon+label rows: ↓ Low / ○ Standard / ⚠ Urgent + response times
FORM [right, white, contentsWidth=MEDIUM]
├─ Description (styled text editor)
├─ Priority CARDS-radio ×3 (Standard selected)
├─ Attachments upload · SBS [Contact Name : Contact Email]
└─ divider → CANCEL outline ←→ OPEN CASE solid
```
- **Above the fold**: everything at 1999x1089.
- **Reading order**: F — yellow panel reads first (it's the loudest), then the form column.
- **Hierarchy rationale**: title lives in the sidebar so the form column starts directly with the first input; priority SLAs sit in the sidebar mirroring the Priority field's options — reference beside decision; single solid OPEN CASE.
- **Density**: 3 — four inputs + sidebar copy visible; MEDIUM contents width keeps lines readable.
- **Ratios & spacing**: sidebar ≈27% full-height; contents centered in remaining ≈73%; marginBelow:"MORE" rhythm between fields (CODE-VERIFIED); showButtonDivider:true.

### Styling specifics (CODE-VERIFIED lines 7608–7717)
- **Palette**: sidebar backgroundColor:"#f5c024"; sidebar text/icons secondaryTextColor + color:"#3B3B3B"; nav charcoal ≈#2e3a45 (est.); form white; selected priority card + OPEN CASE steel blue ≈#1f6ba2 (est., theme accent); field borders light gray.
- **Color application points**: entire sidebar slab; dark-gray (not black) sidebar text; accent only on selected card ring/dot and OPEN CASE. The form column itself is colorless — all brand energy quarantined left.
- **Typography moves**: sidebar title ≈LARGE bold dark-on-gold; priority names STRONG with STANDARD explainers; form labels STANDARD bold; buttons uppercase.
- **Imagery stance**: flat isometric illustration (docs + figure) top of sidebar — decoration, no data.
- **Card treatment**: priority radios choiceStyle:"CARDS" choiceLayout:"COMPACT"; no cards elsewhere.
- **Signature moves**: (1) a!sidebarTemplate as the form's titleBar — title, image, and additionalContents rows all live in one gold rail (the API's intended "decoration" slot). (2) Priority SLAs precomputed as an a!forEach over a!map rows with icon+STRONG+secondary — the sidebar is a legend for the form's most consequential field. (3) #3B3B3B chosen over black for gold-background legibility with less harshness. (4) firstItem marginAbove:"STANDARD" via if(fv!isFirst,…) — list rhythm tuned in code.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(titleBar: a!sidebarTemplate(backgroundColor:"#f5c024", secondaryTextColor:"#3B3B3B", image, imageSize:"MEDIUM_PLUS", additionalContents: forEach sideBySideLayouts), contentsWidth:"MEDIUM", focusOnFirstInput:false, showButtonDivider:true); a!styledTextEditorField(sizeLimit:4000); a!radioButtonField(CARDS/COMPACT, value:2); a!fileUploadField; SBS contact fields (inputPurpose:"EMAIL"); Open Case SOLID / Cancel OUTLINE.
- Chart types: none. Interactive affordances: upload, radios; sidebar static.

### Character & judgment
- **Register**: warm-community + energetic-consumer — the gold rail smiles, the form behaves.
- **Why it works**: expectation-setting (response times) happens in the same glance as priority selection, deflecting "urgent by default" behavior; the yellow slab gives a dull case form personality without touching a single input; icons (↓ ○ ⚠) rank severity pre-verbally.
- **Why not boring**: #f5c024 full-height slab instead of a title bar; illustration used where data isn't needed; SLA legend instead of helper tooltips.
- **Boring twin**: white form titled "Open a New Case", priority dropdown with no explanation of consequences, submit bottom-right, maybe a gray banner about response times after submission.
- **What to steal**: sidebarTemplate additionalContents as a field legend; dark-gray-on-brand-color text rule; putting the form title in the rail to start content at field one.
- **Risks**: #3B3B3B on #f5c024 ≈7.5:1 — good; but white nav text/logo over gold boundary can shimmer; sidebar collapses on phone (template stacks) pushing the SLA legend above the whole form — long scroll; illustration adds no information for repeat users.

### Code cross-check (forms.md lines 7608–7717)
- **Code-verified palette**: #f5c024, #3B3B3B; accent blue is theme-level (est.).
- **Notable techniques**: forEach-driven additionalContents (7637–7671); if(fv!isFirst) margin tuning (7667); inputPurpose:"EMAIL" (7698); focusOnFirstInput:false (7706).
- **Corrections**: none.

## forms-sidebar-for-contextual-information-simple.png

### Identification
- **Image**: forms-sidebar-for-contextual-information-simple.png | **Source page**: forms ("Sidebar for contextual information (simple)") | **Alt/caption**: none
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (task form + right reference pane)

### Use-case reconstruction (INFERRED)
- **Persona**: nonprofit ops staff updating donor records from tasks, daily-operator.
- **Domain & brand context**: Boreas Foundation CRM; charcoal/gold chrome, steel-blue accent, neutral gray reference pane.
- **Top 3 user tasks (ranked)**: 1. Enter the new address. 2. Cross-check the current address/contact while typing. 3. Update or cancel.
- **Implied requirements**: "Must show the donor's current details while editing" ; "Reference info must sit RIGHT so the actionable form keeps primary focus (LTR)" — page's explicit rule; "Must not let reference content compete visually with inputs".
- **Data model sketch**: Donor{name:Megan Barton, since:2019, address{street:8238 Constitution St., city:Carlisle, state:PA, zip:17013, country:US}, phone:(215) 200-6387, email:megan.barton@email.com}; form fields Country/Street/City/State/ZIP.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV charcoal (MY TASKS active gold underline)
PANE[main, white]
└─ COLUMNS [empty : MEDIUM_PLUS : empty] marginAbove=MORE
   ├─ "Update Donor Address" LARGE H1 SEMI_BOLD
   ├─ Country ▾ (US) · Street Address · [City | State ▾ | ZIP] DENSE
   └─ ─────── divider → CANCEL ←→ UPDATE solid
PANE[right w=MEDIUM bg=#f0f0f0 pad=MORE]
└─ 4× SBS stamp(#C9D8E4/#1F4C75)+text rows:
   MB Megan Barton/Donor since 2019 · 📍 current address · ☎ phone · ✉ email
```
- **Above the fold**: everything at 1999x1089; sidebar rows end ~mid-page leaving deliberate empty gray.
- **Reading order**: F — form first (left, white, biggest heading), sidebar as glance-target.
- **Hierarchy rationale**: actionable pane gets ~2/3 width + white ground; reference pane is tinted and stamp-labeled for scanning, not reading; only UPDATE is solid.
- **Density**: 2 — 5 inputs + 4 reference rows across the viewport, generous MORE margins.
- **Ratios & spacing**: right pane width:"MEDIUM" (~33%); form column MEDIUM_PLUS centered; nested City/[State/ZIP] columns spacing:"DENSE" with stackWhen:"NEVER" for State+ZIP (CODE-VERIFIED); showPaneDividers:false.

### Styling specifics (CODE-VERIFIED lines 7727–7954)
- **Palette**: sidebar backgroundColor:"#f0f0f0"; stamps backgroundColor:"#C9D8E4" contentColor:"#1F4C75"; role text color:"#6C6C75" SMALL; nav ≈#2e3a45 + gold ≈#f0c24c (est.); UPDATE steel blue ≈#1f6ba2 (est.); white form ground.
- **Color application points**: four pastel stamp circles; UPDATE fill; CANCEL border. Sidebar text near-black on gray — reference stays quiet.
- **Typography moves**: H1 headingField size:"LARGE" fontWeight:"SEMI_BOLD"; donor name STRONG with SMALL #6C6C75 role line; labels STANDARD bold; buttons uppercase.
- **Imagery stance**: none — initials + icon stamps carry identity (initials(local!donorInfo.name) computed).
- **Card treatment**: none; the tinted pane itself is the container (showPaneDividers:false — separation by fill alone).
- **Signature moves**: (1) Reference-right rule enacted: paneLayout with the gray pane second — page text explains LTR priority. (2) a!stampField(#C9D8E4/#1F4C75, TINY) rows form a scannable contact ledger — same recipe as a record header, reused at form scale. (3) initials() computes the avatar — no photo dependency. (4) Nested columnsLayout with spacing:"DENSE" + stackWhen:"NEVER" keeps State+ZIP paired even on squeeze.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!paneLayout(2 panes, showPaneDividers:false); a!pane(width:"MEDIUM", backgroundColor:"#f0f0f0", padding:"MORE"); a!headingField(LARGE, H1, SEMI_BOLD); a!dropdownField country/state; a!textField street/city/zip (inputPurpose:"STREET_ADDRESS"); a!horizontalLine; a!buttonLayout(Update SOLID, Cancel default); sidebar a!sideBySideLayouts(spacing:"SPARSE", alignVertical:"MIDDLE") with a!stampField(TINY) ×4.
- Chart types: none. Interactive affordances: form fields only; sidebar static.

### Character & judgment
- **Register**: calm-clinical + institutional.
- **Why it works**: the exact data being replaced is visible at eye level while typing (error prevention by comparison); tint-vs-white split needs no borders; stamp icons make phone/email/address findable in <1s.
- **Why not boring**: pastel #C9D8E4 stamps on gray add texture without saturation; H1 LARGE left-aligned over a MEDIUM_PLUS column gives editorial confidence; the pane split is felt, not drawn (no divider line).
- **Boring twin**: full-width form with the old address shown as gray helper text under each field, or worse, not shown at all; sidebar as a bordered "Details" card with label:value pairs.
- **What to steal**: reference-pane-right rule; stamp+two-line-text contact rows; initials() avatars.
- **Risks**: #6C6C75 SMALL on #f0f0f0 ≈4.4:1 — borderline AA for small text; sidebar order (identity→address→phone→email) duplicates form data without "current vs new" labeling — a novice could mistake which is authoritative; panes stack on phone, burying reference below the form.

### Code cross-check (forms.md lines 7727–7954)
- **Code-verified palette**: #f0f0f0, #C9D8E4, #1F4C75, #6C6C75.
- **Notable techniques**: initials() stamp (7823); spacing DENSE + stackWhen NEVER nested columns (7774–7790); showPaneDividers:false (7952).
- **Corrections**: none.

## forms-sidebar-for-contact-information-and-faqs.png

### Identification
- **Image**: forms-sidebar-for-contact-information-and-faqs.png | **Source page**: forms ("Sidebar for contact information and FAQs") | **Alt/caption**: none
- **Device frame**: desktop (1581x967)
- **Marker**: neutral
- **UI type**: form (public contact form + reference sidebar)

### Use-case reconstruction (INFERRED)
- **Persona**: prospective/current client of a financial firm ("Fisch Financial"), first-time-public — one-off inquiry.
- **Domain & brand context**: boutique financial services; near-white minimalism + indigo links — quiet premium.
- **Top 3 user tasks (ranked)**: 1. Send a question via the form. 2. Self-serve via FAQ links instead. 3. Find an office address/email directly.
- **Implied requirements**: "Must offer self-service (FAQ) beside the ask-a-human path"; "Must expose both office locations + emails"; "Must keep the form under five fields".
- **Data model sketch**: Inquiry{name*, email*, phone, message*}; Offices ×2{name, street, cityStateZip, email}; FAQ ×4{question:link}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PANE[main w=AUTO bg=#fafafc]
└─ COLUMNS [AUTO : MEDIUM_PLUS : AUTO] marginAbove=EVEN_MORE
   ├─ "Questions?⏎We're here to help" LARGE STRONG ×2 lines
   ├─ Name* · Email* · Phone Number · How can we help?*
   └─ [SUBMIT] solid, align=START
PANE[right w=MEDIUM bg=#fafafc] (thin divider line visible)
└─ COLUMNS [AUTO : NARROW_PLUS : AUTO]
   ├─ CONTACT US (MEDIUM STRONG caps)
   ├─ HEADQUARTERS block + ACCENT email · SAN DIEGO block + ACCENT email
   └─ FAQ: 4 ACCENT question links
```
- **Above the fold**: everything; lower two-thirds of the canvas intentionally empty.
- **Reading order**: Z — headline → fields → SUBMIT, then sidebar column.
- **Hierarchy rationale**: two-line LARGE headline is the only display type (warmth before fields); form fields outrank sidebar by width and boldness; FAQ links colored to advertise the no-form path.
- **Density**: 2 — 4 fields + 3 sidebar blocks; whitespace dominates (EVEN_MORE top margins, empty flanks).
- **Ratios & spacing**: form column MEDIUM_PLUS vs sidebar text column NARROW_PLUS inside a MEDIUM pane (~2:1 visual); both panes same #fafafc — separation via the default pane divider hairline only.

### Styling specifics (CODE-VERIFIED lines 7964–8117)
- **Palette**: both panes backgroundColor:"#fafafc"; links/SUBMIT accent indigo ≈#3f24f0 (est., ACCENT token in code); text near-black; divider hairline ≈#e3e3e8 (est.).
- **Color application points**: 2 office emails, 4 FAQ links, SUBMIT fill, required asterisks — indigo only where clickable (plus asterisks). Zero decorative color.
- **Typography moves**: headline two richTextItems LARGE STRONG stacked with char(10); micro-caps hierarchy — CONTACT US (MEDIUM STRONG), HEADQUARTERS/SAN DIEGO OFFICE/FAQ (STANDARD STRONG caps); body STANDARD.
- **Imagery stance**: none at all — typography-only page.
- **Card treatment**: none — two tinted panes, one hairline.
- **Signature moves**: (1) Near-white #fafafc on BOTH panes — the sidebar differs by column width and type scale, not color blocking. (2) SUBMIT align:"START" directly under the message field (form ends where writing ends, no bottom-right hunt). (3) All-caps STRONG STANDARD text as section headers instead of headingFields — one type family, three scales. (4) FAQ questions as bare ACCENT rich-text links — self-service advertised in the sidebar, not a tab.
- **Why-this-not-that**: uppercase SUBMIT label is literal in code ("SUBMIT"), not a style transform.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!paneLayout(pane AUTO + pane MEDIUM, both #fafafc); centering columns AUTO/MEDIUM_PLUS/AUTO and AUTO/NARROW_PLUS/AUTO; a!textField(inputPurpose NAME/EMAIL/PHONE_NUMBER, required); a!paragraphField; a!buttonArrayLayout(align:"START") SUBMIT SOLID; sidebar a!richTextDisplayFields with color:"ACCENT" links.
- Chart types: none. Interactive affordances: FAQ/email links, submit.

### Character & judgment
- **Register**: premium-editorial + institutional — whitespace and micro-caps do the branding.
- **Why it works**: the page offers three exits (form, FAQ, direct email) ranked by visual weight; the conversational two-line headline sets tone in six words; near-monochrome ground makes the six indigo links the obvious interactive map.
- **Why not boring**: boring-adjacent by intent — the distinctiveness is the restraint: no cards, no icons, no banner, START-aligned submit, type-scale-only hierarchy. As a pattern it proves a form can carry brand with zero chrome.
- **Boring twin**: gray bordered "Contact Us" card grid with icon bullets for phone/email, centered submit, FAQ accordion below the fold.
- **What to steal**: same-tint dual panes with hairline separation; SUBMIT under the last field at START; caps-STRONG micro-headers.
- **Risks**: OBSERVED typo "avilable" in FAQ link (sic, code line 8092); phone field optional but unlabeled as such (only asterisks mark required — acceptable); indigo on #fafafc ≈7:1 fine; vast lower whitespace wastes tall screens if embedded in a portal with its own chrome.

### Code cross-check (forms.md lines 7964–8117)
- **Code-verified palette**: #fafafc ×2; ACCENT token links (indigo render est.).
- **Notable techniques**: double-AUTO centering columns (7971–8015); char(10) headline stack (7975–7987); align START submit (8007–8011).
- **Corrections**: pane divider visible in render though showPaneDividers unset (default true) — matches; typo is in source, not a render artifact.

## forms-sidebar-for-eligibility-information.png

### Identification
- **Image**: forms-sidebar-for-eligibility-information.png | **Source page**: forms ("Sidebar for eligibility information") | **Alt/caption**: none
- **Device frame**: desktop (1999x1135)
- **Marker**: neutral
- **UI type**: form (government commerce form + eligibility sidebar)

### Use-case reconstruction (INFERRED)
- **Persona**: resident buying a fishing license on a state portal, occasional-customer (annual).
- **Domain & brand context**: state government e-commerce ("State.gov"); navy header band, civic blue accent, gray reference pane.
- **Top 3 user tasks (ranked)**: 1. Pick license type + validity term. 2. Confirm eligibility before paying. 3. Add to cart / check out.
- **Implied requirements**: "Must explain who is eligible beside the purchase" (page purpose); "Must price each validity option inline"; "Must compute last-day-of-validity from first day"; "Must offer cart AND immediate checkout from the title bar"; "Must reflow for phone" (explicit isPageWidth fork in code).
- **Data model sketch**: LicenseOrder{type:enum(Freshwater|Fresh/Saltwater), validity:enum(5-day $10|1-yr $22|2-yr $43|3-yr $65), firstDay:2021-06-14, lastDay:computed 6/18/2021, quantity:1}; EligibilityRules ×4 paragraphs.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV white (State.gov)                       ← site chrome
TITLE CARD #1A2530 pad=MORE: breadcrumb Home/… + "Order Fishing License"
  MEDIUM_PLUS BOLD · right: [ADD TO CART outline][CHECK OUT NOW solid] SECONDARY
PANE[main white]
└─ COLUMNS [empty : MEDIUM_PLUS : empty]
   ├─ About Fishing Licenses (label + legal paragraph)
   ├─ ⓘ "Processing time approximately 2-3 weeks" (ACCENT icon)
   ├─ License Type STACKED CARDS ×2 (Freshwater selected)
   ├─ License Validity STACKED CARDS ×4 ($ inline)
   ├─ SBS First Day (date, 06/14/2021) : Last Day (read-only 6/18/2021)
   └─ Number of Licenses: [−][1][+] stepper
PANE[right w=MEDIUM bg=#F5F5F7 pad=EVEN_MORE]
└─ "Who can get a license?" + 4 eligibility paragraphs #6C6C75
```
- **Above the fold**: title band, legal intro, both radio groups, dates; quantity stepper at fold edge.
- **Reading order**: F — form column then sidebar glance.
- **Hierarchy rationale**: commerce actions promoted into the dark title bar (always visible); options stacked full-width with prices inline so cost comparison is vertical; eligibility text de-emphasized to #6C6C75 in a tinted pane — consult-on-doubt, not read-first.
- **Density**: 3 — 2 radio groups (6 cards), 2 date widgets, stepper, ~5 paragraphs on screen; comfortable but full.
- **Ratios & spacing**: form column MEDIUM_PLUS centered; sidebar pane MEDIUM (~30%) padding:"EVEN_MORE"; radios choiceLayout:"STACKED" choiceStyle:"CARDS"; marginBelow:"MORE" rhythm (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED lines 8126–8583)
- **Palette**: title card style:"#1A2530"; sidebar backgroundColor:"#F5F5F7"; eligibility text color:"#6C6C75"; breadcrumb link color:"#FFF"; info icon color:"ACCENT" (renders civic blue ≈#1467a8 est.); selected card border/dot blue (est. same); CHECK OUT NOW = SOLID color:"SECONDARY" (renders light-gray fill, dark text) beside ADD TO CART OUTLINE SECONDARY (white outline on navy).
- **Color application points**: navy band; two SECONDARY buttons on it; selection accents; one ⓘ icon. Sidebar fully desaturated.
- **Typography moves**: title MEDIUM_PLUS BOLD white over SMALL breadcrumb; sidebar H2 "Who can get a license?" SMALL SEMI_BOLD; eligibility body STANDARD #6C6C75; prices inline in choice labels ("1-year ($22)").
- **Imagery stance**: none.
- **Card treatment**: option cards (radio CARDS); stepper built from two OUTLINE icon buttons flanking a Quantity field; sidebar is a tinted pane, not a card.
- **Signature moves**: (1) Cart actions in the titleBar card — a formLayout titleBar accepts arbitrary cardLayout, so the pattern smuggles commerce chrome into a form header. (2) color:"SECONDARY" button pair calibrated for dark ground (outline + solid-gray) instead of brand-colored CTAs. (3) Price-in-label radios avoid a separate fee table. (4) Explicit a!isPageWidth(PHONE/TABLET_PORTRAIT) fork restructures the whole contents — mobile puts eligibility card FIRST (style #F5F5F7 card), desktop puts it in a right pane. (5) Computed read-only "Last Day of Validity" as richText, not a disabled field.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(titleBar: a!cardLayout(style:"#1A2530"), contents fork via a!isPageWidth); breadcrumb forEach of dynamicLink richTextItems (color #FFF); a!buttonArrayLayout(Add to Cart OUTLINE SECONDARY, Check Out Now SOLID SECONDARY); a!radioButtonField(STACKED CARDS) ×2; a!dateField + read-only richText date; quantity stepper: 2× a!buttonWidget(icon, OUTLINE) + a!textField in NARROW columns; a!pane(width:"MEDIUM", backgroundColor:"#F5F5F7", padding:"EVEN_MORE").
- Chart types: none. Interactive affordances: cart/checkout, radios, date, stepper, breadcrumb links.

### Character & judgment
- **Register**: institutional — civic navy, legal text, zero persuasion beyond inline prices.
- **Why it works**: eligibility doubt (the #1 abandonment cause for licenses) is answerable without leaving the form; the two commerce CTAs live where the eye returns (header) and survive scrolling; STACKED price cards turn a fee schedule into the input itself.
- **Why not boring**: header-as-commerce-bar; hand-built quantity stepper (no native component); mobile-first restructuring baked into the same expression rather than a separate interface.
- **Boring twin**: white form with License Type dropdown, fee table image, quantity spinner, Submit at bottom, eligibility behind a "Learn more" link.
- **What to steal**: titleBar card with SECONDARY button pair; price-in-choiceLabel; isPageWidth content fork with sidebar-becomes-top-card.
- **Risks**: #6C6C75 on #F5F5F7 ≈4.2:1 — below AA for STANDARD text (sidebar is long-form!); stepper buttons lack visible labels (icon-only, label:""); CHECK OUT NOW gray-solid can read disabled; hardcoded 2021 dates in a 2026 corpus (demo data).

### Code cross-check (forms.md lines 8126–8583)
- **Code-verified palette**: #1A2530, #F5F5F7, #6C6C75, #FFF breadcrumb; ACCENT token blue (est.).
- **Notable techniques**: breadcrumb forEach with isLast plain-text (8151–8169); SECONDARY button pair on dark (8184–8198); isPageWidth full fork (8213+ mobile / 8388+ desktop per scan); mobile-order eligibility card first (8218–8249).
- **Corrections**: white top utility bar is site chrome, not in code; desktop fork confirmed pane MEDIUM #F5F5F7 EVEN_MORE (scan lines ~8545–8573).

## forms-sidebar-with-contextual-form-pane.png

### Identification
- **Image**: forms-sidebar-with-contextual-form-pane.png | **Source page**: forms ("Sidebar with contextual form pane") | **Alt/caption**: none
- **Device frame**: desktop (1999x973) — page warns this targets "relatively wide monitors"
- **Marker**: neutral
- **UI type**: form (three-zone triage: decorative rail + source evidence + form pane)

### Use-case reconstruction (INFERRED)
- **Persona**: AR/case intake operator triaging email-originated cases, daily-operator — high volume, verify-then-submit.
- **Domain & brand context**: finance back-office (invoice disputes) on the appian-indigo brand.
- **Top 3 user tasks (ranked)**: 1. Verify auto-extracted case fields against the source email. 2. Correct type/priority/description. 3. Open the case.
- **Implied requirements**: "Fields auto-populated from the email must be verified before submit" (sidebar copy states it); "Source email must be visible beside the editable fields"; "Must show extraction provenance (Referral Email header)"; "Wide-screen layout; redesign for small screens" (page caveat).
- **Data model sketch**: Case{type:enum(Question|Incident|Problem|Feature Request|Refund), title:"Discrepancy in Payment for Invoice #8423", status:Open, priority:Medium, description, createdBy:loggedInUser, docs}; SourceEmail{subject, channel:"Referral Email", from:John Doe, to:jane.doe@email.com, sentAt Jul 17 2025 05:44, body}.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV navy (Boreas-style appian chrome)
SIDEBAR-TEMPLATE [far-left ≈21%, bg=#020A50]: illustration + "Open a New Case"
  + verify instruction
PANE[center, bg=#FAFAFC pad=NONE]
├─ CARD TRANSPARENT: ✉ stamp #DCDCE5 + subject SMALL SEMI_BOLD + "Referral Email" #6C6C75
├─ ── horizontalLine ──
└─ CARD TRANSPARENT > CARD(shadow, borderless, pad=MORE):   ← floating email
   JD stamp #E9EDFC/#08088D · "John Doe to jane.doe@email.com" + timestamp
   · 5 body paragraphs
PANE[right w=MEDIUM_PLUS pad=STANDARD]  ← the actual form
├─ Case Type ▾ · Title* (prefilled) · Status ▾ Open · Priority ▾ Medium
├─ Description (rich editor, prefilled) · Created By (user picker chip)
└─ Supporting Documents (icon upload)
FOOTER divider: CANCEL outline ←→ OPEN CASE solid
```
- **Above the fold**: all three zones; email body fully readable; form fully visible.
- **Reading order**: F across three zones — orient (navy rail) → evidence (email) → action (form).
- **Hierarchy rationale**: the form pane is rightmost per the sidebar-reference convention INVERTED — here the middle pane is reference and the form hugs the right edge near the submit button; subject line is the only SEMI_BOLD heading in the center; the shadowed email card floats as "document" against flat panes.
- **Density**: 3 — 7 form fields + full email + rail; compact LESS margins in the form stack (marginAbove:"LESS" CODE-VERIFIED).
- **Ratios & spacing**: rail ≈21%, email pane flexible ≈45%, form pane width:"MEDIUM_PLUS" ≈34%; email card padding:"MORE"; form pane padding:"STANDARD".

### Styling specifics (CODE-VERIFIED lines 9637–9845)
- **Palette**: sidebar backgroundColor:"#020A50"; center pane backgroundColor:"#FAFAFC"; envelope stamp #DCDCE5/#6C6C75 (SEMI_ROUNDED); avatar stamp #E9EDFC/#08088D; metadata text #6C6C75; email card white + shadow; OPEN CASE/CANCEL indigo ≈#2322f0 (est., theme accent); nav navy (est. site chrome).
- **Color application points**: navy rail; two pastel stamps; accent only on buttons/required marks/upload icon. The evidence zone is deliberately grayscale.
- **Typography moves**: subject headingField size:"SMALL" fontWeight:"SEMI_BOLD"; provenance + timestamp SMALL #6C6C75; email body STANDARD with blank-line paragraphs (repeat(2, char(10))); form labels STANDARD bold.
- **Imagery stance**: flat illustration in the navy rail (documents motif); none elsewhere.
- **Card treatment**: three-layer trick — TRANSPARENT outer cards on #FAFAFC, inner email card showBorder:false + showShadow:true = floating paper.
- **Signature moves**: (1) formLayout titleBar=sidebarTemplate PLUS contents=paneLayout — composing two sidebar idioms into a 3-zone triage bench. (2) Shadow reserved exclusively for the source document (only showShadow:true on the page). (3) Prefilled Title/Description/Status/Priority values demonstrate extraction; sidebar copy instructs verification — UI + copy jointly encode the AI-assisted workflow. (4) SEMI_ROUNDED envelope stamp as a channel badge ("came in by email").
- (5) buttonDisplay:"ICON" upload keeps the dense form stack short.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!formLayout(titleBar: a!sidebarTemplate(backgroundColor:"#020A50", image), showTitleBarDivider:false, showButtonDivider:true); a!paneLayout(pane #FAFAFC padding NONE + pane MEDIUM_PLUS); a!cardLayout(style:"TRANSPARENT") ×2; inner card(showBorder:false, showShadow:true, padding:"MORE"); a!stampField(SEMI_ROUNDED envelope; JD initials); a!horizontalLine(marginBelow:"LESS"); form: a!dropdownField ×3, a!textField(required, prefilled), a!styledTextEditorField(prefilled), a!pickerFieldUsers(value:loggedInUser()), a!fileUploadField(buttonDisplay:"ICON"); Open Case SOLID / Cancel OUTLINE.
- Chart types: none. Interactive affordances: full form stack; email read-only; user picker chip removable.

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — a verification bench, not a marketing form.
- **Why it works**: evidence and inputs share one eyeline so verification is a saccade, not a tab-switch; the shadowed "paper" metaphor instantly types the middle zone as source material; prefilled fields shift the task from typing to checking — matching the persona's actual job.
- **Why not boring**: three materially distinct grounds (navy / #FAFAFC / white) zone the page without a single border line; channel-badge stamp; floating email card. 
- **Boring twin**: a form with a "View source email" link or collapsed accordion above it; extraction results dumped into helper text; single white column.
- **What to steal**: TRANSPARENT-wrapper + shadowed-inner-card document metaphor; sidebarTemplate+paneLayout 3-zone composition; prefill-then-verify copywriting in the rail.
- **Risks**: page itself flags small screens — three zones cannot reflow gracefully (panes stack, burying the form); email pane has no scroll affordance for long threads; #6C6C75 metadata on #FAFAFC ≈4.5:1 borderline; OPEN CASE sits under the form pane but CANCEL is far left — wide gap between paired actions on ultrawide.

### Code cross-check (forms.md lines 9637–9845)
- **Code-verified palette**: #020A50, #FAFAFC, #DCDCE5/#6C6C75, #E9EDFC/#08088D.
- **Notable techniques**: TRANSPARENT card wrappers (9691, 9767); shadow-only inner card (9762–9764); pickerFieldUsers loggedInUser() (9817–9821); buttonDisplay ICON upload (9823–9827); sidebarTemplate + paneLayout combo (9638–9647).
- **Corrections**: none — render matches code; note #020A50 here vs #020A51 elsewhere in the corpus (two near-identical navy hexes in the demo family).

## Cross-references

- `ESG_conference_registration_portal.png` also appears on this page ("Sidebar for whole-form, contextual information", line 8588) but is analyzed under its primary page (`corpus/analysis/conference-registration-portal.md`). The forms-page context adds one rule worth keeping: sidebars whose options AFFECT the whole form go LEFT; passive reference sidebars go RIGHT (contrast with `forms-sidebar-for-contextual-information-simple.png`).
- `auto_insurance_quote_wizard_step_1.png` and `auto_insurance_quote_wizard_final_step.png` (same INSURECORP app) are analyzed in `corpus/analysis/ins-quote-wizard-1.md` / `ins-quote-wizard-2.md`; palette/token findings are consistent (ACCENT ≈#af2b9b est., #73245d brand bar, #333 base).
