# Analysis batch 19

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


### Page: `components` (section: components)
- Page text: `corpus/pages/components.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/components.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| component_welcome_image.png | 3360x1502 | A | neutral | component_welcome_image.png | Components Overview |

### Page: `ux-billboard-layout` (section: components)
- Page text: `corpus/pages/ux-billboard-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-billboard-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| billboard_auto_height.png | 3470x1729 | A | neutral | ds-images/billboard_auto_height.png | Billboard height |
| billboard_do.png | 2460x790 | C | do | alttext | When to use a billboard layout |
| billboard_dont.png | 2724x894 | C | dont | alttext | When to use a billboard layout |
| billboard_fixed_height.png | 3481x1728 | A | neutral | ds-images/billboard_fixed_height.png | Billboard height |
| billboard_overlay_do.png | 2338x498 | C | do | alttext | Overlay style |
| billboard_overlay_dont.png | 2344x504 | C | dont | alttext | Overlay style |
| overview_billboard_styles.png | 2400x488 | B | neutral | ds-images/overview_billboard_styles.png | When to use a billboard layout |
| overview_section_spacing.png | 2018x778 | A | neutral | ds-images/overview_section_spacing.png | Billboard spacing |

### Page: `ux-box-layout` (section: components)
- Page text: `corpus/pages/ux-box-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-box-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| box_dont_nest.png | 1854x526 | C | dont | alttext | When to use a box layout |
| box_for_sections.png | 3060x1894 | C | do | alttext | Designate primary content sections |
| box_layout_border.png | 828x346 | C | do | alttext | When to use borders and shadows |
| box_layout_example.png | 1172x128 | B | neutral | ds-images/box_layout_example.png | Highlight key information and controls |
| box_layout_shadow.png | 878x350 | C | do | alttext | When to use borders and shadows |
| box_mixed_styles.png | 3308x1172 | C | dont | alttext | Designate primary content sections |
