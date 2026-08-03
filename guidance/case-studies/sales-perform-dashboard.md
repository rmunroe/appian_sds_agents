# Sales Performance Dashboard (dark theme)

**Pattern**: [dashboards](../patterns/dashboards.md) — dark-theme operational variant: KPI band pinned in the header slot, 3-column single-viewport body, density 4.

## Scenario
- **Persona**: e-commerce sales/merchandising manager at a fashion retailer; daily-operator cadence (today-vs-yesterday deltas, restock flags).
- **Domain**: online apparel retail ("Dresses"/"Tops", campaign promos); dark command-center register (authoritative-executive + utilitarian-ops).
- **Ranked tasks**: 1. scan today's revenue/orders health vs yesterday → 2. spot inventory actions on top sellers (Restock / Low in Stock) → 3. steer promotion spend via region, campaign, and channel performance.

## Data model
KPI{name, todayValue, delta, pct, trend[~35]}×4 · Product{name, rating 1–5, id, tag, purchased, returned}×6 · Campaign{name, visits, purchases, revenue}×3 · RegionSales{region, fullPrice, clearance, promotion}×4 · SatisfactionBucket{label, count}×3 · AcquisitionSeries{returning[56], new[56]} · TrafficSource{channel, pct}×4

## Skeleton
```
HEADER-CONTENT bg=PLUM_SCHEME
├─ CARD(header band, style #17202b, borderless)
│  └─ KPI-ROW ×4 via CARD-GROUP cardWidth=NARROW_PLUS
│     └─ each: CARD(COLUMNS [label+value : CHART(sparkline MICRO)], PLUM_SCHEME)
└─ COLUMNS [AUTO:AUTO:MEDIUM]
   ├─ CARD("Top Selling Products By Category": dropdown + hand-legend,
   │       6× COLUMNS [NARROW:AUTO] rows w/ CHART(stacked-bar MICRO))
   ├─ CARD(CHART(stacked column "Sales by Region")) ─ spacer ─ CARD(GRID(3 rows) campaigns)
   └─ CARD(CHART(stacked-bar meter)) ─ CARD(CHART(line)) ─ CARD(CHART(donut))
```
Everything above the fold; no scroll. Vertical gaps between stacked cards are empty `a!sectionLayout()` spacers (L527, 629, 662).

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| page bg | `PLUM_SCHEME` token (renders ≈#2b3050 est.) | `a!headerContentLayout(backgroundColor:)` |
| card fill | `style: "PLUM_SCHEME"` (renders ≈#1f2440 est.) | every `a!cardLayout`, `showBorder: false`, no shadow |
| KPI band | #17202b | header `a!cardLayout(style:)` |
| positive | #4CC900 | caret-up icon, delta text, rising sparkline stroke |
| negative | #E64345 | caret-down, delta text, falling sparklines, "Restock" tag bg |
| tag warning | #F7D027 | "Low in Stock" tag bg |
| stars | #fc9901 | star / star-o rating icons |
| legend dot 1 | #00A88F | hand-built legend "# of Items Purchased" |
| legend dot 2 | #82C272 | hand-built legend "# of Items Returned" |
| all charts | `colorScheme: "RAINFOREST"` (renders blue ≈#1f7bb6, teal ≈#00A88F, green ≈#82C272, pale ≈#a5d296, all est.) | every chart |
| links | ≈#9b8ce0 (est., scheme-supplied) | campaign `a!dynamicLink`s in the grid |

Semantic color is rationed: red/green only on deltas + tags, RAINFOREST on data, one literal hex band — no colored buttons, no colored headings.

## Signature moves
1. Instead of `a!kpiField` tiles → hand-built KPI cards: `a!cardGroupLayout(cardWidth: "NARROW_PLUS")` + `a!forEach`, each card a 2-column split of rich-text value beside an axis-less sparkline (`a!lineChartField(height: "MICRO", xAxisStyle: "NONE", yAxisStyle: "NONE", showLegend: false)`).
2. Instead of a light default theme → whole-page dark mode from two scheme tokens + one hex: `backgroundColor: "PLUM_SCHEME"` on the page, `style: "PLUM_SCHEME"` on every card, literal `#17202b` on the header band; separation comes purely from value shift, not borders.
3. Instead of chart legends → a hand-built legend of `a!richTextIcon(icon: "circle")` dots hex-matched to RAINFOREST (#00A88F / #82C272), letting all six row-charts run `showLegend: false`.
4. Instead of a gauge → single-category stacked bar as a satisfaction meter with `yAxisMax: 112` = the exact series sum (23+13+76), so the bar fills 100% of its width.
5. Chart-as-list-cell → per-product stacked MICRO bars normalized by a shared `yAxisMax: 95`, making the six rows length-comparable at a glance.
6. No page title anywhere; every heading SMALL + SEMI_BOLD → the MEDIUM_PLUS KPI numbers are the largest text on screen.

## Boring twin (what a lazy build would do — avoid this)
A light-gray page with four `a!kpiField(template: "STACKED")` tiles, one full-width product grid with numeric purchased/returned columns, three default-palette charts with built-in legends, LARGE section headings, and bordered white cards. Every move above exists to beat exactly that.

## Annotated SAIL excerpts
Source: guidance/sail/sources/sales-perform-dashboard.sail (699 lines)

**1. Hand-built KPI sparkline card (L104–178).** The KPI name is hoisted into `local!kpiName` because `fv!item` re-binds inside the nested forEach; mapping every category to the name makes tooltips read "Total Revenue: 40". Shared `yAxisMax: 40` puts all four sparklines on one scale.
```sail
a!cardGroupLayout(
  labelPosition: "COLLAPSED",
  cardWidth: "NARROW_PLUS",
  cards: a!forEach(
    items: local!kpis,
    expression: a!cardLayout(
      contents: a!columnsLayout(columns: {
        a!columnLayout(contents: {
          a!headingField(text: fv!item.name, size: "SMALL",
            fontWeight: "SEMI_BOLD", marginBelow: "NONE"),
          a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
            a!richTextItem(text: fv!item.todayPrice, size: "MEDIUM_PLUS"),
            char(10),
            a!richTextIcon(icon: fv!item.icon, color: fv!item.color, size: "MEDIUM"),
            a!richTextItem(text: fv!item.yesterdayPrice & " " & fv!item.percent,
              color: fv!item.color, size: "STANDARD")
          })
        }),
        a!columnLayout(contents: a!localVariables(
          local!kpiName: fv!item.name,
          { a!lineChartField(
              labelPosition: "ABOVE",
              categories: a!forEach(items: fv!item.data, expression: local!kpiName),
              series: { a!chartSeries(label: "count", data: fv!item.data,
                color: fv!item.color) },
              yAxisMax: 40, showLegend: false, height: "MICRO",
              xAxisStyle: "NONE", yAxisStyle: "NONE") }
        ))
      }),
      style: "PLUM_SCHEME", padding: "STANDARD",
      marginBelow: "NONE", showBorder: false)))
```

**2. Hex-matched fake legend (L334–373).** Literal hexes chosen to match RAINFOREST's rendered teal/green (est.); one legend serves all six product charts below.
```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(
      item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
        a!richTextIcon(icon: "circle", color: "#00A88F", size: "SMALL"),
        a!richTextItem(text: " " & "# of Items Purchased", size: "SMALL")
      }),
      width: "MINIMIZE"),
    a!sideBySideItem(
      item: a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
        a!richTextIcon(icon: "circle", color: "#82C272", size: "SMALL"),
        a!richTextItem(text: " " & "# of Items Returned", size: "SMALL")
      }),
      width: "MINIMIZE")
  },
  alignVertical: "TOP", marginBelow: "NONE")
```

**3. Conditional tag + normalized row chart (L430–470).** Tag color keyed off tag text; shared `yAxisMax: 95` across all six rows. Rows sit in `a!columnsLayout(spacing: "DENSE", marginBelow: "NONE")` (L474–476). Note `a!barChartField_21r4` is a deprecated chart version — the analysis flags it as a dependency risk.
```sail
a!tagField(
  tags: {
    a!tagItem(
      text: fv!item.tags,
      backgroundColor: if(
        tostring(fv!item.tags) = "Low in Stock",
        "#F7D027",
        "#E64345"))
  },
  size: "SMALL", align: "END")
/* …the row's chart column: */
a!barChartField_21r4(
  categories: fv!item.name,
  series: {
    a!chartSeries(label: "Returned", data: fv!item.data2),
    a!chartSeries(label: "Purcahsed", data: fv!item.data) /* typo in source; legend hidden */
  },
  yAxisMax: 95, stacking: "NORMAL",
  showLegend: false, showDataLabels: true,
  labelPosition: "COLLAPSED", colorScheme: "RAINFOREST",
  height: "MICRO", xAxisStyle: "NONE", yAxisStyle: "NONE")
```

**4. Stacked-bar-as-meter (L607–623).** `yAxisMax: 112` = 23+13+76 exactly, so the single stacked bar becomes a full-width satisfaction meter; axes off, legend on.
```sail
a!barChartField_21r4(
  categories: "Customer Satisfaction",
  series: {
    a!chartSeries(label: "Not Satisfied", data: { 23 }),
    a!chartSeries(label: "Neutral", data: { 13 }),
    a!chartSeries(label: "Satisfied", data: { 76 })
  },
  yAxisMax: 112,
  stacking: "NORMAL",
  showLegend: true, showTooltips: true,
  labelPosition: "COLLAPSED", colorScheme: "RAINFOREST",
  height: "MICRO", xAxisStyle: "NONE", yAxisStyle: "NONE")
```

## Skeleton SAIL
```sail
a!headerContentLayout(
  header: a!cardLayout(                       /* dark KPI band */
    contents: a!localVariables(
      local!kpis: {
        { name: "Total Revenue", todayPrice: dollar(fixed(3276.91)),
          yesterdayPrice: dollar(fixed(116.31)), icon: "caret-up",
          percent: "(18%)", color: "#4CC900", data: { 1, 3, 2 /* …35 pts */ } }
        /* ×3 more KPIs: Revenue Per User / New Orders / New Users —
           icon "caret-down" + color "#E64345" when negative */
      },
      {
        a!sectionLayout(/* dormant "Financial Summary" filter row:
          dropdown + 2 dateFields */ showWhen: false),
        a!cardGroupLayout(/* KPI cards — see excerpt 1 */)
      }),
    height: "AUTO", style: "#17202b", padding: "STANDARD",
    marginBelow: "NONE", showBorder: false),
  contents: a!localVariables(
    local!products: {
      { name: "Ruched Dress", rating: 4, tags: { "Low in Stock" },
        id: 192323, data: { 80 }, data2: { 12 } }
      /* ×5 more products */
    },
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: a!cardLayout(     /* LEFT: product list */
          contents: {
            a!headingField(text: "Top Selling Products By Category",
              size: "SMALL", fontWeight: "SEMI_BOLD"),
            a!columnsLayout(/* NARROW category dropdown | hand-built
              circle-dot legend — see excerpt 2 */),
            a!forEach(items: local!products, expression: a!columnsLayout(
              columns: {
                a!columnLayout(width: "NARROW", contents: {
                  /* SBS: name + 5-star row via
                     a!forEach(enumerate(5)+1, star/star-o "#fc9901") */
                  /* SBS: "Product ID: …" SECONDARY + conditional tagField */
                }),
                a!columnLayout(contents: {
                  a!richTextDisplayField(labelPosition: "COLLAPSED"), /* spacer */
                  /* stacked MICRO bar, yAxisMax: 95 — see excerpt 3 */
                })
              },
              alignVertical: "MIDDLE", marginBelow: "NONE", spacing: "DENSE"))
          },
          style: "PLUM_SCHEME", padding: "STANDARD", showBorder: false)),
        a!columnLayout(contents: {                 /* MIDDLE */
          a!cardLayout(contents: {
            a!headingField(text: "Sales by Region ($)", size: "SMALL",
              fontWeight: "SEMI_BOLD"),
            a!columnChartField(categories: { "Northeast" /* ×4 */ },
              series: { /* Full Price / Clearance / Promotion */ },
              stacking: "NORMAL", showLegend: true, showTooltips: true,
              labelPosition: "COLLAPSED", colorScheme: "RAINFOREST")
          }, style: "PLUM_SCHEME", padding: "STANDARD", showBorder: false),
          a!sectionLayout(),                       /* empty spacer between cards */
          a!cardLayout(contents: {
            a!headingField(text: "Top Performing Campaigns", size: "SMALL",
              fontWeight: "SEMI_BOLD"),
            a!gridField(labelPosition: "COLLAPSED",
              data: todatasubset({ /* 3 campaign rows */ }, fv!pagingInfo),
              columns: {
                a!gridColumn(label: "Campaign", sortField: "name",
                  value: a!linkField(links: a!dynamicLink(label: fv!row.name))),
                a!gridColumn(label: "# Visits", sortField: "visits",
                  value: fixed(fv!row.visits), align: "END")
                /* ×2 more numeric columns, align: "END" */
              },
              pageSize: 3,
              initialSorts: a!sortInfo(field: "revenue", ascending: true),
              borderStyle: "LIGHT", shadeAlternateRows: false)
          }, style: "PLUM_SCHEME", padding: "STANDARD", showBorder: false)
        }),
        a!columnLayout(width: "MEDIUM", contents: { /* RIGHT rail */
          a!cardLayout(/* "Customer Satisfaction" meter — see excerpt 4 */),
          a!sectionLayout(),
          a!cardLayout(contents: {
            a!headingField(text: "Customer Acquisition", size: "SMALL",
              fontWeight: "SEMI_BOLD"),
            a!lineChartField(series: { /* Returning / New, 56 pts each */ },
              yAxisMax: 160, showLegend: true, showTooltips: false,
              colorScheme: "RAINFOREST", height: "SHORT",
              xAxisStyle: "NONE", yAxisStyle: "MINIMAL")
          }, style: "PLUM_SCHEME", padding: "STANDARD", showBorder: false),
          a!sectionLayout(),
          a!cardLayout(contents: {
            a!headingField(text: "Traffic Sources", size: "SMALL",
              fontWeight: "SEMI_BOLD"),
            a!pieChartField(series: { /* 4 channels, pct */ },
              showDataLabels: true, showAsPercentage: true,
              colorScheme: "RAINFOREST", style: "DONUT",
              seriesLabelStyle: "LEGEND")
          }, style: "PLUM_SCHEME", padding: "STANDARD", showBorder: false)
        })
      },
      marginAbove: "NONE")),
  backgroundColor: "PLUM_SCHEME")
```

## Full source
`sail/sources/sales-perform-dashboard.sail` — load only if emulating this page end-to-end.
