# Analysis batch 46

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


### Page: `ux-site-branding` (section: guidance)
- Page text: `corpus/pages/ux-site-branding.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-site-branding.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| accentColor_dont.png | 4092x1548 | C | dont | alttext | Accent color |
| branding_preview_selection.gif frames: frames/branding_preview_selection_f0.png, frames/branding_preview_selection_f27.png, frames/branding_preview_selection_f55.png, frames/branding_preview_selection_f83.png, frames/branding_preview_selection_f110.png | 1600x958 | GIF | neutral | branding_preview_selection | Branding |
| header-bar-simple.png | 2924x1532 | C | do | screenshot of a header with three pages | Use header bar for simple navigation |
| loadingBar.png | 1600x115 | B | neutral | loadingBar.png | Loading bar color |
| mercuryHighlightColor.png | 939x56 | B | neutral | ds-images/mercuryHighlightColor.png | Background and highlight color guidance |
| nav-bar-logo.png | 1722x236 | B | neutral | nav-bar-logo | Logo |
| navBar.png | 2186x142 | C | dont | alttext | Background and highlight color guidance |
| navigation-bar-styles.png | 2878x556 | A | neutral | navigation-bar-styles | Style (header bar only) |
| organized_header_bar_do.png | 2512x758 | C | do | alttext | Use an appropriate number of pages to optimize nav |
| organized_header_bar_dont.png | 2938x752 | C | dont | alttext | Use an appropriate number of pages to optimize nav |
| page-name-capitalization.png | 1770x374 | B | neutral | page-name-capitalization | Page name capitalization |
| page_group_clear_page_title_do.png | 2772x1252 | C | do | alttext | Use clear titles for pages in page groups |
| page_group_clear_page_title_dont.png | 2786x1108 | C | dont | alttext | Use clear titles for pages in page groups |
| portal-header-comparison1.png | 7056x2626 | A | neutral | comparison of portal with and without navigation bar | Show navigation bar (portals only) |
| sales_db_back_button.gif frames: frames/sales_db_back_button_f0.png, frames/sales_db_back_button_f52.png, frames/sales_db_back_button_f105.png, frames/sales_db_back_button_f158.png, frames/sales_db_back_button_f210.png | 1124x698 | GIF | neutral | gif of a sales dashboard with filter values changing and the | URL parameter navigation |
| select-vehicle-tab-do.gif frames: frames/select-vehicle-tab-do_f0.png, frames/select-vehicle-tab-do_f19.png, frames/select-vehicle-tab-do_f38.png, frames/select-vehicle-tab-do_f57.png, frames/select-vehicle-tab-do_f76.png | 2504x1500 | GIF | neutral | gif of user selecting two different tabs on a page and the t | URL parameter navigation |
| semi-rounded-input-shape-example.png | 3262x784 | A | neutral | alttext | Input shape |
| show-display-name.png | 2618x508 | B | neutral | ds-images/show-portal-display-name.png | Show display name |
| sidebar-complex.png | 3422x1302 | C | do | screenshot of a sidebar with five pages and two page groups | Use sidebar for complex navigation |
| sidebar-highlight-do.png | 2426x888 | C | do | screenshot of a sidebar with a white selected highlight colo | Background and highlight color guidance |
| sidebar-highlight-dont.png | 2428x888 | C | dont | screenshot of a sidebar with a dark selected highlight color | Background and highlight color guidance |
| sidebar-page-background-dont.png | 3418x1514 | C | dont | alttext | Sidebar considerations |
| sidebar-simple.png | 3414x1398 | C | dont | screenshot of a sidebar with just three pages | Use header bar for simple navigation |
| siteColors_do_ex2.png | 2224x116 | C | do | alttext | Ensure the logo displays clearly |
| siteColors_dont_ex2.png | 2572x120 | C | dont | alttext | Ensure the logo displays clearly |
| site_responsive_menu.gif frames: frames/site_responsive_menu_f0.png, frames/site_responsive_menu_f13.png, frames/site_responsive_menu_f26.png, frames/site_responsive_menu_f39.png, frames/site_responsive_menu_f51.png | 1164x670 | GIF | neutral | responsive menu in a site | Layout |
| site_rounded_buttons.png | 1604x878 | A | neutral | ds-images/site_rounded_buttons.png | Button shape |
| site_sidebar_stacking_behavior.gif frames: frames/site_sidebar_stacking_behavior_f0.png, frames/site_sidebar_stacking_behavior_f8.png, frames/site_sidebar_stacking_behavior_f16.png, frames/site_sidebar_stacking_behavior_f24.png, frames/site_sidebar_stacking_behavior_f31.png | 1706x804 | GIF | neutral | content stacking with sidebar gif | Sidebar considerations |
| site_sidebar_vs_headerbar.png | 3674x1962 | A | neutral | comparison of header bar and sidebar layouts | Layout |
| sites_vs_portals_navigation_bar.png | 2000x470 | B | neutral | sites_vs_portals_navigation_bar | Navigation bar |
| tabColor.png | 1861x116 | C | do | screenshot | Background and highlight color guidance |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): branding-preview-icon.svg
