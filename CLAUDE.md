# Project: Appian SDS → agent design guidance

Converts the Appian SAIL Design System (docs.appian.com/suite/help/26.7/sail/) into text-only
guidance (`guidance/`) that coding agents use to build distinctive, use-case-appropriate Appian UIs.
Built + validation-passed Aug 2026 (7/7 blind test cases, transfer confirmed).

## Read first
- [README.md](README.md) — what this is, results, repo map.
- [MAINTAINING.md](MAINTAINING.md) — the continuation playbook: pipeline scripts, SDS version-update
  workflow, validation re-runs, architecture invariants. **Read it before modifying anything.**

## Hard rules for sessions in this repo
- **≤1–2 concurrent subagents** — parallel fan-outs burn the user's 5-hour usage window (bitten twice).
  On agent failure, check disk before relaunching; most output usually survived.
- `guidance/` is the deliverable and is self-contained — keep its internal contracts (Design Brief,
  two-stage selector, size caps, hex-free patterns, evidence marks `CODE-VERIFIED`/`OBSERVED`/`INFERRED`/`(est.)`).
  Lint after edits: `python3 pipeline/scripts/lint_guidance.py`.
- Guidance may only teach SAIL evidenced in the corpus — never invent constructs.
- Validation producers/judges must not read `corpus/`, `pipeline/`, or `validation/` (answer keys).
- `validation/outputs/` are test artifacts — never merge into `guidance/`.
- To build an actual Appian UI here: follow `guidance/README.md`'s protocol yourself (selector →
  reading list → Design Brief → SAIL).

## Environment notes
- Appian Dev MCP is configured in `.mcp.json` (spear-dev.appiancloud.com); front-end password entry
  is the user's job, never Claude's. Pending: Layer-4 live-render check (task #6, see MAINTAINING §4).
- Shell is zsh (no implicit word-splitting); zoxide prints a harmless config warning on every command.
