# Analysis: ux-portals

## design-portal-responsive-design.png

### Identification
- **Image**: design-portal-responsive-design.png | **Source page**: ux-portals | **Alt/caption**: "responsive design example"
- **Device frame**: desktop + phone composite (MacBook and iPhone frames showing the same portal)
- **Marker**: neutral
- **UI type**: portal — public, anonymous landing page

### Use-case reconstruction (INFERRED)
- **Persona**: anonymous utility customer mid-outage, first-time-public, plausibly stressed and on a phone.
- **Domain & brand context**: electric utility "WYNDHAMM POWER" (wind-energy brand — turbine logo and photography); serious, trustworthy tone.
- **Top 3 user tasks (ranked)**: 1. Report a complete or partial outage. 2. Check on or cancel a previous report. 3. Browse the list of confirmed outages.
- **Implied requirements**: works with no login (portal, no user context); the three tasks must be impossible to miss; must look right on any device — outage reporters are disproportionately on phones (the page's responsive-design lesson); footer must route to the rest of the utility's services; text must stay legible over dark imagery.
- **Data model sketch**: OutageReport(new · status/cancel), ConfirmedOutage(list/map via "Browse Reports"); footer link sets: Wyndhamm Home, Set Up New Service, Pay My Bill, Customer Service | About Green En…, Our Carbon Neu…, Reducing Your E… (truncated by phone overlay).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
DESKTOP:
BILLBOARD full-bleed photo=b&w wind turbines, dark
├─ LOGO top-right
├─ PANE[left] w≈40%
│  ├─ TITLE "OUTAGE CENTER"
│  ├─ intro ("We're sorry… How can we help?")
│  └─ 3× (caption line + BUTTON solid blue full-col-width w/ icon)
└─ FOOTER black: logo + link COLUMNS [1:1]
PHONE: identical content as single column; logo above title; buttons full-width
```
- **Above the fold**: title plus all three captioned buttons, on both devices.
- **Reading order**: single-column down the left rail (desktop) / the whole screen (phone).
- **Hierarchy rationale**: the three CTAs are the page — each gets a plain-language caption directly above it; ordered by urgency (report → check → browse); no nav, search, or content competing for anonymous users' attention.
- **Density**: 1 — three actions on a full screen; marketing-airy layout serving a triage purpose.
- **Ratios & spacing**: desktop content column ≈40% width, the rest is photographic breathing room; equal vertical rhythm between caption+button pairs; phone keeps identical order at 100% width.

### Styling specifics (OBSERVED)
- **Palette (est.)**: photo blacks/grays #0d0d0d–#8a8a8a; text white #ffffff; buttons blue #4a7ce0 with white labels/icons; footer bg #000000; footer links #4a90e2.
- **Color application points**: the only chromatic elements are the three blue buttons and footer links — blue equals actionable, everything else is monochrome photography.
- **Typography moves**: "OUTAGE CENTER" ≈ EXTRA_LARGE all-caps light-weight white; intro STANDARD with bold "How can we help?"; button labels ≈ MEDIUM all-caps with leading glyph icons (warning triangle, clock, map).
- **Imagery stance**: full-bleed b&w wind-turbine photograph doubling as brand statement and dark canvas.
- **Card treatment**: none — text and buttons sit directly on the photo.
- **Signature moves**: caption-above-button pairs ("Check on or cancel a previous report" → CHECK STATUS) replace explanatory paragraphs; monochrome photo + single accent color; icon inside every button; the same stack order preserved on phone rather than a rearranged mobile layout.

### Component inventory (OBSERVED → INFERRED)
- INFERRED: full-page a!billboardLayout (photo background, dark overlay) or portal background media; a!buttonWidget(style solid, icon, full-width in column) ×3; footer a!columnsLayout(stackWhen) of safe links; page text prescribes a!isPageWidth() + stackWhen for the adaptation (a!isNativeMobile() explicitly does not work in portals).
- Chart types: none.
- Interactive affordances: three primary buttons; footer link columns.

### Character & judgment
- **Register**: institutional + urgent-triage — authoritative monochrome calm wrapped around three emergency actions.
- **Why it works**: 3 tasks = 3 buttons with zero competing chrome; captions state each button's job in plain words for first-time users; the phone rendering preserves order and full-width targets, honoring how outages are actually reported.
- **Why not boring**: b&w photography with a single accent hue; oversized light-weight all-caps title; icon+caption+button rhythm instead of a link list.
- **Boring twin**: white page, logo top-left, a paragraph of apology text, three default-width buttons in a row beneath a stock photo card — and a hamburger menu nobody anonymous needs.
- **What to steal**: caption+button pairs for anonymous single-task portals; monochrome-plus-one-accent to make actions unmissable; design the phone stack first, then let desktop add breathing room.
- **Risks**: white text over mid-gray photo regions can dip below 4.5:1 (est.); portals always render at "Full" width, so on ultrawide monitors the left rail's margin grows — content should stay centered/capped; color is the only affordance separating buttons from decoration.

### Code cross-check
- none — no SAIL source on this page.

## Component: Time display with explicit zone (page: ux-portals)
Official variant vocabulary: none named — section "Specify the time zone in your interface design"

### design-portal-time-zone.png
- **Produces it**: read-only text/rich-text time values with the portal's zone appended — e.g. "10:15AM – 11:30AM (EST)" — because anonymous portal users' time zones are unknowable.
- **Looks like**: OBSERVED — "Tuesday" agenda card, navy left accent border; three rows: time range (EST), session (A New Era of Public Speaking · Lunch · Speaker Support), pin-icon location (Media Room 1, Cafeteria, Ballroom); white halo highlighting the time column is doc annotation.
- **Use when**: any portal component displaying or collecting times. | **Avoid when**: authenticated apps already localizing per user profile.
- **Styling hooks**: zone suffix inline with the time text; hairline row dividers; accent border.
- **Pairs well with**: agendas, deadlines, appointment schedulers.
- **Hexes**: none — color is not the variant dimension (accent #3b3b6e est.).
- **Marker**: neutral

### Page rollup
Default choice for portals is always suffixing an explicit zone label onto every displayed or requested time, because a portal cannot read the viewer's locale or zone — omitting it silently shows server-zone times as if they were local.

## portal_localization2.gif

### Interaction: Locale switcher round-trip (gif: portal_localization2.gif)
- **State chart**: English landing, "ENGLISH" underlined (f0) → cursor moves to header language links (f29) → click ESPAÑOL → entire page re-renders in Spanish — headline, "25-27 de abril de 2024", "Copenhague, Dinamarca", REGÍSTRESE AHORA, ASISTENTES section — with ESPAÑOL now underlined (f59) → cursor returns toward ENGLISH (f89) → click → English restored (f118).
- **SAIL mechanism**: other — safe link per locale built with a!portalUrlWithLocale(); navigation reloads the portal in the target locale, swapping translation strings, date/number formats, system text, and LTR/RTL direction (per page text).
- **UX purpose**: orientation — anonymous users self-select language from persistent, always-visible header links; underline marks the active locale.
- **Replicate when**: any public portal with a multilingual audience. | **Cost**: low code (one link per locale) but demands full translation-string coverage; it is a whole-page reload, not an in-place toggle.

Note: the pre-extracted frame PNGs f29/f59/f89/f118 are un-composited GIF delta frames (blank/noise); states above were read from full frames coalesced out of the source GIF.
