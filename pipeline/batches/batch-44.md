# Analysis batch 44

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


### Page: `ux-mobile-considerations` (section: guidance)
- Page text: `corpus/pages/ux-mobile-considerations.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-mobile-considerations.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| Linkify_Phone_Numbers.png | 1119x754 | A | neutral | /ux pages/Linkify Phone Numbers | Phone links |
| flattened_buttons_RN.png | 1030x508 | B | neutral | ds-images/flattened_buttons_RN.png | Flattened buttons |
| interface_designer_mobile_ffp.png | 2594x1862 | A | neutral | ds-images/interface_designer_mobile_ffp.png | Introduction |
| ios_more_menu.png | 1399x2762 | A | neutral | ios_more_menu.png | Site pages |
| ipad_site_pages.png | 1152x1600 | A | neutral | site pages in an ipad | Site pages |
| mobileDesign_flattenedColumns_RN.png | 941x391 | B | neutral | ds-images/mobileDesign_flattenedColumns_RN.png | Flattened columns |
| mobileSiteTabs_do.png | 432x259 | C | do | alttext | Site pages |
| mobileSiteTabs_dont.png | 610x261 | C | dont | alttext | Site pages |
| wrapping_and_scrolling_RN.png | 1105x524 | A | neutral | ds-images/wrapping_and_scrolling_RN.png | Wrapping & scrolling |

### Page: `ux-page-width` (section: guidance)
- Page text: `corpus/pages/ux-page-width.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-page-width.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| overview_page_width.png | 2900x526 | A | neutral | ds-images/overview_page_width.png | Introduction |
| page_width_full_do.png | 2000x1245 | C | do | alttext | Wide vs. full page width |
| page_width_full_dont.png | 2000x1245 | C | dont | alttext | Wide vs. full page width |
| page_width_wide_do.png | 1881x894 | C | do | alttext | Wide vs. full page width |

### Page: `ux-portals` (section: guidance)
- Page text: `corpus/pages/ux-portals.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-portals.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| design-portal-responsive-design.png | 4038x2724 | A | neutral | responsive design example | Use responsive design |
| design-portal-time-zone.png | 657x241 | B | neutral | time zone.png | Specify the time zone in your interface design |
| portal_localization2.gif frames: frames/portal_localization2_f0.png, frames/portal_localization2_f29.png, frames/portal_localization2_f59.png, frames/portal_localization2_f89.png, frames/portal_localization2_f118.png | 2656x1712 | GIF | neutral | Gif that shows a portal switching between languages | For multilingual portals, provide a way for users  |
