# University Student Dashboard

**Pattern**: [home-pages-employee](../patterns/home-pages-employee.md) — personal self-service portal home: hand-built left nav rail + tinted two-column canvas, density 3.

## Scenario
- **Persona**: undergraduate student (Karen Anderson, BS, Spring 2022 grad); occasional-customer cadence — checks daily, plans weekly.
- **Domain**: higher education — "Baxley" university self-service portal; one-violet institutional brand softened by portrait photos and an illustration (warm-community + institutional).
- **Ranked tasks**: 1. "When and where is my next class?" → 2. track progress toward graduation → 3. act on seasonal items (spring registration, advisor meetings).

## Data model
Student(name, photo, maskedId ***-**-1234, program, gradTerm) 1—N ClassMeeting(weekday, start–end, course, building+room; Mon 3, Tue 2, Wed 3, Thu 2, Fri 0) · 1—1 DegreeProgress(120 required, 92 completed, 15 in-progress, 77% ≈ 92/120) 1—N RequirementItem(3 done, 1 open) · SupportContact(name, role, photo)×3 · Announcement(registration CTA)

## Skeleton
```
HEADER-CONTENT (header:{} — dark top bar is site chrome; bg #f3f0f6, contentsPadding NONE)
└─ COLUMNS [NARROW_PLUS:AUTO]
   ├─ CARD(white nav rail, shadow, padding LESS)
   │  ├─ SECTION avatar+name+masked-id, divider BELOW
   │  ├─ 6× CARD-as-link nav rows ("❘" glyph + icon + label)
   │  ├─ SECTION "QUICK ACCESS" ×4 safeLinks, divider ABOVE
   │  └─ 2× empty CARD h=EXTRA_TALL (rail stretcher)
   └─ CARD(style #f3f0f6, padding MORE)  ← tinted canvas wrapper
      └─ COLUMNS [AUTO:MEDIUM_PLUS] spacing=SPARSE
         ├─ SECTION "My Class Schedule"
         │  └─ 5× CARD(day, shadow, decorativeBar START: Tue=ACCENT else #fff;
         │            rows = SBS [2X time | 5X course | 2X room], divider ABOVE)
         └─ SECTION "My Path to Graduation"
            ├─ CARD(gauge 77% + degree SBS, 3-col credits w/ dividers, 4-item checklist)
            ├─ CARD(promo, style #f1e8f4, decorativeBar TOP ACCENT: illustration + CTA)
            └─ SECTION "My Support Team" → CARD(3× avatar+role+button rows)
```

## Palette (code-verified unless marked est.)
| role | hex | applied to |
|---|---|---|
| canvas tint | #f3f0f6 | `a!headerContentLayout(backgroundColor:)` AND canvas wrapper `a!cardLayout(style:)` |
| card surface | white (`style: "NONE"`) | rail, day cards, graduation, support — all `showBorder: false, showShadow: true` |
| promo tint | #f1e8f4 | promo `a!cardLayout(style:)` |
| accent | `ACCENT` token (renders ≈#2f165e est.) | active nav glyph/icon/label, Tuesday decorativeBar, promo TOP bar + headline, gauge fill, quick-access links |
| inactive nav | #444 | the 5 inactive nav rows' icons + labels |
| invisible | #fff / #ffffff | non-Tuesday decorativeBars; inactive "❘" glyphs |
| gauge icon | #555 | graduation-cap `a!gaugeIcon` |
| positive | `POSITIVE` token (renders ≈#5bbd38 est.) | checklist check-circle icons — the only green on the page |
| secondary | `SECONDARY` token | masked id, all-caps credit labels, info-circle icons, "No classes scheduled", advisor buttons |

One accent, rationed to selection + action; everything else is grayscale weight contrast on white. No EXTRA_LARGE text anywhere — the biggest sizes are MEDIUM_PLUS (degree) and LARGE (credit numbers).

## Signature moves
1. Instead of built-in site navigation → a rail of borderless card-links: each `a!cardLayout(link: a!dynamicLink(), padding: "NONE", showBorder: false)` wrapping a sideBySide of "❘" glyph + icon + label. Active row: all three ACCENT (+ STRONG label). Inactive rows: glyph `color: "#ffffff"` (invisible on white), icon/label #444 — the selection bar is literal text painted invisible, so switching rows never shifts alignment.
2. Instead of tinting "today's" card → `decorativeBarPosition: "START"` on all five day cards, `decorativeBarColor: "ACCENT"` on Tuesday only, `"#fff"` on the rest — every card carries the bar, so geometry stays identical across siblings.
3. Two-surface illusion → `contentsPadding: "NONE"` on the headerContentLayout plus a wrapper card `style: "#f3f0f6"` matching the page `backgroundColor` exactly: the white rail runs flush to the top edge while content floats on the tint, with zero visible seams.
4. Instead of `a!kpiField` → the credits trio is a 3-column `a!columnsLayout(showDividers: true)` of rich text: SMALL SECONDARY all-caps label over a LARGE number.
5. Rail height faked → two empty `a!cardLayout(height: "EXTRA_TALL")` spacers stretch the white rail toward full viewport height below QUICK ACCESS.
6. Promo without an alert banner → tinted card `style: "#f1e8f4"` + `decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT"` + illustration + ACCENT MEDIUM STRONG headline + OUTLINE SMALL "Register Now" button — the only saturated surface on the page, so the seasonal CTA interrupts the scan on its own.

## Boring twin (what a lazy build would do — avoid this)
Default site left nav, white background, borders on; the schedule as one read-only grid (Day/Time/Course/Room); credits as three stock `a!kpiField`s; the registration notice as a message banner; advisors as a default-blue link list.

## Annotated SAIL excerpts
Source: guidance/sail/sources/university-student-dashboard.sail (1621 lines)

**1. Card-link nav row with invisible-glyph selection bar (active: L47–98; inactive twin: L99–152).** Inactive rows are identical except glyph `color: "#ffffff"`, icon/label `"#444"`, no STRONG. A11y caveat from the analysis: the "❘" is literal white-on-white text to screen readers and the dynamicLinks have empty saveInto — wire real navigation when emulating.
```sail
a!cardLayout(
  contents: {
    a!sideBySideLayout(
      items: {
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { a!richTextItem(text: { "❘" }, color: "ACCENT",
              size: "LARGE") }),
          width: "MINIMIZE"),
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { a!richTextIcon(icon: "home", color: "ACCENT",
              size: "STANDARD") }),
          width: "MINIMIZE"),
        a!sideBySideItem(
          item: a!richTextDisplayField(labelPosition: "COLLAPSED",
            value: { a!richTextItem(text: { "Home" }, color: "ACCENT",
              size: "MEDIUM", style: { "STRONG" }) },
            preventWrapping: true))
      },
      alignVertical: "MIDDLE")
  },
  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
  height: "AUTO", padding: "NONE",
  marginAbove: "LESS", marginBelow: "NONE", showBorder: false)
```

**2. Tuesday highlight via decorative bars (Monday tail L623–631 vs Tuesday tail L739–747).** The non-Tuesday bars are present but invisible — the pixels only look like they're missing.
```sail
/* Monday / Wednesday / Thursday / Friday cards end with: */
  height: "AUTO", style: "NONE", padding: "STANDARD",
  marginBelow: "STANDARD", showBorder: false, showShadow: true,
  decorativeBarPosition: "START",
  decorativeBarColor: "#fff"           /* present but invisible */

/* Tuesday card — identical params except: */
  decorativeBarColor: "ACCENT"
/* …and its day label adds style: { "STRONG" } (L643–647) */
```

**3. Two-surface frame (L1–2 + L1607–1621).** The wrapper card re-supplies the padding the layout gave up, so the rail reads as fixed chrome and content as a separate tinted canvas — two surfaces from one columnsLayout.
```sail
a!headerContentLayout(
  header: {},                          /* dark top bar in screenshot = site chrome */
  contents: {
    a!columnsLayout(columns: {
      a!columnLayout(width: "NARROW_PLUS",
        contents: { /* white rail card: padding "LESS", showShadow: true */ }),
      a!columnLayout(contents: {
        a!cardLayout(
          contents: { /* inner two-column content */ },
          height: "AUTO",
          style: "#f3f0f6",            /* matches page backgroundColor exactly */
          padding: "MORE",
          marginBelow: "NONE",
          showBorder: false)
      })
    })
  },
  backgroundColor: "#f3f0f6",
  contentsPadding: "NONE")             /* lets the rail run flush to the header */
```

**4. Rail stretcher (L437–450).** Empty EXTRA_TALL cards keep the white rail from stopping at QUICK ACCESS. Caveat: when columns stack (stackWhen includes DESKTOP_NARROW), these push content far down — gate them if you keep the stacking list.
```sail
a!cardLayout(
  contents: {},
  height: "EXTRA_TALL",
  style: "NONE",
  marginBelow: "STANDARD",
  showBorder: false)
/* ×2, back-to-back */
```

**5. Credits trio + schedule row proportions (L1110–1163; rows L499–534).** Weight, not color, separates schedule columns: STRONG times vs regular course names.
```sail
a!columnsLayout(
  columns: {
    a!columnLayout(contents: {
      a!richTextDisplayField(labelPosition: "COLLAPSED", value: {
        a!richTextItem(text: { "REQUIRED CREDITS" },
          color: "SECONDARY", size: "SMALL"),
        char(10),
        a!richTextItem(text: { "120" }, size: "LARGE")
      })
    })
    /* ×2 more columns: COMPLETED 92 · IN-PROGRESS 15 */
  },
  alignVertical: "MIDDLE",
  showDividers: true)
/* schedule row (L499–534): a!sideBySideLayout widths
   2X "9:00AM – 10:00AM" STRONG | 5X course name, regular |
   2X map-marker icon + " Thompson 404" — divider: "ABOVE" per row */
```

## Skeleton SAIL
```sail
a!headerContentLayout(
  header: {},
  contents: {
    a!columnsLayout(columns: {
      /* ── RAIL ── */
      a!columnLayout(
        width: "NARROW_PLUS",
        contents: a!cardLayout(
          contents: {
            a!sectionLayout(           /* identity block */
              label: "",
              contents: a!sideBySideLayout(items: {
                a!sideBySideItem(width: "MINIMIZE", item: a!imageField(
                  images: { a!userImage(user: fn!loggedInUser()) },
                  size: "SMALL", style: "AVATAR")),
                a!sideBySideItem(item: /* "Karen Anderson" MEDIUM STRONG +
                  char(10) + "***-**-1234" rich text */)
              }, alignVertical: "MIDDLE"),
              divider: "BELOW", marginAbove: "STANDARD"),
            a!cardLayout(/* active "Home" nav row — see excerpt 1 */),
            /* ×5 more nav card-links (glyph "#ffffff", icon+label "#444"):
               Classes · Health & Safety · Housing & Residence Life ·
               Tuition & Financial Aid · Career Services */
            a!sectionLayout(           /* QUICK ACCESS */
              label: "",
              contents: a!cardLayout(contents: {
                /* "QUICK ACCESS" SECONDARY kicker + 4× a!linkField(
                   a!safeLink(label: "Student Clinic Appointments" etc.,
                   uri: "www.appian.com", openLinkIn: "NEW_TAB")) */
              }, style: "NONE", showBorder: false),
              divider: "ABOVE", marginAbove: "EVEN_MORE"),
            a!cardLayout(contents: {}, height: "EXTRA_TALL",
              style: "NONE", showBorder: false)
            /* ×1 more EXTRA_TALL stretcher */
          },
          height: "AUTO", style: "NONE", padding: "LESS",
          marginBelow: "NONE", showBorder: false, showShadow: true)),
      /* ── TINTED CANVAS ── */
      a!columnLayout(contents: a!cardLayout(
        contents: a!columnsLayout(
          columns: {
            a!columnLayout(contents: a!sectionLayout(
              label: "My Class Schedule",
              labelSize: "MEDIUM", labelColor: "STANDARD",
              contents: {
                a!cardLayout(          /* Monday */
                  contents: {
                    a!sectionLayout(label: "", marginBelow: "NONE",
                      contents: { /* "Monday" MEDIUM */ }),
                    /* 3× class-row sections, divider: "ABOVE" —
                       2X|5X|2X rows, see excerpt 5 */
                  },
                  height: "AUTO", style: "NONE", padding: "STANDARD",
                  marginBelow: "STANDARD", showBorder: false, showShadow: true,
                  decorativeBarPosition: "START", decorativeBarColor: "#fff")
                /* ×4 more day cards: Tuesday = decorativeBarColor "ACCENT" +
                   STRONG label · Wed/Thu = "#fff" · Friday = "#fff" with
                   centered SECONDARY "No classes scheduled" */
              })),
            a!columnLayout(
              width: "MEDIUM_PLUS",
              contents: {
                a!sectionLayout(
                  label: "My Path to Graduation",
                  labelSize: "MEDIUM", labelColor: "STANDARD",
                  contents: a!cardLayout(
                    contents: {
                      a!sideBySideLayout(items: {
                        a!sideBySideItem(width: "MINIMIZE", item: a!gaugeField(
                          labelPosition: "COLLAPSED",
                          percentage: 77.0,
                          primaryText: a!gaugeIcon(icon: "graduation-cap",
                            color: "#555"),
                          size: "SMALL")),
                        a!sideBySideItem(item: /* "Bachelor of Science (BS)"
                          MEDIUM_PLUS + char(10) + "Spring 2022" MEDIUM */)
                      }, alignVertical: "MIDDLE", spacing: "SPARSE"),
                      a!columnsLayout(/* credits trio — see excerpt 5 */),
                      a!sectionLayout(label: "", divider: "ABOVE", contents: {
                        /* 4× checklist sideBySides: check-circle POSITIVE
                           MEDIUM_PLUS (circle-o-notch SECONDARY for the open
                           item) + MEDIUM text + info-circle SECONDARY */
                      })
                    },
                    height: "AUTO", style: "NONE", padding: "STANDARD",
                    marginBelow: "STANDARD", showBorder: false,
                    showShadow: true)),
                a!cardLayout(          /* registration promo */
                  contents: a!columnsLayout(columns: {
                    a!columnLayout(width: "NARROW",
                      contents: { /* illustration imageField, size: "FIT" */ }),
                    a!columnLayout(contents: {
                      /* "Spring Semester Class Registration is Now Open"
                         ACCENT MEDIUM STRONG */
                      a!buttonArrayLayout(align: "START", buttons: {
                        a!buttonWidget(label: "Register Now", icon: "pen-fancy",
                          size: "SMALL", style: "OUTLINE")
                      })
                    })
                  }, alignVertical: "MIDDLE"),
                  height: "AUTO", style: "#f1e8f4", marginBelow: "MORE",
                  showBorder: false, showShadow: true,
                  decorativeBarPosition: "TOP", decorativeBarColor: "ACCENT"),
                a!sectionLayout(
                  label: "My Support Team",
                  labelSize: "MEDIUM", labelColor: "STANDARD",
                  contents: a!cardLayout(
                    contents: {
                      /* 3× advisor sections (divider: "BELOW"; last "NONE"):
                         SBS = a!webImage portrait AVATAR SMALL | name MEDIUM
                         STRONG + role | a!buttonWidget("Schedule Meeting",
                         icon: "calendar", size: "SMALL", style: "OUTLINE",
                         color: "SECONDARY") */
                    },
                    height: "AUTO", style: "NONE", padding: "STANDARD",
                    marginBelow: "STANDARD", showBorder: false,
                    showShadow: true))
              })
          },
          spacing: "SPARSE",
          stackWhen: { "PHONE", "TABLET_PORTRAIT", "TABLET_LANDSCAPE",
            "DESKTOP_NARROW" }),
        height: "AUTO", style: "#f3f0f6", padding: "MORE",
        marginBelow: "NONE", showBorder: false))
    })
  },
  backgroundColor: "#f3f0f6",
  contentsPadding: "NONE")
```

## Full source
`sail/sources/university-student-dashboard.sail` — load only if emulating this page end-to-end.
