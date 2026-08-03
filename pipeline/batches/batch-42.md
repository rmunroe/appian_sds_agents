# Analysis batch 42

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


### Page: `ux-inputs` (section: guidance)
- Page text: `corpus/pages/ux-inputs.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-inputs.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| card-choices-partial-values.png | 2048x323 | C | dont | alttext | Card choices |
| card-choices-same-values.png | 2048x332 | C | do | alttext | Card choices |
| cardchoices_semi_rounded.png | 476x388 | B | neutral | card choices semi-rounded | Input shape |
| cardchoices_squared.png | 474x402 | B | neutral | Card choices squared | Input shape |
| checkboxes_cards_style_both_layouts.png | 426x201 | B | neutral | ds-images/checkboxes_cards_style_both_layouts.png | Choice style |
| checkboxes_semi_rounded.png | 194x166 | B | neutral | checkboxes semi-rounded | Input shape |
| checkboxes_squared.png | 194x158 | B | neutral | checkboxes squared | Input shape |
| date_semi_rounded.png | 670x728 | B | neutral | date semi-rounded | Input shape |
| date_squared.png | 674x728 | B | neutral | date squared | Input shape |
| dropdown_semi_rounded.png | 476x148 | B | neutral | dropdown semi-rounded | Input shape |
| dropdown_squared.png | 476x142 | B | neutral | dropdown squared | Input shape |
| file_semi_rounded.png | 470x156 | B | neutral | file semi-rounded | Input shape |
| file_squared.png | 474x156 | B | neutral | file squared | Input shape |
| input_semi_rounded.png | 462x140 | B | neutral | input semi-rounded | Input shape |
| input_squared.png | 472x148 | B | neutral | input squared | Input shape |
| inputs_alignment_do.png | 648x154 | C | do | alttext | Alignment |
| inputs_alignment_dont.png | 644x81 | C | dont | alttext | Alignment |
| inputs_choiceposition_dontexample.png | 1626x798 | C | dont | alttext | Choice position - Radio button and checkbox compon |
| inputs_choiceposition_filterexample.png | 1510x822 | A | neutral | alttext | Choice position - Radio button and checkbox compon |
| picker_placeholder_do.png | 648x156 | C | do | alttext | Picker placeholder text |
| picker_placeholder_dont.png | 646x292 | C | dont | alttext | Picker placeholder text |
| picker_semi_rounded.png | 464x138 | B | neutral | picker semi-rounded | Input shape |
| picker_squared.png | 464x142 | B | neutral | Picker squared | Input shape |
| placeholder_text_do.png | 646x156 | C | do | placeholder text do | Placeholder text |
| placeholder_text_dont.png | 646x200 | C | dont | alttext | Placeholder text |
| radio_buttons_cards_style_both_layouts.png | 565x169 | B | neutral | Example of radio buttons with the "Cards" style | Choice style |
| radio_choice_position_do.png | 862x692 | C | do | alttext | Choice position - Radio button and checkbox compon |
| stef_readonly_do.png | 2234x1262 | C | do | interface that sets apart Issue Description in a separate ca | Displaying read-only styled text editor values |
| stef_semi_rounded.png | 470x274 | B | neutral | stef semi-rounded | Input shape |
| stef_squared.png | 482x282 | B | neutral | stef squared | Input shape |
| ux_characterCount_hidden.png | 1222x766 | C | do | alttext | Show character limit count |
| ux_characterCount_shown.png | 1148x752 | C | dont | alttext | Show character limit count |
| ux_checkboxes.png | 706x350 | B | neutral | ds-images/ux_checkboxes.png | Choice layout |
| ux_fileuploadplaceholder.png | 742x192 | C | do | alttext | File upload placeholder text |
| ux_fileuploadplaceholderdont.png | 1176x250 | C | dont | alttext | File upload placeholder text |
| ux_help_tooltip.png | 625x163 | B | neutral | ds-images/ux_help_tooltip.png | Help tooltips |
| ux_input_dropdown.png | 1020x820 | A | neutral | ds-images/ux_input_dropdown.png | Dropdowns |
| ux_paragraph_fields.png | 975x331 | B | neutral | ds-images/ux_paragraph_fields.png | Paragraph and styled text editor height |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): branding-preview-icon.svg
