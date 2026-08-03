# Analysis: ux-tab-layout

Page: `corpus/pages/ux-tab-layout.md` (section: components). No SAIL source on page — all colors pixel-estimated. A shared demo palette runs through every light-mode crop: accent indigo #2322f1 (est.), label ink #212121 (est.), inactive divider #eeeeee (est.), white ground #ffffff.

## tab-layout-overview.png

Tier A per batch, kept — but note this is an annotated anatomy schematic with placeholder content, not a live product UI; use-case fields below describe the teaching artifact (flagging per protocol rule 4).

### Identification
- **Image**: tab-layout-overview.png | **Source page**: ux-tab-layout | **Alt/caption**: overview of tab layout with annotations
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other (annotated component-anatomy diagram)

### Use-case reconstruction (INFERRED)
- **Persona**: Appian app designer reading component docs; occasional reference cadence
- **Domain & brand context**: Appian SAIL Design System documentation; neutral instructional brand
- **Top 3 user tasks (ranked)**: 1. Learn the names of the two structural zones 2. Map zone names to what SAIL renders 3. Recognize the selected-tab affordance
- **Implied requirements**: "Must name each anatomical zone unambiguously"; "Must show selected vs unselected tab states"; "Must stay content-agnostic (placeholder body)"
- **Data model sketch**: none — placeholder strings only ("Tab 1", "Tab 2", "Tab 1 content")

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
CANVAS #f0f0f0 (est.)
└─ CARD(#ffffff, flat, no border)
   └─ TABS ×2 ("Tab 1" selected · "Tab 2")
      └─ BOX placeholder border #d4d4d4 (est.) — italic "Tab 1 content"
ANNOTATIONS (left margin): "Tab bar" → dot at tab row; "Tab contents" → dot at body box
```
- **Above the fold**: everything (594px tall)
- **Reading order**: single-column; annotation labels pull the eye left→right along green leader lines
- **Hierarchy rationale**: annotation labels are the largest text because the figure's job is naming zones, not showing content; selected-tab underline is the only saturated element inside the card, isolating the state affordance
- **Density**: 1 — two tabs and one empty placeholder box on the whole canvas
- **Ratios & spacing**: card occupies ~79% of width, right-aligned; annotation gutter ~21%; generous padding around content box (≈50px, INFERRED padding:"MORE")

### Styling specifics (OBSERVED)
- **Palette**: canvas #f0f0f0 (est.), card #ffffff, annotation navy #020a51 (est.), annotation green #38cf7f (est.), selected underline #2321f1 (est.), inactive divider #eeeeee (est.), tab ink #212121 (est.), placeholder border #d4d4d4 (est.)
- **Color application points**: indigo only on the selected tab's underline segment; green only on annotation leader lines + dots; navy only on annotation labels; no other chrome
- **Typography moves**: annotation labels ≈ MEDIUM_PLUS bold navy; tab labels ≈ STANDARD, selected bold vs unselected regular; placeholder body italic STANDARD gray. No all-caps anywhere
- **Imagery stance**: none
- **Card treatment**: flat white, no border/shadow
- **Signature moves**: instead of arrows, dot-terminated leader lines (#38cf7f) reduce diagram noise; instead of full-width underline on the active tab, the highlight is a short segment while a hairline #eeeeee continues across — encoding "one continuous bar, one active segment"

### Component inventory (OBSERVED)
- a!tabLayout(tabs: {a!tabItem(label:"Tab 1"), a!tabItem(label:"Tab 2")}, highlightColor:"ACCENT" INFERRED) inside white container; placeholder body likely a bordered a!cardLayout standing in for arbitrary contents
- Chart types: none
- Interactive affordances: tab switching only (static figure)

### Character & judgment
- **Register**: calm-clinical, institutional — instructional figure with exactly two hues beyond grayscale
- **Why it works**: the two annotations match the page's two stated component parts (tab bar, tab contents); saturation hierarchy (indigo state vs gray chrome) teaches the affordance without prose
- **Why not boring**: green/navy annotation palette is distinct from the component's own indigo, so meta-layer and subject never blend; placeholder box keeps the figure content-agnostic
- **Boring twin**: a cropped product screenshot with red arrows and callout balloons pointing at real data — memorable content, unclear anatomy
- **What to steal**: keep annotation colors disjoint from subject palette; show selected+unselected states in the same figure
- **Risks**: #38cf7f leader lines on #f0f0f0 are low-contrast at small sizes; annotation text far from targets on narrow screens
- **Code cross-check**: none (no SAIL on page)

## tab-layout-solid-background.png + tab-layout-transparent-background.png

### Principle: Put the tab bar on a background that shows its divider
- **DO shows**: Profile / Contact Methods tabs (icons + labels, ink #212121 est.) on #ffffff; active underline #2321f1 (est.) reads as a segment of the continuous #eeeeee (est.) divider — OBSERVED.
- **DON'T shows**: identical bar on flat #efefef (est.); the #eeeeee divider is invisible (1-point delta), so the indigo underline floats unanchored and the bar loses its "row" structure — OBSERVED.
- **Rule**: ensure the tab bar's divider line has visible contrast with the surface behind it; "TRANSPARENT" over gray kills it.
- **Severity**: usually
- **Category**: color
- **SAIL implication**: place a!tabLayout on white/card surfaces; avoid transparent/gray page backgrounds behind the bar.

## tab-layout-billboard-background.png

Second DON'T sibling under "Use an appropriate background"; shares the same DO (tab-layout-solid-background.png).

### Principle: Never float a tab bar over imagery
- **DO shows**: (as above) bar on plain #ffffff with clear divider and legible labels.
- **DON'T shows**: same tabs overlaid on a busy faceted-glass photo (pastel blues/pinks, #b7b6d8/#949ebe est.); label ink sits at ~2:1 contrast against mid-tone facets, the divider renders as a stark white line, and the geometric grid competes with the underline — OBSERVED.
- **Rule**: tab bars need flat, quiet surfaces; never place them over billboard images or patterned backgrounds.
- **Severity**: always
- **Category**: color | a11y
- **SAIL implication**: keep a!tabLayout out of a!billboardLayout overlays; put it in the content region below.

## tab-layout-concise-labels.png + tab-layout-long-labels.png

### Principle: Keep tab labels to 1–2 words
- **DO shows**: "Profile" and "Contact Methods" with icons; both tabs plus full divider fit with ~70% bar width to spare — OBSERVED.
- **DON'T shows**: "Your Profile Details (Name, DOB)" and "Preferred Contact Methods (Email, Phone Number, Physic…" — the second label truncates mid-word and a right chevron appears: two tabs already overflow into scrolling — OBSERVED.
- **Rule**: parenthetical detail belongs in tab contents, not labels; long labels force truncation/scroll at any width.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: short a!tabItem label values; move qualifiers into section headings inside contents.

## tab-layout-icon-with-text.png + tab-layout-icon-only.png

### Principle: Icons accompany labels, never replace them
- **DO shows**: person icon + "Profile", envelope + "Contact Methods"; icon (#212121 est.) doubles the label's scent while text carries meaning — OBSERVED.
- **DON'T shows**: the same two tabs reduced to bare glyphs; underline marks selection but nothing says what either tab contains — a person icon could mean profile, users, or contacts — OBSERVED.
- **Rule**: icon-only tabs fail screen readers and force users to guess; always pair icon with text.
- **Severity**: always
- **Category**: a11y | labeling
- **SAIL implication**: a!tabItem(label + icon) — never omit label; icons must be meaningful and consistent across all tabs.

## tab-layout-with-sections.png + tab-layout-nested.png

### Principle: Don't nest tab layouts — demote level two to sections
- **DO shows**: inside the Profile tab, bold MEDIUM headings "Billing" and "Account Settings" each introduce a 3-card row (white cards, #d4d4d4 est. border, indigo #2321f1 est. icon left, title + gray caption); both groups visible at once — OBSERVED.
- **DON'T shows**: a second underlined tab bar (Billing / Account Settings) stacked directly under the first; two identical selected-underline treatments read as one duplicated control, and the second group's cards are hidden — OBSERVED.
- **Rule**: one tab bar per screen; render sub-groupings as stacked sections.
- **Severity**: always
- **Category**: layout
- **SAIL implication**: a!sectionLayout headings inside a!tabItem contents instead of an inner a!tabLayout.

## tab_orientation_vertical_do.png + tab_orientation_horizontal_dont.png

### Principle: Go vertical when all tab labels must stay visible
- **DO shows**: 7 labels (Profile Info … Device Management) in a column; selected "Profile Info" bold with a ~3px #2322f1 (est.) left edge bar; every label visible (crop shows the NARROW tab column only, content area cropped out) — OBSERVED.
- **DON'T shows**: same 7 tabs horizontally: only 6 fit, "Device Management" hidden behind a scroll chevron; nothing indicates how many more exist — OBSERVED.
- **Rule**: past ~5 tabs or long labels, horizontal scroll hides options; vertical shows all (wide containers only — auto-switches horizontal on phones).
- **Severity**: contextual
- **Category**: layout | density
- **SAIL implication**: orientation:"VERTICAL"; note both crops contain typo "App Languge" (OBSERVED).

## tab_layout_orientation_sailds.gif

### Interaction: Responsive vertical→horizontal orientation switch (gif: tab_layout_orientation_sailds.gif)
- **State chart**: wide dark-mode "Account Settings" (bg #1e1e24 est., accent #5a6afc est., asterisks #ed474b est.) with vertical tabs — Account selected (white label, indigo left bar) over a 3-field form panel #32363c (est.) → viewport narrows → below phone breakpoint tabs re-render as a horizontal row across the top, content goes full-width, "Email Address" label wraps and its value truncates (f31) → widening restores vertical — OBSERVED f0/f31; f15/f47/f62 are unreadable GIF delta frames.
- **SAIL mechanism**: other — built-in responsive fallback of orientation:"VERTICAL" (automatic, no showWhen)
- **UX purpose**: orientation
- **Replicate when**: any vertical-tab page that must survive phones — free, automatic | **Cost**: none to build; verify label truncation at the breakpoint.

## tab_layout_tabwidth.gif

### Interaction: Tab Width Minimize↔Fill toggle (gif: tab_layout_tabwidth.gif)
- **State chart**: interface designer split view; canvas shows a "Menu" page with 5 horizontal tabs (Appetizers selected, underline #2522f0 est.) hugging their labels left (Minimize) above food cards; config pane (header #32327c est., Styling tab: Highlight Color "Accent" swatch #2522f0 est.) shows Tab Width toggle Minimize|Fill → click Fill → tabs stretch to equal widths spanning the container, long labels truncate → click Minimize to revert. Fill state INFERRED from page text + delta traces along the tab-bar row; only f0 fully legible, f15–f59 are delta frames.
- **SAIL mechanism**: other — live param change (tabWidth:"FILL" vs "MINIMIZE")
- **UX purpose**: feedback (immediate canvas preview of a styling param)
- **Replicate when**: few short-label tabs should span a narrow container, segmented-control style | **Cost**: Fill truncates labels; Minimize is the safe default.
