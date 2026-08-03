# Analysis: kanban

Both images have full SAIL source on the page (`corpus/pages/kanban.md`), so palettes and params below are CODE-VERIFIED unless marked otherwise.

## kanban-board.png

### Identification
- **Image**: kanban-board.png | **Source page**: kanban | **Alt/caption**: none; heading "Kanban board"
- **Device frame**: desktop (no site chrome; standalone-page rendering)
- **Marker**: neutral
- **UI type**: other — kanban task board (3-stage workflow tracker). Tier A confirmed.

### Use-case reconstruction (INFERRED)
- **Persona**: daily-operator — program coordinator/team lead at an environmental nonprofit grooming a shared 13-task board daily.
- **Domain & brand context**: conservation nonprofit (beach cleanups, drone canopy mapping, donor systems); light, friendly, color-coded utility feel.
- **Top 3 user tasks (ranked)**: 1. Scan stage distribution and per-column load. 2. Move tasks between adjacent stages. 3. Add tasks and check per-task owner/due date/progress.
- **Implied requirements**: "Column identity and counts must stay visible while scrolling" (isHeaderFixed); "Each card must show work type, assignee, due date, % complete"; "Moves allowed only to adjacent stages, with disabled affordance at ends"; "Overall completion ratio visible at top"; "Add-task entry point always available".
- **Data model sketch** (CODE-VERIFIED): item(id, workType→{label,color}, statusId ∈ 1–3, dueDate, percentComplete, assignee, title, description) ×13; workTypes ×4 (Conservation #31808B, Fundraising #117c00, Research #962FEA, Compliance #e21496); statuses ×3 with primaryColor/secondaryColor and derived item lists (4/5/4).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT isHeaderFixed bg=#FCFCFD contentsPadding=LESS
├─ HEADER CARD(flat #FCFCFD, padding LESS)
│  ├─ SBS [H1 "Tasks" + "4 / 13 items completed" SMALL : ADD TASK solid button]
│  └─ COLUMNS [1:1:1] — CARD(status header: tinted bg, decorative TOP bar, label ⋯ count)
└─ CONTENT COLUMNS [1:1:1] (inside EXTRA_WIDE column)
   └─ per status: CARD(task) stack — tag+arrow-pair / title+description / assignee·due·% / edge-to-edge progress bar
```
- **Above the fold**: header, column title cards, ~2–3 task cards per column.
- **Reading order**: column-wise F; tinted headers anchor each sweep.
- **Hierarchy rationale**: fixed header keeps stage names + counts (task 1) during long-column scroll; STRONG card titles dominate within cards; progress bar rendered as the card's bottom edge so % status reads pre-attentively (task 3).
- **Density**: 3 — ~9 cards visible with STANDARD padding and LESS gaps; balanced working board.
- **Ratios & spacing**: three equal columns; `contentsPadding:"LESS"`, card `marginBelow:"LESS"`, header card padding "LESS"; task cards outer `padding:"NONE"` wrapping an inner `padding:"STANDARD"` card.

### Styling specifics (CODE-VERIFIED)
- **Palette**: page bg #FCFCFD; status primaries To Do #115EBB / In Progress #CC7600 / Completed #117c00 with secondary tints #EBF4FF / #FFF5E6 / #EDF7EE; work-type hues #31808B, #117c00, #962FEA, #e21496; tag backgrounds = workType color + "1a" alpha (10% tint); description gray #636363; disabled arrows #ddd; cards white with shadow. ADD TASK solid ≈#2322fb (est.) — theme accent, not set in code.
- **Color application points**: each status hue appears 4× per column — decorative top bar, header tint, label+count text, and every card's progress bar; work-type hue 2× per tag (text + derived 10% background); arrows theme-accent when enabled, #ddd disabled.
- **Typography moves**: H1 "Tasks" BOLD (headingTag H1); ratio subtitle SMALL; status labels STRONG in primaryColor; card titles STRONG STANDARD; descriptions SMALL #636363; meta row SMALL with user-circle/calendar-day icons; % STRONG SMALL.
- **Imagery stance**: none; utility icons only.
- **Card treatment**: `showBorder:false, showShadow:true, shape:"ROUNDED"` — shadow-only elevation on a barely-off-white canvas.
- **Signature moves**: instead of hand-picked pastels, tag backgrounds derived via `concat(color, "1a")` — programmatic tints that always harmonize; instead of gray column headers, tinted cards with `decorativeBarPosition:"TOP"` in the status primary; instead of an inset progress element, outer-card `padding:"NONE"` + nested padded card so `a!progressBarField` bleeds edge-to-edge as card chrome; each card's bar inherits the COLUMN's primaryColor (local!status), stamping stage onto every card; adjacent-only movement encoded as disabled #ddd arrows at the ends with target-naming tooltips.

### Component inventory (CODE-VERIFIED)
- `a!headerContentLayout(isHeaderFixed:true, contentsPadding:"LESS", backgroundColor:"#FCFCFD")`; `a!cardLayout(style: secondaryColor, decorativeBarPosition:"TOP", decorativeBarColor: primaryColor, shape:"ROUNDED", showBorder:false)`; nested `a!cardLayout(padding:"NONE" → padding:"STANDARD")`; `a!tagField(textColor, backgroundColor: concat(color,"1a"))`; `a!buttonWidget(icon:"arrow-left/right", style:"LINK", size:"SMALL", disabled, tooltip)` with `a!save`+`a!update` stage moves; `a!progressBarField(showPercentage:false, color: primaryColor)`; `a!richTextDisplayField` with `char(10)` title/description stacking; `a!forEach` over statuses and items; `a!columnLayout(width:"EXTRA_WIDE")` wrapper; `a!buttonWidget(label:"ADD TASK", style:"SOLID")`.
- Charts: none. Interactive: ADD TASK, per-card arrow moves (saveInto), tooltips.

### Character & judgment
- **Register**: utilitarian-ops + warm-community — a daily work tool that stays friendly through tints, not decoration.
- **Why it works**: 4-point repetition of each status hue binds header to cards during scroll; the derived-tint tag system separates 4 work types without heavy chips; fixed header + per-column counts preserve orientation on uneven columns (4/5/4).
- **Why not boring**: computed alpha tints instead of a second palette; decorative top bars as column identity; progress bars as card bottom edges; disabled-arrow endpoints that physically encode the legal-move rule.
- **Boring twin**: three gray columns under plain H3s, bordered white cards, a status dropdown per card, "28%" as text, one accent color, header scrolls away.
- **What to steal**: 1) `concat(color, "1a")` for guaranteed-harmonious tag tints. 2) Nested card with outer `padding:"NONE"` for edge-bleed progress bars. 3) `decorativeBarPosition:"TOP"` + tinted card as column/section headers.
- **Risks**: #CC7600 STRONG text on #FFF5E6 is borderline for small sizes; SMALL LINK arrow buttons are tight touch targets; no drag-and-drop (arrows are the accessible substitute — keep them); work-type meaning rests on color+label, safe.

### Code cross-check (SAIL on `corpus/pages/kanban.md`, ~L15–475)
- **Code-verified palette**: as listed above — overrides pixel samples (bars sampled #0050bb/#d76300/#007200 due to antialiasing; true values #115EBB/#CC7600/#117c00).
- **Notable techniques**: alpha-suffix tag tint `concat(fv!item.workType.color, "1a")` (≈L329); outer `padding:"NONE"` card + inner card + full-width `a!progressBarField` (≈L305–458); `decorativeBarPosition/Color` column headers (≈L230–237); adjacent-move guards — `if(statusId=1/3, disabled #ddd arrow, saveInto a!update)` with direction tooltips (≈L339–390); `isHeaderFixed:true` + header-as-card (≈L170–282); live ratio `count(local!completedItems)/count(local!items)` subtitle (≈L201).
- **Corrections**: ADD TASK button color is theme accent (absent from code); progress-bar green is #117c00, not the lighter sampled blend.

## kanban-add-task-form.png

### Identification
- **Image**: kanban-add-task-form.png | **Source page**: kanban | **Alt/caption**: none; heading "Add task form"
- **Device frame**: desktop (dialog-style narrow form rendering)
- **Marker**: neutral
- **UI type**: form (record action paired with the board). **Tier override**: table suggests B by size (758x704), but this is a complete form-page screenshot with title bar, content card, and button bar — tier A per protocol; kept concise.

### Use-case reconstruction (INFERRED)
- **Persona**: same board operator adding a task in-flow; frequent, seconds-long interaction.
- **Domain & brand context**: same nonprofit task system; minimal, neutral chrome.
- **Top 3 user tasks (ranked)**: 1. Enter title + description. 2. Categorize (work type, status). 3. Assign owner and due date.
- **Implied requirements** (CODE-backed): title/description/work type/status required with custom messages; description shows character count; single assignee via user picker; status pre-defaulted to "To Do"; narrow width for fast scanning.
- **Data model sketch**: mirrors board card — item(title, description, workType ref, statusId default 1, assignee, dueDate, percentComplete 0).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM contentsWidth=NARROW bg=#FCFCFD showTitleBarDivider=false
├─ Title bar: "Add Task" + secondary "Add a task to the Kanban Board"
├─ CARD(ROUNDED, shadow, padding STANDARD)
│  ├─ Title text field (full width)
│  ├─ Description paragraph (full width, tall)
│  └─ COLUMNS [1:1] — [Work Type radio-cards ×4 stacked : Status dropdown, Assignee picker, Due Date]
└─ Button bar: CANCEL outline (left) ⋯ ADD solid (right)
```
- **Above the fold**: entire form.
- **Reading order**: single-column narrative fields first, then a [1:1] metadata split; primary action bottom-right.
- **Hierarchy rationale**: the two required free-text fields get full width and first position; categorical pickers compress into halves; work type gets the most visual weight of the metadata via card-style radios.
- **Density**: 2 — one card, seven inputs, generous padding.
- **Ratios & spacing**: `contentsWidth:"NARROW"`; card `padding:"STANDARD"`, `marginBelow:"STANDARD"`; equal metadata columns.

### Styling specifics (CODE-VERIFIED + est.)
- **Palette**: page bg #FCFCFD (code); card #ffffff with shadow (`style:"NONE", showBorder:false, showShadow:true, shape:"ROUNDED"`); accent on ADD/CANCEL/required asterisks ≈#2322fb (est., theme accent — not in code); input hairlines ≈#eeeeee–#cccccc (est.); placeholder italic gray ≈#767676 (est.).
- **Color application points**: accent only on the two buttons and required markers; everything else neutral — the form defers to the colorful board it serves.
- **Typography moves**: form title ≈MEDIUM_PLUS bold with SMALL secondary line; field labels STANDARD bold; placeholders italic; button labels ALL-CAPS.
- **Imagery stance**: none.
- **Card treatment**: single elevated rounded card grouping all fields on the tinted canvas.
- **Signature moves**: instead of a work-type dropdown, `choiceStyle:"CARDS"` radios (STACKED, `choicePosition:"START"`) — all four categories visible as large bordered click targets; instead of full-page width, `contentsWidth:"NARROW"` keeps label–field scan tight; `showTitleBarDivider:false` for a softer entry; primary/secondary buttons split to opposite ends via `a!buttonLayout`.

### Component inventory (CODE-VERIFIED)
- `a!formLayout(contentsWidth:"NARROW", showTitleBarDivider:false, backgroundColor:"#FCFCFD", titleBar: a!headerTemplateSimple(title, secondaryText, titleColor:"STANDARD"))`; `a!textField(required, requiredMessage, refreshAfter:"UNFOCUS")`; `a!paragraphField(required, showCharacterCount:true)`; `a!radioButtonField(choiceLayout:"STACKED", choiceStyle:"CARDS", choicePosition:"START", required)`; `a!dropdownField(placeholder, searchDisplay:"AUTO")`; `a!pickerFieldUsers(maxSelections:1)`; `a!dateField`; `a!buttonLayout(primary: ADD submit+loadingIndicator SOLID; secondary: CANCEL OUTLINE, validate:false, submit:true)`.
- Charts: none. Interactive: 7 inputs, submit/cancel.

### Character & judgment
- **Register**: calm-clinical — neutral, low-chrome capture surface.
- **Why it works**: card-radios expose all four work types at a glance where a dropdown would hide them; NARROW width shortens eye travel; only fields that gate board rendering are required (assignee/due date optional in code).
- **Why not boring**: radio-as-cards for the key categorization; floating single card on an off-white canvas; divider-less title bar.
- **Boring twin**: full-width form, seven stacked fields, work type as a dropdown, gray title divider, both buttons clustered right.
- **What to steal**: 1) `choiceStyle:"CARDS"` for ≤5 mutually exclusive categories. 2) `contentsWidth:"NARROW"` for short forms. 3) Custom `requiredMessage` per field.
- **Risks**: left column (4 radio cards) runs taller than the right column — bottom imbalance; italic gray placeholders are low-contrast; the radios don't reuse the board's work-type hues — a missed consistency opportunity (or a deliberate restraint).

### Code cross-check (SAIL on `corpus/pages/kanban.md`, ~L484–610)
- **Code-verified palette/params**: all values marked above; status default visible ("To Do") because `statusId: 1` initializes the dropdown.
- **Notable techniques**: `refreshAfter:"UNFOCUS"` on title (≈L512); `showCharacterCount:true` paragraph (≈L525); radio `choiceValues` set to whole maps, not ids (≈L538); CANCEL as `submit:true, validate:false` escape (≈L597).
- **Corrections**: none — pixels matched code; button/asterisk blue is the environment theme accent, absent from source.
