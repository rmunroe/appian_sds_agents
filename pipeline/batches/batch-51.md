# Analysis batch 51

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


### Page: `lists` (section: patterns)
- Page text: `corpus/pages/lists.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/lists.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| contact-list.png | 1466x1540 | A | neutral |  | Contact list |
| image19.png | 802x784 | B | neutral |  | Notifications highlights |
| image25.png | 399x634 | B | neutral |  | Discussion thread highlights |
| image32.png | 1999x1250 | A | neutral |  | Photo gallery card record list |
| image4.png | 1642x1364 | A | neutral |  | Detailed event history |
| image41.png | 800x584 | B | neutral |  | Link list |
| image50.png | 365x743 | B | neutral |  | Checklist |
| image67.png | 1999x1250 | A | neutral |  | Message inbox |
| image68.png | 972x528 | A | neutral |  | Simple event history |
| image83.png | 1042x946 | A | neutral |  | Document list |
| image86.png | 1999x1647 | A | neutral |  | Document thumbnail browser |
| image96.png | 1999x1250 | A | neutral |  | Full page empty state message |
| task-list.png | 838x812 | B | neutral |  | Task list |

### Page: `online-shopping-journey` (section: patterns)
- Page text: `corpus/pages/online-shopping-journey.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/online-shopping-journey.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| image64.png | 1999x1250 | A | neutral |  | Item details page and cart |
| image65.png | 1999x1250 | A | neutral |  | Checkout page |
| image87.png | 1999x1250 | A | neutral |  | Non-retail item directory |
| image9.png | 1999x1250 | A | neutral |  | Item category listing |
| image93.png | 1999x1250 | A | neutral |  | Non-retail item details with required questionnair |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): forms-sidebar-for-eligibility-information.png
