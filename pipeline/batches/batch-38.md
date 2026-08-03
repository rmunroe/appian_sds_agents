# Analysis batch 38

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


### Page: `guidance` (section: guidance)
- Page text: `corpus/pages/guidance.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/guidance.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| ux_getting_started.png | 1143x448 | B | neutral | ds-images/ux_getting_started.png | Designing efficient, intuitive, and beautiful user |

### Page: `ux-accessibility` (section: guidance)
- Page text: `corpus/pages/ux-accessibility.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-accessibility.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| accessibility_text.png | 1468x652 | A | neutral | ds-images/accessibility_text.png | Use accessibility text to provide supplemental inf |
| accessible_headers_do.png | 1468x564 | C | do | alttext | Use accessible headers |
| accessible_headers_dont.png | 1464x570 | C | dont | alttext | Use accessible headers |

### Page: `ux-avoiding-clutter` (section: guidance)
- Page text: `corpus/pages/ux-avoiding-clutter.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-avoiding-clutter.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| billboard_image_clutter_dont.png | 1175x225 | C | dont | alttext | Use billboards sparingly |
| grid_clutter_dont.png | 1175x514 | C | dont | alttext | Utilize navigation and progressive disclosure |
| more_link_do.png | 1176x294 | C | do | alttext | Utilize navigation and progressive disclosure |
| nested__comments_do.png | 560x225 | C | do | alttext | Avoid nested cards and boxes |
| nested_comments_dont.png | 718x345 | C | dont | alttext | Avoid nested cards and boxes |
| nested_navigation_do.png | 2194x514 | C | do | alttext | Avoid nested cards and boxes |
| nested_navigation_dont.png | 2194x988 | C | dont | alttext | Avoid nested cards and boxes |
| no_billboard_do.png | 1678x874 | C | do | alttext | Use billboards sparingly |
| record_tabs_do.png | 1520x812 | C | do | alttext | Utilize navigation and progressive disclosure |

### Page: `ux-buttons-vs-links` (section: guidance)
- Page text: `corpus/pages/ux-buttons-vs-links.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-buttons-vs-links.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| link_vs_button_2.png | 1660x524 | A | neutral | ds-images/link_vs_button_2.png | When to use buttons versus links |
| ux_buttons_links.png | 1955x258 | B | neutral | ds-images/ux_buttons_links.png | When to use buttons versus links |
| ux_buttons_vs_links.png | 1071x573 | A | neutral | ds-images/ux_buttons_vs_links.png | When to use buttons versus links |
