# Appian SDS → Coding-Agent Design Guidance

This project converts the [Appian SAIL Design System](https://docs.appian.com/suite/help/latest/sail/home.html)
(SDS) — a UX guidance site written for human designers — into **text-only markdown guidance that
coding agents can use** to produce creative, modern, aesthetically pleasing Appian interfaces matched
to the use case, instead of the boring one-size-fits-all pages Appian apps default to.

The SDS's best knowledge is locked in ~656 example screenshots that humans grok visually. This
project downloaded every one, reverse-engineered the user requirements and design reasoning behind
each, and distilled the results into a guidance corpus a future agent can consume in ~50–60KB per
task. Built against **Appian 26.7** (Aug 2–3, 2026).

## The deliverable: `guidance/`

Point a coding agent at **[guidance/README.md](guidance/README.md)** with a use-case prompt
(persona + domain + task + data). The protocol it follows:

1. **[use-case-selector.md](guidance/use-case-selector.md)** — two independent decisions:
   *structure* (task × data-shape × device → one of 14 patterns + variant) and *aesthetics*
   (user cadence × domain temperature → one of 9 recipes + density stance). This split is what makes
   different use cases produce visibly different, appropriate designs.
2. A capped reading list per selector leaf: pattern anatomy, the recipe (exact code-verified hexes),
   1–2 of the 18 reverse-engineered **case studies**, ≤4 component references, cookbook sections.
3. A mandatory **Design Brief** (pattern, recipe, density, 5 hexes, header treatment, ≥3 signature
   moves, 1 deliberate omission) before any SAIL — the anti-generic forcing function.
4. Self-checks: the **anti-corporate playbook**'s minimum-moves rule + swap test, and the
   **anti-patterns Top-15** pre-ship checklist.

Key files: [styling/recipes.md](guidance/styling/recipes.md) (9 named visual identities with
code-verified palettes), [styling/anti-corporate.md](guidance/styling/anti-corporate.md) (23-move
menu), [sail/cookbook.md](guidance/sail/cookbook.md) (source-verified SAIL idioms),
[core/](guidance/core/) (philosophy, layout system, mobile), and 18 gated full SAIL sources under
[guidance/sail/sources/](guidance/sail/sources/).

## Validation results

Tested per [validation/protocol.md](validation/protocol.md): 5 primary use cases in domains absent
from the corpus (courier dispatch ops, phone-first tool-library catalog, executive surgery KPIs,
museum accession wizard, animal-shelter foster record) + 2 sealed anti-overfit reserves (airline gate
rebooking, city permits portal). Producer agents saw ONLY `guidance/`; a judge blind to the guidance
scored outputs against a sealed answer key.

- **7/7 cases passed** — judge means 4.67–4.92/5; pattern-fit and non-corporate distinctiveness 4.5–5 on every case.
- **Differentiation gates passed** — 5 distinct pattern+recipe combos; the dashboards twin-probe
  (daily ops vs monthly exec) diverged by 2 density points with opposite palettes; swap test
  ("would A's page serve B's user?") NO on all pairs.
- **Transfer confirmed** — both reserves hit their sealed answer keys; the judge found generative
  transfer, not memorization (e.g. a hand-built aircraft seat map with no corpus precedent).
- 0 iteration cycles required. Full reports: [validation/reports/judge-report.md](validation/reports/judge-report.md).

Outstanding: the Layer-4 live-render check on an Appian dev environment (see
[guidance/_meta/build-report.md](guidance/_meta/build-report.md) → "Known risks / pending").

## Repository map

| path | contents |
|---|---|
| `guidance/` | **The deliverable** — self-contained; ship this to agent contexts |
| `corpus/` | Intermediate artifacts: mirrored HTML (81 pages), all 656 images (+GIF frames), faithful page markdown, and 78 vision-analysis files covering every image |
| `pipeline/` | Rebuild tooling: mirror/extract/batch/lint scripts + the analysis & synthesis templates that define all conventions |
| `validation/` | Test protocol, 7 producer outputs, mechanical lint script, judge reports |
| `MAINTAINING.md` | **Continuation playbook** — how future agent sessions update this when the SDS changes |

## How it was built (summary)

Mirror (81 pages, 656 images, 0 failures) → faithful text extraction (117 SAIL blocks; 18 complete
inspiration sources, 12KB–210KB) → tiered vision analysis by ~55 agent batches (full-page UIs got
deep reverse-engineering: persona, implied requirements, data model, layout skeleton, code-verified
palette, "why not boring", "boring twin"; crops got variant rollups; do/don'ts got principle
extraction; GIFs got interaction state-charts) → synthesis into `guidance/` (load-bearing files —
selector, recipes, anti-corporate, README — written by the orchestrator from the full palette
digest) → lints → blind validation. Evidence discipline throughout: `CODE-VERIFIED` (from SAIL
source) > `OBSERVED` (pixels) > `INFERRED`; pixel-estimated hexes carry `(est.)`.

## Provenance & scope

Distilled from Appian's public documentation (docs.appian.com, version 26.7) as **internal tooling
for building Appian applications**. Not a republication of Appian documentation; do not redistribute
`corpus/` or `guidance/sail/sources/` outside that purpose. Rendered colors that depend on
site/portal theme config are marked `(est.)` throughout.
