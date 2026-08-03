# Anti-Pattern Catalog (SAIL DO/DON'T distilled)

From ~170 DO/DON'T pairs in `corpus/analysis/*`. **[A]** always · **[U]** usually · **[C]** contextual. Per rule: imperative - failure prevented - SAIL lever.

## Layout
- **[U] Center fixed content between two EMPTY `"AUTO"` columns (`{AUTO|fixed|AUTO}`); never fix every column or fill the screen** - full-bleed doubles line measure. Feeds: WIDE middle column; forms: `contentsWidth`.
- **[A] Never nest like containers (box-in-box, card-in-wrapper-card, >1 border level)** - 3 competing rectangles at ~2x height. Interiors: `a!sectionLayout`/headings; group repeats with avatar+whitespace.
- **[U] Border on white, shadow on tinted - never both** - doubled outline noise. `a!boxLayout(showBorder, showShadow)` set oppositely.
- **[A] `isHeaderFixed:true`: gap = `marginAbove` on first content, not header `marginBelow`** - else a pinned white strip clips scrolling text.
- **[A] Content pane `width:"AUTO"`; fixed panes only for filter rails** - fixed content panes strand ~40% dead width.
- **[U] Side-by-side `width:"MINIMIZE"` only on fixed-width items (icons, buttons, static text)** - a minimized multiselect grows per selection, shoving the layout.
- **[U] Size dialogs to content - never huge+empty or wide+short** - one sentence full-screen = 80% dead white; letterboxes split CANCEL/DELETE. Keep `a!headerTemplateImage` small.
- **[U] Collapse uniformly across siblings; filters toggle via `a!dynamicLink`+`showWhen`, not a collapsible "Filters" section** - mixed chevrons break the heading edge.
- **[A] Billboards decorate; readable content -> `a!imageField`** - backgrounds get cropped and scrimmed. [U] Text covering most -> `a!fullOverlay`; siblings share overlay type+height; data beats stock photos in the hero.

## Color
- **[A] One brand hue + neutrals + small semantic set; every non-neutral color encodes a nameable state** - arbitrary accents scatter attention; green/red stop meaning status.
- **[U] Color the text/icon, not the surface** - whole-card tints compete; color-alone fails a11y. `style:"NONE"` cards + `a!richTextItem(color:"POSITIVE"/"NEGATIVE")` + caret icon.
- **[U] Semantic styles stay semantic; section boxes share one STANDARD/ACCENT style** - a pale-yellow header falsely warns; WARN/ERROR mark one attention box.
- **[U] Solid color blocks live on the page perimeter** - a tinted mid-page strip hijacks the eye.
- **[A] Accent color >=4.5:1 on white, distinct from black text and destructive red** - charcoal reads as body text; red accent twins ADD with DELETE.
- **[U] One `decorativeBarPosition` per interface; bar+border one hue family** (pull `decorativeBarColor` from the card's icon/title hue).
- **[C] Transparent page background only when content fills the viewport** - else the void dominates. Card-heavy forms: `backgroundColor:"TRANSPARENT"`.
- **[A] No POSITIVE/NEGATIVE text on dark overlays** - standard text auto-whitens; semantic red stays ~1.6:1.

## Typography
- **[A] One text style per hierarchy level; data values never dress as headings** - a value styled as a heading destroys orientation.
- **[U] Grade section labels down by nesting** (`labelSize`/`labelColor` stepped). [A] Wizard section headings >=1 ladder step below the step heading.
- **[U] De-emphasize by stepping DOWN (`size:"SMALL"`, `color:"SECONDARY"`), not italics; `"EMPHASIS"` = phrases only** - all-italic emphasizes nothing.
- **[U] Vary size/weight/color along real importance** - 40 flat label:value rows force linear reading; group, promote headline numbers, color deltas.

## Density
- **[U] List views carry identify-and-triage fields only; detail is one click away** - audit columns crowd decision columns.
- **[U] Show only constantly-used controls; long-tail filters behind a "more filters" `a!dynamicLink`.**
- **[C] Consolidate related minor fields under their primary in one column** (STRONG + SECONDARY rich text, <=3 lines, sort by primary).
- **[C] Card-style record actions only when actions are a sparse page's focal point** - an oversized action card dwarfs a dense grid.

## Labeling
- **[A] Title case, no trailing colons; one sentence = no period, 2+ = all periods.**
- **[U] One `labelPosition` per section** - mixing yields two left edges. Wide components -> ABOVE (adjacent wraps); read-only -> ADJACENT (above hides blanks, ~1.8x scroll); rich text with own headers -> COLLAPSED.
- **[U] Say the shared noun once - section label or grid header, not every field/cell** ("Award x3" under "Award Details").
- **[U] One tone per form: concise noun phrases, not chatty questions.**
- **[U] Titles carry instance data, one line, matching the task list; descriptions add, never restate.**
- **[U] Link text names the destination** - never "Link to..." or a raw wrapping URL. `a!safeLink(label:"Timesheets")`.
- **[A] Tags are 1-2 word keywords** - sentence chips truncate and read as buttons.

## Forms
- **[U] One narrow column; sections never side-by-side** - two reading paths; `contentsWidth:"NARROW"` sizes fields to input length.
- **[A] Center with `contentsWidth`, never empty columns in a form** - buttons ignore wrappers, land misaligned.
- **[A] Placeholder never replaces the label** - after entry nothing identifies the field; placeholders = short hints ("Drop resume here (pdf)").
- **[U] `showCharacterCount:false` when limits are generous; inputs left-aligned (LTR)** - counters add noise; right alignment breaks the label->value scan.
- **[A] Read-only views strip input chrome** - no asterisk, disabled dropdown, or instructions: `a!textField(readOnly:true)`, not `disabled:true`.
- **[A] Footer = submit/exit only; content actions inline (SMALL+SECONDARY)** - submit right (solid first), back/cancel left via `a!buttonLayout(primaryButtons, secondaryButtons)`.
- **[A] One `"SOLID"` button per screen, never on Cancel** - twin solid CTAs compete; solid CANCEL outshouts SUBMIT.
- **[A] `"NEGATIVE"` only for persisted-data loss** - red RESET cries wolf; destructive neighbors go SECONDARY; <=1 LINK-style per group.
- **[A] One `size` and one `width` per button group** - mixed sizes look broken, MINIMIZE beside FILL accidental; stacked lists share FILL.
- **[C] Disable, don't hide, unavailable buttons** (hide only when many toggle).
- **[U] `choicePosition:"END"` only in width-constrained panes** - full-width radios sit ~1400px from labels; Cards style + long labels -> `"START"`.
- **[U] Card choices fill identical fields (icon/primary/secondary) for every option** - one missing icon breaks alignment.
- **[U] Wizards: added buttons `size:"STANDARD"`; footer fits one row** - else ragged tiers; no vertical milestone beside vertical tabs.

## Data display
- **[A] Grid values concise, one format and image size per column** - one ballooned row ("Yesterday" vs 02/01/2015, paragraph cells) kills scanning; format via `text()`; prose -> record view.
- **[U] One action per cell; more -> toolbar above or MENU record action** - stacked row links double height. Grid toolbars = SMALL+SECONDARY buttons.
- **[A] Empty cell = "–", never "N/A"/"Not Applicable"** - absence must not be the column's longest string.
- **[A] <=2 non-neutral colors per grid; color marks exceptions, never rides alone** - 5+ hues mean nothing pops; text-color-only fails colorblind users. [U] Every-row tags: muted palette; tag conditionally.
- **[A] Scrolling or paging, never both** - a 5-row scroll window plus a pager.
- **[U] `selectionStyle:"ROW_HIGHLIGHT"` only when nothing in-row is clickable; else `"CHECKBOX"`.**
- **[U] Editable grids: explicit column weights** - DISTRIBUTE clips text, floats short columns.
- **[A] KPIs only for decision-worthy metrics with meaningful comparisons** - "Newest ID 200, 0 (0%)" is noise.
- **[A] Gauges only for bounded progress to 100%** - arcs on unbounded indexes encode nothing; use KPI text + delta.
- **[U] Group digits; one precision per field set** ($200 vs $236.90 vs 1,670.57833). [C] Datetimes in the viewer's timezone, no zone suffix.
- **[U] Self-divided components (event feed): `a!cardLayout(padding:"NONE")`** - other padding strands divider lines mid-card.
- **[U] Icons (one style, one accent) for option cards; photos only when authentic** - stock photos turn controls into content.

## Navigation
- **[U] Few pages -> header bar; many + groups -> sidebar** - 3 items on a tall rail waste width; 10 flat tabs fill the bar. Top level <=8 via page groups (<=5 mobile-first).
- **[A] Every page-group child opens with its own on-page title** - the nav highlight names only the group.
- **[A] Bar colors clearly dark or clearly light** - mid-tones defeat the automatic text color. [A] Selected highlight far from the bar hex; [U] sidebar hex != page background; [A] logos transparent, matched to the bar.
- **[U] Tab labels 1-2 words** (else truncation + scroll chevrons); [A] icons never replace labels; [A] one tab bar per screen (level two = sections); [C] `orientation:"VERTICAL"` when all of >5 must show; [U] divider needs a contrasting surface; [A] never over imagery.

## Charts
- **[U] Pie = one whole; <=5 slices [A], sorted descending; never compare pies** - 9 slices drop labels; comparison -> line/column.
- **[U] Few time buckets (~<=7) -> columns; many -> line, <=5 series** - 8 lines = spaghetti. Signed data -> columns.
- **[U] Long/many category labels -> horizontal bars** - rotated/truncated column labels mean wrong chart type.
- **[A] Scatter axes both quantitative** - coded categories pile into strips. Keep outliers [A]; missing data = gaps, never zero-fill [A].
- **[U] Areas stack (NORMAL/PERCENT_TO_TOTAL), <=3 series** - unstacked blends to mud; unstacked only when series interleave.
- **[U] Sort bars/pies descending, columns ascending; [A] time by sequence, never magnitude.**
- **[U] Siblings share height; [A] never clip a chart in a short card; [A] `height:"AUTO"` when bar categories vary** - fixed heights drop labels; [U] MICRO = one stat, axes off; drilldown needs MEDIUM/TALL.
- **[A] <=5 colors; one `colorScheme`, stable category->color, page-wide** - a hue flipping meaning misleads. [C] Gradients only for ordered categories; bright hero over muted context; semantic red for the alarming series.
- **[U] All charts on one white-card surface** - mixed surfaces look broken; never saturated fills.
- **[A] Single series -> descriptive title, no legend**; sibling pies share one legend. [A] Feed series/category labels even when axes hidden - else tooltips say "[Category 23]"; hide axes only where context substitutes; roll the tail into "Other".

## Mobile
- **[A] Unfix tall headers on phones** - a fixed header can eat ~58% of viewport: `isHeaderFixed: not(a!isPageWidth("PHONE"))` (INFERRED).
- **[U] Per-breakpoint grid widths: fixed + scroll, never shrink-to-fit** - relative widths at 375px fracture headers; gate via `a!isPageWidth()`.
- **[U] Site page titles: 1-2 words + distinctive icon** - else "Create New Dis...".

## A11y
- **[A] Headings are header components (`a!sectionLayout`/`a!headingField` + correct `accessibilityHeadingTag`), never styled rich text** - the mimic looks identical; assistive tech gets zero structure.
- **[A] Meaning never rides on color alone** - pair every semantic color with a word, icon, or shape.
- **[A] A linked card contains no other interactive components** - whole card = the one click target.
- Also [A] above: accent/bar contrast, semantic color on dark overlays, icon-only tabs, chart targets.

## Top 15 checklist (verify on every page)
1. Exactly one SOLID button, and not on Cancel/Delete?
2. Content width capped (AUTO rails / `contentsWidth` / WIDE middle)?
3. No nested like-containers (box-in-box, card-in-card, tabs-in-tabs)?
4. Every non-neutral color names a state, never carrying meaning alone?
5. One `labelPosition` per section; labels title-case, colon-free; wide components ABOVE?
6. Grids: <=2 accents, one format/column, "–" empties, <=1 action/cell, no scroll+pager?
7. Chart types fit the data (pie <=5, line <=5, bars for long labels), sorted right?
8. One scheme across charts, <=5 hues, same surface?
9. Sibling cards/charts share heights; nothing clipped or inner-scrolling?
10. Form single narrow column; placeholders hint, never label?
11. Read-only views stripped of asterisks, disabled inputs, instructions?
12. Footer = submit/exit only, submit right; one size/width per group?
13. NEGATIVE red only where persisted data is lost?
14. Phone pass: header unfixed, grid widths re-tuned, titles 1-2 words?
15. Headings real header components; linked cards free of inner clickables?
