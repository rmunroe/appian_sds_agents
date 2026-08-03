# Analysis batch 21

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


### Page: `ux-card-layout` (section: components)
- Page text: `corpus/pages/ux-card-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-card-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| card-border-bar-do.png | 1492x516 | C | do | screenshot showing cards with decorative bars and matching c | Use decorative bar colors that complement card con |
| card-border-bar-dont.png | 1492x516 | C | dont | screenshot showing cards with decorative bars and mismatchin | Use decorative bar colors that complement card con |
| card-border-color.png | 1600x1014 | A | neutral | screenshot comparing default and accent card border colors | Border color parameter |
| card-border.png | 1600x1014 | A | neutral | Screenshot showing the difference in cards with or without b | Show border parameter |
| card-margins.png | 2048x1280 | A | neutral | ds-images/card-margins.png | Margins |
| card-style-do-border.png | 2000x500 | C | do | alttext | Avoid using card background color to denote meanin |
| card-style-dont-border.png | 2000x500 | C | dont | alttext | Avoid using card background color to denote meanin |
| card_background_color.png | 2000x1328 | A | neutral | ds-images/card_background_color.png | Style parameter |
| card_corner_rounding.png | 2000x1500 | A | neutral | ds-images/card_corner_rounding.png | Shape parameter |
| card_decorative_bar.png | 2000x850 | A | neutral | ds-images/card_decorative_bar.png | Decorative bar position parameter |
| card_height.png | 2000x1334 | A | neutral | ds-images/card_height.png | Height parameter |
| card_layout_with_link_and_button_border.png | 2000x1000 | C | dont | alttext | Navigation |
| card_nested.png | 2000x900 | A | neutral |  | Nested cards |
| card_nested_2.png | 2000x400 | B | neutral |  | Nested cards |
| card_padding.png | 2000x2670 | A | neutral | ds-images/card_padding.png | Padding parameter |
| card_selection_example_border.png | 2018x1380 | C | do | alttext | Navigation |
| card_shadow.png | 2000x1050 | A | neutral | ds-images/card_shadow.png | Show shadow parameter |
| card_width.png | 2600x900 | A | neutral | ds-images/card_width.png | Width |
| decorative-bar-border.png | 2000x450 | C | do | screenshot showing cards with decorative bars and gray card  | Use decorative bar colors that complement card con |
| decorative-bar-mixed-position-border.png | 2000x1200 | C | dont | alttext | Use decorative bar positions consistently |
| decorative-bar-same-position-border.png | 2000x1200 | C | do | alttext | Use decorative bar positions consistently |
| image11stacked.png | 2000x2716 | A | neutral | alttext | When to use a card layout |
| image16whitespace.png | 2000x1324 | C | dont | alttext | Page background for card-based pages |
| image17border.png | 2014x1350 | A | neutral | alttext | Show borders, but not shadows on white page backgr |
| image33stacked.png | 3200x700 | A | neutral | alttext | When to use a card layout |
| image46info.png | 2000x1324 | C | dont | alttext | Only use white background color for content cards |
| image63border.png | 2000x1300 | A | neutral | alttext | Limit use of background colors other than white |
| image74.gif frames: frames/image74_f0.png, frames/image74_f1.png | 1680x1050 | GIF | neutral |  | Padding |
| image79border.png | 2000x1250 | A | neutral | alttext | Don't show borders or shadows on dark page backgro |
| image88border.png | 2014x1350 | A | neutral | alttext | Show shadows, but not borders on transparent page  |
| trasparent_card_background.png | 930x152 | B | neutral | image showing two cards using transparent styles to match tw | Use transparent style for cards that will be layer |
