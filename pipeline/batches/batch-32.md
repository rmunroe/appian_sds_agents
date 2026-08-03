# Analysis batch 32

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


### Page: `ux-record-actions` (section: components)
- Page text: `corpus/pages/ux-record-actions.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-record-actions.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| dialog-size-example.png | 1999x1401 | A | neutral | dialog window with full height and wide width | Dialog sizes |
| ra-dialog-width-do.png | 1999x1393 | C | do | delete confirmation dialog window with auto height and narro | Dialog sizes |
| ra-dialog-width-dont.png | 1999x1393 | C | dont | delete confirmation dialog window with auto height and wide  | Dialog sizes |
| ra_cards_do.png | 1480x756 | C | do | alttext | Cards |
| ra_cards_dont.png | 3288x1380 | C | dont | alttext | Cards |
| ra_cta_do.png | 1124x221 | C | do | alttext | Call to action |
| ra_cta_dont.png | 1577x542 | C | dont | alttext | Call to action |
| ra_dialog_do.png | 1488x927 | C | do | alttext | Dialog |
| ra_dialog_dont.png | 1488x927 | C | dont | alttext | Dialog |
| ra_displays.png | 1071x528 | A | neutral | ds-images/ra_displays.png | Display |
| ra_links_do.png | 1444x540 | C | do | alttext | Links |
| ra_links_dont.png | 2720x1368 | C | dont | alttext | Links |
| ra_sidebar_do.png | 1520x812 | C | do | alttext | Sidebar |
| ra_sidebar_dont.png | 1240x341 | C | dont | alttext | Sidebar |
| ra_toolbar_do.png | 1012x387 | C | do | alttext | Toolbar |
| ra_toolbar_dont.png | 1120x454 | C | dont | alttext | Toolbar |
| recordActionGridMenu.png | 1278x638 | C | do | alttext | Menu |
| recordActionGridMenuIcon.png | 1217x612 | C | do | alttext | Menu (Icon) |
