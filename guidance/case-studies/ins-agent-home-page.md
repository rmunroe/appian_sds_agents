# Insurance Agent Home Page (INSURECORP)

**Pattern**: [patterns/home-pages-employee.md](../patterns/home-pages-employee.md) — operational daily-driver variant: single-viewport 3-column, density 4, register warm-community + utilitarian-ops.

## Scenario
Denise Simmons, P&C insurance agent — the first screen of her workday, every day. Domain: consumer insurance ("INSURECORP") — warm brand wrapped around a dense working tool. Ranked tasks: 1. Clear today's assigned tasks, overdue first. 2. See today/this week in month-calendar context without leaving home. 3. Catch up on @mention conversations and launch New Client / Claim / Quote.

## Data model
- Task(title, client, assignees 1..n, dueDateTime, overdue?) ×5 — ownership per card: "Assigned to you" vs "Assigned to WeHo Office"
- CalendarEvent(date, category → bullet shape+color, title) ×6
- Message(author, initials, timestamp, body, @mention, linkedClaim 0..1) ×2
- Claim(number "#431-914-53", type AUTO|HOMEOWNER, date); people stamps DS/YK/JK/CB

## Skeleton
```
HEADER-CONTENT bg=#f4f2f1 contentsPadding=MORE (top INSURECORP nav = site chrome, not in SAIL)
├─ SBS greeting: #ee7955 icon + "Good morning, Denise" LARGE STRONG + line-art illustration + date  marginBelow=EVEN_MORE
├─ COLUMNS [MEDIUM:AUTO:MEDIUM] spacing=SPARSE stackWhen=PHONE,TABLET_PORTRAIT
│  ├─ SECTION "My Tasks"+"View all tasks" → CARD(task, shadow no-border) ×5
│  ├─ SECTION "Calendar"+"Go to full calendar" → CARD(month-nav bar / weekday row / GRID(7-col, 5 rows), dividers)
│  └─ SECTION "Actions"+"Manage" → CARD(icon-stamp + label) ×3
│     SECTION "Conversations"+"View all threads" → CARD(message + nested claim chip) ×2
└─ duplicated calendar COLUMNS [1X:8X:1X], shown ONLY at TABLET_LANDSCAPE/DESKTOP_NARROW
```

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| page canvas | #f4f2f1 | headerContentLayout backgroundColor (warm greige) |
| headings | #54514e | greeting, section headers |
| metadata | #666666 / #555555 | task metadata SMALL; phone agenda day number |
| greeting accent | #ee7955 | richTextIcon beside greeting (code says icon:"sun") |
| links / @mentions | ACCENT token (≈#4a72d1 est.) | "View all" links, reply/ellipsis icons, @mentions |
| calendar chrome | #f3f3f3 (phone #f7f7f7 / #efefef) | weekday header cells; phone date blocks |
| identity stamps | #D19FCB #79B096 #ccc #eccd5f #9dd0aa | TINY initials stamps DS / YK / "+3" / JK / CB |
| action stamps | #de8cb7 #b094da #6fbb62 (contentColor #ffffff) | New Client / New Claim / New Quote |
| tags | NEGATIVE · #9db6d0 · #9dd0ae | OVERDUE · AUTO · HOMEOWNER |
| claim chip tile | #674ea7 on #d9d2e9 | icon tile in nested claim mini-card |
| event bullets | #6d9eeb circle · #93c47d square · NEGATIVE triangle | category/severity coding in day cells |

Cards: `style:"NONE", showShadow:true, showBorder:false, shape:"ROUNDED"`. No colored header bar or buttons — color lives only in small chips, so the one red OVERDUE tag monopolizes alarm.

## Signature moves
1. Instead of a stock calendar component → hand-built month grid, via 7 `a!columnLayout`s in `a!columnsLayout(spacing:"NONE", showDividers:true)`, `a!horizontalLine` row separators, fixed-height transparent day cards (`local!dayHeight:"SHORT"`).
2. Instead of bordered clickable rows → whole-card links, via `a!cardLayout(link: a!dynamicLink(...))` + shadow on every task, action, thread card.
3. Instead of avatars or a KPI row → one TINY pastel `a!stampField` language: 8 coordinated hexes for identity (initials), actions (white icons), overflow ("+3" on #ccc).
4. Instead of a text link to a claim → an embedded claim mini-card inverting the page's card treatment (`showBorder:true, showShadow:false, padding:"NONE"`) inside the shadowed thread card — the inversion marks linked-record content.
5. Instead of one fluid layout → three purpose-built renderings: desktop 3-column, `if(a!isPageWidth("PHONE"))` agenda list, and a duplicated medium-width calendar gated by `showWhen: not(a!isPageWidth({...}))`.
6. Instead of default white → the #f4f2f1 greige canvas keeping ~11 borderless white zones legible on shadow alone.

## Boring twin (what a lazy build would do — avoid this)
White page, solid blue header bar, tasks as an `a!gridField` with a due-date column, a 4-up KPI row, "Quick Links" buttons, notifications in a plain grid — and no calendar at all. Kill it by keeping the tinted canvas + shadow-only cards, the pastel stamp system, and the in-place month grid.

## Annotated SAIL excerpts
Source: guidance/sail/sources/ins-agent-home-page.sail.

### 1. Hand-built month grid (L958–1097 weekday header; L1643–1690 day cell)
```
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!cardLayout(
        contents: {
          a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { "SUN" }, preventWrapping: true, align: "CENTER")
        },
        height: "AUTO", style: "#f3f3f3",
        padding: local!headerPadding, /* "STANDARD" on DESKTOP_WIDE, else "EVEN_LESS" (L564) */
        marginBelow: "NONE", showBorder: false
      )
    })
    /* ×6 more weekday cells (MON..SAT), same shape */
  },
  marginBelow: "NONE", spacing: "NONE", showDividers: true
),
a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
/* each week = another 7-col columnsLayout(spacing NONE, showDividers) of day cards: */
a!cardLayout(
  contents: {
    a!richTextDisplayField( /* day number, right-aligned via align: "RIGHT" in a sideBySideLayout */
      value: { a!richTextItem(text: { "15" }, color: "STANDARD", size: "MEDIUM", style: { "STRONG" }) }),
    a!richTextDisplayField(labelPosition: "COLLAPSED",
      value: {
        a!richTextIcon(icon: "circle", color: "#6d9eeb", size: "SMALL"),
        a!richTextItem(text: { " Generate renewal quote for Mendez, S." }, size: "SMALL")
      },
      preventWrapping: true, marginBelow: "EVEN_LESS")
  },
  height: local!dayHeight, /* "SHORT" (L2) — uniform cells whether empty or busy */
  style: "TRANSPARENT", marginBelow: "NONE", showBorder: false
)
```
Grid lines come free from `showDividers` + `spacing:"NONE"`; `a!horizontalLine` separates week rows. Today = STRONG, adjacent month = `color:"SECONDARY"`; bullets encode category by shape+color (survives colorblindness). `preventWrapping` truncates long titles — known risk.

### 2. Responsive spacer columns + duplicated calendar (L87–98, L553–557, L2298–2305, L2812–2834, L4288–4298)
```
a!columnsLayout(
  columns: {
    /* Extra spacing for two column layout on landscape tablet and narrow desktop */
    a!columnLayout(
      width: if(a!isPageWidth("DESKTOP_WIDE"), null, "1X"),
      contents: {},
      showWhen: a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW" })
    ),
    a!columnLayout(/* My Tasks */
      width: if(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }), "MEDIUM", "4X")),
    a!columnLayout(/* Calendar — no width param (AUTO) */
      showWhen: a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP", "TABLET_PORTRAIT", "PHONE" })),
    a!columnLayout(/* Actions + Conversations */
      width: if(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }), "MEDIUM", "4X")),
    a!columnLayout(/* mirror spacer */
      width: if(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }), null, "1X"),
      contents: {},
      showWhen: a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW" }))
  },
  spacing: "SPARSE",
  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
),
/* Calendar for medium screen sizes: a second full build of the calendar card */
a!columnsLayout(
  spacing: "SPARSE",
  columns: { /* 1X spacer | 8X calendar | 1X spacer */ },
  showWhen: not(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP", "TABLET_PORTRAIT", "PHONE" }))
)
```
At TABLET_LANDSCAPE/DESKTOP_NARROW the calendar column vanishes, outer columns flip `MEDIUM`→`4X`, and empty `1X` columns switch on as fake gutters; the calendar reappears below as an 8X duplicate (L2837–4298) — code duplication buys a real 2-column middle breakpoint.

### 3. Claim chip nested in a thread card (L2539–2632)
```
a!cardLayout( /* sits inside the shadowed conversation card, after the message text */
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(width: "EXTRA_NARROW", contents: {
          a!cardLayout(
            contents: {
              a!richTextDisplayField(labelPosition: "COLLAPSED",
                value: { a!richTextIcon(icon: "file-invoice-dollar", color: "#674ea7", size: "MEDIUM_PLUS") },
                align: "CENTER", marginAbove: "EVEN_LESS", marginBelow: "EVEN_LESS")
            },
            height: "AUTO", style: "#d9d2e9", marginBelow: "NONE", showBorder: false
          )
        }),
        a!columnLayout(contents: {
          a!cardLayout(
            contents: {
              a!sideBySideLayout( /* "Claim #431-914-53" STRONG, preventWrapping |
                a!tagField(a!tagItem(text: "AUTO", backgroundColor: "#9db6d0"), size: "SMALL"), MINIMIZE */
                alignVertical: "MIDDLE", marginBelow: "NONE"),
              a!richTextDisplayField( /* "Nov 6, 2023" color SECONDARY */
                preventWrapping: true, marginBelow: "NONE")
            },
            height: "AUTO", style: "NONE", marginBelow: "NONE", showBorder: false
          )
        })
      },
      alignVertical: "MIDDLE", spacing: "NONE"
    )
  },
  link: a!dynamicLink(),
  height: "AUTO", style: "NONE", shape: "SEMI_ROUNDED", padding: "NONE",
  marginAbove: "LESS", marginBelow: "NONE", showBorder: true, showShadow: false
)
```
The linked-record chip recipe: `padding:"NONE"` + `spacing:"NONE"` lets the EXTRA_NARROW tinted icon tile run full-bleed to the chip's edge; border-not-shadow inverts the host card so nesting reads instantly.

Fourth technique, no excerpt: the phone agenda swap (L679–954) — `if(a!isPageWidth("PHONE"), {agenda rows}, {7-col grid})` in the same card; each agenda row = `stackWhen:"NEVER"` columnsLayout with an EXTRA_NARROW two-tone date block (#f7f7f7 day number over #efefef "THU" strip) beside event text.

## Skeleton SAIL
```
a!localVariables(
  local!dayHeight: "SHORT",
  a!headerContentLayout(
    header: {},
    contents: {
      /* Greeting bar: sun icon #ee7955 LARGE | "Good morning, Denise" #54514e LARGE STRONG |
         illustration EXTRA_LARGE (DESKTOP_WIDE only) | date MEDIUM (hidden PHONE/TABLET_PORTRAIT) */
      a!sideBySideLayout(items: { /* 4 items, MINIMIZE except illustration */ },
        alignVertical: "MIDDLE", marginBelow: "EVEN_MORE"),
      a!columnsLayout(
        columns: {
          a!columnLayout(/* 1X spacer — excerpt 2 */),
          a!columnLayout( /* ── My Tasks ── */
            width: if(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }), "MEDIUM", "4X"),
            contents: a!sectionLayout(label: "", contents: {
              a!sideBySideLayout(/* "My Tasks" MEDIUM_PLUS STRONG #54514e | "View all tasks" a!dynamicLink STANDALONE */),
              a!cardLayout(
                contents: {
                  /* title STRONG */
                  a!sideBySideLayout(/* DS stamp #D19FCB TINY | "Assigned to you" SMALL #666666 | ellipsis-v link */, spacing: "DENSE"),
                  a!sideBySideLayout(/* clock-o " Yesterday at 5:00PM" SMALL #666666 | OVERDUE tag NEGATIVE SMALL */)
                },
                link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                height: "AUTO", style: "NONE", shape: "ROUNDED", padding: "STANDARD",
                marginBelow: "STANDARD", showBorder: false, showShadow: true
              )
              /* ×4 more task cards, same shape; team tasks add YK #79B096 + "+3" #ccc stamps */
            })
          ),
          a!columnLayout( /* ── Calendar ── */
            showWhen: a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP", "TABLET_PORTRAIT", "PHONE" }),
            contents: a!localVariables(
              local!headerPadding: if(a!isPageWidth({ "DESKTOP_WIDE" }), "STANDARD", "EVEN_LESS"),
              a!sectionLayout(contents: {
                a!sideBySideLayout(/* "Calendar" header | "Go to full calendar" plain ACCENT text (not a link) */),
                a!cardLayout(
                  contents: {
                    a!cardLayout(/* month bar: chevron links, "November 2023" MEDIUM STRONG,
                                    a!dropdownField(Day/Week/Month, value: 3, showWhen: not PHONE) */
                      style: "TRANSPARENT", padding: "STANDARD", marginBelow: "NONE", showBorder: false),
                    a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                    if(a!isPageWidth("PHONE"),
                      { /* agenda rows — see note above excerpt list */ },
                      { /* weekday header + 5 week rows of day cards — excerpt 1 */ })
                  },
                  height: "AUTO", style: "NONE", shape: "ROUNDED", padding: "NONE",
                  marginBelow: "NONE", showBorder: false, showShadow: true
                )
              })
            )
          ),
          a!columnLayout( /* ── Actions + Conversations ── */
            width: if(a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }), "MEDIUM", "4X"),
            contents: {
              a!sectionLayout(label: "", contents: {
                a!sideBySideLayout(/* "Actions" | "Manage" plain ACCENT text */),
                a!cardLayout(
                  contents: a!sideBySideLayout(/* user-plus stamp #de8cb7 contentColor #ffffff TINY | "New Client" */),
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  height: "AUTO", style: "NONE", shape: "ROUNDED", marginBelow: "STANDARD",
                  showBorder: false, showShadow: true
                )
                /* ×2 more: "New Claim" file-invoice-dollar #b094da; "New Quote" comment-dollar #6fbb62 */
              }),
              a!sectionLayout(label: "", contents: {
                a!sideBySideLayout(/* "Conversations" | "View all threads" plain ACCENT text */),
                a!cardLayout(
                  contents: {
                    a!sideBySideLayout(/* JK stamp #eccd5f TINY | "Jane Kim" STRONG + " • A moment ago" SECONDARY SMALL | reply + ellipsis ACCENT */),
                    a!richTextDisplayField(value: { a!richTextItem(text: "@Denise Simmons", color: "ACCENT"), " …" }),
                    /* nested claim chip — excerpt 3 */
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  height: "AUTO", style: "NONE", shape: "ROUNDED", padding: "STANDARD",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true
                )
                /* ×1 more thread card (CB #9dd0aa, HOMEOWNER chip) */
              })
            }
          ),
          a!columnLayout(/* mirror 1X spacer */)
        },
        spacing: "SPARSE",
        stackWhen: { "PHONE", "TABLET_PORTRAIT" }
      )
      /* + duplicated calendar [1X:8X:1X] for medium widths — excerpt 2 */
    },
    backgroundColor: "#f4f2f1",
    contentsPadding: "MORE"
  )
)
```

## Full source
`sail/sources/ins-agent-home-page.sail` (4303 lines) — load only if emulating this page end-to-end. The header illustration is an empty `a!imageField` placeholder; the top nav bar is site chrome (`header: {}`), not in the expression.
