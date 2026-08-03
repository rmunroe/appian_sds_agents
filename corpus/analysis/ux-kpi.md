# Analysis: ux-kpi

Page: `corpus/pages/ux-kpi.md` (section: components). 17 images: one 3-way DO/DON'T group (tier C) under "When to use a KPI", one standalone DO (tier C) under "Icons", and 13 neutral crops (tier B). Six SAIL blocks back the "Examples" images — those entries are CODE-VERIFIED; the small crops have no source, so hexes are pixel-sampled `(est.)`. Shared crop palette on white (OBSERVED, sampled): bg #ffffff, text #222222, positive trend #117c00, negative trend #df0036, docs demo icon purple #9d4ee3. Dark example cards: style #0F1C2E (CODE-VERIFIED) with text #eeeeee, positive #5af740, negative #ff3434 (est.) — Appian brightens text and semantic trend colors on dark card styles (OBSERVED). **Tier overrides**: `kpi_example_chart.png` (1112×734, suggested A) is a single-card component demo and `kpi_example_overlay.png` (2106×600, suggested A) is a billboard hero fragment — neither is a full-page UI, so both analyzed as tier B per protocol rule 4. Alt-text artifacts: `kpi_dont.png` alt is literally "alttext"; `kpi_trendIcon.png` reuses "Simple KPI (no trend)"; `kpi_do_simple.png` appears under both "When to use" and "Icons" headings.

## kpi_do_simple.png + kpi_do.png + kpi_dont.png

### Principle: KPI only decision-worthy metrics; trend only meaningful comparisons
- **DO shows**: `kpi_do_simple` — cash-register icon + "Average order total (Q4)" STANDARD #222222, "$4,859.07" EXTRA_LARGE #222222 — a real business metric, no trend needed (OBSERVED). `kpi_do` adds a secondary measure: "↑ 25.37 (+1%)" bold #117c00 + plain "Annual average" — the trend earns its line by naming its baseline (OBSERVED).
- **DON'T shows**: "Newest ID value" 200 with "⇅ 0 (0%)" — a database artifact, not a metric; zero change renders the neutral up/down glyph in plain #222222, a full line of noise (OBSERVED).
- **Rule**: promote a value to KPI only if it tracks an important metric; add the secondary measure only when the comparison informs action.
- **Severity**: always (page: "Don't use KPIs to show values that are not indicative of an important metric or trend")
- **Category**: data-display
- **SAIL implication**: point a!kpiField's primary measure at a real metric; set trend: "NONE" when no meaningful secondary measure exists (INFERRED).

## kpi_trendIcon.png

### Principle: Swap the default trend arrow when direction needs stronger semantics
- **DO shows**: "Resolved cases this week" 10; trend renders a double-chevron-down icon + "1 (-9%)" in #ff0001 with plain "over last week" — a custom icon amplifying an unfavorable decline (OBSERVED).
- **DON'T shows**: none on page — the implied default is the plain single arrow seen in `kpi_trend_auto.png`.
- **Rule**: when the stock arrow under-communicates, define icons for all three directions — positive, negative, and no change.
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: expression comparing fv!primaryMeasure vs fv!secondaryMeasure inside a!match() returning an icon per branch (page text); param name trendIcon INFERRED from filename. Note: this crop's red is #ff0001, not the #df0036 default negative — docs asset inconsistency (OBSERVED).

## Component: KPI — variant and example crops (page: ux-kpi) [tier B rollup]
Official variant vocabulary: templates **"COMPACT" (default) / "STACKED" / "ADJACENT"**; trends **"AUTO" (default) / "PERCENTAGE" / "DIFFERENCE" / "NONE"**; **primaryText / secondaryText**; iconStyle **"STAMP"**; sizes SMALL / STANDARD / LARGE.

### kpi_trend_auto.png
- **Produces it**: a!kpiField(trend: "AUTO") — the default (page prose)
- **Looks like**: "Resolved cases this week" 12; "↑ 4 (+50%) over last week" — difference AND percentage bold #117c00, secondaryText plain #222222 (OBSERVED).
- **Use when**: both magnitude and rate inform | **Avoid when**: one number suffices — the line gets long.
- **Styling hooks**: trend, secondaryText.
- **Pairs well with**: any template.
- **Marker**: neutral

### kpi_trend_percentage.png
- **Produces it**: trend: "PERCENTAGE" (page prose)
- **Looks like**: same subject, trend reduced to "↑ +50% over last week" #117c00 (OBSERVED).
- **Use when**: rate of change is the story | **Avoid when**: absolute counts matter — the 4 is unrecoverable.
- **Styling hooks**: trend.
- **Pairs well with**: sparkline combos (used in kpi_example_sparkline SAIL).
- **Marker**: neutral

### kpi_trend_difference.png
- **Produces it**: trend: "DIFFERENCE" (page prose)
- **Looks like**: "↑ 4 over last week" #117c00 — raw delta only (OBSERVED).
- **Use when**: absolute change is meaningful (cases, orders) | **Avoid when**: comparing KPIs of different scales.
- **Styling hooks**: trend.
- **Pairs well with**: count metrics + secondaryText naming the baseline.
- **Marker**: neutral

### kpi_text.png
- **Produces it**: primaryText: "Orders YTD", secondaryText: "orders compared to 2022", trend: "DIFFERENCE" (INFERRED)
- **Looks like**: primary text above "793" EXTRA_LARGE; secondaryText trails the trend: "↓ 380" bold #df0036 (est.) + plain suffix — delta shown unsigned, direction carried by arrow + color (OBSERVED).
- **Use when**: the baseline needs naming | **Avoid when**: secondaryText would restate the label.
- **Styling hooks**: primaryText, secondaryText.
- **Pairs well with**: DIFFERENCE trends.
- **Marker**: neutral

### kpi_compact.png
- **Produces it**: a!kpiField(template: "COMPACT") — the default (page prose)
- **Looks like**: SMALL purple icon #9d4ee3 (est.) inline with label "Days to fill open roles (avg)"; "37" EXTRA_LARGE #222222; trend "↓ 5 (-12%) from last year" bottom, #117c00 (OBSERVED).
- **Use when**: default for cards/dashboards | **Avoid when**: minimal horizontal space (page → STACKED).
- **Styling hooks**: icon, iconColor, size, align.
- **Pairs well with**: KPI-ROW ×n in white cards.
- **Marker**: neutral

### kpi_stacked.png
- **Produces it**: a!kpiField(template: "STACKED", align: "CENTER") — both named in page prose
- **Looks like**: every element on its own centered line — purple icon #9d4ee3 (est.), "Avg deal size", "$304,936" EXTRA_LARGE, "↑ $29,040 (+10%)" #117c00 (OBSERVED). Tallest crop: 298px vs 188 COMPACT.
- **Use when**: mobile/narrow columns, overlay bands | **Avoid when**: vertical space is tight.
- **Styling hooks**: align, icon, size.
- **Pairs well with**: barOverlay KPI rows (see kpi_example_overlay.png).
- **Marker**: neutral

### kpi_adjacent.png
- **Produces it**: a!kpiField(template: "ADJACENT") (page prose)
- **Looks like**: oversized purple calendar-check #9d4ee3 (est.) spanning all three text rows on the left; right stack = label, "37" EXTRA_LARGE, #117c00 trend (OBSERVED).
- **Use when**: dense dashboards where a large icon draws the eye (page) | **Avoid when**: the icon adds no recognition value.
- **Styling hooks**: iconStyle: "STAMP" (colored circle — see kpi_example_progress.png), iconColor.
- **Pairs well with**: multi-KPI rows on dark cards.
- **Marker**: neutral

### kpi_example_card.png
- **Produces it** (CODE-VERIFIED): a!cardLayout(style: "#ffffff", shape: "SEMI_ROUNDED", showShadow: true, decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT") → richText title MEDIUM STRONG + SMALL SECONDARY subtitle → a!columnsLayout(spacing: "SPARSE", showDividers: true) of 4 a!kpiField — first defaults to AUTO trend, the rest trend: "NONE".
- **Looks like**: #2322f0 accent bar atop white card; admissions funnel 3,415 → 429 → 212 → 199 split by hairline #e2e2e2 (est.) dividers; only the lead metric carries "↑ 100 (+10%) vs 2023" #117c00 (OBSERVED).
- **Use when**: related metrics deserve one titled container | **Avoid when**: metrics are unrelated.
- **Styling hooks**: decorativeBarPosition/Color, showDividers, spacing.
- **Pairs well with**: dashboard headers.
- **Marker**: neutral. Drift: pixels show secondaryText "vs 2023" absent from the printed code (OBSERVED vs CODE-VERIFIED).

### kpi_example_chart_micro.png
- **Produces it** (CODE-VERIFIED): white a!cardLayout(ROUNDED, padding: "STANDARD", showShadow) → a!kpiField(size: "SMALL", icon: "file-invoice-dollar") → inner a!cardLayout(style: "#FAFAFA", padding: "LESS", showBorder: false) → a!columnChartField(height: "MICRO", labelPosition: "COLLAPSED", xAxisStyle: "NONE", yAxisStyle: "NONE", colorScheme first color #ffbc11).
- **Looks like**: "$1,000,000" in #002c2b (est. — theme-driven; code sets no color) over a pure yellow-bar silhouette in a gray well, zero axis chrome (OBSERVED).
- **Use when**: compact tile where trend shape suffices | **Avoid when**: users must read time labels.
- **Styling hooks**: kpi size, chart height, axis styles.
- **Pairs well with**: tile grids.
- **Marker**: neutral

### kpi_example_chart.png
Tier override A→B: single-card component demo, not a full-page UI.
- **Produces it** (CODE-VERIFIED): same nesting as the micro variant but a!kpiField(size: "LARGE"), chart height: "SHORT", xAxisStyle: "STANDARD".
- **Looks like**: hero card — "$1,000,000" ≈EXTRA_LARGE #002c2b (est.), #ffbc11 bars rising Jan→Dec with month labels, inner #FAFAFA well separating chart from KPI (OBSERVED).
- **Use when**: one headline metric + 12-month context deserves a hero card | **Avoid when**: many metrics per row — use the MICRO variant.
- **Styling hooks**: size, height, xAxisStyle, colorSchemeCustom.
- **Pairs well with**: dashboard lead position.
- **Marker**: neutral. Code smell: referenceLine value 1.85E3 against yAxisMax 1,250,000 renders invisibly (CODE-VERIFIED vs OBSERVED).

### kpi_example_sparkline.png
- **Produces it** (CODE-VERIFIED): 3-column a!columnsLayout; each a!cardLayout(style: "#0F1C2E", ROUNDED, showShadow) → a!sideBySideLayout of a!kpiField(trend: "PERCENTAGE", sideBySideItem width MINIMIZE) + a!lineChartField(height: "MICRO", axes NONE, showTooltips: false, colorSchemeCustom #756BD1 / #F47348 / #F8B439 per card).
- **Looks like**: navy tiles, #eeeeee text; 947 ↑+5% #5af740 (est.), $28,407 ↑+3%, 4,230 ↓-25% #ff3434 (est.); jagged colored sparkline fills each right half (OBSERVED).
- **Use when**: metrics + shape-of-movement in one row | **Avoid when**: precise historical values matter (tooltips off).
- **Styling hooks**: card style, per-card colorScheme.
- **Pairs well with**: executive dark dashboards.
- **Marker**: neutral

### kpi_example_progress.png
- **Produces it** (CODE-VERIFIED): 3 cards style: "#0F1C2E"; first nests a transparent card (padding: "NONE") holding a!kpiField(template: "ADJACENT", iconStyle: "STAMP", icon: "usd", trend: "NONE", secondaryText: "Target Revenue: $1,200,000") + a!progressBarField(percentage: 80, color: "POSITIVE", style: "THIN", showPercentage: false, marginAbove: "LESS"); siblings set iconColor: "#FAA92F" (walking, trend PERCENTAGE) and "#EB4183" (shopping-basket, trend NONE).
- **Looks like**: STAMP circles — default accent #2322f0, orange, pink — with white glyphs; thin #1cc200 (est.) bar on #dddddd (est.) track at 80% (OBSERVED).
- **Use when**: the metric tracks a stated goal | **Avoid when**: no target exists.
- **Styling hooks**: iconStyle, iconColor, progress color/style.
- **Pairs well with**: ADJACENT template.
- **Marker**: neutral

### kpi_example_overlay.png
Tier override A→B: billboard hero fragment, not a full-page UI.
- **Produces it** (CODE-VERIFIED): a!billboardLayout(height: "MEDIUM", penguin webImage) + a!barOverlay(position: "BOTTOM") → a!columnsLayout(spacing: "SPARSE", showDividers: true, stackWhen PHONE/TABLETs) of 4 a!kpiField(template: "STACKED") — trends PERCENTAGE / PERCENTAGE / DIFFERENCE + secondaryText "vs last month" / NONE; content column WIDE_PLUS + empty AUTO column (showWhen wide desktop only) caps row width on large screens.
- **Looks like**: translucent dark scrim band across the photo's bottom; #eeeeee text, "+10%" #5af740 (est.), "-3%" red, faint column dividers (OBSERVED).
- **Use when**: condensing metrics onto the subject's image (page: wildlife foundation) | **Avoid when**: photo contrast risks legibility.
- **Styling hooks**: overlay position, stackWhen, showDividers.
- **Pairs well with**: site/landing headers.
- **Marker**: neutral. Drift: pixels read "Fundraising Goal" / "New Donor Target"; code says "Gifts Dollars to target" / "New Donors to target" — screenshot and printed SAIL out of sync (OBSERVED vs CODE-VERIFIED).

### Page rollup
Default choice for most cases is template: "COMPACT" (the component default) with trend: "AUTO" and a secondaryText naming the baseline, because every DO example takes that shape and the other templates are positioned as situational — STACKED for narrow/mobile/overlay columns, ADJACENT for dense dashboards needing an eye anchor. The Examples section repeats one composition recipe: KPI + its supporting visual (MICRO/SHORT chart, sparkline, THIN progress bar) inside a single a!cardLayout — white #ffffff or navy #0F1C2E — with showShadow: true, showBorder: false, and all chart chrome stripped (labelPosition COLLAPSED, axis styles NONE). On dark cards the renderer auto-brightens text to #eeeeee and semantic trend colors to #5af740 / #ff3434 (est.), so custom dark styles keep contrast for free.
