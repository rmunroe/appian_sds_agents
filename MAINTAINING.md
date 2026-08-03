# Maintaining This Project (playbook for future coding-agent sessions)

Audience: a coding agent (or human) continuing this work — fixing guidance, running the pending
live-render check, or updating everything when Appian ships a new SDS version. Read
[README.md](README.md) first for what this is; read this file before changing anything.

## 0. Session ground rules (learned the hard way)

- **Parallelism: ≤1–2 concurrent subagents.** Waves of 9–18 agents exhausted the user's 5-hour usage
  window twice mid-build, killing agents mid-write. Sequential-ish execution finished the whole
  validation stage without incident. Prefer inline work when the context is already loaded.
- Agents killed mid-run usually wrote most of their output first — on any failure, **check disk state
  before relaunching** (`ls -la` the target dir; `tail` files for clean endings) and resume rather
  than redo.
- Transient `529 Overloaded` errors happen; back off a few minutes and retry once — don't hammer.
- The shell is zsh: unquoted `$var` word-splitting does NOT happen; write loops accordingly (or use
  `xargs`/python). A zoxide config warning pollutes stderr on every command — harmless, ignore it.
- Vision-analysis agents must `Read` images (they render visually); GIF frames extracted to
  `corpus/images/frames/` are often delta-encoded and near-blank — agents should read `f0` plus
  neighbors, or re-coalesce from the source `.gif` with ImageMagick when needed.

## 1. Architecture invariants (do not break these)

The system's value lives in a few contracts. Change content freely; change contracts only with the user.

1. **Two-stage selector** ([guidance/use-case-selector.md](guidance/use-case-selector.md)):
   structure (pattern) and aesthetics (recipe) are independent decisions. Every selector leaf prints
   a capped reading list (≤2 case studies, ≤4 components).
2. **Design Brief contract** (defined in [guidance/README.md](guidance/README.md)): pattern+variant,
   recipe, density 1–5, 5 hexes, header treatment, ≥3 signature moves, 1 deliberate omission —
   emitted before SAIL. Validation lints parse it (`validation/lint_outputs.py`); if you change the
   contract, change the lints in the same commit.
3. **Division of labor** (lint-enforced by `pipeline/scripts/lint_guidance.py`): patterns/ =
   structure only, hex-free; case-studies/ = execution only, no pattern re-explanations;
   components/ = reference. Size caps: components ≤5KB, patterns ≤10KB, case studies ≤15KB.
4. **Evidence marks**: `CODE-VERIFIED` > `OBSERVED` > `INFERRED`; `(est.)` on pixel-sampled hexes.
   Never launder an estimate into a certainty. Recipes may only assert hexes traceable to
   code-verified case-study palettes (or explicitly marked est. theme renders).
5. **SAIL truthfulness**: guidance may only teach constructs evidenced in the corpus (page texts,
   sources, analyses). Producers are told to refuse anything else — that refusal is a feature.
6. **Shared vocabulary** lives in `pipeline/templates/CONVENTIONS.md` (skeleton notation, density
   anchors, register tags, size ladder) — analyses, guidance, and validation all speak it; keep them aligned.

## 2. Pipeline reference

All scripts run from repo root with `python3` (stdlib only; `magick` used for images).

| script | does | outputs |
|---|---|---|
| `pipeline/scripts/mirror.py` | downloads all pages + `ds-images/*`, extracts GIF frames, builds the manifest (per-image alt/marker/nearest-heading/dimensions/primary-page) | `corpus/html/`, `corpus/images/`, `corpus/manifest.json` |
| `pipeline/scripts/extract.py` | HTML→faithful markdown (do/don't annotations, SAIL fences; skips rouge line-number `<pre>` twins); exports inspiration SAIL verbatim; fixes manifest SAIL counts | `corpus/pages/*.md`, `guidance/sail/sources/*.sail` |
| `pipeline/scripts/batch_plan.py` | groups pages into analysis batches (~≤18 images each; big pages solo), emits per-batch instruction files | `pipeline/batches/batch-NN.md`, `plan.json` |
| `pipeline/scripts/check_coverage.py` | verifies every manifest image is analyzed or skip-flagged | exit 0/1 |
| `pipeline/scripts/lint_guidance.py` | deliverable pre-flight: presence, size budgets, link integrity, hex-free patterns, vague-phrase scan, exemplar reachability | exit 0/1 |
| `validation/lint_outputs.py` | Layer-1/2 checks on producer outputs (brief schema, rosters, hex counts, SAIL-function attestation vs guidance, differentiation gates) | exit 0/1 |

Analysis/synthesis conventions: `pipeline/templates/{CONVENTIONS,tier-a-template,tier-bcg-template,SYNTHESIS}.md`.
Traceability: `guidance/_meta/provenance.json` maps every guidance file → its corpus inputs.
Build history + known risks: `guidance/_meta/build-report.md`.

## 3. Updating for a new SDS version (e.g. 26.8+)

The SDS pins under `https://docs.appian.com/suite/help/<version>/sail/`; `latest` redirects to the
current version. Everything below is incremental — only changed content gets re-analyzed.

1. **Detect**: `curl -sIL .../latest/sail/home.html` → read the final URL's version. If unchanged, stop.
2. **Archive**: copy `corpus/manifest.json` → `corpus/manifest-<oldversion>.json`; snapshot
   `corpus/pages/` (e.g. `git commit` or a tar) so you can diff.
3. **Re-mirror**: update `BASE` in `mirror.py` (and `version` stamp). The hardcoded `PAGES` dict must
   be re-verified: fetch the 6 hub pages (`home, components, guidance, inspiration, introduction,
   sail-design-system-overview`), extract `/sail/*.html` hrefs, diff against the dict; add/remove
   pages (keep the dedupe — `ux-pane-layout` historically appears under two sections). Run `mirror.py`
   then `extract.py`.
4. **Diff to a work-list**:
   - pages: `diff -rq` old vs new `corpus/pages/` → changed/new/deleted page list;
   - images: compare manifests on filename + bytes + dimensions → new/changed/removed images.
5. **Re-analyze only the work-list**: regenerate batches (`batch_plan.py` rewrites all batch files —
   that's fine; only LAUNCH agents for batches containing changed pages, ≤2 at a time, using the same
   agent prompt shape as before: "Execute the image-analysis batch specified in
   pipeline/batches/batch-NN.md…"). Existing analyses for untouched pages remain valid.
   Run `check_coverage.py` after.
6. **Propagate to guidance**: invert `provenance.json` — every guidance file whose inputs changed
   gets re-synthesized (subagent with `SYNTHESIS.md` + the file's schema section, same prompts as the
   build; see build-report for who wrote what). If a NEW inspiration example appeared: new case study
   + add it to a recipe's citation list + selector reading-list map + a pattern exemplar table. If a
   new component page appeared: new components/ file + pattern rosters. The four load-bearing files
   (README, selector, recipes, anti-corporate) should be edited surgically, not regenerated.
7. **Update version stamps**: `guidance/README.md` ("Verified against"), `_meta/build-report.md` (append a dated section).
8. **Lint + re-validate**: `lint_guidance.py` must pass. Then re-run validation producers for
   affected scope — selector/recipes changed → all 5 primaries; one pattern/case-study changed → the
   1–2 cases touching it (+1 unchanged case as regression). **The old reserves (R1/R2) are now
   unsealed/burned** — if you need a fresh transfer check, author 2 new sealed reserves in
   `validation/reserves.md` (novel domains, answer keys, don't show producers).
9. Failure triage table for validation misses: bottom of `validation/protocol.md`.

## 4. Pending work (state at 2026-08-03)

- **Task #6 — Layer-4 live rendering** (blocked on user restarting the session so the project
  `.mcp.json` Appian Dev MCP connects): deploy the 7 outputs in `validation/outputs/` to
  spear-dev.appiancloud.com, confirm each evaluates, screenshot desktop + phone widths (T2/T5/R2),
  compare against each Design Brief, and settle the render-unverified params listed in
  `_meta/build-report.md` (notably `a!fileUploadField(placeholder:)`, 3-digit `#fff`). Feed any
  findings back: wrong param → the components/ file + cookbook; then re-run the affected producer
  once. Front-end password entry must be done by the user; MCP-authenticated actions are fine.
- Cosmetic: `guidance/case-studies/ins-claim-case-study.md` is 19KB vs the 15KB cap (accepted; trim
  if touched anyway).

## 5. Do-not list

- Don't fold `validation/outputs/*` into `guidance/` — they're test artifacts, not exemplars.
- Don't let producer/validation agents read `corpus/`, `pipeline/`, or `validation/` (answer keys live there).
- Don't regenerate all analyses or all guidance for a point update — the provenance graph exists so you don't have to.
- Don't remove the `(est.)` markers or evidence tags when editing.
- Don't republish corpus/sources outside internal Appian-app tooling.
