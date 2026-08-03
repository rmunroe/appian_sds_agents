# Sustainability Dashboard (net-zero executive)

**Pattern**: [dashboards](../patterns/dashboards.md) — executive variant: billboard hero KPIs + fused filter band + equal-thirds card rows, density 3.

## Scenario
- **Persona**: Chief Sustainability Officer / ESG program lead; monthly-exec cadence.
- **Domain**: "Möller" — industrial/manufacturing corporate running a net-zero program; mission-forward optimism, entirely green-coded (authoritative-executive + warm-community).
- **Ranked tasks**: 1. check headline net-zero progress (actual vs offsets vs net) → 2. spot categories over annual target (Transportation is over) → 3. slice trends by period/country/region for reporting.

## Data model
EmissionRecord(category: Energy|Transportation|Waste, scope 1–3, month, year, country, region, MTCO2e) · CategoryTarget(year, target: 257K/78K/34K) · OffsetLedger · ReportingCoverage(%). The hero arithmetic is legible on-page: 314,519 actual − 219,482 offsets = 95,037 net; the three category cards sum to 314,519 exactly.

## Skeleton
```
HEADER-CONTENT bg=TRANSPARENT
├─ BILLBOARD h=SHORT_PLUS (MEDIUM phone) overlay=full,MIDDLE,style NONE bg=#dbf1d3
│  ├─ title MEDIUM_PLUS (#274e13) + year (#47b311) + underscore rule #93c47d
│  └─ COLUMNS [WIDE_PLUS : MEDIUM_PLUS empty art-spacer (DESKTOP_WIDE only)]
│     └─ COLUMNS ×3 AUTO showDividers — KPI trio: icon #47b311 + LARGE_PLUS number #274e13
├─ CARD(filter band #85c47d, borderless) — SBS calendar+dropdown | spacer | globe+2 dropdowns
├─ COLUMNS [1:1:1] — SECTION(H2) ×3 → CARD(LARGE number + coverage tag + bullet pair, shadow)
├─ COLUMNS [1:1:1] — SECTION(H2) ×3 → CARD(CHART(area)) | CARD(CHART(donut)) | CARD(CHART(donut))
└─ SECTION "Emissions per Unit Produced" → CARD(equation strip: TINY stamps,
   EXTRA_NARROW "+"/"=" columns)  [below fold]
```

## Palette (code-verified unless marked est.) — flagship green recipe, full census
| role | hex | applied to |
|---|---|---|
| surface tint | #dbf1d3 | `a!billboardLayout(backgroundColor:)` |
| band | #85c47d | filter `a!cardLayout(style:)`, borderless |
| rule | #93c47d | underscore-string divider under the title |
| ink (dark green) | #274e13 | title text, hero KPI numbers, filter icons |
| accent (bright green) | #47b311 | year "2025", hero KPI icons — large/bold only (≈2.5:1 on #dbf1d3) |
| data ramp 1→4 | #59C968 → #41934B → #117D20 → #0A4A13 | `a!colorSchemeCustom` on the area chart + both donuts |
| on-track bar | #3a77e9 | `a!progressBarField(color:)` when under target |
| over-target | `NEGATIVE` token | both bars of the Transportation bullet |
| coverage caveat | #ff9900 | "93% REPORTING" `a!tagItem(backgroundColor:)`; at 100% → `SECONDARY` |
| page bg | `TRANSPARENT` (site canvas ≈#fafafa est.) | `a!headerContentLayout(backgroundColor:)` |
| cards | white default (`style: "NONE"`) | all content cards, `showBorder: false, showShadow: true` |

How the recipe hangs together: six greens in three duties — surfaces (#dbf1d3 tint → #85c47d band → #93c47d rule), text (#274e13 ink, #47b311 accent), and data (light→dark 4-step ramp #59C968/#41934B/#117D20/#0A4A13, declared per chart; the 3-series area chart consumes 3 steps, donuts declare all 4). Everything non-green is a signal: blue #3a77e9 = on track, `NEGATIVE` red = over target, #ff9900 = incomplete data. No buttons on the page.

## Signature moves
1. Instead of the default multi-hue chart palette → one brand ramp on every chart: `colorScheme: a!colorSchemeCustom(colors: { "#59C968", "#41934B", "#117D20", "#0A4A13" })`, repeated ×3.
2. Instead of a gauge → a bullet chart hacked from paired `a!progressBarField`s in a 2-column `a!columnsLayout(spacing: "NONE", showDividers: true, stackWhen: { "NEVER" })`; the column divider IS the target tick; the overflow bar is `percentage: -1` (invisible) normally, `percentage: 10, color: "NEGATIVE"` when over target.
3. Instead of a toolbar → a borderless #85c47d card fused directly under the billboard (`marginBelow: "NONE"` on the billboard) reads as a full-bleed filter band; #274e13 icons + three COLLAPSED dropdowns.
4. Instead of a KPI card row → the KPI trio lives inside the billboard overlay as a hero infographic: three AUTO columns with `showDividers` (off on phone), LARGE_PLUS numbers with STANDARD-size "MTCO2e" units inline.
5. Instead of a section divider → an underscore-string `a!richTextItem` rule in #93c47d, mixing SMALL + STANDARD sizes to tune its length; desktop-only.
6. Caveat coloring is conditional: #ff9900 "93% REPORTING" tag fires only when coverage <100%; complete categories get a gray `SECONDARY` tag — orange spends attention only where the number is untrustworthy.

## Boring twin (what a lazy build would do — avoid this)
A white header titled "Sustainability Dashboard", default bordered KPI cards, default blue/orange charts, filters in a gray toolbar, targets as "79% of target" text. No hero, no target ticks, no color system.

## Annotated SAIL excerpts
Source: guidance/sail/sources/sustainability-dashboard.sail (1513 lines)

**1. Bullet chart from paired progress bars (L619–657, Energy).** Divider = target tick; second column = overflow zone. Flanked by centered "257K" above and "TARGET" below (L611–664).
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(
      contents: {
        a!progressBarField(
          labelPosition: "COLLAPSED",
          percentage: 79,              /* actual vs annual target */
          color: "#3a77e9",
          style: "THICK",
          marginAbove: "LESS", marginBelow: "LESS",
          showPercentage: false)
      },
      width: "AUTO"),
    a!columnLayout(
      contents: {
        a!progressBarField(
          labelPosition: "COLLAPSED",
          percentage: -1,              /* empty track = headroom past target */
          color: "NEGATIVE",
          style: "THICK",
          marginAbove: "LESS", marginBelow: "LESS",
          showPercentage: false)
      })
  },
  alignVertical: "MIDDLE",
  marginAbove: "NONE", marginBelow: "EVEN_LESS",
  spacing: "NONE",
  stackWhen: { "NEVER" },
  showDividers: true)                  /* the divider line IS the target tick */
```
Over-target variant (Transportation, L747–785): first bar `percentage: 100, color: "NEGATIVE"`, second `percentage: 10, color: "NEGATIVE"` — red visibly spills past the tick.

**2. Two-tone header stack: billboard fused to filter band (L3–11 + L546–551).** Both live in the `header:` list; `a!fullOverlay(style: "NONE")` keeps the pale tint un-scrimmed.
```sail
a!billboardLayout(
  backgroundColor: "#dbf1d3",
  height: if(a!isPageWidth({ "PHONE" }), "MEDIUM", "SHORT_PLUS"),
  marginBelow: "NONE",                 /* glues billboard to the band below */
  overlay: a!fullOverlay(
    alignVertical: if(a!isPageWidth({ "PHONE" }), "TOP", "MIDDLE"),
    contents: { /* title + rule + KPI trio */ },
    style: "NONE")),
a!cardLayout(
  contents: { /* calendar icon + period dropdown | empty column |
                 globe-alt icon + country + region dropdowns */ },
  height: "AUTO",
  style: "#85c47d",
  padding: "STANDARD",
  marginBelow: "LESS",
  showBorder: false)
```
The screenshot's city illustration is NOT in code (no backgroundMedia); the empty MEDIUM_PLUS column shown only at DESKTOP_WIDE (L408–412) reserves its space.

**3. Underscore rule + two-color title (L18–58, rule L72–94).** A literal underscore string as a horizontal rule; nested sizes fine-tune its length.
```sail
a!richTextDisplayField(
  labelPosition: "COLLAPSED",
  value: {
    a!richTextItem(
      text: {
        a!richTextItem(text: { "______________________________" }, size: "SMALL"),
        "____________________________________"
      },
      color: "#93c47d")
  },
  showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" }),
  marginBelow: "MORE")
```
Title above it: "Journey to **Net-Zero Carbon** " in #274e13 MEDIUM_PLUS with "2025" in #47b311 STRONG (L21–45; the screenshot still shows "2035" — asset drift).

**4. The ramp applied + responsive chart params (area L1022–1042; donuts L1063–1104).**
```sail
a!areaChartField(
  /* 3 series: Energy / Transportation / Waste, 12 months */
  xAxisTitle: "2021",
  yAxisTitle: "MTCO2e",
  stacking: "NONE",
  showLegend: true, showTooltips: true,
  colorScheme: a!colorSchemeCustom(colors: { "#59C968", "#41934B", "#117D20" }),
  height: if(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE",
    "DESKTOP_NARROW" }), "SHORT", "MEDIUM"),
  xAxisStyle: "STANDARD", yAxisStyle: "STANDARD")
/* both donuts: same ramp + 4th step "#0A4A13", style: "DONUT",
   seriesLabelStyle: if(narrow, "LEGEND", "ON_CHART"),
   height: if(narrow, "SHORT", "MEDIUM") */
```
ON_CHART labels at desktop mitigate adjacent-greens-look-alike risk; they drop to LEGEND when narrow. (Donut demo data reuses hero numbers — placeholders, don't reconcile them.)

**5. Conditional coverage tag (L596–605 vs L724–733).** Orange only when data is incomplete.
```sail
a!tagField(
  labelPosition: "COLLAPSED",
  tags: {
    a!tagItem(
      text: "93% REPORTING",
      backgroundColor: "#ff9900")     /* Transportation/Waste at 100%:
                                          backgroundColor: "SECONDARY" */
  },
  size: "SMALL")
```

## Skeleton SAIL
The real file carries 41 `a!isPageWidth` forks; this skeleton keeps only the load-bearing ones.
```sail
a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundColor: "#dbf1d3",
      height: if(a!isPageWidth({ "PHONE" }), "MEDIUM", "SHORT_PLUS"),
      marginBelow: "NONE",
      overlay: a!fullOverlay(
        alignVertical: "MIDDLE",
        style: "NONE",
        contents: {
          a!richTextDisplayField(      /* two-color mission title */
            labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(
                text: { "Journey to ",
                  a!richTextItem(text: { "Net-Zero Carbon " }, style: { "STRONG" }) },
                color: "#274e13", size: "MEDIUM_PLUS"),
              a!richTextItem(text: { "2025" }, color: "#47b311",
                size: "MEDIUM_PLUS", style: { "STRONG" })
            }),
          a!richTextDisplayField(/* underscore rule #93c47d — see excerpt 3 */),
          a!columnsLayout(
            columns: {
              a!columnLayout(
                width: "WIDE_PLUS",
                contents: a!columnsLayout(
                  columns: {
                    a!columnLayout(width: "AUTO", contents: {
                      /* SBS-wrapped, width MINIMIZE: */
                      a!richTextDisplayField(
                        label: "2021 ACTUAL IMPACT",
                        labelPosition: "ABOVE",
                        value: {
                          a!richTextItem(text: a!richTextIcon(icon: "smog"),
                            color: "#47b311", size: "LARGE_PLUS",
                            style: { "STRONG" }),
                          a!richTextItem(text: {
                            a!richTextItem(text: { "314,519 " },
                              size: "LARGE_PLUS", style: { "STRONG" }),
                            "MTCO2e" }, color: "#274e13")
                        })
                    })
                    /* ×2 more KPI columns, same shape:
                       "2021 OFFSETS" seedling 219,482 ·
                       "2021 NET IMPACT" globe-africa 95,037 */
                  },
                  stackWhen: { "PHONE" },
                  showDividers: if(a!isPageWidth({ "PHONE" }), false, true))),
              a!columnLayout(contents: {}, width: "MEDIUM_PLUS",
                showWhen: a!isPageWidth({ "DESKTOP_WIDE" }))  /* art spacer */
            },
            alignVertical: "MIDDLE",
            stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE" })
        })),
    a!cardLayout(/* #85c47d filter band — see excerpt 2 */)
  },
  contents: {
    a!columnsLayout(                   /* target-card row */
      columns: {
        a!columnLayout(contents: a!sectionLayout(
          label: "Energy Consumption",
          labelHeadingTag: "H2", labelColor: "STANDARD",
          contents: a!cardLayout(
            contents: a!columnsLayout(
              columns: {
                a!columnLayout(width: "NARROW", contents: {
                  /* "203,194 " LARGE STRONG + "MTCO2e" rich text */
                  a!tagField(/* coverage tag — see excerpt 5 */)
                }),
                a!columnLayout(width: "AUTO", contents: {
                  /* "257K" centered · paired-progressBar bullet (excerpt 1)
                     · "TARGET" centered */
                })
              },
              alignVertical: "MIDDLE",
              stackWhen: { "TABLET_LANDSCAPE", "DESKTOP_NARROW" }),
            link: a!dynamicLink(),     /* only the Energy card links out */
            height: "AUTO", style: "NONE", marginBelow: "STANDARD",
            showBorder: false, showShadow: true)))
        /* ×2 more sections, same shape:
           Transportation 85,853 vs 78K (over — both bars NEGATIVE, no link) ·
           Waste 25,472 vs 34K (72% blue) */
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }),
    a!columnsLayout(                   /* chart row */
      columns: {
        a!columnLayout(contents: a!sectionLayout(
          label: "Emissions over Time", labelHeadingTag: "H2",
          labelColor: "STANDARD",
          contents: a!cardLayout(
            contents: { /* areaChartField — see excerpt 4 */ },
            height: "AUTO", style: "NONE", marginBelow: "STANDARD",
            showBorder: false, showShadow: true)))
        /* ×2 more: "Emissions by Category" donut (Energy/Transportation/Waste)
           · "Emissions by Scope" donut (Scope 1/2/3) — same card shell */
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }),
    a!sectionLayout(                   /* equation strip, below fold */
      label: "Emissions per Unit Produced",
      labelHeadingTag: "H2", labelColor: "STANDARD",
      contents: a!cardLayout(
        contents: a!columnsLayout(
          columns: {
            /* 5 value columns — SECONDARY caps label ("ENERGY (SCOPE 1)" …)
               over SBS of a!stampField(icon: bolt/plug/truck-moving/trash/smog,
               contentColor: "STANDARD", size: "TINY") + "0.020 " MEDIUM_PLUS
               + "MTCO2e" STANDARD — interleaved with 4 EXTRA_NARROW operator
               columns ("+","+","+","=" MEDIUM_PLUS, centered on desktop);
               total "0.320" STRONG (L1181–1509) */
          },
          alignVertical: "MIDDLE",
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE",
            "DESKTOP_NARROW" }),
        height: "AUTO", style: "NONE", padding: "STANDARD",
        marginBelow: "STANDARD", showBorder: false, showShadow: true))
  },
  backgroundColor: "TRANSPARENT")
```

## Full source
`sail/sources/sustainability-dashboard.sail` — load only if emulating this page end-to-end.
