# Analysis batch 41

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


### Page: `ux-example-walkthrough` (section: guidance)
- Page text: `corpus/pages/ux-example-walkthrough.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-example-walkthrough.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| walkthrough_1.png | 2880x2034 | A | neutral | ds-images/walkthrough_1.png | Introduction |
| walkthrough_billboards.png | 2866x2400 | A | neutral | ds-images/walkthrough_billboards.png | Billboards |
| walkthrough_columns.png | 2880x4396 | A | neutral | ds-images/walkthrough_columns.png | Columns |
| walkthrough_narrow.png | 2880x1220 | A | neutral | ds-images/walkthrough_narrow.png | Page width |
| walkthrough_page_width.png | 2200x616 | A | neutral | ds-images/walkthrough_page_width.png | Page width |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): overview_sections_1.png

### Page: `ux-formatting-and-punctuation` (section: guidance)
- Page text: `corpus/pages/ux-formatting-and-punctuation.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-formatting-and-punctuation.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| actionFormTitles_do.png | 1528x89 | C | do | alttext | Action and task form titles |
| actionFormTitles_dont.png | 1528x244 | C | dont | alttext | Action and task form titles |
| capitalization_example.png | 935x658 | A | neutral | ds-images/capitalization_example.png | Capitalization |
| dateTimeFormat_do.png | 1110x80 | C | do | alttext | Date and time format |
| dateTimeFormat_dont.png | 1110x225 | C | dont | alttext | Date and time format |
| listViewItems_do.png | 1750x161 | C | do | alttext | List view items |
| listViewItems_dont.png | 1750x157 | C | dont | alttext | List view items |
| numberFormat_do.png | 356x164 | C | do | alttext | Number format |
| numberFormat_dont.png | 408x164 | C | dont | alttext | Number format |
| period_usage.png | 766x212 | C | do | alttext | Period usage |
| readOnlyFormat_do.png | 982x152 | C | do | alttext | Read-only format |
| readOnlyFormat_dont.png | 982x246 | C | dont | alttext | Read-only format |
