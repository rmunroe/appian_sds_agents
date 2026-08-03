# Analysis batch 22

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


### Page: `ux-charts` (section: components)
- Page text: `corpus/pages/ux-charts.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-charts.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| area_DONT_none.png | 684x429 | C | dont | alttext | Area charts |
| area_DONT_stacking.png | 804x428 | C | dont | alttext | Area charts |
| area_DO_none.png | 807x429 | C | do | alttext | Area charts |
| area_DO_stacking.png | 1084x429 | C | do | alttext | Area charts |
| bar_DO_longLabels.png | 1224x856 | C | do | alttext | Bar charts |
| charts_dashboard.png | 1601x941 | A | neutral | ds-images/charts_dashboard.png | Introduction |
| col_DO_negValues.png | 2382x908 | C | do | alttext | Column charts |
| col_DO_time.png | 2386x912 | C | do | alttext | Column charts |
| color_DONT_coloredCard.png | 1116x526 | C | dont | alttext | Background colors |
| color_DONT_fivePlus.png | 2374x904 | C | dont | alttext | Colors |
| color_DONT_multipleSchemes.png | 2380x910 | C | dont | alttext | Consistent colors |
| color_DONT_similar.png | 2382x906 | C | dont | alttext | Colors for distinct categories |
| color_DONT_transparentBackground.png | 2352x934 | C | dont | alttext | Background colors |
| color_DO_bright.png | 2382x906 | C | do | alttext | Colors for distinct categories |
| color_DO_col_gradient.png | 2372x906 | C | do | alttext | Colors to represent data values |
| color_DO_contrast.png | 1188x874 | C | do | alttext | Colors for distinct categories |
| color_DO_highlight.png | 2384x918 | C | do | alttext | Colors for distinct categories |
| color_DO_pie_gradient.png | 1046x900 | C | do | alttext | Colors to represent data values |
| color_DO_transparentBackground.png | 2390x1090 | C | do | alttext | Background colors |
| height_DONT_container.png | 1186x300 | C | dont | alttext | Visual balance |
| height_DONT_data.png | 1728x258 | C | dont | alttext | Adapting charts to shorter heights |
| height_DONT_fixedBar.png | 2386x504 | C | dont | alttext | Height proportional to size of data |
| height_DONT_mismatched.png | 2388x1318 | C | dont | alttext | Visual balance |
| height_DONT_short.png | 2364x500 | C | dont | alttext | Height proportional to size of data |
| height_DO_balance.png | 3160x1518 | C | do | alttext | Visual balance |
| height_DO_dashboard_short.png | 1601x941 | C | do | alttext | Visual balance |
| height_DO_microHideAxes.png | 1690x262 | C | do | alttext | Adapting charts to shorter heights |
| line_DONT_fiveLines.png | 2388x914 | C | dont | alttext | Line charts |
| line_DO_gaps.png | 2386x914 | C | do | alttext | Line charts |
| line_DO_time.png | 2388x916 | C | do | alttext | Line charts |
| line_do_scale_new.png | 2372x858 | C | do | alttext | Line charts |
| pie_DONT_multiple.png | 2382x908 | C | dont | alttext | Pie charts |
| pie_DO_proportional.png | 916x868 | C | do | alttext | Pie charts |
| scatter_DONT_compare.png | 1172x846 | C | do | alttext | Scatter charts |
| scatter_DONT_qualitative.png | 1446x878 | C | dont | alttext | Scatter charts |
| scatter_DO_compare.png | 1174x846 | C | do | alttext | Scatter charts |
| sort_DO_bar_descend.png | 2382x912 | C | do | alttext | Pie chart and bar chart |
| sort_DO_col_ascend.png | 2384x914 | C | do | alttext | Column chart |
| sort_DO_col_time.png | 2386x914 | C | do | alttext | Column chart and line chart |
| sort_DO_pie_descend.png | 1144x886 | C | do | alttext | Pie chart and bar chart |
| text_DONT_hideLabels.png | 1666x486 | C | dont | alttext | Labels, legends, and tooltips |
| text_DONT_legend.png | 2388x910 | C | dont | alttext | Labels, legends, and tooltips |
| text_DONT_longLabels.png | 511x433 | C | dont | alttext | Labels, legends, and tooltips |
| text_DONT_seriesLabel.png | 817x407 | C | dont | alttext | Labels, legends, and tooltips |
| text_DONT_slices.png | 1140x880 | C | dont | alttext | Pie charts |
| text_DONT_tooltip.png | 808x508 | C | dont | alttext | Labels, legends, and tooltips |
| text_DO_dashboards_axes.png | 1601x941 | C | do | alttext | Labels, legends, and tooltips |
| text_DO_other.png | 2382x904 | C | do | alttext | Labels, legends, and tooltips |
