# Design Philosophy — 10 Operational Principles

Each principle: the rule, why it matters, and a SELF-TEST to run against your own output before
shipping. Examples cited by corpus name. Palette-neutral — apply with the app's own brand hues.

## 1. THE DESIGN FOLLOWS THE USER
Name the persona and their 3 ranked tasks before choosing any layout; let their cadence set density and register.
Why: ux-designing-for-your-users shows one genre (multi-step data work) done three correct-but-opposite ways — Thatcher's mortgage wizard gives operators a persistent 8-step rail and constant-width form at density 2; the Sailaway cruise dashboard gives a monthly executive six labeled zones plus billboard KPIs at density 4; Panthère's quote flow gives abandonment-prone first-timers one question per screen at density 1 with card-sized answers.
SELF-TEST: swap your persona for its opposite (novice ↔ daily operator) — if your layout wouldn't change at all, you designed for nobody.

## 2. Answer the #1 task before the first scroll
Put the top-ranked task's payoff in the header zone itself, not below it.
Why: the cruise dashboard's three KPIs ride inside the billboard, so "is this route healthy?" resolves in ~1 second; the real-estate record's price/sqft/beds/baths sit in the hero's bottom overlay bar (ux-example-walkthrough).
SELF-TEST: cover everything below the fold — can the persona's #1 ranked task still be completed or answered?

## 3. Give one action the color monopoly
Exactly one SOLID button per screen — the primary action — and never on cancel/delete; demote every sibling to OUTLINE, SECONDARY, or LINK.
Why: corpus rule (ux-buttons: "one solid button per interface, never on Cancel"); Panthère's START NOW is the page's only saturated fill; the fundraising home's lone SOLID "NEW CAMPAIGN" stands out among ~10 buttons (employee-home-pages).
SELF-TEST: count the solid fills in the content area — if there is more than one, the screen has no primary action.

## 4. Spend color only where it means something
One accent hue for interactive/selected elements; semantic color only on exceptions; everything else neutral.
Why: the sustainability dashboard keeps a single-hue system so its one red over-target bar is the only alarm on screen; random multi-color differentiation is an explicit DON'T ("cluttered and garish", ux-presenting-information-clearly).
SELF-TEST: name the meaning of every non-neutral color on screen; any color without an assignable meaning is noise — cut it.

## 5. Demote labels, promote values
Labels go SMALL, all-caps, SECONDARY color; values go MEDIUM_PLUS and up. The answer must outweigh the question.
Why: the claim case study's stated grammar is "labels demoted, answers promoted"; the cruise billboard sets SMALL bold labels over LARGE colored KPI values. Uniform label/value weight forces re-reading.
SELF-TEST: squint at the page — if the field labels read louder than the data, invert the weights.

## 6. Express hierarchy with one consistent grammar
Page title > tabs > section headings (Medium/H2) > sub-heads (Small/H3, all-caps) — and never style a data value like a heading, or two levels alike.
Why: ux-presenting-information-clearly's DON'T shows "Acme Corporation" (a value) styled as a section header and a section styled like the page title — the user can no longer parse the outline. Consistent label treatment lets the cruise page's six zones be learned by scanning five words.
SELF-TEST: rank every text block into title / section / label / value in one pass; any block you can't place is styled wrong.

## 7. Pick one separation device per surface — then stop
Whitespace + labels on flat white; border OR shadow on cards (border on white pages, shadow on tinted canvas); never nest cards or boxes.
Why: nested borders "hinder comprehension" (ux-avoiding-clutter); the cruise body separates six zones with no chrome at all; the insurance agent home floats shadow-only cards on a tinted canvas — zero border lines, perfectly separable zones.
SELF-TEST: if every card has a border, a shadow, and a visible label, you built a form, not a page — remove devices until exactly one does the work.

## 8. Show less: navigate or disclose progressively
Ask of every element: "can this move to a page one click away?" and "can this hide behind a control until needed?" Hide conditional content (showWhen); but disable-don't-hide steps of a sequential flow.
Why: both questions are the corpus's own clutter audit (ux-avoiding-clutter); the cruise metrics drill down in place instead of adding a second chart; hiding a known next step breaks the user's preview of the flow (ux-progressive-disclosure).
SELF-TEST: for each on-screen element, name which of the top-3 tasks it serves right now; no answer = clutter.

## 9. Design the states, not just the layout
Empty states get an icon + explanatory copy inside the zone; optional collections get a declarative skip; inputs ship pre-answered with safe defaults.
Why: the mortgage income step forces "NO INCOME SOURCES" as an asserted fact instead of a silent Next; the campaign home renders "No Alerts" with a centered oversized icon in a fixed-height card; Panthère's four dropdowns arrive pre-filled so the step is "check our guesses", not "fill this form".
SELF-TEST: render the screen with zero rows and null values — does it still explain itself and offer a legitimate exit?

## 10. Kill the boring twin
Make at least three deliberate moves away from the drag-and-drop default rendering.
Why: every corpus exemplar defines itself against its "boring twin" — billboard-with-KPI-overlay instead of a gray title bar; tinted canvas under shadow cards instead of white-plus-borders; hand-built rich-text KPIs instead of default boxed cards; a grid pre-sorted by the column that makes the argument, sort arrow visible (cruise revenue breakdown).
SELF-TEST: list three choices in your output that differ from the default component rendering; if you can't, you shipped the boring twin.
