# Analysis: conference-home-page

## ESG_conference_portal_home.png

### Identification
- **Image**: ESG_conference_portal_home.png | **Source page**: conference-home-page (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) conference home page"
- **Device frame**: desktop (3360x2100, 2x retina)
- **Marker**: neutral
- **UI type**: landing-page (public conference portal home; tier A confirmed)

### Use-case reconstruction (INFERRED)
- **Persona**: prospective attendee — sustainability/ESG professional or exec; first-time-public, visits once or twice, decides, registers.
- **Domain & brand context**: "ESG World 2023" — global environmental/social/governance conference, Copenhagen + online. Premium, nature-forward; gold-on-cream restraint rather than eco-green cliché.
- **Top 3 user tasks (ranked)**: 1. Register. 2. Absorb what/when/where (dates, city, hybrid option). 3. Switch language / skim attendees and topics.
- **Implied requirements**: "Value prop, dates, location, and register CTA must land in the first viewport"; "Must serve 8 locales with an always-visible switcher"; "Must degrade to phone (stack, shorter hero, added scrim)"; "Imagery, not copy, carries brand values"; "Registration is the only saturated interactive element."
- **Data model sketch**: static marketing content — Conference (name, year, dates "25–27 April, 2023", venue "Copenhagen, Denmark", hybrid flag); ContentSection (eyebrow, heading, body, image, side) x2; Language x8. No records or grids.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#f8f6f0
├─ BILLBOARD h≈680 (EXTRA_TALL; TALL_PLUS phone) overlay=full,top,style=NONE (SEMI_LIGHT phone)
│  │        media=photo(wind turbine in fog) fallback-bg=#f0f0f0 marginBelow=EVEN_MORE
│  ├─ COLUMNS [NARROW_PLUS:AUTO] — logo | SBS ×9 language links, spacing=SPARSE, right-aligned
│  └─ COLUMNS [EXTRA_NARROW:MEDIUM_PLUS:AUTO] — spacer | hero copy + CTA | empty
└─ SECTION "none" (centered editorial band)
   ├─ COLUMNS [AUTO:MEDIUM_PLUS:MEDIUM_PLUS:AUTO] marginBelow=EVEN_MORE — eyebrow+heading+body | photo
   └─ COLUMNS [AUTO:MEDIUM_PLUS:MEDIUM_PLUS:AUTO] marginBelow=EVEN_MORE — photo | text (mirrored)
```
- **Above the fold**: the entire billboard — logo, 8-language row, value-prop paragraph, dates, location, "REGISTER NOW" — nothing else; fold ≈ billboard bottom. (The "TOPICS" row sits below the screenshot crop — CODE-VERIFIED only.)
- **Reading order**: Z across the top bar (logo → languages), then a left-rail F down the hero (paragraph → date → place → CTA).
- **Hierarchy rationale**: biggest element is the photograph — the brand argument (wind turbine = ESG) precedes any text; the only saturated object is the gold CTA, giving task 1 a color monopoly; hero copy stays MEDIUM_PLUS — the photo does the emotional work.
- **Density**: 1 — one idea per screen, zero data zones above the fold; essentially the level-1 anchor page.
- **Ratios & spacing**: hero copy MEDIUM_PLUS column indented by an EXTRA_NARROW spacer; content rows centered [flex:MEDIUM_PLUS:MEDIUM_PLUS:flex]; `marginBelow:"EVEN_MORE"` after billboard and each row; language items `spacing:"SPARSE"`.

### Styling specifics (CODE-VERIFIED where marked)
- **Palette**: page bg #f8f6f0 CODE-VERIFIED; billboard fallback #f0f0f0 CODE-VERIFIED; language links #111111 CODE-VERIFIED; accent = theme token "ACCENT" rendering #deaf3e (est.) on button/eyebrows; logo gold ≈#dfc675 (est.); photo fog ≈#d8c8bc (est.). Semantic colors: none.
- **Color application points**: logo, "REGISTER NOW" button, eyebrow labels — three gold touchpoints; all else near-black on cream/photo. No header bar, card accents, charts, or tags.
- **Typography moves**: hero paragraph, date, section headings = MEDIUM_PLUS; "And online worldwide" = MEDIUM; body = STANDARD; inline STRONG on "Environmental/Social/Governance" and the date; eyebrows all-caps + STRONG + ACCENT; active language STRONG + UNDERLINE; no EXTRA_LARGE anywhere (CODE-VERIFIED restraint).
- **Imagery stance**: full-bleed art-directed photography (turbine in sepia fog; aerial teal ocean); zero icons; logo is a gold tree image.
- **Card treatment**: none — no cards, borders, or boxes on the page; flat editorial layout.
- **Signature moves**: instead of an overlay scrim, `a!fullOverlay(style:"NONE")` — type sits raw on the photo's pale fog; instead of default white, `backgroundColor:"#f8f6f0"` continues the photo's warm cast; instead of a nav component, a sideBySideLayout language bar right-aligned via an empty desktop-only first item; instead of hard-coded brand color, `style:"SOLID"` and `color:"ACCENT"` lean on the theme.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#f8f6f0"); a!billboardLayout(responsive height, backgroundColor:"#f0f0f0"); a!fullOverlay(alignVertical:"TOP"); a!columnsLayout(stackWhen PHONE/TABLET); a!sideBySideLayout(×9, spacing:"SPARSE", width:"MINIMIZE"); a!richTextItem(linkStyle:"STANDALONE"); a!buttonWidget(size:"LARGE", style:"SOLID"); a!imageField(size:"FIT", isThumbnail:false).
- Charts: none. Interactive affordances: 8 language dynamicLinks + one button; no filters, search, record actions.

### Character & judgment
- **Register**: premium-editorial + warm-community — photography-led, generous space, gold warmth over corporate blue.
- **Why it works**: the gold CTA (#deaf3e est.) is the sole saturated element in a sepia/cream field; the photo's bright fog region doubles as text background, letting style:"NONE" hold; cream #f8f6f0 removes the hard white break at the fold, so hero and body read as one surface.
- **Why not boring**: no billboard scrim (most SAIL heroes default to DARK overlay + white text); zero cards or borders on an Appian page; warm cream background instead of default white; gold all-caps eyebrows as section markers instead of labeled sectionLayouts.
- **Boring twin**: white page, dark site header, "ESG World 2023" as LARGE heading, stock photo in a bordered cardLayout, three stacked bordered sections, blue "Register" button. Same content, every zone boxed, DARK overlay with white text.
- **What to steal**: match page backgroundColor to the hero photo's temperature; use fullOverlay style:"NONE" only with an art-directed pale region plus a phone-only scrim; center editorial rows with empty flanking columns and alternate image sides.
- **Risks**: #111111 on unscrimmed fog is art-direction-dependent — swap the photo and desktop contrast fails; `char(10)` spacers and empty layout columns are brittle under zoom/screen readers; ocean image altText says "Photo of forest" (wrong); 9 language items crowd at TABLET_PORTRAIT; body copy is lorem ipsum.

### Code cross-check (guidance/sail/sources/conference-home-page.sail)
- **Code-verified palette**: #f8f6f0 (page bg, L409), #f0f0f0 (billboard fallback, L7), #111111 (language links, L70+); ACCENT/STANDARD are the only color tokens — the rendered gold is theme-defined, not in the expression.
- **Notable techniques**: responsive billboard height `if(PHONE,"TALL_PLUS","EXTRA_TALL")` (L8–12); phone-only scrim `if(PHONE,"SEMI_LIGHT","NONE")` (L285–289); empty desktop-only sideBySideItem as alignment spacer (L53–61); `char(10)` breaks as desktop-only spacing (L207–219); centered band via empty flanking columnLayouts (L294–347); mirrored zig-zag rows with `stackWhen` (L349, L406).
- **Corrections**: gold is NOT hard-coded — pixels suggested #deaf3e but code says `style:"SOLID"` / `color:"ACCENT"` (theme supplies it); pill shape and all-caps "REGISTER NOW" are theme/product rendering of label "Register Now" (L271); the TOPICS row (L351–407) is cropped from the screenshot.
