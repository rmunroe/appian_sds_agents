# Appian Interface Design Guidance (for coding agents)

Text-only distillation of the Appian SAIL Design System — its UX guidance, its 22 component
references, and 18 fully reverse-engineered example UIs with production SAIL. Verified against
**Appian 26.7**. Purpose: given a use-case prompt (persona + domain + task + data), produce an
Appian interface that is structurally correct for the task AND visually distinctive for the user —
never a one-size-fits-all page.

## The protocol (follow in order; do not browse)

1. **Read [use-case-selector.md](use-case-selector.md)** and run both stages:
   Stage 1 (task × data-shape × device → PATTERN + variant), Stage 2 (cadence × temperature →
   RECIPE + density). Write both answers down before opening anything else.
2. **Load exactly the selector's printed reading list.** Hard caps: ≤2 pattern files, ≤2 case
   studies, ≤4 component files, cookbook sections only as needed. Do not read every pattern "for
   context" — breadth is the selector's job.
3. **Emit the Design Brief** (contract below) BEFORE writing any SAIL.
4. **Build**: skeleton first (pattern anatomy in the shared notation), then styling (recipe values),
   then SAIL (cookbook idioms; component files for params). Use realistic sample data, never
   lorem ipsum.
5. **Self-check**: run [anti-patterns.md](anti-patterns.md) → "Top 15 checklist", and the swap test
   from [styling/anti-corporate.md](styling/anti-corporate.md): *could this page ship for a different
   persona's app unchanged? If yes, revise.*

## The Design Brief (mandatory, ~10 lines)

Emit this block, filled, before any SAIL. It is the differentiation forcing function — a build whose
brief is generic will be generic.

```
DESIGN BRIEF
- Use case: <one line>
- Pattern + variant: <e.g. dashboards / operational>   [Stage 1]
- Recipe: <e.g. Ops Control>  ·  Density: <1-5>        [Stage 2]
- Palette (5+ hexes): page <hex>, cards <hex>, brand/accent <hex>, semantic <hex(es)>, text <hex>
- Header treatment: <e.g. flush billboard + KPI masthead / card-in-card band / none>
- Signature moves (≥3, from recipe or anti-corporate menu):
  1. <move — and the SAIL lever that implements it>
  2. <move — lever>
  3. <move — lever>
- Deliberately omitted: <one thing you chose NOT to include, and why>
```

## SAIL truthfulness rules

- Use only functions/params that appear in [components/](components/), [sail/cookbook.md](sail/cookbook.md),
  or a loaded case study. If you can't find a construct in those, you may not use it.
- Root layout: `a!headerContentLayout` (pages), `a!formLayout` (tasks/dialogs), `a!wizardLayout` or
  `choose(local!step)` (multi-step), `a!paneLayout` (split work surfaces) — see
  [core/layout-foundations.md](core/layout-foundations.md).
- Responsive: every desktop design states its phone behavior (`stackWhen`, `a!isPageWidth` swaps) —
  see [core/mobile.md](core/mobile.md).
- Repetition: generate repeated siblings (cards, rows, rails) with `a!forEach` over a local data list —
  never hand-unroll near-identical blocks; wrap the page in `a!localVariables` holding the sample data.
- Theme tokens (ACCENT, POSITIVE, NEGATIVE, SECONDARY, scheme tokens) vs hard hexes: tokens inherit
  site branding; hexes override. Recipes say which to use where. Hexes marked `(est.)` in these docs
  are pixel-sampled renders, safe to use as literal values.

## Map of this directory

| path | what | when to load |
|---|---|---|
| use-case-selector.md | the two-stage decision engine | always, first |
| styling/recipes.md | 9 named aesthetic identities, exact palettes | your recipe section, every build |
| styling/anti-corporate.md | the signature-move menu + minimum-moves rule | always |
| styling/styling-mechanics.md | every SAIL styling lever + legal values | when a lever's exact param is unclear |
| patterns/ (16) | structural anatomies per app pattern | per selector |
| case-studies/ (18) | reverse-engineered examples w/ palettes + SAIL excerpts | 1–2 per selector |
| components/ (22) | per-component variants, hooks, idioms, top don't | ≤4 per selector |
| core/ | philosophy · layout system · mobile | foundations; philosophy on first use |
| sail/cookbook.md | verified SAIL idioms by goal (header-indexed) | sections per signature move |
| sail/sources/ (18 .sail) | full production sources | ONLY when emulating a case study end-to-end |
| anti-patterns.md | the complete don't catalog + Top-15 pre-ship checklist | checklist before finalizing |

Typical load for one build: ~45–60KB. If you are loading more, you are over-reading.

## Provenance

Distilled from https://docs.appian.com/suite/help/26.7/sail/ (81 pages, 656 example images analyzed,
117 SAIL blocks, 18 complete SAIL sources). Internal tooling for building Appian apps; not a
republication of Appian documentation. Some rendered colors depend on site/portal theme config —
these are marked `(est.)` throughout.
