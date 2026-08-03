# Analysis batch 30

You are an expert UI/UX analyst reverse-engineering the Appian SAIL Design System example images.
Work from repo root: /home/robert/Development/appian_sds_agents

## Protocol (follow exactly)
1. Read `pipeline/templates/CONVENTIONS.md` — vocabulary, evidence marks, skeleton notation, density scale.
2. Read the template(s) you need: `pipeline/templates/tier-a-template.md` for tier A,
   `pipeline/templates/tier-bcg-template.md` for tiers B, C, and GIF.
3. For EACH page below: read its page text, then Read each image listed (they are real image files —
   look at them carefully), then write ONE analysis file per page at the given path.
4. The `tier` column is a suggestion from dimensions/markers. Override with judgment: a full-page UI
   screenshot = tier A even if smaller; a cropped fragment = tier B even if large. Say when you override.
5. For GIFs: Read the extracted frame PNGs listed (corpus/images/frames/...), not the .gif itself.
6. Group tier-C images into DO/DON'T pairs when they are siblings under the same heading.
7. Evidence discipline: OBSERVED / INFERRED / CODE-VERIFIED marks as per conventions. Hexes for every
   color claim (est. suffix when pixel-guessed). No vague adjectives without the concrete choice.
8. Word budgets: tier A ≤1000 words/image; tier B ≤60 words/variant; tier C ≤120 words/pair; GIF ≤120 words.
9. Structure each analysis file: `# Analysis: <page>` then one `## <image-filename>` section per analyzed
   image (or per DO/DON'T pair, or per GIF interaction), using the tier template fields.
10. Your final message: just list the analysis files written and any images you skipped with reasons.


### Page: `ux-kpi` (section: components)
- Page text: `corpus/pages/ux-kpi.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-kpi.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| kpi_adjacent.png | 510x178 | B | neutral | KPI with "ADJACENT" template | Templates |
| kpi_compact.png | 426x188 | B | neutral | KPI with "COMPACT" template | Templates |
| kpi_do.png | 468x186 | C | do | KPI with trend | When to use a KPI |
| kpi_do_simple.png | 468x132 | C | do | Simple KPI (no trend) | When to use a KPI |
| kpi_dont.png | 468x168 | C | dont | alttext | When to use a KPI |
| kpi_example_card.png | 2108x378 | B | neutral |  | Multiple KPIs in a card |
| kpi_example_chart.png | 1112x734 | A | neutral |  | KPI with chart |
| kpi_example_chart_micro.png | 624x404 | B | neutral |  | KPI with chart |
| kpi_example_overlay.png | 2106x600 | A | neutral |  | KPI overlay |
| kpi_example_progress.png | 2146x308 | B | neutral |  | KPI with progress bar |
| kpi_example_sparkline.png | 2156x288 | B | neutral |  | KPI with sparkline |
| kpi_stacked.png | 460x298 | B | neutral | KPI with "STACKED" template | Templates |
| kpi_text.png | 468x176 | B | neutral | KPI primary and secondary text | KPI display text |
| kpi_trendIcon.png | 468x180 | C | do | Simple KPI (no trend) | Icons |
| kpi_trend_auto.png | 468x178 | B | neutral | KPI with "AUTO" trend configuration | Trends |
| kpi_trend_difference.png | 468x180 | B | neutral | KPI with "DIFFERENCE" trend configuration | Trends |
| kpi_trend_percentage.png | 468x178 | B | neutral | KPI with "PERCENTAGE" trend configuration | Trends |
