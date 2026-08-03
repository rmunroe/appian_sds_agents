# Analysis batch 40

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


### Page: `ux-designing-for-your-users` (section: guidance)
- Page text: `corpus/pages/ux-designing-for-your-users.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-designing-for-your-users.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| complex_form.gif frames: frames/complex_form_f0.png, frames/complex_form_f27.png, frames/complex_form_f55.png, frames/complex_form_f82.png, frames/complex_form_f109.png | 1220x636 | GIF | neutral | ds-images/complex_form.gif | Example: Reimagining a complex form |
| cruise_1.png | 3360x2098 | A | neutral | ds-images/cruise_1.png | Example: An information-rich dashboard |
| cruise_billboard.png | 2204x1024 | A | neutral | ds-images/cruise_billboard.png | Example: An information-rich dashboard |
| cruise_drill_down.gif frames: frames/cruise_drill_down_f0.png, frames/cruise_drill_down_f7.png, frames/cruise_drill_down_f14.png, frames/cruise_drill_down_f21.png, frames/cruise_drill_down_f27.png | 476x362 | GIF | neutral | ds-images/cruise_drill_down.gif | Example: An information-rich dashboard |
| cruise_sections.png | 2208x1382 | A | neutral | ds-images/cruise_sections.png | Example: An information-rich dashboard |
| insurance_1.png | 3360x1886 | A | neutral | ds-images/insurance_1.png | Example: An easy-to-use price quote wizard |
| insurance_2.png | 3360x1326 | A | neutral | ds-images/insurance_2.png | Example: An easy-to-use price quote wizard |
| insurance_3.png | 3360x1232 | A | neutral | ds-images/insurance_3.png | Example: An easy-to-use price quote wizard |
| insurance_4.png | 3360x996 | A | neutral | ds-images/insurance_4.png | Example: An easy-to-use price quote wizard |
| insurance_5.png | 3360x1732 | A | neutral | ds-images/insurance_5.png | Example: An easy-to-use price quote wizard |
| mortgage_1.png | 3360x1360 | A | neutral | ds-images/mortgage_1.png | Example: Reimagining a complex form |
| mortgage_2.png | 3360x1360 | A | neutral | ds-images/mortgage_2.png | Example: Reimagining a complex form |
| mortgage_3.png | 3360x1360 | A | neutral | ds-images/mortgage_3.png | Example: Reimagining a complex form |
| mortgage_column_widths.png | 1938x998 | A | neutral | ds-images/mortgage_column_widths.png | Example: Reimagining a complex form |
