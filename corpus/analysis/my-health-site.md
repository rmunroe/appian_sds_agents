# Analysis: my-health-site

## my-health-site.png

### Identification
- **Image**: my-health-site.png | **Source page**: my-health-site | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) my health site"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal (consumer patient-portal home)

### Use-case reconstruction (INFERRED)
- **Persona**: patient ("Brittany", female, 25) — occasional-customer; logs in between visits to check appointments and records, no operational cadence.
- **Domain & brand context**: outpatient healthcare network ("Community Health Partners" in site chrome, OBSERVED); retail-health consumer brand — clinical teal warmed by a magenta accent, closer to a walk-in-clinic app than a hospital EHR.
- **Top 3 user tasks (ranked)**: 1. Request an appointment. 2. Confirm upcoming appointment logistics (when / with whom / where). 3. Browse own record categories (meds, allergies, labs) and drill in.
- **Implied requirements**:
  - Must offer "Request Appointment" without scrolling or hunting.
  - Must show the next appointments with provider and full street address, zero clicks.
  - Must compress each health-record category to one scannable line with a drill-in affordance.
  - Must feel personal and reassuring (greeting + photo), not administrative.
  - Must keep long clinical strings from breaking card alignment.
- **Data model sketch**: Patient(name, sex, DOB, photo) 1—* Appointment(type, datetime, provider+credential, practice, address1–3); Patient 1—* per category — Condition, Allergy(+reaction), Medication(+dose), Immunization, Procedure, LifestyleFactor, LabResult — each surfaced as a concatenated summary string (OBSERVED from card secondary text).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#F0F6F7
├─ CARD(header slot, style=#0E3842, showBorder=false, padding=STANDARD)
│  └─ SBS [avatar MEDIUM_PLUS | H1 greeting + icon demographics | CTA solid #C22966] align=MIDDLE spacing=SPARSE
└─ PANE[left NARROW_PLUS bg=#F0F6F7 | center AUTO bg=white] dividers=none
   ├─ SECTION "Upcoming Appointments"
   │  ├─ CARD ×3 (SEMI_ROUNDED, border #DCE6E8, padding STANDARD)
   │  └─ BUTTON "View All Appointments" outline, centered
   └─ SECTION "My Health"
      └─ CARD(border #DCE6E8, padding NONE)
         └─ TABS ×6 (Health Summary active)
            └─ GRID(2-col via cardGroup cardWidth=NARROW_PLUS) ×7 cards, decorative bar START #1E798F
```
- **Above the fold**: everything — header band, all 3 appointment cards plus button, all 7 summary cards; the whole page fits one viewport with no scroll.
- **Reading order**: F — band left→right (identity → CTA), then down the left rail, then the card grid.
- **Hierarchy rationale**:
  - Greeting is the largest text: identity confirmation comes first in a personal-health context.
  - The only saturated solid on the page (#C22966 CTA) maps to task 1 and sits isolated on dark teal.
  - Time-sensitive appointments take the first-read left column; reference records get the wide pane.
- **Density**: 3 — ~10 cards + 6 tabs in a single no-scroll viewport with STANDARD padding everywhere; consumer-calm end of 3.
- **Ratios & spacing**: panes ≈ [NARROW_PLUS:AUTO] ≈ 1:4 (OBSERVED); card padding STANDARD; appointment card gaps marginBelow STANDARD; tab contentsPadding MORE; card-group gutters ≈ STANDARD.

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page + left-pane bg #F0F6F7; right pane / card bg #FFFFFF (OBSERVED — pane default, not set in code); header band #0E3842; primary accent #C22966; secondary accent #1E798F; borders #DCE6E8; muted text #6b6b6b plus SECONDARY token; site nav bar dark teal matching the band (OBSERVED, site chrome, ≈#0E3842 est.).
- **Color application points**: header band fill; hero CTA fill; 7 category icons; decorative left bars on record cards; tab underline + "View All Appointments" outline button in matching magenta (OBSERVED — site accent, not in source); metadata icons/text in grey.
- **Typography moves**: greeting H1 ≈ LARGE (OBSERVED; size defaulted) with fontWeight REGULAR — friendly, not shouty; section H2s MEDIUM SEMI_BOLD; appointment titles H3 EXTRA_SMALL SEMI_BOLD; category labels H3 SMALL SEMI_BOLD; metadata SMALL #6b6b6b; no all-caps anywhere.
- **Imagery stance**: one AVATAR-style photo (a!webImage from Unsplash, size MEDIUM_PLUS); styled FA icons as category glyphs (#C22966, MEDIUM_PLUS); small grey utility icons (user-md, building, venus, birthday-cake).
- **Card treatment**: white fill + border #DCE6E8 + shape SEMI_ROUNDED, no shadows; record cards add decorativeBarPosition "START" in #1E798F.
- **Signature moves**:
  1. Instead of a plain page title, the header slot hosts a!cardLayout(style: "#0E3842", showBorder: false) as a full-bleed personalized identity band.
  2. Instead of a read-only grid, record categories are a!cardGroupLayout tiles with a teal decorative bar, magenta icon, and chevron.
  3. Instead of leaning on the default accent, the hero CTA hard-codes #C22966 while tabs and the outline button inherit a matching site accent.
  4. Instead of wrapping long clinical strings, preventWrapping: true truncates secondary text so all tiles stay one height.
  5. Instead of pane divider lines, the left rail is separated by tint alone — pane bg = page bg #F0F6F7, showPaneDividers: false.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor: "#F0F6F7"); header slot a!cardLayout(style: "#0E3842", showBorder: false, height: "AUTO", padding: "STANDARD").
- a!sideBySideLayout(alignVertical: "MIDDLE", spacing: "SPARSE") for avatar | greeting | CTA; a!imageField(style: "AVATAR", size: "MEDIUM_PLUS").
- a!buttonWidget(label: "Request Appointment", size: "LARGE", color: "#C22966", style: "SOLID", icon: "calendar"); second a!buttonWidget defaulted to outline/accent.
- a!paneLayout(showPaneDividers: false) — a!pane(width: "NARROW_PLUS", backgroundColor: "#F0F6F7") + default-width white pane.
- a!forEach over a!localVariables a!map demo data (appointments ×3, categories ×7).
- Appointment cards: a!cardLayout(shape: "SEMI_ROUNDED", borderColor: "#DCE6E8", padding: "STANDARD", marginBelow: "STANDARD").
- a!tabLayout(6 tabs, contentsPadding: "MORE") nested in a!cardLayout(padding: "NONE", borderColor: "#DCE6E8") so the tab strip runs flush to the card edge.
- Record tiles: a!cardLayout(decorativeBarPosition: "START", decorativeBarColor: "#1E798F", marginBelow: "NONE") in a!cardGroupLayout(cardWidth: "NARROW_PLUS").
- Charts: none. Custom colorScheme: n/a.
- Interactive affordances: 6 tabs; 2 buttons; chevrons imply tappable cards — but source sets no link on any card (static demo); comments direct builders to swap in record actions.

### Character & judgment
- **Register**: calm-clinical + energetic-consumer — teal/white restraint carries the medical data while magenta injects retail energy exactly at action points.
- **Why it works**:
  - Single-accent discipline: #C22966 appears only on actionable or categorical elements, so the CTA on #0E3842 is unmissable (OBSERVED: one solid button on the whole page).
  - Repeated card grammar (border #DCE6E8 + SEMI_ROUNDED + teal bar + magenta icon) lets 7 dissimilar categories scan as one system.
  - Left rail carries time-ordered logistics with full addresses; reference data sits right — matching the "check my visit, then browse" flow.
- **Why not boring**:
  - Dark-teal #0E3842 band with a REGULAR-weight conversational greeting instead of a bold "Patient Dashboard" title.
  - Magenta-on-teal complementary pairing — sidesteps the healthcare-blue cliché.
  - Icon+text demographic micro-row (venus, birthday-cake, "•" separator) instead of a labeled field grid.
  - Teal decorative edge bar stitching brand onto every record tile.
- **Boring twin**: A white page titled "Patient Portal" with appointments in a read-only grid (Date / Provider / Location columns) and the health summary as a two-column label-value a!columnsLayout. Default blue outline buttons, unstyled tabs, no header band, no icons — technically identical data, zero warmth.
- **What to steal**: 1. Style the header-slot card with a brand hex for an instant masthead. 2. Use cardGroupLayout + decorative bars + chevrons to turn categorical drill-downs into tappable tiles. 3. Match hard-coded CTA color to the site accent so defaults (tabs, outline buttons) harmonize for free.
- **Risks**: magenta fill vs. dark teal band has low mutual contrast (≈2:1 est.) — the white label carries the button; preventWrapping truncates clinically meaningful text (medication list cut mid-word) so drill-in must exist; 6 tabs will crowd or overflow on tablet; icon-only venus glyph is weak semantics for screen readers; #6b6b6b SMALL metadata on white is near the 4.5:1 floor.

### Code cross-check
- **Code-verified palette**: #0E3842 (header band), #C22966 (CTA + category icons), #1E798F (decorative bars), #F0F6F7 (page + left pane bg), #DCE6E8 (all card borders), #6b6b6b (muted text), SECONDARY token (tile secondary text).
- **Notable techniques** (guidance/sail/sources/my-health-site.sail):
  - L3–88: header slot = a!cardLayout(style: "#0E3842", showBorder: false) wrapping one sideBySideLayout — the entire masthead is one card.
  - L91–97: a!paneLayout(showPaneDividers: false) with left pane bg equal to page bg — tint-only zoning.
  - L235–372: a!tabLayout inside a!cardLayout(padding: "NONE") for a flush, bordered tab card.
  - L283–351: forEach → uniform record tiles via decorativeBarPosition/decorativeBarColor + preventWrapping (L320).
  - L191–196: address join with a!isNullOrEmpty guard for optional suite line.
  - L64, L215: comments instruct swapping demo buttons for record actions — explicit template intent.
- **Corrections**: tab underline and "View All Appointments" magenta come from site-level accent config, not this source; right pane white is the pane default, not an explicit #FFFFFF; the top nav bar is site chrome, distinct from the coded header band; record tiles and appointment cards have no link params — the chevron affordance is aspirational in the demo.
