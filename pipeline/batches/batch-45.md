# Analysis batch 45

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


### Page: `ux-presenting-information-clearly` (section: guidance)
- Page text: `corpus/pages/ux-presenting-information-clearly.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-presenting-information-clearly.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| IA_back_link.png | 2200x578 | A | neutral | ds-images/IA_back_link.png | Facilitate orientation and navigation |
| IA_breadcrumbs.png | 532x82 | B | neutral | ds-images/IA_breadcrumbs.png | Facilitate orientation and navigation |
| IA_change_title_do.png | 2982x726 | C | do | alttext | Facilitate orientation and navigation |
| IA_change_title_dont.png | 2982x726 | C | dont | alttext | Facilitate orientation and navigation |
| IA_confusing_hierarchy_dont.png | 3218x1500 | C | dont | alttext | Clearly outline page structure |
| IA_diff_do.png | 2990x1316 | C | do | alttext | Use visual differentiation to aid comprehension |
| IA_diff_dont.png | 1614x1284 | C | dont | alttext | Use visual differentiation to aid comprehension |
| IA_good_title_do.png | 2986x1280 | A | neutral | ds-images/IA_good_title_do.png | Facilitate orientation and navigation |
| IA_random_colors_dont.png | 2974x1122 | C | dont | alttext | Use visual differentiation to aid comprehension |
| IA_random_layouts_dont.png | 2954x1628 | C | dont | alttext | Use visual differentiation to aid comprehension |
| IA_self_title.png | 2520x970 | A | neutral | ds-images/IA_self_title.png | Facilitate orientation and navigation |
| IA_structure_do.png | 2984x1280 | C | do | alttext | Clearly outline page structure |

### Page: `ux-progressive-disclosure` (section: guidance)
- Page text: `corpus/pages/ux-progressive-disclosure.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-progressive-disclosure.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| progressiveDisclosure_do.png | 695x233 | B | neutral | ds-images/progressiveDisclosure_do.png | Progressively disclose based on user selection |
| progressive_disable_sequence.png | 1888x450 | B | neutral | ds-images/progressive_disable_sequence.png | Avoid hiding items that are part of a sequential f |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): filterControls_do.png
