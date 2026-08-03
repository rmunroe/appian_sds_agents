# Analysis batch 47

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


### Page: `sail-benefits` (section: overview)
- Page text: `corpus/pages/sail-benefits.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/sail-benefits.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| drag_and_drop.gif frames: frames/drag_and_drop_f0.png, frames/drag_and_drop_f12.png, frames/drag_and_drop_f25.png, frames/drag_and_drop_f38.png, frames/drag_and_drop_f50.png | 2744x1632 | GIF | neutral | gif of drag_and_drop | Perfect handoff between design and development |
| responsive_design.gif frames: frames/responsive_design_f0.png, frames/responsive_design_f13.png, frames/responsive_design_f27.png, frames/responsive_design_f40.png, frames/responsive_design_f53.png | 1509x829 | GIF | neutral | gif of responsive design | Works automatically on web and native mobile |

### Page: `sail-design` (section: overview)
- Page text: `corpus/pages/sail-design.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/sail-design.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| component_configuration_updates.png | 1194x1242 | A | neutral | updating component configuration | Working with components and expressions |
| street_address.png | 800x160 | B | neutral | street address text field | Working with components and expressions |

### Page: `sail-design-system-overview` (section: overview)
- Page text: `corpus/pages/sail-design-system-overview.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/sail-design-system-overview.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| insurance_quote_demo.gif frames: frames/insurance_quote_demo_f0.png, frames/insurance_quote_demo_f27.png, frames/insurance_quote_demo_f55.png, frames/insurance_quote_demo_f82.png, frames/insurance_quote_demo_f109.png | 1352x943 | GIF | neutral | insurance_quote_demo.gif | SAIL UI framework |

### Page: `calendar` (section: patterns)
- Page text: `corpus/pages/calendar.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/calendar.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| calendar-month-view.png | 1498x925 | A | neutral |  | Month view |
| calendar-week-view.png | 1498x427 | B | neutral |  | Week view |

### Page: `comment-thread` (section: patterns)
- Page text: `corpus/pages/comment-thread.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/comment-thread.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| comment-thread.png | 838x953 | B | neutral |  | With replies and attachments |
| image39.png | 1999x1250 | A | neutral |  | Full page |
| image45.png | 1999x1250 | A | neutral |  | Widget |

### Page: `content-structure` (section: patterns)
- Page text: `corpus/pages/content-structure.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/content-structure.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image13.png | 1999x1250 | A | neutral |  | Omitting section headings |
| image20.png | 1999x1250 | A | neutral |  | Secondary section heading in cards |
| image21.png | 1999x1250 | A | neutral |  | Primary content card heading |
| primary_heading_highlight.png | 1142x754 | A | neutral |  | Primary section heading |
| secondary_heading_highlight.png | 1600x1000 | A | neutral |  | Secondary section heading |

### Page: `dashboards` (section: patterns)
- Page text: `corpus/pages/dashboards.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/dashboards.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| dashboards-focusing-user-attention.png | 1840x1160 | A | neutral | Example of a dashboard displaying metrics for award cycle ti | Providing the right amount of detail with column d |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): co2_cso_landing_page.png, sales_dashboard_dark_theme.png
