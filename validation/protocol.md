# Validation Protocol

Tests whether `guidance/` alone lets a fresh coding agent turn a novel use case into an appropriate,
differentiated, aesthetically pleasing Appian UI. Producer agents see ONLY `guidance/` + their prompt.
The judge sees outputs + answer key + rubric — NOT the guidance corpus.

## Producer task (given to each producer agent)

> You are building an Appian interface. You know nothing about Appian UX beyond the guidance
> documentation at `guidance/`. Read `guidance/README.md` first and follow its protocol exactly.
> Deliverable, written to `validation/outputs/<case-id>.md`:
> 1. Your Design Brief (per the README contract)
> 2. A layout skeleton in the guidance's notation
> 3. Complete SAIL for the page (a!headerContentLayout or a!formLayout root, as appropriate)
> Use realistic hardcoded sample data. Do not invent components not present in the guidance.

## Primary test cases

- **T1 — courier-dispatch**: "Dispatch supervisor at a regional courier company monitors ~200 active
  deliveries across the metro area. She needs to triage exceptions (late, failed, rerouted), see driver
  status, and track today's throughput. Desktop, used all day, every day."
- **T2 — tool-library**: "A neighborhood tool-lending library wants a public page where residents browse
  the catalog (photos, availability, categories) and reserve tools. Phone-first; most visitors are
  first-timers."
- **T3 — surgery-kpis**: "The chief of surgery reviews quarterly operating-room utilization, case volume,
  and staffing KPIs in a monthly leadership meeting. Aggregates and trends only, no row-level data.
  Desktop and tablet."
- **T4 — museum-accession**: "A museum registrar accessions a newly acquired artifact: a multi-step
  intake capturing object details, provenance history, condition assessment with photos, and storage
  assignment. Staff use it a few times a month. Desktop."
- **T5 — foster-record**: "An animal-shelter coordinator manages a foster placement: the animal's
  details and status, tasks to complete, a comment thread with the foster family, and a history of
  events. Used on desktop and phone."

## Sealed reserves (do NOT open until primaries pass; anti-overfit transfer check)

See `validation/reserves.md` — not to be read by anyone (including the orchestrator beyond initial
authoring) until the primary suite passes.

## Answer key (judge only)

| case | expected pattern | acceptable alternates | expected recipe family (actual roster) | density | must-have |
|---|---|---|---|---|---|
| T1 | dashboards/operational | none | Ops Control or Dark Command | 4–5 | status color system, exception triage zone above fold |
| T2 | shopping-journey or landing-pages-visitor | lists-and-grids (card list) | Dark Editorial, Energetic Consumer, or Premium Editorial (warm/consumer register) | 1–2 | a!isPageWidth or stacking design, photo-forward cards |
| T3 | dashboards/executive | dashboards/analytical w/ rationale | Executive Clarity or Calm Clinical | 1–2 | ≤6 oversized KPIs, trend charts, NO dense grid |
| T4 | forms/wizard | multi-section form w/ rationale | Premium Editorial, Institutional Blue, or Calm Clinical | 2–3 | wizard steps or milestone, progressive disclosure |
| T5 | record-views | none | Ops Control (warm) or Calm Clinical | 3–4 | header summary + tabs/sections, comment thread, event history |

*(Recipe names updated 2026-08-03 to the shipped roster in guidance/styling/recipes.md — the original
key predated recipe authoring and used hypothesized names; intent unchanged.)*

Differentiation expectation: T1 vs T3 are the twin probe — same pattern family, outputs must diverge
hard (density Δ≥2, different opening zone, different palette temperature).

## Grading layers

### Layer 1 — mechanical lints (scripted: `validation/lint_outputs.py`)
- Design Brief present, schema-complete (pattern+variant, recipe, density 1–5, 5 hexes, header
  treatment, 3 signature moves, 1 deliberate omission).
- Pattern name ∈ guidance/patterns/*, recipe ∈ recipes.md roster.
- ≥3 distinct hexes in the SAIL; ≥6 exact styling decisions total (hex, size token, padding, ratio).
- Every `a!function(` name ∈ the components roster (catches invented SAIL).
- T2: contains `a!isPageWidth` or explicit mobile stacking design.
- Vague-phrase flag: "clean", "modern", "user-friendly", "visually appealing" not within 2 lines of a
  concrete value.

### Layer 2 — differentiation gates (across all 5 outputs)
- No two outputs share pattern+recipe.
- ≥4 distinct primary hues (pairwise hue angle >30°).
- T1 vs T3: density Δ≥2, non-isomorphic skeletons (different opening zone type, different column
  structure).
- Judge swap test: "Would output A be acceptable for prompt B's user?" — must be NO for ≥8 of 10
  ordered pairs.

### Layer 3 — judge rubric (anchored 1–5 per output)
1. **Pattern fit** vs answer key (5 = expected; 4 = defensible alternate w/ stated rationale; ≤2 wrong family)
2. **Layout coherence** (hierarchy matches the prompt's top tasks)
3. **Aesthetic concreteness** (5 = developer could build pixel-faithfully; 1 = adjectives)
4. **Register fit** (mood matches persona/domain)
5. **Non-corporate distinctiveness** (1 = default cards + bare labels; 3 = pleasant vendor demo;
   5 = distinct personality, ≥3 signature moves, appropriate to domain)
6. **SAIL plausibility** (structure, params, realistic values)

### Layer 4 — live rendering check (Appian dev environment, if MCP/front-end available)
- Deploy each output's SAIL to the connected Appian dev instance; confirm it evaluates without errors.
- Screenshot desktop (and phone width for T2/T5); visually compare against the Design Brief: does the
  rendered page deliver the declared palette, density, and signature moves?
- Fix-forward: SAIL syntax errors found here feed back into guidance/sail/cookbook.md (missing idiom)
  or components/*.md (wrong param), then re-run the failing producer once.

## Pass criteria
- Per case: all L1 lints pass AND pattern fit ≥4 AND non-corporate ≥4 AND rubric mean ≥3.5.
- Suite: ≥4/5 primaries pass AND all L2 gates pass → open reserves, run once each; both must score
  rubric mean ≥3.5 (transfer confirmed). If primaries pass but reserves fail → guidance overfitted:
  return to synthesis, not the selector.

## Iteration loop (max 3 cycles, then human review)

| Symptom | Root cause | Fix location | Re-run |
|---|---|---|---|
| Wrong pattern chosen | Selector Stage-1 gap | use-case-selector.md row/disambiguator | failing case |
| Right pattern, generic look | Recipe thin / Stage-2 mis-map | recipes.md / selector Stage 2 | failing + T1/T3 |
| Vague despite recipe | Mechanics gap | styling-mechanics.md / cookbook.md | failing case |
| Invented SAIL | Component doc gap | that components/*.md | failing case |
| Protocol ignored | README unclear | README.md | all 5 |
| Guidance lacked the fact | Upstream analysis gap | targeted re-analysis via _meta/provenance.json | failing case |

Always also re-run 1 previously passing case as regression.
