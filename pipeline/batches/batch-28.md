# Analysis batch 28

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


### Page: `ux-header-content-layout` (section: components)
- Page text: `corpus/pages/ux-header-content-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-header-content-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| HCL_padding_progression.gif frames: frames/HCL_padding_progression_f0.png, frames/HCL_padding_progression_f7.png, frames/HCL_padding_progression_f15.png, frames/HCL_padding_progression_f22.png, frames/HCL_padding_progression_f29.png | 1112x624 | GIF | neutral | ds-images/HCL_padding_progression.gif | Contents padding parameter |
| hcl_basic_example.png | 2164x1100 | A | neutral |  | Header parameter |
| hcl_billboard_header.png | 1764x980 | A | neutral |  | Header parameter |
| hcl_card_header.png | 2000x1112 | A | neutral |  | Header parameter |
| hcl_contents.png | 2000x1100 | A | neutral | ds-images/hcl_contents.png | Contents parameter |
| hcl_drag_and_drop.gif frames: frames/hcl_drag_and_drop_f0.png, frames/hcl_drag_and_drop_f12.png, frames/hcl_drag_and_drop_f24.png, frames/hcl_drag_and_drop_f36.png, frames/hcl_drag_and_drop_f48.png | 2492x1068 | GIF | neutral | ds-images/hcl_drag_and_drop.gif | Parameter configurations |
| hcl_fixed_header.gif frames: frames/hcl_fixed_header_f0.png, frames/hcl_fixed_header_f8.png, frames/hcl_fixed_header_f16.png, frames/hcl_fixed_header_f24.png, frames/hcl_fixed_header_f31.png | 1708x812 | GIF | neutral | ds-images/hcl_fixed_header.gif | Fix header when scrolling parameter |
| hcl_fixed_header_margin_do.gif frames: frames/hcl_fixed_header_margin_do_f0.png, frames/hcl_fixed_header_margin_do_f5.png, frames/hcl_fixed_header_margin_do_f10.png, frames/hcl_fixed_header_margin_do_f15.png, frames/hcl_fixed_header_margin_do_f19.png | 1288x545 | GIF | do | alttext | Defining margins for fixed headers |
| hcl_fixed_header_margin_dont.gif frames: frames/hcl_fixed_header_margin_dont_f0.png, frames/hcl_fixed_header_margin_dont_f6.png, frames/hcl_fixed_header_margin_dont_f12.png, frames/hcl_fixed_header_margin_dont_f18.png, frames/hcl_fixed_header_margin_dont_f23.png | 1278x527 | GIF | dont | alttext | Defining margins for fixed headers |
| hcl_fixed_header_responsive_do.gif frames: frames/hcl_fixed_header_responsive_do_f0.png, frames/hcl_fixed_header_responsive_do_f12.png, frames/hcl_fixed_header_responsive_do_f24.png, frames/hcl_fixed_header_responsive_do_f36.png, frames/hcl_fixed_header_responsive_do_f48.png | 888x1920 | GIF | do | alttext | Responsive fixed headers |
| hcl_fixed_header_responsive_dont.gif frames: frames/hcl_fixed_header_responsive_dont_f0.png, frames/hcl_fixed_header_responsive_dont_f13.png, frames/hcl_fixed_header_responsive_dont_f26.png, frames/hcl_fixed_header_responsive_dont_f39.png, frames/hcl_fixed_header_responsive_dont_f52.png | 888x1920 | GIF | dont | alttext | Responsive fixed headers |
| hcl_full_width.png | 3360x2100 | A | neutral | ds-images/hcl_full_width.png | Site page width |
| hcl_mixed_header_annotated.png | 2002x882 | A | neutral |  | Header parameter |
| hcl_page_width.png | 3360x2100 | A | neutral | ds-images/hcl_page_width.png | Site page width |
| hcl_secondary_nav.png | 3360x1896 | A | neutral | ds-images/hcl_secondary_nav.png | Secondary navigation |
| hcl_title_bar.png | 3360x2100 | A | neutral | ds-images/hcl_title_bar.png | Title bars |
| hcl_transparent_content.png | 3360x1872 | A | neutral | ds-images/hcl_transparent_content.png | Background color parameter |
| hcl_transparent_content_and_header.png | 1926x780 | A | neutral | ds-images/hcl_transparent_content_and_header.png | Use transparent background color when content is p |
| hcl_welcome_banner.png | 8450x4458 | A | neutral | alttext | Welcome banners |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): insurance_quote_returning_portal.png, non_profit_fundraising_landing.png
