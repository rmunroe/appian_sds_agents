# Styling mechanics — every visual lever SAIL exposes

Mechanics only: WHERE appearance can be set, and the legal values. Aesthetic recipes live in the
other styling/ files. ✓src = code-verified in `guidance/sail/sources/*.sail` or corpus page SAIL;
unmarked values are from docs page text; *(unverified)* = not evidenced — do not invent beyond this.

## 1. Where hex colors can go (complete enumeration)

Hex form: `#RRGGBB` or `#RRGGBBAA` (last pair = opacity, `00` transparent → `FF` opaque). Every
param here accepts a custom hex; named tokens listed per row.

| Lever | Named values (default first) | Note |
|---|---|---|
| `a!cardLayout(style:)` | `NONE` (white), `TRANSPARENT`, `STANDARD`, `ACCENT`, `SUCCESS`, `INFO`, `WARN`, `ERROR`, `CHARCOAL_SCHEME`, `NAVY_SCHEME`, `PLUM_SCHEME`, hex(+alpha) | THE workhorse color surface: dark KPI tiles `"#0F1C2E"` ✓src, tinted bands `"#f3f3f3"` ✓src, translucent layers over billboards |
| `a!cardLayout(borderColor:)` | `STANDARD`, `ACCENT`, `POSITIVE`, `WARN`, `NEGATIVE`, hex(+alpha) | `"#DCE6E8"` ✓src; selection emphasis |
| `a!cardLayout(decorativeBarColor:)` + `decorativeBarPosition:` | color: `ACCENT`, `POSITIVE`, `WARN`, `NEGATIVE`, hex(+alpha); position: `NONE`, `TOP`, `BOTTOM`, `START`, `END` | edge accent stripe; `"#056CF2"` ✓src |
| `a!richTextItem(color:)` | `STANDARD`, `ACCENT`, `POSITIVE`, `NEGATIVE`, `SECONDARY`, hex | any text can carry brand hex (`"#274e13"` ✓src) |
| `a!richTextIcon(color:)` | same token set, hex | icon color independent of text ✓src |
| `a!headingField(color:)` | `STANDARD`, `SECONDARY`, hex | `"#152B99"` ✓src |
| `a!sectionLayout(labelColor:)` | `STANDARD`, `SECONDARY`, hex | `"#54514e"` ✓src |
| `a!tagItem(backgroundColor:)` | `ACCENT`, `SECONDARY`, `NEGATIVE` ✓src, hex(+alpha) | tint idiom: `concat(color, "1a")` = 10% bg ✓src |
| `a!tagItem(textColor:)` | hex ✓src (`"#0F5132"` on `"#D4EDDA"` bg) | auto contrast if omitted |
| `a!stampField(backgroundColor:)` | `ACCENT`, `POSITIVE`, `TRANSPARENT`, hex ✓src | `TRANSPARENT` + hex `contentColor` = bare colored icon |
| `a!stampField(contentColor:)` | `STANDARD`, hex ✓src (`"#666666"`) | icon/text inside stamp |
| `a!gaugeField(color:)` | default accent; hex ✓src (`"#45818e"`) | ring fill |
| `a!progressBarField(color:)` | `POSITIVE`, `NEGATIVE`, hex ✓src (`"#3a77e9"`) | bar fill |
| chart `colorScheme:` | `"CLASSIC"`, `"RAINFOREST"` ✓src (full named list is on a docs reference page outside corpus) or `a!colorSchemeCustom(colors: {hex, …})` ✓src | one scheme per interface |
| `a!chartSeries(color:)` | hex ✓src | per-series override |
| `a!chartReferenceLine(color:, style:)` | hex; style `"SHORTDASH"` ✓src, others *(unverified)* | threshold line |
| `a!billboardLayout(backgroundColor:)` | hex ✓src (`"#f0f0f0"`, `"#dbf1d3"`) | instead of/behind `backgroundMedia` |
| `a!headerContentLayout(backgroundColor:)` | `WHITE`, `TRANSPARENT` (light-gray site bg), `CHARCOAL_SCHEME`, `NAVY_SCHEME`, `PLUM_SCHEME`, hex(+alpha) | page-content bg; header components keep own color params |
| `a!formLayout` / `a!wizardLayout` `backgroundColor:` | same value set as HCL | `"#FCFCFD"` ✓src |
| `a!pane(backgroundColor:)` | `GRAY` ✓src, hex ✓src (`"#F0F6F7"`) | full-height vertical color blocks |
| `a!boxLayout(style:)` | `STANDARD`, `ACCENT`, `WARN`, `ERROR`; hex *(unverified)* | one style per page; STANDARD/ACCENT for sectioning |
| `a!milestoneField(color:)` | `ACCENT` ✓src; hex *(unverified)* | step indicator |
| `a!buttonWidget(color:)` | default = site accent; `SECONDARY`, `NEGATIVE`, hex ✓src (`"#C22966"`) | ≤1 custom button color per interface |
| `a!tabLayout(highlightColor:)` | `ACCENT` (default), hex | selected-tab underline |
| `a!horizontalLine(color:, weight:)` | hex, `ACCENT`, 4-digit alpha `"#fff0"` ✓src; weight `"MEDIUM"` ✓src, others *(unverified)* | conditional-underline idiom for hand-built tabs |
| `a!kpiField(iconColor:)` | hex ✓src (`"#FAA92F"`) | KPI icon accent |

Not hex-colorable in SAIL: nav bar (site/portal object, §7), grid cells, input chrome (site input
shape/accent only), record banners.

## 2. Theme & semantic tokens

- **`ACCENT`** — resolves to the site/portal accent everywhere it is accepted (§1). The theme also
  applies accent with no SAIL param: default button color, "Primary" style links, section headings,
  faded-accent hover on dropdown menus and grid row-highlight.
- **`POSITIVE`** (green) / **`NEGATIVE`** (red) — semantic only; NEGATIVE ≈ the destructive-button
  red. Must mean done/alert, never decorative (ux-rich-text, ux-color-overview).
- **`SECONDARY`** (gray text/tag), **`STANDARD`** (default near-black text; flips white on dark
  schemes), **`TRANSPARENT`** (card/stamp bg), **`WARN`**, **`SUCCESS`/`INFO`/`ERROR`** (card styles).
- **Dark scheme tokens** `CHARCOAL_SCHEME` / `NAVY_SCHEME` / `PLUM_SCHEME` — accepted by card
  `style`, HCL/form/wizard `backgroundColor`. Cards on a scheme bg auto-tint a step lighter; text
  auto-flips. Apply a scheme to ALL pages of a site or none (ux-header-content-layout).
- **Theme vs SAIL**: nav bar bg/highlight/loading bar + accent + shapes come from the site/portal
  object (§7); nav text color is automatic (white on dark bars, dark gray on light — not
  overridable). SAIL controls everything inside the page via §1. Billboard overlay text:
  `DARK`/`SEMI_DARK` ⇒ standard text auto-white; `LIGHT`/`SEMI_LIGHT` ⇒ dark gray; `NONE` ⇒ follows
  `backgroundColor` brightness. POSITIVE/NEGATIVE keep their hues on overlays — check contrast.

## 3. Size ladders

- **Text** `a!richTextItem(size:)`: `SMALL` < `STANDARD` < `MEDIUM` < `MEDIUM_PLUS` < `LARGE` <
  `LARGE_PLUS` < `EXTRA_LARGE` (all ✓src). `style: {"STRONG"}`, `"EMPHASIS"`, `"UNDERLINE"` ✓src.
  `a!headingField` adds `size: "EXTRA_SMALL"`…`"LARGE_PLUS"`, `fontWeight:
  "LIGHT"|"REGULAR"|"SEMI_BOLD"|"BOLD"`, `headingTag: "H1"…"H3"` (a11y only) — all ✓src.
  `a!sectionLayout(labelSize: "SMALL"|"MEDIUM"|"LARGE", labelHeadingTag:)` ✓src.
- **Icons** `a!richTextIcon(size:)`: same ladder, `SMALL`→`EXTRA_LARGE` ✓src.
- **Stamps** `a!stampField(size:)`: `TINY` (dominant ✓src), `SMALL` ✓src; larger *(unverified)*.
- **Images** `a!imageField(size:)`: `TINY`, `SMALL`, `SMALL_PLUS`, `MEDIUM`, `FIT` ✓src, `GALLERY`
  (uniform row height). `style: "STANDARD"` (natural ratio, never cropped) or `"AVATAR"` (circle,
  exact size) ✓src; `isThumbnail: true` = click-to-zoom ✓src.
- **KPI** `a!kpiField(size:)`: `SMALL`, `STANDARD`, `MEDIUM`, `LARGE` ✓src; `template:
  "STACKED"|"ADJACENT"`, `iconStyle: "STAMP"`, `trend: "NONE"|"PERCENTAGE"` ✓src.
- **Gauge** `a!gaugeField(size:)`: `SMALL` ✓src; others *(unverified)*. Primary text:
  `a!gaugePercentage()`, `a!gaugeFraction(denominator:)`, `a!gaugeIcon(icon:)` ✓src.
- **Buttons** `a!buttonWidget(size:)`: `SMALL`, `STANDARD` (default), `LARGE` ✓src.
  `a!tagField(size:)`: `SMALL`, `STANDARD` ✓src.
- **Billboard height**: `AUTO` (whole image shows, height tracks width) or fixed `EXTRA_SHORT`,
  `SHORT`, `SHORT_PLUS`, `MEDIUM`, `MEDIUM_PLUS`, `TALL`, `TALL_PLUS`, `EXTRA_TALL` (crops media).
- **Card height** `a!cardLayout(height:)`: `AUTO` (default) or the same 8-step fixed ladder;
  fixed heights scroll overflowing contents. ✓src: `SHORT_PLUS`, `TALL`, `EXTRA_TALL`.
- **Chart height**: `MICRO` ✓src (sparklines — pair with `xAxisStyle`/`yAxisStyle: "NONE"`,
  `showLegend: false`), `SHORT`, `MEDIUM`, `AUTO` ✓src (bar charts grow per category); taller
  *(unverified)*. Axis styles seen: `"NONE"`, `"MINIMAL"`, `"STANDARD"` ✓src.

## 4. Spacing levers

One shared 6-step ladder: `NONE`, `EVEN_LESS`, `LESS`, `STANDARD`, `MORE`, `EVEN_MORE`.

- **`marginBelow:` / `marginAbove:`** — on cards, sections, columnsLayout, sideBySideLayout,
  billboards, headings, horizontalLine, progressBar, tabLayout, tagField, stampField, imageField
  (all ✓src). Defaults: marginAbove `NONE`, marginBelow `STANDARD`. Dense composites zero them:
  `marginBelow: "NONE"` ×537 ✓src.
- **`padding:`** — `a!cardLayout` (default `LESS`; full ladder ✓src), `a!pane` ✓src.
- **`contentsPadding:`** — `a!headerContentLayout` (default `STANDARD`; `NONE` = flush with header)
  and `a!tabLayout` ✓src; same ladder.
- **Horizontal gaps** — `a!columnsLayout(spacing:)`, `a!sideBySideLayout(spacing:)`: `STANDARD`
  (default), `NONE`, `DENSE`, `SPARSE` (all ✓src).
- **Section chrome** — `a!sectionLayout(divider: "ABOVE"|"BELOW"|"NONE")` ✓src plus margins;
  `a!columnsLayout(showDividers: true)` ✓src draws vertical hairlines.
- **`a!horizontalLine(marginAbove:, marginBelow:)`** ✓src — the manual divider.

## 5. Shape & elevation

- **Card**: `shape: "SQUARED"` (default) | `"SEMI_ROUNDED"` | `"ROUNDED"` ✓src. `showBorder`
  (default true), `showShadow` (default false), `borderColor` (§1). Never border+shadow together —
  borders on white page bg, shadows on transparent/gray bg, neither on dark schemes (ux-card-layout).
- **Box**: border or shadow, same exclusivity rule.
- **Stamp**: circle by default; `shape: "SEMI_ROUNDED"` ✓src for a squarish badge.
- **Grid**: `borderStyle: "LIGHT"`, `shadeAlternateRows: false` ✓src; other values *(unverified)*.
- **Site-level rounding** (§7) covers buttons/inputs/dialogs; component `shape:` covers
  cards/boxes/stamps (never site-wide). Mirror the site input radius on hand-built cards for one
  system radius (ux-site-branding).

## 6. Width system

- **`a!columnLayout(width:)`** — `AUTO` (distribute remainder); fixed `EXTRA_NARROW`, `NARROW`,
  `NARROW_PLUS`, `MEDIUM`, `MEDIUM_PLUS`, `WIDE`, `WIDE_PLUS` (all ✓src); relative `nX` (`1X 2X 3X
  4X 5X 8X` ✓src). Classic pattern: fixed rails left/right, `AUTO` center.
- **`a!sideBySideItem(width:)`** — `AUTO`, `MINIMIZE` (hug content, ×229 ✓src), or `nX` ✓src.
- **`a!pane(width:)`** — fixed (`NARROW_PLUS`, `MEDIUM`, `MEDIUM_PLUS` ✓src); ≥1 pane must be `AUTO`.
- **`a!formLayout` / `a!wizardLayout` `contentsWidth:`** — `FULL`, `WIDE`, `MEDIUM`, `NARROW`,
  `EXTRA_NARROW`. Use `FULL` inside record-action dialogs; let dialog size control width.
- **`a!cardGroupLayout(cardWidth:)`** — `NARROW`, `NARROW_PLUS` ✓src; wrapping equal-width grid.
- **`a!buttonWidget(width:)`** — `MINIMIZE` | `FILL` ✓src. `a!tabLayout(tabWidth:)` horizontal only.
- **Responsive**: `stackWhen:` / `a!isPageWidth()` tokens `"PHONE"`, `"TABLET_PORTRAIT"`,
  `"TABLET_LANDSCAPE"`, `"DESKTOP_NARROW"`, `"DESKTOP"`, `"DESKTOP_WIDE"`, `"NEVER"` (all ✓src).
- **Page width** (site page setting, not SAIL): `Narrow` (short forms), `Medium` (default
  compromise; forced for task start pages and Tempo), `Wide` (fills window, capped at 2,000dip on
  ultrawides), `Full` (no cap). Portals always `Full`; mobile always full-screen. Width persists
  until page change. Sidebar nav narrows the page ⇒ columns stack sooner at identical `stackWhen`.

## 7. Site/portal branding config (object, not SAIL)

Set in the site/portal object; SAIL cannot override these.

- **Navigation**: ≤10 pages/page groups (guideline ≤8 top-level, ≤5 mobile-first). `Layout`: Header
  Bar (styles: **Helium** sites-only — icons above names, block highlight; **Mercury** — logo left,
  underline highlight; **Oxygen** — logo+name lockup left, pages right, underline) or Sidebar (no
  styles; icons always; background-highlight selection; user-collapsible). Portals: Mercury/Oxygen
  only; single-page portals get a "Show navigation bar" toggle; no nav/user menu or Appian logo.
- **Color scheme** (hexes): header bar, selected highlight, accent, loading bar. Sites may instead
  pick a predefined dark color scheme. Nav text/icon color is automatic — avoid mid-brightness bar
  colors. Helium/sidebar highlight: lighter/darker shade of the bar hex; Mercury/Oxygen: contrasting hue.
- **Accent constraints**: ≥4.5:1 on white; distinct from black text and from the destructive red;
  test the auto-faded hover variant on dropdowns/grids.
- **Shapes**: Button shape `Squared` (default) / `Semi-Rounded` / `Rounded`; Input shape `Squared` /
  `Semi-Rounded` (inputs, pickers, selections, tooltips — NOT layouts, display fields, grids,
  charts, record banners); Dialog shape (record-action, confirmation, settings dialogs).
- **Text**: uppercase toggles for page titles and button labels (off ⇒ per-button control);
  display-name toggle; logo upload (transparent bg; Appian mark non-removable on sites).
- **CSS profiles** (advanced/premium tiers): Admin Console objects mapping typefaces and
  heading/tooltip/label properties per site/portal.
- Design against the target site from the start via the interface object's **Branding preview** dropdown.
