# Tab Layout (a!tabLayout / a!tabItem)

Organizes related content into sections users navigate freely — complex forms whose sections are independent and completable in any order, dashboards with multiple views. NOT for sequential steps ([Wizard Layout](wizard-layout.md)), simple forms ([Form Layout](form-layout.md) alone), or content that should all be visible at once ([Section Layout](section-layout.md)s).

## Variants

- **Horizontal (default `orientation`)** — tab row above contents; contents padding defaults "Standard". Scrolls on overflow, hiding tabs behind a chevron with no count of what's missing.
- **Vertical** — tab column along the side at exactly "Narrow"-column width, contents fill the rest; every label stays visible. Use past ~5 tabs or with long labels; wide containers only — it auto-switches to horizontal on phone-sized screens. Contents padding defaults "None". Selected tab: bold label + ~3px accent left-edge bar.
- **Tab Width (horizontal only)** — "Minimize" (default; tabs hug label+icon) vs "Fill" (equal widths spanning the container, labels truncate) — segmented-control look for a few short-label tabs.
- **Tab item** — `a!tabItem(label, icon, contents, showWhen, validations, validationGroup)`. Labels 1–2 words, parenthetical detail belongs in contents, never the word "tab" (screen readers announce the type); icons always WITH labels, meaningful and consistent across the bar. Tab-level validations show above active-tab contents; inactive tabs get a validation icon next to the label.

## Styling hooks

- **Highlight Color**: "Accent" (default) or any hex — the selected tab's underline segment.
- **Margins**: above "None" (default), below "Standard" (default); scale None / Even less / Less / Standard / More / Even more. **Contents Padding** uses the same scale.
- **Background contrast**: the inactive divider (#eeeeee est.) needs a visible surface. On flat gray or "TRANSPARENT" over site-gray (#efefef est.) the divider vanishes and the accent underline floats unanchored; over billboard imagery, labels drop to ~2:1 contrast. Keep tab bars on white/card surfaces — never over images or patterns.
- Limit to 5–7 tabs; group content by logical relationships and workflow.

## Idioms

1. Tabs + sections instead of nesting (DO): inside the Profile tab, bold MEDIUM headings "Billing" and "Account Settings" each introduce a 3-card row — both groups visible at once, one tab bar per screen (`a!sectionLayout` headings inside `a!tabItem` contents).
2. Vertical settings nav (DO): 7 labels (Profile Info … Device Management) in a column, all visible; the horizontal DON'T fits only 6 and hides "Device Management" behind a scroll chevron.
3. Tabbed form (page's form-selection table): a tab layout inside a form layout when the form is complex and its sections are order-independent; wire per-tab `validations`/`validationGroup` so errors surface on inactive tabs as bar icons.

## Top don't

Never nest tab layouts. The DON'T stacks a second underlined bar (Billing / Account Settings) directly under the first: two identical selected-underline treatments read as one duplicated control, and the inner group's content disappears from view. Demote the second level to section headings — the DO shows both groups simultaneously with zero extra navigation.
