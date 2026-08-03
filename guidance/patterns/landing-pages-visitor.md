# Visitor Landing Pages

Brand-first front door for external, first-time and occasional visitors — officially a page that
"welcomes new users to a website, providing an overview of its purpose and guiding users to
calls-to-action."

## When this pattern

- The audience is outside the org, arriving cold (search, ads, a mailed link), with no login and no habit.
- Success is one conversion or a confident route choice — not session work.
- Design answers the two official questions: **Direction** (what should users do, and how many
  actions?) and **Branding** (how does identity come through?).

Distinguish sharply from [employee home pages](home-pages-employee.md) — the two must never blend:

| | Visitor landing | Employee home |
|---|---|---|
| Visits | first / rare | daily–weekly |
| Anatomy | brand-first: imagery leads, then 1–4 CTAs | task-first: KPI/greeting header, task + grid zones |
| Density | 1–2 | 3–4 |
| Affordances | 1–4 buttons + footer links | dozens (grids, filters, record actions) |
| Navigation | none, in-hero, or footer only | site chrome + rails |

Nearest alternatives: [Portals](portals.md) — structural rules for anonymous access (a public
landing page usually *is* a portal page: apply both) · [Shopping journey](shopping-journey.md) —
when the next step is browsing a catalog · Employee home — recurring internal users.

## Anatomy

Two canonical shells.

**Checkerboard bands** (single CTA; the insurance-quote example, CODE-VERIFIED):
```
HEADER-CONTENT
├─ COLUMNS [WIDE:WIDE] band 1 (tinted): headline + CARD(elevated, decorativeBar TOP:
│    centered prompt + 1 input + button) + SMALL disclaimers | photo
└─ COLUMNS [WIDE:WIDE] band 2 (mirrored): photo | filled brand panel + ✓ benefit list ×6
   (below fold: dark band + stamp-icon info row)
```

**Hero billboard** (multi-CTA outage example; informational portal home; CODE-VERIFIED):
```
BILLBOARD h=AUTO(desktop)/EXTRA_TALL overlay=full media=photo
├─ logo + (language links row | transparent card-tabs)
├─ PANE[left ≈1/3–2/5]: TITLE + 1-line intro + (caption → SOLID LARGE full-col-width BUTTON) ×3
└─ FOOTER band: logo + link COLUMNS [1:1]      ← absorbs every secondary task
```

Zone-by-zone: the imagery zone carries the brand argument before any text (the biggest element on
every corpus example is a photograph); the CTA zone is the page's only elevated or saturated
object; reassurance content (benefit checklist, editorial rows) sits beside or below the ask,
never above it; the footer absorbs all non-primary tasks.

Above-fold requirement: value proposition + primary CTA(s) + identity land in the first viewport
(the conference page fits what/when/where + register; the outage page fits all three buttons).

## Variants

- **Primary (single) call-to-action** — "create a clear focus" (official). Triple-signpost the one
  CTA: the only elevated white card + the only decorative bar + the only accent-colored control,
  all at the same spot. The CTA card can host step 1 of the conversion wizard in-page —
  `a!localVariables` + `choose(local!stepNumber, …)` so the button advances state without
  navigation (CODE-VERIFIED).
- **Multiple calls-to-action** — "steer visitors to common actions" (official) among 2–4 peer
  intents. Equal-weight SOLID LARGE buttons, stacked at full column width, ranked by *order* not
  emphasis; a one-line caption sits above each button so users disambiguate before reading labels.
  Progressive disclosure stays in-hero: a local boolean swaps the overlay content for a chooser
  (3 icon cards + a cancel LINK button) instead of navigating away (CODE-VERIFIED).
- **Informational landing** — context first, action below the fold: "strong header sections, less
  content density, welcoming language, and expressive imagery" (official). Billboard EXTRA_TALL,
  then full-bleed self-colored band cards under `contentsPadding:"NONE"`; nav as transparent
  card-tabs inside the hero; centered editorial rows between empty flanking columns, image sides
  mirrored row to row ([portal-home-page](../case-studies/portal-home-page.md), conference page).

Selection = count *real* first-visit intents: one intent → single CTA · 2–4 peer intents →
multiple CTAs · "understand us first" → informational.

## Component roster

[billboard-layout](../components/billboard-layout.md) (hero + responsive height + overlay) ·
[card-layout](../components/card-layout.md) (CTA card, band cards, card-tabs) ·
[columns-layout](../components/columns-layout.md) (checkerboard bands, centering) ·
[buttons](../components/buttons.md) (SOLID vs OUTLINE discipline) ·
[images](../components/images.md) (lifestyle photos, size FIT) ·
[rich-text](../components/rich-text.md) (headlines, captions, ✓ lists) ·
[inputs](../components/inputs.md) (the one low-friction field) ·
[side-by-side-layout](../components/side-by-side-layout.md) (language row, in-card alignment).

## Layout decisions by data shape

- **CTA count**: 1 → isolated card. 2–4 → captioned button stack. >4 intents → this is a
  directory, not a landing page: use the [portal](portals.md)/non-retail directory shell.
- **Copy volume**: headline + ≤2 short lines per band; hero copy in a MEDIUM_PLUS-width column;
  editorial rows centered `[AUTO:MEDIUM_PLUS:MEDIUM_PLUS:AUTO]` with `marginBelow:"EVEN_MORE"`
  between rows (CODE-VERIFIED).
- **Form on the landing**: exactly one low-friction field (ZIP-code class),
  `labelPosition:"COLLAPSED"` with an instructive placeholder; anything longer belongs to step 2.
- **Imagery**: one photo per band in a WIDE column (`size:"FIT"`), alternating sides. Overlay
  `style:"NONE"` is legal only with an art-directed pale region plus a phone-only scrim
  (`if(PHONE, "SEMI_LIGHT", "NONE")`, CODE-VERIFIED); otherwise use a dark full overlay.
- **Locales**: one link per language in a right-aligned side-by-side row, `spacing:"SPARSE"`,
  active = STRONG + underline (8 locales on the conference page).
- **Density**: hold at 1 (billboard) to 2 (checkerboard). More than ~3 zones above the fold means
  the page has drifted into another pattern.

## Mobile behavior

- Billboard height is breakpoint-gated: `if(a!isPageWidth({"DESKTOP_WIDE","DESKTOP"}), "AUTO",
  "EXTRA_TALL")` on the outage page; EXTRA_TALL → TALL_PLUS on phone (conference page). Headline
  sizes step down EXTRA_LARGE → LARGE_PLUS → LARGE by breakpoint (portal home page).
- Stacking preserves the reading order at 100% width: logo above title, caption + full-width
  button pairs in the same sequence (the responsive example renders identical content on desktop
  and phone).
- Checkerboard bands stack via `stackWhen`; check that text/photo alternation still reads when
  linearized.
- Add the phone scrim; 8+ language links crowd at TABLET_PORTRAIT (known risk) — plan a compact
  switcher.

## Top 3 don'ts

1. **Don't add operational chrome** — no hamburger menu, search, KPI strip, or record grid.
   Corpus boring twin: logo bar + apology paragraph + default-width buttons + "a hamburger menu
   nobody anonymous needs."
2. **Don't let anything compete with the CTA.** One elevated surface, one saturated control.
   Boring twin: hero photo in a bordered card, three feature boxes, and a solid button all
   shouting at once — the CTA loses by committee.
3. **Don't set text on unscrimmed imagery casually.** The no-scrim look is
   art-direction-dependent — swap the photo and contrast fails (known risk on the conference
   page). Require a pale region + phone scrim, or use a dark overlay.

## Exemplars

| case study | what to steal |
|---|---|
| [conference-home-page](../case-studies/conference-home-page.md) | Page background matched to the hero photo's temperature; `a!fullOverlay(style:"NONE")` discipline; centered editorial rows via empty flanking columns; right-aligned language row |
| [portal-home-page](../case-studies/portal-home-page.md) | Full-bleed band cards under `contentsPadding:"NONE"`; in-hero transparent card-tab nav with a bordered-card underline; flush-media cards (padding NONE + inner SHORT billboard) |
| [conference-registration-portal](../case-studies/conference-registration-portal.md) | Brand rail (NARROW_PLUS) vs task column (WIDE) split with an EXTRA_NARROW spacer; tinted page with a one-step-darker filled card grouping optional inputs |
