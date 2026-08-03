# Use-Case Selector

Run this BEFORE reading anything else (per [README](README.md)). It makes two independent decisions:

- **Stage 1 — STRUCTURE**: what the user *does* + the *shape of the data* + *device* → PATTERN (+ variant).
- **Stage 2 — AESTHETICS**: who the user *is* (visit cadence) + the domain's *temperature* → RECIPE + density stance.

They are deliberately independent: an insurance-exec dashboard and a nonprofit donor dashboard can
share a skeleton and must not share a skin. Answer each stage explicitly; the two answers + the
printed reading list feed your Design Brief.

---

## Stage 1 — Structure

Pick the PRIMARY task (what the user does most, not everything the page could do). Disambiguators
below the table.

| # | primary task | data shape | pattern (variant) | pattern file |
|---|---|---|---|---|
| S1 | monitor & triage, all day | many live records + statuses | dashboards (operational) | [patterns/dashboards.md](patterns/dashboards.md) |
| S2 | analyze & explore, weekly | aggregates + drill-down records | dashboards (analytical) | patterns/dashboards.md |
| S3 | review results, monthly/quarterly | aggregates & trends ONLY | dashboards (executive) | patterns/dashboards.md |
| S4 | enter/submit, one sitting, ≤ ~10 fields | one entity | forms (single-page) | [patterns/forms.md](patterns/forms.md) |
| S5 | enter/submit, long/branching/multi-entity | one rich entity + sub-objects | forms (wizard) | patterns/forms.md |
| S6 | find & scan by values | many homogeneous records, text/number fields | lists-and-grids (grid) | [patterns/lists-and-grids.md](patterns/lists-and-grids.md) |
| S7 | find & browse by identity/appeal | records where image/identity sells the row | lists-and-grids (card list) | patterns/lists-and-grids.md |
| S8 | work a queue row-by-row | many records + per-row action | lists-and-grids (worklist) | patterns/lists-and-grids.md |
| S9 | review ONE thing & decide/act | one rich entity (fields, history, related items) | record-views | [patterns/record-views.md](patterns/record-views.md) |
| S10 | coordinate over time | date/time-anchored items | calendar | [patterns/calendar.md](patterns/calendar.md) |
| S11 | move work through stages | staged items, few per stage | kanban | [patterns/kanban.md](patterns/kanban.md) |
| S12 | discuss/collaborate | conversational thread | comment-thread (usually inside a record view) | [patterns/comment-thread.md](patterns/comment-thread.md) |
| S13 | orient & jump to work (internal, recurring) | personal tasks + shortcuts + news | home-pages-employee | [patterns/home-pages-employee.md](patterns/home-pages-employee.md) |
| S14 | evaluate & convert (external, first visit) | marketing content + one CTA | landing-pages-visitor | [patterns/landing-pages-visitor.md](patterns/landing-pages-visitor.md) |
| S15 | browse → pick → pay/request | catalog + cart/summary | shopping-journey | [patterns/shopping-journey.md](patterns/shopping-journey.md) |
| S16 | self-serve status & documents (external, occasional) | one account/case + statuses | portals (status/self-service) | [patterns/portals.md](patterns/portals.md) |

**Disambiguators**
- S1 vs S3 is the classic trap: both are "dashboards". Daily + row-level + actions = operational
  (density 4–5). Monthly + no row-level = executive (density 1–2). If you can't tell, ask: *does the
  user FIX things from this page (operational) or LEARN things (executive)?*
- S6 vs S9: a list page's job is choosing which record to open; a record view's job is everything
  after. Most apps need both — design the one the prompt centers on.
- S9 + S12/event history: threads and histories almost always live INSIDE a record view (tab or
  column), not as standalone pages.
- S14 vs S16: landing sells (first visit, no login); portal serves (returning, has an account/case).
- S15 phone-first + physical-world work → check Field Utility override in Stage 2.
- Multi-page apps: run Stage 1 once per page the prompt actually asks for; share Stage 2 across the app.

## Stage 2 — Aesthetics

Answer both questions with exactly one value each.

**Q1 — cadence**: `daily-operator` · `weekly-manager` · `monthly-exec` · `occasional-customer` · `first-time-public`
**Q2 — temperature**: `clinical-technical` (health, claims, compliance, engineering) ·
`warm-human` (community, education, care, nonprofit) · `premium-aspirational` (luxury, real estate,
events, brand-led) · `energetic-promotional` (consumer commerce, marketing, food) ·
`institutional-trusted` (banking, insurance, government, utilities)

**Override first**: phone-first work in the physical world (field service, warehouse, inspection)
→ **Field Utility**, regardless of the matrix.

| cadence \ temperature | clinical-technical | warm-human | premium-aspirational | energetic-promotional | institutional-trusted |
|---|---|---|---|---|---|
| daily-operator | Ops Control *(alt: Calm Clinical)* | Ops Control, warm chips *(alt: Dark Command)* | Premium Editorial, dark-rail working variant *(alt: Ops Control)* | Dark Command *(alt: Ops Control)* | Ops Control *(alt: Dark Command)* |
| weekly-manager | Calm Clinical *(alt: Ops Control @3)* | Ops Control @3 w/ photo masthead *(alt: Dark Editorial)* | Premium Editorial *(alt: Executive Clarity)* | Dark Command *(alt: Energetic Consumer)* | Institutional Blue *(alt: Ops Control @3)* |
| monthly-exec | Calm Clinical, exec density *(alt: Executive Clarity)* | Dark Editorial *(alt: Executive Clarity)* | Executive Clarity *(alt: Dark Editorial)* | Executive Clarity, brand hue *(alt: Dark Command)* | Executive Clarity *(alt: Institutional Blue)* |
| occasional-customer | Calm Clinical *(alt: Institutional Blue)* | Calm Clinical, warm accent *(alt: Energetic Consumer)* | Premium Editorial *(alt: Energetic Consumer)* | Energetic Consumer *(alt: Premium Editorial)* | Institutional Blue *(alt: Calm Clinical)* |
| first-time-public | Calm Clinical, portal variant *(alt: Institutional Blue)* | Dark Editorial *(alt: Premium Editorial)* | Premium Editorial *(alt: Dark Editorial)* | Energetic Consumer *(alt: Premium Editorial)* | Institutional Blue, portal variant *(alt: Premium Editorial)* |

Recipes: [styling/recipes.md](styling/recipes.md). Take the primary unless a stated constraint
(brand guide, dark-mode requirement, accessibility) argues for the alternate — say so in the brief.

**Density stance** comes from the pattern variant first (operational 4–5, executive 1–2, forms 2–3,
record views 3, landing 1–2, lists 2–3 by media weight), then shift ±1 toward the recipe's stance if
they disagree. Declare the final number.

## Reading list (assemble, then STOP gathering)

Always: [README.md](README.md) (already read) + this file + [styling/anti-corporate.md](styling/anti-corporate.md).
Then add, per your Stage-1/Stage-2 result:

1. The pattern file(s) from Stage 1 (≤2).
2. `styling/recipes.md` — your recipe section (+ skim the universal defaults at top).
3. **1 primary case study** (2 max) — choose by nearest register, not nearest industry:
   - Ops Control → [ins-agent-home-page](case-studies/ins-agent-home-page.md) or [nonprofit-fundraise-campaign-dashboard](case-studies/nonprofit-fundraise-campaign-dashboard.md)
   - Dark Command → [sales-perform-dashboard](case-studies/sales-perform-dashboard.md)
   - Dark Editorial → [nonprofit-fundraise-campaign-overview](case-studies/nonprofit-fundraise-campaign-overview.md)
   - Executive Clarity → [sustainability-dashboard](case-studies/sustainability-dashboard.md)
   - Calm Clinical → [my-health-site](case-studies/my-health-site.md) (portal/home) or [ins-claim-case-study](case-studies/ins-claim-case-study.md) (record)
   - Institutional Blue → [customer-acct-management](case-studies/customer-acct-management.md) (account) or [ins-quote-review](case-studies/ins-quote-review.md) (offer page)
   - Premium Editorial → [conference-home-page](case-studies/conference-home-page.md) (landing), [portal-home-page](case-studies/portal-home-page.md) (org site), or [real-estate-property-list](case-studies/real-estate-property-list.md) (working list)
   - Energetic Consumer → [restaurant-order](case-studies/restaurant-order.md) (browse/POS), [ins-quote-wizard-1](case-studies/ins-quote-wizard-1.md) (wizard), or [conference-registration-portal](case-studies/conference-registration-portal.md) (registration)
   - Field Utility → [mobile-incident-reporting](case-studies/mobile-incident-reporting.md)
   - (employee home pattern regardless of recipe: [university-student-dashboard](case-studies/university-student-dashboard.md) is the nav-rail exemplar)
4. ≤4 component files named in the pattern's roster ([components/](components/)).
5. [core/layout-foundations.md](core/layout-foundations.md) always; [core/mobile.md](core/mobile.md)
   if phone/tablet is in scope; [core/design-philosophy.md](core/design-philosophy.md) on your first
   ever use of this guidance.
6. [sail/cookbook.md](sail/cookbook.md) — ONLY the sections your signature moves need (it has a
   header index).
7. [anti-patterns.md](anti-patterns.md) — run its Top-15 checklist right before finalizing SAIL.

**Hard caps**: ≤2 case studies, ≤4 component files. Never load `sail/sources/*.sail` unless the brief
is explicitly "emulate <that case study> end-to-end". Do NOT read every pattern or every recipe —
breadth is the selector's job, not yours.
