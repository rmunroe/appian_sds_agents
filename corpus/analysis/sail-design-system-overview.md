# Analysis: sail-design-system-overview

Page context: "SAIL Design System Overview" (section: overview). One animated GIF under "SAIL UI framework" demonstrating components + expressions producing a working app. Frames analyzed from `frames/` (coalesced).

## insurance_quote_demo.gif

### Interaction: End-to-end insurance quote funnel (gif: insurance_quote_demo.gif)
- **State chart**: 1) INSURECORP landing — blue header #2726dd est., hero + ZIP field, checkerboard photo/blue coverage panels (OBSERVED). 2) ZIP "20000" typed, GET STARTED (OBSERVED). 3) Wizard "Bundled Savings": vertical 6-step milestone rail (blue done/current circles, gray future), Auto card pre-selected with checkmark, add-on card choices, "NEXT: ABOUT YOU" solid button (OBSERVED). 4) "About you" form + pale-blue reassurance banner (OBSERVED). 5) Quote: $113.50/Month, PURCHASE NOW / SAVE FOR LATER, summary rows — 3 discounts ($42.90/mo green), 1 vehicle, 1 driver, expandable Coverage with per-line EDIT (OBSERVED).
- **SAIL mechanism**: wizard step advance with persistent milestone nav; expandable summary rows (INFERRED)
- **UX purpose**: orientation — components+expressions become a polished consumer funnel
- **Replicate when**: public quote/application funnels needing visible progress + labeled forward buttons | **Cost**: high — multi-step state, validation, edit-backtracking
