# Calendar

Visual overview of time-based items — events, deadlines, appointments — organized by date, with a month view (grid + detail panel) and a week view (day columns).

## When this pattern

Official guidance: use a calendar when users need to understand **how time-sensitive items are distributed across days** — scheduling workflows, appointment tracking, project milestones, any scenario where the event↔date relationship matters at a glance. Views can stand alone or combine (month + week as a toggle on one page).

View selection (official):
- **Month view** — the full shape of a month at once; overall distribution + navigation across a longer range; supports a detail panel beside the grid for event context without leaving the page.
- **Week view** — one week as columns; shorter window, day-by-day comparison, more detail per day; best for high-level items that need no extra context.

Nearest alternatives:
- **Feed / event history** ([lists-and-grids](lists-and-grids.md)) when the subject is a past audit trail, not forward distribution.
- **[Kanban](kanban.md)** or a task list when work is organized by stage/status rather than by date.
- **Upcoming-items stacked list** when only the next 2–3 dated items matter — a card list beats a mostly-empty grid.

## Anatomy

Month view (canonical form):

```
├─ SBS header: angle-left · month title (LARGE BOLD, H2) · angle-right   [right: WEEK|MONTH toggle]
└─ COLUMNS [WIDE_PLUS:AUTO]   (≈72:28 observed)
   ├─ CARD(month grid: bordered, SEMI_ROUNDED, padding LESS)
   │  ├─ weekday row: SMALL all-caps, secondary
   │  └─ GRID(7-col × 5–6 rows of date CARDs, h=SHORT, DENSE spacing, marginBelow LESS per row)
   └─ PANE[right] selected-day heading (MEDIUM, H3)
      └─ CARD ×n per event: type icon+label row / STRONG title / description (SMALL)
```

- **Header**: the month name is the page's only LARGE text — it orients the time range; prev/next are `a!richTextIcon` links with caption + altText.
- **Grid zone** (~70% width): distribution scan is the primary task. Each date cell is `a!cardLayout(link: a!dynamicLink(saveInto: selected-day local), height:"SHORT", shape:"SEMI_ROUNDED")`; in-cell event lines use `a!richTextDisplayField(preventWrapping:true)` so cell heights stay uniform and rows stay scannable.
- **Detail panel**: a persistent column, not a popover — clicking a date re-renders the panel via the saved local. Selected cell gets `accessibilityText:"Selected"`. Empty day → small centered stamp empty state (calendar icon), not a blank column.
- **Cell state channels** (keep them independent): *today* = translucent fill tint under content; *selected* = accent border; *other-month* = a second neutral fill step. Three neutral surface steps (current month / other month / past) encode month membership and time passage with no legend.
- **Event typing**: two semantic hues (e.g. deadline vs routine event) applied only to tiny icons + labels — identically in grid cells and panel cards, so the panel teaches the grid's code. Whole cells stay quiet.
- **Past items**: panel cards drop their border and take a neutral fill when the datetime is behind now (`showBorder` driven by a datetime comparison) — dimmed below current signal, never hidden or struck through.

Week view:

```
├─ SBS header: week range + prev/next   [right: WEEK|MONTH toggle]
└─ COLUMNS ×7 (spacing NONE, showDividers:true)
   └─ per day: bold centered day header + stacked event chips
      └─ CARD(tinted, showBorder:false, SEMI_ROUNDED, padding EVEN_LESS): icon + STRONG title + time
```

Event chips tint their background from the event's own hue via an alpha suffix (`concat(color, "1a")`); past events fall back to a neutral fill. If users need more event context, surface it **outside** the columns (official rule) — the week view has no detail panel.

## Variants

- **Month + detail panel** (default): range navigation and distribution scanning with in-page context.
- **Week view**: short-window comparison; reuses the same event data maps and type→hue coding as month view — single-sourced semantics.
- **Month + week toggle on one page**: the WEEK|MONTH control is observed in renders and implied by official guidance ("toggle options on the same page"); the sample source ships the views separately, so wire the toggle as page state yourself.
- **Mini month embedded in a dashboard**: a hand-built 7-col month grid (dividers as cell borders, fixed-height transparent day cards, shape-coded per-day markers) plus a "go to full calendar" link — see the insurance agent home page exemplar.

## Component roster

- [Cards](../components/card-layout.md) — `a!cardLayout` as date cell (link, SHORT height), event chip, panel card, grid wrapper
- [Columns](../components/columns-layout.md) — `a!columnsLayout` [WIDE_PLUS:AUTO] split; 7-col week with `spacing:"NONE"`, `showDividers:true`
- [Rich text](../components/rich-text.md) — `a!richTextDisplayField(preventWrapping)`, semantic `a!richTextIcon`s, `char(10)` stacked event lines, prev/next links
- [Side-by-side](../components/side-by-side-layout.md) — `a!sideBySideLayout(spacing:"SPARSE", alignVertical:"MIDDLE")` header row
- [Headings](../components/section-layout.md) — `a!headingField(headingTag:"H2"/"H3")` month title and day header
- [Images & stamps](../components/images.md) — `a!stampField` empty-day state

## Layout decisions by data shape

- **Events per day**: cells hold 1–3 one-line entries (preventWrapping truncates); overflow reads in the detail panel — never grow cell heights, uniformity is what makes the grid scannable. Truncated cell titles have no tooltip, so keep in-cell text to time + short title.
- **Event types**: ≤2–3 semantic hues, carried by icon + label pairs (color never the only channel); pipe each type's hue through the event data map so grid, panel, and week chips stay single-sourced.
- **Time depth**: month = 42 cells × SHORT height at DENSE spacing (density 3 overall); week = 7 columns with taller stacks and more per-day detail; a single day's depth always lives in the panel, not the grid.
- **Sparse data**: if most cells are empty, drop to the upcoming-items stacked list; a calendar earns its space only when distribution matters.
- **Ratios**: grid:panel ≈72:28 (`WIDE_PLUS:AUTO`); weekday header row SMALL all-caps; date numerals STANDARD (STRONG only for today).

## Mobile behavior

A 7-column month grid does not stack meaningfully — the pattern is desktop-oriented, and the corpus sample ships no phone branch. Corpus precedent for narrow widths: swap the whole grid for a **phone agenda list** via `if(a!isPageWidth("PHONE"), agenda, grid)` — a date-grouped stacked list of the same events (the insurance agent home page ships exactly this swap, plus a duplicated medium-width grid block gated by `showWhen`). The detail panel's content folds into the agenda rows; week view similarly degrades to a per-day list.

## Top 3 don'ts

1. **Don't open a modal per day.** The boring twin's move. A persistent detail column updated by `a!dynamicLink` saveInto keeps day context on the page and the grid still visible for the next click.
2. **Don't color whole day cells by event type.** Type hues belong on the small in-cell icons only; whole-cell fills are reserved for the today/other-month state channels. Solid event-colored cells turn 42 cells into noise.
3. **Don't hide or strike past items.** De-border + neutral-fill them (datetime-driven `showBorder`) so history stays legible one layer below current signal; a "past = deleted" calendar destroys trust in the record.

## Exemplars

| case study | what to steal |
|---|---|
| [ins-agent-home-page](../case-studies/ins-agent-home-page.md) | hand-built month grid inside a dashboard: 7-col `a!columnsLayout(spacing:"NONE", showDividers:true)`, fixed-height transparent day cards, shape-coded per-day markers, and the `a!isPageWidth` phone-agenda swap |
| [university-student-dashboard](../case-studies/university-student-dashboard.md) | the week-as-day-cards schedule with the current day flagged by weight/accent — a lighter structure when one week is the whole story |
| [my-health-site](../case-studies/my-health-site.md) | the upcoming-items alternative: next few dated items as stacked cards with a request action, no grid at all |
