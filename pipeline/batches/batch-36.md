# Analysis batch 36

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


### Page: `ux-tags` (section: components)
- Page text: `corpus/pages/ux-tags.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-tags.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| attribute_tag.png | 3360x1946 | A | neutral | ds-images/attribute_tag.png | When to use tags |
| new_tag.png | 2516x1194 | A | neutral | ds-images/new_tag.png | When to use tags |
| tag_lists.png | 2964x1616 | A | neutral | ds-images/tag_lists.png | When to use tags |
| tag_side_by_side.png | 1089x125 | B | neutral | ds-images/tag_side_by_side.png | When to use tags |
| tag_text_capitalization.png | 640x170 | B | neutral | ds-images/tag_text_capitalization.png | Effective tag text |
| tag_text_do.png | 646x82 | C | do | alttext | Effective tag text |
| tag_text_dont.png | 1080x86 | C | dont | alttext | Effective tag text |
