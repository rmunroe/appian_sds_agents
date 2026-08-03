# Analysis Conventions (prepended to every analysis task)

These conventions are shared by ALL image analyses. The synthesis stage aggregates hundreds of analyses; it can only do that if every analyst uses identical vocabulary, notation, and evidence discipline.

## Evidence marks

Tag every non-trivial claim with exactly one:

- `OBSERVED` — directly visible in the image pixels (layout structure, text content, counts, relative sizes).
- `INFERRED` — reasoned from context (persona, requirements, data model, intent). Inference is expected and valuable — but must be marked.
- `CODE-VERIFIED` — read from SAIL code on the same page. **When SAIL source exists, palettes and component params MUST be CODE-VERIFIED, never pixel-estimated.** Code overrides pixels on any conflict.

Pixel-estimated colors (no code available) are written like `#4a7c59 (est.)`.

## Density scale (1–5)

- **1 — Marketing-airy**: one idea per screen, huge type, generous negative space. Anchor: conference registration billboard hero.
- **2 — Editorial**: a few content zones, large imagery, breathing room. Anchor: real-estate property list.
- **3 — Balanced product UI**: standard dashboard/record density; multiple zones visible, comfortable padding. Anchor: university student dashboard.
- **4 — Working-tool dense**: many data zones, compact cards, small gaps; built for daily operators. Anchor: insurance agent home page.
- **5 — Trading-desk dense**: maximum information per viewport; grids dominate; minimal chrome. Rare in the corpus.

Always give the number PLUS one line of evidence (items per viewport, visible grid rows, padding class).

## Register vocabulary (pick ≤2 per UI)

`calm-clinical` · `energetic-consumer` · `warm-community` · `authoritative-executive` · `utilitarian-ops` · `premium-editorial` · `playful` · `urgent-triage` · `institutional`

## Skeleton notation

Used identically in analyses, pattern docs, case studies, and validation. Top-to-bottom tree; indent children with `├─`/`└─`.

Tokens:
`HEADER-CONTENT` (a!headerContentLayout) · `BILLBOARD h≈<px> overlay=<pos/style>` · `PANE[left|center|right]` · `COLUMNS [a:b:c]` (width ratio; use SAIL width words if known, e.g. `[NARROW:AUTO]`) · `CARD(<content>, <notable styling>)` · `SECTION "<label or none>"` · `GRID(<n>-col | <n> rows visible)` · `KPI-ROW ×n` · `SBS` (side-by-side) · `TABS ×n` · `WIZARD-STEP n/m` · `FORM` · `BOX` · `EVENT-FEED` · `CHART(<type>)`

Example:
```
HEADER-CONTENT
├─ BILLBOARD h≈240 overlay=full,dark content=title+search
├─ KPI-ROW ×4 style=minimal,no-borders
└─ COLUMNS [2:1]
   ├─ CARD(CHART(line), custom-colors)
   └─ CARD(EVENT-FEED)
```

## SAIL size ladder (typography observations)

`SMALL` · `STANDARD` · `MEDIUM` · `MEDIUM_PLUS` · `LARGE` · `LARGE_PLUS` · `EXTRA_LARGE`
Map observed text sizes onto this ladder (e.g., "page title ≈ LARGE, section headers ≈ MEDIUM, KPI numbers ≈ EXTRA_LARGE").

## Style discipline

- Write `none` rather than omitting a field.
- Concrete over vague: never "clean", "modern", "nice" without the specific choice that produces the effect.
- Every color mention = hex (or `(est.)` hex). Every size mention = ladder token. Every spacing mention = SAIL value when inferable (`marginBelow: "STANDARD"`, `padding: "LESS"`, etc.).
- File paths for images are relative to `corpus/images/`.
