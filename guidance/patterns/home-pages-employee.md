# Employee Home Pages

Task-first home for internal users who log in daily or weekly — officially "a tailored summary of
tasks, actions, and relevant information … typically the first page a user views on a site."

## When this pattern

Signals that select it:
- Internal, authenticated, recurring audience (daily-operator to weekly); this page opens their session.
- The user must *do* things here — clear tasks, launch actions, resume work — not only read numbers.
- Every zone is a jumping-off point to elsewhere on the site, never a destination.

Method (all corpus examples are legible as this mapping): rank the persona's top 3 tasks, then
allocate task 1 → the widest column, task 2 → the first zone in the F-scan, task 3 → header CTA or
sidebar actions. The official page frames design as two questions: **content curation** (which
personas, which info, which actions) and **information quantity** (how much actually benefits users).

Nearest alternatives:
- [Visitor landing pages](landing-pages-visitor.md) — external first-time public: brand-first,
  1–3 CTAs, density 1–2. If the audience has never logged in, use that instead.
- [Portals](portals.md) — anonymous/consumer outsiders with no user context.
- Dashboards — pure monitoring (KPIs + charts) with no task queue or actions. An employee home
  page *contains* a monitoring strip but adds work surfaces and actions around it.

## Anatomy

Canonical operational form (the donation-campaign manager example; CODE-VERIFIED):

```
HEADER-CONTENT
├─ BILLBOARD h=EXTRA_SHORT marginBelow=NONE          ← optional brand strip (photo only)
├─ CARD(KPI-ROW ×5 via COLUMNS showDividers spacing=SPARSE | 1 SOLID CTA)   ← header slot
└─ COLUMNS [MEDIUM:AUTO:MEDIUM] spacing=SPARSE
   ├─ SECTION alerts → CARD(fixed h=MEDIUM_PLUS, designed empty state)
   │  SECTION tasks  → CARD(padding NONE: 5× link-CARD + see-all CARD)
   ├─ SECTION working grid → CARD(GRID ~15 rows + search/filter/export toolbar)
   └─ SECTION actions → CARD(3× OUTLINE SECONDARY buttons width=FILL)
      SECTION resources → CARD(4× link CARD) · SECTION goals → CARD(GAUGE ×2)
```

Zone-by-zone:
- **Header slot = instrument panel, not a title.** Billboard strip and KPI card fuse via
  `marginBelow:"NONE"`; monitoring costs zero scroll. One shared KPI card with column dividers —
  never five bordered boxes. The page's only SOLID button lives here.
- **Highlights lists** (alerts, tasks): 5–10 items max, sorted/filtered by relevance, **no paging
  controls** — a see-all link escapes to the full list; show only decision-critical fields per item
  (all official rules).
- **Working surface**: the AUTO (widest) column holds the grid/schedule the user actually works.
- **Actions, two tiers** (the two official record-action styles): "call to action" in the header;
  "sidebar" stack in a labeled card — OUTLINE + SECONDARY + width FILL so they scan as a menu, not
  rival CTAs. Present actions with the record action component where records exist.

Above-fold priorities: all KPIs + the CTA + the top of every column. Reading order is an F —
header bar across, then down column tops left to right.

## Variants

- **KPI-header operational** (canonical above) — when actively monitoring business performance is
  task 1 (official rationale for choosing a KPI header). Density 4.
- **Greeting-header agenda** ([insurance agent home](../case-studies/ins-agent-home-page.md)) —
  greeting + date bar replaces KPIs; a hand-built month calendar takes the AUTO center; tasks left,
  actions/conversations right; same `[MEDIUM:AUTO:MEDIUM] spacing=SPARSE`. Single-viewport, no
  scroll. Density 4.
- **Rail + main-info** ([university student dashboard](../case-studies/university-student-dashboard.md);
  also the official "focusing attention" example) — outer `COLUMNS [NARROW_PLUS:AUTO]` puts a
  card-link nav rail beside a tinted canvas; inner `[AUTO:MEDIUM_PLUS] spacing=SPARSE` gives the
  main information "the most visual space" (official), right rail stacks progress/promo/people.
  Density 3.
- **Three-column high-density** (official case-management example; no SAIL — OBSERVED) — fixed :
  variable : fixed columns, measured ≈[1:2.4:0.9]. Verbs (quick-action tiles + activity feed) left;
  cases + tasks grids center, because the grid "can stretch and shrink to fill the space" and is
  "high priority and the main focus" (official); deadline KPIs + due-date calendar right. Balance
  the density with deliberately diverse zone grammars — cards, grids, charts, a calendar (official).
  Density 4.
- **Action-hero low-density** (official brokerage example; no SAIL — OBSERVED) — tall solid-color
  billboard holds a greeting question + exactly 3 action cards; "relevant high-priority actions are
  called out at the top … other timely items and key metrics below" (official). Content splits
  ≈[3:1]: recent-item cards + tabbed queues | metrics rail. For infrequent, light-touch operators.
  Density 2.

Selection: monitoring mandate → KPI header · schedule/calendar is task 1 → agenda or rail ·
high-volume daily operator → three-column · visits weekly or rarer → action-hero.

## Component roster

[header-content-layout](../components/header-content-layout.md) (header slot hosts the instrument
panel) · [card-layout](../components/card-layout.md) (every zone shell; cards-as-links via
a!dynamicLink) · [columns-layout](../components/columns-layout.md) (page grid; KPI dividers) ·
[side-by-side-layout](../components/side-by-side-layout.md) (row grammar; width MINIMIZE pinning) ·
[kpi](../components/kpi.md) · [grids](../components/grids.md) ·
[buttons](../components/buttons.md) + [record-actions](../components/record-actions.md) ·
[tags](../components/tags.md) (status/overdue garnish).

## Layout decisions by data shape

- **KPIs (3–5)**: one shared card, `a!columnsLayout(spacing:"SPARSE", showDividers:true)`; the
  student credits trio is built the same way — not a!kpiField.
- **List items**: cap 5–10 per zone. Item grammar = 2 lines: title STRONG with
  `preventWrapping:true` / SMALL meta with the date right-pinned via `width:"MINIMIZE"`. Five items
  ≈ one card height (≈430px on the campaign example).
- **Grid rows**: an AUTO center column carries ~15 visible rows (campaign example) or ~4–6 rows
  plus a 2×3 card grid (case-management example). Under ~6 items, prefer cards over a grid.
- **Repeating structured rows**: fix side-by-side width ratios (student schedule rows `2X:5X:2X`)
  so values align down the whole page.
- **Empty collections**: keep the zone; fixed height (`height:"MEDIUM_PLUS"`), centered icon +
  short message (`align:"CENTER"`). Never collapse the card — the official rule against layout jump.
- **Density dial**: 2 for light users, 3 balanced (~9 zones), 4 for daily operators (8–11 zones per
  viewport). Add density only when it will "significantly benefit users" (official).

## Mobile behavior

- Corpus examples stack via `stackWhen: PHONE, TABLET_PORTRAIT, TABLET_LANDSCAPE, DESKTOP_NARROW`
  (CODE-VERIFIED on the campaign and agent pages).
- Stack order = column authoring order: tasks → working grid → right-rail actions. Known risk: a
  long center grid pushes actions far down; on the agent page the stacked columns push
  conversations below the fold — order columns by task rank, not aesthetics.
- What adapts: the agent home swaps its month grid for a phone agenda list via
  `if(a!isPageWidth("PHONE"), …)` and hides the header illustration below desktop widths;
  fixed-ratio side-by-side rows crush at phone width — let them stack too.
- What disappears: decorative imagery only. Nothing task-bearing may vanish.

## Top 3 don'ts

1. **Don't overcrowd.** Larger text, more white space, fewer elements read as more approachable
   (official best practice). The boring twin to kill: KPIs as four bordered boxes stacked above a
   full-width paged grid.
2. **Don't let layout jump when data changes.** Cap items per section, set minimum card heights,
   and design the empty state (icon + message at fixed height) instead of hiding the zone
   (official best practice).
3. **Don't give every action a SOLID button.** One SOLID CTA per page; secondary actions are
   OUTLINE/SECONDARY inside a labeled "Actions" card. The corpus failure image: four identical
   solid buttons in a header toolbar, no grouping, no icons.

## Exemplars

| case study | what to steal |
|---|---|
| [ins-agent-home-page](../case-studies/ins-agent-home-page.md) | Single-viewport `[MEDIUM:AUTO:MEDIUM]` composition; shadow-only clickable cards on a tinted canvas; TINY stamp identity language; nested bordered chip for linked records |
| [university-student-dashboard](../case-studies/university-student-dashboard.md) | Card-link nav rail; current-item marker via `decorativeBarPosition:"START"` painted invisible on siblings; fixed `2X:5X:2X` row grammar |
