# Header Content Layout (a!headerContentLayout)

The two-zone top-level layout — a `header` list of card/billboard layouts flush with the page's top, left, and right edges, above a `contents` body — and the root layout of most pages. Reach for it for welcome banners, title bars, secondary nav, or whenever you need `backgroundColor`/`contentsPadding` control: those params exist ONLY here, and the header may be left empty just to get them. It cannot nest inside other layouts. On record views a record header achieves the same look; for independently scrolling regions put a [pane layout](pane-layout.md) in `contents`.

## Variants (header treatments)
- **Card header** — `a!cardLayout(style: "#0f203a", padding: "STANDARD"…"EVEN_MORE", marginBelow: "NONE", showBorder: false)`: solid brand bar; the drop-in downgrade from billboard when imagery is unavailable (the Boreas card variant keeps title + milestone identical to the photo version).
- **Billboard header** — `a!billboardLayout(backgroundMedia: a!webImage(...), height: "MEDIUM", overlay: a!fullOverlay(style: "SEMI_DARK", padding: "EVEN_MORE"))`: photo/video hero. The Boreas donation wizard puts a LARGE title, italic fact line, and `a!milestoneField(color: "ACCENT")` inside the overlay — progress lives in the hero.
- **Mixed/stacked header** — `header` accepts a LIST: the fundraising ops demo stacks billboard `height: "EXTRA_SHORT"` (brand ribbon ~120px) + `#0f203a` title card + `#eee` KPI-strip card, all `marginBelow: "NONE"`, fusing into one banner.
- **Title bar** — a header card as identity bar: circular photo + name LARGE + role caps + facts row with icons (new-hire onboarding, slate #48617e est.).
- **Secondary nav** — a filled card in the header list under the billboard carries sub-links (Hugo Loans: crimson #b52a51 est. band, active item STRONG + caret; keep it to ~3 items).

## Styling hooks
- **backgroundColor** (colors the contents zone only; header layouts color themselves): "White" (default), "Transparent", "Charcoal Scheme", "Navy Scheme", "Plum Scheme", or custom hex (+2-digit alpha). TRANSPARENT shows the light-gray site background — use whenever contents are mostly cards/boxes so white cards get free contrast (ACME help portal, 2x2 category cards). With a custom brand hex, put contents in cards LIGHTER than the background. Dark schemes go on all site pages or none.
- **contentsPadding**: "None", "Even Less", "Less", "Standard" (default), "More", "Even More". NONE fuses contents to the header seam and viewport edges — the Boreas gray wizard rail (#f0f0f0) reads as app chrome; MORE/EVEN_MORE reads editorial.
- **isHeaderFixed: true** pins the header while contents scroll (campaign progress stays visible). Two hard rules: header layouts take `marginBelow: "NONE"` and the gap moves to `marginAbove` on the FIRST contents component — otherwise the white gap is pinned with the header and scrolling text clips behind a floating band; and unfix on narrow screens (see Top don't).
- **Seamless hero**: when billboard artwork is a transparent PNG, set the billboard's backgroundColor to the same hex as the page background — the header dissolves and the one SOLID CTA becomes the only object (Home Finder, shared #f0f1f2 est.).
- **Site page width** (site object, not SAIL): Full/Wide renders the header edge-to-edge, flush with the nav bar; Medium/Narrow (and Tempo) leave a visible gray matte around the whole page — pick header colors that tolerate the frame.

## Idioms
1. Minimal starter (hcl_basic_example, CODE-VERIFIED):
```
a!headerContentLayout(
  header: { a!cardLayout(
    contents: { /* richTextHeader "Welcome!" LARGE + SMALL icon subtitle */ },
    style: "#0f203a", padding: "STANDARD", marginBelow: "NONE", showBorder: false
  ) },
  contents: { /* columnsLayout of cards */ },
  backgroundColor: "WHITE", contentsPadding: "STANDARD")
```
2. Wizard shell (hcl_billboard_header, CODE-VERIFIED): `isHeaderFixed: true` billboard + `contentsPadding: "NONE"` + a filled `#f0f0f0` rail column (width MEDIUM) of TINY `a!stampField` steps (ACCENT done/current, #b7b7b7 upcoming) beside a form column centered by empty columnLayouts.
3. KPI strip in header (hcl_mixed_header, CODE-VERIFIED): third header card `style: "#eee"` holding `a!columnsLayout(spacing: "SPARSE", showDividers: true)` of 5 rich-text KPI columns + one SOLID "NEW CAMPAIGN" button, `alignVertical: "MIDDLE"` — metrics travel with page chrome instead of sitting in bordered cards below.

## Top don't
Never leave a tall header fixed on phones: in the docs DON'T the fixed header eats ~58% of the viewport and content scrolls inside the leftover strip — most of the page unreachable. Gate it with `a!isPageWidth()`, e.g. `isHeaderFixed: not(a!isPageWidth("PHONE"))` (the page names a!isPageWidth; exact expression inferred), and keep fixed headers short relative to the viewport.
