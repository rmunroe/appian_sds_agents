# Lists & Grids

Sets of same-shaped records displayed to browse, triage, compare, or drill in. Covers read-only and editable grids, card lists, stacked row lists, feeds, list-detail, and the empty state.

## When this pattern

Choose it when the page's subject is a **set** of homogeneous records. Nearest alternatives: a dashboard (aggregates and charts — "how are we doing", not "which item"); a record view (one record's detail); [kanban](kanban.md) when moving items between workflow stages is the core loop; [calendar](calendar.md) when date distribution organizes the items.

**Grid vs card list vs feed — decide on four axes:**

| axis | read-only grid | card list | feed |
|---|---|---|---|
| data shape | 5+ comparable scalar fields (numbers, dates, short text) per row | ≤4 fields plus one strong identity field | time-ordered events; sentence-shaped payloads |
| media | none, or uniform thumbnails at most | a photo/avatar is how users recognize the item | initials/icon stamps only |
| row actions | sort, filter, search, export, bulk select; drill-in link column | whole-card link plus one create action | read-only, or one link per item |
| reading mode | scan and compare values down aligned columns | browse and recognize | monitor recency; unread first |

Tie-breakers:
- Widget inside a larger page, ≤5 visible rows → **stacked row list** capped with a centered "See All (N)" link (the official highlights-list rule), never a paged grid.
- Users read items in place in a loop (message triage) → **list-detail panes**, not a grid that navigates away.
- Zero rows is a real state → design the **empty state** (variant 9); an empty grid header row reads as broken.

**Read-only vs editable grid** (the second load-bearing split):

| | read-only `a!gridField` | editable `a!gridLayout` |
|---|---|---|
| job | display, navigation, analysis | rapid in-place entry of repeating rows |
| widths | `"AUTO"` (list-style) or fixed (spreadsheet-style) | no AUTO — default `DISTRIBUTE` equal-splits; set explicit weights sized to expected content |
| alignment | `align:"END"` on numeric/date columns | all columns left-aligned (they are inputs) |
| extras | record-type source adds search, filters, export, refresh via configuration | drag-handle row reordering when order is a saved field; paragraph cells `height:"SHORT"` |
| links | identity column is the record link | never put navigation links in editable cells — row-select, field-edit, and navigate become competing targets |

## Anatomy

Canonical full-page record list (read-only grid):

```
HEADER-CONTENT
├─ header band: glyph + set title (≈LARGE_PLUS)
├─ CONTROL BAR: [search ≈27%] [FILTER-A ▾] [FILTER-B ▾] [icon utilities: export·filter·refresh]
└─ GRID(5–7-col × 10–16 rows) + footer count "N items"
```

- Header names the set in one line.
- Control bar: one ≈44px band, auto-arranged by records-powered configuration — search leads, named filters next, icon-only utilities cluster right; labels render as caps SMALL *inside* the controls so the bar stays one row.
- Grid keeps ≈90% of the viewport. Identity column leftmost (≈27% width) carries the only links — link the human-readable name, never a raw ID. Count footer is the whole summary chrome.
- Above the fold: control bar + a full page of rows.

Card-list page swaps the grid zone:

```
COLUMNS [NARROW:AUTO]
├─ sub-nav: SECTION label + BUTTON(create, SOLID) + link-list ×3–5
└─ GRID(3-col) of CARD(padding NONE → BILLBOARD h=SHORT_PLUS + overlay tag / value+age SBS / meta / location)
```

The page's one SOLID button is the create action. Status tags ride the photos via `a!fullOverlay(alignVertical:"TOP")`, so triage happens in the same scan as recognition — not in a separate status column.

## Variants

1. **List-style grid** (fits page width, no h-scroll): every column `width:"AUTO"` (or weighted, e.g. `"3X"`); widths track content — long date columns wide, 2-digit qty columns narrow. For record lists whose job is drill-in.
2. **Spreadsheet-style grid** (analysis, many columns): fixed widths `"NARROW"`/`"MEDIUM"` sized to max(header label, typical value); overflow scrolls horizontally — a clipped right column honestly advertises more data. Never AUTO/weighted here.
3. **Records-powered controls**: `a!gridField` on a record-type source with search, user filters, export, refresh enabled by configuration — always consider before building custom controls.
4. **Editable grid**: `a!gridLayout` per the table above; entry and order curation.
5. **Photo-card gallery**: 3-col grid of `a!cardLayout(shape:"SEMI_ROUNDED", padding:"NONE", link: a!dynamicLink)` wrapping `a!billboardLayout(height:"SHORT_PLUS")` + overlay `a!tagField` (≤4 semantic tag hues); value metric and aging metric share one `a!sideBySideLayout` row. `a!cardGroupLayout(cardWidth:"NARROW_PLUS")` where flow-wrap beats fixed columns.
6. **Stacked row lists** (widget scale, ≤5 rows + See All). Shared recipe: `a!forEach` over row maps; one pale-fill/saturated-content pair per semantic state; hairline/divider separators, not per-row borders. Sub-variants — **document list**: full-height tinted type-icon cell (`padding:"NONE"` + `spacing:"NONE"`), STRONG filename, size below; **link list**: icon chip + STRONG label, icon/hue swap per action type; **checklist**: status-flagged left cells, THICK progress bar header, status/assignee filters; **task list**: status-grouped ROUNDED cards, paired-color status stamps, kebab `a!recordActionField(style:"MENU_ICON")`, group headings + status filter so users focus without navigating; **contact list**: AVATAR image + `a!headingField` per name (a real heading tree) + aligned channel rows; **notifications/highlights**: unread = decorative START bar + STRONG title, read = ghost bar preserving alignment, bodies truncated with a "More" toggle.
7. **Feed / event history**: *simple* = per-person stamp + one-sentence event + timestamp; system events swap initials for a glyph stamp. *Detailed* = `COLUMNS [EXTRA_NARROW date rail | AUTO]` with `showDividers:true` as timeline spine; two-card calendar chip per day; right-aligned times; per-event mini-table FIELD | OLD VALUE | NEW VALUE from `a!sideBySideLayout` with value items `width:"2X"`.
8. **List-detail (inbox)**: `a!paneLayout` triptych ≈ [1 : 2.5 : 4] — nav rail, scrolling list, reading pane. Selection = filled card against the tinted list pane; unread = `style:"STRONG"` rows + "(n)" count in nav (weight as state, no badges); read in place, never navigate away.
9. **Empty state**: flat filled CARD(height:"EXTRA_TALL"), centered illustration (`a!imageField` + a design constant) + headline naming the state (MEDIUM_PLUS) + subtext naming the next action (STANDARD, secondary), while the persistent create action stays visible in chrome.
10. **Media thumbnail browser**: COLUMNS [NARROW rail | WIDE preview]; `a!imageField(size:"FIT")`; selected thumb card `style:"ACCENT"`; reorder affordances duplicated (per-item arrows + toolbar) because drag is unavailable in SAIL.

## Component roster

- [Grids](../components/grids.md) — `a!gridField` / `a!gridLayout`, `a!gridColumn` widths and alignment
- [Cards](../components/card-layout.md) — `a!cardLayout` rows, tiles, selection states; `a!cardGroupLayout`
- [Billboards](../components/billboard-layout.md) — `a!billboardLayout` + `a!fullOverlay` photo tiles
- [Tags](../components/tags.md) — `a!tagField` status language
- [Panes](../components/pane-layout.md) — `a!paneLayout` list-detail architecture
- [Record actions](../components/record-actions.md) — toolbar vs in-column vs kebab placement
- [Rich text](../components/rich-text.md) — row typography, computed icons, links
- [Images & stamps](../components/images.md) — AVATAR images, `a!stampField` identity/state chips

## Layout decisions by data shape

- **Field count**: ≤4 → cards or stacked rows; 5–7 → list-style grid (7 is near the ceiling); 8+ → spreadsheet-style + horizontal scroll.
- **Cardinality**: ≤5 inside a page → stacked rows + See All; one screenful → grid + count footer; multi-page → records controls + paging; zero → empty state.
- **Media**: photo-identified records → 3-col gallery at density 2; document pages → thumbnail rail + preview [NARROW:WIDE].
- **Density targets**: gallery 2; widget lists 3; working grids and inbox 4 (10–16 single-line rows per viewport; row height ≈48px).
- **Alignment as typography**: numbers and dates `"END"`, text `"START"`, headers follow their column — alignment rails do the scanning work.
- **Color budget**: one hue = the link/drill-in affordance; semantic state adds at most one tag/icon system; all else neutral.

## Mobile behavior

- List-style grids break at phone width: AUTO cells wrap 3–4 lines and rows-per-screen halve (16 → 8). Conditionally switch to fixed widths via `a!isPageWidth` — identity column ≈70% of viewport, accept clipped columns + horizontal swipe. Rows-per-screen is the metric.
- Three-pane list-detail cannot survive tablet portrait — ship a coded non-pane fallback (the corpus inbox branches on `a!isPageWidth` 38 times).
- Card galleries stack to one column; sub-nav columns shed before content. Shorten date formats on phone.

## Top 3 don'ts

1. **Auto/weighted widths on a many-column grid** (or any grid at phone width): every column shrinks to fit, headers wrap to 3 lines, cells to 4, visible rows collapse 10 → 4. Fix the widths and let it scroll sideways.
2. **Hand-built filter stacks above a grid**: a "Filters" card + Apply + separate toolbar costs ~3× the vertical space of the auto-arranged records control bar. Configure first; custom-build only what configuration cannot express.
3. **A zero-row grid as the empty state**: a bare header row over nothing reads as an error. Ship the designed announcement — illustration, state-naming headline, next-step subtext.

## Exemplars

| case study | what to steal |
|---|---|
| [real-estate-property-list](../case-studies/real-estate-property-list.md) | the gallery variant executed: overlay tags on flush-bleed billboard cards; aging metric beside the value metric; single SOLID create button; tinted well lifting white cards |
| [ins-agent-home-page](../case-studies/ins-agent-home-page.md) | worklist card rows: whole-card `a!dynamicLink` targets; exactly one alarm-hue tag on a neutral field; per-row owner stamps |
| [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md) | records-powered grid in a dashboard: toolbar, search, category filter, pager on a 5-col grid |
| [customer-acct-management](../case-studies/customer-acct-management.md) | the no-grid list: stacked `a!sectionLayout`s with caps eyebrow labels + `divider:"BELOW"` as record separators when cardinality is tiny |
