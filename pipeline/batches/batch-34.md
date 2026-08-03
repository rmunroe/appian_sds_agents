# Analysis batch 34

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


### Page: `ux-side-by-side-layout` (section: components)
- Page text: `corpus/pages/ux-side-by-side-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-side-by-side-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| colsbs_4.png | 1482x160 | B | neutral | ds-images/colsbs_4.png | Introduction |
| colsbs_5.png | 1172x646 | A | neutral | ds-images/colsbs_5.png | Use only as much space as necessary |
| minimizeDropdown.gif frames: frames/minimizeDropdown_f0.png, frames/minimizeDropdown_f16.png, frames/minimizeDropdown_f32.png, frames/minimizeDropdown_f48.png, frames/minimizeDropdown_f63.png | 1062x644 | GIF | dont | alttext | Using minimal width |
| minimizeTextLinks.png | 2398x1098 | C | do | alttext | Using minimal width |
| sidebyside_basicform_example.png | 884x408 | B | neutral | Basic side by side layout within a form | Side by side layout parameter configurations |
| sidebyside_layout_auto_example.gif frames: frames/sidebyside_layout_auto_example_f0.png, frames/sidebyside_layout_auto_example_f31.png, frames/sidebyside_layout_auto_example_f62.png, frames/sidebyside_layout_auto_example_f93.png, frames/sidebyside_layout_auto_example_f124.png | 2024x846 | GIF | neutral | Simple side by side layout example displaying equal item wid | Automatically distribute width |
| sidebyside_layout_margins_example.png | 3227x4810 | A | neutral | Images display the difference between the Standard and Even  | Margin above and below parameters |
| sidebyside_layout_relativePIC.png | 714x397 | B | neutral | ds-images/sidebyside_layout_relativePIC.png | Set relative width |
| sidebyside_layout_relative_example.gif frames: frames/sidebyside_layout_relative_example_f0.png, frames/sidebyside_layout_relative_example_f29.png, frames/sidebyside_layout_relative_example_f59.png, frames/sidebyside_layout_relative_example_f89.png, frames/sidebyside_layout_relative_example_f118.png | 2024x846 | GIF | neutral | Simple side by side layout example displaying item behavior  | Set relative width |
| sidebyside_layout_spacing_example.png | 3498x2435 | A | neutral | ds-images/sidebyside_layout_spacing_example.png | Item spacing parameter |
| sidebyside_layout_stacking_example.png | 808x1188 | B | neutral | Each item within the side by side layout stacks at phone wid | Responsive stacking |
| sidebyside_layout_vertAlign_example.png | 4035x1680 | A | neutral | ds-images/sidebyside_layout_vertAlign_example.png | Vertical alignment parameter |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): columns_layout_sbs_example.png
