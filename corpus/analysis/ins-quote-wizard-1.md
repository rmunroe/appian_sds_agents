# Analysis: ins-quote-wizard-1

## auto_insurance_quote_wizard_step_1.png

### Identification
- **Image**: auto_insurance_quote_wizard_step_1.png | **Source page**: ins-quote-wizard-1 | **Alt/caption**: "Preview of a desktop SAIL layout for a(n) insurance quote wizard 1"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (tier A as suggested, no override). CODE-VERIFIED: `local!stepNumber: 2` renders the second `choose()` branch — step "Bundled Savings" "(1 of 6)"; branch 1 is a pre-wizard landing page.

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer / first-time-public — anonymous consumer shopping an auto-insurance quote; zero training, high abandonment risk.
- **Domain & brand context**: direct-to-consumer P&C carrier ("INSURECORP"); Geico/Progressive-style acquisition funnel; bold plum/magenta brand.
- **Top 3 user tasks (ranked)**: 1. Advance the wizard to reach a price. 2. Opt into bundle add-ons (carrier upsell). 3. See where they are and what's left.
- **Implied requirements**: "Must show named 6-step progress at all times (desktop)"; "Must place the bundling upsell before any personal-data step"; "Must offer Spanish everywhere"; "Must present exactly one primary CTA per screen"; "Must carry legal disclosures without crowding the work area"; "Must stack on phone" (stackWhen + alternate card templates, CODE-VERIFIED).
- **Data model sketch**: Quote{zipCode, stepNumber, bundleSelections[0..3]}; ProductLine{icon, primaryText, secondaryText} ×4; later branches reveal Person{name, address, DOB}, Vehicle 1..n, Driver 1..n, Coverage options, Quote{$113.50/mo, 3 discounts} — OBSERVED in code/pixels.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT bg=#333 contentsPadding=NONE (entire page in header slot; contents:{})
├─ CARD(brand bar: logo + [ENGLISH|Español], style=#73245d, showBorder=false)
│  └─ COLUMNS [AUTO:NARROW] alignVertical=MIDDLE stackWhen=NEVER
├─ COLUMNS [spacer:NARROW_PLUS:WIDE:spacer] margins=EVEN_MORE
│  ├─ WIZARD-STEP 1/6 vertical stepper: TINY stamps + connector images, desktop-only
│  └─ FORM column: title → CARD-CHOICE(Auto, selected) → "25%" pitch →
│     CARD-CHOICE ×3 (Homeowners/Renters/Other Vehicles) →
│     SECTION divider=ABOVE └─ button "NEXT: ABOUT YOU" SOLID LARGE align=END
├─ CARD(empty spacer, h=SHORT_PLUS)
└─ CARD(footer: logo + legal, style=#333, h=TALL, padding=EVEN_MORE)
```
- **Above the fold**: everything — brand bar, full stepper, all four choice cards, CTA, top of footer.
- **Reading order**: F — stepper rail anchors left, then title → cards → CTA at bottom-right terminus.
- **Hierarchy rationale**: the title is the largest text (task 2, the upsell); the pre-selected Auto card sits first to confirm context; the CTA is the only saturated solid element (task 1), so the exit is unmissable.
- **Density**: 2 — one decision on screen; 4 interactive cards + 6-step rail per viewport; EVEN_MORE margins.
- **Ratios & spacing**: centered via empty flanking columns → [empty : NARROW_PLUS : WIDE : empty]; columns marginAbove/Below EVEN_MORE (LESS on phone); stepper rows spacing:"NONE"; footer padding EVEN_MORE (CODE-VERIFIED).

### Styling specifics (CODE-VERIFIED)
- **Palette**: brand bar #73245d; page/footer base #333; content on white #ffffff (cards style:"NONE"); accent = theme token "ACCENT", renders ≈#af2b9b (est.); future-step stamps #d9d9d9 bg / #666666 glyph; other branches: hero #efefef, headline #434343, notice card #f8eff3, decorative bars #BF04A0 / #056CF2, savings green #38761d.
- **Color application points**: brand bar; active stamp fill; selected card border + corner checkmark; choice-card icons; solid CTA; dark footer slab; white glyphs on accent (OBSERVED).
- **Typography moves**: title LARGE; pitch copy MEDIUM with STRONG on "25%" and the question line; step labels STANDARD, current step STRONG; card primaryText standard / secondaryText muted; CTA renders uppercase LARGE.
- **Imagery stance**: styled icons only (stamps piggy-bank/portrait/car/user-friends/umbrella/clipboard-check; card icons car/home/building/motorcycle in accent); photos only on the landing branch.
- **Card treatment**: choice cards white with thin border; selected state adds accent border + folded-corner checkmark (cardChoiceField built-ins); structural cards flat, showBorder:false, color via style hex.
- **Signature moves**: (1) Instead of a milestone bar, a hand-built vertical stepper: TINY a!stampField circles + a!imageField connector images in EXTRA_NARROW columns, spacing NONE. (2) Instead of the contents slot, the whole page stacks in the header slot with backgroundColor #333 so the footer bleeds to the viewport bottom. (3) Instead of one card template, if(a!isPageWidth({"PHONE"})) swaps cardTemplateBarTextJustified ↔ Stacked. (4) The locked pre-selected Auto card (maxSelections:1, saveInto:{}) reuses choice-card language as read-only context. (5) Empty a!cardLayout(height:"SHORT_PLUS") as footer spacer.

### Component inventory (OBSERVED → CODE-VERIFIED)
- a!headerContentLayout(backgroundColor:"#333", contentsPadding:"NONE"); a!cardLayout(style:"#73245d"|"#333"|"NONE", showBorder:false, height:"AUTO"|"TALL"|"SHORT_PLUS"); a!columnsLayout with empty balancing columns, stackWhen incl. DESKTOP_NARROW; a!stampField(size:"TINY", backgroundColor:"ACCENT"|"#d9d9d9", accessibilityText per step); a!cardChoiceField(cardTemplateBarTextStacked, maxSelections:1|3); a!buttonWidget(style:"SOLID"|"OUTLINE"|"LINK"); a!sectionLayout(divider:"ABOVE"; showWhen:a!isPageWidth({"DESKTOP","DESKTOP_WIDE"})); a!richTextDisplayField.
- Chart types: none.
- Interactive affordances: multi-select bundle cards (max 3), locked Auto card, Next button writes stepNumber, language buttons; stepper display-only.

### Character & judgment
- **Register**: energetic-consumer + institutional — saturated brand accent and upsell voice over legal-disclosure scaffolding.
- **Why it works**: one decision per screen, one solid CTA; accent reserved for interactive/selected elements on white, so selection state reads instantly; the named stepper answers "how long will this take?" — the top abandonment question.
- **Why not boring**: plum #73245d brand slab instead of white chrome; custom icon stepper instead of "Step 1 of 6" text; dark #333 page base making the footer a full-bleed slab; folded-corner accent checkmark cards instead of a checkbox group.
- **Boring twin**: a white a!formLayout titled "Step 1 of 6", a checkboxField of insurance types, disclaimer paragraph above gray Next/Back buttons bottom-left, brand color nowhere but the logo.
- **What to steal**: choose(local!stepNumber, branch-per-step) single-file wizard; stamp+connector stepper with "(n of 6)" accessibilityText; the per-breakpoint cardTemplate swap.
- **Risks**: stepper hidden below DESKTOP widths (showWhen) removes progress cues on phone, where abandonment is highest; secondaryText gray is borderline at small sizes; white-on-accent (~#af2b9b) ≈4.9:1 — near the AA edge for SMALL buttons.

### Code cross-check (guidance/sail/sources/ins-quote-wizard-1.sail, 2954 lines)
- **Code-verified palette**: #73245d ×6, #333 ×8, #666666 ×11, #d9d9d9 ×9, #056CF2 ×4, #efefef ×2, #434343 ×2, #f8eff3, #BF04A0, #38761d; plus tokens ACCENT/STANDARD/SECONDARY.
- **Notable techniques**: choose() over four a!headerContentLayout branches (lines 6, 8, 456, 1164, 1899; screenshot = 456–1163); stepper stamps + EXAMPLE_VERTICAL_CONNECTOR_IMAGE connectors (532–889), desktop-only showWhen (889), rail NARROW_PLUS (892); responsive cardTemplate swap (919/941), maxSelections 1 vs 3 (927/1008); spacer card SHORT_PLUS (1098); page-as-header via backgroundColor "#333" + contentsPadding "NONE" (1161–1162); vestigial decorativeBarColor "#056CF2" with position "NONE" (1156–1157).
- **Corrections**: header bar sampled ≈#6a2b5b, code says #73245d — code wins; the magenta accent (sampled #af2b9b) is the token "ACCENT", not a hex in code; #BF04A0 exists only on the landing-branch hero bar, not this step.
