# Mobile

Preview every interface at phone/tablet widths in the designer before shipping
(ux-mobile-considerations). Phones always render site pages full width, whatever the page-width
setting.

## What flattens automatically
- **Columns** → one vertical stack on phones (default `stackWhen: {"PHONE"}`): first column's
  contents, then the next. Audit that a straight top-to-bottom read still makes sense; if meaning
  depends on fields sitting beside each other, use a side-by-side layout or restructure. Tune
  breakpoints via `stackWhen` (`"TABLET_PORTRAIT"`, `"TABLET_LANDSCAPE"`, `"DESKTOP_NARROW"`,
  `"NEVER"`, …).
- **Button layouts** (iOS/Android app) → single full-width column, primary buttons ABOVE secondary.
  Check labels read as a ranked stack; SOLID vs OUTLINE carries the ranking.
- Stacking order = source order: put the persona's #1 zone first in code, since a 3-column dashboard
  becomes ~9 stacked zones deep on a phone (ipad_site_pages risk note).

## a!isPageWidth idioms (corpus-proven)
- **Shed decoration**: hide empty rails/spacer columns — `showWhen:
  not(a!isPageWidth({"PHONE","TABLET_PORTRAIT"}))` (real-estate-property-list rail; nonprofit
  dashboard ghost spacer).
- **Swap variants**: whole phone-variant blocks gated by `if(a!isPageWidth({"PHONE"}), …)` — the
  insurance agent home ships a separate phone agenda list beside its desktop calendar; the lists
  pattern ships a complete non-pane fallback for PHONE/TABLET_PORTRAIT (`a!isPageWidth` ×38);
  sustainability dashboard carries 41 forks.
- **Retune values**: billboard height `if(a!isPageWidth({"PHONE"}), "TALL_PLUS", "EXTRA_TALL")` and
  phone-only scrim (conference-home-page, CODE-VERIFIED); H1 size and image width
  (nonprofit-fundraise-campaign-overview); button align `if(a!isPageWidth(…), "START", "END")`;
  responsive padding/margins (ins-agent-home-page).
- **Grids on phones**: swap list-style `"AUTO"` column widths for fixed widths sized to content —
  `if(a!isPageWidth({"PHONE"}), fixed widths, "AUTO")` on `a!gridColumn`; give the identity column
  ≈70% of the phone viewport; measure by rows-per-screen (16 vs 8 in the tabular-data-display
  DO/DON'T).

## What to avoid on narrow screens
Width-hungry components force horizontal scrolling (wrapping_and_scrolling DON'T): milestones with
many steps; grids with many columns. Trim steps/columns or switch pattern. Keep labels and
instructions concise — wrapping is the first mobile failure.

## Touch targets
Cards and card-styled radio/checkbox choices give large tap targets (ux-card-layout); wizard answers
as full cards, not radios (ux-designing-for-your-users). Stack LARGE, `width: "FILL"` buttons on
phone flows (mobile-incident-reporting). Interactive charts need taller heights for drill-down
targets (ux-charts). Phone numbers in read-only Text/Paragraph components auto-linkify to tap-to-
dial on iOS/Android — keep them there and label each ("Mobile"/"Office").

## Sites on phones
- Mobile-first sites: ≤5 pages or page groups. On iOS the 5th slot becomes a **More** menu (6th+
  pages lose visibility — test what lands there); Android scrolls tabs horizontally; iPadOS 18 shows
  site pages in a floating tab bar. Page groups are not supported in offline mobile.
- Page titles: 1–2 words + a distinctive icon per page — verbose titles truncate in the phone tab
  bar ("My Assigned Di…", mobileSiteTabs DON'T).

## Portals
`a!isNativeMobile()` does NOT work in portals — adapt with `a!isPageWidth()` plus `stackWhen`
(ux-portals). Portal page width is equivalent to "Full", so test narrow widths explicitly.
