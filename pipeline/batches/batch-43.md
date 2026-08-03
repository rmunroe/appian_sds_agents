# Analysis batch 43

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


### Page: `ux-labels` (section: guidance)
- Page text: `corpus/pages/ux-labels.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-labels.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| ux_format_do.png | 884x130 | C | do | ds-images/ux_format_do.png | Label format |
| ux_format_dont.png | 886x138 | C | dont | ds-images/ux_format_dont.png | Label format |
| ux_labelPositionAboveDo.png | 2290x644 | C | do | ds-images/ux_labelPositionAboveDo.png | Above |
| ux_labelPositionAboveDont.png | 2280x592 | C | dont | ds-images/ux_labelPositionAboveDont.png | Above |
| ux_label_adjacent_do.png | 436x308 | C | do | ds-images/ux_label_adjacent_do.png | Adjacent and justified |
| ux_label_adjacent_dont.png | 242x548 | C | dont | ds-images/ux_label_adjacent_dont.png | Adjacent and justified |
| ux_label_redundant_do.png | 1944x368 | C | do | ds-images/ux_label_redundant_do.png | Redundant labels |
| ux_label_redundant_dont.png | 1952x386 | C | dont | ds-images/ux_label_redundant_dont.png | Redundant labels |
| ux_labels_consistent.png | 1054x488 | C | dont | ds-images/ux_labels_consistent.png | Consistency |
| ux_labels_excluded.png | 2022x888 | A | neutral | ds-images/ux_labels_excluded.png | Excluding labels |
| ux_labels_links.png | 1030x378 | C | dont | ds-images/ux_labels_links.png | Link labels |
| ux_labels_rich_text_do.png | 676x558 | C | do | alttext | Rich text headers |
| ux_labels_rich_text_dont.png | 794x536 | C | dont | alttext | Rich text headers |
| ux_labels_tone_do.png | 960x504 | C | do | alttext | Consistent tone |
| ux_labels_tone_dont.png | 964x504 | C | dont | alttext | Consistent tone |
| uxdg_labels_adjacent.png | 848x722 | B | neutral | ds-images/uxdg_labels_adjacent.png | Adjacent and justified |
| uxdg_labels_compared.png | 1346x428 | B | neutral | ds-images/uxdg_labels_compared.png | Position |
| uxdg_labels_justified.png | 846x706 | B | neutral | ds-images/uxdg_labels_justified.png | Adjacent and justified |
