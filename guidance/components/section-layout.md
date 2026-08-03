# Section Layout (a!sectionLayout)

Visually groups related parts of a page under an optional heading — the SDS's structure-by-typography tool. Reach for it to name content zones; NOT for arranging content side-by-side ([Columns Layout](columns-layout.md)), micro-spacing small groups ([Side by Side Layout](side-by-side-layout.md)), or show/hide controls (use links + `showWhen`).

## Variants

- **Labeled section (default)** — heading + "Standard" margin below to separate it from following content. Headings describe what the content IS.
- **Graded label ladder** — the same component with `labelSize`/`labelColor` stepped per nesting level (Idiom 1); the corpus's signature use: hierarchy legible from grades alone, no rules, boxes, or indentation.
- **Collapsible** — `isCollapsible` (+ `isInitiallyCollapsed`). Collapsible sections add clutter and cognitive load; use only when users skip straight to a known section, never for forms filled top-to-bottom. Collapse behavior must be uniform across siblings: chevrons push collapsible heading text right, so mixing collapsible and fixed sections produces a ragged left edge and an unpredictable affordance (all `isCollapsible: true`, or all false).

## Styling hooks

- `label`, `labelSize` (SAIL size ladder), `labelColor` (accent / secondary / hex) — param names INFERRED, no SAIL on page. Observed grades: section headings blue #1b6eac (est.) at ≈MEDIUM_PLUS bold; sub-heads #707070 (est.) MEDIUM regular.
- `marginBelow: "STANDARD"` between sections; a hairline `divider: "BELOW"` appears under the MEDIUM ACCENT "Summary" heading of the employee-request dashboard.
- Boxes are optional, not default: the property record groups ~45 attributes into three scannable zones using heading color+size alone — no borders anywhere. Reserve card chrome for content that needs it (its photo comp cards, not its field lists).

## Idioms

1. Three-grade label system (property record + Profile DO): page title ≈LARGE bold #222222 → `a!sectionLayout` label ≈MEDIUM bold accent blue #3d6fa6 (est.) → sub-head rich text MEDIUM regular gray #767676 (est.) → STANDARD bold sub-group labels over values. Four type grades = four nesting levels, zero indentation.
2. Section owning a columns row (property record): `a!sectionLayout` → `a!columnsLayout` [1:1:1] (Interior / Exterior / Location Details) — one blue heading names the zone, columns split its content, whitespace does the grouping.
3. Filter toggle done right (DO): a plain link ("Show advanced settings" / "Hide filters", #085e9f (est.)) + `showWhen:` on the control block — `a!richTextItem` link instead of `a!sectionLayout(label: "Filters", isCollapsible: true)`.

## Top don't

Don't dress controls as structure. The DON'T puts four filter dropdowns inside a collapsible section labeled "Filters" (blue heading + chevron) — a control panel masquerading as content hierarchy, adding clutter and a false grouping. Links perform show/hide; section headings are reserved for the content structure of the page.
