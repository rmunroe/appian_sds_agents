# Analysis: ins-claim-case-study

## insurance_claim_case_summary.png

### Identification
- **Image**: insurance_claim_case_summary.png | **Source page**: ins-claim-case-study (inspiration) | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) insurance claim case summary"
- **Device frame**: desktop (3326x2079 2x retina; tier A confirmed — full-page record screenshot, bottom edge clips "Repair Status")
- **Marker**: neutral
- **UI type**: record-view (customer-facing claim summary tab)

### Use-case reconstruction (INFERRED)
- **Persona**: policyholder "Sharif" — occasional-customer checking his auto claim every few days post-accident; copy addresses him directly ("Your insurance adjuster has inspected your vehicle…").
- **Domain & brand context**: P&C insurance, same "INSURECORP" brand as the agent home page but the self-service customer-portal side — corporate blue chrome, reassuring tone.
- **Top 3 user tasks (ranked)**: 1. Learn claim status and what happens next. 2. Verify recorded facts (where/when/what, vehicle, damage). 3. Act — SEND MESSAGE or CANCEL CLAIM.
- **Implied requirements**: "Answer 'what happens next?' first"; "Show the full milestone roadmap including future steps"; "Loss facts verifiable at a glance (map, not just address)"; "Damage shown spatially and photographically"; "Collapse to one column below desktop".
- **Data model sketch** (OBSERVED off labels): Claim(#123-45-6789) —1:6→ Milestone(name, date?, done): Loss Occurred Sep 13 / Claim Filed Sep 13 / Vehicle Inspected Sep 15 / Estimate Issued / Payment Sent / Claim Closed; —1:1→ Driver(Sharif, GOOD DRIVER DISCOUNT); —1:1→ Loss(Beverly Hills CA 90210, cross-street, Sep 13 2021 3:00PM, Collision); —1:1→ Vehicle(2009 Saab 9-5, VIN YS3EH58GX13004109, Not Drivable - Towed); —1:N→ InspectionPhoto ×4; —1:N→ DamageArea {R FRONT, FRONT, L FRONT, L REAR}; RepairStatus = waiting for estimate.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=TRANSPARENT (blue nav + claim title bar + actions + TABS ×4 = record chrome, not in SAIL)
├─ HEADER: CARD("What's next?" guidance, #cfe2f3, no-border) + CARD(empty #fff spacer, marginBelow=MORE)
└─ COLUMNS [NARROW_PLUS : MEDIUM_PLUS : AUTO] stackWhen=PHONE,TABLET_PORTRAIT,TABLET_LANDSCAPE
   ├─ SECTION "Claim Progress" → timeline: 6×(COLUMNS [EXTRA_NARROW stamp | name+date]) + 5 connector-image rows, spacing=NONE
   ├─ SECTION "Insured Driver" → CARD(SBS "S"-stamp + name + tag, shadow)
   │  SECTION "Details of Loss" → CARD(sub-SECTIONs LOCATION(map embed) / DATE & TIME / TYPE OF LOSS, dividers BELOW)
   └─ SECTION "Insured Vehicle & Damage" → CARD(SBS stamp+model+VIN; GRID(4-col photos); condition; diagram+NEGATIVE tags)
      SECTION "Repair Status" → CARD(empty-state clock + "Waiting for Estimate", padding=EVEN_MORE)
```
- **Above the fold**: banner, entire timeline, driver card, loss card through DATE & TIME, complete vehicle/damage card; TYPE OF LOSS and the repair empty-state card sit below the clipped "Repair Status" heading (CODE-VERIFIED).
- **Reading order**: F — full-width banner, then left progress rail, then fact columns left→right.
- **Hierarchy rationale**: claim number + action buttons biggest and first (orientation plus escape hatches, task 3); the #cfe2f3 banner is the first content element because "what's next?" is task 1; the evidence-heavy vehicle/damage column gets the widest (AUTO) slot — photos + diagram need room.
- **Density**: 3 — balanced record view: ~7 content zones in viewport, STANDARD card padding, an airy single-purpose timeline rail, no data grids.
- **Ratios & spacing**: CODE-VERIFIED columns NARROW_PLUS/MEDIUM_PLUS/AUTO; card padding STANDARD (repair card EVEN_MORE), marginBelow STANDARD; sections marginBelow MORE; timeline rows spacing NONE alignVertical MIDDLE; photo row DENSE.

### Styling specifics (OBSERVED → CODE-VERIFIED)
- **Palette**: chrome blue #2458c5 (est., site not SAIL); active tab #316498 (est.); page bg #f0f0f0 (est. — code says TRANSPARENT, site default shows through); cards #ffffff via style:"NONE"+shadow; banner #cfe2f3; avatar stamp #118bf1; discount tag #45818e; vehicle stamp #a64d79; future-step stamps #d9d9d9/#666666; clock icon #a4c2f4; connector #d4d4d4 (est., image asset); tokens POSITIVE (≈#5bbd38 est.) and NEGATIVE (≈#cd2b3d est.); text #222222 (est.) STANDARD + SECONDARY gray.
- **Color application points**: milestone stamps (state), damage tags (severity), entity stamps (blue person, plum vehicle), discount tag, banner fill, empty-state icon. No colored buttons or headings — red exists only on damage tags.
- **Typography moves**: record title ≈LARGE_PLUS white (chrome); section labels MEDIUM; card sub-labels SMALL SECONDARY all-caps (caps typed into H3 sectionLayout labels); values MEDIUM_PLUS — labels demoted, answers promoted; step names STANDARD+STRONG (future steps drop the bold), dates SMALL; VIN MEDIUM SECONDARY, right-shoved by MINIMIZE.
- **Imagery stance**: heavy and varied — 4 real damage photos, live Google Map, line-art top-down car diagram with baked-in red dots, icon/letter stamps, photo avatar (chrome).
- **Card treatment**: showShadow:true, showBorder:false, style NONE, white on #f0f0f0; banner card filled #cfe2f3 borderless; only the map embed is bordered.
- **Signature moves**: instead of a status text field, a hand-built vertical timeline (TINY a!stampFields alternating with a vertical-connector a!imageField in EXTRA_NARROW columns, spacing NONE); instead of a damage-code list, NEGATIVE tags positioned around a car diagram via nested columnsLayouts; instead of address text, a live map via a!webContentField(height:"SHORT"); instead of hiding the pending section, a designed empty state (EXTRA_LARGE #a4c2f4 clock, padding EVEN_MORE); instead of one accent, entity-coded stamp colors (#118bf1 person / #a64d79 vehicle).

### Component inventory (OBSERVED → CODE-VERIFIED)
a!headerContentLayout(backgroundColor:"TRANSPARENT", header:{banner card + empty spacer card}); a!cardLayout ×8; a!columnsLayout ×~15 (3-col shell; 11 timeline rows [EXTRA_NARROW|auto]; DENSE photo row; damage-tag positioners); a!sectionLayout ×~12 (outer MEDIUM/H2, inner SMALL/H3 SECONDARY, divider:"BELOW"); a!stampField ×8 (TINY milestones — icons car-crash/check-circle-o/file-text-o/money/stamp; SMALL "S" and car); a!richTextDisplayField throughout (preventWrapping; align flips CENTER via a!isPageWidth("PHONE")); a!tagField ×5 (one #45818e, four NEGATIVE, SMALL); a!imageField ×10 (5 connectors TINY, 4 photos FIT isThumbnail:true, 1 diagram FIT); a!webContentField ×1 (Google Maps, SHORT, border). Charts: none. Affordances: record tabs + CANCEL CLAIM / SEND MESSAGE (chrome, OBSERVED only); thumbnails click-to-enlarge; pannable map; no filters or search.

### Character & judgment
- **Register**: calm-clinical + institutional — muted blues/grays, reassuring second-person copy, corporate blue chrome; anxiety-reducing rather than energizing.
- **Why it works**: banner + 3-green/3-gray timeline answer "where is my claim?" in the first screenful; milestone state is encoded four redundant ways (bg POSITIVE vs #d9d9d9, content white vs #666666, STRONG vs regular, date vs none) so progress reads even colorblind; SMALL-caps-gray labels against MEDIUM_PLUS values land the eye on answers, not field names.
- **Why not boring**: damage rendered spatially — red tags around a car diagram instead of a code list; a live map inside a shadowed card; entity-colored letter/icon stamps in place of photos; the pending "Repair Status" gets an oversized pale-blue clock empty state instead of being omitted.
- **Boring twin**: one wide "Claim Details" column of label:value pairs — "Status: Vehicle Inspected" as text, milestones in a read-only grid, damage as a comma-separated list, address without map, photos in an attachments list, bordered default cards.
- **What to steal**: the stamp + connector-image timeline recipe for any process record; the four-signal done/future encoding; the header-slot #cfe2f3 "What's next?" guidance card.
- **Risks**: #666666 icons on #d9d9d9 ≈ 2.4:1 contrast (mitigated: names carry meaning, accessibilityText set); white on #45818e ≈ 4.3:1, borderline at SMALL caps; damage-tag alignment with the diagram's baked-in dots depends on fixed nested column widths — drifts at odd widths; stackWhen includes TABLET_LANDSCAPE, so tablets get a long single-column scroll; webContentField pulls third-party content (privacy/perf/offline).

### Code cross-check (guidance/sail/sources/ins-claim-case-study.sail)
- **Code-verified palette**: full hex census — #cfe2f3, #fff, #118bf1, #45818e, #a64d79, #a4c2f4, #d9d9d9 ×3, #666666 ×3, plus tokens POSITIVE, NEGATIVE, STANDARD, SECONDARY, TRANSPARENT. Chrome blue #2458c5 and page gray #f0f0f0 are NOT in the expression — site theme; don't attribute.
- **Notable techniques**: header slot = guidance card + empty #fff card (padding NONE, marginBelow MORE) as a white spacer strip under the banner (L3–47); timeline = 6 stamp rows + 5 connector-image rows, each a [EXTRA_NARROW|auto] columnsLayout, spacing:"NONE", a!isPageWidth("PHONE") flipping align to CENTER (L52–485); Google Maps iframe via a!webContentField(height:"SHORT", showBorder:true) (L583–590); 4-up DENSE thumbnail grid (L709–768); NEGATIVE tags placed around the diagram by three nested columnsLayouts with NARROW_PLUS centers, align CENTER/END (L779–911); empty-state card padding "EVEN_MORE", char(10) breaks between icon and text (L926–961); stackWhen list L966–971.
- **Corrections**: greens/reds are semantic tokens (POSITIVE/NEGATIVE), not custom hexes — sampled #5bbd38/#cd2b3d are renderings; avatar sampled ≈#3b8cea vs code #118bf1 and banner #d3e1f1 vs #cfe2f3 — code wins; card whites are style:"NONE"+showShadow, not explicit #fff (only the spacer sets #fff); the diagram's red dots are baked into a placeholder image (a!EXAMPLE_DOCUMENT_IMAGE) — only the four tags are components; nav, claim title bar, action buttons and tabs are record chrome, absent from source.
