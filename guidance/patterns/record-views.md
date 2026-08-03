# Record Views

## When this pattern
One entity instance is the subject: a claim, case, campaign, account, asset. The page answers "what is this, what state is it in, what's related, what can I do to it" and must be easy to scan (official page goal). Nearest alternatives: a dashboard when the subject is an aggregate (many records, KPIs) — see [dashboards](dashboards.md); a list page when the user is choosing which record to open; a [form](forms.md) when the job is input (launch it from this view's header actions).

## Anatomy
Canonical (built-in record view):
```
RECORD-VIEW
├─ RECORD HEADER: title + record actions (set a header background color for a
│  flush band that separates header from contents — page technique)
├─ TABS ×3–5 (Summary first/active; siblings e.g. related lists, Discussion)
└─ CONTENTS on a contrasting ground (cards vs transparent page background)
   └─ SECTION-per-zone → CARD(s)
```
Zone purposes: the header band carries identity + all record actions so contents stay pure data; tabs partition by question (overview vs related lists vs discussion); the body is sections of cards. Above the fold: header, tabs, and the answer to the persona's #1 question — progress/next-step for case followers, KPI stats for managers, subject facts for operators. Four scan techniques from the page: flush header, cards contrasted against a transparent background, clear section headers, large label and value text (values at MEDIUM/MEDIUM_PLUS to read at arm's length and fill the page).

## Variants
| Variant | Skeleton delta | Select when |
| --- | --- | --- |
| Cards summary | COLUMNS [1:1]: facts cards left (label/value rows with hairline dividers, inline progress bars), analytics right (KPI-ROW card + CHART cards) | monitoring a record with metrics; "what is it → how is it doing" split |
| Subject + related | COLUMNS [NARROW_PLUS:AUTO:MEDIUM]: vertical stamp timeline · subject + 1:1 related cards · 1:many grids/lists | operator working the record and pivoting to relatives |
| Case summary (consumer) | full-width "What's next?" sentence banner card, then COLUMNS [NARROW_PLUS:MEDIUM_PLUS:AUTO]: timeline · identity/facts cards · evidence cards (map, photo thumbnails, diagram+tags) | external follower whose #1 question is temporal; visuals replace paragraphs |
| Freeform header page | not a record view — `a!headerContentLayout` with a header stack of flush filled cards (`marginBelow:"NONE"`): breadcrumb strip + end-aligned actions → horizontal [date/stamp/label] timeline band → guidance banner | process stage must be the first read, promoted into the header; accepts losing record-view velocity (page tradeoff) |
| Custom record header | record header hidden; rebuild breadcrumb/title/status band + tabs as `a!cardLayout(style:"TRANSPARENT", link: a!recordLink(dashboard:…))` columns with an accent `a!horizontalLine` under the active tab | bespoke identity/status/navigation; note: hiding removes the default title, tabs, AND actions (page rule), and record-type refs don't copy across environments |

**Header treatments**, in ascending control/cost: (1) default header — maximum velocity, free tabs/actions; (2) default + header background color — flush band, actions ride the band as outline-on-dark buttons; (3) freeform stacked-cards header; (4) full custom header. Prefer (1)–(2); the page's default advice is to use record views to maximize development velocity.

**Tab structure**: keep Summary first and selected by default; siblings partition one-to-many worlds (e.g. gifts/donors/ads/discussion) rather than splitting the summary. 4–5 tabs observed across the corpus. In custom headers, tabs become recordLink dashboards — active state = accent underline + weight, not a filled pill.

## Component roster
- [`a!cardLayout`](../components/card-layout.md) — white shadow cards (`style:"NONE"`, `showShadow:true`, `showBorder:false`) on a transparent/tinted ground; `padding:"NONE"` when a grid sits flush inside
- [`a!gridField`](../components/grids.md) — 1:many related lists; `borderStyle:"LIGHT"` inside cards
- [`a!sectionLayout`](../components/section-layout.md) — MEDIUM bold zone labels above each card; `marginBelow:"MORE"` rhythm
- [`a!richTextDisplayField`](../components/rich-text.md) — label/value grids (`labelPosition:"ABOVE"`), eyebrow sub-labels (SMALL caps `SECONDARY`), sentence banners with STRONG lead-in
- [record actions](../components/record-actions.md) — always in the header, never floating in the body
- [`a!tagField`](../components/tags.md) — status/entitlement chips; semantic colors reserved for one meaning each
- [charts](../components/charts.md) — breakdown donuts/columns inside cards; one monochrome family per chart so adjacent charts don't fight
- `a!stampField` — TINY identity chips, initials avatars, and timeline nodes (with connector images)

## Layout decisions by data shape
- **1:1 vs 1:many contract**: subject fields and one-to-one related records go in the middle column as field cards; one-to-many related records go in the right column as grids/lists (official page structure). ≤3 related people → stamp+name+role rows, not a grid; row-count the grids to the question (1-row "open related" vs 4-row "history").
- **Field cardinality per card**: 2-col at density 3 (consumer), 3–4-col label-over-value at density 4 (operator). Keep column count and label position uniform WITHIN a card; a lengthy value (description) may span full card width above the columned rows — the sanctioned exception.
- **Milestones**: ≤6 fixed stages → horizontal [date/stamp/label] band in a freeform header; more stages or long labels → vertical rail column (scales better, page text). Encode done/current/future on multiple channels at once (stamp fill, content color, label weight/color).
- **Progress metrics**: pair % with absolutes in one row (label + inline bar + right value); paired bars (time elapsed vs money raised) answer "on pace?" in one glance.
- **Media evidence** (map/photos/diagram): give the evidence column the widest token (AUTO/WIDE); thumbnails in a DENSE strip; spatial data as a schematic image with `NEGATIVE` tags positioned by nested columns.
- **Empty states**: centered oversized muted icon + `SECONDARY` text with `padding:"EVEN_MORE"` — never a bare dash.
- **Density**: 3 for consumer/executive views, 4 for operator views (three columns, ~30 fields + grids per viewport).

## Mobile behavior
- Columns stack (corpus code stacks at `TABLET_LANDSCAPE`); order the source so the banner/timeline stacks FIRST, then facts, then related lists.
- Freeform horizontal timeline bands drop their flanking spacers below desktop via `a!isPageWidth`; beyond that, prefer the vertical timeline variant on phone.
- Grids scroll within their cards; 3–4-col field cards reflow to fewer columns — another reason to keep per-card column counts consistent.
- Header actions stay in the header band at all widths.

## Top 3 don'ts
1. **Mixed column counts or label positions within one card** (page-stated caution): creates visual misalignment; keep each card internally uniform, long values excepted as full-width rows.
2. **Hiding the record header without need** (page rule): you forfeit the built-in title, tabs, and actions plus development velocity; go custom only when staged status or brand banding must live in the header.
3. **Horizontal timeline beyond ~6 milestones**: it wraps and breaks the band; switch to the vertical rail, which also survives narrow widths.

## Exemplars
| case study | what to steal |
| --- | --- |
| [customer-acct-management](../case-studies/customer-acct-management.md) | card-in-card header-slot brand band; eyebrow sections (SMALL `SECONDARY` caps + `divider:"BELOW"`) for records-in-a-card; tabbed Overview/Claims/Preferences structure |
| [ins-claim-case-study](../case-studies/ins-claim-case-study.md) | stamp+connector timeline recipe; four-signal done/future encoding; header-slot "What's next?" guidance card |
| [mobile-incident-reporting](../case-studies/mobile-incident-reporting.md) | phone-scale record view step inside a flow; header-slot flat card as brand bar |
