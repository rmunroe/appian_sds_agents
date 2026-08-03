# Analysis: university-student-dashboard

## university_student_dashboard.png

### Identification
- **Image**: university_student_dashboard.png | **Source page**: university-student-dashboard | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) university student"
- **Device frame**: desktop (3360x2100 @2x = one 1680x1050 viewport)
- **Marker**: neutral
- **UI type**: home-page (student self-service portal)

### Use-case reconstruction (INFERRED)
- **Persona**: undergraduate student (Karen Anderson, BS, Spring 2022 grad); occasional-customer cadence — checks daily, plans weekly.
- **Domain & brand context**: higher education — "Baxley" university self-service portal; one-violet institutional brand, softened by photos and an illustration.
- **Top 3 user tasks (ranked)**: 1. "When and where is my next class?" 2. Track progress toward graduation. 3. Act on seasonal items — register for spring, book advisor meetings.
- **Implied requirements**: "Must show the weekly schedule with times and rooms without leaving home"; "Must flag the current weekday"; "Must show degree completion at a glance"; "Must promote the registration window above steady-state content"; "Must offer one-click scheduling with each support person".
- **Data model sketch** (OBSERVED): Student(name, photo, maskedId ***-**-1234, program, gradTerm) 1—N ClassMeeting(weekday, start–end, course, building+room; Mon 3, Tue 2, Wed 3, Thu 2, Fri 0); 1—1 DegreeProgress(120 required, 92 done, 15 in-progress, 77% ≈ 92/120) 1—N RequirementItem(3 done, 1 open); 1—N SupportContact(name, role, photo) ×3; Announcement(registration CTA).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (header:{} — dark bar above is site theme chrome; bg #f3f0f6, contentsPadding NONE)
└─ COLUMNS [NARROW_PLUS:AUTO]
   ├─ CARD(white nav rail, shadow, padding LESS)
   │  ├─ SECTION avatar+name+masked-id, divider BELOW
   │  ├─ 6× CARD-as-link nav rows ("❘" glyph + icon + label)
   │  ├─ SECTION "QUICK ACCESS" ×4 safeLinks, divider ABOVE
   │  └─ 2× empty CARD h=EXTRA_TALL (rail stretcher)
   └─ CARD(style #f3f0f6, padding MORE)
      └─ COLUMNS [AUTO:MEDIUM_PLUS] spacing=SPARSE
         ├─ SECTION "My Class Schedule"
         │  └─ 5× CARD(day, shadow, decorativeBar START: Tue=ACCENT, others=#fff)
         │     └─ rows SBS [2X time | 5X course | 2X map-marker+room], divider ABOVE
         └─ SECTION "My Path to Graduation"
            ├─ CARD(gauge 77% + degree SBS, KPI-ROW ×3 via COLUMNS showDividers, 4-item checklist)
            ├─ CARD(promo, style #f1e8f4, decorativeBar TOP ACCENT: illustration + CTA)
            └─ SECTION "My Support Team" → CARD(3× avatar+role+button rows)
```
- **Above the fold**: full rail, Mon–Thu cards (Friday clipped), graduation card, promo, 3 support rows.
- **Reading order**: F — rail anchors left; sweep across the schedule header, down day cards, then the right column.
- **Hierarchy rationale**: schedule owns the widest column and first sweep (daily task 1); graduation summary heads the right column for weekly reflection (task 2); promo is the only saturated surface, interrupting scan for the seasonal CTA (task 3).
- **Density**: 3 — the conventions' own anchor for balanced product UI: ~9 zones; 10 schedule rows + 3 credit KPIs + 4 checklist items + 3 people per viewport at STANDARD padding.
- **Ratios & spacing**: outer [NARROW_PLUS:rest]; inner [AUTO:MEDIUM_PLUS] spacing SPARSE; day cards padding STANDARD, marginBelow STANDARD; rail padding LESS; wrapper padding MORE; schedule rows 2X:5X:2X.

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page + canvas #f3f0f6; cards #ffffff; promo fill #f1e8f4; accent token renders #2f165e (est.); site header #20123b (est., theme chrome); inactive nav #444; gauge icon #555; POSITIVE renders #5bbd38 (est.); SECONDARY grays.
- **Color application points**: accent on active-nav glyph/icon/label, Tuesday day-bar, quick-access links, gauge ring, promo bar/headline/button; green only on checklist checks; all else grayscale on white.
- **Typography moves**: section labels MEDIUM, labelColor STANDARD (#222 OBSERVED); day names MEDIUM; times STANDARD+STRONG vs regular course names — weight, not color, separates columns; degree MEDIUM_PLUS; credit numbers LARGE under SMALL SECONDARY all-caps labels; user name MEDIUM STRONG. No EXTRA_LARGE anywhere.
- **Imagery stance**: photos — userImage avatar + 3 webImage portraits (AVATAR SMALL); one brand-violet promo illustration; gray/accent STANDARD icons.
- **Card treatment**: borderless + shadow (showBorder:false, showShadow:true), style NONE white; two tinted exceptions (#f1e8f4 promo, #f3f0f6 canvas wrapper).
- **Signature moves**: (1) instead of built-in site nav, a rail of borderless card-links, each a SBS of "❘" glyph + icon + label — active row all ACCENT, inactive glyph #ffffff: an invisible selection bar that never shifts alignment; (2) instead of filling "today's" card, decorativeBar START toggled ACCENT (Tuesday) vs invisible #fff (others); (3) instead of a!kpiField, a 3-col columnsLayout(showDividers:true) with caps-label-over-LARGE-number rich text; (4) two empty EXTRA_TALL cards stretch the rail toward full height; (5) contentsPadding NONE + canvas card matching backgroundColor = white rail flush to header on a tinted surface.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(header:{}, backgroundColor:"#f3f0f6", contentsPadding:"NONE"); a!columnsLayout ×2 (rail NARROW_PLUS; content AUTO+MEDIUM_PLUS, spacing:"SPARSE", stackWhen ×4 incl. DESKTOP_NARROW)
- a!cardLayout as: nav rows (padding:"NONE", link:a!dynamicLink); day cards (shadow, decorativeBar START); promo (style:"#f1e8f4", decorativeBar TOP ACCENT); empty EXTRA_TALL spacers
- a!gaugeField(percentage:77.0, primaryText:a!gaugeIcon(icon:"graduation-cap", color:"#555"), size:"SMALL"); a!imageField(style:"AVATAR", size:"SMALL") ×4; a!linkField + a!safeLink(openLinkIn:"NEW_TAB") ×4; OUTLINE SMALL a!buttonWidgets — Register Now (pen-fancy), Schedule Meeting ×3 (SECONDARY, calendar); richTextIcons map-marker, check-circle POSITIVE, circle-o-notch, info-circle
- Charts: none (gauge only); no colorScheme. Affordances: nav cards-as-links, safe links, buttons; no search, filters, or grids.

### Character & judgment
- **Register**: warm-community + institutional — advisor portraits and a wellness coach humanize a restrained violet brand.
- **Why it works**: one accent (#2f165e est.) reserved for selection/action makes Tuesday's bar and the CTA instantly findable; STRONG-vs-regular weight keeps 10 schedule rows scannable with zero color noise; tinted canvas vs white shadowed cards separates zones with no border lines.
- **Why not boring**: faked rail selection via a colored/invisible "❘" text glyph; invisible #fff decorative bars preserving cross-card geometry; a gauge with graduation-cap center instead of a bare percentage; a promo earning attention via tint + accent bar + illustration, not an alert banner.
- **Boring twin**: default site left nav, white background, borders on; schedule as one read-only grid (Day/Time/Course/Room); credits as three stock a!kpiFields; registration notice as an a!messageBanner; advisors as a default-blue link list.
- **What to steal**: 1. Mark the "current item" among sibling cards with decorativeBar START, painted invisible (#fff) on the rest. 2. Tint the canvas; keep cards white, borderless, shadowed. 3. Reserve the accent exclusively for selected and actionable elements.
- **Risks**: rail is a11y-weak — dynamicLinks with empty saveInto, "❘" glyphs are white-on-white literal text to screen readers; info-circle icons imply unwired tooltips (tooltip:""); when stacked (incl. DESKTOP_NARROW) rail + EXTRA_TALL spacers push content far down; SMALL SECONDARY caps labels are borderline contrast.

### Code cross-check (guidance/sail/sources/university-student-dashboard.sail, 1621 lines)
- **Code-verified palette**: #f3f0f6 (canvas card 1609; backgroundColor 1619), #f1e8f4 (promo 1402), #444 ×10 (inactive nav), #555 (gauge icon 1086), #fff/#ffffff (invisible bars/glyphs). ACCENT/POSITIVE/SECONDARY are theme tokens (hexes above are estimates).
- **Notable techniques**: nav card-links with toggled "❘" glyph (47–98, glyph 55); ACCENT-vs-#fff decorativeBar on day cards (745–746 vs 629–630); EXTRA_TALL spacers (437–450); credits trio via showDividers columns (~1109–1162); gauge icon center (1083–1087); tinted promo, decorativeBar TOP (1402–1407).
- **Corrections**: the dark top bar is site-theme chrome — header:{} is empty, no billboard; non-Tuesday bars "missing" in pixels are present but #fff; the credit "KPIs" are not a!kpiField.
