# Card Layout (a!cardLayout)

General-purpose container: groups content into scannable zones, wraps KPI+microchart pairs, and via `link` becomes a click target. Corpus default: style:"NONE" (white), showBorder:true + no shadow on white pages, padding "LESS"–"STANDARD", height:"AUTO", one shape per app. NOT for selectable choices — use card-styled radio buttons/checkboxes or the Card Choices component; for titled prose sections use [box-layout](box-layout.md).

## Variants

Role grammar (image63border.png): white = content, light gray ≈#f0f0f0 (est.) = dismissible guidance, ONE accent-filled card per view = promotion.
- **White content card** — style:"NONE" (default): content cards are white, full stop.
- **Semantic callout** — "SUCCESS"/"INFO"/"WARN"/"ERROR" (INFO fill #e9f1fb, border #cfdff2, est.): one-off emphasis, never the default surface.
- **Brand/hero** — custom hex: style:"#1c4587" navy tickers (CODE-VERIFIED); text auto-flips white on dark fills.
- **Transparent** — style:"TRANSPARENT": blends into any background; for cards reused across interfaces.
- **Dark-scheme tint** — "Charcoal/Navy/Plum scheme": card = lighter tint of the dark page (#2f3540 on #262b33, est.), no border/shadow.

## Styling hooks

- **style**: "NONE" (default white) / "TRANSPARENT" / "STANDARD" / "ACCENT" / "SUCCESS" / "INFO" / "WARN" / "ERROR" / "Charcoal/Navy/Plum scheme" / custom hex; 8-digit hex adds transparency (00…FF). Dark fills auto-flip text white (#20124d demo).
- **showBorder** (default true) / **showShadow** (default false): NEVER both. Decide by page bg — white → border only (1px ≈#e5e5e5 est.); transparent/tinted (≈#efeff1 est.) → shadow only; dark → neither, tint-step the card. Start pages white; go transparent only if structure is unclear, never on sparse pages (the void dominates).
- **borderColor**: "STANDARD" (default ≈#e0e0e0 est.) / "ACCENT" / "POSITIVE" / "WARN" / "NEGATIVE" / custom hex. ACCENT border = selected/current — one card among peers, never all.
- **decorativeBarPosition** "NONE" (default) / "TOP" / "BOTTOM" / "START" / "END" (START = left in LTR) + **decorativeBarColor** "ACCENT" (default) / "POSITIVE" / "WARN" / "NEGATIVE" / custom hex — ≈6px (est.) stripe. ONE position for all cards per interface (START rail: info #555a5f / error #c9243f / warn #eeb541 / success #4cba43, est., reads as one column); pull the hex from the card's icon/title hue; bar + borderColor share one color family, else leave borderColor "STANDARD"; never the sole meaning carrier (a11y).
- **padding**: "NONE" / "EVEN_LESS" ≈8px / "LESS" (default) ≈12px / "STANDARD" ≈20px / "MORE" ≈28px / "EVEN_MORE" ≈44px (all est.). "NONE" only when children bring their own spacing (idioms 2–3). Tune globally, not per card (image74.gif).
- **shape**: "SQUARED" (default, 0px) / "SEMI_ROUNDED" (≈4px est.) / "ROUNDED" (≈10px est.). One radius per interface; institutional → squared, consumer → rounded.
- **height**: "AUTO" (default, hugs content) / fixed "EXTRA_SHORT"…"EXTRA_TALL" — overflow scrolls inside; fixed equalizes rows; sparse content shows dead space.
- **Width**: no param — cards fill their container; fix via a!columnLayout(width:"NARROW_PLUS") (CODE-VERIFIED) or stretch with "AUTO"/"2X" columns.
- **marginBelow** (e.g. "STANDARD"): vertical gutter — match the columnsLayout Column Spacing so both axes agree (≈24px each, card-margins.png).
- **link** (card-as-button): a!dynamicLink etc. makes the whole card the target; contents become display-only; hover/selected state via borderColor:"ACCENT" (card_selection_example_border.png).
- KPI meaning goes in TEXT, not fill: a!richTextItem(color:"POSITIVE"/"NEGATIVE") + caret icon (the non-color cue); card stays white — whole-card green/pink tints are the DON'T.

## Idioms

1. Fixed-width KPI ticker (CODE-VERIFIED, card_width.png): empty a!columnLayout() spacers center three width:"NARROW_PLUS" columns, each a!cardLayout(style:"#1c4587", showBorder:false, padding:"STANDARD") with STRONG label + sideBySide[LARGE value | MINIMIZE caret delta color:"POSITIVE"/"NEGATIVE"].
2. Media card (CODE-VERIFIED, card_nested.png): outer a!cardLayout(padding:"NONE", shape:"SEMI_ROUNDED", link:a!dynamicLink) ⊃ [billboard](billboard-layout.md)(height:"SHORT_PLUS", marginBelow:"NONE", tag overlay) + inner a!cardLayout(showBorder:false, padding:"STANDARD") — photo bleeds to the edges, text keeps padding, one link.
3. Flush progress strip (CODE-VERIFIED, card_nested_2.png): outer padding:"NONE" ⊃ inner (showBorder:false, padding:"LESS") KPI + a!progressBarField(percentage:65, style:"THIN", showPercentage:false) riding the card's bottom edge.

## Top don't

Never put interactive components inside a card that has a `link` (severity: always, a11y). The corpus DON'T embeds a solid "VIEW DETAILS" button in an already-linked chooser card — two nested click targets that pointer, keyboard, and screen-reader users can't tell apart. Keep linked cards display-only; if per-item actions are needed, drop the card link or use Card Choices.
