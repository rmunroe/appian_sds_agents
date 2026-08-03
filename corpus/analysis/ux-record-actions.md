# Analysis: ux-record-actions

Page: components / Record Actions. Seven style variants (Toolbar, Links, Cards, Sidebar, Call to Action, Menu, Menu (Icon)), a display-config matrix, and Dialog action-behavior guidance. Tier assignments per image; overrides noted where taken.

## ra_toolbar_do.png + ra_toolbar_dont.png

### Principle: Give toolbar buttons horizontal room above the content they act on
- **DO shows**: "Employee Directory" grid with three small secondary buttons (ADD EMPLOYEE, SEND OUT EMAIL NEWSLETTER, OPEN NEW ROLE) in one row directly above the grid — white bg, ~1px #cccccc (est.) border, uppercase #666666 (est.) labels. OBSERVED. Action-to-content association is positional: actions sit on the object they modify.
- **DON'T shows**: "Event Details" card where the same secondary-button treatment is squeezed into a narrow right column; four buttons (EDIT EVENT, CANCEL EVENT, SEND NEW INVITATIONS, SEND RSVP REMINDER) wrap into a ragged one-per-line stack of unequal widths. OBSERVED.
- **Rule**: Toolbar style needs enough width for all buttons on one line; in narrow containers switch to Links or Sidebar.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!recordActionField(style: "TOOLBAR")` placed immediately above `a!gridField`; in a narrow column use `style: "SIDEBAR"` or `"LINKS"` instead (INFERRED param names).

## ra_links_do.png + ra_links_dont.png

### Principle: Links are for subtle edits beside read-only content, never for the page's main action
- **DO shows**: Two summary boxes (LOAN TEAM, DOCUMENTS) each with a quiet "Edit Team" / "Edit Documents" link, #2b76b0 (est.), inline in the box header — low prominence, zero space cost beside read-only avatars and gray #efefef (est.) document cards. OBSERVED.
- **DON'T shows**: Feedback-portal landing page: full-width pink billboard with overlay title, and the page's ONLY actions are two small centered links ("+ Get Started", "Provide Feedback") floating below — the primary action is weaker than the decoration. OBSERVED.
- **Rule**: Link style trades prominence for compactness; the page's primary action must use a button-weight style.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!recordActionField(style: "LINKS")` inside dense sections/grid cells; for hero actions use `"CALL_TO_ACTION"` or `"CARDS"` (INFERRED).

## ra_cards_do.png + ra_cards_dont.png

### Principle: Card actions only when actions are the focal point
- **DO shows**: Expense Report Dashboard whose hero zone is four equal cards (New Expense, Upload Receipt, New Report, Invite User) — large teal #0c8b99 (est.) icons + labels on white, centered above KPIs and a recent-reports grid. Multiple siblings make clickability obvious. OBSERVED.
- **DON'T shows**: Dense faculty record (summary, publications, classes, advisees grid) with a single oversized "Add New Advisee" card parked beside the grid; it dwarfs the row content, and a lone card reads as a panel, not an action. OBSERVED.
- **Rule**: Cards = prominent multi-action hub on sparse pages; on dense record views use Toolbar/Links/Sidebar.
- **Severity**: contextual
- **Category**: density
- **SAIL implication**: `a!recordActionField(style: "CARDS")` on home/dashboard pages with ≥2 actions and whitespace to spare (INFERRED).

## ra_sidebar_do.png + ra_sidebar_dont.png

### Principle: Sidebar for standalone action groups; grids get toolbars
- **DO shows**: "Fall Rock Capital" customer summary with a right-rail ACTIONS list: six stacked secondary buttons of identical width (ADD FLAG … VIEW OPEN OPPORTUNITIES) under an all-caps gray label, parallel to FLAGS and RECENT ACTIVITY columns — a designated action home. OBSERVED.
- **DON'T shows**: Employee Directory grid with three actions (ADD EMPLOYEE …) stacked in a right rail; the stack floats beside rows 1–2 and its relationship to the grid is ambiguous. OBSERVED.
- **Rule**: Actions that operate on a grid belong in the familiar toolbar position above it; sidebar is for page-level standalone actions.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!recordActionField(style: "SIDEBAR")` in a NARROW column for page actions; `style: "TOOLBAR"` above `a!gridField` for list actions (INFERRED).

## ra_cta_do.png + ra_cta_dont.png

### Principle: One call-to-action, surrounded by whitespace
- **DO shows**: "Volunteer Opportunity" card: event facts in three quiet columns, and a single large filled-blue SIGN UP button (#2276a9 est., white label + thumbs-up icon) alone at the right with generous padding — unmistakable next step. OBSERVED.
- **DON'T shows**: Sales pipeline board with TWO large primary buttons side by side (FINALIZE SALES PLAN, CREATE A NEW OPPORTUNITY, #1a75bb est.) jammed between a filter row and four dense kanban columns; they compete with each other and shout over working content. OBSERVED.
- **Rule**: Call to Action = exactly one important action with ample whitespace; multiple actions or dense pages want Toolbar.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: `a!recordActionField(style: "CALL_TO_ACTION")` with a single action item; ≥2 actions → `"TOOLBAR"` (INFERRED).

## recordActionGridMenu.png

### Principle: Collapse multiple actions into an ACTIONS menu to keep grids clean
- **DO shows**: Employee Directory grid (search bar + SEARCH, filter/refresh icon buttons top-right) with an "Actions" column: per row a small secondary "ACTIONS ▾" dropdown; row 1's menu is open, a white shadowed flyout listing "Add New Employee" / "Update Employee". One compact control replaces a row of buttons. OBSERVED. Page notes menu style defers record-action security evaluation until open — a performance win. INFERRED from page text.
- **DON'T shows**: none on page — the implied anti-pattern is one button per action per row cluttering every grid line.
- **Rule**: When actions outnumber the space for buttons, put them behind a labeled menu.
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: `a!recordActionField(style: "MENU")` inside a grid column (INFERRED).

## recordActionGridMenuIcon.png

### Principle: Ellipsis menu when even a labeled menu button is too much
- **DO shows**: Same Employee Directory grid, but the trailing column is unlabeled and each row carries only a vertical-ellipsis (⋮) icon; row 1's open flyout shows the same two actions. Column shrinks to icon width — minimal space, familiar overflow idiom. OBSERVED.
- **DON'T shows**: none on page — implied risk (from Display guidance): icon-only affordances are easy to miss for unfamiliar users.
- **Rule**: Use the icon menu in the tightest grids where the ⋮ convention is recognizable; prefer the labeled ACTIONS menu when discoverability matters.
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: `a!recordActionField(style: "MENU_ICON")` in a grid column with no column label (INFERRED).

## ra_displays.png

**Tier override**: batch suggested tier A, but this is a 3×5 composite matrix of component crops (display options × styles), not a full-page UI — analyzed as tier B per protocol rule 4.

## Component: Record Action — display configuration (page: ux-record-actions)
Official variant vocabulary: displays "Label and Icon" / "Label Only" / "Icon Only"; shown across styles Toolbar, Links, Cards, Sidebar, Call to Action. Matrix columns = displays, rows = styles; all use one action, "Add Person". All accent color #2b76b0 (est.); secondary buttons white with #cccccc (est.) border and #4a4a4a (est.) uppercase text.

### Label and Icon (column 1)
- **Produces it**: `a!recordActionField(display: "LABEL_AND_ICON")` (INFERRED) + any style
- **Looks like**: person-plus icon leading the label at every scale — button, link, card, filled CTA
- **Use when**: default; maximum prominence and fastest recognition | **Avoid when**: icons don't accurately represent the action
- **Styling hooks**: icon set per action on the record type; style controls chrome
- **Pairs well with**: Cards and Call to Action, where the icon carries the visual weight
- **Hexes**: none (color comes from style, not display)
- **Marker**: neutral

### Label Only (column 2)
- **Produces it**: `display: "LABEL"` (INFERRED)
- **Looks like**: same chrome, text only; Cards center the lone label in empty space
- **Use when**: no icon exists that clearly maps to the action | **Avoid when**: scanning speed matters and good icons exist
- **Styling hooks**: none beyond style
- **Pairs well with**: Toolbar/Sidebar button rows with verbose labels
- **Hexes**: none
- **Marker**: neutral

### Icon Only (column 3)
- **Produces it**: `display: "ICON"` (INFERRED)
- **Looks like**: chrome shrinks to icon width — tiny link glyph, square card, compact CTA block
- **Use when**: minimal space and universally understood icons | **Avoid when**: paired with Links style — small and easy to miss (page's explicit warning)
- **Styling hooks**: icon choice is everything
- **Pairs well with**: dense grids, repeated row actions
- **Hexes**: none
- **Marker**: neutral

### Page rollup
Default choice for most cases is LABEL_AND_ICON because it is the most prominent and self-explanatory; drop to LABEL when icons are ambiguous, and reserve ICON for tight, repetitive contexts where the metaphor is unmistakable.

## ra_dialog_do.png + ra_dialog_dont.png

### Principle: Fill the dialog you open — or shrink it
- **DON'T shows**: Full-screen "Remove Document" dialog containing only a title, one sentence, and CANCEL/REMOVE buttons pinned near the top; ~80% of the dialog is dead white space, with the underlying page peeking below. OBSERVED.
- **DO shows**: Same action, same size, earning its space: yellow warning banner (#fdf6d8 est., amber icon #f5a623 est.), embedded W-9 preview (~60% width) beside a metadata column (status, uploader links #2b76b0 est., expiration, description), footer CANCEL left / REMOVE right (red #d6194b est. text+border). Form Layout pins header and footer; contents scroll. OBSERVED.
- **Rule**: Add decision-supporting content (what will be removed) or use a smaller dialog; never ship acres of white.
- **Severity**: usually
- **Category**: forms
- **SAIL implication**: `a!formLayout` (fixed header/footer) inside the dialog; choose dialog height/width to fit contents (INFERRED).

## dialog-size-example.png

### Identification
- **Image**: dialog-size-example.png | **Source page**: ux-record-actions | **Alt/caption**: "dialog window with full height and wide width"
- **Device frame**: desktop
- **Marker**: neutral (annotated documentation figure: green #2fe08d (est.) callout lines label Width: "Wide", Height: "Full" — overlay, not UI)
- **UI type**: form (record-action dialog over a record view)

### Use-case reconstruction (INFERRED)
- **Persona**: insurance claims approver (adjuster's manager), daily-operator cadence, deciding claims one at a time
- **Domain & brand context**: auto insurance ("AUTOSHIELD" shield logo), conservative navy-on-white enterprise brand
- **Top 3 user tasks (ranked)**: 1. Approve/deny claim AC2023-10-27-4567; 2. Verify amounts against coverage limits and the adjuster's recommendation before deciding; 3. Record date + written reasoning for the audit trail
- **Implied requirements**: must complete approval without leaving the claim page; must restate financial facts and recommendation inside the form; outcome must be one of exactly three states; decision date and reasoning are mandatory (asterisks); Cancel must always be reachable (fixed footer)
- **Data model sketch**: Claim (id, policyNumber PA-123456789, faultDetermination "John Smith (100%)", collisionCoverage $5,000 limit, medicalCoverage $2,500 limit, vehicleRepairs $3,500, medicalExpenses $1,800) 1—1 AdjusterRecommendation (text, proposedSettlement $4,800) 1—1 Decision (outcome enum, decisionDate, reasoning). Backdrop shows Claim 1—n Documents (dated, KB sizes)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
DIALOG w=WIDE h=FULL over RECORD-VIEW (grayed scrim)
├─ HEADER-BAR #2d3e50 title="Complete Approval for Claim AC2023-10-27-4567" + ×
├─ SECTION "Claim Summary"
│  └─ CARD(COLUMNS [3:2]
│     ├─ label/value rows ×6 (labels bold left, values right-aligned)
│     └─ BOX(#e7f0fa) "Adjuster's Recommendation" + "Proposed Settlement Amount")
├─ SECTION "Decision"
│  └─ CARD(FORM
│     ├─ card-choice ×3: ✓ Approved | ✎ Approved with Changes | ✕ Denied
│     ├─ Decision Date* (date picker)
│     └─ Reasoning* (paragraph, ~5 rows))
└─ FOOTER-BAR fixed: CANCEL (outline, left) …… SUBMIT (filled #2d3e50, right)
```
- **Above the fold**: entire dialog — Full height pins header and footer to viewport edges
- **Reading order**: single-column, facts → decision → commit
- **Hierarchy rationale**: title names action + record id (task 1); Claim Summary precedes Decision so evidence is read before judgment (task 2); required date/reasoning fields sit last, directly above SUBMIT (task 3)
- **Density**: 3 — two sections, ~10 data pairs + 5 inputs, comfortable card padding; backdrop record page is denser but inert
- **Ratios & spacing**: summary card splits ≈3:2 with the tinted callout right; outcome cards equal thirds; footer buttons at extreme left/right; section gap ≈ marginBelow "MORE"

### Styling specifics (OBSERVED)
- **Palette**: dialog body #f7f7f7 (est.); cards #ffffff with #dddddd (est.) borders; header band + SUBMIT #2d3e50 (est.); callout #e7f0fa (est.); text #333333 (est.); scrim grays the page behind; annotation green #2fe08d (est.) is doc overlay only
- **Color application points**: dark navy on exactly three things — header band, outcome icons, SUBMIT — so brand color doubles as "where to act"; the blue callout is the only tinted surface, spotlighting the recommendation; no semantic red/green anywhere in a money decision (deliberately calm)
- **Typography moves**: dialog title ≈ LARGE bold white; section labels ≈ MEDIUM; field labels STANDARD bold; values STANDARD right-aligned; required asterisks; no all-caps except buttons
- **Imagery stance**: none — three line icons (check, pencil, X) inside outcome cards
- **Card treatment**: flat white, 1px border, square corners, no shadow
- **Signature moves**: (1) instead of a radio group, outcome is an icon card-choice row via `a!cardChoiceField`-style cards; (2) instead of making the approver navigate back for numbers, the summary restates them label/value with right-aligned amounts; (3) instead of burying guidance in help text, the recommendation lives in a tinted box beside the facts; (4) instead of scrolling buttons, Form Layout pins CANCEL/SUBMIT

### Component inventory (OBSERVED, params INFERRED — no SAIL on page)
- `a!recordActionField(... openActionsIn: dialog, width: "WIDE", height: "FULL")` — the annotations' point
- `a!formLayout(titleBar: …, buttons: a!buttonLayout(primary SUBMIT solid, secondary CANCEL outline))`
- `a!sectionLayout` ×2; `a!sideBySideLayout` label/value rows; `a!cardLayout(style tinted #e7f0fa est.)` callout
- `a!cardChoiceField` (3 options, icon+label); `a!dateField` (required); `a!paragraphField` (required)
- Charts: none | Interactive affordances: close ×, card-choice selection, form inputs, two buttons

### Character & judgment
- **Register**: calm-clinical + authoritative-executive — monochrome navy, zero decoration, evidence-then-verdict structure
- **Why it works**: summary card kills the cross-reference trip (amounts + limits visible at decision time); three mutually exclusive outcome cards make state legible at a glance; Full height keeps the long Reasoning field and the commit buttons on screen together
- **Why not boring**: icon card-choice instead of radios; tinted recommendation callout; right-aligned currency column; dark header band that echoes the app nav so the dialog feels native, not generic chrome
- **Boring twin**: a centered modal titled "Approve?", a bare radio list (Approve/Deny), no claim facts, buttons after a scroll — forcing the approver to memorize numbers from the page behind
- **What to steal**: restate decision-critical data inside the dialog; use WIDE+FULL only when content genuinely two-columns and includes a long text field; pin footer buttons via Form Layout
- **Risks**: Wide dialog stretches the Reasoning textarea to very long line lengths (the page itself warns about over-wide inputs); icon-only close × is small; gray-on-light metadata behind scrim is decorative only

### Code cross-check
- none — no SAIL source on this page

## ra-dialog-width-do.png + ra-dialog-width-dont.png

### Principle: Match dialog width to content length — never wide + short
- **DO shows**: "Delete Claim?" confirmation at Auto height, narrow width (~⅓ page): pink header band #fdeceb (est.), red badge icon #d0021b (est.), one-line warning, CANCEL (outline) and DELETE (filled crimson #e0244c est.) close together — read in one glance. OBSERVED.
- **DON'T shows**: identical content stretched to ~90% page width at the same short height: a letterbox where the sentence hugs the left edge and CANCEL/DELETE sit ~1200px apart in opposite corners — unbalanced, slower to parse. OBSERVED.
- **Rule**: Size width to the expected input/message length; avoid very wide + very short combinations.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: per-dialog height/width settings on the record action; "Auto" height fits short static content, narrow width keeps text and buttons associated (INFERRED).
