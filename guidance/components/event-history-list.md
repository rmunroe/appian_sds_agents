# Event History List (a!eventHistoryListField)

Displays record events — who acted on the record and when — for one or more record types in a single chronological stream, optionally with comments and @mentions. Reach for it for activity feeds, audit trails, and discussion-on-events; NOT when users need to sort/compare tabular values (a!gridField) or when the page needs milestone-only status in minimal space (that's this component's Timeline style, not a grid).

## Variants (Style)
- **Preview List** — snapshot of most recent events beside other components (summary views, reports, home pages). Host in a fixed-width column: "Medium", "Medium Plus", "Wide", or "Wide Plus"; if the column must be smaller, switch to Timeline. Preview List Page Size 3–5 (5–10 if it runs the full interface length); Page Size 25–50 for the "View All" dialog, which auto-resizes.
- **Full List** — the main/only component on the page; searchable and filterable; with collaboration enabled it also takes top-level comments + threads while keeping focus on events. Page Size 25–50; should occupy the majority of the interface.
- **Comment List** — unified stream where users discuss events, add context, and @mention right in the component; sits alongside other components. Put the composer above the feed, not below (corpus campaign record). Page Size 5–10; not the majority of the page.
- **Timeline** — milestones/events without extra details; date and time first. Fixed column "Medium"–"Wide Plus"; with no tags configured use "Narrow" to remove dead whitespace; long timelines can take a full-length column. Page Size 6–10.

## Styling hooks
- **User Image Style**: Profile Photo (default when most users have photos; missing ones fall back to initials) · Initials (uniform look when photo coverage is poor; deterministic per-user colors, e.g. indigo #4a63a8 est.) · None (reclaims width in narrow columns; the name stays bold).
- **User Color Scheme**: predefined or custom hex — colors the initials circles (and photo fallbacks).
- **Timestamp format**: date · date + time · date + time + timezone — drop any precision users don't need.
- **Card hosting**: a!cardLayout(padding: "NONE") so the component's full-width divider lines run flush to the card edges; any other padding "will impact the length of the divider lines" (page rule) and the list reads as a widget pasted inside a widget.

## Idioms
1. **Preview rail on an operator home** (eventHistoryListPreviewExample): [1:2:1] columns; right rail = SECTION "My Orders" → CARD(padding:"NONE", preview list ×5 rows, profile photos, "View All (24)"); actor-first sentences ("Linda Johnson Delivered Order") with order IDs demoted to gray tag chips — the count advertises depth before the click.
2. **Centered full list** (fullPreviewCorrect DO): a!columnsLayout(columns: {a!columnLayout(width:"AUTO"), a!columnLayout(width:"WIDE", contents: full list + search/EVENT TYPE/DATE RANGE toolbar), a!columnLayout(width:"AUTO")}) — one ~900px reading column keeps the actor→event→tag scan intact.
3. **Timeline spine on a record view** (Order 125): narrow left column of [1:2:1]; 7 bordered event cards on a plum dot spine; date rail splits SMALL-caps month over LARGE bold day; a solid year chip ("2023") anchors the era once; "7 items" count closes the feed; event titles first ("Delivered Order"), actor demoted to gray metadata.

## Top don't
Dropping a Full List bare on the interface (fullPreviewIncorrect DON'T): rows stretch ~1999px edge-to-edge, the filter dropdowns balloon, and each row's expand chevron strands far right of its text — dead space dominates and eye travel breaks. Always center it: Wide middle column, Default/AUTO flanks.
