# Styled Icons (a!richTextIcon)

The standard icon set, usable in rich text display, button, stamp, and section layout components, and on site and portal pages; the source page is a searchable catalog of icon names, so the usage rules below are distilled from icon idioms across the component corpus. Reach for an icon to add recognition speed beside a label; NOT when no glyph accurately maps to the meaning (drop to label-only) or as a replacement for text.

## Variants

One icon vocabulary, three corpus roles:

- **Inline glyph in rich text** — `a!richTextIcon` beside `a!richTextItem` text: gray outline icons #727272 (est.) leading rating rows, SMALL blue glyphs leading link lists (services portal).
- **Navigation/action scent** — the `icon` slot of `a!tabItem` (always with a label) and record-action displays "Label and Icon" / "Icon Only"; record-action icons are configured on the record type.
- **Card anchor** — a large accent-colored glyph centered in a clickable card: teal #0c8b99 (est.) icons on the expense hub's action cards, blue #316598 (est.) icons on the portal's six category cards.

## Styling hooks

- `color:` — theme color or hex. Corpus discipline: one hue for every icon on a page (#316598 (est.) across the whole services portal) so a single semantic outlier (its lone green NEW tag) can pop; gray icons where the adjacent word carries POSITIVE/NEGATIVE color.
- `size:` — SAIL size ladder; observed ≈MEDIUM_PLUS as card anchors, SMALL inline with links. (Params as used in corpus analyses — INFERRED; the icon pages carry no SAIL source.)
- Glyph choice comes from the searchable standard-icon table; keep metaphors consistent within one bar or list.

## Idioms

1. Icon + word + verdict (Location Details DO, rich-text page): gray outline icon (book/bus/shield), STRONG label, then `a!richTextItem(text: "Good", color: "POSITIVE", size: "MEDIUM")` — the icon adds scent, the word carries the fact, color amplifies. See [Rich Text](rich-text.md).
2. Icon-led action cards (expense dashboard, record-actions page): large teal glyph + label per card, ≥2 sibling cards so clickability reads; a lone icon card looks like a panel.
3. Overflow ellipsis (record-actions grid): the ⋮ icon-only menu is the one sanctioned label-free icon — a convention so familiar the idiom itself is the label; use it only in the tightest grids, prefer the labeled "ACTIONS ▾" menu when discoverability matters.

## Top don't

Never let an icon replace its label. The tab-layout corpus rates icon-only tabs severity-always: a bare person glyph could mean profile, users, or contacts, and screen readers get nothing. Same rule for record actions — "Icon Only" is reserved for tight, repetitive contexts with unmistakable metaphors, and paired with the Links style it is explicitly warned as too small to notice. Icons help when they repeat beside labels (rows, tabs, cards); they clutter when they carry meaning alone or mix metaphors.
