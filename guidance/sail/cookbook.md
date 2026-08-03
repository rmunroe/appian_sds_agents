# SAIL Cookbook — idioms by goal

How to actually do X in SAIL, harvested from the SDS corpus. Every snippet is verified against a
cited source (`sources/` = `guidance/sail/sources/`; `corpus/pages/` = official page code). Snippets
are trimmed with `/* … */` elisions; all shown params are real. Load only the section you need:

1. [Page scaffolding](#1-page-scaffolding) — shells, full-bleed, header-slot stacking, panes
2. [Responsive design](#2-responsive-design) — isPageWidth forks, stackWhen, showWhen swaps, phone blocks
3. [Color application](#3-color-application) — where hexes go, tokens, schemes, dark theme, alpha tint
4. [Cards as UI primitives](#4-cards-as-ui-primitives) — card-as-button/nav, selection, bars, spacers, flush stacking
5. [Hand-built widgets](#5-hand-built-widgets) — KPI+sparkline, legends, steppers, calendar, segmented control, bullets
6. [Typography moves](#6-typography-moves) — composed rich text, eyebrows, char(10), heading decoupling
7. [Layout precision](#7-layout-precision) — centering, icon columns, dividers, pinning, pseudo-tables
8. [Empty states, disclosure, grids](#8-empty-states-disclosure-grids)

---

## 1. Page scaffolding

### 1.1 Standard shell: tinted canvas, padded contents
```sail
a!headerContentLayout(
  header: {},              /* empty when site chrome provides nav */
  contents: { /* page zones */ },
  backgroundColor: "#f4f2f1",
  contentsPadding: "MORE"
)
```
Source: `sources/ins-agent-home-page.sail` L3–5 + final lines. Same move: `#f8f6f0` (conference-registration-portal), `#f3f0f6` (university-student-dashboard), `"PLUM_SCHEME"` (sales-perform-dashboard).
- Cards on a tinted canvas: `showBorder: false, showShadow: true` — border + tint reads as double chrome.
- The top site nav bar is NOT in your SAIL; don't rebuild it in `header:`.

### 1.2 Whole page in the header slot (full-bleed everything)
Zero side gutters — bands run edge-to-edge for the entire page.
```sail
a!headerContentLayout(
  header: { /* entire page: full-width cards/billboards stacked here */ },
  contents: {},
  backgroundColor: "#333"   /* overscroll matches the dark footer band */
)
```
Source: `sources/ins-quote-review.sail` L1–2 + closing lines; also both quote wizards.
- The header slot ignores `contentsPadding`; every band manages its own `padding`.
- Set `backgroundColor` to your LAST band's color so rubber-band scroll doesn't flash white.

### 1.3 Full-bleed color bands with centered content
```sail
a!headerContentLayout(
  contents: {
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(contents: { /* band content */ }, width: "WIDE_PLUS"),
            a!columnLayout(contents: {})
          },
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
        )
      },
      style: "#f3f3f3", padding: "MORE", marginBelow: "NONE", showBorder: false
    ) /* ×3 bands: #f3f3f3 / #fcfcfc / #111 */
  },
  contentsPadding: "NONE"
)
```
Source: `sources/portal-home-page.sail` L322–533 (siblings at 530/644/777).
- `contentsPadding: "NONE"` + `marginBelow: "NONE"` on every band, or white seams appear between bands.

### 1.4 Header-slot stacking: photo band + KPI band
```sail
header: {
  a!billboardLayout(
    backgroundMedia: a!webImage(source: "https://…"),
    height: "EXTRA_SHORT",
    marginBelow: "NONE"
  ),
  a!cardLayout(contents: { /* KPI strip, see 5.8 */ })
}
```
Source: `corpus/pages/employee-home-pages.md` L34–45. Billboard heights seen EXTRA_SHORT→EXTRA_TALL; responsive fork in 2.1.
- `marginBelow: "NONE"` on the billboard fuses the two; omit it and a canvas-colored gap appears.

### 1.5 Card-in-card full-bleed title band
Edge-to-edge brand-color title bar, no billboard.
```sail
header: {
  a!cardLayout(
    contents: {
      a!cardLayout(
        contents: {
          a!headingField(text: "My Account", marginBelow: "NONE",
            size: "LARGE_PLUS", fontWeight: "BOLD")
        },
        style: "#1155cc", showBorder: false, padding: "MORE", marginBelow: "NONE"
      )
    },
    style: "#fff", showBorder: false, padding: "NONE", marginBelow: "NONE"
  )
}
```
Source: `sources/customer-acct-management.sail` L3–26.
- Headings on dark cards render white automatically — do not set a text color.

### 1.6 Pane splits
Independently scrolling regions (list+detail, filter rail, wizard rail).
```sail
a!paneLayout(
  panes: {
    a!pane(contents: { /* menu list */ }, backgroundColor: "GRAY"),
    a!pane(contents: { /* order summary */ }, width: "MEDIUM_PLUS")
  }
)
```
Source: `sources/restaurant-order.sail` L3–5, 148, 508–512. Wizard variant: `width: "MEDIUM"` milestone pane, `backgroundColor: "#f0f0f0"`, `padding: "EVEN_MORE"` (`corpus/pages/forms.md` L824–834).
- Put the sticky-feeling content (filters, cart, stepper) in the fixed-width pane.

---

## 2. Responsive design

### 2.1 `a!isPageWidth` value forks (heights, styles, align)
```sail
height: if(a!isPageWidth({ "PHONE" }), "TALL_PLUS", "EXTRA_TALL"),
/* billboard scrim only when text loses its safe zone: */
style: if(a!isPageWidth({ "PHONE" }), "SEMI_LIGHT", "NONE"),
/* flip alignment when columns stack: */
align: if(
  a!isPageWidth({ "DESKTOP_NARROW", "TABLET_LANDSCAPE", "TABLET_PORTRAIT", "PHONE" }),
  "START", "END"
)
```
Source: `sources/conference-home-page.sail` L8–12, 285–289; `sources/nonprofit-fundraise-campaign-dashboard.sail` L277–288.
- Breakpoints: `PHONE / TABLET_PORTRAIT / TABLET_LANDSCAPE / DESKTOP_NARROW / DESKTOP / DESKTOP_WIDE`. List every width you mean; there is no "and below".
- Always pair `align:"END"` content with a stack-time flip to START, or it orphans when stacked.

### 2.2 `stackWhen` — and locking with `"NEVER"`
```sail
a!columnsLayout(columns: { … },
  stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE", "DESKTOP_NARROW" })
/* keep a 7-col calendar or KPI row horizontal forever: */
a!columnsLayout(columns: { … }, spacing: "NONE", stackWhen: { "NEVER" })
```
Source: `sources/university-student-dashboard.sail` L1600–1605; `sources/real-estate-property-list.sail` L883.
- Corpus pages routinely include `DESKTOP_NARROW` — 2-col layouts stack earlier than you think.
- sideBySideLayout has its own `stackWhen`; conference-registration inverts it (stacks on DESKTOP widths) to turn a horizontal link bar into a vertical rail (L221–226).

### 2.3 Component swap via complementary `showWhen`
Different WIDGET per device — link rail on desktop, dropdown on phone.
```sail
a!dropdownField(
  label: "Select Language", labelPosition: "COLLAPSED",
  choiceLabels: { "ENGLISH", "ESPAÑOL", /* … */ },
  choiceValues: { 1, 2 /* … */ }, value: 1, saveInto: {},
  showWhen: a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })
),
a!sideBySideLayout(
  items: { /* 8 stacked text dynamicLinks */ },
  showWhen: not(a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })),
  stackWhen: { "DESKTOP_WIDE", "DESKTOP", "DESKTOP_NARROW" }
)
```
Source: `sources/conference-registration-portal.sail` L62–82, 217–226.
- The two `showWhen`s must be exact complements (`X` / `not(X)`) or some width renders both or neither.

### 2.4 Phone-variant blocks
When a layout can't reflow (calendars, choice cards), author a separate phone subtree.
```sail
if(a!isPageWidth({ "PHONE" }),
  { /* agenda list: stacked event cards */ },
  { /* 7-column month grid */ }
)
/* same trick for card templates: */
if(a!isPageWidth({ "PHONE" }),
  a!cardChoiceField(…, cardTemplate: a!cardTemplateBarTextStacked(…)),
  a!cardChoiceField(…, cardTemplate: a!cardTemplateBarTextJustified(…))
)
```
Source: `sources/ins-agent-home-page.sail` L679+; `sources/ins-quote-wizard-1.sail` L908–948. ins-agent also duplicates the whole calendar for medium widths, gated by `showWhen: not(…)` (L2837–4298).
- Duplicated blocks drift (the corpus itself shows copy divergence) — hoist shared values into locals (`local!dayHeight: "SHORT"`, L2).

### 2.5 Ghost spacer columns
Breathing room that exists only on wide screens.
```sail
a!columnLayout(contents: {}, width: "MEDIUM_PLUS",
  showWhen: a!isPageWidth({ "DESKTOP_WIDE" }))
```
Source: `sources/sustainability-dashboard.sail` L408–411; inverse `showWhen: not(a!isPageWidth({…}))` at `sources/nonprofit-fundraise-campaign-dashboard.sail` L255.
- Empty columns still consume ratio width when shown — include them in the visible-ratio math.

---

## 3. Color application

### 3.1 Every place a hex can go (corpus census)
You paint these params directly (all verified across `sources/*.sail`):
`a!headerContentLayout(backgroundColor)` · `a!billboardLayout(backgroundColor)` · `a!cardLayout(style, decorativeBarColor)` · `a!pane(backgroundColor)` · `a!stampField(backgroundColor, contentColor)` · `a!richTextItem(color)` / `a!richTextIcon(color)` · `a!tagItem(backgroundColor, textColor)` · `a!progressBarField(color)` · `a!buttonWidget(color)` · `a!gaugeField(color)` / `a!gaugeIcon(color)` · `a!chartSeries(color)` · `a!colorSchemeCustom(colors)` · `a!milestoneField(color)`.
- `a!headingField` takes NO color param — colored headings are rich text (`a!richTextItem(size:"LARGE_PLUS", style:{"STRONG"}, color:…)`) or auto-inversion on dark cards.
- 3- and 6-digit hexes both work (`"#fff"`, `"#f4f2f1"`); tokens and hexes are interchangeable in the same param.

### 3.2 Semantic + neutral tokens
```sail
backgroundColor: "ACCENT"      /* selected tag — restaurant-order L170 */
backgroundColor: "POSITIVE"    /* completed stamp — ins-claim L64 */
color: "NEGATIVE"              /* overflow bar — sustainability L642 */
color: "SECONDARY"             /* muted label text, everywhere */
contentColor: "STANDARD"       /* stamp glyph in default ink */
backgroundColor: "TRANSPARENT" /* stamp ring look — portal-home L375 */
```
- ACCENT's rendered hue comes from the site theme — never hard-code "the accent hex" beside token usage (corpus marks all rendered accent hexes `(est.)`).
- Reserve channels: pages that work keep ACCENT for selection/action only, and NEGATIVE appears about once per viewport.

### 3.3 Scheme tokens: PLUM_SCHEME / CHARCOAL_SCHEME + RAINFOREST
A coordinated dark UI without picking hexes.
```sail
a!headerContentLayout(
  contents: {
    a!cardLayout(contents: { … }, style: "PLUM_SCHEME", showBorder: false),
    a!pieChartField(…, colorScheme: "RAINFOREST")
  },
  backgroundColor: "PLUM_SCHEME"
)
```
Source: `sources/sales-perform-dashboard.sail` L173, 466, 698. `style: "CHARCOAL_SCHEME"` cards: `corpus/pages/lists.md` L5089.
- Use the SAME scheme token for page `backgroundColor` and card `style` — the renderer derives the card fill a step lighter; text auto-inverts.

### 3.4 One brand ramp on every chart
```sail
colorScheme: a!colorSchemeCustom(colors: { "#59C968", "#41934B", "#117D20" })
```
Source: `sources/sustainability-dashboard.sail` L1027, 1071, 1133 (same ramp ×3 charts).
- Define once, reuse on every chart — one shared ramp is what makes a lone `NEGATIVE` element the loudest pixel.
- Adjacent same-family slices are CVD-hostile — pair with `seriesLabelStyle: "ON_CHART"` where offered.

### 3.5 Alpha-tint trick: `concat(color, "1a")`
Pastel chip background guaranteed to harmonize with its text color.
```sail
a!tagItem(
  text: fv!item.workType.label,
  textColor: fv!item.workType.color,
  backgroundColor: concat(fv!item.workType.color, "1a")  /* ~10% alpha */
)
```
Source: `corpus/pages/kanban.md` L326–330.
- Works because SAIL accepts 8-digit RRGGBBAA hex. Keep the base color dark enough to read as text.

### 3.6 Dark theme recipe
- Canvas: `backgroundColor: "#333"` (quote wizards) or a scheme token (3.3). Dark bands/cards: `style: "#111"` (portal L777), `"#232020"` (real-estate rail), masthead `a!cardLayout(style: "#0E3842", showBorder: false)` wrapping the whole header (`sources/my-health-site.sail` L3–8).
- Text: do NOT set white manually — headings and standard rich text auto-invert on dark card styles. Only decorative glyphs get explicit `"#fff"`.
- Buttons: `style: "OUTLINE"` inverts to light-on-dark on colored cards (conference-home's "solid white" CTA is plain OUTLINE).
- `SECONDARY` text on dark runs low-contrast (repeated corpus risk) — prefer STANDARD on dark.

---

## 4. Cards as UI primitives

### 4.1 Card-as-button
Any composed layout becomes one big click target.
```sail
a!cardLayout(
  contents: { /* icon + label + value + chevron */ },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  tooltip: "Lending",              /* optional hover text */
  height: "AUTO", style: "NONE",
  marginBelow: "STANDARD", showBorder: false, showShadow: true
)
```
Source: `sources/ins-quote-review.sail` L323; `sources/real-estate-property-list.sail` L63–79; ×22 on ins-agent-home-page.
- Shadow-only (no border) is the corpus's "clickable" signal on tinted canvases.
- `a!dynamicLink(label:…)` is the screen-reader name; empty `saveInto: {}` demos do nothing.

### 4.2 Card-as-nav-rail
```sail
a!cardLayout(
  contents: {
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextIcon(icon: "university", size: "MEDIUM_PLUS") },
      align: "CENTER")
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  tooltip: "Lending",
  style: "#232020", marginBelow: "NONE", showBorder: false
),
/* …more items; then fill remaining height: */
a!cardLayout(height: "EXTRA_TALL", style: "#232020", marginBelow: "NONE", showBorder: false)
```
Source: `sources/real-estate-property-list.sail` L63–127. Text-row variant (glyph + icon + label): `sources/university-student-dashboard.sail` L47–98.
- Active item = swap `style` to the accent hex (`#990000` there) — state lives in the card fill.
- Cards don't stretch to viewport height; the empty `EXTRA_TALL` fillers ARE the full-height illusion (stack two if needed).

### 4.3 Selected-state tricks (no selection API)
```sail
/* (a) tab underline = empty bordered card in a narrow column under the label */
a!columnsLayout(columns: {
  a!columnLayout(contents: {}),
  a!columnLayout(contents: {
    a!cardLayout(contents: {}, style: "NONE", padding: "NONE",
      marginBelow: "NONE", showBorder: true)
  }, width: "EXTRA_NARROW"),
  a!columnLayout(contents: {})
}, spacing: "NONE", stackWhen: { "NEVER" })
/* (b) invisible-vs-accent glyph keeps alignment stable */
a!richTextItem(text: { "❘" }, color: "ACCENT", size: "LARGE")   /* active   */
a!richTextItem(text: { "❘" }, color: "#ffffff", size: "LARGE")  /* inactive */
```
Source: (a) `sources/portal-home-page.sail` L69–89 (+ `accessibilityText: "Navigation Tab (Selected)"` L67); (b) `sources/university-student-dashboard.sail` L55 vs its `#ffffff` twin.
- Always pair the trick with `accessibilityText` — white-on-white glyphs are read aloud literally.

### 4.4 Decorative bars as state and identity
```sail
a!cardLayout(
  contents: { /* today's schedule */ },
  showBorder: false, showShadow: true,
  decorativeBarPosition: "START",
  decorativeBarColor: "ACCENT"      /* siblings: "#fff" = invisible twin */
)
```
Source: `sources/university-student-dashboard.sail` L745–746 (today) vs 629–630. Category color: kanban column headers `decorativeBarPosition: "TOP", decorativeBarColor: fv!item.primaryColor` on `style: fv!item.secondaryColor` cards (`corpus/pages/kanban.md` L230–240). Spotlight: price card TOP + ACCENT (`sources/ins-quote-wizard-2.sail` L2482–2483).
- Paint the bar `#fff` on non-selected siblings (don't omit it) so all cards' content x-offsets match.
- `decorativeBarColor` without `decorativeBarPosition` renders NOTHING — the corpus has several dead params; set both.

### 4.5 Empty spacer cards
```sail
a!cardLayout(contents: {}, height: "EXTRA_TALL", style: "NONE",
  marginBelow: "STANDARD", showBorder: false)   /* stretch a rail */
a!cardLayout(height: "SHORT_PLUS", …)           /* footer breathing room */
```
Source: `sources/university-student-dashboard.sail` L437–450; `sources/ins-quote-wizard-1.sail` L1098.
- Match spacer `style` to its surface (`"NONE"` on white, the rail hex on rails) or it reads as a broken card.

### 4.6 Flush stacking: `marginBelow: "NONE"`
Cards that touch — accordions, chips, fused bands.
```sail
a!cardLayout(          /* clickable summary row */
  contents: { /* label + angle-down-bold chevron */ },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  style: "NONE", marginBelow: "NONE", showShadow: false
),
a!cardLayout( /* detail card butts against the row above = accordion */ … )
```
Source: `sources/ins-quote-wizard-2.sail` L2698–2726 (open row's chevron is `angle-down-bold` L2697; closed rows `angle-right-bold`). Nested chip: shadow card wraps a `shape: "SEMI_ROUNDED", padding: "NONE", showBorder: true` inner card with a colored icon-tile mini-card in an `EXTRA_NARROW` column (`sources/ins-agent-home-page.sail` L2539–2632).
- The seam only closes if the UPPER card sets `marginBelow: "NONE"` — `marginAbove` on the lower card is not equivalent.

---

## 5. Hand-built widgets

### 5.1 KPI card with MICRO sparkline
```sail
a!lineChartField(
  labelPosition: "ABOVE",
  categories: a!forEach(items: fv!item.data, expression: local!kpiName),
  series: { a!chartSeries(label: "count", data: fv!item.data, color: fv!item.color) },
  yAxisMax: 40,
  showLegend: false,
  height: "MICRO",
  xAxisStyle: "NONE",
  yAxisStyle: "NONE"
)
```
Source: `sources/sales-perform-dashboard.sail` L148–166.
- Mapping every category to the KPI name makes tooltips read the metric, not "Category 3".
- Share one `yAxisMax` across sibling sparklines or trends aren't comparable.

### 5.2 Custom chart legend from richTextIcon dots
```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(),                              /* empty flank centers */
    a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: { a!richTextIcon(icon: "circle", color: "#619ed6"), " Existing Donors" }
    ), width: "MINIMIZE"),
    /* ×2 more dot+label items */
    a!sideBySideItem()
  },
  spacing: "SPARSE", marginBelow: "MORE"
)
```
Source: `sources/nonprofit-fundraise-campaign-overview.sail` L613–659.
- Dot hexes must equal the chart's series colors exactly — two hand-synced lists.

### 5.3 Vertical timeline / stepper from stamps + connectors
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!stampField(labelPosition: "COLLAPSED", icon: "car-crash",
        backgroundColor: "POSITIVE", contentColor: "STANDARD", size: "TINY",
        align: "CENTER", marginBelow: "NONE", accessibilityText: "Completed Step")
    }, width: "EXTRA_NARROW"),
    a!columnLayout(contents: {
      a!richTextDisplayField(labelPosition: "COLLAPSED",
        value: { a!richTextItem(text: { "Loss Occurred" }, style: { "STRONG" }) }),
      a!richTextDisplayField(labelPosition: "COLLAPSED",
        value: { a!richTextItem(text: { "September 13" }, size: "SMALL") })
    })
  },
  alignVertical: "MIDDLE", marginBelow: "NONE", spacing: "NONE"
)
/* between steps: same 2-col row, first col = a!imageField(
   images: a!documentImage(document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()), size: "TINY") */
```
Source: `sources/ins-claim-case-study.sail` L57–131; wizard flavor adds `accessibilityText: "Current Step (1 of 6)"` on the active label (`sources/ins-quote-wizard-1.sail` L528–566).
- The connector is an IMAGE asset, not a line component — supply your own constant.
- Prefer stock `a!milestoneField(stepStyle: "DOT", orientation: "VERTICAL")` (`corpus/pages/forms.md` L824–829) unless you need per-step icons/dates.

### 5.4 Calendar grid from 7-col columnsLayout
```sail
a!columnsLayout(       /* weekday header row */
  columns: { a!columnLayout(contents: {
    a!cardLayout(contents: {
      a!richTextDisplayField(labelPosition: "COLLAPSED",
        value: { "FRI" }, preventWrapping: true, align: "CENTER")
    }, style: "#f3f3f3", padding: local!headerPadding, marginBelow: "NONE", showBorder: false)
  }) /* ×7 */ },
  marginBelow: "NONE", spacing: "NONE", showDividers: true
),
a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
a!columnsLayout(       /* week row: 7 fixed-height transparent day cards */
  columns: { a!columnLayout(contents: {
    a!cardLayout(contents: { /* right-aligned day-number rich text */ },
      height: local!dayHeight, style: "TRANSPARENT", marginBelow: "NONE", showBorder: false)
  }) /* ×7 */ }, spacing: "NONE", showDividers: true
)
```
Source: `sources/ins-agent-home-page.sail` L1040–1135 (`local!dayHeight: "SHORT"` at L2). Adjacent-month day numbers: `color: "SECONDARY"`.
- Vertical grid lines = `spacing: "NONE"` + `showDividers: true`; horizontal ones are explicit `a!horizontalLine` between week rows.
- This grid can't reflow — pair with a phone agenda variant (2.4).

### 5.5 Segmented control from tagField + dynamicLink
```sail
a!tagField(
  tags: {
    a!forEach(
      items: { "Dine In", "To Go", "Delivery" },
      expression: a!tagItem(
        text: fv!item,
        link: a!dynamicLink(value: fv!index, saveInto: local!selectedTag),
        backgroundColor: if(local!selectedTag = fv!index, "ACCENT", "#FFF")
      )
    )
  },
  marginBelow: "MORE"
)
```
Source: `sources/restaurant-order.sail` L158–179.
- `"#FFF"` unselected chips need a white-ish surface, or give them a real fill.

### 5.6 Label/value rows via sideBySide + MINIMIZE
Left value, right-pinned meta — the universal record row.
```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: a!richTextItem(text: "$123.45", size: "MEDIUM_PLUS", style: "STRONG"))),
    a!sideBySideItem(item: a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: a!richTextItem(text: "Due July 1", size: "MEDIUM_PLUS")),
      width: "MINIMIZE")
  },
  alignVertical: "MIDDLE"
)
```
Source: `sources/customer-acct-management.sail` L48–72 (inside an eyebrow section, 6.2).
- `width: "MINIMIZE"` on the pinned item + default fill on the other is the whole trick.

### 5.7 Bullet chart from paired progress bars
Actual-vs-target with a target tick — no gauge.
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!progressBarField(labelPosition: "COLLAPSED", percentage: 79,
        color: "#3a77e9", style: "THICK", showPercentage: false)
    }, width: "AUTO"),
    a!columnLayout(contents: {
      a!progressBarField(labelPosition: "COLLAPSED", percentage: - 1,   /* empty */
        color: "NEGATIVE", style: "THICK", showPercentage: false)
    })
  },
  alignVertical: "MIDDLE", spacing: "NONE", stackWhen: { "NEVER" }, showDividers: true
)
```
Source: `sources/sustainability-dashboard.sail` L619–656 (×3). The column divider IS the target tick; over target, bar 2 becomes `percentage: 10, color: "NEGATIVE"` overflow.
- `percentage: -1` renders an empty track — load-bearing, not a bug.
- Column ratio encodes where the target sits; state the target value in text ("257K") since there's no scale.

### 5.8 KPI trio from divided columns (not a!kpiField)
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
        a!richTextItem(text: { "REQUIRED CREDITS" }, color: "SECONDARY", size: "SMALL"),
        char(10),
        a!richTextItem(text: { "120" }, size: "LARGE")
      })
    }) /* ×3 */
  },
  alignVertical: "MIDDLE", showDividers: true
)
```
Source: `sources/university-student-dashboard.sail` L1110–1163. Wider strips add `spacing: "SPARSE"` (`corpus/pages/employee-home-pages.md` L272–273); drop dividers on phone via `showDividers: if(a!isPageWidth({"PHONE"}), false, true)` (`sources/sustainability-dashboard.sail` L403).
- When stacked, dividers vanish — sustainability duplicates phone-only labels to keep context.

---

## 6. Typography moves

### 6.1 Composed displays from nested richTextItem sizes
Hand-built price/stat lockups (there is no "display text" component).
```sail
a!richTextDisplayField(
  labelPosition: "COLLAPSED",
  value: {
    a!richTextItem(
      text: { a!richTextItem(text: { "$113.50" }, style: { "STRONG" }), " " },
      size: "LARGE"
    ),
    a!richTextItem(text: { "/ Month" }, size: "MEDIUM")
  }
)
```
Source: `sources/ins-quote-review.sail` L177–190.
- Nest items to combine size+weight; ladder: `SMALL → STANDARD → MEDIUM → MEDIUM_PLUS → LARGE → LARGE_PLUS → EXTRA_LARGE`.
- Icons one step larger than adjacent text optically match (MEDIUM_PLUS icon beside MEDIUM text).

### 6.2 Caps eyebrow labels
```sail
a!sectionLayout(
  label: "NEXT PAYMENT",           /* type the caps yourself */
  labelSize: "SMALL",
  labelColor: "SECONDARY",
  labelHeadingTag: "H3",
  divider: "BELOW",
  contents: { /* value row */ }
)
```
Source: `sources/customer-acct-management.sail` L45–78 (repeated = record separators). Rich-text flavor: SMALL SECONDARY caps over a LARGE number (5.8).
- No uppercase transform exists — caps are literal text; keep them short.
- SMALL + SECONDARY is flagged borderline-contrast throughout the corpus — don't also shrink surrounding padding.

### 6.3 `char(10)` as layout
Line breaks and vertical rhythm inside one rich text field.
```sail
value: {
  char(10), char(10), char(10), char(10),      /* top padding to center in card */
  a!richTextIcon(icon: "bell-slash-o", color: "#d9d9d9", size: "EXTRA_LARGE"),
  char(10),
  a!richTextItem(text: { "No Alerts" }, color: "SECONDARY", size: "MEDIUM")
}, align: "CENTER"
```
Source: `sources/nonprofit-fundraise-campaign-dashboard.sail` L325–344. Also: paragraph breaks in comment bodies; desktop-only spacing `if(…, char(10), "")`; stacked billboard headlines (portal L219–313).
- `char(10)` height scales with the enclosing item's text size.

### 6.4 Decouple heading tag from visual size
```sail
a!sectionLayout(label: "REGISTER NOW", labelSize: "LARGE",
  labelHeadingTag: "H1", labelColor: "STANDARD", divider: "BELOW", …),
a!sectionLayout(label: "YOUR DETAILS", labelSize: "SMALL",
  labelHeadingTag: "H2", labelColor: "STANDARD", …)
```
Source: `sources/conference-registration-portal.sail` L234–256. `a!headingField` splits the same way: `size`/`fontWeight` vs `headingTag` (`sources/my-health-site.sail` L20–24: an H1 rendered REGULAR).
- Build the H1→H2→H3 tree by tag, style each level independently; caps (6.2) let SMALL headings hold rank.

### 6.5 Underscore-string rules
A colored divider exactly as wide as you draw it.
```sail
a!richTextItem(
  text: {
    a!richTextItem(text: { "______________________________" }, size: "SMALL"),
    "____________________________________"
  },
  color: "#93c47d"
)
```
Source: `sources/sustainability-dashboard.sail` L74–84 (mixed sizes vary the weight mid-line).
- For full-width rules use `a!horizontalLine`; this is for short, colored, inline ones.

---

## 7. Layout precision

### 7.1 Empty flanking columns center anything
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {}),
    a!columnLayout(contents: { /* the content */ }, width: "MEDIUM_PLUS"),
    a!columnLayout(contents: {})
  }
)
```
Source: `sources/conference-home-page.sail` L294–330; portal bands (1.3) nest this twice. Width words: `EXTRA_NARROW / NARROW / NARROW_PLUS / MEDIUM / MEDIUM_PLUS / WIDE / WIDE_PLUS / AUTO / 1X…10X`.
- On stacking, empty flanks collapse to zero height, degrading gracefully; ratio (`1X`) flanks instead add phantom gaps — use word widths or `showWhen`-gate them.

### 7.2 EXTRA_NARROW icon columns
Icon/stamp gutter + text column that stays aligned down a list.
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: { /* stamp, icon tile, avatar */ }, width: "EXTRA_NARROW"),
    a!columnLayout(contents: { /* text block */ })
  },
  alignVertical: "MIDDLE", spacing: "NONE"
)
```
Source: steppers (5.3); claim-chip icon tile (`sources/ins-agent-home-page.sail` L2543–2567); equation strips use EXTRA_NARROW "+"/"=" columns (sustainability L1183–1499).
- `spacing: "NONE"` here; let the inner card's `padding` set the gap — column spacing + card padding double up.

### 7.3 `spacing: "NONE"` + `showDividers: true`
Hairline vertical separators (tables, calendars, KPI strips, seams).
```sail
a!columnsLayout(columns: { … }, spacing: "NONE", stackWhen: { "NEVER" }, showDividers: true)
```
Source: calendar (5.4), bullet target tick (5.7), menu/content seam `sources/real-estate-property-list.sail` L882–885.
- Dividers render between COLUMNS only — for row rules use `a!horizontalLine` or `a!sectionLayout(divider: "BELOW")`.

### 7.4 Pinning with MINIMIZE + empty items
```sail
a!sideBySideLayout(
  items: {
    a!sideBySideItem(showWhen: a!isPageWidth({ "DESKTOP_NARROW", "DESKTOP", "DESKTOP_WIDE" })),
    /* ↑ empty item fills → pushes the rest right, desktop only */
    a!sideBySideItem(item: /* content */, width: "MINIMIZE")
  },
  alignVertical: "MIDDLE"
)
```
Source: `sources/conference-home-page.sail` L53–61; MINIMIZE pinning `sources/customer-acct-management.sail` L48–72.
- An `a!sideBySideItem()` with no `item:` is legal flexible space — the corpus's flexbox spring.

### 7.5 Pseudo-table from mirrored column widths
Table look with card rows — header and rows share one geometry.
```sail
a!columnsLayout(columns: {
  a!columnLayout(contents: { a!richTextDisplayField(labelPosition: "COLLAPSED", value: "Item") }),
  a!columnLayout(contents: { a!richTextDisplayField(labelPosition: "COLLAPSED",
    value: "Quantity", align: "RIGHT") }, width: "EXTRA_NARROW"),
  a!columnLayout(contents: { a!richTextDisplayField(labelPosition: "COLLAPSED",
    value: "Price", align: "RIGHT") }, width: "EXTRA_NARROW")
}, marginBelow: "NONE"),
a!horizontalLine(marginAbove: "STANDARD", marginBelow: "NONE")
/* each data row repeats the SAME widths/aligns */
```
Source: `sources/restaurant-order.sail` L180–214. Fixed-geometry variant: `width: "2X"` ×36 (tabular-data-display analysis).
- The illusion dies if any row's width list drifts from the header's.

---

## 8. Empty states, disclosure, grids

### 8.1 Designed empty states
```sail
a!cardLayout(
  contents: {
    a!richTextDisplayField(
      labelPosition: "COLLAPSED",
      value: {
        a!richTextIcon(icon: "clock-o", color: "#a4c2f4", size: "EXTRA_LARGE"),
        char(10), char(10),
        a!richTextItem(text: { "Waiting for Estimate" }, color: "SECONDARY", size: "MEDIUM_PLUS")
      },
      align: "CENTER"
    )
  },
  padding: "EVEN_MORE", showBorder: false, showShadow: true
)
```
Source: `sources/ins-claim-case-study.sail` L933–961. Fixed-height variant: `height: "MEDIUM_PLUS"` card + `char(10)×4` top padding (6.3).
- Tint the icon a pale pastel (`#a4c2f4`, `#d9d9d9`), never NEGATIVE — empty ≠ error.

### 8.2 In-place content swap (complementary showWhen)
One card, two states — e.g., price view ↔ "save for later" form.
```sail
a!cardLayout(contents: {
  a!sideBySideLayout( /* price + CTA */ …,
    showWhen: not(local!showSaveForLater)),
  a!sideBySideLayout( /* email + confirm */ …,
    showWhen: local!showSaveForLater)
}, decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT", …)
```
Source: `sources/ins-quote-wizard-2.sail` L2405–2484 (toggle written by a button's `saveInto`).
- Swap INSIDE the styled card so the frame doesn't blink — the card, not the page, is the unit of state.

### 8.3 Step switching: choose() / a!match + milestone
Wizard screens without process modeling.
```sail
a!localVariables(
  local!stepNumber: 2,
  choose(local!stepNumber,
    a!headerContentLayout( /* screen 1 */ ),
    a!headerContentLayout( /* screen 2 */ ),
    …
  )
) /* buttons: a!buttonWidget(…, value: 3, saveInto: local!stepNumber) */
```
Source: `sources/ins-quote-wizard-1.sail` L1–10 (4 branches). Section-level flavor: `a!match(value: local!currentFormStep, equals: 2, then: a!sectionLayout(…), …, default: {})` bound to the same local as `a!milestoneField(steps: local!formSteps, active: local!currentFormStep)` — `corpus/pages/forms.md` L824–898.
- `choose` is 1-indexed and unguarded — a button writing a valueless branch renders nothing; keep advertised steps and implemented branches in sync (the corpus wizard advertises 6, implements 4).

### 8.4 Progressive-disclosure accordion
See 4.6 — card-as-link summary row (`angle-right-bold` closed / `angle-down-bold` open) + `marginBelow: "NONE"` join + `showWhen`-gated detail card. Source: `sources/ins-quote-wizard-2.sail` L2539–2726.

### 8.5 Grid essentials + toolbar
```sail
a!gridField(
  label: "Campaigns List",
  labelPosition: "COLLAPSED",
  columns: {
    a!gridColumn(label: "Name", width: "AUTO"),
    a!gridColumn(label: "Start Date", align: "END"),
    a!gridColumn(label: "Goal Amount (USD)", align: "END"),
    a!gridColumn(label: "% Raised", align: "END")
  },
  pageSize: 15,
  validations: {}
)
```
Source: `sources/nonprofit-fundraise-campaign-dashboard.sail` L743–756.
- `align: "END"` on every quantitative/date column; text stays START. Widths: `AUTO`, `ICON`, `NARROW`, `WIDE`, or `1X…10X`.
- Bulk actions go in a toolbar, not per-row link stacks: record-backed grids take `recordActions: {…}, actionsDisplay: "TOOLBAR"` with checkbox selection; max one action per cell (ux-grids page). A `gridField` with no data source renders EMPTY — docs previews inject sample rows; wire a record type or datasubset.

### 8.6 Sticky board header
```sail
a!headerContentLayout(
  isHeaderFixed: true,
  contentsPadding: "LESS",
  backgroundColor: "#FCFCFD",
  header: { a!cardLayout(style: "#FCFCFD", showBorder: false, padding: "LESS",
    contents: { /* title + actions + column headers */ }) }
)
```
Source: `corpus/pages/kanban.md` L170–180.
- Match header-card `style` to `backgroundColor` so the fixed band is seamless over scrolling content.
