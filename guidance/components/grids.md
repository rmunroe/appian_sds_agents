# Grids (a!gridField / a!gridLayout)

Tabular data built for scanning: concise values, one consistent format and image size per column. Reach for `a!gridField` for read-only lists, `a!gridLayout` for row editing. NOT for prose or unscaled photos — the docs DON'T shows one row ballooning to ~5x height from a marketing paragraph; long text belongs in record views.

## Variants
Official styling vocabulary from the SDS grids page:
- **spacing** `STANDARD` (default) | `DENSE` — DENSE cuts row height to ~2/3 for long lists; costs readability for casual readers.
- **borderStyle** `STANDARD` | `LIGHT` — LIGHT drops the outer border + vertical dividers, leaving hairline row rules #e5e5e5 (est.); for simple grids embedded in busy layouts.
- **shadeAlternateRows: true** — zebra #f5f5f5 (est.) helps the eye track rows on wide grids; skip when only a few rows.
- **selectionStyle** `ROW_HIGHLIGHT` (read-only rows only; selection renders a solid steel-blue #31618f (est.) full-row band) | `CHECKBOX` (required whenever cells contain links, inputs, or record actions).
- **Column widths** (read-only): `AUTO` default — content-driven, try first | fixed `ICON`/`NARROW`/`WIDE` — spreadsheet constancy, horizontal scroll auto-enables on overflow; safest across mixed devices | relative `1X`…`10X` — only for one dominant screen size (on phone the docs example fractures headers: "Star t Dat e"). Editable grids have no AUTO; default `DISTRIBUTE` equalizes widths and clips long inputs — set explicit weights (e.g. 2:5:1).
- **Record actions**: one `a!recordActionField(style: "ICON")` in an `ICON`-width trailing column for the single hot action; several actions → toolbar above a record-backed grid (`actionsDisplay: "TOOLBAR"` + checkbox selection). Never stack two links in one cell.

Page-rollup defaults for read-only grids: STANDARD spacing + border, AUTO widths, logical `initialSorts`, record-type data source (free search box + user filters), `END` alignment on quantitative columns. Editable grids: all-left alignment, explicit widths.

## Styling hooks
- `a!gridColumn(align:)` — `END` for amounts/measures/percentages (cross-row comparison); first column always START; every editable cell START; header alignment matches its column.
- `a!gridColumn(backgroundColor:)` — one tinted band (docs demo: pale blue #ddeefb est. on Amount) or conditional per-cell color for heatmaps; several tinted columns cancel each other out.
- `initialSorts: a!sortInfo(field: ..., ascending: ...)` — most important rows first.
- Color economy (always-severity): at most 2 non-neutral colors per grid; color marks exceptions — a pale-red "Overdue" tag (bg #f8e1e4, text #c5313e, est.) on 2 of 8 rows — never decoration, and never text-color-only meaning.
- Tags: an every-row tag column uses a small muted-pastel set (#ded8ec, #ddeeea, #f7ddc4, #d9d9d9, est.); better, tag only the value users scan for: `a!tagField(tags: if(fv!row.status = "Active", a!tagItem(...), null))`.
- `height` (fixed): only when the header must stay visible amid other components — see Top don't.

## Idioms
1. Status icon + label (grid_column_status_with_icon): semantic color on terminal states only.
```
a!richTextDisplayField(value: {
  a!richTextIcon(icon: "check", color: "#43a047" /* est.; Cancelled = red X #cf3130 est. */),
  " Complete"   /* in-flight states keep neutral near-black icons */
})
```
2. Consolidated column (grid_consolidated_columns): `a!richTextItem(style: "STRONG")` primary + `char(10)` + `color: "SECONDARY"` minor line (email · phone); sortField = the primary field; cap cells at 2–3 lines.
3. Empty cells: `if(isnull(fv!row.ext), "–", fv!row.ext)` — a quiet dash aligned with the data, never "N/A"/"Not Applicable" (the longest, heaviest string in the docs DON'T column).

## Top don't
Never combine a fixed `height` with paging, and never fix height when the grid is the page (double_grid_scroll gif): users face nested scrollbars — browser scroll plus an inner grid scroll — and lose orientation between the two contexts. Pick one mechanism: auto height + paging batch (5–10 rows alongside other components, 25–50 for a solo grid), or fixed height + large batch with no pager.
