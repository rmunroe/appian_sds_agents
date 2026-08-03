# Analysis batch 27

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


### Page: `ux-grids` (section: components)
- Page text: `corpus/pages/ux-grids.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-grids.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| bad_grid_example.png | 2668x1058 | C | dont | alttext | Introduction |
| commonly_used_filters.png | 1477x335 | B | neutral | ds-images/commonly_used_filters.png | Sort order and filtering |
| double_grid_scroll.gif frames: frames/double_grid_scroll_f0.png, frames/double_grid_scroll_f12.png, frames/double_grid_scroll_f24.png, frames/double_grid_scroll_f36.png, frames/double_grid_scroll_f47.png | 1174x636 | GIF | dont | alttext | Fixed height |
| editable_grid_alignment.png | 1175x203 | B | neutral | ds-images/editable_grid_alignment.png | Alignment |
| gridEmptyCells_do.png | 1306x350 | C | do | alttext | Empty cells |
| gridEmptyCells_dont.png | 1306x350 | C | dont | alttext | Empty cells |
| grid_alignment_new.png | 1944x400 | B | neutral | ds-images/grid_alignment.png | Alignment |
| grid_auto_vs_distribute.png | 1999x598 | A | neutral | ds-images/grid_auto_vs_distribute.png | No automatic column widths |
| grid_background_color.png | 1844x354 | B | neutral | ds-images/grid_background_color.png | Background color |
| grid_cases_colorful_tags_example.png | 2356x1248 | C | dont | alttext | Tags |
| grid_colorful_bad_example.png | 2340x776 | C | dont | alttext | Color |
| grid_column_concise_values.png | 274x532 | C | do | alttext | Concise Language |
| grid_column_redundant_values.png | 350x528 | C | dont | alttext | Concise Language |
| grid_column_status_tag_good_example.png | 240x578 | C | do | alttext | Tags |
| grid_column_status_with_icon.png | 280x576 | B | neutral | ds-images/grid_column_status_with_icon.png | Icons |
| grid_consolidated_columns.png | 1896x998 | C | do | alttext | Consolidated columns |
| grid_dense.png | 1848x262 | B | neutral | ds-images/grid_dense.png | Spacing |
| grid_lightweight.png | 1844x354 | B | neutral | ds-images/grid_lightweight.png | Border style |
| grid_recordActions_above.png | 1154x211 | B | neutral | ds-images/grid_recordActions_above.png | Above grids with record data |
| grid_recordActions_column.png | 1150x164 | B | neutral | ds-images/grid_recordActions_column.png | In grid columns |
| grid_recordActions_dont.png | 1150x221 | C | dont | alttext | In grid columns |
| grid_row_selection_editable.png | 1824x350 | C | dont | alttext | Selection style |
| grid_row_selection_paging.png | 1840x353 | C | do | alttext | Selection style |
| grid_scrolling_fixed_columns.gif frames: frames/grid_scrolling_fixed_columns_f0.png, frames/grid_scrolling_fixed_columns_f11.png, frames/grid_scrolling_fixed_columns_f23.png, frames/grid_scrolling_fixed_columns_f34.png, frames/grid_scrolling_fixed_columns_f45.png | 600x190 | GIF | neutral | ds-images/grid_scrolling_fixed_columns.gif | Fixed column widths |
| grid_shaded.png | 1850x358 | B | neutral | ds-images/grid_shaded.png | Shade alternate rows |
| grid_tags_column_good_example.png | 1958x752 | C | do | alttext | Tags |
| grid_tasks_good_example.png | 1840x948 | C | do | alttext | Color |
| grid_weighted_columns.png | 1358x1006 | A | neutral | ds-images/grid_weighted_columns.png | Relative column widths |
| grid_with_scrolling_and_paging.png | 1850x518 | C | dont | alttext | Fixed height |
| grids_editable_grid_reordering.gif frames: frames/grids_editable_grid_reordering_f0.png, frames/grids_editable_grid_reordering_f27.png, frames/grids_editable_grid_reordering_f55.png, frames/grids_editable_grid_reordering_f82.png, frames/grids_editable_grid_reordering_f109.png | 2024x1060 | GIF | neutral | editable grid being reordered | Sort order and filtering |
| logical_sort_order.png | 1467x248 | B | neutral | ds-images/logical_sort_order.png | Sort order and filtering |
| regular_grid.png | 1561x621 | C | do | alttext | Introduction |
