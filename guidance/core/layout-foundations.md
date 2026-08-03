# Layout Foundations

The page-structure system: root layout → page width → columns → heading grammar → density.
Palette-neutral; skeleton notation per pipeline conventions.

## 1. Root layout (pick exactly one; top-level layouts cannot be nested)

| Root | Reach for it when | Built-ins you get |
|---|---|---|
| `a!headerContentLayout` | Any VIEW page: dashboards, home/landing pages, records-like screens. You want a highlighted top zone (welcome banner, title bar, secondary nav) or control of `backgroundColor` / `contentsPadding`. | header slot (billboard/card layouts) + contents; `isHeaderFixed` |
| `a!formLayout` | Collecting data and the form is simple — one topic, no step sequence. | title-bar templates, sticky button footer, auto primary/secondary placement, form-level validations, first-input focus |
| `a!wizardLayout` | The form is complex and its sections are best completed in sequence. | step indicator (horizontal/vertical milestone with step names), `a!wizardStep()` areas, auto Next/Back/Cancel footer |
| `a!paneLayout` | Full-width, full-height screens needing independently scrolling regions — e.g. a persistent filter rail beside results (pane_top_level, ux-pane-layout). | 2–3 `a!pane`s, `showDividers`, per-pane width/background/padding |

Official selection table for complex forms (ux-form-layout): sections sequential → **wizard layout**;
sections independent, any order → **tab layout inside a form**; all sections viewed at once →
**section layouts inside a form**; 2–3 independently scrolling columns → **pane layout inside a form**
(also nestable in headerContentLayout contents). Give control panes a FIXED width — auto-width filter
rails distort across screen sizes (ux-pane-layout DO/DON'T). On record views, prefer the record
header (card/billboard, bleeds to page edges) over hand-building an HCL.
Wizard footer: keep the auto-generated Next/Back/Cancel — the built-ins already reserve the solid
accent for Next/Submit (ux-wizard-layout rollup). Header/background: default White; switch HCL
`backgroundColor` to "TRANSPARENT" (theme canvas) the moment contents live in cards (ux-form-layout
rollup; see §4 card headings).

## 2. Page width (a site-page-level decision)

Vocabulary (ux-page-width): **Narrow** — simple 1–2 column forms where excess whitespace hurts;
**Medium** — the general-purpose compromise; **Wide** — content-packed UIs, capped at 2,000 device-
independent px on ultrawides for consistency; **Full** — uncapped, only for audiences reliably on
very wide displays (DON'T for mixed audiences: stretched content, dead whitespace).

- The chosen width **persists across in-page navigation** (drilling from a record list into a
  record) — so pick the width that serves the page's hungriest content. Evidence
  (ux-example-walkthrough): the same 7-column property list at Narrow shows 6 rows, wraps every
  address to 2 lines, clips the "ADDITIONAL FE…" filter label, and wastes ≈42% of the viewport on
  gutters; at Wide it shows 14 single-line rows with nothing clipped, and the record view's
  billboard bleeds edge to edge.
- Platform constants: phones always render full width regardless of setting; **portals = Full**;
  task-specific start pages = Medium (fixed); Tempo = Medium; embedded interfaces inherit the host
  container's width.
- Audit diagnostics when choosing: clipped labels, wrapped cells, gutter share of viewport.

## 3. Columns system

**Columns vs side-by-side** (ux-columns-and-side-by-side): `a!columnsLayout` is the top-level
organization of a page or section — meaning runs VERTICALLY inside each column, and columns flatten
to a single stack on phones. `a!sideBySideLayout` is fine-grained arrangement of small related
component groups — meaning runs HORIZONTALLY (icon + text, label + value, field pairs). If
comprehension depends on left-to-right adjacency, it must be side-by-side, not columns.

**Depth-2 rule** (walkthrough_columns): top-level columns define zones; nested columns appear only
where small clusters need side-by-side compression (KPI strips, field pairs, rating trios). Nesting
stops at depth 2 — the corpus example never places a nested columnsLayout inside another nested one.

**Width vocabulary** (all corpus-verified on `a!columnLayout` unless noted):
- Automatic: `"AUTO"` — distribute remaining space (default is even auto-distribution).
- Relative: `"1X"`…`"8X"` (2X, 3X, 4X, 5X, 8X observed) — proportional; best when columns expand/
  contract often.
- Fixed words: `"EXTRA_NARROW"`, `"NARROW"`, `"NARROW_PLUS"`, `"MEDIUM"`, `"MEDIUM_PLUS"`,
  `"WIDE"`, `"WIDE_PLUS"` — constant measure at any browser width.
- `"MINIMIZE"` — shrink-to-content, side-by-side items (dates pinned right of titles, icon cells).
- Never make ALL columns fixed (overflow on small screens — ux-columns-layout DON'T); mix fixed
  rails with an AUTO center: "leftmost and rightmost columns fixed, center automatic" is the page's
  own recipe for keeping main content the focus (e.g. fixed side rails around an AUTO calendar).

**Center-with-empty-rails idiom** — the corpus's standard move for stable, readable measure on
view pages:
```
COLUMNS [AUTO(empty) : content : AUTO(empty)]
```
Empty AUTO flanks absorb all resize; the content column keeps a constant width. Variants:
- Reading/thread pages: `[empty : WIDE : empty]` — comment-thread centers a WIDE column ≈46% of
  viewport to cap line length.
- Wizards: `[MEDIUM(rail) : AUTO : WIDE(form) : AUTO]` — the mortgage wizard pins rail and form
  measure; the two empty AUTO columns are deliberate shock absorbers (mortgage_column_widths).
- Quote wizards: `[empty : NARROW_PLUS(stepper) : WIDE(step body) : empty]` (ins-quote-wizard-1/2).
- Hide the empty flanks on small widths: `showWhen: not(a!isPageWidth({"PHONE","TABLET_PORTRAIT"}))`
  (real-estate-property-list, nonprofit dashboard "ghost spacer column").
**Exception**: inside `a!formLayout`, center with `contentsWidth` ("NARROW"/"MEDIUM"/"WIDE") — never
empty columns; the button footer ignores flanking columns and lands misaligned (ux-form-layout DON'T
"Center with contentsWidth, not empty columns").

**Stacking**: `stackWhen` on columnsLayout takes breakpoint lists — `"PHONE"` (default),
`"TABLET_PORTRAIT"`, `"TABLET_LANDSCAPE"`, `"DESKTOP_NARROW"`, `"DESKTOP"`, `"DESKTOP_WIDE"`,
`"NEVER"`. Most corpus pages ship `{"PHONE","TABLET_PORTRAIT"}`; `{"NEVER"}` locks rows that must
stay lateral (a donut + legend row, nonprofit overview). See [mobile.md](mobile.md).

## 4. Content structure — the heading grammar

From content-structure (official pattern) — one consistent system per app:

| Level | Section label size | Heading tag | Label color | Look |
|---|---|---|---|---|
| Primary section heading | **Medium** | **H2** | Standard | plain-case zone lead |
| Secondary section heading | **Small** | **H3** | Secondary | ALL-CAPS sub-group label |

- Page hierarchy above sections (ux-presenting-information-clearly): page title (most prominent
  text, constant — never changes with user selections) → tabs (views of one topic) → primary
  sections → secondary sub-heads. Titles are concise but specific ("Approve Conference Expenses for
  Jane Smith", "Sales Performance by Region"); omit the title when the site page title already says
  it. Provide back links / breadcrumbs for position in a hierarchy.
- **Cards**: put the primary heading ABOVE the card, not inside it — more visible, easier to balance
  card contents. Primary content cards on transparent/tinted page backgrounds: `showShadow: true`,
  `showBorder: false` (border-on-white / shadow-on-tint, never both — ux-box-layout).
- Headings may be omitted when varied visual styling makes zones self-evident — but add hidden
  labels/accessibility text for screen readers (content-structure).
- Use section/box labels and rich text headers (accessible) rather than bare rich-text items;
  heading size and tag decouple — H1 can render LARGE while H2/H3 render SMALL
  (conference-registration-portal, CODE-VERIFIED).

## 5. Density scale 1–5 (from pipeline conventions, with concrete markers)

| # | Name / anchor | Per-viewport markers | Padding & spacing | Charts/media |
|---|---|---|---|---|
| 1 | Marketing-airy — conference home hero | one idea; 0 data zones; hero ≈58%+ of viewport; single CTA | margins "MORE"/"EVEN_MORE"; huge type | EXTRA_TALL billboards; no data charts |
| 2 | Editorial — real-estate property list | ~5 content cards + nav; or ~10–16 content rows; photo ≈60% of card height | card padding "STANDARD"–"MORE"; band margins "MORE"/"EVEN_MORE" | photo billboards SHORT_PLUS–TALL |
| 3 | Balanced product UI — university student dashboard | ~9 zones; 10 list rows + 3 KPIs + 4 checklist items visible | "STANDARD" padding throughout; section gaps ≈ marginBelow "MORE" | charts MEDIUM–TALL; taller when clickable (drill-down targets, ux-charts) |
| 4 | Working-tool dense — insurance agent home | 5 task cards + 35-cell month grid + 3 actions + 2 threads in one viewport; cruise: 6 zones, 12 grid rows, 13-pt line chart | card padding "STANDARD" but container padding "NONE" where lists bear dividers; columns spacing "SPARSE" or "NONE"; metadata at SMALL | charts SHORT/SHORT_PLUS; MICRO sparklines; compact grid rows ≈40px |
| 5 | Trading-desk dense — rare in corpus | grids dominate; maximum rows; minimal chrome | padding "LESS"/"NONE"; no card wrappers | data tables over charts |

State the number plus one line of evidence (items per viewport, visible grid rows, padding class)
whenever you claim a density. Pick density from the persona's cadence (see
[design-philosophy.md](design-philosophy.md) #1): occasional/first-time users → 1–2; weekly
managers → 3; daily operators → 4.
