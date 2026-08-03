# Box Layout (a!boxLayout)

Strong visual grouping with a built-in title bar — for heavily-compartmentalized pages (long forms whose question groups would overwhelm; dense dashboards chunked into digestible sections) and for a single attention callout (error/warning) at the point of failure. Use sparingly: boxes add chrome. When compartmentalization isn't essential, prefer a!sectionLayout headings; for untitled containers, KPI tiles, or media, prefer [card-layout](card-layout.md). Never mix boxes and section headings as peer section devices on one page.

## Variants

Official `style` vocabulary — the title-bar/border color IS the variant (hexes pixel-estimated; page has no SAIL source):

- **STANDARD** (default): #f0f0f0 (est.) title bar, #222222 (est.) label, #d4d4d4 (est.) border, white body. The section workhorse.
- **ACCENT**: title bar in a saturated accent hue — the blue #1b72e7 (est.) "Current Classes" bar in the border/shadow exemplars matches this. Legal for page sections; pick ONE of STANDARD/ACCENT and use it uniformly.
- **WARN**: semantic warning colors. Reserved for a single attention box per page, never decoration.
- **ERROR**: #ffeeef (est.) title bar, #f0022e (est.) label, #ff8aad (est.) border, white body with #222222 (est.) text. One problem, at its point of failure: a!boxLayout(label:"Sorry! There was a problem with your order", style:"ERROR") above a checkout form.

## Styling hooks

- `label`: the title-bar text — always a concise heading describing the contents.
- `style`: enum above. WARN/ERROR are meaning, not paint — max one semantic box per page.
- `showBorder` / `showShadow`: pick exactly ONE, from the page background — border on white pages (crisp hairline, no haze); shadow on transparent/tinted pages (lifts the box off a #f0f0f0 (est.) background); both together doubles the outline noise. Same rule as cards.
- No hex surface: unlike cards, box color comes only from the style enum; brand color enters through which style you pick and the content inside (e.g. accent-colored links in the body).

## Idioms

1. Uniform section grid (box_for_sections.png, hotel property summary — the page's DO):
```
COLUMNS [1:1:1]
├─ BOX "Information" (STANDARD): label-value pairs + embedded map
├─ BOX "Performance" (STANDARD): KPI trio + satisfaction smileys + CHART(line) + CHART(pie)
└─ BOX "Key Staff" (STANDARD): 2×2 photo grid
   BOX "Send a message to the GM" (STANDARD)   ← stacked below in the same column: siblings, never nested
```
Four identical #f0f0f0 (est.) title bars form a quiet grid; the single interactive purple #5f2372 (est.) is spent exclusively on links/staff names/selected tab, so affordances pop against gray chrome.
2. Single ERROR box directly above the form it explains (box_layout_example.png): color confined to bar/border/label; body text stays #222222 (est.) on white.
3. Elevation by background (box_layout_border.png / box_layout_shadow.png): a!boxLayout(showBorder:true, showShadow:false) on white pages; (showBorder:false, showShadow:true) when the headerContentLayout background is tinted.

## Top don't

Never nest a box inside another box (severity: always). The corpus DON'T wraps "Shipping Address" and "Billing Address" STANDARD boxes inside a "My Profile" STANDARD box: inner and outer title bars render identically, so nesting adds double borders and indentation — shrinking content width — while conveying zero hierarchy. Structure a box's interior with a!sectionLayout or richText headings and spacing. (Runner-up, "usually" and "always" when semantic styles are used decoratively: don't mix box styles across section boxes — in the mixed-styles DON'T, a pale-yellow #fefed7 (est.) box falsely signals warning and a plum #58296e (est.) box dominates the least-urgent content.)
