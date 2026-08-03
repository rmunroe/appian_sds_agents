# Analysis: customer-acct-management

## insurance_account_page.png

### Identification
- **Image**: insurance_account_page.png | **Source page**: customer-acct-management | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) customer account management page"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (the customer's own policy account, tabbed Overview/Claims/Preferences; doubles as self-service portal home). Tier A confirmed, no override.

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — auto-insurance policyholder ("Jane", primary insured) checking her account monthly or less; not an operator.
- **Domain & brand context**: consumer P&C insurance ("INSURECORP" fictional carrier); trustworthy bank-blue self-service portal feel.
- **Top 3 user tasks (ranked)**: 1. Confirm next payment (amount, date, source, autopay). 2. Review/edit who and what is covered. 3. Jump to claims history or preferences.
- **Implied requirements**: "Must show next payment amount + due date at top-left without scrolling" · "Must confirm autopay status inline with the payment source" · "Every record must expose an inline Edit entry point" · "Coverage limits must be scannable per vehicle without leaving the page" · "Claims and preferences must be reachable but off the overview" · "Must collapse to one column on phone/tablet portrait" (CODE-VERIFIED `stackWhen`).
- **Data model sketch**: Account 1—1 PaymentPlan ($123.45, due Jul 1, source "Pine Street Bank xxxx3456", autopay flag + rule text); 1—n InsuredDriver (n=3: name, role PRIMARY/SPOUSE/DEPENDENT CHILD, age, sex); 1—n Vehicle (n=2: year/make/model) 1—n Coverage (type, deductible or per-person/per-incident limits, more behind "Show More"); 1—n Claim (own tab).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#FAFCFF contentsPadding=NONE
├─ CARD(style:#fff, padding:NONE)                       ← header slot
│  └─ CARD("My Account" LARGE_PLUS BOLD, style:#1155cc, padding:MORE)
└─ CARD(style:TRANSPARENT, padding:LESS)
   └─ TABS ×3 (Overview* | Claims | Preferences)
      └─ COLUMNS [MEDIUM_PLUS:WIDE]
         ├─ SECTION "Payment"
         │  └─ CARD(shadow,no-border)
         │     ├─ SECTION "NEXT PAYMENT" → SBS $123.45 | Due July 1 (divider=BELOW)
         │     └─ SECTION "PAYMENT SOURCE" → SBS bank | Edit; SBS TAG(AUTOPAY) + note
         ├─ SECTION "Insured Drivers"
         │  └─ CARD(shadow) → 3× SECTION(role caps) → SBS stamp | name+age | Edit
         └─ SECTION "Vehicles & Coverage"
            └─ CARD(shadow) → 2× SECTION("VEHICLE n") → COLUMNS [name+Edit : 4 labeled coverage fields]
```
- **Above the fold**: everything — brand band, tabs, and all three cards fit one desktop viewport.
- **Reading order**: F — left column top-down (Payment → Drivers), then right column (Vehicles).
- **Hierarchy rationale**: the only money figure ("$123.45") is the first bold value under the first section — task 1 wins top-left; drivers/vehicles get equal-weight cards sharing one internal grammar — task 2 is browse-and-edit, not compare; Claims demoted to a tab — rare task kept off the calm overview.
- **Density**: 3 — three cards, ~15 data values per viewport, `padding:"STANDARD"` cards, `marginBelow:"MORE"` between sections.
- **Ratios & spacing**: columns `MEDIUM_PLUS:WIDE` (renders ≈42:58, OBSERVED); card padding `STANDARD`, header band `MORE`, tab wrapper `LESS`, sections `marginBelow:"MORE"`, cards `marginBelow:"STANDARD"` (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED unless noted)
- **Palette**: page bg `#FAFCFF` (blue-tinted near-white); header band `#1155cc` on `#fff` outer card; content cards default white with shadow; tag `#1155cc`; stamps `#e12e8b` / `#118bf1` / `#569a38`; links SAIL default blue (unoverridden, #1c6fdc est.); labels SECONDARY grey (#6c6c75 est.). Top INSURECORP navbar is site chrome outside the expression (OBSERVED), same blue family (est.).
- **Color application points**: header band; AUTOPAY tag; active-tab underline (site accent, OBSERVED); Edit/Show More links; three stamp circles. No colored card accents, charts, or numbers — blue does brand, stamps do people.
- **Typography moves**: title LARGE_PLUS BOLD white; section headers MEDIUM/STANDARD/H2; in-card eyebrows SMALL/SECONDARY all-caps authored labels ("NEXT PAYMENT", "PRIMARY", "VEHICLE 1"), H3; key values MEDIUM_PLUS STRONG; support text MEDIUM; autopay note `color:"SECONDARY"`; coverage fields keep default bold labels (`labelPosition:"ABOVE"`).
- **Imagery stance**: none — no photos or icons; only TINY initial stamps as pseudo-avatars.
- **Card treatment**: shadow-only (`style:"NONE", showShadow:true, showBorder:false`) — reads as hairline elevation on the tinted bg.
- **Signature moves**: instead of the default grey page title, a card-in-card header slot (`#fff` padding NONE wrapping `#1155cc` padding MORE) makes a full-bleed brand band. Instead of grids for repeated records, stacked a!sectionLayouts inside one card — SMALL/SECONDARY caps labels + `divider:"BELOW"` — act as record separators. Instead of buttons, every action is a quiet "Edit" link (`linkStyle:"STANDALONE"`) right-pinned via `align:"RIGHT"`/`width:"MINIMIZE"`. Instead of a checkbox, autopay is a filled brand-blue a!tagItem fused to its plain-language rule sentence.

### Component inventory (CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#FAFCFF", contentsPadding:"NONE"); a!headingField(size:"LARGE_PLUS", fontWeight:"BOLD"); a!cardLayout in four roles (header `#fff`/`#1155cc`, wrapper `TRANSPARENT`, content cards shadowed); a!tabLayout(3 tabs, contentsPadding:"STANDARD"), stub tabItems; a!columnsLayout(MEDIUM_PLUS+WIDE, stackWhen); a!sectionLayout in two registers (H2 outer, H3 eyebrow+divider); a!sideBySideLayout(alignVertical:"MIDDLE"); a!richTextDisplayField/Item (STRONG values, SECONDARY notes, a!safeLink STANDALONE links); a!tagField(backgroundColor:"#1155cc"); a!stampField(size:"TINY", contentColor:"STANDARD" → white initials on color, OBSERVED).
- Charts: none. Interactive affordances: tabs, Edit ×6, Show More ×2 (placeholder safeLinks — a real page would use record actions).

### Character & judgment
- **Register**: calm-clinical · institutional — restrained single-hue blue, white shadowed cards, grey caps eyebrows; bank-statement tone for money and coverage.
- **Why it works**: amount+date share one scan line ($123.45 STRONG left, "Due July 1" pinned right by `width:"MINIMIZE"`); three entity shapes feel uniform because every card repeats one grammar (caps eyebrow → bold value → Edit → divider); one hex (#1155cc) does header, tag, and accent, so nothing competes with content.
- **Why not boring**: full-bleed #1155cc title band built from nested cards, not the default header; #FAFCFF tinted canvas instead of stock grey; person-coded stamp trio (#e12e8b/#118bf1/#569a38) — the only non-brand color, spent exactly where identity matters; AUTOPAY as a filled tag fused to a rule sentence; roles as caps eyebrows, not a "Role" field.
- **Boring twin**: one white column of bordered boxes under a grey "My Account" heading; every value a default labeled field ("Amount: $123.45", "Autopay: Yes"); EDIT buttons on each box; claims dumped below the fold; no tabs, tag, or stamps.
- **What to steal**: card-in-card header-slot trick for a brand band; eyebrow-section pattern (SMALL/SECONDARY caps + divider BELOW) for records-in-a-card; spend one brand hex at exactly header + tag + accent, nowhere else.
- **Risks**: white-on-#1155cc passes (~5.6:1) but white initials on #118bf1/#569a38 stamps run ~2.5–3:1 — decorative only, keep roles in text; small Edit link hit targets on touch; stub tabs must gain content or be hidden; long bank/vehicle names could crowd the MINIMIZE'd Edit column before stackWhen kicks in.

### Code cross-check
- **Code-verified palette**: `#1155cc` (header card + AUTOPAY tag), `#fff` (header outer card), `#FAFCFF` (page bg), `#e12e8b` / `#118bf1` / `#569a38` (stamps); wrapper `style:"TRANSPARENT"`; content cards `style:"NONE"` + shadow.
- **Notable techniques** (guidance/sail/sources/customer-acct-management.sail): header card-in-card full-bleed band (L3–26); TRANSPARENT wrapper card insets a!tabLayout, `padding:"LESS"` (L29–31, 555–562), stub tabItems (L550–551); eyebrow sections `labelSize:"SMALL"` + `labelColor:"SECONDARY"` + `labelHeadingTag:"H3"` + `divider:"BELOW"` between records (L45–78, 165–344, 369–445) under H2 outer sections (L155) — a proper heading tree; SBS `width:"MINIMIZE"` + `alignVertical:"MIDDLE"` pins date/links (L48–72); asymmetric columns MEDIUM_PLUS/WIDE + `stackWhen` (L360, 540, 543); `contentsPadding:"NONE"` for full bleed (L565).
- **Corrections**: cards look hairline-bordered in pixels — actually `showBorder:false` + `showShadow:true`; page bg looks plain white — actually `#FAFCFF`; tag blue is exactly the header hex, not a near-match; top INSURECORP navbar and active-tab underline are site chrome, absent from the expression.
