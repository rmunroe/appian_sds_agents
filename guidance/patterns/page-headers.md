# Page Headers & Titles

How a page names itself and what rides above the content: title styles (official Page Titles vocabulary) plus header bands — title bars, KPI strips, filter bars, billboards, heroes — stacked in the `a!headerContentLayout` header slot (official Page Headers vocabulary). One merged decision: pick a title style, then add only the bands the page earns.

## When this pattern
Every page makes this decision. Invest in header weight when: users are occasional and need orientation; the surface is brand-forward; metrics or filters govern the whole page. Go minimal when: the page is a dense daily tool where every band costs grid rows — the corpus's densest pages carry **no title at all** (nav tab identity).
Nearest alternatives: forms/wizards put the same title-bar recipes in `a!formLayout(titleBar: …)` (CODE-VERIFIED: breadcrumb + heading + right-aligned buttons on a dark card); photogenic records replace the title with a billboard identity strip (record-view territory, built from this pattern's billboard variant).

## Anatomy
The header slot is a stacking system: 1–3 flush bands, each an `a!cardLayout` or `a!billboardLayout` with `marginBelow: "NONE"`:
```
HEADER-CONTENT
├─ SITE-NAV (site chrome, not SAIL)
├─ [mood]     BILLBOARD photo/color h=EXTRA_SHORT…TALL, overlay=full | bottom-bar | column-card
├─ [identity] CARD(title bar: icon + H1 heading, brand fill via style: <brand hex>)
├─ [data]     CARD(KPI-ROW ×4–5 dividered + primary-action button, neutral fill)
├─ [scope]    CARD(filter bar: dates + dropdowns, style:"NONE" + shadow — floats above content)
└─ contents…
```
Order bands **mood → identity → data** (the official mix-and-match example); give each band one distinct treatment (photo / brand fill / neutral fill) so luminance steps separate them without borders. Titles not on a bar live in content as `a!sectionLayout` labels. Budget: the whole stack ≤ ~350px before content on laptops; a purely decorative billboard should be EXTRA_SHORT (~90px). In-content titles always take `headingTag`/`labelHeadingTag: "H1"` regardless of visual size.

## Variants
### A. Title styles (official specs — page text wins)
| style | spec | use when |
|---|---|---|
| Standard | section label: labelSize LARGE, H1, labelColor STANDARD | default; nothing below competes with the title |
| Standard + divider | LARGE, H1, STANDARD; divider line Above Content, weight Thin, color Standard | contents compete — e.g. accent-colored section headings directly below; the line keeps the title distinct |
| Prominent | LARGE_PLUS, H1, STANDARD; no divider; marginAbove & marginBelow EVEN_MORE | sparse layouts with plentiful whitespace |
| Title bar | `a!headingField(size:"MEDIUM", fontWeight:"SEMI_BOLD", headingTag:"H1", marginBelow:"NONE")` on a brand-fill card, `padding:"STANDARD"`, flush; leading icon one size up (MEDIUM_PLUS) via SBS `width:"MINIMIZE"` (rich-text build: MEDIUM_PLUS + STRONG) | orientation via a contrasting band; the bar shouts so the heading doesn't |
| Tall title bar | card `padding:"MORE"`; either LARGE_PLUS light-weight heading + MEDIUM subtitle, or breadcrumb line (SMALL, links light-colored, "/" separators, current node unlinked) above a MEDIUM_PLUS BOLD heading; room for right-aligned OUTLINE + SOLID buttons (`align:"END"`) | sparse pages; occasional users who need the page's purpose spelled out; transactional pages needing breadcrumbs/cart/actions |
| No title | nothing — the highlighted nav tab is the identity | densely packed content where a bar adds clutter |

### B. Header bands
- **KPI header**: one filled card, 4–5 dividered KPI columns + the page's primary action (`COLUMNS [WIDE_PLUS : AUTO-spacer : NARROW]`, button LARGE SOLID `align:"END"`). Values MEDIUM_PLUS STRONG over caps labels — anatomy in [data-value-display](data-value-display.md). The band doubles as a launchpad: the button is the only saturated element.
- **Filter bar header**: page-scoped filters as the header (dates at `width:"MINIMIZE"`, dropdowns wider at `width:"2X"`, sparse SBS). Official bonus: wire filters to URL parameters for defaults, shareable/bookmarkable filtered links, and remembered selections.
- **Decorative billboard**: content overlaid on a photo; the official rule is to choose overlay shade and transparency deliberately so content stays readable. A bottom scrim bar carries record identity (title + owner metadata + avatars) on photogenic records.
- **Card-for-contrast**: when the photo is light or uncontrolled, put overlay text on an **opaque brand-fill card** inside the overlay (≤1/3 width, placed off the photo's subject) — contrast becomes independent of image luminance, and the fix doubles as a brand moment.
- **Hero card header**: a card whose fill exactly matches the site header bar color, fusing nav + hero into one block (official: works best with the "Mercury" header bar style). Prefer flat illustration over photography when text must sit on the band; large light-weight type; drop the CTA when the message is the point.
- **Mix and match**: billboard + title card + KPI card concatenated in one `header: {…}` array, every band `marginBelow: "NONE"` (CODE-VERIFIED).

### Selection rules
- Occasional users or sparse content → tall title bar or prominent title.
- Dense daily tool → no title, or the thin title bar; never spend a tall hero here.
- Filters governing all zones → filter bar as the header (placement itself signals scope).
- Metrics-first landing → KPI header; add an EXTRA_SHORT billboard above only if brand warmth is wanted at ~90px cost.
- Photo identity → billboard: bottom scrim bar for controlled dark photos; contrast card for light/uncontrolled ones.
- Divider only when things compete below; skip the title only when the nav tab truly names the page.

## Component roster
- [header-content-layout](../components/header-content-layout.md) — the header slot; `backgroundColor` for page field
- [card-layout](../components/card-layout.md) — every band; brand fill via `style`, flush via `marginBelow:"NONE"`
- [billboard-layout](../components/billboard-layout.md) — photo/color bands; `backgroundMedia: a!webImage(…)`, `height`, overlays
- [section-layout](../components/section-layout.md) — in-content titles: `labelSize`, `labelHeadingTag`, `labelColor`, divider
- [heading-field](../components/section-layout.md) — bar titles: `size`, `fontWeight`, `headingTag`
- [rich-text-display-field](../components/rich-text.md) — breadcrumbs, subtitles, KPI cells
- [side-by-side-layout](../components/side-by-side-layout.md) — icon + heading pairing (`alignVertical:"MIDDLE"`)
- [button-widget](../components/buttons.md) — bar actions (OUTLINE + SOLID pair, band-embedded primary)

## Layout decisions by data shape
- Title alone → thin bar. Title + subtitle or breadcrumbs → tall bar (`padding:"MORE"`). Title + actions → tall bar with a second column, buttons `align:"END"`, `alignVertical:"MIDDLE"`.
- 4–5 KPIs max in a band; an AUTO spacer column isolates the action button from the metrics.
- ~4 filter controls fit one header row; more → rethink scope, don't wrap into two rows.
- Billboard height by job: EXTRA_SHORT = garnish over a KPI band · SHORT_PLUS/MEDIUM = hero carrying title + KPI trio in its overlay · tall (~530px observed) = message-only public heroes with body content sacrificed below the fold.
- Verb-titles for search/action pages ("Search the …") make the H1 the instruction — title and affordance in one line.

## Mobile behavior
- Billboards step down: `height: if(a!isPageWidth({"PHONE"}), "MEDIUM", "SHORT_PLUS")`; overlay `alignVertical` TOP on phone (CODE-VERIFIED).
- KPI bands stack into a vertical march — cap at 5, disable dividers when stacked (`showDividers: if(a!isPageWidth({"PHONE"}), false, true)`), repeat per-item caps labels.
- Title bars need no fork — the corpus keeps them constant across widths while body content forks (`a!isPageWidth({"PHONE","TABLET_PORTRAIT"})` on contents).
- Purely decorative bands are the first cut on small widths: hide with `showWhen: not(a!isPageWidth({…}))` (corpus ghost-column technique).
- Stack order stays mood → identity → data; identity must never scroll away first.

## Top 3 don'ts
1. **Overlay text straight onto an uncontrolled photo.** The two sanctioned fixes are a deliberate dark scrim (controlled photos) or an opaque overlay card (light photos). Light text on a light photo is the demoed worst case — and light text on a mid-value brand bar can fail contrast where dark text passes.
2. **Ambiguous or redundant titles.** A LARGE title sitting above accent-colored section headings with no divider (the exact ambiguity the divider variant exists to fix); or any title bar at all on a dense page the nav tab already names — clutter with zero information.
3. **Overspending the band budget.** A tall photo hero + title band + KPI band + filter bar pushes content ~350px+ down; gaps between bands (missing `marginBelow:"NONE"`) shatter the masthead into floating cards. Pick ≤3 bands, keep decoration EXTRA_SHORT, weld them flush.

## Exemplars
| case study | what to steal |
|---|---|
| [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md) | the flush masthead: EXTRA_SHORT photo billboard welded to a KPI band via double `marginBelow:"NONE"`; single SOLID action inside the band |
| [sustainability-dashboard](../case-studies/sustainability-dashboard.md) | billboard hero carrying title + KPI trio inside a full overlay; colored borderless filter-band card fused beneath — the two-band header as one brand block |
| [sales-perform-dashboard](../case-studies/sales-perform-dashboard.md) | "no page title" executed: a KPI band card is the entire header and the biggest text on the page is the numbers |
