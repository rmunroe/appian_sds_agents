# Analysis batch 33

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


### Page: `ux-rich-text` (section: components)
- Page text: `corpus/pages/ux-rich-text.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-rich-text.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| emphasis_style_alternative_do.png | 1614x322 | C | do | alttext | Emphasis style |
| emphasis_style_do.png | 1442x162 | C | do | alttext | Emphasis style |
| font_features.png | 998x640 | A | neutral | ds-images/font_features.png | Using varied font features |
| font_features_do.png | 2569x940 | C | do | alttext | Using varied font features |
| font_features_dont.png | 2568x924 | C | dont | alttext | Using varied font features |
| italics_dont.png | 1438x156 | C | dont | alttext | Emphasis style |
| negative-text_dont.png | 1810x838 | C | dont | alttext | Positive and negative colors |
| positive-style_do.png | 246x56 | C | do | alttext | Positive and negative colors |
| richtext_do.png | 934x212 | C | do | alttext | Accessibility considerations |

### Page: `ux-section-layout` (section: components)
- Page text: `corpus/pages/ux-section-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-section-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| filterControls_do.png | 1047x352 | C | do | alttext | Collapsible sections |
| filterControls_dont.png | 830x324 | C | dont | alttext | Collapsible sections |
| mixCollapsible_dont.png | 1269x300 | C | dont | alttext | Collapsible sections |
| overview_sections_1.png | 2866x1800 | A | neutral | ds-images/overview_sections_1.png | When to use a section layout |
| sectionLabelSizes.png | 2368x874 | C | do | alttext | Use varied section label sizes |
