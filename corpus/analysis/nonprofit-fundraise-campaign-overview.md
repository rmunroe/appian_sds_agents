# Analysis: nonprofit-fundraise-campaign-overview

## non_profit_fundraising_landing.png

### Identification
- **Image**: non_profit_fundraising_landing.png | **Source page**: nonprofit-fundraise-campaign-overview (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) non-profit fundraising campaign overview"
- **Device frame**: desktop (3360x2100 retina; site chrome with nav + avatar visible)
- **Marker**: neutral
- **UI type**: home-page (mission landing + executive overview hybrid)

### Use-case reconstruction (INFERRED)
- **Persona**: Fundraising/development director, weekly-manager cadence; also the default landing for all staff (nav: HOME | MY TASKS | CASES).
- **Domain & brand context**: Environmental non-profit "Boreas Foundation" (polar-bear logo; penguin/iceberg/aurora art); mission-first, calm, premium.
- **Top 3 user tasks (ranked)**: 1. Check progress toward the annual goal. 2. Compare donor-channel mix across three years. 3. Jump to MY TASKS / CASES (a disabled code variant adds "NEW CAMPAIGN").

- **Implied requirements**: mission identity before numbers; current goal vs prior goal/actual with no drill-down; attainment as one % visual; 3-year channel mix readable in one row; stacks below wide desktop (stackWhen includes TABLET_LANDSCAPE, DESKTOP_NARROW — CODE-VERIFIED).
- **Data model sketch** (OBSERVED labels): AnnualGoal(year, goal, actual) — 2021 goal $85,000,000 (+13%), 2020 goal $75,000,000, 2020 actual $73,291,578, attainment 98%; DonationMix(year × channel), 3 channels × 2019–2021. Hidden strip (CODE-VERIFIED, unrendered) implies CampaignMetrics: dollars-to-target 82.9%, retention 74.2%, new donors 91.6%, recurring rate 48.5%, 11 active campaigns.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#333F48 contentsPadding=EVEN_MORE
├─ CARD(hero, style=#333F48, borderless)
│  └─ COLUMNS [pad:MEDIUM_PLUS:WIDE:pad] alignV=MIDDLE
│     ├─ H1 LIGHT LARGE, 4-line mission statement
│     └─ illustration (iceberg+penguins+aurora, bg-matched)
├─ CARD(KPI-ROW ×5 + outline button, style=#eee) [showWhen=false — absent from pixels]
└─ COLUMNS [pad:MEDIUM_PLUS:WIDE:pad] spacing=STANDARD
   ├─ CARD(goal figures + GAUGE 98%, style=#394c5a)
   └─ CARD(3× CHART(donut) + shared manual legend, style=#394c5a)
```
- **Above the fold**: everything — hero (~55% of height) plus both cards; no scroll implied.
- **Reading order**: Z — headline → illustration → goal card → donut trio.
- **Hierarchy rationale**: mission headline biggest because the page's first job is identity; $85,000,000 at LARGE_PLUS is the dominant number (task 1); donut card gets WIDE vs MEDIUM_PLUS because the 3-year comparison needs horizontal room (task 2).
- **Density**: 2 — Editorial. Two content cards, half-viewport hero, EVEN_MORE padding, empty flanking columns.
- **Ratios & spacing**: content ≈ MEDIUM_PLUS:WIDE (~2:3, CODE-VERIFIED); card padding STANDARD; symmetric gutters ≈135 logical px OBSERVED.

### Styling specifics (CODE-VERIFIED palette; see cross-check)
- **Palette**: page bg #333F48; cards #394c5a; series blue #619ed6, green #6ba547, yellow #f7d027; POSITIVE token arrow ≈#75bf44 (est. render); white text; gauge track ≈#d9dce0 (est.); hidden strip #eee.
- **Color application points**: page bg and hero card share one hex (seamless); data cards one step lighter; gauge fill = series blue; legend dots hand-hexed to chart colors; green only on the single positive delta; yellow echoes in chrome tab-underline and logo (OBSERVED, outside SAIL).
- **Typography moves**: H1 LARGE fontWeight "LIGHT"; "2021 Goal" MEDIUM_PLUS; $85,000,000 and ↑13% LARGE_PLUS (STRONG); all-caps STANDARD labels ("2020 GOAL"/"2020 ACTUAL") over LARGE values; donut year labels MEDIUM_PLUS centered; legend STANDARD; gauge shows 97.7 rounded to "98%" via a!gaugePercentage().
- **Imagery stance**: flat vector illustration, dark-matched background so it floats; no photos or decorative icons in the body.
- **Card treatment**: filled (style hex), showBorder false, no shadow — tonal zoning with tiny ΔL.
- **Signature moves**: instead of white page + bordered cards, dark full-bleed with same-hex hero card and one-shade-lighter content cards; instead of a photo billboard, alignVertical-MIDDLE columns pairing LIGHT H1 with bg-matched art; instead of three auto-legends, seriesLabelStyle "NONE" + one hand-built sideBySideLayout legend; instead of a progress bar, a!gaugeField matched to series blue; empty flanking columnLayouts to center content.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#333F48", contentsPadding:"EVEN_MORE")
- a!cardLayout(style:"#333F48", showBorder:false); a!headingField(headingTag:"H1", fontWeight:"LIGHT", size responsive LARGE→MEDIUM_PLUS); a!imageField(size:"FIT") with a!EXAMPLE_DOCUMENT_IMAGE() placeholder
- Hidden: a!cardLayout(style:"#eee", showWhen:false) — 5 KPI columns (spacing:"SPARSE", showDividers:true), icon(SECONDARY)+value(MEDIUM_PLUS STRONG)+caret(POSITIVE/NEGATIVE) pattern; a!buttonWidget("NEW CAMPAIGN", style:"OUTLINE", size:"LARGE")
- a!gaugeField(percentage:97.7, primaryText:a!gaugePercentage(), color:"#619ed6", size:"MEDIUM") beside stacked rich text via sideBySideLayout width:"MINIMIZE"
- 3× a!pieChartField(style:"DONUT", colorScheme:"CLASSIC", height:"SHORT", showDataLabels:false, seriesLabelStyle:"NONE") in 3 columns, stackWhen:{"NEVER"}; custom colorScheme: no (legend hexes match CLASSIC's first three)
- Interactive affordances: site-chrome nav only; body is pure display; sole action button is showWhen:false.

### Character & judgment
- **Register**: warm-community + premium-editorial — mission sentence as hero, thin type, illustration, muted dark palette.
- **Why it works**: illustration shares the page hex so it reads as scenery, not a boxed image; one green arrow is the body's only semantic color, so 98% and +13% pop; three same-scale donuts make the yellow→blue shift legible as a sequence.
- **Why not boring**: full-bleed #333F48 with borderless #394c5a cards (flat tonal layering); LIGHT LARGE H1 as a 4-line mission sentence instead of a page title; gauge hex equals series blue, linking the two cards; single shared hand-built legend under three charts; empty-column centering gives a poster-like frame.
- **Boring twin**: white page, "Campaign Overview" title bar, stock-photo billboard, five bordered KPI cards, one pie chart with default legend, blue FILLED button in a toolbar.
- **What to steal**: match page and hero-card hex to float imagery; replace per-chart legends with one sideBySideLayout legend using exact-hex circle icons; reuse a series hex as the gauge color.
- **Risks**: all-caps STANDARD labels and the gray "%" on #394c5a likely near/below 4.5:1; segments rely on the legend (no data labels) for color-blind users; stackWhen:{"NEVER"} cramps three donuts on phones; seamless hero breaks without dark-matched replacement art; dead showWhen:false block invites drift.

### Code cross-check (guidance/sail/sources/nonprofit-fundraise-campaign-overview.sail)
- **Code-verified palette**: #333F48 (lines 46, 683), #394c5a (476, 491, 662), #619ed6 (461, 622), #6ba547 (635), #f7d027 (648), #eee (353); semantic POSITIVE/NEGATIVE/SECONDARY icon tokens.
- **Notable techniques**: fully-built KPI strip disabled via showWhen:false (51–357); responsive H1 size and image width via a!isPageWidth (15, 36); manual centered legend with empty flanking sideBySideItems (613–659); stackWhen:{"NEVER"} locks the donut row (547–549, 609–611); content stacks even at DESKTOP_NARROW (675–680); empty a!cardLayout spacer inside the chart card (488–494).
- **Corrections**: pixels show years 2021/2020 and 2019–2021; code says 2023/2022 and 2021–2023 — same design, refreshed copy. Donut proportions match code data (1/2/3, 2/2/2, 4/3/1). Arrow green is the POSITIVE token, not a custom hex. KPI strip/button absent by design (showWhen:false), not a rendering gap.
