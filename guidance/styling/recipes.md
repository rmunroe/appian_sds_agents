# Aesthetic Recipes

Nine named, mutually exclusive visual identities, each derived from specific SDS inspiration examples
with **code-verified palettes** (hexes marked `est.` are pixel-sampled renders of theme tokens).
The [use-case selector](../use-case-selector.md) Stage 2 picks ONE primary recipe. Recipes answer
"what does this app FEEL like"; the pattern answers "how is it structured". Same pattern + different
recipe = visibly different app. That is the point.

**How to use a recipe**: adopt its palette roles, density stance, header/card treatment, and at least
2 of its signature moves. Then swap the brand hue for the client's actual brand color, keeping the
*application logic* (where color goes and — more important — where it doesn't). Respect the
prohibitions; they are what keep the recipe from collapsing into corporate mush.

**Universal defaults observed across the whole corpus** (apply unless a recipe overrides):
- Page canvas is almost never pure white — a tinted canvas (#f4f2f1 greige / #F0F6F7 cool /
  #f8f6f0 cream / #f0f0f0 gray) sits under white cards.
- Cards: `showShadow: true, showBorder: false, style: "NONE"` (shadow-not-border) — borders are the
  exception, not the default.
- Labels demoted, values promoted: SMALL/SECONDARY all-caps eyebrow labels over MEDIUM_PLUS/STRONG
  values.
- One color has a monopoly on alarm (usually NEGATIVE red) — never spend red on decoration.
- One SOLID button per screen; peers are OUTLINE/LINK.

---

## Ops Control
Dense daily working tool that stays humane. ← [ins-agent-home-page](../case-studies/ins-agent-home-page.md), [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md)

| role | value | applied to |
|---|---|---|
| page canvas | #f4f2f1 warm greige (or #f0f0f0 neutral) | headerContentLayout backgroundColor |
| cards | #ffffff, shadow-not-border | all zones |
| identity chips | pastel set: #d19fcb, #79b096, #eccd5f, #9dd0aa, #9db6d0 | TINY stampFields, tag backgrounds |
| action accents | #de8cb7 / #b094da / #6fbb62 (white glyphs) | action stamps, duotone type-coding (#d7e5f3/#3d85c6, #d7f3e0/#459b20) |
| alarm | NEGATIVE token only | OVERDUE tags, late carets — nothing else |
| text | #54514e headings, #666666 metadata | rich text |

- **Density 4** — many zones per viewport, SMALL metadata, DENSE row spacing where earned.
- **Header**: none or greeting bar (LARGE STRONG greeting + date); optionally an EXTRA_SHORT photo
  billboard butted flush (`marginBelow:"NONE"`) to a white KPI band so brand + health-check read as one masthead.
- **Charts**: MICRO/SHORT heights, axis chrome stripped.
- **Icons**: TINY pastel stamps as the visual language; one hand-drawn illustration allowed (hide on phone).
- **Signature moves**: (1) whole-card `a!dynamicLink` + shadow instead of bordered clickable rows;
  (2) pastel stamp chips instead of a KPI row; (3) red rationed to one OVERDUE tag so triage is instant.
- **Prohibitions**: no colored header band (color lives in chips); no EXTRA_LARGE display numerals —
  this is a doing UI, not a reading UI.

## Dark Command
Command-center dashboard with scheme-token dark mode. ← [sales-perform-dashboard](../case-studies/sales-perform-dashboard.md)

| role | value | applied to |
|---|---|---|
| page | `backgroundColor: "PLUM_SCHEME"` (≈#2b3050 est.) | headerContentLayout |
| cards | `style: "PLUM_SCHEME"` (≈#1f2440 est.), flat, no shadow | all cards |
| band | #17202b | KPI strip card |
| semantic | #4CC900 positive / #E64345 negative | carets, deltas, sparkline strokes |
| charts | `colorScheme: "RAINFOREST"` (teal #00A88F, green #82C272) | every chart |
| spots | #fc9901 stars, #F7D027 tags | ratings, warnings |

- **Density 4** — 10 zones/viewport, MICRO chart heights, `spacing:"DENSE"` rows.
- **Header**: none. No page title at all — the biggest text on screen is the KPI numbers (MEDIUM_PLUS).
- **Typography**: every card heading SMALL + SEMI_BOLD; chrome whispers, numbers speak.
- **Signature moves**: (1) hand-built KPI cards — value beside `a!lineChartField(height:"MICRO",
  xAxisStyle:"NONE", yAxisStyle:"NONE")` sparkline; (2) hand-built legends from `richTextIcon(icon:
  "circle")` dots hex-matched to the scheme; (3) shared `yAxisMax` normalization making micro-bars comparable.
- **Prohibitions**: no photos or illustrations; no borders anywhere (tonal separation only).

## Dark Editorial
Dark, airy, mission-driven storytelling around a few numbers. ← [nonprofit-fundraise-campaign-overview](../case-studies/nonprofit-fundraise-campaign-overview.md)

| role | value | applied to |
|---|---|---|
| page + hero card | #333F48 — same hex, seamless | headerContentLayout bg, hero cardLayout style |
| content cards | #394c5a — one step lighter, flat | data zones |
| series | #619ed6 blue, #6ba547 green, #f7d027 yellow | charts + hand-built legend dots |
| semantic | POSITIVE token, used exactly once | the one good-news delta |
| text | #ffffff; H1 at `fontWeight: "LIGHT"` | everything |

- **Density 2** — two content cards, half-viewport hero, EVEN_MORE padding, empty flanking columns.
- **Header**: alignVertical-MIDDLE columns pairing a LIGHT-weight H1 sentence with a flat illustration
  whose background matches the page hex (it floats as scenery, not a boxed image).
- **Signature moves**: (1) tonal zoning — cards one shade lighter than canvas instead of borders;
  (2) `seriesLabelStyle:"NONE"` + one hand-built sideBySide legend; (3) `a!gaugeField` color-matched
  to the series as the single progress statement.
- **Prohibitions**: no white cards (kills the mood); never more than 3 series hues.

## Executive Clarity
Light, generous, one brand hue in a ramp, numbers you can read across the room. ← [sustainability-dashboard](../case-studies/sustainability-dashboard.md)

| role | value | applied to |
|---|---|---|
| hero band | #dbf1d3 pale brand tint | billboardLayout backgroundColor |
| headline | #274e13 deep brand + #47b311 bright brand | richText hero, accent words |
| supporting ramp | #93c47d mid-tones | chart series, icons |
| canvas | white / near-white | contents |
| semantic | POSITIVE/NEGATIVE tokens | trend deltas only |

- **Density 1–2** — ≤6 KPIs, one message per band, MORE/EVEN_MORE margins.
- **Header**: SHORT_PLUS billboard in the pale brand tint, `a!fullOverlay` headline mixing MEDIUM_PLUS
  weights/colors; responsive height via `a!isPageWidth`.
- **Typography**: KPI values LARGE_PLUS/EXTRA_LARGE STRONG; everything else stays MEDIUM or below.
- **Signature moves**: (1) one hue expressed as a ramp (pale bg → deep text → bright accent) instead of
  a multi-color palette; (2) oversized numbers with demoted caps labels; (3) trend charts over tables —
  no row-level data at all.
- **Prohibitions**: never >6 KPIs; no data grids; no second saturated hue.

## Calm Clinical
Cool, quiet, trustworthy; one precise action accent. ← [my-health-site](../case-studies/my-health-site.md), [ins-claim-case-study](../case-studies/ins-claim-case-study.md)

| role | value | applied to |
|---|---|---|
| page canvas | #F0F6F7 cool tint (or #f0f0f0) | page / left pane |
| deep anchor | #0E3842 dark teal | header band |
| action accent | #C22966 magenta (or brand equivalent) | CTA fill, category icons, tab underline — action points ONLY |
| secondary | #1E798F teal | decorative card bars, links |
| cards | #ffffff + border #DCE6E8, SEMI_ROUNDED, **no shadow** | content |
| soft info | #cfe2f3 banner fills, #a4c2f4 empty-state icons | status banners |

- **Density 3** — comfortable; ~10 cards/zones per viewport, STANDARD padding.
- **Header**: deep-teal band or quiet greeting H1 at REGULAR weight (friendly, not shouty); no all-caps anywhere.
- **Signature moves**: (1) bordered-not-shadowed cards (the corpus exception — reads calm and printed);
  (2) the action accent appears ONLY where the user should act; (3) state encoded redundantly
  (fill + weight + icon + date) so progress reads even colorblind; (4) designed empty states
  (EXTRA_LARGE pale icon + padding EVEN_MORE) instead of hidden sections.
- **Prohibitions**: no energetic saturated fields; red only for genuine clinical/negative states.

## Institutional Blue
Bank-statement confidence: one brand hue does everything. ← [customer-acct-management](../case-studies/customer-acct-management.md), [ins-quote-review](../case-studies/ins-quote-review.md)

| role | value | applied to |
|---|---|---|
| brand band | #1155cc | header card-in-card band, tags, accent |
| page | #FAFCFF blue-tinted near-white | canvas |
| cards | #ffffff shadow-only | content |
| people/entity stamps | #e12e8b / #118bf1 / #569a38 | initials chips |
| dark anchor (saturated variant) | #333 | footer/base slabs |
| celebratory | #ffe599 on brand blue, #38761d savings | hero subtitle, money-good numbers |

- **Density 2–3**.
- **Header**: the card-in-card band — white outer card `padding:"NONE"` wrapping a #1155cc card
  `padding:"MORE"` = full-bleed brand band without touching site config. Saturated variant: stack the
  whole page in the header slot as full-bleed color slabs with `backgroundColor:"#333"` under-scroll.
- **Signature moves**: (1) ONE hex does header, tag, and accent so nothing competes; (2) repeated-record
  "grammar" — caps eyebrow → STRONG value → quiet `Edit` STANDALONE link → divider — instead of grids;
  (3) amount+date share one scan line via `align:"RIGHT"`/`width:"MINIMIZE"`; (4) drill-in rows as
  `cardLayout(link:)` wrapping icon | label | value | chevron.
- **Prohibitions**: no second brand hue; buttons stay quiet (links) except the one money CTA.

## Premium Editorial
Photography carries the brand; type shows restraint; metallic accent appears twice. ← [conference-home-page](../case-studies/conference-home-page.md), [portal-home-page](../case-studies/portal-home-page.md), [real-estate-property-list](../case-studies/real-estate-property-list.md)

| role | value | applied to |
|---|---|---|
| canvas | #f8f6f0 cream (light) or #232020 near-black (dark rail variant) | page |
| band sequence | #f3f3f3 → #fcfcfc → #111 | full-bleed card bands |
| metallic accent | gold ≈#deaf3e/#eac251 est. (theme ACCENT) | CTA + eyebrows/rule — 2–3 touchpoints max |
| deep accent (dark variant) | #990000 | active nav cell, primary button |
| status tags (working variant) | #ff9900 / #38761d / #cc0000 / #3c78d8 | photo-overlay tags |
| text | #111111 on light, #ffffff on photo | rich text |

- **Density 1–2** — hero ≈50%+ of viewport on landing; photo ≈60% of card height on lists.
- **Header**: TALL/EXTRA_TALL billboard, art-directed photo, overlay `style:"NONE"` when the photo has
  a pale region (phone fallback SEMI_LIGHT/SEMI_DARK via `a!isPageWidth`) — no boxed hero.
- **Typography**: sizes stay ≤MEDIUM_PLUS on cream (restraint IS the luxury); or EXTRA_LARGE tracked
  all-caps white on photo. Caps+ACCENT eyebrows replace labeled sections.
- **Signature moves**: (1) page background matched to the photo's temperature (#f8f6f0 under sepia fog);
  (2) zero or near-zero boxes — full-bleed bands via `contentsPadding:"NONE"` + self-colored cards;
  (3) status tags overlaid on photos via `fullOverlay(alignVertical:"TOP")`; (4) photo-first ROUNDED
  cards (`padding:"NONE"`) in cardGroupLayout instead of grids.
- **Prohibitions**: no bordered boxes around photos; no more than 3 metallic/accent touchpoints per screen;
  never stock-photo clichés (handshakes, suits) — art-directed or nothing.

## Energetic Consumer
Saturated brand accent, big tap targets, one decision per screen. ← [restaurant-order](../case-studies/restaurant-order.md), [ins-quote-wizard-1](../case-studies/ins-quote-wizard-1.md), [conference-registration-portal](../case-studies/conference-registration-portal.md)

| role | value | applied to |
|---|---|---|
| brand bar | #73245d plum (or brand hue) | slim top bar card |
| accent | theme ACCENT (magenta ≈#af2b9b / violet ≈#5c3fc2 est.) | selected states, tab underline, segmented control, CTA |
| canvas | white work surface; GRAY token pane for browse zones | paneLayout split |
| dark anchor | #333 footer slab | legal/footer |
| celebration | #38761d savings green, soft notice fills (#f8eff3) | money-good moments |

- **Density 2–3** — one decision per screen on flows; 6 product cards + receipt on browse.
- **Header**: slim brand bar (flat colored card), or none — the accent does the branding.
- **Imagery**: appetizing photos (browse) or styled icons in accent (flows); flat isometric spot
  illustrations for warmth.
- **Signature moves**: (1) `cardChoiceField` with icon templates instead of radio buttons — selection
  state (accent border + corner check) comes free; (2) segmented control from `tagField` +
  `a!dynamicLink` with conditional ACCENT fill; (3) hand-built vertical stepper (TINY stamps +
  connector images) answering "how long will this take?"; (4) persistent receipt/summary pane beside
  the browse pane (paneLayout).
- **Prohibitions**: accent NEVER on non-interactive elements (it must mean "tap me / selected"); no
  data grids in consumer flows.

## Field Utility
Phone-first single-tint tool for gloved hands. ← [mobile-incident-reporting](../case-studies/mobile-incident-reporting.md)

| role | value | applied to |
|---|---|---|
| brand tint | #e4f1df (pale brand family) | header cards AND entire step-1 page background |
| deep brand | #127d21 | stamps, solid buttons |
| watermark | #b6d7a8 | oversized decorative icon, code text |
| work surface | #ffffff | steps 2+ |

- **Density 1–2** — one field + one button per viewport on entry steps.
- **Header**: flat borderless brand-tint card as logo bar on every step (no site chrome).
- **Signature moves**: (1) full-bleed brand-tint first screen (`backgroundColor` on the layout), white
  for subsequent "work" screens; (2) `choose(local!step)` + button saveInto = whole wizard in one
  expression; (3) TINY stamps in sideBySide rows as icon-keyed metadata; (4) LARGE FILL buttons and
  card choices — glove-sized targets.
- **Prohibitions**: no semantic red/yellow unless something is genuinely wrong; no dense zones, ever;
  no hover-dependent affordances.

---

## Collision rule
If two different briefs land on the same PATTERN + RECIPE pair, you have probably mis-answered a
Stage-2 question — re-check cadence and temperature. If they genuinely coincide, diverge at the
variant level: different density stance, different header treatment, different signature moves, and
obviously a different brand hue.
