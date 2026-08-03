# Synthesis Conventions (all guidance-drafting agents)

You are writing files in `guidance/` — the final deliverable. The consumer is a FUTURE CODING AGENT
that has never seen the SDS site or the images. It will read a small subset of these files and must
come away able to produce a concrete, distinctive, correct Appian UI. Write for that reader.

## Non-negotiable rules

1. **Concrete or cite**: every aesthetic claim carries an exact value (hex, SAIL size token, padding
   value, ratio) OR a named example citation ("the insurance agent home page does X"). Banned unless
   followed within the same sentence by a concrete value: "clean", "modern", "nice", "visually
   appealing", "user-friendly", "professional".
2. **Evidence discipline carries over**: prefer CODE-VERIFIED facts from the analyses; keep `(est.)`
   suffixes on pixel-estimated hexes. Do not launder estimates into certainties.
3. **Skeleton notation** (from `pipeline/templates/CONVENTIONS.md`) is the shared layout language —
   use it identically everywhere.
4. **SAIL truthfulness**: only name functions/params that appear in the corpus (page texts, SAIL
   sources, analyses). Never invent SAIL syntax. When unsure a param exists, cite how the corpus
   used it.
5. **Division of labor** (lint-enforced):
   - `patterns/*` = STRUCTURE ONLY. No hex codes. No domain storytelling. Palette-neutral.
   - `case-studies/*` = EXECUTION ONLY. No re-explaining the pattern (one link line instead).
   - `components/*` = reference. When/when-not, variants, styling hooks, idioms, top don't.
6. **Size budgets are hard caps**: components ≤5KB; patterns ≤10KB; case studies ≤15KB; stay under.
7. **Kill the boring twin**: the analyses' "why-not-boring" and "boring-twin" fields are the most
   valuable content — surface these as actionable moves, not commentary.
8. Relative links between guidance files: use plain repo-relative markdown links.

## File schemas

### components/<name>.md (≤5KB)
```markdown
# <Component> (a!<function>)
One-sentence role. When to reach for it; when NOT (name the alternative).
## Variants
Official vocabulary (template/style/size params) — per variant: 1-line look, use-when, produced-by params.
## Styling hooks
The params that change appearance (with legal values); where hexes can go; interactions with theme tokens.
## Idioms
1–3 corpus-proven compositions (compact SAIL sketches, ≤10 lines each, cite source example).
## Top don't
The single highest-severity mistake from the do/don't corpus + why.
```

### patterns/<name>.md (≤10KB)
```markdown
# <Pattern>
## When this pattern
Task/data/device signals that select it; nearest alternatives + when to prefer them.
## Anatomy
Skeleton (notation) of the canonical form; zone-by-zone purpose; above-fold priorities.
## Variants
Named variants with skeleton deltas and selection rules (e.g., dashboards: operational/analytical/executive).
## Component roster
The 4–8 components that build it (link to components/*).
## Layout decisions by data shape
How the skeleton flexes with cardinality/field-count/media (concrete: column ratios, row counts, density 1–5).
## Mobile behavior
Stacking order, what collapses, what disappears.
## Top 3 don'ts
From the tier-C corpus, pattern-specific.
## Exemplars
| case study | what to steal |  (2–5 rows, link to case-studies/*)
```

### case-studies/<name>.md (≤15KB)
```markdown
# <Name>
**Pattern**: link to patterns/<x>.md — one line on which variant.
## Scenario
3 lines: persona (+cadence), domain, the 3 ranked tasks. From the tier-A analysis.
## Data model
The reverse-engineered entities/fields (compact).
## Skeleton
≤15 lines, notation.
## Palette (code-verified unless marked est.)
| role | hex | applied to |
## Signature moves
3–6, each: "Instead of default X → Y, via <SAIL lever>" (from analysis signature moves + why-not-boring).
## Boring twin (what a lazy build would do — avoid this)
2–3 sentences from the analysis.
## Annotated SAIL excerpts
3–6 excerpts, 10–40 lines each, ONLY non-obvious techniques, each with 1–2 line annotation.
Source: guidance/sail/sources/<name>.sail (cite line ranges).
## Skeleton SAIL
Compressed structural skeleton of the page (~50–150 lines): real code with repeated siblings
collapsed to comments like /* ×4 more KPI cards, same shape */.
## Full source
`sail/sources/<name>.sail` — load only if emulating this page end-to-end.
```

## Inputs

Each agent's prompt names its files and the analysis/page/SAIL inputs to read. Read the inputs
FULLY before writing. Where analyses conflict with page text, page text (official guidance) wins
for rules; analyses win for observed specifics.
