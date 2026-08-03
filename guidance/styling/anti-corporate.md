# The Anti-Corporate Playbook

Why this file exists: left to defaults, Appian apps converge on the same page — white background,
gray page title, a stack of bordered boxes with visible labels, a blue grid, maybe a pie chart. It is
functional and utterly forgettable. The SDS inspiration corpus proves the same platform can produce
a cream editorial conference site, a plum command-center dashboard, and a pastel-chip agent cockpit.
The difference is never one big thing — it is 3–6 deliberate moves. This file defines the mush, the
moves, and the minimum bar.

## What "corporate mush" is (the diagnosis)

You are building mush if most of these are true:
- Pure white page under bordered cards, every card with a visible label.
- The default gray page title as the biggest text on screen.
- Blue-gray everything: theme-default blue links, blue buttons, blue charts, no committed hue.
- Color used decoratively (a little blue here, a little green there) instead of semantically.
- A grid as the first answer to every data-display question.
- Every zone the same density; every margin STANDARD; nothing big, nothing small.
- Stock-photo imagery (handshakes, glass buildings) or no imagery at all.
- Five buttons of equal weight.

## The minimum-moves rule

**Every page ships at least 3 signature moves from the menu below** (a recipe's own signature moves
count). Declare them in the Design Brief. Fewer than 3 = you built mush; more than 6 = you may be
building noise.

### The menu of signature moves

**Canvas & structure**
1. Tint the canvas: `headerContentLayout(backgroundColor:)` in a brand-tinted neutral (#f4f2f1,
   #F0F6F7, #f8f6f0…) with white shadow cards floating on it — never bare white-on-white.
2. Full-bleed band architecture: stack self-colored cards in the header slot with
   `contentsPadding:"NONE"` — brand slab → content band → dark footer slab.
3. Card-in-card brand band: white outer card `padding:"NONE"` wrapping a brand-hex card
   `padding:"MORE"` = full-bleed color header without touching site config.
4. Two-surface illusion: `header:{}` + `contentsPadding:"NONE"` + one full-bleed wrapper card in a
   tint, so the page reads as designed surface, not scrolling document.
5. Go dark: page + cards from one scheme token (`PLUM_SCHEME`) or a tonal pair (#333F48/#394c5a) —
   flat filled cards, no borders, no shadows.

**Color discipline** (these read as craft precisely because they subtract)
6. One-hue monopoly: a single brand hex does header, tag, and accent (#1155cc pattern) — delete every
   other saturated use.
7. Hue-as-ramp: pale tint background + deep text + bright accent of ONE hue (#dbf1d3/#274e13/#47b311)
   instead of a multi-color palette.
8. Ration alarm: NEGATIVE red appears in exactly one place (the OVERDUE tag, the one bad delta).
9. Accent = interactivity: the accent color appears only on tappable/selected things (consumer flows).
10. Entity color-coding: stable pastel/duotone chip colors per entity or action type (blue person,
    plum vehicle; blue download, green link) — color as vocabulary, not decoration.

**Type & data display**
11. Demote labels, promote values: SMALL/SECONDARY all-caps eyebrows over MEDIUM_PLUS/STRONG values —
    the answer is the interface.
12. Kill the page title: let a greeting, a hero, or the KPI numbers be the biggest thing (dashboards
    often need NO title at all).
13. Hand-build the KPI: value + MICRO sparkline in one card; or caps-label/icon/value columns with
    dividers — never a bare number floating in a bordered box.
14. One scan line per fact pair: amount+date, price+age share a single sideBySide row with
    `width:"MINIMIZE"` right-pinning.

**Imagery & texture**
15. Art-directed billboard with `fullOverlay` — and match the page background to the photo's
    temperature; scrim only on phone.
16. Photo-first cards: image flush to card top (`padding:"NONE"`, ROUNDED) with status tags overlaid
    on the photo itself.
17. Styled-icon stamps as the illustration system: TINY/SMALL colored `stampField` chips instead of
    photos when photos would be filler.
18. One hand-drawn/flat illustration, background-matched so it floats (hide it on phone).

**Interaction affordances**
19. Whole-card links (`cardLayout(link:)`) with shadow — not bordered rows with "View" buttons.
20. Choice cards (`cardChoiceField`) with icons instead of radio buttons/dropdowns for ≤6 options.
21. Segmented control from `tagField` + `dynamicLink` + conditional accent fill.
22. Designed empty states: EXTRA_LARGE pale icon + generous padding + helpful sentence — never a blank
    region or a hidden section.
23. Hand-built stepper/timeline from stamps + connectors — progress answers "where am I / how long?".

## Restraint clauses (what keeps moves from becoming noise)

- Every move must be *assignable to a reason* (brand, task speed, state clarity). If you can't say
  why, cut it.
- Typography: at most 2 display-size moments per screen; if everything is big, nothing is.
- Never mix border-cards and shadow-cards in one view; pick the recipe's treatment.
- Charts: strip axis chrome at small sizes; custom colorScheme must come from the recipe's series
  hues, not defaults + extras.
- Accessibility floor: text on tinted fills keeps ≥4.5:1 contrast; color-coded state gets a redundant
  encoding (weight, icon, or text) every time.

## The swap test (self-check before shipping)

Describe your page's user to yourself, then ask: *"Could this exact page ship for a different persona
in a different industry without anyone noticing?"* If yes, you haven't designed anything yet — return
to the recipe and spend your 3 moves.
