# Build Report

Built 2026-08-02 → 2026-08-03 from https://docs.appian.com/suite/help/26.7/sail/ ("latest" → 26.7).

## Corpus (intermediate artifacts in corpus/)
- 81/81 pages mirrored (0 failures), converted to faithful markdown (do/don't markers, alt text, 117 SAIL blocks — count matches site-wide grep).
- 656/656 unique images downloaded with dimensions; 51 GIFs frame-extracted (250 frames).
- 18 complete inspiration SAIL sources extracted verbatim (12KB–210KB; 22,671 lines total).
- Vision analysis: 78 analysis files, 656/656 images covered (verified by pipeline/scripts/check_coverage.py). Tiered: full-page UIs deep-reverse-engineered (persona, requirements, data model, skeleton, palette, why-not-boring, boring-twin); component crops as variant rollups; do/don't pairs as principles; GIFs as interaction state charts. Evidence discipline: CODE-VERIFIED (from SAIL) > OBSERVED (pixels) > INFERRED; pixel-estimated hexes marked (est.).

## Deliverable (guidance/)
- README (consumption protocol + Design Brief contract), use-case-selector (two-stage: structure × aesthetics), 9 aesthetic recipes w/ code-verified palettes, anti-corporate playbook (23-move menu + minimum-3 rule), styling-mechanics, 14 patterns (palette-neutral), 23 components, 18 case studies (schema: scenario/data model/skeleton/palette/signature moves/boring twin/annotated excerpts w/ line refs/skeleton SAIL), core ×3 (philosophy/layout/mobile), sail/cookbook (idioms verified against sources), anti-patterns catalog + Top-15 pre-ship checklist, 18 gated .sail sources.
- Size: ~724KB total excl. sources (~1MB sources, gated). Typical per-task agent load: ~50–60KB.
- Pre-flight lint: 0 failures, 1 warning (ins-claim-case-study 19KB > 16KB soft cap — kept; richest record-view exemplar). Link integrity clean; patterns hex-free; every case study reachable from selector/patterns.

## Incidents
- Session usage limit hit twice mid-fan-out (Stage 3 retry wave; Stage 4 wave B), killing 19 agents; all work recovered via disk-state checks + relaunches (batch-46 resumed from partial). Per user direction, parallelism reduced to ≤1–2 agents from Stage 4 completion onward.
- Transient 529 Overloaded killed one agent; relaunch succeeded.
- Manifest note: images shared across pages are analyzed once under a primary page (hub pages deprioritized) with cross-references elsewhere.

## Validation results (2026-08-03)
- **Layer 1 mechanical lints: 7/7 PASS** (Design Briefs complete, recipes/patterns in roster, ≥3 hexes + ≥6 exact styling decisions each, no invented SAIL in code blocks, mobile design where required).
- **Layer 2 differentiation gates: PASS** — 5 distinct pattern+recipe combos across primaries; T1/T3 twin probe diverged (density Δ2, Ops Control greige vs Calm Clinical cool); hue diversity met.
- **Layer 3 judge (blind to guidance): 5/5 primaries PASS** — means 4.67–4.92, pattern-fit 5 and non-corporate 5 on every case; swap test 10/10 NO.
- **Sealed reserves: TRANSFER CONFIRMED** — R1 4.83 (hit the sealed key exactly: worklist + Ops Control d4), R2 4.83 (portals + Institutional Blue). Judge found no overfit: novel domains, palette logic followed rather than copied, one structure (aircraft seat map) with zero corpus precedent.
- Iteration cycles needed: 0. Two guidance patches applied from judge weaknesses (a!forEach rule in README; typed scalar inputs incl. date fields in components/inputs.md).

## Known risks / pending
- **Layer-4 live rendering NOT yet run** — requires the Appian Dev MCP (.mcp.json needs a session restart to connect) or front-end access. Until then, a short list of corpus-derived params remains render-unverified in producer outputs, most notably `a!fileUploadField(placeholder:)` (from the SDS ux-inputs DO example; the visual is authentic, the param name is unconfirmed), `"#fff"` 3-digit hex acceptance, and judge-flagged spots (one sub-AA contrast pair in R2, a seat-selection carryover bug in R1). These are output-level nits; none block guidance use.
- Producer outputs in validation/outputs/ are validation artifacts, not exemplars — do not fold them into guidance/.
