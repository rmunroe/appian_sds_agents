# Analysis batch 29

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


### Page: `ux-images` (section: components)
- Page text: `corpus/pages/ux-images.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-images.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| avatar_image_style.png | 1210x582 | A | neutral | ds-images/avatar_image_style.png | Styles |
| avatar_image_style2.png | 1806x1032 | A | neutral | ds-images/avatar_image_style2.png | Styles |
| gallery_size_image.png | 1244x190 | B | neutral | ds-images/gallery_size_image.png | Sizes |
| icons_do.png | 843x187 | C | do | ds-images/icons_do.png | Images vs. icons |
| icons_dont.png | 1564x294 | C | dont | ds-images/icons_dont.png | Images vs. icons |
| image_quality.png | 1733x734 | A | neutral | ds-images/image_quality.png | Image quality |
| image_size.png | 548x330 | B | neutral | ds-images/image_size.png | Sizes |
| standard_image_style.png | 2282x1446 | A | neutral | ds-images/standard_image_style.png | Styles |
| stock_photography_dont.png | 1239x313 | C | dont | alttext | Stock photography |
