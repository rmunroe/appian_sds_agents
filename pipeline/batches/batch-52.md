# Analysis batch 52

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


### Page: `page-headers` (section: patterns)
- Page text: `corpus/pages/page-headers.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/page-headers.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image11.png | 1999x1250 | A | neutral |  | Filter bar header |
| image42.png | 1999x1249 | A | neutral |  | Key performance indicators header |
| image44.png | 1999x1250 | A | neutral |  | Title bar header |
| image49.png | 1999x1249 | A | neutral |  | Use a card to create high contrast for overlay con |
| image57.png | 1999x1249 | A | neutral |  | Mix and match header types |
| image75.png | 1999x1249 | A | neutral |  | Hero card header |
| image82.png | 1999x1250 | A | neutral |  | Decorative billboard header |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): forms-sidebar-for-eligibility-information.png

### Page: `page-titles` (section: patterns)
- Page text: `corpus/pages/page-titles.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/page-titles.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image27.png | 1999x1250 | A | neutral | screenshot of a dashboard with a divider line | Standard page title with divider line |
| image73.png | 1999x1250 | A | neutral | screenshot showing an image gallery page with a standard pag | Standard page title |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): image11.png, image44.png, image47.png, image87.png

### Page: `popular-patterns` (section: patterns)
- Page text: `corpus/pages/popular-patterns.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/popular-patterns.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| dual_picklist_grids.png | 2498x904 | A | neutral |  | Dual picklist (grids) |
| dual_picklist_simple.png | 2442x758 | A | neutral |  | Dual picklist (simple) |
| image84.png | 654x1186 | B | neutral |  | Vertical timeline |

### Page: `record-views` (section: patterns)
- Page text: `corpus/pages/record-views.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/record-views.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image24.png | 1999x1250 | A | neutral |  | Case summary page (alternative) |
| image34.png | 1999x1250 | A | neutral |  | Basic record view with cards |
| image66.png | 1999x1257 | A | neutral |  | Case summary record view |
| image72.png | 1681x1008 | A | neutral |  | Basic record view (alternative) |
| record-view-custom-header.png | 2420x492 | B | neutral |  | Custom record header |
