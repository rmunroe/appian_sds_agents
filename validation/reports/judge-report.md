# Judge Report — Primary Suite (T1–T5), Layer 3 + Swap Test

Judge saw: `validation/outputs/T1–T5.md`, `validation/protocol.md` (answer key, grading layers,
pass criteria), `pipeline/templates/CONVENTIONS.md`, and — sole allowed exception —
`guidance/styling/recipes.md` for declared-recipe palette hex verification only. The guidance
corpus was otherwise not read; outputs were judged on their own merits against the rubric.

Scoring is anchored 1–5; half-points used where a criterion sits between anchors. Per-case PASS
requires pattern fit ≥4 AND non-corporate ≥4 AND rubric mean ≥3.5 (L1 lints are scripted and out
of this report's scope; per-case verdicts below are conditional on L1 passing).

---

## Recipe palette verification (allowed exception)

| case | declared recipe | verdict |
|---|---|---|
| T1 | Ops Control | **Applied.** Canvas #f4f2f1, white shadow-not-border cards, pastel identity set #d19fcb/#79b096/#eccd5f/#9dd0aa/#9db6d0 (exact roster match), text #54514e/#666666, NEGATIVE-token-only alarm, recipe's optional flush billboard→white-KPI masthead used verbatim; prohibitions (no colored band, no EXTRA_LARGE numerals) respected. Additions beyond the table: LATE duotone #f8edd0/#8a6d1a, gauge #45818e — harmonious extensions. |
| T2 | Dark Editorial | **Applied.** #333F48 page+hero (seamless, exact), #394c5a content cards (exact), series amber #f7d027 and green #6ba547 from the recipe trio, white text + LIGHT H1, no white cards, density 2. Additions: #A9BAC4 muted, #2C363E placeholder — plausible derivatives. |
| T3 | Calm Clinical | **Applied.** All declared hexes match the recipe table exactly: #F0F6F7 canvas, #0E3842 anchor, #C22966 action accent (used once), #1E798F secondary, #DCE6E8 borders, #a4c2f4/#cfe2f3 soft info. Bordered-not-shadowed cards, no all-caps, accent-only-on-action all honored. Density shifted 3→2 with stated exec-variant rationale (matches answer-key density 1–2). |
| T4 | Premium Editorial | **Applied.** #f8f6f0 cream, #f3f3f3/#111 band sequence, metallic gold #deaf3e/#eac251 exact, text #111111; gold held to 3 touchpoints (band eyebrow, wall-label bar, milestone accent). Deviation: no billboard hero — justified via the recipe's own "art-directed or nothing" prohibition (no artifact photography exists before the condition step). The sharpest recipe reasoning in the suite. |
| T5 | Ops Control (warm) | **Applied.** Pastel set exact; duotone type-coding pairs #d7e5f3/#3d85c6 and #d7f3e0/#459b20 exact roster matches; NEGATIVE exactly once (OVERDUE); both recipe prohibitions explicitly cited and honored in the brief. |

---

## Per-case scores

| case | 1 Pattern fit | 2 Layout coherence | 3 Aesthetic concreteness | 4 Register fit | 5 Non-corporate | 6 SAIL plausibility | Mean | Verdict |
|---|---|---|---|---|---|---|---|---|
| T1 courier-dispatch | 5 | 4.5 | 5 | 5 | 5 | 4.5 | **4.83** | **PASS** |
| T2 tool-library | 5 | 4 | 5 | 5 | 5 | 4 | **4.67** | **PASS** |
| T3 surgery-kpis | 5 | 5 | 5 | 5 | 5 | 4.5 | **4.92** | **PASS** |
| T4 museum-accession | 5 | 5 | 4 | 5 | 5 | 4 | **4.67** | **PASS** |
| T5 foster-record | 5 | 5 | 4.5 | 5 | 5 | 4 | **4.75** | **PASS** |
| **Criterion mean** | **5.0** | **4.7** | **4.7** | **5.0** | **5.0** | **4.2** | **4.77** | 5/5 PASS |

### Justifications

**T1 — Metro Dispatch Board**
1. Pattern fit **5** — dashboards/operational + Ops Control + density 4: the answer key's exact cell; both must-haves present (FAILED=NEGATIVE / LATE=pale-amber duotone / REROUTED=neutral status system; Exception Queue is the leftmost above-fold column and first in phone stack order).
2. Layout coherence **4.5** — masthead KPIs → exception queue → risk-sorted working list → driver rail → throughput mirrors the prompt's task order exactly; docked half a point because 5 of the 12 visible center-list rows duplicate the queue's entries, so ~40% of the center column's above-fold content is redundant with the left rail.
3. Aesthetic concreteness **5** — the SAIL is the spec: every color is a hex or token, every size on the ladder, paddings/margins explicit down to the mirrored pseudo-table column widths and the MEDIUM_PLUS fixed-height empty state.
4. Register fit **5** — utilitarian-ops with humane warmth: SMALL metadata, "prom 2:45 PM" operator shorthand, red rationed to one FAILED tag + one rising-exceptions caret; the EXTRA_SHORT fleet-photo band is the only decorative spend and stays subordinate to the KPI band.
5. Non-corporate **5** — five executed signature moves (flush billboard→KPI weld, whole-card link rows, red rationing with LATE demoted to duotone, pastel driver-identity stamps, designed empty state); "486 of 715 stops" gauge arithmetic is internally exact.
6. SAIL plausibility **4.5** — structure and params are disciplined and mobile behavior is fully stated (header-stack fork, phone-swapped table header, stack order = task order); flags: `a!billboardLayout(height:"EXTRA_SHORT")` looks like a cardLayout token, not a documented billboard height (Layer 4 must verify), and hotlinked Unsplash media is unverifiable.

**T2 — Palmer Park Tool Library**
1. Pattern fit **5** — shopping-journey/category listing (with the sanctioned lists-and-grids card idiom) + Dark Editorial, both in the answer key's accepted sets; `a!isPageWidth` mobile forks and photo-forward cards (photo ≈60% of card height) satisfy the must-haves; density 2 in range.
2. Layout coherence **4** — hero teaches first-timers the whole loop (browse→reserve→pick up) before the fold and the reservation rail is genuine cart-as-layout-state; docked because on the phone-first stack the lone CONFIRM CTA lands below all 8 catalog cards — a first-timer who picks card 1 scrolls the entire catalog to reserve — and the no-search omission on a 148-item catalog is boldly argued but unvalidated.
3. Aesthetic concreteness **5** — every fill, chip fork, overlay tag state, and photo height (SHORT_PLUS) is pinned; even the ghost chip fill and empty-state glyph are exact values.
4. Register fit **5** — warm-community copy ("Every tool on the block, free to borrow", $0/148/312 trust trio, $1-a-day fine print) on a workshop-amber-on-slate identity; the dark canvas is a bold public-page choice but explicitly sanctioned by the key and executed with consumer warmth.
5. Non-corporate **5** — zero a!buttonWidget on the page (amber card CTA as the single loud fill), status tags riding photos, segmented chip control, tonal zoning with no borders/shadows anywhere: distinct personality, ≥3 moves, domain-apt.
6. SAIL plausibility **4** — clean structure, working pick-state model, dates internally true to the calendar (Aug 5 = Wednesday, Aug 8 = Saturday); flags: three uses of 8-digit alpha hexes (`#ffffff2e` chips, `#ffffff14` picked rows) — SAIL color params are documented as 6-digit hex, so the ghost fills may not evaluate; per-tool boolean locals don't scale past demo data.

**T3 — Quarterly OR Performance**
1. Pattern fit **5** — dashboards/executive + Calm Clinical (accepted family), density 2: exactly the key; must-haves met — 5 oversized KPIs (LARGE/LARGE_PLUS values), one trend chart per metric family, zero grids and an explicit aggregates-only omission of all drill-ins.
2. Layout coherence **5** — the prompt's three KPI families (utilization, volume, staffing) get peer thirds twice (target cards, then charts), the masthead answers the board's first minute, the equation strip and provenance footer serve exactly a monthly leadership meeting; interpretation ("verdict") lines under every chart are meeting-ready.
3. Aesthetic concreteness **5** — full hex discipline including a named page-wide chart ramp local, border/shape/shadow stated on every card, responsive chart-height forks written out.
4. Register fit **5** — authoritative-executive-calm: no all-caps anywhere, REGULAR-weight H1, one magenta action, red confined to the single RN-vacancy breach; reads like a printed board pack.
5. Non-corporate **5** — divider-as-target-tick bullet bars with POSITIVE/NEGATIVE spill, the In-Room ÷ Staffed = 78.4% equation strip, three flush header bands: genuinely distinctive moves, and the numbers audit perfectly (9,784/12,480 = 78.4%; chart quarters sum to 3,412; ortho share 31%).
6. SAIL plausibility **4.5** — chart params, colorSchemeCustom, and stacking all valid; flags: two empty `a!sideBySideItem()` "springs" (the `item` parameter is likely required) and the `percentage: -1` empty-track progress-bar hack are clever but unverified constructs Layer 4 must confirm.

**T4 — Artifact Accession Intake**
1. Pattern fit **5** — forms/wizard as expected (custom sidebar wizard: vertical DOT milestone rail + `a!match` step bodies) + Premium Editorial (accepted); wizard-steps and progressive-disclosure must-haves both present; density 2 in range; adding a Review step is argued from consequence.
2. Layout coherence **5** — rail carries identity + progress + save-draft (right for a few-times-a-month user), one white work surface with eyebrow-sectioned clusters in task order (grade → damage → summary → photos → examiner), nav split Cancel/Back left vs single SOLID Next right.
3. Aesthetic concreteness **4** — step 3 is pixel-buildable and the chassis is fully specified, but steps 1, 2, 4, and 5 exist only as comment prose over `contents: {}` — field lists are named (vault choice cards, dimension rows, per-owner provenance entries) yet a developer could not build four of five steps pixel-faithfully without making design decisions.
4. Register fit **5** — the strongest register match in the suite: near-black museum slab, gold registration eyebrow, gallery wall-label rail with gilt rule, conservator vocabulary (raking light, UV fluorescence, accession 2026.14.3, Brygos Painter), red reserved for validation errors only.
5. Non-corporate **5** — wall-label rail, typographic-only dark band (with a principled refusal to fake a hero photo), condition choice cards, designed photo-tray dual states: distinct, domain-soaked, ≥3 moves.
6. SAIL plausibility **4** — `a!match` wizard machinery, cardChoiceField/cardTemplate idioms, and milestone params are right; flags: empty step branches make the delivered page navigable but bare on 4 of 5 steps, `a!fileUploadField(placeholder:…)` is likely not a real parameter, and the ×2 EXTRA_TALL spacer cards for the full-height-rail illusion is a fixed-height guess that can visibly under/overshoot against form length.

**T5 — Foster Placement Record View**
1. Pattern fit **5** — record-views (the key's only accepted pattern) with freeform header + subject/related zones; Ops Control (warm) accepted; density 4 in range; all must-haves present: welded photo+identity header summary, sectioned body, composer-first comment thread, event history feed.
2. Layout coherence **5** — the persona's ranked tasks are stated and mapped: status chips + stage timeline + task rail above the fold, thread owns the page's only SOLID (Post Update), facts/history for verification; the phone stack order is deliberately re-engineered so Open Tasks lands directly under the status rail.
3. Aesthetic concreteness **4.5** — entity color vocabulary is fully pinned (plum=family, mint=staff, blue duotone=medical, gold=supplies, dusty blue=paperwork) with sizes/shapes throughout; docked because the timeline connector visual is only "a vertical connector image" placeholder, unspecified.
4. Register fit **5** — warm-community ops: named animal masthead, paw/home iconography, "Family Updates"/"Message the Okafors" framing, and a register-driven deliberate omission (no KPI masthead — "a placement is a care relationship, not a metrics object").
5. Non-corporate **5** — masthead weld, pastel entity vocabulary as meaning, single OVERDUE alarm, whole-card task rows, hand-built stamp+connector timeline; sample data is domain-true down to voucher V-8841 and "not yet cat-tested", with dates that arithmetically cohere (Jul 9 + Day 26 ≈ Aug 3–4).
6. SAIL plausibility **4** — params and structure otherwise sound and phone behavior thoroughly stated; flags: `a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()` is a non-evaluable placeholder (deploy blocker as delivered, though honestly annotated), the task rail ships as two full duplicated copies (~300 lines) with a "keep both copies in sync" comment, and the EXTRA_SHORT billboard token shares T1's enum risk.

---

## Swap-test matrix

Question per ordered cell: "Would output A be acceptable for prompt B's user?" — strict bar: B's
org would ship it as-is.

| A \ B | T1 dispatch | T2 tool-library | T3 surgery-kpis | T4 accession | T5 foster |
|---|---|---|---|---|---|
| **T1** | — | NO | NO | NO | NO |
| **T2** | NO | — | NO | NO | NO |
| **T3** | NO | NO | — | NO | NO |
| **T4** | NO | NO | NO | — | NO |
| **T5** | NO | NO | NO | NO | — |

Rationales (pair-level, both directions):
- **T1↔T3 (twin probe)**: T1 carries row-level deliveries at density 4 into a brief that forbids row-level data; T3's quarterly aggregates are useless for live triage. Densities 4 vs 2 (Δ=2), opening zones differ (photo+KPI weld vs teal band/KPI/filter stack), column structures differ ([MEDIUM:AUTO:MEDIUM] triptych vs [1:1:1] thirds), warm greige vs cool tint. Hard divergence confirmed. NO both ways.
- **T1↔T5 (shared recipe)**: fleet monitoring board vs single-relationship record — wrong object model in both directions despite sibling styling. NO both ways.
- **T2↔T4 (both photo-led)**: a public consumer catalog cannot serve a registrar's structured intake, and a 5-step intake wizard is not a browse-and-reserve page. NO both ways.
- **T2 vs T1/T3/T5**: consumer density-2 dark editorial page has no triage, no aggregates, no record thread. NO.
- **T3 vs T2/T4/T5**: board-pack aggregates page has no catalog, no form, no per-subject workspace. NO.
- **T4 vs T1/T3/T5**: an intake wizard is not a monitoring, reporting, or record surface. NO.

**Result: 10/10 pairs NO (20/20 ordered cells NO). Requirement ≥8/10 — PASS.**

---

## Per-case verdicts vs pass criteria

Threshold: pattern fit ≥4 AND non-corporate ≥4 AND mean ≥3.5 (plus scripted L1, out of scope here).

- T1: pattern 5, non-corporate 5, mean 4.83 → **PASS**
- T2: pattern 5, non-corporate 5, mean 4.67 → **PASS**
- T3: pattern 5, non-corporate 5, mean 4.92 → **PASS**
- T4: pattern 5, non-corporate 5, mean 4.67 → **PASS**
- T5: pattern 5, non-corporate 5, mean 4.75 → **PASS**

## Suite verdict

**PASS (Layer 3 + swap gate): 5/5 primaries pass; swap test 10/10 NO.** Suite-level criteria this
judge can see are met with margin. Conditions before opening reserves: (a) scripted L1 lints and the
remaining L2 gates must confirm (note for the hue gate: T2's #f7d027 and T4's #deaf3e sit within
~10° of each other; a >30°-separated quadruple still exists via T1 blue / T2 amber / T3 magenta /
T5 plum); (b) Layer 4 rendering should verify the flagged SAIL constructs before treating any output
as deployable.

---

## Weaknesses observed (drive iteration)

1. **T4 ships a 20%-built wizard.** Steps 1, 2, 4, 5 are `contents: {}` stubs with comment prose;
   the deliverable asked for complete SAIL. The step-3 grammar is excellent, but the review step's
   submit — the flow's consequential action — exists only in a comment. Producers need an explicit
   rule: every `a!match` branch must render, even if abbreviated.

2. **A recurring layer of unverified SAIL constructs that only Layer 4 will catch.** Specifics:
   T2's 8-digit alpha hexes (`#ffffff2e`, `#ffffff14`) where SAIL documents 6-digit color;
   T1/T5's `a!billboardLayout(height:"EXTRA_SHORT")` (a cardLayout token applied to billboard);
   T3's empty `a!sideBySideItem()` spacer-springs and `progressBarField(percentage: -1)` hack;
   T4's `a!fileUploadField(placeholder:…)`; T5's `a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()` placeholder
   constant, which makes that page non-evaluable as delivered. If any of these are corpus-blessed
   idioms, fine — but five outputs each carrying 1–2 such constructs means the cookbook/component
   docs either bless them explicitly or producers are extrapolating params.

3. **Hand-unrolled repetition instead of data-driven rendering.** T5 duplicates its entire 4-task
   rail twice (~300 lines) with a "keep both copies in sync" comment to achieve phone ordering;
   T1 hand-writes 12 near-identical delivery rows and duplicates 5 queue entries into the center
   list; T2 hand-writes 8 tool cards over per-tool boolean locals. `a!forEach` appears only
   incidentally (T2 chips, T4 photo rows). The visual results are strong, but none of this survives
   contact with real data volumes — guidance should push list zones toward
   forEach-over-local!maps as the default idiom.

4. **T2's phone-first conversion path undercuts its own brief.** The single CONFIRM CTA sits below
   all eight catalog cards in the stacked order, so the primary persona (first-timer on a phone)
   picks a tool at the top and must traverse the full catalog to reserve; there is no picked-count
   affordance near the chips. Combined with the omitted search on a 148-item catalog, the page's
   two riskiest decisions both land on its stated primary user.

5. **Style monoculture risk inside the recipe system.** The two Ops Control outputs (T1, T5) share
   canvas hex, pastel set, EXTRA_SHORT-billboard-welded-to-white-card masthead, padding-NONE
   container cards, and the identical "See all … ›" ACCENT footer-row grammar — differentiated by
   pattern and content, but visually siblings; a third Ops Control draw would look formulaic.
   Relatedly, T2's amber and T4's gold are near-identical hues (~45–50°) rescued only by context.
   Recipes may need per-case variation knobs (masthead alternates, accent rotation) to keep repeat
   draws from converging.

---

## Reserve transfer check

Sealed-reserve run (R1 gate-rebooking, R2 permits-portal), judged 2026-08-03 under the same
protocol as the primary suite. Judge saw: `validation/outputs/R1.md`, `validation/outputs/R2.md`,
`validation/reserves.md` (answer key), `validation/protocol.md` (Layer 3 + pass criteria),
`pipeline/templates/CONVENTIONS.md`, and — sole allowed exception — `guidance/styling/recipes.md`
for declared-recipe palette verification only. The primary-suite scores above are used solely as
anchors; nothing is re-litigated.

Reserve bar per protocol: rubric mean ≥3.5 each ("transfer confirmed"). The primary-style per-case
gates (pattern fit ≥4, non-corporate ≥4) are reported for completeness.

Naming note: `reserves.md` predates the shipped recipe roster (same situation as the primary answer
key's 2026-08-03 footnote). Its "Institutional Modern" is read as the roster's institutional
family, Institutional Blue — which is what R2 declared. R1's key names Ops Control directly.

### Recipe palette verification (allowed exception)

| case | declared recipe | verdict |
|---|---|---|
| R1 | Ops Control | **Applied.** Canvas #f4f2f1, white shadow-not-border cards, text #54514e/#666666, pastels #eccd5f/#d19fcb/#9db6d0 and duotone pairs #d7e5f3/#3d85c6 + #d7f3e0/#459b20 are all exact roster values; action stamp #6fbb62 from the roster's action-accent set; alarm held to the NEGATIVE token (AT RISK tags only). Both prohibitions honored: no colored header band (the masthead is a white card — ACCENT spends itself on a THIN progress strip and selection bars, not a band) and no EXTRA_LARGE numerals. Additions: First-cabin duotone #d9d2e9/#674ea7 and taken-seat #f3f3f3 — harmonious extensions of the roster's duotone grammar. |
| R2 | Institutional Blue | **Applied.** #1155cc band/tag/accent, #FAFCFF canvas, #ffffff shadow-only cards, #ffe599 celebratory subtitle on the brand blue, #38761d good-news green — all exact roster values in the roster's exact slots; the card-in-card band (white outer card padding NONE wrapping a #1155cc card padding MORE) is the recipe's header mechanism verbatim, and moves 1–4 (one-hex monopoly, repeated-record grammar, MINIMIZE scan lines, drill-in chevron rows) are all executed. Prohibitions honored: no second brand hue; one SOLID CTA, everything else links. Additions: #c9243f rationed alarm and #b7b7b7 upcoming-gray (the roster table carries no alarm hex; the corpus-universal red-monopoly rule is respected). |

### Per-case scores

| case | 1 Pattern fit | 2 Layout coherence | 3 Aesthetic concreteness | 4 Register fit | 5 Non-corporate | 6 SAIL plausibility | Mean | Verdict |
|---|---|---|---|---|---|---|---|---|
| R1 gate-rebooking | 5 | 4.5 | 5 | 5 | 5 | 4.5 | **4.83** | **PASS** |
| R2 permits-portal | 4.5 | 5 | 5 | 5 | 5 | 4.5 | **4.83** | **PASS** |
| **Criterion mean** | **4.75** | **4.75** | **5.0** | **5.0** | **5.0** | **4.5** | **4.83** | 2/2 PASS |

### Justifications

**R1 — Gate Rebooking Cockpit (IRROPS)**
1. Pattern fit **5** — lists-and-grids/worklist (the key's first-listed pattern) executed as a pane
   split, Ops Control (the key's first recipe), density 4 (in the 4–5 band); all four must-haves
   demonstrably present: at-risk-first sort + segmented filter + one-click whole-card selection
   (fast row triage), NEGATIVE/SECONDARY/green-duotone/tier-pastel status vocabulary, no page title
   or band anywhere (minimal chrome), imagery explicitly omitted with rationale.
2. Layout coherence **4.5** — the prompt's three tasks map 1:1 onto the three panes (queue →
   flights + seat map + commit → standby) and the commit button narrates the whole decision
   ("Rebook On MR 2288 · Seat 21C"); docked: the 6-row seat map is titled "SEAT MAP · MR 2288 ·
   737-800" with no partial-cabin affordance (a real 737-800 has ~32 rows), and the prompt's
   "keyboard-heavy" constraint is never explicitly designed for — link-cards are tab-navigable and
   accessibilityText is thorough, but the brief never closes that loop.
3. Aesthetic concreteness **5** — SAIL-is-the-spec: every color a hex or token, every size on the
   ladder, seat-cell states enumerated (open = bordered white + STRONG, taken = #f3f3f3 fill,
   selected = ACCENT), down to the invisible #ffffff twin decorative bars specified precisely so
   selection never shifts x-offsets.
4. Register fit **5** — urgent-triage that stays calm in exactly the right place: CANCELLED is a
   gray SECONDARY tag with stated reasoning ("the agent already knows"), red spends only on
   misconnect risk; vocabulary is authentically airline (IRROPS, PNR, WCHR, T-10 release, load
   factors, equipment types); and — correctly for a shared terminal — there is no personal
   greeting anywhere (contrast R2's "Welcome back, Dana" on a personal portal).
5. Non-corporate **5** — five declared, five executed: the hand-built cabin-shaped seat map with
   row numbers riding the aisle column is the most original construction in either suite; plus
   whole-card selection bars, pastel-chips-as-vocabulary, single-meaning red, and the killed page
   title replaced by a flush THIN progress masthead.
6. SAIL plausibility **4.5** — fully rendered, forEach-driven throughout, no invented params
   spotted, and the data audits perfectly (24/58 = 41%; 18:20 − 0:10 = 18:10 T-10; all three
   connection verdicts correct, including the nonstop-reroute exemption for MR 662); flags:
   `local!selectedSeat` is not reset on flight change, so switching to MR 662 leaves the commit
   button reading "Seat 21C" — a seat that doesn't exist in that flight's map (real logic bug);
   the passenger band and standby title stay hardcoded to Kowalski/MR 2288 while the selection
   state they should follow is live; and `a!paneLayout(showDividers:)` / per-pane `padding` are
   unverifiable constructs Layer 4 must confirm (same class as the primaries' EXTRA_SHORT flag).

**R2 — City Permits Resident Portal**
1. Pattern fit **4.5** — portals family exactly as keyed, and the delivered content IS the keyed
   hybrid: status-tracker band summary ("1 needs your attention · 1 under review · 1 approved")
   + tagged application rows + a record-view-lite progress rail for the active permit; recipe
   matches under the roster mapping; docked: declared density 3 vs the key's 2 (inside the
   recipe's own 2–3 range and argued as "account-home stance", but the key wanted the airier
   end), and one spot bends the "accessibility-safe contrast" must-have — the white numeral on
   the #b7b7b7 upcoming stamp (≈2.0:1; mitigated by adjacent step text + accessibilityText).
   Every other pairing checked passes AA: white/#1155cc ≈6.6:1, #ffe599/#1155cc ≈5.3:1,
   white/#c9243f ≈5.5:1, white/#38761d ≈5.6:1.
2. Layout coherence **5** — the two resident tasks get the two main zones in task order: the band
   answers "where do my applications stand" before any scroll, and the single action card packages
   reviewer note + requested docs + upload + submit as one act-here object; the phone stack order
   (act → scan → help) is stated and engineered (flanks hidden, FILL button, no fixed chrome).
3. Aesthetic concreteness **5** — every hue is a hex with a named job and stated locations (the
   brief's palette line reads as a spec: "one hue, three jobs"), band mechanics pinned to the
   padding values, button width forked per breakpoint, and the timezone rule applied to every
   displayed time.
4. Register fit **5** — bank-statement institutional tuned for a permits office: one blue with a
   monopoly, quiet links instead of button noise, day-named plain-language dates, a reviewer note
   in genuine setback language, MEDIUM-and-up base sizes for all ages; #ffe599 keeps the band
   civic-warm rather than drab.
5. Non-corporate **5** — the tri-located alarm (ACTION NEEDED tag ↔ decorativeBar TOP ↔ current
   timeline stamp: one hue, three linked sightings) plus the sole-bordered-card-as-alarm-object
   move give the page a personality most government portals lack; numbered civic timeline with
   per-step dates, drill-in chevron rows, and domain-soaked data (BLD-2026-04417, per-type review
   times, counter hours) complete ≥3 executed moves.
6. SAIL plausibility **4.5** — fully rendered, forEach-driven, disciplined structure; flags:
   `style: "#fff"` once (3-digit hex where 6-digit is the documented form), `a!fileUploadField(
   placeholder:)` recurs after being flagged likely-invented on T4 (see notes), one day-name slip
   ("Sun, Aug 3, 2026" — Aug 3, 2026 is a Monday; the other three day-named dates verify: Aug 14 =
   Fri, Aug 11 = Tue), and one harmless oddity (a chevron `a!richTextIcon` nested inside a STRONG
   `a!richTextItem`).

### Swap test (2 cross cells + 2 generic-bar cells)

| output ↓ / target → | R1 brief (gate IRROPS) | R2 brief (resident portal) | generic "any enterprise app" bar |
|---|---|---|---|
| **R1 cockpit** | — | **NO** | **NO** |
| **R2 portal** | **NO** | — | **NO** |

- **R1 → R2's brief: NO.** A density-4 three-pane terminal cockpit with PNR/tier/standby
  vocabulary, no document submission, and no plain-language milestones is unusable by an
  occasional all-ages resident on a phone.
- **R2 → R1's brief: NO.** An airy account-home with one upload card cannot triage 58 passengers
  against a departure clock — no queue, no seat inventory, no standby, density 3 vs required 4–5,
  and a personal greeting is wrong on a shared terminal.
- **R1 vs generic bar: NO.** Strip the airline and the page collapses: the cabin-shaped seat grid
  with aisle row numbers, connection-protection verdicts, cabin-class inventory chips, and the
  T-10 release note have no generic-enterprise reading.
- **R2 vs generic bar: NO.** The skeleton (band + action card + list + rail) is a common portal
  shape, but the shipped page is permit-specific in every zone — plan-review pipeline stages,
  setback reviewer note, per-type review times, BLD/PLM/FEN reference grammar — and would not
  ship unchanged anywhere else.

**Result: 4/4 cells NO.**

### Overfit assessment (explicit answer)

**No — these two outputs read as generative transfer, not memorization of the 18 sources.**
- **Copied domains: none.** Airline IRROPS and civic permitting appear nowhere in the case-study
  roster visible to this judge (the 15 named in recipes.md: insurance, banking, nonprofit, sales,
  sustainability, health, conference, real-estate, restaurant, incident-reporting). R2 borrows a
  banking/insurance *register* for a government office — an argued fit — with fresh civic content.
- **Copied palettes where inappropriate: none.** Both palettes are their declared recipes' rosters
  applied in roster slots (verified above), with harmonious in-grammar extensions; no palette was
  imported against its register.
- **Forced patterns: none.** Both landed the answer key's expected pattern from the prompt alone,
  and both *declined* corpus-favorite decorations with argued rationale (R1: no billboards/KPI art
  under IRROPS pressure; R2: no photo hero for an occasional two-task portal). The strongest
  evidence is constructive: R1's seat map repurposes a calendar-grid idiom into a cabin shape with
  no corpus precedent — extension, not retrieval.
- **Faint echoes, noted not penalized:** R2 keeps the reference brand hexes (#1155cc, #ffe599)
  literally rather than deriving a civic brand hue — sanctioned by the recipes' "swap the brand
  hue" instruction when no client brand exists; R1 reuses Ops Control's exact pastel roster (as
  designed). And the primary-suite worry that a third Ops Control draw would look formulaic
  (weakness 5) did **not** materialize: R1 abandons the T1/T5 photo-weld masthead and "See all ›"
  footer grammar for a cancelled-flight card with a flush progress strip — the recipe produced a
  visibly different sibling.

### Per-case verdicts vs pass criteria

- R1: pattern 5, non-corporate 5, mean 4.83 → **PASS**
- R2: pattern 4.5, non-corporate 5, mean 4.83 → **PASS**

### Suite transfer verdict

**TRANSFER CONFIRMED.** Both reserves clear the ≥3.5 mean with wide margin (4.83 each), both also
clear the stricter primary-style gates (pattern ≥4, non-corporate ≥4), and the swap test is 4/4
NO. Per protocol ("reserves … both must score rubric mean ≥3.5"), the guidance generalizes beyond
its 18 source examples; no return to synthesis is required. Conditions carried forward: scripted
L1 lints on R1/R2 and Layer 4 verification of the flagged constructs remain outstanding, as with
the primaries.

### Notes for iteration (small, non-blocking)

1. **R1 seat-state carryover**: selecting a different flight should reset `local!selectedSeat`;
   as delivered the commit button can name a seat absent from the active map. One saveInto fix.
2. **`a!fileUploadField(placeholder:)` recurred** across two independent producers (T4, R2).
   Either the component doc genuinely blesses it (then close primary weakness 2's flag) or the
   doc is teaching an invented param — Layer 4 should settle it once and the doc should say so.
3. **Hex hygiene**: R2's lone `"#fff"` should be `"#ffffff"`; a 6-digit-only lint would have
   caught both this and T2's alpha hexes.
4. **Demo-data day-names**: three of four verified correct in R2; a producer rule ("compute day
   names, don't guess") costs nothing.
5. **Primary weakness 3 (hand-unrolled repetition) did not recur** — both reserves are
   forEach-over-local!maps throughout, with zero duplicated blocks. Whatever changed between
   runs, keep it.
