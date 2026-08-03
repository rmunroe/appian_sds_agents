# Analysis batch 23

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


### Page: `ux-columns-layout` (section: components)
- Page text: `corpus/pages/ux-columns-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-columns-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| columns_layout_autofixedCal_example.gif frames: frames/columns_layout_autofixedCal_example_f0.png, frames/columns_layout_autofixedCal_example_f8.png, frames/columns_layout_autofixedCal_example_f17.png, frames/columns_layout_autofixedCal_example_f26.png, frames/columns_layout_autofixedCal_example_f34.png | 1276x638 | GIF | neutral | Basic columns layout example showcasing fixed width | Width parameter |
| columns_layout_autowidth_example.gif frames: frames/columns_layout_autowidth_example_f0.png, frames/columns_layout_autowidth_example_f6.png, frames/columns_layout_autowidth_example_f12.png, frames/columns_layout_autowidth_example_f18.png, frames/columns_layout_autowidth_example_f23.png | 890x344 | GIF | neutral | Basic columns layout example showcasing automatic width | Width parameter |
| columns_layout_basicform_example.png | 2966x1575 | A | neutral | Basic columns layout example within a form layout | Columns layout parameter configurations |
| columns_layout_fixauto_example.png | 2710x1509 | C | do | Columns layout presenting fixed center content columns and e | Negative space |
| columns_layout_fixedwidth_example.gif frames: frames/columns_layout_fixedwidth_example_f0.png, frames/columns_layout_fixedwidth_example_f6.png, frames/columns_layout_fixedwidth_example_f12.png, frames/columns_layout_fixedwidth_example_f18.png, frames/columns_layout_fixedwidth_example_f24.png | 900x344 | GIF | neutral | Basic columns layout example showcasing fixed width | Width parameter |
| columns_layout_fullfix_example.png | 2710x1509 | C | dont | Columns layout with all columns set to fixed width. | Negative space |
| columns_layout_margins_example.png | 3623x3698 | A | neutral | ds-images/columns_layout_margins_example.png | Margin above and below parameters |
| columns_layout_pane_example.gif frames: frames/columns_layout_pane_example_f0.png, frames/columns_layout_pane_example_f15.png, frames/columns_layout_pane_example_f30.png, frames/columns_layout_pane_example_f45.png, frames/columns_layout_pane_example_f60.png | 1076x606 | GIF | neutral | ds-images/columns_layout_pane_example.gif | Columns vs. Pane |
| columns_layout_relative2_example.gif frames: frames/columns_layout_relative2_example_f0.png, frames/columns_layout_relative2_example_f5.png, frames/columns_layout_relative2_example_f10.png, frames/columns_layout_relative2_example_f15.png, frames/columns_layout_relative2_example_f19.png | 912x637 | GIF | neutral | Columns layout presenting relative columns remaining consist | Using relative column widths |
| columns_layout_relativewidth_example.gif frames: frames/columns_layout_relativewidth_example_f0.png, frames/columns_layout_relativewidth_example_f6.png, frames/columns_layout_relativewidth_example_f12.png, frames/columns_layout_relativewidth_example_f18.png, frames/columns_layout_relativewidth_example_f24.png | 906x356 | GIF | neutral | Basic columns layout example showcasing relative width | Width parameter |
| columns_layout_sbs_example.png | 3444x2042 | A | neutral | Dashboard interface example displaying a side by side layout | Columns vs. Side by Side |
| columns_layout_spacing_example.png | 3623x3395 | A | neutral | ds-images/columns_layout_spacing_example.png | Column spacing parameter |
| columns_layout_stacking_example.gif frames: frames/columns_layout_stacking_example_f0.png, frames/columns_layout_stacking_example_f5.png, frames/columns_layout_stacking_example_f10.png, frames/columns_layout_stacking_example_f15.png, frames/columns_layout_stacking_example_f20.png | 770x320 | GIF | neutral | Basic columns layout example showcasing columns stacking whe | Responsive stacking |
| columns_layout_vertAlign_example.png | 3862x3485 | A | neutral | ds-images/columns_layout_vertAlign_example.png | Vertical alignment parameter |
