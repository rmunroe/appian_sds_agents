# Analysis: components

## component_welcome_image.png

### Identification
- **Image**: component_welcome_image.png | **Source page**: components (Components Overview) | **Alt/caption**: "component_welcome_image.png" — hero image for the components docs landing page
- **Device frame**: desktop (3360x1502, 2x retina, no browser chrome)
- **Marker**: neutral
- **UI type**: wizard-step (public self-service form). INFERRED: as the overview hero it doubles as a sampler — milestone, text/dropdown/checkbox/file-upload inputs, callout card, and buttons in one composition.

### Use-case reconstruction (INFERRED)
- **Persona**: member of the public ordering a vital record from a state portal — occasional-customer / first-time-public; low tolerance for ambiguity, high stakes on getting names exactly right.
- **Domain & brand context**: state government self-service ("State.gov" wordmark + torch glyph); institutional trust brand, zero ornament.
- **Top 3 user tasks (ranked)**: 1. Enter the birth name exactly as on the original certificate. 2. Upload an acceptable proof-of-name document. 3. Advance confidently through the 4-step order.
- **Implied requirements**: "Name must match the original certificate exactly (helper text carries the rule)"; "Support the changed-name case via a disclosure checkbox"; "Proof document is required before proceeding"; "Acceptable-document rules must sit at the point of upload"; "Keep users oriented across all 4 steps"; "Allow cancel at any step".
- **Data model sketch** (OBSERVED off labels): CertificateOrder(firstName*, mi, lastName*, suffix, nameDiffersFlag, proofDocs 1..n); process = Birth Name → Birth Date & Location → Parental Information → Confirmation; cart icon implies Order(certificateItems 1..n).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
HEADER-CONTENT
├─ TOPBAR site chrome (State.gov logo | app-grid icon + avatar)
├─ BILLBOARD h≈210 bg=#061328 overlay=none content=breadcrumb "Home › Online Self Service"
│                              + EXTRA_LARGE title "Order Birth Certificate" + cart icon
└─ COLUMNS [NARROW:WIDE]
   ├─ WIZARD-STEP 1/4 vertical milestone (1 Birth Name ●active · 2 Birth Date & Location
   │                                      · 3 Parental Information · 4 Confirmation)
   └─ FORM
      ├─ COLUMNS [First*:M.I.:Last*:Suffix] widths≈[6:1:6:2] + helper line
      ├─ checkbox "name…is different than the applicant's current legal name"
      ├─ FILE-UPLOAD "Proof of Name *" (UPLOAD button + "Drop files here" zone)
      ├─ CARD(info callout bg#f3f5f9, icon-led, 2-bullet list)
      └─ BUTTON-ROW (CANCEL text link left · NEXT solid right)
```
- **Above the fold**: everything — single-viewport step.
- **Reading order**: single-column down the form after one Z across the header; the milestone rail is peripheral orientation.
- **Hierarchy rationale**: EXTRA_LARGE white title on near-black navy makes the transaction unmistakable (task 3 orientation); the four-field name row leads the form because exact-name entry is task 1; the tinted callout is the heaviest body element because its document rules decide task 2 success.
- **Density**: 2 — one form zone + stepper, ~8 controls in the viewport, generous negative space left of the form.
- **Ratios & spacing**: stepper column ≈22% width; name-field widths proportional to expected input (M.I. ≈60px, Suffix a narrow dropdown); callout padding ≈MORE; vertical gaps ≈STANDARD/MORE.

### Styling specifics (OBSERVED)
- **Palette**: page bg #ffffff; header band #061328; primary accent #3179b5; callout bg #f3f5f9 with border #d4d4d4 (est.); body text #222222; helper text #767676; inactive step circles #cccccc; title text #eeeeee.
- **Color application points**: header band; active milestone circle; NEXT button fill; CANCEL link; required asterisks; info icon; nothing else — a strict navy+blue two-color system.
- **Typography moves**: page title EXTRA_LARGE white; step labels STANDARD (active STRONG #222222); field labels STANDARD STRONG; helper SMALL #767676 (sample even ships a typo: "Enter the exactly as it appeared…" — OBSERVED); all-caps button labels.
- **Imagery stance**: none (avatar photo in chrome only); glyph icons for cart/doc/info.
- **Card treatment**: flat filled callout (#f3f5f9, hairline border, square corners); inputs flat white with #dddddd (est.) hairline borders.
- **Signature moves**: instead of a plain white page header, a full-bleed near-black navy band with EXTRA_LARGE title via the header-content/billboard lever — public-portal gravitas; instead of uniform full-width inputs, column widths mapped to content length (tiny M.I., narrow Suffix); instead of buried helper prose, an icon-led tinted card placed directly under the control it governs; instead of a horizontal step bar, a vertical milestone in a left rail that survives form growth; required asterisks in accent #3179b5 rather than alarm red.

### Component inventory (OBSERVED)
a!headerContentLayout with dark billboard-style header + breadcrumb richText; a!milestoneField(orientation:"VERTICAL", active:1); a!columnsLayout for [stepper:form] and the 4-field name row; a!textField ×3; a!dropdownField (Suffix); a!checkboxField (single item); a!fileUploadField ("UPLOAD" + drop zone); callout ≈ a!cardLayout(style tint #f3f5f9) + a!richTextIcon("info-circle", #3179b5); a!buttonArrayLayout — NEXT a!buttonWidget(style:"SOLID"), CANCEL link-style secondary. Charts: none. Affordances: upload, checkbox, dropdown, next/cancel; milestone is display-only.

### Character & judgment
- **Register**: institutional + calm-clinical — navy restraint, procedural tone, no decoration.
- **Why it works**: the #061328 band frames an "official transaction" while the body stays clinical white; proportional field widths telegraph expected input and cut entry errors; the #f3f5f9 callout keeps eligibility rules one eye-jump from the upload control they govern.
- **Why not boring**: near-black navy instead of default-blue header; single-accent discipline (even asterisks are blue); content-length-proportioned name row; icon-led requirement card replacing a wall of helper text.
- **Boring twin**: white header with a black H1 and a horizontal stepper squeezed above it; every field full-width stacked; document rules as a gray paragraph somewhere above; two identical gray buttons bottom-right.
- **What to steal**: dark billboard header band for public one-off transactions; requirement callout directly beneath its control; width-proportioned field rows.
- **Risks**: #767676 helper on white ≈4.7:1 — passes AA but small; the pale UPLOAD button reads low-affordance beside the drop zone; the 4-column name row must stack carefully on phone; a cart icon on a certificate flow may puzzle first-time users.

### Code cross-check
- none (no SAIL source on this page)
