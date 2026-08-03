# Analysis batch 39

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


### Page: `ux-color-overview` (section: guidance)
- Page text: `corpus/pages/ux-color-overview.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-color-overview.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| color_block_do.png | 1510x874 | C | do | alttext | Using color to convey page structure |
| color_block_dont.png | 1510x874 | C | dont | alttext | Using color to convey page structure |
| color_header_flush.png | 1510x874 | C | do | alttext | Using color to convey page structure |
| color_in_content.png | 814x1074 | B | neutral | ds-images/color_in_content.png | Using color in images and icons |
| color_info_do.png | 3356x1760 | C | do | alttext | Using color to highlight information |
| color_info_dont.png | 3356x1760 | C | dont | alttext | Using color to highlight information |
| color_opacity_do.png | 1999x1040 | C | do | alttext | Using color to create layers |
| color_palette_do.png | 1551x938 | C | do | alttext | Introduction |
| color_palette_dont.png | 1532x938 | C | dont | alttext | Introduction |

### Page: `ux-columns-and-side-by-side` (section: guidance)
- Page text: `corpus/pages/ux-columns-and-side-by-side.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-columns-and-side-by-side.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| colsbs_1.png | 3360x1894 | A | neutral | ds-images/colsbs_1.png | Introduction |
| colsbs_3.png | 3360x1978 | A | neutral | ds-images/colsbs_3.png | Introduction |
| colsbs_6.png | 1672x1100 | A | neutral | ds-images/colsbs_6.png | Introduction |
