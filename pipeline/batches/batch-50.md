# Analysis batch 50

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


### Page: `introduction` (section: patterns)
- Page text: `corpus/pages/introduction.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/introduction.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image3.png | 1999x1250 | A | neutral |  | Start all of your designs by browsing for ideas an |
| image5.png | 1999x1250 | A | neutral |  | Choose the best design pattern for each page or co |
| image76.png | 1999x1503 | A | neutral |  | Use a top-down site map to facilitate project plan |
| image81.png | 1999x1250 | A | neutral |  | Aim for consistency across UIs |
| image94.png | 1978x1280 | A | neutral |  | Clearly express information hierarchy |

### Page: `kanban` (section: patterns)
- Page text: `corpus/pages/kanban.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/kanban.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| kanban-add-task-form.png | 758x704 | B | neutral |  | Add task form |
| kanban-board.png | 1658x1083 | A | neutral |  | Kanban board |
