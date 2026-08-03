# Analysis batch 31

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


### Page: `ux-pane-layout` (section: components)
- Page text: `corpus/pages/ux-pane-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-pane-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| pane_background_color_cards.png | 3910x2124 | A | neutral | Pane background color with cards | Use a custom background color to match company bra |
| pane_in_form.png | 2272x1672 | A | neutral | pane layout in form layout example | Pane layout in a form layout |
| pane_in_hcl.png | 2574x1726 | A | neutral | pane layout in header content layout example | Pane layout in a header content layout |
| pane_layout_drag_and_drop.gif frames: frames/pane_layout_drag_and_drop_f0.png, frames/pane_layout_drag_and_drop_f9.png, frames/pane_layout_drag_and_drop_f19.png, frames/pane_layout_drag_and_drop_f29.png, frames/pane_layout_drag_and_drop_f38.png | 2492x1884 | GIF | neutral | Dragging a pane layout onto an empty interface | Pane layout parameter configurations |
| pane_layout_width_auto_example.png | 4112x1716 | C | do | alttext | Using automatic pane widths |
| pane_layout_width_do.gif frames: frames/pane_layout_width_do_f0.png, frames/pane_layout_width_do_f34.png, frames/pane_layout_width_do_f68.png, frames/pane_layout_width_do_f102.png, frames/pane_layout_width_do_f136.png | 1590x670 | GIF | do | alttext | Using fixed pane widths |
| pane_layout_width_dont.gif frames: frames/pane_layout_width_dont_f0.png, frames/pane_layout_width_dont_f35.png, frames/pane_layout_width_dont_f70.png, frames/pane_layout_width_dont_f105.png, frames/pane_layout_width_dont_f140.png | 1590x670 | GIF | dont | alttext | Using fixed pane widths |
| pane_layout_width_wide_plus_example.png | 4112x1716 | C | dont | alttext | Using automatic pane widths |
| pane_padding_progression.gif frames: frames/pane_padding_progression_f0.png, frames/pane_padding_progression_f6.png, frames/pane_padding_progression_f13.png, frames/pane_padding_progression_f19.png, frames/pane_padding_progression_f25.png | 1598x904 | GIF | neutral | Pane padding example progression | Padding parameter |
| pane_top_level.png | 1504x706 | A | neutral | pane_top_level.png | Pane layout as a top-level layout |
