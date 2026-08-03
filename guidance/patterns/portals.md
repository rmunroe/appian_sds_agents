# Portals

Structural rules for public-facing pages served to users outside your organization — anonymous or
lightly-authenticated consumers on unknown devices, in unknown locales and time zones.

## When this pattern

- The audience isn't logged in (or barely is): you cannot read their language, time zone, or
  device, and they "will likely access your portal from many different locations on many different
  device types" (official).
- Visits are rare and purposeful: report something, check something, register, self-serve.
- It governs whole-portal structure *and* any page rendered in one. Combine it with
  [visitor landing pages](landing-pages-visitor.md) (the brand-first front door is usually a
  portal page) and the [shopping journey](shopping-journey.md) non-retail variants (directory and
  gated config are portal staples).

Nearest alternatives: [Employee home pages](home-pages-employee.md) — internal, recurring,
authenticated users · authenticated sites/record views — a real user profile exists, so locale and
time zone come free and these rules relax.

## Anatomy

**Triage portal** (anonymous, urgent; the official responsive-design example — OBSERVED, no SAIL):
```
BILLBOARD full-bleed photo, dark
├─ logo (top corner)
├─ PANE[left ≈40%]: TITLE + 1-line intro
│  └─ (caption line → SOLID full-col-width BUTTON with icon) ×3, ordered by urgency
└─ FOOTER band: logo + link COLUMNS [1:1]     ← absorbs every non-urgent task
```

**Consumer self-service home** ([my-health-site](../case-studies/my-health-site.md);
CODE-VERIFIED):
```
HEADER-CONTENT
├─ CARD(header slot = full-bleed brand band):
│    SBS [avatar | H1 greeting + meta row | 1 SOLID CTA] alignVertical=MIDDLE spacing=SPARSE
└─ PANE[left NARROW_PLUS | center AUTO] showPaneDividers=false  ← tint alone separates panes
   ├─ SECTION time-ordered items → CARD ×3 + centered OUTLINE view-all button
   └─ SECTION categories → CARD(padding NONE: TABS ×6
        → CARD-GROUP cardWidth=NARROW_PLUS tiles, decorativeBar START + chevron)
```

Zone-by-zone: an identity/orientation band comes first (logo or greeting — confirms "right place /
right person"); the action zone is sized to the intent count (3 captioned buttons, or 1 SOLID CTA);
reference content splits into panes (time-ordered logistics in the narrow rail, categorical
drill-downs in the wide pane); a fat footer takes everything else. Above the fold: title + *all*
primary actions, on desktop and phone alike (the triage example shows both frames with identical
content).

## Variants

- **Triage** (anonymous, 1–3 urgent actions): caption + button pairs replace explanatory
  paragraphs; no nav bar; density 1.
- **Directory** (anonymous, many services): header band + category rail + icon-tile shelf — the
  [shopping journey](shopping-journey.md) non-retail directory skeleton; density 2.
- **Consumer account home** (light auth): personalized masthead band + pane split, tabbed
  categorical tiles; density 3.
- **Informational home** (anonymous, brand education): hero + full-bleed bands — the
  [visitor landing](landing-pages-visitor.md) informational variant
  ([portal-home-page](../case-studies/portal-home-page.md)).

Selection: count intents and auth level — urgent few → triage · many services → directory ·
known consumer → account home · "learn about us" → informational.

## Component roster

[header-content-layout](../components/header-content-layout.md) (header slot as masthead) ·
[billboard-layout](../components/billboard-layout.md) (full-bleed hero) ·
[pane-layout](../components/pane-layout.md) (rail + main split, dividers off) ·
[card-layout](../components/card-layout.md) (band masthead, list cards, drill-down tiles) ·
[buttons](../components/buttons.md) (captioned SOLID triad; single CTA) ·
[tab-layout](../components/tab-layout.md) (category switcher inside a flush card) ·
[columns-layout](../components/columns-layout.md) (footer link columns, stacking) ·
[images](../components/images.md) (avatar/logo).

## Layout decisions by data shape

The defining shape is what you *don't* have — no user record:

- **Times**: for any component that displays or asks for a time, always show the portal's zone —
  "10:15AM – 11:30AM (EST)" — because an anonymous viewer's zone is unknowable (official rule).
- **Locales**: multilingual portals provide per-locale links built with `a!portalUrlWithLocale()`
  in a safe link component; switching reloads the portal and swaps date/time fields, LTR/RTL
  direction, translation strings, and system-text components (official). Keep the switcher
  persistent (header links; active = underline), full-page reload, not an in-place toggle.
- **Width**: a portal page renders at the equivalent of a site page's "Full" width (official) —
  cap and center content (a centered WIDE_PLUS column, or a ≈40% action rail) so ultrawide
  screens don't stretch it shapeless.
- **reCAPTCHA**: its icon always renders at the bottom-right corner — center bottom-of-page
  content with white space on either side so it never covers a submit button (official).
- **Header**: single-page portals can enable the HEADER BAR layout option for a fixed header;
  multipage portals always have the navigation bar, which also unlocks branding options (official).
- **Intent count**: 1–3 → triage buttons · ~4–10 services → tile shelf + rail directory ·
  per-user records → account-home panes with 5–10-item lists and a view-all escape.

## Mobile behavior

- `a!isNativeMobile()` does **not** work in portals (they never display in the Appian Mobile
  app); branch on `a!isPageWidth()` only, and use `stackWhen` on columns and side-by-side layouts
  (official).
- Phone rendering preserves the desktop stack order at 100% width: logo above title, then
  caption + full-width button pairs in the same sequence (triage example, both frames).
- Design the phone stack first; desktop adds breathing room (outage reporters and form fillers
  are disproportionately on phones).
- Wide tab strips (6 tabs on the consumer home) crowd at tablet widths — plan overflow or fewer
  tabs.

## Top 3 don'ts

1. **Don't display a bare time.** Server-zone values masquerade as local time for anonymous
   users. Zone-suffix every displayed and collected time, everywhere.
2. **Don't branch on `a!isNativeMobile()`** — it is dead code in portals. `a!isPageWidth()` +
   `stackWhen` are the only responsive levers.
3. **Don't park content in the reCAPTCHA corner or add chrome nobody asked for.** Keep the
   bottom-right clear of submit buttons; skip the hamburger nav — the corpus boring twin is a
   white page with a menu "nobody anonymous needs" while the three real tasks hide in card chrome.

## Exemplars

| case study | what to steal |
|---|---|
| [portal-home-page](../case-studies/portal-home-page.md) | Full-bleed band structure under `contentsPadding:"NONE"`; nav as transparent card-tabs inside the hero |
| [my-health-site](../case-studies/my-health-site.md) | Header-slot card as an instant masthead; card-group drill-down tiles with decorative bars + chevrons; tint-only pane separation |
| [conference-registration-portal](../case-studies/conference-registration-portal.md) | Persistent locale switcher rail; brand (NARROW_PLUS) vs task (WIDE) column split |
| [ins-quote-review](../case-studies/ins-quote-review.md) | Consumer status-check portal: drill-in link-cards with trailing chevrons; full-bleed header banding |
