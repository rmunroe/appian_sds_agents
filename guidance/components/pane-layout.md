# Pane Layout (a!paneLayout / a!pane)

Two or three full-height, independently scrolling vertical panes — the workbench layout for "controls beside content". Primarily a top-level layout (fills screen width and height); also legal as the single child of a form layout's or [header content layout](header-content-layout.md)'s `contents`. NOT for pages that should scroll as one surface — use a header content layout with `a!columnsLayout` instead. In design view it appears only under Top Level Layouts on a blank interface; for existing pages switch to expression mode. All hexes on this docs page are pixel estimates (no SAIL source).

## Variants (usage modes)
- **Top-level** — the pane layout is the page (pane_top_level: fixed ≈400px white FILTERS pane + AUTO analytics pane whose sections cut mid-title at the fold — proof the content pane scrolls on its own).
- **Inside a!formLayout** — one paneLayout in `contents`, form header band above, button footer below (pane_in_form: source email in a gray #f7f7f9 est. left pane, case fields in a white right pane with its own scrollbar, CANCEL / OPEN CASE footer).
- **Inside a!headerContentLayout** — one paneLayout in HCL `contents` when brand header + tabs must persist over multiple scroll regions (pane_in_hcl: near-black #212121 est. header, crimson #b0231a est. CTA + active-tab underline, over a filter rail + 3-column listing card grid).

## Styling hooks
- **a!paneLayout(showDividers:)** — hairline rules between panes. Turn OFF inside a form that already has header and button-footer dividers (the page's rule: avoids a heavy, boxy look); separate panes by fill instead — pane_in_form uses gray-vs-white, no drawn rule.
- **a!pane(width:)** — a fixed value or "AUTO". Always-severity rule: whenever any pane is fixed, at least one other pane must be AUTO. Fix the control rail (observed filter panes: ≈375–555px) so filters keep exact width and legibility across resizes; AUTO the content pane so the grid absorbs surplus width to the screen edge.
- **a!pane(backgroundColor:)** — "White" (default), "Gray", "Transparent", "Charcoal Scheme", "Navy Scheme", "Plum Scheme", or custom hex (+2-digit alpha 00–FF). Full-height color fields do structure without borders: brand one pane, keep the content pane near-neutral, and keep cards a LIGHTER hex than their pane. pane_background_color_cards runs a saturation ladder — green rail #38c26a est. → blue filter pane #2a63c5 est. → gray content #edeff1 est. → white cards — and input chrome inverts to white-on-dark automatically on dark fills. Don't mix dark-scheme panes and light pages across a site.
- **a!pane(padding:)** — "None"…"Even More" ("Standard" default): whitespace at the pane's edges, not between components (pane_padding_progression). NONE for flush rails.

## Idioms
1. Filter rail + collection (pane_in_hcl, pane_layout_width_do):
```
a!paneLayout(panes: {
  a!pane(width: /* fixed */, contents: { /* FILTERS form: search,
    dropdowns, checkbox groups, date ranges */ }),
  a!pane(width: "AUTO", backgroundColor: /* gray */,
    contents: { /* photo-card grid */ })
})
```
On resize the card grid reflows 3→1 columns while the rail never moves — the DON'T twin's AUTO rail balloons to half the viewport.
2. Evidence + entry (pane_in_form): `a!formLayout` hosting [gray source pane | white form pane] at ≈[1:1], dividers off — the side-by-side verification loop (email left, fields right) beats stacking the source above the form; the fill change alone separates reference from work surface.
3. Progress cluster in the content pane (pane_top_level): gauge with EXTRA_LARGE "$4.5M" + goal "$14.5M" anchor + green AHEAD tag replaces a default row of bordered KPI cards, and a radio toggle swaps two analyses through one chart footprint.

## Top don't
Never invert the width roles (always-severity, both docs DON'Ts): an AUTO control pane balloons to ≈50% of a wide viewport — inputs stretch to ≈770px while cards crush and status banners truncate ("OPEN HOUSE SCHEDUL…") — and a fixed-width content pane strands a ≈40%-wide dead strip on wide monitors. Fixed rail, AUTO content, always.
