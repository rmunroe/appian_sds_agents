# Analysis batch 20

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


### Page: `ux-buttons` (section: components)
- Page text: `corpus/pages/ux-buttons.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-buttons.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| branding-preview-icon.svg | 14x14 | B | neutral | branding preview icon | Button shape and capitalization |
| buttonWidthFill.png | 713x324 | C | do | alttext | Fill |
| buttonWidthMinimizeDont.png | 714x335 | C | dont | alttext | Minimize |
| button_availability.png | 2166x750 | C | do | alttext | Availability |
| button_capitalization.png | 192x196 | B | neutral | button_capitalization | Button label capitalization |
| button_location.png | 925x131 | C | dont | alttext | Location |
| button_position.png | 929x96 | C | do | alttext | Position |
| button_rounded.png | 182x76 | B | neutral | button_rounded | Button shape |
| button_semi_rounded.png | 158x76 | B | neutral | button_semi_rounded | Button shape |
| button_squared.png | 158x76 | B | neutral | button_squared | Button shape |
| button_widths.png | 605x78 | C | dont | screenshot of two buttons displaying the two available width | Width |
| buttons_gridToolbar.png | 3078x806 | A | neutral | ds-images/buttons_gridToolbar.png | Small |
| buttons_inconsistentSize_dont.png | 1998x206 | C | dont | alttext | Size |
| buttons_largeSize_do.png | 3232x1996 | A | neutral | ds-images/buttons_largeSize_do.png | Large |
| buttons_linkStyle.png | 2786x222 | C | do | alttext | Link |
| buttons_linkStyle_dont.png | 1920x90 | C | dont | alttext | Link |
| buttons_location_do.png | 2166x736 | C | do | alttext | Location |
| buttons_secondary_do.png | 2594x978 | C | do | alttext | Secondary |
| buttons_size.png | 756x146 | B | neutral | ds-images/buttons_size.png | Size |
| destructive_buttons.png | 1031x324 | C | dont | alttext | Negative |
| loading_indicator_example.gif frames: frames/loading_indicator_example_f0.png, frames/loading_indicator_example_f7.png, frames/loading_indicator_example_f14.png, frames/loading_indicator_example_f21.png, frames/loading_indicator_example_f27.png | 618x90 | GIF | do | alttext | Loading indicator |
| minimizeButtonWidth.gif frames: frames/minimizeButtonWidth_f0.png, frames/minimizeButtonWidth_f6.png, frames/minimizeButtonWidth_f12.png, frames/minimizeButtonWidth_f18.png, frames/minimizeButtonWidth_f24.png | 494x773 | GIF | do | alttext | Minimize |
| primary_buttons.png | 980x215 | C | dont | alttext | Solid |
| relatedActionsShortcuts_dont.png | 1650x626 | C | dont | alttext | Related actions shortcuts |
| small_button.png | 357x42 | B | neutral | ds-images/small_button.png | Small |
| ux_button_colors.png | 592x222 | B | neutral | ds-images/ux_button_colors.png | Colors |
| ux_button_styles.gif frames: frames/ux_button_styles_f0.png, frames/ux_button_styles_f9.png, frames/ux_button_styles_f18.png, frames/ux_button_styles_f27.png, frames/ux_button_styles_f36.png | 309x55 | GIF | neutral | ds-images/ux_button_styles.gif | Styles |
| ux_secondaryButtons.png | 3000x834 | C | do | alttext | Secondary |
