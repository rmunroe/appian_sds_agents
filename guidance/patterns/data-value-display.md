# Data Value Display

The official seven-way vocabulary for showing label/value data — from a full read-only field sheet to KPI cards with sparklines and goal bars. "Use appropriate techniques to show different types of data field values" (official page); the technique is chosen by the question the number must answer.

## When this pattern
Signals: scalar facts as label+value pairs — metrics, record attributes, profile fields; read-only; the value (not its distribution) is the payload.
Nearest alternatives: a **grid** when values repeat per-row across many entities; a **standalone analytic chart** (dashboards pattern) when the shape of many points is the message — a MICRO sparkline inside a KPI cell stays in this pattern; **standard form fields** when values are editable — the field-summary variant explicitly must not be used on editable forms (official warning).

## Anatomy
Two base skeletons; variants 2–7 all elaborate the first.

KPI cell:
```
CARD (or one column inside a shared CARD)
├─ label  ALL-CAPS, color SECONDARY
├─ value  LARGE STRONG (unit in SECONDARY, one size step down)
└─ third line (optional): supplement · delta · progress bar · sparkline beside
```
Field sheet (variant 1):
```
COLUMNS [EXTRA_NARROW : MEDIUM_PLUS : AUTO : EXTRA_NARROW]   ← empty gutters center the sheet
├─ page title = SECTION label LARGE_PLUS, marginAbove/Below EVEN_MORE
├─ SECTION-label column per topic group (labelSize MEDIUM, labelHeadingTag H2, labelColor ACCENT,
│   helper sentence SMALL SECONDARY under the label)
└─ rows column — per field: COLUMNS [MEDIUM label : AUTO value]
    label MEDIUM_PLUS SECONDARY · value MEDIUM_PLUS align:"RIGHT" · row = a!sectionLayout(divider:"BELOW", marginBelow:"NONE")
```
Above-fold: everything — a sheet of ~10 fields fills one viewport at density 2; KPI rows read at density 3–4 inside dashboards and record headers.

## Variants (the 7 official patterns)
1. **Easy-to-scan field summary** — the open sheet above. Small number of concise values; generous whitespace and MEDIUM_PLUS type fill the page deliberately. Signature: values right-aligned into one vertical scan edge; label/value at size parity, differentiated only by SECONDARY color; context annotations sit directly under the value they qualify; `divider:"BELOW"` per row gives structure with near-zero ink. Accessible because label→value reading order is preserved — but read-only ONLY.
2. **Simple performance indicators** — label + value, nothing else. Two sub-forms: **separate cards** when metrics are independent; **one shared card** — heading MEDIUM_PLUS, columns with `showDividers: true`, footer caption SMALL SECONDARY naming the shared timeframe — when they form one family (official default: fewer borders, less clutter).
3. **Supplemental information** — adds an explanation, as-of date, or change summary below the value. Official rules: labels ALL-CAPS so they outrank supplements; supplement font one step smaller; siblings without supplements get an empty-space character so card heights match; optional trailing icon after the value (ACCENT, LARGE) for recognition; zero change renders as a dash + "(0.0%)" in SECONDARY, not fake movement.
4. **Trend microcharts** — value + delta beside `a!lineChartField(height: "MICRO", xAxisStyle: "NONE", yAxisStyle: "NONE", showLegend: false)`, built with `a!forEach` over the metric list; series color flips on the sign of the change; caret icon POSITIVE/NEGATIVE doubles the direction. Use when direction/shape of recent movement matters as much as the level; skip when only the current value decides — the chart ink becomes noise.
5. **Goal progress bars** — value + `a!progressBarField(style: "THICK")` against a numeric goal, goal pinned at the card corner behind a bullseye icon. Color is a fork (official): selective semantic coding — shortfall NEGATIVE, overshoot POSITIVE, on-track a neutral dark bar — only when good/bad is unambiguous; otherwise every bar uses the accent color.
6. **Key attribute values** — the same KPI anatomy promoted to a record's 3–5 defining attributes, each decorated by type: status icon in a taxonomy color; boolean check icon whose color flags **risk, not success**; person as `a!imageField(a!userImage(), size: "ICON", style: "AVATAR")`; empty amount as "$ –" with the dash in SECONDARY. Avoid for long text or frequently edited fields.
7. **Performance against targets** — value LARGE_PLUS STRONG + unit LARGE SECONDARY, then TWO half-width THICK progress bars in `a!columnsLayout(spacing: "NONE", showDividers: true)` — the column divider IS the midpoint target tick. Overshoot fills into the second bar (NEGATIVE); within-target uses accent with the second bar emptied (`percentage: -1`); a breach adds a warning icon beside the value; target value labeled above the bars, metric name below.

### Selection rules (official rollup)
Default = **shared-card group (2)** — related metrics almost always share context. Escalate deliberately: → (3) when the number begs "as of when? vs what?" · → (4) when trajectory drives the decision · → (5)/(7) only when explicit numeric goals exist, (7) when overshoot past a midpoint must be visible · → (6) for non-metric record fields that deserve header-level scan weight · → (1) for the full read-only profile.

## Component roster
- [rich-text-display-field](../components/rich-text.md) — labels, values, deltas, icons: all seven official builds are rich text; none uses a!kpiField
- [card-layout](../components/card-layout.md) — cells and shared family frames
- [columns-layout](../components/columns-layout.md) — families, dividers, the half-bar target assembly
- [section-layout](../components/section-layout.md) — sheet rows (`divider: "BELOW"`), topic groups (`labelColor: "ACCENT"`)
- [progress-bar-field](../components/kpi.md) — goal and target bars (THICK)
- [line-chart-field](../components/charts.md) — MICRO sparklines
- [image-field](../components/images.md) — avatar-decorated person attributes

## Layout decisions by data shape
- 3–5 metrics, one family → shared card, dividered columns. Independent metrics → separate cards in NARROW columns.
- ~10 fields on one record → field sheet fills the viewport; more fields → add ACCENT-labeled topic sections before shrinking type.
- Mixed metric + attribute headers → variant 6 cells at the same size grammar so the row aligns; match heights with empty-space characters.
- Value + unit: numeral one size step above its unit, unit in SECONDARY ("45" LARGE_PLUS + "days" LARGE SECONDARY).
- Goals that can exceed 100% → variant 7's two half-bars; a single bar caps visually at full.
- Long label + short value → the sheet's [MEDIUM : AUTO] row split; never wrap a value under its own label inside a cell.

## Mobile behavior
- KPI columns stack in source order — rank metrics so #1 lands on top. Corpus KPI rows disable dividers when stacked (`showDividers: if(a!isPageWidth({"PHONE"}), false, true)`) and repeat per-item caps labels.
- 4+ cells that must survive tablet widths → `a!cardGroupLayout` (reflows by `cardWidth`) instead of a columns row that stacks wholesale.
- The field sheet's label/value rows keep pairs intact when stacked (label lands above its value); stacking also cures the sheet's desktop risk — the wide label→value gutter.
- Nothing disappears: every variant is already minimal; drop count, not anatomy.

## Top 3 don'ts
1. **Semantic color without a defensible judgment.** POSITIVE/NEGATIVE on bars or values implies good/bad; the official rule is accent (or a neutral bar) unless the judgment is unambiguous — and note the inversion: on an attribute card, NEGATIVE can mean "risk present" on a value reading "Yes".
2. **The field summary on editable forms.** It abandons standard field labels; the official page permits it read-only (screen readers still get label→value sequence) and explicitly warns against edit use.
3. **Decoration beyond the question.** Microcharts where only the level matters; supplements that restate the label; four bordered cards where one dividered card was the family — every escalation step must be earned by a question the plainer variant can't answer.

## Exemplars
| case study | what to steal |
|---|---|
| [sales-perform-dashboard](../case-studies/sales-perform-dashboard.md) | variant 4 at page scale: forEach-built KPI cards, sign-conditional sparkline color, axis-less MICRO charts beside MEDIUM_PLUS values |
| [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md) | hand-built variant-2/3 band: caps label + SECONDARY icon + MEDIUM_PLUS STRONG value + caret delta in one dividered row; carets carry color while delta digits stay neutral |
| [sustainability-dashboard](../case-studies/sustainability-dashboard.md) | variant 7's divider-as-target trick on category cards: paired THICK bars, `spacing: "NONE"`, dividers on, overshoot bar in NEGATIVE |
