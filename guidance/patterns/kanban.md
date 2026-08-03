# Kanban

Column-per-stage board for items moving through a short sequential workflow, with a paired add-item form.

## When this pattern

Signals that select it:
- Items advance through **3–5 ordered stages**, and moving them between stages is a core, daily action — not an occasional edit.
- Each item carries a small, fixed meta set: category, owner, due date, completion percentage.
- Per-stage load ("how many in each column") must be visible at a glance; a live "n / N items completed" ratio summarizes the board.
- Official guidance: the board works as a standalone page or embedded as a tab within a larger dashboard.

Nearest alternatives:
- **Task list** ([lists-and-grids](lists-and-grids.md), stacked-row variant) when status *grouping* plus a filter is enough and users don't move items as their main loop.
- **Read-only grid** ([lists-and-grids](lists-and-grids.md)) when sorting/filtering across many fields beats spatial stage placement.
- **[Calendar](calendar.md)** when dates, not stages, organize the work.

## Anatomy

```
HEADER-CONTENT isHeaderFixed contentsPadding=LESS
├─ HEADER CARD(flat, padding LESS)
│  ├─ SBS [H1 board title + "n / N items completed" SMALL : BUTTON(add, SOLID)]
│  └─ COLUMNS [1:1:1] — CARD(stage header: tinted fill, decorative TOP bar, STRONG label + count)
└─ CONTENT COLUMNS [1:1:1] (inside an EXTRA_WIDE column)
   └─ per stage, stacked CARD(item):
      ├─ row 1: category tag ⋯ arrow pair (move left / move right)
      ├─ row 2: STRONG title + SMALL secondary one-line description
      ├─ row 3: owner icon+name · due date · % (SMALL meta row)
      └─ bottom edge: progress bar, flush to card edges
```

- **Fixed header** (`isHeaderFixed:true`): stage names and counts stay on screen while long columns scroll — the orientation anchor when columns are uneven (e.g. 4/5/4).
- **Stage headers**: tinted cards with `decorativeBarPosition:"TOP"` + `decorativeBarColor` in the stage's primary hue; label and count render in the same hue. Each stage hue then repeats on **every card's progress bar**, binding cards to their column during scroll — four application points per stage (bar, tint, text, progress).
- **Item card construction**: outer `a!cardLayout(padding:"NONE", shape:"ROUNDED", showBorder:false, showShadow:true)` wrapping an inner `padding:"STANDARD"` card, so `a!progressBarField(showPercentage:false)` renders edge-to-edge as the card's bottom chrome — completion reads pre-attentively instead of as "%" text.
- **Move affordance**: `a!buttonWidget(style:"LINK", size:"SMALL")` arrow pair per card, saving stage changes via `a!save` + `a!update`. Ends are disabled with dimmed styling; tooltips name the target stage ("Move to …"). This physically encodes the adjacent-only move rule and is the accessible substitute for drag-and-drop, which SAIL does not provide.
- **Category tags**: `a!tagField` with text in the category hue and background derived from that same hue via an alpha suffix (`concat(color, "1a")` → ~10% tint) — one color source per category, guaranteed-harmonious chips under any palette.
- Above the fold: header, stage header cards, top 2–3 item cards per column.

## Variants

- **Standalone board page** (canonical skeleton above) vs **embedded tab** in a dashboard — same anatomy, hosted inside the page's tab content zone.
- **Paired add-item form** (record action launched from the board's one SOLID button):

```
FORM contentsWidth=NARROW showTitleBarDivider=false
├─ title bar: form title + secondary line
├─ CARD(ROUNDED, shadow, padding STANDARD)
│  ├─ title text field (full width, refreshAfter:"UNFOCUS")
│  ├─ description paragraph (full width, showCharacterCount)
│  └─ COLUMNS [1:1] — [category radio-cards ×4 stacked : stage dropdown (defaulted to first stage) + owner picker + due date]
└─ BUTTONS: CANCEL outline (start) ⋯ ADD solid (end)
```

Selection rules inside the form: category uses `a!radioButtonField(choiceStyle:"CARDS", choiceLayout:"STACKED", choicePosition:"START")` so all ≤5 categories are visible as large targets instead of hiding in a dropdown; `contentsWidth:"NARROW"` keeps label–field eye travel short; CANCEL is `submit:true, validate:false`.

- **Stage count**: three is canonical; columns stay equal-width `[1:1:1]` regardless of count or load — per-column counts absorb imbalance.

## Component roster

- [Header-content layout](../components/header-content-layout.md) — `a!headerContentLayout(isHeaderFixed, contentsPadding)`
- [Cards](../components/card-layout.md) — `a!cardLayout`: stage headers (decorative bar, tinted fill), nested item-card shell
- [Tags](../components/tags.md) — `a!tagField` category chips with derived tints
- [Buttons](../components/buttons.md) — SOLID add action; LINK-style arrow pair with disabled ends + tooltips
- [Rich text](../components/rich-text.md) — `a!richTextDisplayField` title/description stacking (`char(10)`), meta row icons
- [KPIs & progress](../components/kpi.md) — `a!progressBarField` as card-edge completion
- [Form layout](../components/form-layout.md) — `a!formLayout(contentsWidth:"NARROW")` add form
- [Inputs](../components/inputs.md) — card-style radios, dropdown, user picker, date field

## Layout decisions by data shape

- **Columns**: always equal `[1:1:1]`; never widen a busy stage — counts in headers carry load information.
- **Cards per viewport**: ~9 at density 3 — STANDARD card padding, `contentsPadding:"LESS"`, card `marginBelow:"LESS"`; header card padding LESS.
- **Card field budget**: tag + STRONG title + one-line SMALL description + one meta row (owner · due · %) + progress edge. Anything more belongs in the item's record view, not on the card.
- **Categories**: ≤4 tag hues; derive tints from each category's single hue (alpha suffix) rather than maintaining a second pastel palette.
- **Item count**: the corpus board grooms 13 items across 3 stages comfortably; at much higher cardinality per column, prefer a grid with a status filter — a board's value is seeing the whole flow.
- **Completion summary**: compute the header ratio live (`count(done)/count(all)`), don't hand-maintain it.

## Mobile behavior

The corpus sample codes no phone branch — this is a desktop-first pattern. When its `[1:1:1]` columns stack at narrow widths, the board degrades into sequential stage sections: keep the tinted stage-header cards (with counts) above each stack so grouping survives, and keep the fixed header for the title + add action. The paired add form is already `contentsWidth:"NARROW"` and phone-safe. If phone use is primary, prefer the task-list variant of [lists-and-grids](lists-and-grids.md) with a status filter.

## Top 3 don'ts

1. **Don't let the header scroll away.** Plain H3 column labels that scroll off leave three anonymous card stacks; `isHeaderFixed:true` + per-column counts are what keep uneven columns navigable.
2. **Don't swap the arrows for a status dropdown per card.** The boring twin's move. Arrows encode which moves are legal (adjacent only; disabled at the ends, tooltip naming the target) and give a visible, accessible action where drag-and-drop is unavailable.
3. **Don't print "%" as text or invent a separate tag palette.** Completion renders as the card's bottom-edge progress bar in the stage hue; tag backgrounds derive from the category hue by alpha suffix. Both keep state readable at squint distance with zero extra palette decisions.

## Exemplars

No tier-A case study is itself a kanban board (the pattern's own SAIL lives with the pattern); steal execution from the nearest relatives:

| case study | what to steal |
|---|---|
| [ins-agent-home-page](../case-studies/ins-agent-home-page.md) | task-card grammar at board-card scale: STRONG title, owner stamps, due-date meta row, exactly one alarm-hue tag on a neutral field |
| [ins-claim-case-study](../case-studies/ins-claim-case-study.md) | stage state encoded redundantly (fill + content color + weight + date presence) — apply the same redundancy to stage headers and cards so the board survives colorblind viewing |
| [my-health-site](../case-studies/my-health-site.md) | decorative-bar cards as category identity across a card grid (bar at START vs the board's TOP) — the same one-hue-per-category discipline |
