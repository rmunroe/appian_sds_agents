# Analysis: ux-gauge

Page: `corpus/pages/ux-gauge.md` (section: components). 6 images: 1 DO/DON'T pair (tier C) under "When to use a gauge" + 4 neutral crops (tier B) under "Gauge display text". No SAIL source on the page, so every hex is pixel-estimated `(est.)`; nothing is CODE-VERIFIED. All six crops share one exact dominant-pixel palette (OBSERVED): ring fill #316598, track #dddddd, primary/caption text #222222, secondary text #767676, bg #ffffff — i.e., the default ACCENT-colored gauge on white. Ring fill starts at 12 o'clock and runs clockwise in every crop (OBSERVED). **Tier override**: `gauge_icons.png` was suggested tier A (2316×524) but is a cropped 3-up component demo strip, not a full-page UI — analyzed as tier B per protocol rule 4.

## gauge_do.png + gauge_dont.png

### Principle: Gauge only bounded progress toward a real 100%
- **DO shows**: survey gauge — "60" EXTRA_LARGE #222222 (est.) + smaller "%" #767676 (est.), ring 60% #316598 over #dddddd track (both est.), all-caps "RESPONSES RECEIVED" caption; a true denominator makes arc = completion (OBSERVED).
- **DON'T shows**: stock gauge — primary "+6.19", secondary "0.21%", captions "3004.15" + "S&P 500 INDEX"; ring ~70% filled yet an index has no 100% threshold — the arc encodes nothing and misleads (OBSERVED).
- **Rule**: gauge only values with an obvious 100% endpoint; unbounded metrics get KPI/rich-text treatment.
- **Severity**: always (page: "Don't use gauges to show values that are unbounded")
- **Category**: data-display
- **SAIL implication**: a!gaugeField(percentage:) demands a true completion ratio; index-style figures → a!richTextDisplayField value + colored delta, no arc (INFERRED).

## Component: Gauge — display-text variants (page: ux-gauge) [tier B rollup]
Official variant vocabulary: primary text formats **"Percentage" / "Fraction" / "Icon"**; **secondary text** below primary inside the ring; field label above or below the gauge "if more space is needed".

### gauge_percentage.png
- **Produces it**: a!gaugeField(percentage: 75, primaryText: a!gaugePercentage()) (INFERRED)
- **Looks like**: "75" EXTRA_LARGE #222222 (est.), "%" smaller #767676 (est.); ring 75% #316598 (est.); all-caps bold "PROJECT COMPLETION" caption (OBSERVED).
- **Use when**: percent is the meaningful unit | **Avoid when**: underlying counts carry the meaning.
- **Styling hooks**: color (default ACCENT), size, secondaryText.
- **Pairs well with**: record summary headers.
- **Marker**: neutral

### gauge_fraction.png
- **Produces it**: a!gaugeField(percentage: 75, primaryText: a!gaugeFraction(denominator: 8)) (INFERRED)
- **Looks like**: "6/8" — numerals #222222, slash #767676 (both est.); arc fill exactly 6÷8 = 75%; all-caps "TASKS COMPLETED" caption (OBSERVED).
- **Use when**: count-of-total is the meaningful unit | **Avoid when**: denominator large/abstract — percent scans faster.
- **Styling hooks**: denominator, color, size.
- **Pairs well with**: task/checklist records.
- **Marker**: neutral

### gauge_secondary_text.png
- **Produces it**: secondaryText: "Tasks Completed" beneath the fraction primary (INFERRED)
- **Looks like**: "6/8" over STANDARD "Tasks Completed" #767676 (est.) inside the ring; no outer caption — label moved in-ring (OBSERVED).
- **Use when**: gauge must self-describe | **Avoid when**: label is long — use the outer label.
- **Styling hooks**: secondaryText; label/labelPosition for outer alternative.
- **Pairs well with**: compact card KPIs.
- **Marker**: neutral

### gauge_icons.png
Tier override A→B: cropped component demo strip, not a full page.
- **Produces it**: primaryText: a!gaugeIcon("users"|"cube"|"flag") + secondaryText: "252 of 336" (INFERRED)
- **Looks like**: three gauges — #316598 icon replaces the number over "x of y" #767676 (both est.); fills 75%/64%/33% match 252/336, 7/11, 1/3 (OBSERVED).
- **Use when**: multi-gauge rows needing category recognition | **Avoid when**: exact value is primary (icon demotes it to secondaryText).
- **Styling hooks**: icon, altText, secondaryText.
- **Pairs well with**: 3-up dashboard rows (INFERRED).
- **Marker**: neutral

### Page rollup
Default choice for most cases is a!gaugePercentage() — or a!gaugeFraction() when the completed-of-total count is the natural unit — with default ACCENT color and a short label, because the page defines primary text as "the underlying value that the gauge ring represents": percentage/fraction map value→arc directly, while Icon deliberately trades the value's prominence for an eye-catching marker. Label via in-ring secondaryText; move to an outer label when text needs space.
