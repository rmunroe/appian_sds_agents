# Forms

## When this pattern
Any UI whose job is capturing input: create/update dialogs, task forms, intake/registration flows, approvals. Nearest alternative: a [record view](record-views.md) when the job is reading one entity — launch forms from its header actions.

**Single-page vs multi-step (wizard) vs tabbed — the decision rule.** The form's content decides the container (official forms-page rule); decide on field count/length, branching, and save-resume needs.

| Choose | When |
| --- | --- |
| `a!formLayout`, one column | Simple, no sections needed. Corpus ceiling ≈9–10 inputs per dialog column (single-step event-dialog pattern). |
| `a!formLayout` + `a!sectionLayout`s (multi-step, single page) | Sections exist but all should be viewed at once; smaller input sets; no branching. |
| `a!formLayout` + `a!tabLayout(tabs: {a!tabItem…})` | Sections independent, any order; users switch back to review/update. No sequence implied. |
| `a!wizardLayout` or custom wizard | Complex OR conditional field logic (branching); sections best sequential; progress cues help. |

Tie-breakers:
- **Branching**: later fields depend on earlier answers → wizard (steps gate what renders; custom wizards switch step bodies via `a!match`/`choose()` on a step-index local that Back/Next write).
- **Save-resume**: can't finish in one session → custom wizard + "Save My Progress" button under the rail (OUTLINE, color `SECONDARY`, below a `divider:"BELOW"`); many steps → multi-level rail showing sub-steps only for the current step (page rule: reduces clutter).
- **Confidence**: consequential data → add a review step; skip it when later fixes are cheap (page rule).

## Anatomy
Single-step canonical — `a!formLayout` is exactly three zones; chrome is generated, only contents is authored:
```
FORM
├─ TITLE-BAR (template: simple | full | image | sidebar)
├─ CONTENTS  one column, width set by contentsWidth
└─ BUTTONS   secondary OUTLINE left ←→ primary SOLID right (a!buttonLayout)
```
Wizard canonical — `a!wizardLayout` is four zones:
```
WIZARD
├─ TITLE-BAR (same template options)
├─ COLUMNS [NARROW:AUTO]
│  ├─ MILESTONE rail (style enum; ≈1/4 width when vertical)
│  └─ WIZARD-STEP n/m: heading (auto from step label) + instructions + FORM
└─ FOOTER: CANCEL link · BACK outline ←→ NEXT/SUBMIT solid
```
Above the fold: title bar + first field cluster + (in wizards) the full rail; put required fields early so effort is predictable. Per-step guidance goes in `a!wizardStep(instructions:)`, never as rich text in contents — it inherits a fixed subordinate style. One step label string renders in both rail and step heading; write labels as 2–3-word noun phrases. Submit renders only on the last step via `showWhen: fv!isLastStep`.

## Variants
| Variant | Skeleton delta | Select when |
| --- | --- | --- |
| Single-step dialog | FORM in record-action dialog; footer auto-pinned | ≤ ~10 inputs, one topic |
| Two-axis single page | SECTIONs as COLUMNS [AUTO:input] — label+guidance left, inputs right; `spacing:"SPARSE"`, `divider:"ABOVE"` | guidance belongs beside fields; cuts vertical scroll |
| Tabbed form | TABS ×n inside FORM contents | independent sections, any order |
| Wizard layout | 4-zone canonical; `style` enum (dot/line × horizontal/vertical, chevron, minimal) | sequential steps, standard needs |
| Custom sidebar wizard | PANE[left, tinted, w=MEDIUM]: heading + `a!milestoneField(orientation:"VERTICAL", stepStyle:"DOT")`; content column centered | full styling control; rail balances whitespace in simple steps (donation-form pattern) |
| Icon-rail wizard | rail of `a!stampField(size:"TINY")` + labels + connector images; `showWhen: a!isPageWidth` desktop-only | each step has an obvious icon; consumer funnels |
| Multi-level wizard | rail shows sub-steps under the CURRENT step only; completed steps are link-cards; Save My Progress below | many steps, multi-session |
| Reference sidebar | passive info pane RIGHT of the form (`a!paneLayout`, tinted) | reference consulted while typing |
| Whole-form sidebar | options pane LEFT | choices affect the whole form (page rule: actionable→left, passive→right, LTR) |
| Decorative sidebar | `a!sidebarTemplate` titleBar: title, image, legend rows | simple form needing identity; field legends (SLAs) beside the field they explain |
| Review + approve | CARD(read-only summary) → CARD(decision `a!cardChoiceField` `POSITIVE`/`NEGATIVE` icons); comments `required` only on reject | queue-clearing approvals |
| Confirmation | `contentsWidth:"NARROW"`, centered: `POSITIVE` stamp → sentence with STRONG reference number → small Close | post-submit closure |

Milestone style: vertical for longer step lists/labels; minimal for 1–2 steps; horizontal caps at ~6 short labels; keep the rail quiet (default) when the title bar is already bold — one bold element per screen (birth-certificate wizard rationale).

## Component roster
- [`a!formLayout`](../components/form-layout.md) — three-zone host; titleBar templates, `contentsWidth`, dividers, fixed footer
- [`a!wizardLayout`](../components/wizard-layout.md) — four-zone host; `style`, auto Back/Next, `fv!isLastStep`
- [`a!sectionLayout`](../components/section-layout.md) — labeled bands; `divider`; quiet `labelSize`/`labelColor`
- [`a!tabLayout`](../components/tab-layout.md) — any-order sections
- [`a!buttonLayout` / `a!buttonWidget`](../components/buttons.md) — placement grammar below
- [inputs](../components/inputs.md) — text/paragraph (character counter on long text), dropdowns, date+time pairs, upload, pickers
- [`a!cardLayout`](../components/card-layout.md) — tinted guidance cards at point of need
- `a!milestoneField`, `a!stampField`, `a!cardChoiceField(cardTemplate: a!cardTemplateBarTextStacked)` — custom rails; 1-of-N card pickers (beat dropdowns for ≤ ~9 visible options; add a type-ahead search field above the grid when lists can grow)

## Layout decisions by data shape
**Contents width** — size to the fields, not the screen:
- Standalone single-column forms: `contentsWidth:"NARROW"`–`"MEDIUM"` so field length ≈ input length. Exception: in dialogs use `"FULL"` and size the dialog.
- Confirmations: `"NARROW"`. Wizard steps: commonly `"MEDIUM"` — a wizard's `contentsWidth` scopes only the step column, never chrome.
- `"WIDE"` only for the two-axis label-left grid (input column ≈60%).
- Never center with empty flanking columns: `contentsWidth` centers contents AND buttons together (always-severity don't).
- Weight `a!sideBySideLayout` widths to data shape (name row 4X/1/4X/2X; a trailing 2X spacer stops short fields stretching) — field width telegraphs answer length.
- Stack sections in ONE column; side-by-side only for semantic pairs (First/Last, City/State/ZIP, Start/End date+time).

**Button placement rules** (leave to `a!buttonLayout` defaults — every hand-built arrangement in the corpus do/don'ts is a DON'T):
- Primaries right (first listed = leftmost of group, gets SOLID); secondaries left, least prominent leftmost. Exactly one SOLID per screen.
- Wizards: NEXT/SUBMIT solid right; BACK outline left; CANCEL `style:"LINK"` with `validate:false`. Added buttons keep `size:"STANDARD"` to match the auto pair and must fit one row.
- Navigation buttons/links MUST live in the buttons params, not contents — else wizard auto-scroll-to-top breaks (page rule).
- Record-action dialogs pin the footer automatically; set `showButtonDivider:true` whenever the step can scroll.
- Label funnel CTAs with the destination ("Next: About You"), not bare "Next".
- Cross-field errors go in `a!formLayout(validations:)` phrased as the fix — rendered beside the blocked button.

**Density**: forms run density 2–3. One decision per step at density 2 (public); ≤ ~10 inputs per viewport at density 3 (internal). Encode enum consequence at the control: price/SLA/policy copy in `SECONDARY` text or a tinted card beside the field, not tooltips. Echo already-known values as `readOnly` fields.

## Mobile behavior
- Buttons stack automatically, primary first, full width.
- Columns/SBS stack; pin semantic pairs via `stackWhen:"NEVER"` (State+ZIP); tune breakpoints with `stackWhen`.
- Image title-bar templates hide the image on narrow screens — never put content in it; bigger image sizes also enlarge/wrap the title, so keep the smaller size in dialogs.
- Sidebar templates collapse to a header at medium widths, pushing legend content above the whole form; keep sidebar copy short.
- Panes stack and bury a right reference pane below the form; for critical reference, fork with `a!isPageWidth` and re-emit the sidebar as a top card on phone (eligibility-sidebar pattern does this).
- Hand-built stamp rails hidden below desktop leave no progress cue — provide a step-count fallback (wizardLayout's minimal style does this automatically).

## Top 3 don'ts
1. **Empty columns to fake centering** (always): the button row ignores them and lands outside the field edges; `contentsWidth` already centers both.
2. **Whole sections as parallel columns** (usually): two competing reading paths; users scroll happily but scan across columns poorly.
3. **Section headings sized ≥ the step/page heading** (always): hierarchy inverts, one step reads as three forms; keep in-step labels one ladder step smaller, `SECONDARY`-colored, never accent.

## Exemplars
| case study | what to steal |
| --- | --- |
| [ins-quote-wizard-1](../case-studies/ins-quote-wizard-1.md) | `choose(local!stepNumber)` branch-per-step wizard; stamp+connector icon rail with "(n of 6)" accessibility text; destination-labeled CTA |
| [ins-quote-wizard-2](../case-studies/ins-quote-wizard-2.md) | review step: paired-`showWhen` in-card state swap; per-group edit buttons kept OUTLINE `SECONDARY` |
| [conference-registration-portal](../case-studies/conference-registration-portal.md) | whole-form LEFT sidebar; brand/task column split; optional inputs grouped in a one-step-darker card |
| [mobile-incident-reporting](../case-studies/mobile-incident-reporting.md) | phone-first `choose()`+stepNumber micro-wizard; header-slot flat card as brand bar |
