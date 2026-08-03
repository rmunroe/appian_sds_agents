# Record Actions (a!recordActionField)

Places record actions — related actions and record-list actions — on any interface, with built-in styling and dialog-launch behavior; the SDS recommends it for all user actions. Reach for it whenever a user starts a record action; don't hand-build button equivalents (you lose dialog behavior and on-demand security). For a page's primary action that is NOT a record action, use a button-weight component instead of the Links style.

## Variants

Seven `style` values (value spellings INFERRED from the official style names; no SAIL on page):

| Style | Look | Use when |
|---|---|---|
| `"TOOLBAR"` | small secondary buttons in one row — white, ~1px #cccccc (est.) border, uppercase gray labels | actions sit directly above the content they modify, e.g. above `a!gridField` |
| `"LINKS"` | standard link text, stacked when multiple | subtle edits in dense spots ("Edit Team" link in a read-only section, a grid cell); weakest affordance |
| `"CARDS"` | equally sized rich-text cards, large click targets | actions are the page's focal point (dashboard/home hub) AND there are ≥2 — a lone card reads as a panel |
| `"SIDEBAR"` | stacked secondary buttons, uniform width | a designated standalone-action home, e.g. a NARROW right rail under an all-caps "ACTIONS" label (Fall Rock Capital DO) |
| `"CALL_TO_ACTION"` | one large primary filled button | exactly one important action with ample whitespace (Volunteer SIGN UP DO) |
| `"MENU"` | labeled "ACTIONS ▾" dropdown per row | multiple actions without cluttering the grid; security evaluated on open — a performance win |
| `"MENU_ICON"` | vertical-ellipsis ⋮ flyout, unlabeled column | tightest grids where the ⋮ convention is recognizable |

Display: `"LABEL_AND_ICON"` (default — most prominent, fastest recognition) / `"LABEL"` (when icons don't accurately map) / `"ICON"` (tight repeated contexts only; paired with Links it is small and easy to miss). Icons are configured on the record type.

## Styling hooks

- `style` + `display` are the appearance levers; chrome color comes from the site theme, not hexes on this component.
- Action behavior: **Dialog** (best default — complete the action without leaving the page; use nested dialogs rarely) / **New Tab** (cross-reference the original page) / **Same Tab** (legacy related-action feel).
- Per-dialog height/width: width fits the expected input length; "Auto" height only for short static content — never for dynamic contents or wizards (jumpy); never very wide + very short. Forms/wizards in dialogs always use "Full" contents width; prefer narrow single-column dialogs, and past that break into a wizard or tabbed form ([Wizard Layout](wizard-layout.md), [Tab Layout](tab-layout.md)).

## Idioms

1. Toolbar on a grid (Employee Directory DO): `a!recordActionField(style: "TOOLBAR")` placed immediately above `a!gridField` — association is positional. Inside a grid column, switch to `"MENU"`/`"MENU_ICON"`; in a narrow column, `"SIDEBAR"` or `"LINKS"`.
2. Dialog that earns its size (Remove Document DO): `a!formLayout` pins title header and CANCEL/REMOVE footer while contents scroll; the body restates what will be removed — warning banner #fdf6d8 (est.), embedded W-9 preview (~60% width), metadata column — so the decision needs no back-navigation.
3. WIDE+FULL only when content two-columns (claim-approval dialog): claim facts in a `[3:2]` card with a tinted #e7f0fa (est.) recommendation callout, icon card-choice outcome row, then required date + reasoning directly above a fixed SUBMIT (#2d3e50 est.).

## Top don't

Don't open a dialog you don't fill: the DON'T is a full-screen "Remove Document" dialog that is ~80% dead white around one sentence and two buttons. Either add decision-supporting content or shrink the dialog — and never wide + short, which letterboxes a one-line message with CANCEL and DELETE ~1200px apart in opposite corners.
