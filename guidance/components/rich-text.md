# Rich Text (a!richTextDisplayField / a!richTextItem)

Styled read-only text — the size/weight/color system that builds page hierarchy and highlights key values. Reach for it for KPI numbers, status words, labels, eyebrow captions; NOT for naming content groups (that's [Section Layout](section-layout.md) labels) or for user input.

## Variants

The page's four differentiation features (all hexes pixel-sampled — no SAIL on page):

- **Size** — `a!richTextItem(size:)` on the ladder SMALL · STANDARD · MEDIUM · MEDIUM_PLUS · LARGE · LARGE_PLUS · EXTRA_LARGE. For titles and hero numbers; never enlarge whole paragraphs.
- **Weight** — `style: {"STRONG"}`. Field labels and key values inline; don't bold entire blocks.
- **Color** — `color:` STANDARD | SECONDARY (gray #6d7278 (est.)) | ACCENT | POSITIVE | NEGATIVE | hex. SECONDARY demotes metadata/captions; never gray the primary fact.
- **Capitalization** — authored text case (SAIL has no transform param). ALL-CAPS only for short eyebrow/zone labels; caps slow reading at length.
- **EMPHASIS** (italic) — a spot style for a few words: split the sentence into multiple `a!richTextItem`s and set `style: {"EMPHASIS"}` only on the target phrase. At paragraph length, everything slanted = nothing emphasized.

## Styling hooks

- Build hierarchy with size + weight first (they survive color-blindness and theming), color second, caps last.
- POSITIVE ≈#00b021 (est.) / NEGATIVE ≈#f62143 (est.) are for business meaning only (favorable state, breached threshold) — never decorative green/red.
- Dark overlays auto-flip STANDARD text to white, but POSITIVE/NEGATIVE keep their hues: on an orange billboard the NEGATIVE "79%" measured ≈1.6:1 contrast vs ≈6.7:1 for white — keep key numbers standard-colored over media.
- To subordinate text, step DOWN the ladder (`size: "SMALL", color: "SECONDARY"`), not italics — the product-card DO pairs a LARGE #222222 (est.) name with a SMALL gray #767676 (est.) spec line.

## Idioms

1. Number-over-label KPI stack (employee-request dashboard DO): value at `size: "MEDIUM_PLUS", style: {"STRONG"}, color: "ACCENT"` over a STANDARD SECONDARY label, inside `a!richTextDisplayField(labelPosition: "COLLAPSED")` — chrome-free KPIs at 2–3× label size, no card boxes.
2. Status word that survives formatting stripped (Location Details DO): `a!richTextItem(text: "Good", color: "POSITIVE", size: "MEDIUM")` — the fact lives in `text`; color and size only amplify it.
3. Three-tier type system (same dashboard): LARGE #222222 title → MEDIUM bold ACCENT section heading → ALL-CAPS STANDARD bold #666666 zone labels → data; plus a strict color contract — accent blue = identity/structure, green/red = evaluation only, gray = chrome. The lone red 63% in a green satisfaction column is findable in under a second.

## Top don't

Never let color or size be the sole carrier of a critical fact — screen readers announce none of it, color-blind users miss it, and the observed greens fail contrast anyway (#6dd400 on white ≈1.9:1). Words and numbers state the fact; formatting amplifies. The shipped DON'T twin proves the opposite failure too: the same dashboard in uniform STANDARD #222222 forces linear reading of every fact.
