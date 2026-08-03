# Analysis: ux-header-content-layout

Page: `corpus/pages/ux-header-content-layout.md` (components section). The page teaches `a!headerContentLayout` (HCL): a two-zone top-level layout (header of billboard/card layouts + contents), its parameters (header, contents, isHeaderFixed, backgroundColor, contentsPadding), and style guidelines (transparent backgrounds, site page width, fixed-header margins/responsiveness). Four examples have SAIL source on-page, so their palettes/params are CODE-VERIFIED.

## HCL_padding_progression.gif

### Interaction: contentsPadding progression (gif: HCL_padding_progression.gif)
Frames read: `frames/HCL_padding_progression_f0.png`, `_f7`, `_f15`, `_f22`, `_f29` (f7/f15/f22/f29 are GIF delta frames; f0 fully composited).

- **State chart**: Boreas fundraising wizard at `contentsPadding:"NONE"` — gray wizard rail (#f0f0f0, CODE-VERIFIED from sibling example) sits flush against billboard seam and viewport edges (OBSERVED f0) → value steps through "Even Less" → "Less" → "Standard" → "More" → "Even More"; each step insets the entire contents block (rail + form) a further increment from the header seam and side edges while the billboard header never moves (OBSERVED: deltas re-render only the contents region, progressively offset) → loops back.
- **SAIL mechanism**: other — `a!headerContentLayout(contentsPadding: ...)` styling parameter sweep, no user interaction.
- **UX purpose**: orientation — makes the whitespace scale tangible; "NONE" reads as one fused surface with the header, "Even More" reads editorial.
- **Replicate when**: deciding whether contents should fuse with the header (NONE) or float (Standard+). | **Cost**: trivial — one enum parameter.

## hcl_basic_example.png

### Identification
- **Image**: hcl_basic_example.png | **Source page**: ux-header-content-layout | **Alt/caption**: none (shown under "Header parameter" as "very basic example")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — annotated parameter demo (dashboard scaffold with placeholder cards; red doc callouts "Card" and "Contents", OBSERVED)

### Use-case reconstruction (INFERRED)
- **Persona**: app designer reading docs (the "user" of this image); the scaffold itself implies a daily-operator dashboard viewer
- **Domain & brand context**: generic internal app; navy corporate header
- **Top 3 user tasks (ranked)**: 1. Understand which zone is the `header` param 2. Understand which zone is `contents` 3. Copy the two-zone starting skeleton
- **Implied requirements**: "Header must visually fuse with page top/left/right edges"; "Contents must read as a separate white workspace"; "Placeholders must show column composition without content noise"
- **Data model sketch**: none — placeholder cards only (OBSERVED: three empty bordered cards)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (bg=WHITE, contentsPadding=STANDARD)
├─ CARD(#0f203a, borderless: "Welcome!" + icon "My Dashboard")
└─ COLUMNS [1:1]
   ├─ CARD(empty, MEDIUM) ×2 stacked
   └─ CARD(empty, TALL_PLUS)
```
- **Above the fold**: everything (single-viewport demo)
- **Reading order**: F — navy bar, then left column, then right
- **Hierarchy rationale**: navy full-bleed card is first/biggest because the demo's subject IS the header zone; empty cards de-emphasize contents composition
- **Density**: 2 — one header + three empty cards, generous STANDARD padding
- **Ratios & spacing**: 2 equal columns; contents gutter = contentsPadding STANDARD (CODE-VERIFIED); header marginBelow NONE creates hard seam

### Styling specifics (CODE-VERIFIED)
- **Palette**: header card #0f203a; page bg WHITE; placeholder cards style NONE with default gray border; surrounding matte #f0f0f0 (est., screenshot frame); annotation red #d5486a (est., doc artifact not UI)
- **Color application points**: single saturated surface = header card; all else neutral; white title text on navy
- **Typography moves**: "Welcome!" richTextHeader LARGE; "My Dashboard" richTextHeader SMALL + tachometer richTextIcon; both white on navy
- **Imagery stance**: none
- **Card treatment**: header filled (#0f203a, showBorder false); contents cards border-only (showBorder true, showShadow false)
- **Signature moves**: instead of a plain page title, a full-bleed navy `a!cardLayout` in `header` with `marginBelow:"NONE"` makes the brand bar part of the page; instead of borders+shadow, placeholders use border-only cards to read as wireframe

### Component inventory (CODE-VERIFIED)
- `a!headerContentLayout(backgroundColor:"WHITE", contentsPadding:"STANDARD")`; header `a!cardLayout(style:"#0f203a", padding:"STANDARD", marginBelow:"NONE", showBorder:false)` containing `a!richTextHeader` items; contents `a!columnsLayout` with `a!cardLayout(height:"MEDIUM"/"TALL_PLUS", style:"NONE", showBorder:true, showShadow:false)`
- Charts: none | Interactive affordances: none

### Character & judgment
- **Register**: calm-clinical — one navy surface, otherwise wireframe neutrality
- **Why it works**: hard seam (marginBelow NONE) makes the two-zone anatomy legible; empty bordered cards keep attention on zones, not content
- **Why not boring**: n/a by design — it is deliberately minimal teaching scaffold; the one non-default move is the custom hex header instead of default white
- **Boring twin**: same page with the title as plain black text on white — no zone contrast, nothing to teach
- **What to steal**: start every HCL with header card `marginBelow:"NONE"` + custom hex; SMALL icon+label subtitle under a LARGE greeting
- **Risks**: none beyond low-contrast gray card borders on white (a11y-minor)

### Code cross-check
- **Code-verified palette**: #0f203a header; WHITE background; contentsPadding STANDARD
- **Notable techniques**: two richTextDisplayFields stacked for title/subtitle (lines ~102-127); placeholder heights MEDIUM/MEDIUM/TALL_PLUS (~144-170)
- **Corrections**: none — pixels match code

## hcl_billboard_header.png

### Identification
- **Image**: hcl_billboard_header.png | **Source page**: ux-header-content-layout | **Alt/caption**: none (Billboard header subsection)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (public donation flow)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — first-time donor to a wildlife nonprofit
- **Domain & brand context**: "Boreas Foundation" penguin-conservation nonprofit; emotive, photographic, trustworthy navy
- **Top 3 user tasks (ranked)**: 1. Pick a gift amount + frequency 2. See campaign progress toward goals 3. Track where they are in the 5-step setup
- **Implied requirements**: "Emotional hook and campaign progress must stay visible above the form"; "Amount selection must be one-tap (no typing)"; "Steps must show completed/current/upcoming states"; "Header must stay visible while scrolling" (isHeaderFixed CODE-VERIFIED)
- **Data model sketch**: Campaign(goal milestones $100,000/$250,000/$500,000; active=2), RecurringGift(amount: 9 choices $5–$1,000+Other, selected $25; frequency: Monthly/Quarterly/Annually, selected Monthly), Wizard(5 steps: Donor Information ✓, Amount and Frequency ←current, Payment Source, Tax Information, Confirmation) — all OBSERVED from labels

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (isHeaderFixed=true, bg=WHITE, contentsPadding=NONE)
├─ BILLBOARD h=MEDIUM overlay=full,SEMI_DARK,align-middle
│  content=title LARGE + italic fact + MILESTONE(3 $ steps, active 2)
└─ CARD(padding NONE, borderless)
   └─ COLUMNS [MEDIUM:AUTO]
      ├─ CARD(#f0f0f0 rail: gift icon title + 5 STAMP steps)
      └─ COLUMNS [AUTO:MEDIUM_PLUS:AUTO]
         └─ FORM(title LARGE, radio CARDS ×2, divider, Back/Cancel | Next)
```
- **Above the fold**: billboard + full step rail + entire Amount and Frequency form (single viewport)
- **Reading order**: F — billboard headline, milestone bar, then rail, then form
- **Hierarchy rationale**: photo+headline biggest to motivate giving (task 2's emotional driver); milestone bar inside the billboard ties the ask to progress; form column centered at MEDIUM_PLUS keeps choices scannable
- **Density**: 2 — one form group + rail per viewport, EVEN_MORE overlay padding, editorial air
- **Ratios & spacing**: rail column width MEDIUM vs AUTO form area; form centered by empty AUTO side columns (CODE-VERIFIED); contentsPadding NONE fuses gray rail to billboard seam and left edge

### Styling specifics (CODE-VERIFIED)
- **Palette**: billboard backgroundColor #f0f0f0 behind photo; overlay SEMI_DARK; rail + inset dividers #f0f0f0; inactive stamps #b7b7b7; active/complete stamps ACCENT (renders navy-blue ≈#1b3f6e est.); page bg WHITE; site chrome navy #0e2039 (est., site-level not in code)
- **Color application points**: photo overlay (white text); milestone ACCENT; stamp circles (ACCENT vs #b7b7b7); selected radio card border+dot blue; NEXT primary button; all body neutrals
- **Typography moves**: billboard title LARGE white; fact line EMPHASIS italic; rail title MEDIUM_PLUS STRONG; step labels MEDIUM (current STRONG, done colored ACCENT); form title LARGE; choices STANDARD
- **Imagery stance**: full-bleed emperor-penguin photo (emotional), no icons beyond gift/check stamps
- **Card treatment**: rail filled #f0f0f0 borderless; wrapper card padding NONE; choice cards bordered (choiceStyle CARDS)
- **Signature moves**: instead of a page title, a SEMI_DARK `a!fullOverlay` on photo with a `a!milestoneField(color:"ACCENT")` embedded in the billboard; instead of a plain step list, TINY `a!stampField` circles switch backgroundColor ACCENT→#b7b7b7 by state; instead of dropdowns, `choiceStyle:"CARDS"` + `choiceLayout:"COMPACT"` money grid; empty side columns used as centering rails

### Component inventory (CODE-VERIFIED)
- `a!billboardLayout(backgroundMedia:a!webImage, height:"MEDIUM", overlay:a!fullOverlay(style:"SEMI_DARK", padding:"EVEN_MORE"))`; `a!milestoneField(steps:{$…}, active:2, color:"ACCENT")`; rail `a!cardLayout(style:"#f0f0f0", padding:"MORE")` + `a!sideBySideLayout` rows of `a!stampField(size:"TINY")`; `a!radioButtonField(choiceStyle:"CARDS", choiceLayout:"COMPACT")` ×2; `a!buttonArrayLayout` Back NORMAL / Cancel LINK vs Next PRIMARY split in 2 columns; `a!sectionLayout(divider:"ABOVE")`; `isHeaderFixed:true`
- Charts: none | Affordances: radio cards, wizard rail (non-link), buttons

### Character & judgment
- **Register**: warm-community + energetic-consumer — wildlife photo, "We need your help", friendly one-tap giving
- **Why it works**: milestone-in-billboard fuses story and progress; gray rail flush to header (contentsPadding NONE) reads as an app frame, separating orientation from work; 9-amount card grid beats a text input for speed
- **Why not boring**: photo billboard instead of colored bar; progress meter inside the hero; stateful stamp rail; centered MEDIUM_PLUS form column rather than full-width fields
- **Boring twin**: white page, black "Donate" title, amount dropdown, numbered plain-text steps across the top, Submit bottom-left — no emotion, no progress, no state
- **What to steal**: embed milestoneField in the hero; contentsPadding NONE + filled rail column for wizard chrome; ACCENT/#b7b7b7 stamp state coding
- **Risks**: white text over busy photo depends on SEMI_DARK strength (contrast); fixed MEDIUM billboard is tall on phones (see responsive DON'T gif); rail width MEDIUM may crowd at tablet widths

### Code cross-check
- **Code-verified palette**: #f0f0f0 (billboard bg, rail, inset cards), #b7b7b7 inactive stamps, ACCENT actives, WHITE page
- **Notable techniques**: isHeaderFixed:true (line ~258); fullOverlay SEMI_DARK + padding EVEN_MORE (~253-254); stamp state via backgroundColor swap (~295 vs ~374); centering via empty columnLayouts (~495-497, ~584-586); contentsPadding NONE (~603)
- **Corrections**: rail "inset cards" are empty #f0f0f0 cards used as spacers (padding EVEN_LESS) — invisible in pixels; I would have guessed simple margins

## hcl_card_header.png

### Identification
- **Image**: hcl_card_header.png | **Source page**: ux-header-content-layout | **Alt/caption**: none (Card header subsection)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: wizard-step (same donation flow as hcl_billboard_header.png, card variant)

### Use-case reconstruction (INFERRED)
Same persona/tasks/data model as `hcl_billboard_header.png` (identical flow, OBSERVED identical labels/choices). Delta requirement: "Header must carry brand color without imagery" — for orgs without photo assets or wanting faster load/calmer tone.

### Layout anatomy (OBSERVED)
- **Skeleton**: as billboard version except:
```
├─ CARD(#0f203a, padding=EVEN_MORE: title LARGE + italic fact + MILESTONE)
```
- **Above the fold**: everything; navy header is taller-feeling than the photo (solid block ~1/3 viewport)
- **Reading order**: F
- **Hierarchy rationale**: solid navy block gives the same top-weight as the photo but shifts tone from emotive to institutional; milestone bar still lives in the header
- **Density**: 2 — same as sibling
- **Ratios & spacing**: identical (contentsPadding NONE, rail MEDIUM, form MEDIUM_PLUS centered)

### Styling specifics (CODE-VERIFIED)
- **Palette**: header card #0f203a; rail/insets #f0f0f0; inactive stamps #b7b7b7; page WHITE; milestone default color (renders light track + blue marker, OBSERVED)
- **Color application points**: one navy surface carries all brand color; whites/grays elsewhere; ACCENT stamps
- **Typography moves**: same ladder as sibling (LARGE header title, EMPHASIS fact, MEDIUM_PLUS STRONG rail title)
- **Imagery stance**: none — flat color replaces photo
- **Card treatment**: header filled navy borderless, padding EVEN_MORE (vs billboard overlay padding)
- **Signature moves**: instead of `a!billboardLayout`, the same header composition drops into `a!cardLayout(style:"#0f203a")` — proving header param accepts either; milestone keeps labelPosition COLLAPSED

### Component inventory (CODE-VERIFIED)
- Header `a!cardLayout(style:"#0f203a", height:"AUTO", padding:"EVEN_MORE", marginBelow:"NONE", showBorder:false)` with `a!richTextHeader(size:"LARGE")` + `a!milestoneField(active:2)`; contents identical to billboard version (rail stamps, radio CARDS, buttons). No isHeaderFixed (defaults false; CODE-VERIFIED absent)
- Charts: none | Affordances: radio cards, buttons

### Character & judgment
- **Register**: institutional + warm-community — same friendly flow under a sober navy banner
- **Why it works**: text hierarchy survives without the photo because the LARGE/italic/milestone stack was doing the work; #0f203a vs #f0f0f0 vs WHITE gives three clean depth planes
- **Why not boring**: milestone-in-header and stamp rail persist; EVEN_MORE padding makes the flat header feel deliberate, not cheap
- **Boring twin**: thin colored strip with 16px title, steps as breadcrumbs, form flush-left full-width
- **What to steal**: card header = drop-in downgrade path from billboard when imagery is unavailable; keep milestone/CTA parity between variants
- **Risks**: solid navy block can feel heavy at MEDIUM+ heights; ensure milestone labels stay legible on navy (white on #0f203a passes)

### Code cross-check
- **Code-verified palette**: #0f203a, #f0f0f0, #b7b7b7, WHITE
- **Notable techniques**: header swap billboard→card leaves contents untouched (~618-668 vs sibling); padding EVEN_MORE on card (~665)
- **Corrections**: none

## hcl_contents.png

### Identification
- **Image**: hcl_contents.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_contents.png (Contents parameter)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: other — unannotated wireframe demo (same scaffold as hcl_basic_example.png)

### Use-case reconstruction (INFERRED)
Same as `hcl_basic_example.png`: teaches that `contents` holds arbitrary components/layouts; empty cards visualize the zone split.

### Layout anatomy (OBSERVED)
- **Skeleton**: identical to hcl_basic_example.png (navy "Welcome!/My Dashboard" card; contents COLUMNS [1:1] with two MEDIUM cards left, one TALL_PLUS card right)
- **Above the fold**: everything
- **Reading order**: F
- **Hierarchy rationale**: as sibling — header dominant, contents intentionally blank
- **Density**: 2 — three empty cards
- **Ratios & spacing**: equal columns; visible white gutter around cards = contentsPadding STANDARD (CODE-VERIFIED via sibling code; correspondence to this exact render INFERRED)

### Styling specifics (OBSERVED; CODE-VERIFIED via sibling)
- **Palette**: #0f203a header, WHITE bg, gray card borders, #f0f0f0 matte (est., screenshot frame)
- **Color application points**: header only
- **Typography moves**: LARGE white title + SMALL icon subtitle
- **Imagery stance**: none
- **Card treatment**: border-only placeholders (showBorder true, showShadow false)
- **Signature moves**: none beyond sibling

### Component inventory (CODE-VERIFIED via sibling)
- Same construct list as hcl_basic_example.png

### Character & judgment
- **Register**: calm-clinical
- **Why it works** / **Why not boring** / **Boring twin** / **What to steal** / **Risks**: see hcl_basic_example.png — this is the same scaffold without doc callouts; its only distinct value is showing the clean render (no annotation overlay)

### Code cross-check
- **Code-verified palette**: #0f203a / WHITE / contentsPadding STANDARD (from the Header-parameter example code; pixel layout matches it, INFERRED same source interface)
- **Notable techniques**: placeholder card heights MEDIUM/TALL_PLUS signal intended content mass
- **Corrections**: none

## hcl_drag_and_drop.gif

### Interaction: add HCL in design view (gif: hcl_drag_and_drop.gif)
Frames read: `frames/hcl_drag_and_drop_f0.png`, `_f12`, `_f24`, `_f36`, `_f48` (f12/f24 deltas; f36/f48 near-blank fade frames).

- **State chart**: blank interface in Appian designer — Palette shows Top Level Layouts (FORM, WIZARD, CARD HEADER, BILLBOARD HEADER, PANES, PANES WITH BILLBOARD/CARD HEADER) and "Select a template" gallery (OBSERVED f0) → designer drags "BILLBOARD HEADER" chip toward canvas (OBSERVED f12: pink-highlighted drag ghost) → drop renders a headerContentLayout: placeholder billboard image + hatched "Drop component here" zones for header and contents; right pane switches to Component Configuration › "Header Content Layout" with Header: Billboard Layout and Contents: ADD COMPONENT (OBSERVED f24) → idle.
- **SAIL mechanism**: other — design-view palette drag creates `a!headerContentLayout(header:{a!billboardLayout(...)})`; note top-level layouts only appear on blank interfaces (page text).
- **UX purpose**: orientation — where HCL lives in tooling and what scaffold the drop produces.
- **Replicate when**: onboarding designers to top-level layouts. | **Cost**: none (product behavior, not SAIL to write).

## hcl_fixed_header.gif

### Interaction: fixed header on scroll (gif: hcl_fixed_header.gif)
Frames read: `frames/hcl_fixed_header_f0.png`, `_f8`, `_f16`, `_f24`, `_f31` (deltas after f0).

- **State chart**: Boreas donation wizard at rest — billboard (photo + "We need your help" + milestone bar) occupies top ~37% of viewport, contents inset below (OBSERVED f0) → user scrolls → contents slide up and clip beneath the billboard's bottom edge while billboard, nav, and milestone stay pinned (OBSERVED f16: rail title reaches billboard seam; billboard region unchanged in deltas) → deeper scroll: steps 4–5 and Back/Cancel/Next reach mid-viewport, header still pinned (OBSERVED f24) → scroll returns/loops (f31).
- **SAIL mechanism**: `isHeaderFixed: true` on a!headerContentLayout (CODE-VERIFIED in this page's billboard-header SAIL).
- **UX purpose**: orientation + persistent access — campaign progress and brand stay visible at any scroll depth.
- **Replicate when**: header carries always-relevant status (progress, KPIs, actions) and is short on desktop. | **Cost**: one boolean; but demands marginBelow:"NONE" discipline and a responsive off-switch (see DO/DON'T pairs below).

## hcl_fixed_header_margin_do.gif + hcl_fixed_header_margin_dont.gif

### Principle: Put the gap under a fixed header on the content, not the header
Frames read: do `_f0/_f5/_f10/_f15/_f19`; dont `_f0/_f6/_f12/_f18/_f23` (navy "Order Fishing License" page: breadcrumb + title header ≈#0f203a (est.), license form left, gray "Who can get a license?" box ≈#eef1f6 (est.) right).

- **DO shows**: gap created via Margin Above on the contents' top columnsLayout; on scroll the white gap travels with content, so text glides flush up to the header's bottom edge — no dead band (OBSERVED f5/f10: "About Fishing Licenses" meets header seam).
- **DON'T shows**: gap created via Margin Below on the header card; the white strip stays pinned with the fixed header and scrolling text clips behind it mid-air — looks broken, wastes viewport (OBSERVED dont f6/f12: text vanishes under a floating white band).
- **Rule**: with `isHeaderFixed:true`, header layouts get `marginBelow:"NONE"`; spacing comes from `marginAbove` on the first contents component.
- **Severity**: always
- **Category**: layout
- **SAIL implication**: `a!cardLayout(marginBelow:"NONE")` in header + `a!columnsLayout(marginAbove:"STANDARD")` first in contents.

## hcl_fixed_header_responsive_do.gif + hcl_fixed_header_responsive_dont.gif

### Principle: Unfix tall headers on narrow screens
Frames read: do `_f0/_f12/_f24/_f36/_f48`; dont `_f0/_f13/_f26/_f39/_f52` (phone order-detail: blue app bar ≈#2563d4 (est.), "Order #12345667" EXTRA_LARGE, full-width CREATE SHIPPING LABEL solid ≈#33689b (est.), Shipping Priority/Days/Assignee rows with outline EXPEDITE/REASSIGN, Package Tracking milestone list with green ✓ ≈#3cb948 (est.)).

- **DO shows**: `a!isPageWidth()` sets isHeaderFixed false on phone — the tall header card scrolls away; Package Tracking and Customer sections get the full viewport (OBSERVED do f12/f24: tracking list fills screen under slim app bar).
- **DON'T shows**: header stays fixed and occupies ~58% of the 1920px-tall frame; content scrolls inside the small remaining strip — most of the page is unreachable at a glance (OBSERVED dont f13/f26).
- **Rule**: fix headers only when they stay short relative to the viewport; gate with `a!isPageWidth()` on narrow widths.
- **Severity**: always (phone + tall header)
- **Category**: mobile
- **SAIL implication**: `isHeaderFixed: not(a!isPageWidth("PHONE"))` (page text names a!isPageWidth; exact expression INFERRED).

## hcl_full_width.png

### Identification
- **Image**: hcl_full_width.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_full_width.png ("no gaps around the header" — Site page width)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page (Hugo Collection site welcome)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — museum/institution staff evaluating an art-loan program
- **Domain & brand context**: "Hugo Collection" private fine-art collection; premium, gallery-like, crimson brand
- **Top 3 user tasks (ranked)**: 1. Grasp what the collection is 2. Learn loan-program terms 3. Navigate to Loans to act
- **Implied requirements**: "Brand statement must fill the screen edge-to-edge" (why site width Full/Wide matters here); "Program terms readable without navigation"; "Site nav must stay minimal"
- **Data model sketch**: static marketing copy — Collection(>3,000 works, since 2006, Venice exhibitions), LoanProgram(eligibility: accredited institutions; borrower pays packing/transport/insurance) — OBSERVED from body text

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (white: WELCOME* ABOUT LOANS MY LOANS)
HEADER-CONTENT
├─ BILLBOARD h≈55%vh overlay=none-visible (dark gallery photo, text baked/overlaid left)
│  content="The world's largest private collection of loanable fine art." + HUGO logo block
└─ COLUMNS [1:1]
   ├─ SECTION "ABOUT THE COLLECTION" + paragraphs
   └─ SECTION "THE HUGO LOAN PROGRAM" + paragraphs
```
- **Above the fold**: full billboard + section headings and first paragraphs
- **Reading order**: Z — headline left, painting right, then two text columns
- **Hierarchy rationale**: edge-to-edge dark billboard is the teaching point (Full site width = flush with nav, no gutters); serif display line sells prestige before terms
- **Density**: 2 — hero + two text columns, editorial spacing
- **Ratios & spacing**: two equal text columns; billboard flush to top/left/right (OBSERVED: zero margin at edges — the point of this figure)

### Styling specifics (OBSERVED)
- **Palette**: billboard near-black gallery #17130f (est.); white display text #ffffff; crimson brand block/headings #b52a51 (est.); body charcoal #333333 (est.); nav white #ffffff with charcoal icon-tabs; red figure in photo echoes brand crimson
- **Color application points**: crimson at exactly three points — logo block, two section headings (+ nav avatar chip); everything else photo/neutral
- **Typography moves**: display line in a serif face at ≈EXTRA_LARGE (rare in SAIL — likely baked into billboard image, INFERRED); section headers MEDIUM_PLUS all-caps crimson; body STANDARD charcoal
- **Imagery stance**: full-bleed art-gallery photograph (woman in red viewing Manet), doubles as brand
- **Card treatment**: none — open two-column text on white
- **Signature moves**: instead of a hero card, a photographic billboard with serif overlay text; instead of many accents, single crimson family reserved for headings/logo; site width "Full" so billboard fuses with nav
- **Signature caveat**: serif text almost certainly part of the image asset — SAIL rich text has no serif switch (INFERRED)

### Component inventory (INFERRED)
- `a!headerContentLayout(header:{a!billboardLayout(backgroundMedia: photo, overlay: none or baked text)}, contents:{a!columnsLayout ×2 sections of rich text})`; site page width = "Full"/"Wide" (page text)
- Charts: none | Affordances: site nav only

### Character & judgment
- **Register**: premium-editorial — serif display, gallery photography, restrained crimson
- **Why it works**: dark billboard against white content = maximal zone contrast; crimson repetition (logo → headings) stitches hero to body; flush edges make the site feel designed, not framed
- **Why not boring**: serif headline in a product world of sans; brand color used as punctuation not wallpaper; photo chosen so its red subject echoes the logo
- **Boring twin**: gray strip header with "Welcome to Hugo Collection" in default sans, single centered column of terms, stock art thumbnail
- **What to steal**: match one photo accent to brand hex; all-caps colored section headers as the only heading device; use Full site width when header must read edge-to-edge
- **Risks**: baked-in text does not reflow/translate and is invisible to screen readers (a11y); long line lengths in two wide columns at 3360px

## hcl_mixed_header_annotated.png

### Identification
- **Image**: hcl_mixed_header_annotated.png | **Source page**: ux-header-content-layout | **Alt/caption**: none (Mixed header subsection; red doc callouts "Billboard", "Card", "Card", "Contents")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: dashboard-analytical (fundraising ops header demo)

### Use-case reconstruction (INFERRED)
- **Persona**: weekly-manager — fundraising director monitoring campaign health
- **Domain & brand context**: Boreas Foundation internal side (same brand as donor flow)
- **Top 3 user tasks (ranked)**: 1. Scan five KPIs vs target 2. Launch a new campaign 3. Drill into dashboard cards below
- **Implied requirements**: "Five KPIs + primary action in one strip"; "Brand imagery without spending vertical space" (EXTRA_SHORT billboard); "Deltas must show direction at a glance"
- **Data model sketch**: KPI(label, value, delta, direction): GIFT DOLLARS TO TARGET 82.9% ▲1.9; DONOR RETENTION 74.2% ▼2.3; NEW DONORS TO TARGET 91.6% ▲3.0; RECURRING GIFT RATE 48.5% ▼5.1; ACTIVE CAMPAIGNS 11 — OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (bg=WHITE)
├─ BILLBOARD h=EXTRA_SHORT (penguin photo strip, no overlay)
├─ CARD(#0f203a: icon + "My Dashboard")
├─ CARD(#eee: KPI-ROW ×5 w/dividers | spacer | BUTTON "NEW CAMPAIGN" SOLID LARGE)
└─ COLUMNS [1:1] of empty CARDs (SHORT_PLUS ×2 / TALL)
```
- **Above the fold**: entire stacked header + placeholder contents
- **Reading order**: F — photo strip, title bar, KPI strip, then cards
- **Hierarchy rationale**: three stacked header layers grade from brand (photo) → identity (navy title) → data (gray KPI strip); the single SOLID button sits right of KPIs so scan ends at the action
- **Density**: 3 — 5 KPIs + button + title in header alone; placeholders below
- **Ratios & spacing**: KPI columns inside width WIDE_PLUS with spacing SPARSE + dividers; spacer column AUTO; button column NARROW; alignVertical MIDDLE (all CODE-VERIFIED)

### Styling specifics (CODE-VERIFIED)
- **Palette**: billboard photo strip; title card #0f203a; KPI card #eee; page WHITE; icons SECONDARY (gray-blue); deltas POSITIVE (green) / NEGATIVE (red); button default blue SOLID
- **Color application points**: color only at semantic points — POSITIVE/NEGATIVE carets, SECONDARY metric icons, one SOLID button; KPI text neutral
- **Typography moves**: KPI labels plain uppercase STANDARD gray text; values MEDIUM_PLUS STRONG with icon prefix; deltas STANDARD; title MEDIUM_PLUS STRONG white
- **Imagery stance**: photo as thin texture band only (EXTRA_SHORT — height is the entire trick)
- **Card treatment**: all header cards filled, borderless, marginBelow NONE — they stack into one fused banner
- **Signature moves**: instead of one header layout, three stacked layouts in the `header` array (billboard + 2 cards) forming a composite banner; instead of a!kpiField, hand-built KPI row via sideBySide icon+value+caret (full control of sizes); showDividers:"true" as KPI separators

### Component inventory (CODE-VERIFIED)
- `a!billboardLayout(height:"EXTRA_SHORT", marginBelow:"NONE")`; `a!cardLayout(style:"#0f203a")`; `a!cardLayout(style:"#eee")` containing `a!columnsLayout(spacing:"SPARSE", showDividers:true)` of 5 KPI columns (`a!richTextIcon(color:"SECONDARY", size:"MEDIUM_PLUS")` + value STRONG + caret `POSITIVE/NEGATIVE`); `a!buttonWidget(label:"NEW CAMPAIGN", icon:"plus-circle", size:"LARGE", style:"SOLID", align END)`; contents placeholder cards SHORT_PLUS/TALL
- Charts: none | Affordances: single button (KPIs not links)

### Character & judgment
- **Register**: authoritative-executive + utilitarian-ops — muted grays, uppercase labels, one action
- **Why it works**: EXTRA_SHORT photo gives brand warmth for ~120px; #0f203a → #eee → WHITE forms a legible depth stack; POSITIVE/NEGATIVE carets are the only saturated data ink
- **Why not boring**: layered mixed header (photo+navy+gray) instead of one bar; KPI strip inside the header so metrics travel with page chrome; dividers + SPARSE spacing instead of boxed KPI cards
- **Boring twin**: navy bar with title, KPIs as four bordered cards in contents, button floating top-right of page
- **What to steal**: multi-layout header stacking; EXTRA_SHORT billboards as brand ribbons; put the page's one primary action inside the KPI strip
- **Risks**: 5 KPI columns + button compress badly on tablet (SPARSE spacing collapses); #eee on WHITE is a subtle boundary (fine, but low-contrast)

### Code cross-check
- **Code-verified palette**: #0f203a, #eee, WHITE; semantic POSITIVE/NEGATIVE; SECONDARY icons
- **Notable techniques**: header accepts a list of 3 layouts (~1026-1325); KPI column pattern (~1067-1291); alignVertical MIDDLE on the strip (~1317)
- **Corrections**: KPI strip gray is #eee, not the #f0f0f0 I would have pixel-guessed

## hcl_page_width.png

### Identification
- **Image**: hcl_page_width.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_page_width.png ("a margin surrounds the page" — Site page width)
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page (same Hugo Collection welcome as hcl_full_width.png, at Medium/Narrow site width)

### Use-case reconstruction (INFERRED)
Same as hcl_full_width.png. Delta teaching point: what the identical interface looks like when the site page width (site-object setting, not SAIL) is "Medium"/"Narrow" — or "Wide" on very wide monitors/Tempo.

### Layout anatomy (OBSERVED)
- **Skeleton**: identical to hcl_full_width.png, but the whole HCL (billboard + contents) is inset within a light-gray site background; nav bar still spans full width
- **Above the fold**: billboard + headings + first paragraphs
- **Reading order**: Z
- **Hierarchy rationale**: unchanged; the visible margin frames the page as a "document" rather than an app surface
- **Density**: 2
- **Ratios & spacing**: page block centered with ≈5% side gutters (OBSERVED); billboard flush only to the page block's own edges, not the viewport

### Styling specifics (OBSERVED)
- **Palette**: as hcl_full_width.png plus surrounding site background #f0f0f0 (est.) creating the frame
- **Color application points**: unchanged
- **Typography moves**: unchanged
- **Imagery stance**: unchanged
- **Card treatment**: unchanged
- **Signature moves**: none new — the delta is environmental (site width), proving HCL "flush edges" promise is bounded by the page, not the monitor

### Component inventory (INFERRED)
- Same as hcl_full_width.png; differing only in site-object width setting (not a SAIL param)

### Character & judgment
- **Register**: premium-editorial
- **Why it works**: shows the same design surviving both framings; gray matte still reads intentional because billboard/nav tones hold
- **Why not boring** / **Boring twin**: see hcl_full_width.png
- **What to steal**: when choosing Medium/Narrow widths, expect a visible matte around HCL headers — pick billboard colors that tolerate a gray frame, or choose Full width for edge-to-edge heroes
- **Risks**: designers assuming edge-to-edge headers everywhere will be surprised in Tempo/narrow widths (the figure's exact warning)

## hcl_secondary_nav.png

### Identification
- **Image**: hcl_secondary_nav.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_secondary_nav.png ("billboard + card with secondary navigation controls")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: portal (Loans area landing with sub-navigation)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — institutional borrower starting a loan request
- **Domain & brand context**: Hugo Collection (crimson brand, gallery imagery)
- **Top 3 user tasks (ranked)**: 1. Start a new loan request 2. Jump between My Loans / Loan Guidelines subpages 3. Understand the 3-step process before starting
- **Implied requirements**: "Loans area needs its own sub-destinations under site nav"; "Process must be explained in ≤3 steps before CTA"; "Current subpage must be visibly active"
- **Data model sketch**: LoanRequest(flow: Search collection → Schedule period/transport/event → Request w/event details); Nav(My Loans, New Loan Request*, Loan Guidelines) — OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (white: WELCOME ABOUT LOANS* MY LOANS)
HEADER-CONTENT
├─ BILLBOARD h≈33%vh (washed-light gallery photo) content=HUGO logo + "Artwork Loans" EXTRA_LARGE
├─ CARD(crimson: SECONDARY-NAV "My Loans | New Loan Request* | Loan Guidelines")
└─ CONTENTS (white, centered column)
   ├─ SBS STEP-1 box + "Search" MEDIUM_PLUS + caption ×3 (Search/Schedule/Request)
   └─ BUTTON "GET STARTED" SOLID LARGE crimson, centered
```
- **Above the fold**: everything — billboard, nav band, 3 steps, CTA
- **Reading order**: single-column — title, nav band, steps top-to-bottom, CTA
- **Hierarchy rationale**: crimson band directly under billboard is the actual subject (secondary nav placement); steps use identical gray blocks so the crimson CTA is the only saturated element in contents
- **Density**: 1 — three step rows + one button in a full viewport, marketing-airy
- **Ratios & spacing**: steps centered ≈45% width column; EVEN_MORE-scale gaps between steps (est.)

### Styling specifics (OBSERVED)
- **Palette**: secondary-nav card + CTA + logo crimson #b52a51 (est.); STEP boxes #6d6d6d (est.) with white text; billboard photo whitewashed (bright image or light overlay, INFERRED) with near-black title text #2b2b2b (est.); page WHITE; active nav item bold + caret, inactive white regular
- **Color application points**: crimson = navigation band, logo, CTA only; gray = step markers; semantic none
- **Typography moves**: page title EXTRA_LARGE STRONG dark on light photo; step verbs MEDIUM_PLUS STRONG with SMALL trailing caption on same line; nav items STANDARD white (active STRONG)
- **Imagery stance**: light gallery photo as texture; small line icons before step verbs
- **Card treatment**: nav band = filled borderless crimson card; steps not carded (open composition)
- **Signature moves**: instead of tabs in contents, a filled card in the `header` list acts as a nav band fused to the billboard; instead of numbered circles, chunky gray STEP-N blocks + verb-first labels; whitewashed photo lets dark title sit directly on imagery (inverse of the usual dark-overlay/white-text)
- **Fixed behavior**: with isHeaderFixed, this billboard+nav stack would pin — the caption pattern the fixed-header gif family warns about on mobile (cross-ref)

### Component inventory (INFERRED)
- `a!headerContentLayout(header:{a!billboardLayout(light image, overlay w/ logo+title), a!cardLayout(style: crimson, links row)})`; nav via `a!richTextDisplayField` link items or buttons (INFERRED); steps via `a!sideBySideLayout(stamp/card + rich text)`; `a!buttonWidget(style:"SOLID", size:"LARGE")`
- Charts: none | Affordances: secondary nav links (active state), one CTA

### Character & judgment
- **Register**: premium-editorial + institutional — gallery photo and restrained palette with bureaucratic step clarity
- **Why it works**: crimson band reads instantly as "you are in Loans"; 1-viewport pitch (what → how → act); single saturated CTA gets all conversion attention
- **Why not boring**: dark-on-light billboard text; verb-first step labels with inline captions; nav band as part of the header stack rather than tabs below
- **Boring twin**: white page, "Loans" H1, tab strip, numbered ordered list, blue Get Started bottom-left
- **What to steal**: filled card in header array = secondary nav band; keep sub-nav ≤3 items with bold+caret active state; one saturated CTA per viewport
- **Risks**: white nav text on crimson ok, but bold-only active state is weak for color-blind users (add underline); title-on-photo contrast depends on image brightness

## hcl_title_bar.png

### Identification
- **Image**: hcl_title_bar.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_title_bar.png ("new hire onboarding dashboard… header card draws attention to photo, name, key info")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: record-view (new-hire onboarding status)

### Use-case reconstruction (INFERRED)
- **Persona**: daily-operator — HR/recruiting coordinator working a pipeline of new hires
- **Domain & brand context**: internal recruiting app (Appian-branded demo), corporate slate/steel palette
- **Top 3 user tasks (ranked)**: 1. Check Kathy Gregory's onboarding readiness (83%, starts in 10 days) 2. Chase overdue tasks (-3d, -1d red) by assignee 3. Verify per-team completion and contact owners
- **Implied requirements**: "Identity + start date visible without scroll"; "Overdue tasks must jump out (sorted by due, red negatives)"; "Per-team progress at a glance"; "Every task shows an owner with role"
- **Data model sketch**: NewHire(photo, name, role, REFERRAL tag, dept Engineering, office HQ, school U. of Virginia, start 8/5/2019); HiringTimeline(applied 11/5/2018 →4d→ phone 11/9 →7d→ onsite 11/16 →35d→ offer 12/21 →227d→ start); TaskGroup(team, done/total: Recruiting 7/8, HR 14/18, Finance 9/9, IT 8/11, Engineering 12/14); Task(name, assignee+role, due Δ: -3d…10d); Contact(manager/recruiter/trainer); PersonFields(first/middle/last, email, phones, foreign national, disabilities, referred by, candidate type, past employee) — all OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (charcoal, active tab light-blue "NEW HIRES")
HEADER-CONTENT
├─ CARD(slate #48617e est.: AVATAR-photo + name LARGE + role caps + REFERRAL tag | Dept/Office/School w/icons)
└─ CONTENTS
   ├─ SBS: DONUT 83% + "50 of 60 tasks / Starts in 10 days" | TIMELINE 5 events w/day-gaps
   └─ COLUMNS [≈1:1]
      ├─ GRID(5 progress bars w/% + team (n/m)) + 3 CONTACTS + FORM-FIELD GRID 3-col
      └─ TABLE(task | assignee avatar+role | due Δ, sorted asc, red negatives)
```
- **Above the fold**: header + donut + timeline + top of both columns
- **Reading order**: F — identity bar, readiness row, then columns
- **Hierarchy rationale**: person identity is the record anchor (biggest, photo-led); readiness (donut + timeline) spans full width because "is she ready to start" is the page's question; overdue-sorted task list right column = worklist
- **Density**: 4 — donut, 5-event timeline, 5 bars, 3 contacts, 9-field grid, ~10-row task list in one viewport
- **Ratios & spacing**: near-equal content columns; compact row spacing (LESS-scale, est.); hairline dividers between timeline events

### Styling specifics (OBSERVED)
- **Palette**: nav charcoal #303030 (est.) + active tab #4aa5da (est.); header slate #48617e (est.); REFERRAL tag magenta #bb2e88 (est.); donut/progress blue #2371a7 (est.); team bars steel #4a6580 (est.); Finance 100% bar green #4cb52f (est.); overdue red #d0342c (est.); link/name blue #2d7dc3 (est.); labels gray #757575 (est.); page WHITE
- **Color application points**: slate header; magenta only on the tag; green only at 100%; red only on negative due; blue for people-links and progress; neutral everything else — strict semantic economy
- **Typography moves**: name LARGE with mixed weight ("Kathy" STRONG + "Gregory" light); role/labels all-caps SMALL gray; big % values STRONG; due Δ MEDIUM right-aligned; field labels STRONG STANDARD over plain values
- **Imagery stance**: real people photos — circular avatar LARGE in header, small avatars in task list and contacts (accountability device)
- **Card treatment**: zones divided by whitespace + hairlines, not cards — flat working surface
- **Signature moves**: instead of a!kpiField rows, a donut + inline event timeline with day-gap labels between milestones; instead of a status column, due-delta sorted ascending with red negatives; mixed-weight name; per-team progressBar stack with (n/m) counts

### Component inventory (INFERRED)
- `a!headerContentLayout(header:{a!cardLayout(style:"#48617e"-like)})`; `a!gaugeField(percentage 83)`; timeline likely `a!sideBySideLayout` chain of icon+date rich text (or milestoneField-custom, INFERRED); `a!progressBarField` ×5; task list `a!gridField` w/ rich-text columns (user images + colored due text); REFERRAL `a!tagField(background magenta)`
- Charts: gauge/donut; no colorScheme evidence | Affordances: nav tabs, people links, sortable due column (arrow OBSERVED)

### Character & judgment
- **Register**: utilitarian-ops + warm-community — dense worklist humanized by faces
- **Why it works**: one question (ready?) answered three ways at three depths (donut → team bars → task rows); red only where action is owed; photos make ownership unambiguous
- **Why not boring**: hiring-timeline with elapsed-day gaps (227d!) instead of a date list; mixed-weight name typography; magenta tag as the sole brand-color pop on a slate header
- **Boring twin**: white page titled "Kathy Gregory", four bordered KPI cards, tasks in a plain grid with a Status dropdown column, no photos
- **What to steal**: due-delta sorting + red negatives; day-gap timeline; header card as identity bar (photo + facts row) via HCL on non-record pages
- **Risks**: slate header text ~4.5:1 borderline for SMALL caps labels; density 4 needs tablet reflow; red/green deltas need icons for color-blind users (carets present elsewhere but not here)

## hcl_transparent_content.png

### Identification
- **Image**: hcl_transparent_content.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_transparent_content.png ("four category cards stand out clearly against the transparent page background")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: home-page (employee self-service portal)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — any ACME employee needing help (monthly-or-less)
- **Domain & brand context**: ACME corporate self-service; loud red brand, friendly illustration
- **Top 3 user tasks (ranked)**: 1. Route to the right help category 2. Recognize scope of each category before clicking 3. Feel greeted (personalized "Hi, Erickah.")
- **Implied requirements**: "Four categories max, one click deep"; "Personal greeting"; "Cards must pop from the page background" (the transparent-background lesson)
- **Data model sketch**: HelpCategory(name, description, illustration): Insurance(medical/dental/vision/supplemental), Finance(expense, pay stubs, retirement), IT Support(equipment, software, telecom), Facilities(supplies, HVAC, refreshments); User(first name) — OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT (backgroundColor=TRANSPARENT → site gray shows)
├─ BILLBOARD/CARD red: "Hi, Erickah." + "What do you need help with today?" LARGE + flat illustration right
└─ COLUMNS [1:1] ×2 rows
   └─ CARD(link): [dark illustration panel | white text panel: title red + caption]
```
- **Above the fold**: banner + all four cards
- **Reading order**: F — greeting, then card grid L→R, T→B
- **Hierarchy rationale**: question-as-headline orients instantly; 2×2 grid keeps categories equal-weight; illustrated left panels make categories recognizable pre-read
- **Density**: 2 — banner + 4 cards, wide gutters
- **Ratios & spacing**: cards ≈47% width each with wide gap; inside each card ≈[1:2] image:text; banner ≈40% viewport height

### Styling specifics (OBSERVED)
- **Palette**: header red #d02c22 (est.); page background light gray #f0f0f0 (est., site bg via "Transparent"); card image panels dark warm gray #4c4a4a (est.) with red-family illustrations; card text panels WHITE; category titles brand red #c62f26 (est.); captions gray #5f5f5f (est.)
- **Color application points**: red = header field + category titles + illustration accents (brand saturation); dark panels give each card mass; page gray exists only to push white cards forward — the guideline itself
- **Typography moves**: greeting STANDARD white, question LARGE STRONG white; card titles MEDIUM_PLUS red; captions STANDARD gray
- **Imagery stance**: flat spot-illustrations (isometric desk scene in banner; category vignettes recolored to brand red)
- **Card treatment**: white filled, hairline border, no shadow (flat design language)
- **Signature moves**: instead of default WHITE, `backgroundColor:"TRANSPARENT"` so white cards contrast with the gray site bg; split-panel card anatomy (dark image half + white text half); greeting + question replaces a title
- **Cross-ref**: same lesson as `insurance_quote_returning_portal.png` (custom bg + lighter cards) — analyzed under its primary page

### Component inventory (INFERRED)
- `a!headerContentLayout(backgroundColor:"TRANSPARENT", header:{red billboard/card with overlay illustration})`; cards `a!cardLayout(link:…, showBorder:true)` wrapping `a!columnsLayout(image column + rich text column)`; illustrations `a!imageField`
- Charts: none | Affordances: 4 cards-as-links

### Character & judgment
- **Register**: energetic-consumer + warm-community — saturated brand red, first-name greeting, playful art
- **Why it works**: transparent bg turns default gray into free contrast; exactly four choices (Hick's-law friendly); question-form headline maps to the user's mental state
- **Why not boring**: dark illustration panels give cards weight without shadows; brand red reused inside artwork; conversational H1
- **Boring twin**: white page, "Employee Self Service" title, four blue link tiles with generic line icons, no greeting
- **What to steal**: TRANSPARENT background whenever contents are all cards; split-panel category cards; greeting+question header copy
- **Risks**: large red field is intense (long-exposure fatigue); red on dark-gray illustration panels borderline contrast; title-red on white passes but caption gray is smallish

## hcl_transparent_content_and_header.png

### Identification
- **Image**: hcl_transparent_content_and_header.png | **Source page**: ux-header-content-layout | **Alt/caption**: ds-images/hcl_transparent_content_and_header.png ("same color for billboard header background and page content backgrounds"; teal doc callouts "Billboard background", "Header content layout background")
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: landing-page (apartment marketing, "Home Finder")

### Use-case reconstruction (INFERRED)
- **Persona**: first-time-public — prospective apartment renter
- **Domain & brand context**: residential property marketing; friendly civic blue
- **Top 3 user tasks (ranked)**: 1. Check availability (CTA) 2. Browse floor plans 3. Scan amenities
- **Implied requirements**: "Hero and content must read as one seamless surface" (the guideline: billboard bg hex = page bg); "One primary CTA above the fold"; "Feature cards must stand out on the shared background"
- **Data model sketch**: Property(pitch copy, transit/parks claims), FloorPlans(studio/1BR/2BR), Amenities(gym, pool) — OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-NAV (blue bar "Home Finder")
HEADER-CONTENT (bg = same light gray as billboard)
├─ BILLBOARD (transparent-bg illustration): "Find your new home" + copy + BUTTON "CHECK AVAILABILITY" | city illustration
└─ COLUMNS [1:1]
   ├─ CARD(white: illustration | "Floor Plans" + copy + BROWSE outline)
   └─ CARD(white: illustration | "Amenities" + copy + LEARN MORE outline)
```
- **Above the fold**: everything
- **Reading order**: Z — headline/CTA left, illustration right, then two cards
- **Hierarchy rationale**: seamless gray makes hero+body one canvas so the white cards and the one solid CTA are the only "objects"; CTA placed within hero text block = first action encountered
- **Density**: 2 — hero + two cards
- **Ratios & spacing**: hero text ≈45% width; two equal cards with generous gutter

### Styling specifics (OBSERVED)
- **Palette**: shared background #f0f1f2 (est.) for BOTH billboard and contents (the lesson); nav + heading + CTA blue #2d6da3 (est.); illustration blues #2f7bc4/#9db8d6 (est.); cards WHITE; body charcoal #3a3a3a (est.); callout orange/purple are doc artifacts, not UI
- **Color application points**: one blue family across nav, H1, buttons, illustration — monochrome brand discipline; no semantic colors
- **Typography moves**: H1 LARGE_PLUS regular-weight blue; body STANDARD; card titles MEDIUM blue; outline buttons SMALL caps
- **Imagery stance**: flat illustrations with transparent backgrounds — the enabling trick for the seamless look (page text confirms)
- **Card treatment**: white filled, hairline border, no shadow
- **Signature moves**: instead of a colored hero band, billboard backgroundColor set to the same hex as HCL background so the header dissolves into the page; transparent-PNG illustration floats directly on shared bg; only the CTA is solid-filled
- **Cross-ref**: inverse strategy of hcl_transparent_content.png (there: bg contrast pops cards; here: bg unity dissolves the header)

### Component inventory (INFERRED)
- `a!headerContentLayout(backgroundColor:"#F0F1F2"-like or "TRANSPARENT", header:{a!billboardLayout(backgroundColor same hex, backgroundMedia transparent PNG, overlay text+button)})`; feature `a!cardLayout(link)` + `a!buttonWidget(style:"OUTLINE")`
- Charts: none | Affordances: 3 buttons/links, cards-as-links

### Character & judgment
- **Register**: energetic-consumer + calm-clinical — friendly illustration on a quiet single-hue system
- **Why it works**: zero seams = premium perceived polish; monochrome blue keeps CHECK AVAILABILITY unambiguous as the action; white cards get automatic contrast
- **Why not boring**: headerless-feeling header (color-matched billboard) is a deliberate anti-banner move; illustration replaces photography for a lighter tone
- **Boring twin**: blue hero band with white H1, white body below with a visible seam, three equal buttons
- **What to steal**: match billboard hex to HCL background when artwork has transparent bg; keep one solid button, all else outline
- **Risks**: light-gray-on-white card borders are subtle; blue H1 on gray ~ contrast fine but regular weight at LARGE_PLUS can feel faint; doc callouts must not be mistaken for UI

## hcl_welcome_banner.png

### Identification
- **Image**: hcl_welcome_banner.png | **Source page**: ux-header-content-layout | **Alt/caption**: alttext — "employee health questionnaire site uses a bold welcome banner"; teal doc callouts "Site Header Bar", "Header content layout"
- **Device frame**: desktop
- **Marker**: neutral
- **UI type**: form (questionnaire with welcome banner)

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer — employee completing a return-to-work check (pandemic-era)
- **Domain & brand context**: internal HR/health ("Employee Readiness", Appian-branded chrome); reassuring indigo + soft blue
- **Top 3 user tasks (ranked)**: 1. Understand why this questionnaire exists 2. Select country + office returning to 3. Continue to next question
- **Implied requirements**: "Purpose stated before any input"; "Location picking must be visual/one-tap with search fallback"; "Selected state must be unmistakable"; "Sections numbered for progress sense"
- **Data model sketch**: Questionnaire → Q1 WorkLocation(country: US*, UK, Australia, Spain, Germany, Italy w/flags + search; office: Headquarters McLean VA*, NYC WeWork, Remote WFH + search); banner copy re: local requirements — OBSERVED

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
SITE-HEADER-BAR (white: "Employee Readiness" + avatar/appian)
HEADER-CONTENT
├─ CARD/BILLBOARD light-blue: "Return to Work Readiness Questionnaire" LARGE_PLUS violet
│  + body copy | masked-people illustration right
└─ CONTENTS (white)
   └─ COLUMNS [≈1:2]
      ├─ STAMP "1" violet square + "Work Location" violet MEDIUM_PLUS
      └─ FORM: "Which office…" LARGE; COUNTRY caps label + search + GRID(3×2 flag cards, US selected)
              OFFICE caps label + search + GRID(3 cards, HQ selected); CONTINUE outline btn right
```
- **Above the fold**: banner + entire question 1
- **Reading order**: F — banner, section marker, question, grids, CTA
- **Hierarchy rationale**: banner explains stakes before asking anything; numbered left rail scales to multi-section form; selected-card fills carry the strongest color so current answers dominate
- **Density**: 2 — one question group per viewport, airy grids
- **Ratios & spacing**: question column ≈2× marker column; card grid 3-up with STANDARD gaps; banner ≈45% viewport height

### Styling specifics (OBSERVED)
- **Palette**: banner soft blue #d9e4f4 (est.); headline + stamp + selected cards violet-indigo #453a95 (est.; selected fill #443b90 est.); selected-check green #3fae49 (est.); unselected cards WHITE w/ gray border #d7d7d7 (est.); site bar near-white #fafafa (est.); illustration purples #6c63ff-family (est.); CONTINUE outline violet
- **Color application points**: violet = headline, section stamp, section title, selected fills, CTA outline — one hue carries identity + selection; green only on selected checkmarks; flags provide the only polychrome
- **Typography moves**: banner headline LARGE_PLUS violet on soft blue; question LARGE charcoal; COUNTRY/OFFICE all-caps SMALL gray labels; card labels STANDARD (selected: white + STRONG)
- **Imagery stance**: unDraw-style flat illustration (masked figures) + real flag icons in choice cards
- **Card treatment**: choice cards bordered white; selected = solid violet fill + white text + green check (triple-coded state)
- **Signature moves**: instead of dropdowns, searchable card grids with flags; selected state via full card fill (not just border); numbered violet stamp as section wayfinding; banner tint picked from illustration's palette so header and art fuse
- **Guideline tie**: page text notes matching banner color to site nav creates a "larger, sleeker banner" — here both are light so the site bar melts into the banner (OBSERVED)

### Component inventory (INFERRED)
- `a!headerContentLayout(header:{a!cardLayout/billboard(soft-blue, illustration)})`; choice grids likely `a!cardChoiceField` or selectable `a!cardLayout(link + conditional style)` (flags argue cardChoiceField w/ images, INFERRED); `a!textField` search inputs; `a!stampField(shape square, violet)` or styled card for "1"; `a!buttonWidget(style:"OUTLINE", label:"CONTINUE")`
- Charts: none | Affordances: search-filter inputs, selectable cards, CTA

### Character & judgment
- **Register**: calm-clinical + warm-community — muted hues and gentle illustration for an anxious topic
- **Why it works**: stakes-first banner reduces form abandonment; triple-coded selection (fill+white text+check) is unmissable; single violet family keeps a medical topic calm
- **Why not boring**: flag cards instead of a country dropdown; illustration-matched banner tint; numbered stamp rail promising structure
- **Boring twin**: white page, "COVID-19 Questionnaire" title, two dropdowns (Country, Office), Continue bottom-left
- **What to steal**: pick banner hex from the illustration; searchable card-choice grids for ≤9 options; state = fill not border
- **Risks**: soft-blue banner + white site bar can wash out on bright screens; violet fill + white text passes, but green check on violet is decorative-only for color-blind users (ok — redundant coding present); huge source resolution (8450px) implies 2x asset — text sizes read larger than actual

Cross-page note: `insurance_quote_returning_portal.png` (custom background color guideline) and `non_profit_fundraising_landing.png` (background color & padding intro) also appear on this page but are analyzed under their primary pages; their lessons here are "custom bg + lighter cards" and "HCL needed for bg/padding control" respectively.
