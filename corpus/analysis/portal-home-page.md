# Analysis: portal-home-page

## portal_home_page.png

### Identification
- **Image**: portal_home_page.png | **Source page**: portal-home-page (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) portal home page"
- **Device frame**: desktop (3360x2100, 2x retina — one viewport; page continues below crop)
- **Marker**: neutral
- **UI type**: portal / landing-page (public nonprofit home; tier A confirmed)

### Use-case reconstruction (INFERRED)
- **Persona**: prospective donor to a conservation nonprofit; first-time-public, visits rarely, one decision: care, then give.
- **Domain & brand context**: "Boreas Foundation" — Antarctic conservation NGO. Cinematic-documentary brand: monochrome photography, tracked-out white type, one gold accent, polar-bear logo in blue-to-gold gradient.
- **Top 3 user tasks (ranked)**: 1. Absorb the cause ("Antarctica needs help"). 2. Donate (quick-pick gift, below the fold). 3. Explore the org — How to Help / Our Story / Contact Us.
- **Implied requirements**: "The cause statement must own the first viewport"; "Navigation must live inside the hero, not a chrome bar"; "Programs must read as three equal pillars"; "Donation must be a one-screen quick-pick, not a form journey."
- **Data model sketch**: static marketing content — Organization (name, logo); NavTab ×4; Pillar ×3 (photo, icon, title, description: Conservation / Research / Education); GiftAmount ×6 ($5–$250 + Other, $25 preselected); FooterLink ×7. No records or grids.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT contentsPadding=NONE
├─ BILLBOARD h≈610 (EXTRA_TALL) media=photo(monochrome Antarctic peak) overlay=full,SEMI_DARK
│  ├─ COLUMNS [NARROW_PLUS:AUTO:MEDIUM_PLUS] — logo | spacer | TABS ×4 (transparent cards, white)
│  └─ "A N T A R C T I C A   N E E D S   H E L P" EXTRA_LARGE white centered, char(10)×9 push-down
├─ CARD(band #f3f3f3, padding=MORE) SECTION "What We Do"
│  ├─ gold rule (EXTRA_NARROW empty card, decorativeBar TOP=ACCENT) + "What We Do" LARGE centered
│  └─ CARD-GROUP cardWidth=NARROW ×3 — each: BILLBOARD h=SHORT + stamp + title + centered body
├─ CARD(band #fcfcfc) — donation: COLUMNS [1:1] "Start Helping Today" + radio CARDS + Donate | photo  [below crop]
└─ CARD(band #111, decorativeBar TOP #351c75) — footer: logo | links ×4 | links ×3  [below crop]
```
- **Above the fold**: hero (≈58% of viewport) with logo, 4 tabs, headline; then gold rule, "What We Do", and all three cards, clipped mid-body-copy at the crop. Donation band and footer are CODE-VERIFIED only.
- **Reading order**: single-column center axis; Z across the top bar, then straight down the centerline.
- **Hierarchy rationale**: photo+headline monopolize the viewport — emotion precedes information (task 1); the three pillars are structurally identical, so no program outranks another; color is withheld above the fold, saving the accent for the Donate flow.
- **Density**: 1 — marketing-airy: one idea per screen, hero ≈58% of viewport, three content cards, zero data zones.
- **Ratios & spacing**: hero nav COLUMNS [NARROW_PLUS:flex:MEDIUM_PLUS]; bands center a WIDE_PLUS column between empty flex columns; band padding "MORE"; inter-band margins "NONE" (full-bleed butt joints).

### Styling specifics (OBSERVED; CODE-VERIFIED where marked)
- **Palette**: CODE-VERIFIED — billboard fallback #f0f0f0; bands #f3f3f3, #fcfcfc, #111 + #351c75 bar; hero/nav text #ffffff. Theme "ACCENT" renders gold #eac251 (est.) on the section rule; card bg #ffffff (est.); body text #222222 (est.); SEMI_DARK scrim over a near-monochrome photo (#36383d est. midtones).
- **Color application points**: gold appears exactly twice above the fold — logo gradient and section rule; all else is white-on-photo or near-black-on-gray. Below crop (code): ACCENT bar beside "Start Helping Today", SOLID Donate button, purple footer bar.
- **Typography moves**: headline EXTRA_LARGE white all-caps, letter-spaced with literal spaces, stepping EXTRA_LARGE → LARGE_PLUS → LARGE by breakpoint (CODE-VERIFIED); nav tabs MEDIUM white, selected = STRONG + underline; "What We Do" LARGE; card titles MEDIUM + STRONG; body STANDARD centered.
- **Imagery stance**: photography-led — monochrome hero plus three SHORT color billboards (penguins, iceberg arch, blue-lit auditorium); icons only as TINY ring-stamps (leaf, microscope, chalkboard-teacher) in STANDARD dark.
- **Card treatment**: pillar cards flat white (style:"NONE"), padding:"NONE", image flush to the card top; nav tabs are TRANSPARENT borderless cards; bands are full-width self-colored cards (showBorder:false).
- **Signature moves**: instead of a site header bar, transparent card tabs inside the billboard overlay; instead of a tab-underline style, an empty EXTRA_NARROW card with showBorder:true draws the selected indicator; instead of one white page, three full-bleed card bands (#f3f3f3 → #fcfcfc → #111) via contentsPadding:"NONE"; instead of an imageField in the card, an inner billboardLayout(height:"SHORT", marginBelow:"NONE") gives edge-to-edge media.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(contentsPadding:"NONE"); a!billboardLayout(height:"EXTRA_TALL", overlay:a!fullOverlay(style:"SEMI_DARK")) + ×3 height:"SHORT" inside cards; a!cardLayout as tabs (style:"TRANSPARENT", link:a!dynamicLink), as bands (style:"#f3f3f3"/"#fcfcfc"/"#111", padding:"MORE"), as flush pillars (style:"NONE", padding:"NONE"); a!cardGroupLayout(cardWidth:"NARROW"); a!stampField(backgroundColor:"TRANSPARENT", contentColor:"STANDARD", size:"TINY"); breakpoint-gated headline richTextDisplayFields; a!imageField logo; below crop: a!radioButtonField(choiceStyle:"CARDS"), a!buttonWidget(size:"LARGE", style:"SOLID"), a!linkField/a!safeLink ×7.
- Charts: none. Interactive affordances: 4 card-as-link tabs, donation radio+button, 7 footer links; no filters, search, or record actions.

### Character & judgment
- **Register**: premium-editorial + warm-community — cinematic monochrome photography and tracked-out type in service of a donate-to-help mission.
- **Why it works**: SEMI_DARK over an already-dark peak keeps #ffffff type legible anywhere in the frame; the grayscale hero makes the three color card photos land as the first "life" on the page; identical stamp/title/body anatomy across the cards reads as one institution, not a menu.
- **Why not boring**: navigation lives inside the hero image (transparent card tabs + hand-drawn underline) — no chrome bar at all; letter-spaced EXTRA_LARGE headline positioned by nine char(10)s and swapped per breakpoint; full-bleed gray→white→near-black banding; flush-image cards with ring-stamp icons instead of bordered thumbnails-in-boxes.
- **Boring twin**: dark site-header bar with left logo and default tabs; "Antarctica Needs Help" as a LARGE left-aligned title on white; three bordered sectionLayouts with thumbnail imageFields and left-aligned text; a labeled dropdown for gift amount; stacked footer links on white.
- **What to steal**: band a long public page with full-width self-colored cardLayouts under contentsPadding:"NONE"; build flush-media cards from padding:"NONE" + inner SHORT billboard + padded TRANSPARENT inner card; mark a hand-rolled selected tab with an empty bordered EXTRA_NARROW card, mirroring state into accessibilityText.
- **Risks**: char(10)×9 positioning is brittle (zoom, translation; screen readers announce blank lines); PHONE headline uses color:"STANDARD" — dark text over the darkened photo risks contrast failure; tab state lives only in accessibilityText; nav stacks only at PHONE/TABLET_PORTRAIT, so DESKTOP_NARROW may crowd four tabs.

### Code cross-check (guidance/sail/sources/portal-home-page.sail)
- **Code-verified palette**: #f0f0f0 (billboard fallbacks, L7/366/417/468); #ffffff (nav + headline, L53–235); #f3f3f3 + #efefef bar (L530/534); #fcfcfc + #efefef (L644/648); #111 + #351c75 (L777/782). Gold is NOT in the expression — the rule (L338) and Donate button (L591) take the theme ACCENT.
- **Notable techniques**: card-as-tab nav with accessibilityText state (L44–207), selected underline from an empty showBorder:true card in an EXTRA_NARROW column (L69–89); centered gold rule from decorativeBarPosition:"TOP" on an empty transparent card (L330–341); breakpoint-gated headlines with manual letter-spacing and char(10) stacks (L219–313); full-bleed banding via contentsPadding:"NONE" + self-colored band cards centering a WIDE_PLUS column (L319–784).
- **Corrections**: the gold rule pixel-reads #eac251 but is theme ACCENT, not hard-coded; the "tab underline" is a card border, not a text style; the ring around each pillar icon is the TRANSPARENT stamp rendering, not a custom border; the card photos are billboardLayouts, not imageFields.
