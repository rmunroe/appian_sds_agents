# Analysis batch 35

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


### Page: `ux-tab-layout` (section: components)
- Page text: `corpus/pages/ux-tab-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-tab-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| tab-layout-billboard-background.png | 1100x400 | C | dont | tab layout on billboard background | Use an appropriate background |
| tab-layout-concise-labels.png | 1504x240 | C | do | tab layout with concise labels | Use clear, concise tab labels |
| tab-layout-icon-only.png | 1016x250 | C | dont | tab layout with icons only | Include text labels with icons |
| tab-layout-icon-with-text.png | 1016x286 | C | do | tab layout with icons and text | Include text labels with icons |
| tab-layout-long-labels.png | 1504x236 | C | dont | tab layout with long labels | Use clear, concise tab labels |
| tab-layout-nested.png | 2002x562 | C | dont | nested tab layouts | Don't nest tab layouts |
| tab-layout-overview.png | 1642x594 | A | neutral | overview of tab layout with annotations | Introduction |
| tab-layout-solid-background.png | 1168x240 | C | do | tab layout on solid background | Use an appropriate background |
| tab-layout-transparent-background.png | 1100x242 | C | dont | tab layout on gray background | Use an appropriate background |
| tab-layout-with-sections.png | 1784x720 | C | do | tab layout combined with section layouts | Don't nest tab layouts |
| tab_layout_orientation_sailds.gif frames: frames/tab_layout_orientation_sailds_f0.png, frames/tab_layout_orientation_sailds_f15.png, frames/tab_layout_orientation_sailds_f31.png, frames/tab_layout_orientation_sailds_f47.png, frames/tab_layout_orientation_sailds_f62.png | 2052x1184 | GIF | neutral | tab layout switching between vertical and horizontal orienta | Orientation parameter |
| tab_layout_tabwidth.gif frames: frames/tab_layout_tabwidth_f0.png, frames/tab_layout_tabwidth_f15.png, frames/tab_layout_tabwidth_f30.png, frames/tab_layout_tabwidth_f45.png, frames/tab_layout_tabwidth_f59.png | 2128x1264 | GIF | neutral | tab layout switching between minimize and fill width | Tab Width parameter |
| tab_orientation_horizontal_dont.png | 1713x167 | C | dont | Horizontal tabs scrolling on overflow, hiding available tabs | Vertical tab navigation |
| tab_orientation_vertical_do.png | 357x552 | C | do | Vertical tabs displaying all labels in a column alongside th | Vertical tab navigation |
