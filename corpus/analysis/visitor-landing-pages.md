# Analysis: visitor-landing-pages

Page context: "Visitor Landing Pages" (section: patterns) — welcoming first-time/occasional visitors, organized around two questions: direction (how many calls-to-action?) and branding. Two images analyzed here, both with full SAIL on the page: a single-CTA insurance quote landing and a multi-CTA dark-theme outage center. The page's third image, `portal_home_page.png` ("Informational landing pages" heading), is analyzed under its primary page — its SAIL lives here too (billboard: unsplash photo, backgroundColor "#f0f0f0", height "EXTRA_TALL"), a useful cross-ref for informational-variant styling.

## auto_insurance_portal_landing_page.png

### Identification
- **Image**: auto_insurance_portal_landing_page.png | **Source page**: visitor-landing-pages | **Alt/caption**: none (heading: "Primary call-to-action")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page — public quote-acquisition page, step 1 of an embedded wizard
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: prospective auto-insurance shopper, first-time-public visitor arriving from ads/search
- **Domain & brand context**: "INSURECORP" consumer insurance — here in a deep plum/magenta brand theme (contrast the blue INSURECORP account portal on the secondary-navigation page: same fictional brand, different sub-brand palette)
- **Top 3 user tasks (ranked)**: 1. Start a quote by entering a ZIP code (the page's single CTA) 2. Absorb reassurance/context (tagline, coverage list, photos) 3. Read data-use disclaimers
- **Implied requirements**: "Exactly one call-to-action, visually unmistakable" (page text: 'create a clear focus'); "Context must surround, not compete with, the CTA"; "Quote entry must be trivially low-friction (one 5-digit field)"; "Legal data-use language must be present but subordinate"; "Brand imagery must show relatable drivers"
- **Data model sketch**: QuoteRequest{zipCode (5-digit), → step 2 bundleSelections[]}; coverage catalog shown as static list: Liability, Uninsured/Underinsured Motorist, Comprehensive, Collision, Medical Payments, Personal Injury Protection

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ site bar (#6d2158 est., INSURECORP shield logo)
├─ COLUMNS [WIDE:WIDE] band 1 on #efefef
│  ├─ PANE[left] headline + CARD(white, magenta top bar: centered prompt + ZIP field + GET STARTED) + disclaimers ×2
│  └─ PANE[right] photo (woman driving convertible)
└─ COLUMNS [WIDE:WIDE] band 2
   ├─ PANE[left] photo (father + teen driver)
   └─ PANE[right] #73245d panel: "Get just the right amount of coverage…" + ✓ list ×6
(below fold per code: #333 TALL band + stamp-icon info row — piggy-bank ACCENT, portrait #d9d9d9)
```
- **Above the fold**: band 1 complete (headline, quote card, disclaimers, photo) + most of band 2
- **Reading order**: Z — headline → quote card → photo, then photo → checklist across band 2
- **Hierarchy rationale**: the white quote card is the only elevated surface on the gray band and carries the only warm accent (magenta bar) — single-CTA focus per the pattern; headline sits directly above it so value proposition feeds the action; checklist band ranks below as reassurance, not action
- **Density**: 1 — marketing-airy: one idea per band, LARGE type, photos occupying half of each band
- **Ratios & spacing**: both bands split [WIDE:WIDE] ≈1:1; quote card padding ≈ MORE with marginBelow "MORE" after headline; ZIP input + button row centered in a MEDIUM sub-column (CODE-VERIFIED width:"MEDIUM"); checkerboard alternation (text/photo, photo/text)

### Styling specifics (CODE-VERIFIED)
- **Palette**: band 1 + header cards style "#efefef"; quote card #ffffff with decorativeBarPosition:"TOP", decorativeBarColor:"#BF04A0"; checklist panel style "#73245d" with white text; headline/prompt color "#434343"; disclaimers "#666666"; below-fold band "#333"/backgroundColor "#333"; site bar plum #6d2158 (est., chrome); GET STARTED = OUTLINE button rendering magenta text/border ≈#a12588 (est., site accent)
- **Color application points**: magenta at exactly two spots above the fold — the card's top bar and the OUTLINE button — both pointing at the CTA; plum panel saturates only the reassurance band; photos supply all other color; grays carry every word except the checklist
- **Typography moves**: headline LARGE STRONG #434343 (dark gray, not black — softened); card prompt MEDIUM STRONG centered; disclaimers SMALL #666666; checklist items MEDIUM_PLUS white with check-circle icons MEDIUM_PLUS; panel heading MEDIUM_PLUS STRONG white
- **Imagery stance**: two large lifestyle photos (webImage, size:"FIT", each in a WIDE column) — relatable drivers, no stock-office clichés; below-fold stamp icons (piggy-bank on ACCENT, portrait on #d9d9d9, size TINY)
- **Card treatment**: quote card = white, showBorder:false, decorative top bar (the elevation cue); band cards flat #efefef/#73245d fills, no borders
- **Signature moves**: instead of a hero billboard with overlay text, a checkerboard of half-photo bands keeps text on solid calm fields; instead of a SOLID CTA button, OUTLINE — the white card + magenta bar already isolate the CTA, so the button can whisper; the landing page *is* step 1 of a wizard (choose(local!stepNumber…) with GET STARTED saving stepNumber:2) — no page transition to start converting; ZIP field labelPosition COLLAPSED with instructive placeholder ("Enter your 5-digit ZIP code") keeps the card to three lines

### Component inventory (CODE-VERIFIED)
- a!localVariables(zipCode, stepNumber, bundleSelections, showSaveForLater) + choose() wizard shell; a!headerContentLayout; a!cardLayout bands (#efefef, #73245d, #333); quote card a!cardLayout(decorativeBarPosition:"TOP", decorativeBarColor:"#BF04A0") → a!textField(labelPosition:"COLLAPSED", placeholder, refreshAfter:"UNFOCUS") + a!buttonArrayLayout(a!buttonWidget("Get Started", style:"OUTLINE", size:"STANDARD", value:2, saveInto:stepNumber)) in a!sideBySideLayout(alignVertical:"MIDDLE"); a!imageField(a!webImage, size:"FIT") ×2; check-circle richText list ×6; a!stampField icons below fold
- Chart types: none
- Interactive affordances: single text input + single button (deliberate); wizard steps 2+ (bundle selection, save-for-later) hidden behind choose()

### Character & judgment
- **Register**: energetic-consumer + institutional — friendly marketing surfaces with insurance-grade restraint
- **Why it works**: one CTA, triple-signposted (only white card, only decorative bar, only button) exactly implements the pattern's "clear focus"; alternating photo/solid checkerboard gives brand warmth without ever putting text on imagery (no contrast risk); the six-check plum panel answers "why bother" adjacent to the ask
- **Why not boring**: magenta decorative bar as CTA spotlight; OUTLINE (not shouting SOLID) primary button that still wins by isolation; checkerboard instead of hero-billboard; quote wizard embedded in the landing page itself
- **Boring twin**: full-width stock-photo billboard with dark overlay, white H1, a SOLID "GET A QUOTE" button, then three icon-feature columns and a footer — the CTA competing with the photo and the features competing with the CTA.
- **What to steal**: decorativeBarColor as a cheap CTA spotlight; isolate the CTA as the page's only elevated white card; collapse form labels into placeholders on public pages; keep step 1 of conversion on the landing page
- **Risks**: OUTLINE magenta on white ≈ 4.6:1 — acceptable but thin at STANDARD size; placeholder-as-label vanishes on focus (a11y); photo-heavy bands cost load time on the exact audience (new visitors) least committed to waiting; below-fold #333 band shifts tone abruptly

### Code cross-check
- **Code-verified palette**: #efefef bands, #BF04A0 bar, #434343/#666666 text grays, #73245d panel, #333 lower band, white quote card
- **Notable techniques**: choose()-driven wizard in one interface (~line 35); decorative-bar CTA card; a!isPageWidth-independent WIDE/WIDE checkerboard; empty flanking columnLayouts centering the MEDIUM form column
- **Corrections**: none — pixels match code (button renders site-accent magenta; no explicit color param)

## image56.png

### Identification
- **Image**: image56.png | **Source page**: visitor-landing-pages | **Alt/caption**: none (heading: "Multiple calls-to-action")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page — public utility outage center with three routed CTAs
- Tier A as listed; no override.

### Use-case reconstruction (INFERRED)
- **Persona**: utility customer mid-outage (possibly on a phone, in the dark), occasional-customer under stress
- **Domain & brand context**: "Wyndhamm Power" — electric utility; black-and-white wind-turbine imagery, dark theme the page text says "represents the brand"
- **Top 3 user tasks (ranked)**: 1. Report an outage 2. Check/cancel an existing report 3. Browse confirmed outages; secondary: footer self-service (Pay My Bill, Set Up New Service, Customer Service, green-energy info)
- **Implied requirements**: "Steer visitors among a small set of common actions" (page text); "Each CTA needs a one-line explainer"; "Report flow must open without leaving the page"; "Apologetic, human tone"; "Footer must absorb every non-outage task"
- **Data model sketch**: OutageReport{type ∈ home | business | traffic-signal (hidden chooser cards: house-damage/store/traffic-light icons), status}; report lookup; confirmed-outage list; footer link taxonomy ×7

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
BILLBOARD h=AUTO(desktop)/EXTRA_TALL overlay=full,dark bg=#000+turbine photo
├─ logo top-right (white wordmark)
├─ PANE[left ≈1/3]
│  ├─ "OUTAGE CENTER" (LARGE, thin caps, white)
│  ├─ apology line + STRONG "How can we help?"
│  └─ caption→button ×3: REPORT OUTAGE ⚠ / CHECK STATUS 🕐 / BROWSE REPORTS 🗺 (SOLID LARGE, full-width)
│     (hidden state showReport: "Report an Outage" chooser — 3 icon cards + Cancel LINK)
└─ FOOTER black band: logo + link columns ×2 (Wyndhamm Home, Set Up New Service, Pay My Bill,
   Customer Service | About Green Energy, Our Carbon Neutral Plan, Reducing Your Energy Use)
```
- **Above the fold**: entire action stack + imagery; footer at fold edge
- **Reading order**: F confined to the left third — title, apology, then three caption/button pairs; turbines fill the remaining two-thirds as atmosphere
- **Hierarchy rationale**: three equal-weight SOLID buttons (same size, same blue) because the pattern's premise is a *choice* among peers — ranking is by order, not emphasis; captions sit above their buttons so the explainer is read before the label; everything non-urgent is exiled to the footer
- **Density**: 1 — marketing-airy: one decision, huge negative space (dark sky)
- **Ratios & spacing**: action column ≈ 1/3 viewport width, left-aligned; buttons full column width, ≈56px tall (LARGE), even vertical rhythm ≈ STANDARD gaps; heading marginAbove "EVEN_MORE" (CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED core)
- **Palette**: billboard backgroundColor "#000" under a grayscale turbine photo (a!fullOverlay, dark scrim); buttons SOLID accent blue ≈#3b73de (est.; no color param — site accent); white text #ffffff; captions white STANDARD; footer band black with link-blue ≈#4285d0 (est.) items; hidden chooser cards style "#000", height "MEDIUM"
- **Color application points**: blue exists solely on the three CTAs (+footer links) — on a monochrome page the action color is unmissable; no semantic reds despite the outage domain (calm, not alarm)
- **Typography moves**: "OUTAGE CENTER" LARGE, style "STANDARD" (thin, all-caps — display voice); body line with inline STRONG pivot ("How can we help?"); button labels caps-rendered LARGE with leading icons (exclamation-triangle, clock, map-marked); captions sentence-case STANDARD
- **Imagery stance**: single full-bleed b/w photograph as brand atmosphere (page text: "dramatic look"); glyph icons inside buttons; no illustrations
- **Card treatment**: none visible — the billboard overlay hosts bare fields; hidden report-chooser uses #000 icon cards (borderless) + Cancel LINK button
- **Signature moves**: instead of one hero CTA, a stacked triad of equal SOLID buttons each pre-explained by a caption line — direction without hierarchy games; instead of navigating away, REPORT OUTAGE flips local!showReport to swap the billboard overlay content into a type-chooser (house-damage/store/traffic-light cards) — progressive disclosure inside the hero; monochrome photo + single accent hue = brand drama with zero legibility tax; height AUTO on wide desktops but EXTRA_TALL below (a!isPageWidth) so the billboard always fills

### Component inventory (CODE-VERIFIED)
- a!billboardLayout(backgroundMedia: a!documentImage placeholder, backgroundColor:"#000", height: if(a!isPageWidth({DESKTOP_WIDE, DESKTOP}), "AUTO", "EXTRA_TALL"), marginBelow:"NONE", overlay: a!fullOverlay()); caption richText + a!buttonWidget(style:"SOLID", size:"LARGE", icon: exclamation-triangle | clock | map-marked) ×3; showWhen: local!showReport swap to chooser (3 × a!cardLayout(style:"#000", height:"MEDIUM", link: a!dynamicLink) with LARGE_PLUS richTextIcons + Cancel a!buttonWidget(style:"LINK")); footer link columns
- Chart types: none
- Interactive affordances: 3 primary buttons; in-place report chooser (3 linked cards + cancel); 7 footer links

### Character & judgment
- **Register**: urgent-triage + premium-editorial — a triage desk staged on brand-book photography
- **Why it works**: caption-above-button pairs let a stressed user disambiguate before reading button caps; equal-weight triad matches real intent distribution (report/check/browse) instead of forcing a fake primary; the black canvas makes three blue rectangles the only saturated objects — findable at a glance, even on a phone in a dark house
- **Why not boring**: apology-first microcopy ("We're sorry that you're having trouble…") on an enterprise pattern; monochrome-photo-plus-one-hue discipline; hero that transforms into the form (overlay swap) rather than linking out
- **Boring twin**: white page, centered H1 "Outage Center", three icon feature-cards ("Report", "Status", "Map") with small OUTLINE buttons, hero photo in a rounded card up top — action buried in card chrome, no tonal drama.
- **What to steal**: caption→button pairing for multi-CTA pages; monochrome imagery to spotlight a single accent; showWhen overlay-swap for in-hero flows; exile secondary tasks to a fat footer
- **Risks**: white STANDARD captions on photo mid-tones depend on the dark scrim (turbine blades cross behind text at some widths); three LARGE buttons stack tall on phones (EXTRA_TALL guard helps); footer link blue on black ≈ 4.8:1 (est.) — near the floor; placeholder documentImage means real deployments must re-verify overlay contrast

### Code cross-check
- **Code-verified palette**: #000 billboard/footer/chooser cards; SOLID LARGE accent buttons (no explicit hex); white text
- **Notable techniques**: if(a!isPageWidth…) billboard height (~line 2700); a!fullOverlay hosting the whole interactive column; local!showReport two-state hero; icon'd buttonWidgets as router
- **Corrections**: none — pixels match code (button blue comes from site accent, not expression)
