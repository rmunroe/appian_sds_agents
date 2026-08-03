# Analysis batch 48

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


### Page: `data-value-display` (section: patterns)
- Page text: `corpus/pages/data-value-display.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/data-value-display.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image10.png | 1999x147 | B | neutral |  | Key attribute values |
| image36.png | 1974x338 | B | neutral |  | Performance against targets |
| image38.png | 1999x154 | B | neutral |  | Performance indicators with trend microcharts |
| image47.png | 1999x1250 | A | neutral |  | Easy-to-scan field summary |
| image54.png | 1844x220 | B | neutral |  | Simple performance indicators |
| image59.png | 1592x454 | B | neutral |  | Simple performance indicators |
| image90.png | 1999x298 | B | neutral |  | Performance indicators with goal progress bars |
| image97.png | 1876x484 | B | neutral |  | Supplemental information for performance indicator |

### Page: `employee-home-pages` (section: patterns)
- Page text: `corpus/pages/employee-home-pages.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/employee-home-pages.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| employee-home-page-low-density.png | 2412x1428 | A | neutral | Example of an employee home page for a brokerage firm. | Low information density |
| image2.png | 1999x1250 | A | neutral |  | Focusing attention on the main information |
| image43.png | 1999x1250 | A | neutral | Example of an employee home page for a company organizing do | Record actions |
| image53.png | 1922x1200 | A | neutral | Example of an employee home page for a company organizing do | Highlights list |
| image77.png | 1924x1200 | A | neutral | Example of an employee home page for a company organizing do | Preserve layout consistency when data changes |
| image8.png | 1999x1250 | A | neutral |  | Choosing the right type of header |
| worker-home-page-three-column.png | 2406x1140 | A | neutral | Example of an employee home page for a case management compa | High information density |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): ins_agent_home_page.png
