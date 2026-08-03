# Analysis: ux-rich-text

No SAIL source on this page — all hexes are pixel-sampled `(est.)`.

## richtext_do.png

### Principle: "Words carry the meaning; formatting only amplifies it"
- **DO shows**: "Location Details" block — gray sub-heading #6e6e6e (est.), gray outline icons #727272 (est.), bold #232323 labels, ratings as MEDIUM words: "Good" positive green #00b021 (est.), "Poor" negative red #f62143 (est.). Color/size amplify, but the words alone state the fact — survives screen readers and color-blindness. OBSERVED: same block reused in `overview_sections_1.png` (ux-section-layout).
- **DON'T shows**: none on page — implied twin: rating encoded in color/icon only.
- **Rule**: critical info must remain intelligible with formatting stripped.
- **Severity**: always
- **Category**: a11y
- **SAIL implication**: `a!richTextItem(text: "Good", color: "POSITIVE", size: "MEDIUM")` — the value lives in `text`, not only `color`.
- **Marker**: do

## positive-style_do.png + negative-text_dont.png (DO/DON'T pair)

### Principle: "POSITIVE/NEGATIVE colors need business meaning AND a contrast-safe background"
- **DO shows**: `Status  ✓ PROVIDER PAID` — green check icon + bold caps positive text #01ca04 (est.) by a #0c0c0c label on white; green = favorable business state.
- **DON'T shows**: billboard — orange media #ff4500 (est.), dark bar #992900 (est.). Title and "36" auto-flip to white #eeeeee, but "79%" keeps negative red #de0037 (est.): ≈1.6:1 vs ≈6.7:1 for white (computed) — the key number is least legible.
- **Rule**: POSITIVE/NEGATIVE only for meaningful values, never over low-contrast backgrounds — dark overlays whiten standard text but not semantic colors.
- **Severity**: always
- **Category**: color
- **SAIL implication**: `a!richTextItem(color: "POSITIVE"/"NEGATIVE")`; in dark billboard overlays keep key values as standard (auto-white) text.
- **Marker**: do / dont

## emphasis_style_do.png + italics_dont.png (DO/DON'T pair)

### Principle: "Italicize phrases, not paragraphs"
- **DO shows**: instruction callout (light blue box #edf4fe (est.), body #222222): bold heading line, then a sentence where only "the laptop settings" is EMPHASIS-styled — the italic phrase pops against roman text.
- **DON'T shows**: identical callout with the entire two-line sentence italicized — at paragraph length the slanted face is harder to read and the emphasis contrast is gone (everything slanted = nothing emphasized).
- **Rule**: EMPHASIS is a spot style for a few words inside regular text.
- **Severity**: usually
- **Category**: typography
- **SAIL implication**: split the sentence into multiple `a!richTextItem`s and set `style: {"EMPHASIS"}` only on the target phrase.
- **Marker**: do / dont

## emphasis_style_alternative_do.png

### Principle: "Subordinate text: smaller + secondary, not italics"
- **DO shows**: three bordered cards (#d4d4d4 (est.), white bg): centered blue glyph icon #316598 (est.), product name ≈LARGE #222222 ("Monitor LX5"), spec line ("18\"") in SMALL secondary gray #767676 (est.). Two type grades — size drop + color drop — make the subordinate relationship instant, no italics.
- **DON'T shows**: none pictured — implied twin: specs italicized or full size/color.
- **Rule**: to de-emphasize, step DOWN the ladder (`size: "SMALL"`, `color: "SECONDARY"`); reserve EMPHASIS for in-sentence stress.
- **Severity**: usually
- **Category**: typography
- **SAIL implication**: `a!richTextItem(size: "SMALL", color: "SECONDARY")` under a larger standard-color title, inside `a!cardLayout`.
- **Marker**: do

## font_features.png

**Tier override: suggested A → treated as tier-B variant catalog.** Despite tier-A-ish dimensions this is a concept figure (specimen pairs in a bordered #e7e7e7 panel), not a full-page UI — no persona/layout to reverse-engineer.

## Component: rich-text differentiation features (page: ux-rich-text)
Official variant vocabulary (page names them): **size, weight, color, capitalization**.

### Size
- **Produces it**: `a!richTextItem(size:)` — ladder step up (e.g. `"LARGE"` vs `"STANDARD"`)
- **Looks like**: "Size" ≈2.5× cap height over its standard twin; both #000000
- **Use when**: titles, hero numbers | **Avoid when**: whole paragraphs enlarged
- **Styling hooks**: SMALL→EXTRA_LARGE ladder
- **Pairs well with**: KPI value-over-label stacks
- **Marker**: neutral

### Weight
- **Produces it**: `style: {"STRONG"}`
- **Looks like**: bold "Weight" vs regular, same size/color
- **Use when**: field labels, key values inline | **Avoid when**: bolding entire blocks
- **Styling hooks**: STRONG vs plain
- **Pairs well with**: label:value pairs, table headers
- **Marker**: neutral

### Color
- **Produces it**: `color:` — standard #000000 vs `"SECONDARY"` gray #6d7278 (est.)
- **Looks like**: full-contrast line over muted gray line
- **Use when**: de-emphasizing metadata/captions | **Avoid when**: graying the primary fact
- **Styling hooks**: STANDARD | SECONDARY | ACCENT | POSITIVE | NEGATIVE | hex
- **Pairs well with**: SMALL size (double de-emphasis)
- **Hexes**: #000000 vs #6d7278 (est.) — color IS the variant
- **Marker**: neutral

### Capitalization
- **Produces it**: authored text case (SAIL has no transform param)
- **Looks like**: "CAPITALIZATION" vs "Capitalization", same face
- **Use when**: short eyebrow/zone labels | **Avoid when**: long strings — caps slow reading
- **Styling hooks**: none (content-level)
- **Pairs well with**: SMALL+SECONDARY zone labels above data
- **Marker**: neutral

### Page rollup
Default choice for most cases is **size + weight** for hierarchy because they survive color-blindness and theming; SECONDARY color for demotion; caps only for short labels.

## font_features_do.png

**Tier override: suggested C → tier A.** This is a complete full-page UI screenshot (per batch rule "full-page UI screenshot = tier A"); the DO/DON'T principle is captured separately in the pair section below.

### Identification
- **Image**: font_features_do.png | **Source page**: ux-rich-text | **Alt/caption**: DO example — "clear hierarchy... using different font features for the page title, section title, and subsection titles"
- **Device frame**: desktop
- **Marker**: do
- **UI type**: dashboard-operational

### Use-case reconstruction (INFERRED)
- **Persona**: internal-services (IT/HR helpdesk) team lead; weekly-manager cadence with daily glances at load.
- **Domain & brand context**: corporate employee-request operations; neutral internal-tool brand, single blue accent.
- **Top 3 user tasks (ranked)**: 1. Gauge open-request load (assigned / in progress / high priority). 2. Track closure rate across time windows (today / month / year). 3. Spot strong and weak resolvers (response time, satisfaction) for load-balancing/coaching.
- **Implied requirements**: "Must show open-request counts without scrolling"; "Must expose closure % for three time horizons"; "Must rank resolvers with volume + speed + satisfaction"; "Must flag below-threshold satisfaction"; "Assignees must link to their records".
- **Data model sketch**: Request(status ∈ {assigned, in progress}, priority, closedDate) — counts 103/54/44; Assignee 1—N Requests; per-assignee rollups OBSERVED in grid: #Requests 12–18, Avg. Response Time 2548–8545 m, Avg. Satisfaction 63–92%; 5 resolver rows ("**5** items").

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
PAGE (white)
├─ TITLE "Employee Request Dashboard" (LARGE #222222)
├─ SECTION "Summary" (MEDIUM accent blue, hairline divider below)
└─ COLUMNS [1:1]
   ├─ "OPEN REQUESTS" (caps gray) → KPI-ROW ×3 (blue number over gray label)
   │  "CLOSED REQUESTS" (caps gray) → CHART(gauge) ×3 (74% Today / 35% This month / 60% This year)
   └─ "TOP REQUEST RESOLVERS" (caps gray) → GRID(4-col, 5 rows + count footer)
```
- **Above the fold**: everything — single-viewport dashboard.
- **Reading order**: F — title, Summary rule, left KPI column, right grid.
- **Hierarchy rationale**: biggest ink = the three blue counts (task 1); gauges second (task 2 trend-at-a-glance); grid is right-hand reference material (task 3).
- **Density**: 3 — six stats + a 5-row grid in one viewport, generous white gutters, no card chrome.
- **Ratios & spacing**: ≈[1:1] columns; KPI trio on even thirds; section gap ≈ `marginBelow: "STANDARD"`; grid rows comfortably padded (~2.2 line-heights per row).

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; text #222222; accent blue #2c6eab (est.); zone-label gray #666666; positive greens #3cc100 (gauge) / #6dd400 (grid %); negative reds #de0037 (gauge) / #e02020 (grid %); link blue #2162a2 (est.); gauge track light gray ≈#d9d9d9 (est.); alternate row tint #f9f9fa (est.).
- **Color application points**: section heading, KPI numbers, and row links (blue); gauge arcs and satisfaction values (green/red only — semantic); zone labels (gray caps); no filled headers, no card accents.
- **Typography moves**: title LARGE regular; "Summary" MEDIUM bold accent; zone labels STANDARD bold ALL-CAPS #666666; KPI values ≈MEDIUM_PLUS bold blue over STANDARD secondary labels (number-over-label); gauge % MEDIUM #222222 with SMALL secondary sublabel; grid headers bold, numerics right-aligned.
- **Imagery stance**: none — gauges are the only graphics.
- **Card treatment**: none/flat; whitespace and one divider do all grouping; grid has hairline borders.
- **Signature moves**: instead of boxed KPI cards, bare number-over-label stacks via `a!richTextDisplayField` (chrome-free density); instead of a fourth text row, closure rates as gauge rings (preattentive % + color); a strict color contract — blue = identity/navigation, green/red = evaluation, gray = structure; caps-gray eyebrow labels add a third hierarchy tier without more size steps.

### Component inventory (OBSERVED, params INFERRED)
- `a!sectionLayout(label: "Summary", labelSize: "MEDIUM", labelColor: "ACCENT", divider: "BELOW")`; `a!columnsLayout` [1:1]; KPI stacks = `a!richTextDisplayField(labelPosition: "COLLAPSED")` with value `size: "MEDIUM_PLUS"`, `color: "ACCENT"`, `style: "STRONG"` + secondary label line; `a!gaugeField(percentage: 74, primaryText, secondaryText, color:)` ×3 with conditional POSITIVE/NEGATIVE color; `a!gridField` 4 columns — assignee as record link, right-aligned numbers, satisfaction via `a!richTextItem` conditional color.
- Chart types: 3 gauges; custom colorScheme: no — stock semantic green/red.
- Interactive affordances: assignee record links; no filters/search/tabs visible.

### Character & judgment
- **Register**: utilitarian-ops + calm-clinical — zero decoration; color appears only where it means something.
- **Why it works**: three type tiers (LARGE title / blue MEDIUM section / caps-gray labels) let you name the page structure in one fixation; number-over-label KPIs read value-first at 2–3× label size; the lone red 63% pops in a green column — threshold breach found in <1s.
- **Why not boring**: KPI numerals in accent blue rather than default black; gauges instead of three more text percentages (the DON'T twin proves the loss); per-row conditional color in the satisfaction column; caps-gray eyebrow labels as a deliberate third tier.
- **Boring twin**: literally shipped as `font_features_dont.png` — same data, uniform STANDARD #222222 text, gauges flattened to "74% Today" lines; title indistinguishable from body.
- **What to steal**: the blue number-over-label KPI stack; the color contract (accent=structure/identity, green/red=evaluation only); caps-gray zone labels between section and data.
- **Risks**: #6dd400 on white ≈1.9:1 and #3cc100 ≈2.4:1 (computed) — fail WCAG AA even as large text, so the words/values must carry meaning (this page's own a11y rule); red/green pairing needs a redundant cue for color-blind users; "8545 m" minutes unit is cryptic (≈5.9 days).

### Code cross-check
none — no SAIL source on this page.

## font_features_do.png + font_features_dont.png (DO/DON'T pair)

### Principle: "Vary font features so structure and key values are scannable"
- **DO shows**: the dashboard above — size/weight/color/caps graded per level; blue bold KPI numerals; gauge rings; green/red satisfaction values.
- **DON'T shows**: same page with standard style overused — title, counts, labels all STANDARD #222222; gauges replaced by plain text; satisfaction colors stripped. Only the blue "Summary" heading and links survive, and OBSERVED they're not enough: every fact needs linear reading.
- **Rule**: build hierarchy with deliberate font-feature deltas (size, weight, color, caps), not with prose order.
- **Severity**: usually
- **Category**: typography
- **SAIL implication**: `a!richTextItem` `size`/`style`/`color` grading per level; `a!gaugeField` over text %; conditional `color` on grid values.
- **Marker**: do / dont
