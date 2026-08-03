# Secondary Navigation

## When this pattern
Escalate through three tiers; stop at the first that fits.

1. **Site/portal navigation bar** (object config, not SAIL) is level-1 nav. Header Bar when
   top-level pages fit one scannable row (≤8 items, ≤5 mobile-first) and content wants full width;
   Sidebar for many pages/page groups (vertical scanning, inline group expansion). Fold overflow
   into page groups.
2. **`a!tabLayout`** for basic in-page secondary nav — the official default ("we highly encourage").
3. **Manual patterns (this doc)** only for what built-ins lack: URL-parameter deep links to a tab,
   tabs fused into a full-bleed brand band, rail + custom-header combos, secondary + tertiary
   levels under site tabs, icon-only or collapsible rails.

Vertical vs horizontal (page-text rule): **vertical** when >6 tabs, multiple sub-levels, or long
labels; **horizontal** when <7 tabs and horizontal space should go to content. Nearest alternative:
a button-toggle bound to a URL parameter switching panels inside one view (bookmarkable, per the
corpus tab-URL demo).

## Anatomy
Canonical vertical rail (all vertical variants share this skeleton; only card fills differ):

```
HEADER-CONTENT
└─ COLUMNS [NARROW:AUTO]
   ├─ PANE[left] rail: CARD-row ×n ("❘"+label, link, padding NONE) + filler CARD(height EXTRA_TALL)
   └─ PANE[center] SECTION "<page title>" + page content
```

- **Rail zone**: wayfinding only — no actions, no content. Each row is
  `a!cardLayout(showBorder: false, padding: "NONE"–"EVEN_LESS", marginBelow: "NONE",
  link: a!dynamicLink(...))` wrapping `a!sideBySideLayout(alignVertical: "MIDDLE", spacing:
  "DENSE")` of a rich-text "❘" bar glyph (LARGE) + label (MEDIUM). CODE-VERIFIED core trick: the
  bar flips between accent and row background color (invisible spacer), so selection never shifts
  alignment. `marginBelow: "NONE"` fuses same-fill cards into one band; the
  EXTRA_TALL filler runs it to the fold. Card-level links give full-width click targets.
- **Content zone**: opens with an on-page title (`a!sectionLayout(labelHeadingTag: "H1")` or the
  heading field) — the rail highlight alone never names the page.

Canonical horizontal manual tabs:

```
HEADER-CONTENT
├─ header: CARD(brand fill, title, padding MORE)
│  └─ TABS ×n = COLUMNS of NARROW cells: CARD(label) over CARD(underline strip, padding EVEN_LESS)
└─ contents: wrapper CARD swapped by selection
```

Each tab cell is two stacked borderless cards: label card plus thin underline card whose fill flips
selected-accent ↔ band color (invisible twin — no reflow on switch). Tabs sit *inside* the brand
band, inheriting its identity. State lives in `local!selectedTab` (`a!forEach` over an `a!map`
list; `choose()`/`match()` swaps contents), or in a URL parameter for bookmarks.

## Variants
**Vertical family — a prominence ladder (same row markup; only fills change):**
- **Basic**: rows background-matched to the page — nav reads as pure text; selection = bar +
  STRONG. Default for white or card-canvas pages.
- **Sectioned**: non-clickable header rows (STRONG, caps via `upper()`) partition groups of ≤4
  items. Use at ~7+ pages. Palette lives in ~3 locals — retheme by config, not markup.
- **Contrasting rail**: rows share a fill contrasting the page background; full height via filler.
  Selection = muted→full text ramp + STRONG + bar (value contrast, no accent needed).
  `color: "STANDARD"` auto-inverts on dark fills — pick clearly dark or clearly light fills, never
  mid-brightness. Only when all/most pages carry the rail (page-text consistency caveat).
- **Prominent selected**: contrasting rail whose selected card *style* floods with the accent (one
  `if()` on card style is the whole state). Use when the page outranks the site tab, or content is
  dense enough to drown a bar-only cue.
- **Icon-only**: `EXTRA_NARROW` column of centered `a!richTextIcon` cards, `tooltip:` on every
  card, selection = flood-filled cell (the only state legible at glyph width). Expert
  daily-operators only (page text warns off occasional users).
- **Collapsible**: parallel `NARROW` labeled / `EXTRA_NARROW` icon columns toggled by
  `showWhen: local!navExpanded` via «/» link-cards. Costs double authoring of every item.
- **Two-level**: `EXTRA_NARROW` icon rail (app areas) + `NARROW_PLUS` labeled panel (section
  views); with site tabs that is secondary + tertiary. Surfaces darken with generality (darkest
  rail → light panel → neutral canvas); one accent hue marks selection at both levels;
  area-scoped create button (`width: "FILL"`) in the panel.
- **Header combos** (placement encodes hierarchy): full-width custom header *above* the rail when
  all nav pages are sub-views of that header's area (area actions live in the band); full-height
  contrasting rail *beside* the content pane when each page brings its own header — the rail
  peers with pages, not under one.

**Horizontal family:**
- **Manual card tabs**: label+underline cell stack inside the brand band (above). Crisp, zero-shift
  selection; degrades past ~6 tabs.
- **Framed tabs**: selected tab card shares its fill with the content frame card and takes
  `decorativeBarPosition: "TOP"` + `decorativeBarColor` accent; unselected tabs keep an invisible
  background-matched top bar so all cells hold height. The tab merges into the frame — a folder
  metaphor from two card params. A trailing spacer column keeps cells compact on wide screens.

**Selected-state toolbox** (always double-code — pair a color move with weight/geometry):
bar glyph + STRONG (quiet) → text ramp on dark fill → underline flip → decorative-bar + shared-fill
merge → full-row flood (loudest). Site-object level: underline highlights need contrast against
the bar; block highlights (Helium tabs, sidebar pills) may stay monochrome only if shifted several
brightness steps. Reserve one hue for "you are here". Screen readers: append "(Selected)" to the
`a!dynamicLink` label and set `accessibilityText` (CODE-VERIFIED move).

## Component roster
- [cardLayout](../components/card-layout.md) — rows, tab cells, filler, frame; `link`, `tooltip`,
  `decorativeBarPosition/Color`, `padding`, `marginBelow`
- [dynamicLink](../components/buttons.md) — whole-card links; `saveInto: local!selectedTab`
- [sideBySideLayout](../components/side-by-side-layout.md) — bar glyph + label rows
- [richTextDisplayField](../components/rich-text.md) — labels, bars, icons; `preventWrapping`
- [columnsLayout](../components/columns-layout.md) — rail widths vs `AUTO` content; spacers
- [headerContentLayout](../components/header-content-layout.md) — page shell, header band slot
- [sectionLayout](../components/section-layout.md) / heading field — on-page titles (H1 tag)
- [tabLayout](../components/tab-layout.md) — the built-in to prefer when none of this is needed

## Layout decisions by data shape
- **Item count**: ≤6 short-label peers → horizontal; 7+ → vertical; ~9+ → sectioned vertical
  (groups of ≤4); two independent tiers → icon rail + panel.
- **Rail widths (corpus-observed)**: labeled rail `NARROW` ≈ 1:5.5–6.5 against `AUTO` content;
  icon rail `EXTRA_NARROW` ≈ 1:26; two-tier `EXTRA_NARROW + NARROW_PLUS + AUTO` ≈ 1:5:22 (both
  tiers ≤ ~25% width).
- **Row pitch**: `padding: "NONE"` ≈ 44px rows (dense); `"EVEN_LESS"` for taller touch targets;
  section headers `"LESS"`.
- **Label length**: long labels force vertical (`NARROW` caps drift); contested width + expert
  users → icon-only or collapsible.
- **Content density**: rails suit density 2–4 content; flood-fill selection is for dense pages —
  on calm ones it permanently drags the eye (page text scopes it).
- **State shape**: transient switching → `local!selectedTab`; shareable views → bind selection to
  a URL parameter (one binding per tab group).

## Mobile behavior
- Site chrome is free: the header bar auto-collapses to a menu; the sidebar is user-collapsible.
  Keep page names short so collapse isn't premature.
- Manual rails live in `a!columnsLayout`: on narrow widths the rail stacks above content as a
  plain link list — fine for short rails; prefer `a!tabLayout` or horizontal tabs for mobile-heavy
  audiences. Rails also shrink content width, tripping `stackWhen` sooner.
- Framed/manual tabs: guard spacer columns with `a!isPageWidth("TABLET_LANDSCAPE"…)`;
  `preventWrapping` on labels; expect cell compression below tablet-landscape.
- Tooltips never fire on touch — icon-only rails lose their labels entirely there; ship labeled or
  collapsible variants to touch-first audiences.
- Rows of 5+ tab cells wrap poorly on tablet; drop the spacer and let cells reflow.

## Top 3 don'ts
1. **Don't box the nav.** No bounding card, border, or divider behind a rail on card-based pages —
   render rows directly on the canvas, background-matched. A boxed rail adds a third surface level
   competing with content cards (the corpus's recurring boring twin).
2. **Don't hang selection on one weak cue.** A same-brightness fill shift, hue-only label change,
   or hairline underline vanishes exactly where it's needed. Always two cues: fill/bar/underline +
   STRONG weight; keep highlight and background several brightness steps apart.
3. **Don't let the nav be the only page identifier.** The highlight names the group/tab, never the
   page — open every destination with a matching on-page title (severity: always, per page-group
   guidance). Corollary: site-tab highlight and in-page flood must not double-signal equally.

## Exemplars
| case study | what to steal |
|---|---|
| [customer-acct-management](../case-studies/customer-acct-management.md) | Built-in tab layout as account secondary nav — try this tier before any manual pattern |
| [my-health-site](../case-studies/my-health-site.md) | Tab layout as a page's main navigation (named in page text) |
| [restaurant-order](../case-studies/restaurant-order.md) | Tab layout switching smaller in-page sections |
| [university-student-dashboard](../case-studies/university-student-dashboard.md) | Framed-tab kin: dark canvas matting a light frame; decorative-bar state cues |
