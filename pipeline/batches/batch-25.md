# Analysis batch 25

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


### Page: `ux-form-layout` (section: components)
- Page text: `corpus/pages/ux-form-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-form-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| form-column-do.png | 1436x1554 | C | do | image | Use one narrow column for the form content |
| form-column-dont.png | 2064x1358 | C | dont | image | Use one narrow column for the form content |
| form-columns-do-buttons.png | 1374x966 | C | do | image | Don't add additional columns to center form conten |
| form-columns-dont-buttons.png | 1576x990 | C | dont | image | Don't add additional columns to center form conten |
| form_layout_button_divider.png | 1000x375 | B | neutral | form_layout_button_divider | Show button divider parameter |
| form_layout_button_placement_multiple.png | 2000x574 | A | neutral | placement of multiple primary and secondary buttons | Buttons parameter |
| form_layout_button_placement_stacked.png | 2000x688 | A | neutral | stacked buttons | Buttons parameter |
| form_layout_button_placement_vertical.png | 2000x557 | A | neutral | side by side buttons | Buttons parameter |
| form_layout_contents.png | 2000x1128 | A | neutral | form_layout_contents | Contents parameter |
| form_layout_dark_colors.png | 1222x688 | A | neutral | dark color scheme in forms | Form background color parameter |
| form_layout_do_narrrow_width.png | 2596x1160 | C | do | form_layout_do_narrrow_width | Use one narrow column for the form content |
| form_layout_dont_narrrow_width.png | 2596x1148 | C | dont | form_layout_dont_narrrow_width | Use one narrow column for the form content |
| form_layout_drag_from_palette.gif frames: frames/form_layout_drag_from_palette_f0.png, frames/form_layout_drag_from_palette_f16.png, frames/form_layout_drag_from_palette_f32.png, frames/form_layout_drag_from_palette_f48.png, frames/form_layout_drag_from_palette_f63.png | 2492x1076 | GIF | neutral | gif of a user dragging a form layout into their interface fr | When to use a form layout |
| form_layout_example_updated.png | 2000x1128 | A | neutral | form_layout_example | Introduction |
| form_layout_fixed_header.gif frames: frames/form_layout_fixed_header_f0.png, frames/form_layout_fixed_header_f26.png, frames/form_layout_fixed_header_f53.png, frames/form_layout_fixed_header_f79.png, frames/form_layout_fixed_header_f105.png | 2068x1408 | GIF | neutral | gif of title bar remaining fixed while user scrolls | Fix title bar when scrolling parameter |
| form_layout_focus_false.gif frames: frames/form_layout_focus_false_f0.png, frames/form_layout_focus_false_f7.png, frames/form_layout_focus_false_f15.png, frames/form_layout_focus_false_f22.png, frames/form_layout_focus_false_f29.png | 1356x928 | GIF | neutral | form_layout_focus_true | Automatically focus on first input parameter |
| form_layout_focus_true.gif frames: frames/form_layout_focus_true_f0.png, frames/form_layout_focus_true_f7.png, frames/form_layout_focus_true_f15.png, frames/form_layout_focus_true_f22.png, frames/form_layout_focus_true_f29.png | 1360x924 | GIF | neutral | form_layout_focus_true | Automatically focus on first input parameter |
| form_layout_form_width.gif frames: frames/form_layout_form_width_f0.png, frames/form_layout_form_width_f38.png, frames/form_layout_form_width_f76.png, frames/form_layout_form_width_f114.png, frames/form_layout_form_width_f151.png | 2716x1176 | GIF | neutral | gif of form layout changing width | Contents width parameter |
| form_layout_titleBar.png | 2000x1128 | A | neutral | Title bar in a form layout | Title bar template parameter |
| form_layout_titleBarDivider.png | 1000x375 | B | neutral | Title bar divider in a form layout | Show title bar divider parameter |
| form_layout_transparent.png | 1282x1166 | A | neutral | image of form with a white card on a transparent background | Form background color parameter |
| form_layout_transparent_compare.png | 2157x1503 | A | neutral | image comparing a white background color and a transparent b | Use transparent background color or hex code when  |
| form_layout_validation_message.png | 1650x872 | A | neutral | form_layout_validation_message | Validations parameter |
| forms-checklist.png | 907x486 | B | neutral | Example of a form to create a new checklist | Use cards and headings to group related content |
| forms-fixed-width.png | 1812x913 | A | neutral | Example of a form to register a new student | Constrain input width and group related fields |
| header-template-compare.png | 1293x803 | A | neutral | header-template-compare | Title bar template parameter |
| image-header-do.png | 1438x1106 | C | do | image | Image header template guidelines |
| image-header-dont.png | 1436x1292 | C | dont | image | Image header template guidelines |
| image-header-portal.png | 2520x1616 | A | neutral | image-header-portal | Choosing a title bar template |
| sidebar-template-example-ds.png | 2552x1484 | A | neutral | sidebar-template-example-ds.png | Choosing a title bar template |
| simple-header-example.png | 1438x1800 | A | neutral | simple-header-example | Choosing a title bar template |
| ux-full-header-template-choose.png | 740x373 | B | neutral | Form with full header template | Choosing a title bar template |
