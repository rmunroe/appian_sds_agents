# Analysis batch 24

You are an expert UI/UX analyst reverse-engineering the Appian SAIL Design System example images.
Work from repo root: /home/robert/Development/appian_sds_agents

## Protocol (follow exactly)
1. Read `pipeline/templates/CONVENTIONS.md` — vocabulary, evidence marks, skeleton notation, density scale.
2. Read the template(s) you need: `pipeline/templates/tier-a-template.md` for tier A,
   `pipeline/templates/tier-bcg-template.md` for tiers B, C, and GIF.
3. For EACH page below: read its page text, then Read each image listed (they are real image files —
   look at them carefully), then write ONE analysis file per page at the given path.
4. The `tier` column is a suggestion from dimensions/markers. Override with judgment: a full-page UI
   screenshot = tier A even if smaller; a cropped fragment = tier B even if large. Say when you override.
5. For GIFs: Read the extracted frame PNGs listed (corpus/images/frames/...), not the .gif itself.
6. Group tier-C images into DO/DON'T pairs when they are siblings under the same heading.
7. Evidence discipline: OBSERVED / INFERRED / CODE-VERIFIED marks as per conventions. Hexes for every
   color claim (est. suffix when pixel-guessed). No vague adjectives without the concrete choice.
8. Word budgets: tier A ≤1000 words/image; tier B ≤60 words/variant; tier C ≤120 words/pair; GIF ≤120 words.
9. Structure each analysis file: `# Analysis: <page>` then one `## <image-filename>` section per analyzed
   image (or per DO/DON'T pair, or per GIF interaction), using the tier template fields.
10. Your final message: just list the analysis files written and any images you skipped with reasons.


### Page: `ux-event-history-list` (section: components)
- Page text: `corpus/pages/ux-event-history-list.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/ux-event-history-list.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| eventHistoryCommentsExample_24-4.png | 1423x804 | A | neutral | ds-images/eventHistoryCommentsExample_24-4.png | Comment list |
| eventHistoryListPreviewExample.png | 1999x933 | A | neutral | ds-images/eventHistoryListPreviewExample.png | Preview list |
| eventHistoryList_cardPadding.png | 1674x734 | A | neutral | ds-images/eventHistoryList_cardPadding.png | Preview list |
| eventHistoryList_fullPreviewCorrect.png | 1999x1055 | C | do | ds-images/eventHistoryList_fullPreviewCorrect.png | Full list |
| eventHistoryList_fullPreviewIncorrect.png | 1999x1011 | C | dont | ds-images/eventHistoryList_fullPreviewIncorrect.png | Full list |
| eventHistoryList_initials.png | 952x672 | A | neutral | ds-images/eventHistoryList_initials.png | Initials |
| eventHistoryList_none.png | 952x672 | A | neutral | ds-images/eventHistoryList_none.png | None |
| eventHistoryList_profilePhoto.png | 952x672 | A | neutral | ds-images/eventHistoryList_profilePhoto.png | Profile Photo |
| eventHistoryList_timelineExample.png | 1999x957 | A | neutral | ds-images/eventHistoryList_timelineExample.png | Timeline |
