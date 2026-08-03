# Analysis batch 37

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


### Page: `ux-wizard-layout` (section: components)
- Page text: `corpus/pages/ux-wizard-layout.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-wizard-layout.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| primary-buttons.png | 587x98 | B | neutral | primary buttons | Primary buttons parameter |
| secondary-buttons.png | 587x104 | B | neutral | secondary buttons | Secondary buttons parameter |
| wizard-instructions.png | 976x641 | A | neutral | wizard step instructions | Instructions parameter |
| wizard-layout-bg-comparison.png | 845x540 | B | neutral | image comparing white and transparent wizard backgrounds | Wizard background color parameter |
| wizard-layout-button-divider.png | 960x674 | A | neutral | button divider | Show button divider parameter |
| wizard-layout-button-sizes.png | 851x641 | C | dont | wizard layout with various button sizes | Use consistent button sizes |
| wizard-layout-contents-width.gif frames: frames/wizard-layout-contents-width_f0.png, frames/wizard-layout-contents-width_f40.png, frames/wizard-layout-contents-width_f80.png, frames/wizard-layout-contents-width_f120.png, frames/wizard-layout-contents-width_f159.png | 2748x1340 | GIF | neutral | gif showing different wizard content widths | Step contents width parameter |
| wizard-layout-drag-from-palette.gif frames: frames/wizard-layout-drag-from-palette_f0.png, frames/wizard-layout-drag-from-palette_f13.png, frames/wizard-layout-drag-from-palette_f26.png, frames/wizard-layout-drag-from-palette_f39.png, frames/wizard-layout-drag-from-palette_f51.png | 2748x1188 | GIF | neutral | gif of a user dragging a wizard layout into their interface  | When to use a wizard layout |
| wizard-layout-example-contents.png | 918x685 | A | neutral | example wizard step with contents highlighted | Contents parameter |
| wizard-layout-example.png | 908x685 | A | neutral | wizard layout example | Introduction |
| wizard-layout-fixed-title-bar.gif frames: frames/wizard-layout-fixed-title-bar_f0.png, frames/wizard-layout-fixed-title-bar_f6.png, frames/wizard-layout-fixed-title-bar_f13.png, frames/wizard-layout-fixed-title-bar_f19.png, frames/wizard-layout-fixed-title-bar_f25.png | 898x648 | GIF | neutral | gif of title bar remaining fixed while scrolling | Fix title bar when scrolling parameter |
| wizard-layout-stacked-buttons.png | 788x506 | C | dont | wizard layout with stacked buttons | Make sure buttons fit without stacking |
| wizard-layout-step-heading.png | 1017x745 | A | neutral | wizard layout showing the step heading | Show wizard step heading parameter |
| wizard-layout-step-indicators.png | 1672x2972 | A | neutral | three versions of a wizard showing a vertical, horizontal, a | Selecting a wizard style |
| wizard-layout-with-vertical-tabs.png | 1046x691 | C | dont | wizard layout with vertical tabs in a step | Avoid using vertical tab patterns with vertical mi |
| wizard-milestones.gif frames: frames/wizard-milestones_f0.png, frames/wizard-milestones_f52.png, frames/wizard-milestones_f104.png, frames/wizard-milestones_f156.png, frames/wizard-milestones_f207.png | 2748x1340 | GIF | neutral | gif showing different wizard styles | Style parameter |
| wizard-section-headings-large.png | 941x905 | C | dont | wizard layout with large section heading labels | Choose an appropriate section heading size |
| wizard-section-headings-small.png | 901x835 | C | do | wizard layout with small section heading labels | Choose an appropriate section heading size |
| wizard-step-label.png | 976x641 | A | neutral | wizard step labels | Label parameter |
| wizard_layout_titleBar.png | 1746x1156 | A | neutral | wizard_layout_titleBar | Title bar template parameter |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): header-template-compare.png
