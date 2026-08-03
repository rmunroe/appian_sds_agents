# Analysis batch 53

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


### Page: `secondary-navigation` (section: patterns)
- Page text: `corpus/pages/secondary-navigation.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/secondary-navigation.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| horizontal_tabs_framed.png | 2986x1584 | A | neutral | horizontal tabs | Framed horizontal navigation |
| image1.png | 1999x1250 | A | neutral |  | Vertical navigation with sections |
| image14.png | 1999x1250 | A | neutral |  | Icon-only vertical navigation |
| image22.png | 1999x1250 | A | neutral |  | Vertical navigation with contrasting background co |
| image23.png | 1999x1250 | A | neutral |  | Vertical navigation next to custom header |
| image28.png | 1999x1250 | A | neutral |  | Icon-only vertical navigation with secondary verti |
| image70.png | 1999x1250 | A | neutral | img | Vertical navigation with transparent page backgrou |
| image78.png | 1999x1250 | A | neutral |  | More prominent selected page style for vertical na |
| image80.png | 1999x1250 | A | neutral |  | Vertical navigation under custom header |
| image95.png | 1999x1250 | A | neutral |  | Basic vertical navigation |
| image98.gif frames: frames/image98_f0.png, frames/image98_f1.png | 1680x1050 | GIF | neutral |  | Collapsible vertical navigation |
| insurance_account_page_manual_tabs.png | 2872x1939 | A | neutral |  | Basic horizontal navigation |

### Page: `tabular-data-display` (section: patterns)
- Page text: `corpus/pages/tabular-data-display.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/tabular-data-display.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image31.png | 1999x1046 | A | neutral |  | List-style grid |
| image37.png | 1999x1469 | A | neutral |  | Spreadsheet-style grid |
| image40.png | 1844x1652 | A | neutral |  | Grids for smaller device widths |
| image62.png | 1999x1250 | A | neutral |  | User controls on records-powered grids |

### Page: `visitor-landing-pages` (section: patterns)
- Page text: `corpus/pages/visitor-landing-pages.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/visitor-landing-pages.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| auto_insurance_portal_landing_page.png | 3420x1912 | A | neutral |  | Primary call-to-action |
| image56.png | 1999x1250 | A | neutral |  | Multiple calls-to-action |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): portal_home_page.png
