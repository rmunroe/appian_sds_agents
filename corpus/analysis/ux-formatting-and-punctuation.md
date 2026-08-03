# Analysis: ux-formatting-and-punctuation

No SAIL source on this page — all hexes pixel-sampled `(est.)`. One tier-A annotated form + five DO/DON'T pairs + one solo DO.

## capitalization_example.png

### Identification
- **Image**: capitalization_example.png | **Source page**: ux-formatting-and-punctuation (guidance) | **Alt/caption**: ds-images/capitalization_example.png (section "Capitalization")
- **Device frame**: desktop
- **Marker**: neutral (annotated reference example — every annotation marks a correct usage)
- **UI type**: form

### Use-case reconstruction (INFERRED)
- **Persona**: occasional-customer or employee filing a complaint — first-time-public user of a one-shot intake form.
- **Domain & brand context**: generic service organization (complaint intake); deliberately unbranded default-Appian look so capitalization, not styling, is the lesson.
- **Top 3 user tasks (ranked)**: 1. Describe the complaint (summary, date). 2. Express sentiment about the org's handling. 3. Attach supporting documents and submit.
- **Implied requirements**: "Form update notice must be seen before filling"; "Support filing on behalf of someone else"; "Capture structured sentiment (5-point scale)"; "Accept multiple document types with guidance"; "Every text element must model correct case."
- **Data model sketch**: Complaint(onBehalfOf bool, summary text, dateOfIncident date, sentiment enum{Very upset, Upset, Neutral, Delighted, Very delighted}, documents[] files).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
FORM "File a Complaint"
├─ BOX(info banner, bg #ecf4ff est.) icon + "Notice of Update" bold + sentence body
├─ SECTION "Complaint Details" (#1d659c est.)
│  ├─ checkbox "I am filing this complaint on behalf of someone else"
│  ├─ Summary (empty text box)
│  └─ Date of Incident (placeholder mm/dd/yyyy italic)
├─ SECTION "Additional Information"
│  ├─ radio group: question label + 5 options (Neutral selected)
│  └─ Supplemental Documents: UPLOAD outline button + dashed dropzone "Drop files here" + gray helper line
└─ divider → CANCEL (outline, far left) | FILE COMPLAINT (solid, far right)
```
Annotation layer: arrows + labels — blue #71affd (est.) "Title Case" ×4 (page title, banner heading, both section headers, short field label "Date of Incident"); green #6cb65a (est.) "Sentence Case" ×4 (banner body, checkbox label, long question label + choices, upload helper text).
- **Above the fold**: entire form (single screen).
- **Reading order**: single-column, top-to-bottom.
- **Hierarchy rationale**: title LARGE first; banner interrupts before inputs (update notice must precede data entry); primary action isolated bottom-right per form convention.
- **Density**: 2 — editorial: one column, 6 inputs, generous STANDARD-to-MORE vertical gaps.
- **Ratios & spacing**: single column; inputs ≈85% content width; button row split to opposite edges; section gaps ≈`marginBelow: "STANDARD"`.

### Styling specifics (OBSERVED)
- **Palette**: page #ffffff; banner #ecf4ff (est.) with near-black icon disc; accent #1d659c (est.) — section labels, selected radio, both buttons; text #222222 (est.); helper/placeholder gray ≈#6b6b6b (est.); annotations #71affd / #6cb65a (est.).
- **Color application points**: section headers; primary button fill; secondary button border+text; selected radio dot; required-free labels stay black. Annotation colors deliberately distinct from UI accent.
- **Typography moves**: page title ≈LARGE bold dark; section headers ≈MEDIUM #1d659c; field labels STANDARD bold; body/choices STANDARD; helper SMALL gray; buttons all-caps. Case IS the content: title case for title/sections/short labels, sentence case for messages, choices, helper, and the long question label ("How do you feel about the organization's handling of the incident?" — kept sentence case because trimming failed, per page text).
- **Imagery stance**: none — one info glyph.
- **Card treatment**: banner box only; form otherwise flat.
- **Signature moves**: instead of prose rules alone, one form where every text element is a live specimen of its case rule; instead of highlighting one field, blue/green arrow taxonomy classifies all eight specimens; the long-label exception is demonstrated, not just stated.

### Component inventory (OBSERVED → inferred SAIL)
- a!formLayout(titleBar:"File a Complaint", buttons: a!buttonLayout(primary: FILE COMPLAINT style "SOLID", secondary: CANCEL "OUTLINE")); a!messageBanner/a!cardLayout(style:"INFO") banner; a!sectionLayout ×2; a!checkboxField (single choice); a!paragraphField "Summary"; a!dateField (mm/dd/yyyy placeholder); a!radioButtonField(choiceLayout:"COMPACT" — 5 inline choices); a!fileUploadField(buttonDisplay + drop target, instructions below).
- Charts: none. Affordances: checkbox, radios, upload, two buttons.

### Character & judgment
- **Register**: calm-clinical + institutional — default palette, zero decoration, complaint-intake sobriety.
- **Why it works**: annotations classify every visible string, so the rule set is exhaustively illustrated in one screen; blue/green labels can't be confused with the UI's own #1d659c accent because they're lighter and italic-free floats; selected "Neutral" radio quietly models a sensible default.
- **Why not boring**: as a UI it IS intentionally boring (canonical default form); the craft is pedagogical — 8 specimens, 2 case categories, 1 explicit exception (long question label) all coexisting naturally.
- **Boring twin**: a rules table ("Element | Case") with no rendered example — or a form screenshot with a caption and no per-element annotation.
- **What to steal**: banner-before-inputs for form-change notices; sentence-case escape hatch for untrimmable labels; CANCEL/SUBMIT at opposite edges of the footer.
- **Risks**: annotation blue #71affd on white ≈2.3:1 (est.) — fine for a figure, never for UI text; 5-wide inline radio row will wrap awkwardly on phone; dashed dropzone plus button duplicates affordance for screen-reader users.

### Code cross-check
- none (no SAIL source on this page).

## actionFormTitles_do.png + actionFormTitles_dont.png

### Principle: Title forms with instance data, concisely
- **DO shows**: form title "Approve Nora Smith's Promotion to VP" — gray #666666 (est.) LARGE title carrying who + what in six words.
- **DON'T shows**: both failure poles — generic "Approve Promotion" (which instance?) and two-line "Approve Nora Smith's Promotion from Manager to Vice President Scheduled for Next Quarter".
- **Rule**: put identifying data in action/task titles, trimmed to one line, and match the task-list entry exactly.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: a!formLayout(titleBar:) built by expression, e.g. `"Approve " & rv!employee.name & "'s Promotion to " & rv!newTitle` — same expression feeds the task display name so list and form agree.

## dateTimeFormat_do.png + dateTimeFormat_dont.png

### Principle: Show times in the user's timezone, unannotated
- **DO shows**: read-only pair "Time Activated 8/20/2015 3:20 PM" — bold side-by-side label, bare local timestamp.
- **DON'T shows**: two clutter variants — value suffixed "GMT +00:00", and a helper sentence below ("The timezone for the above date and time is GMT.") gray #6b6b6b (est.).
- **Rule**: render datetimes in the viewer's configured timezone so no zone suffix or explanatory footnote is needed.
- **Severity**: contextual
- **Category**: data-display
- **SAIL implication**: rely on user timezone rendering of datetime values (a!dateTimeDisplayField / text(value,"M/d/yyyy h:mm a")); omit zone strings and `instructions` on read-only fields.

## listViewItems_do.png + listViewItems_dont.png

### Principle: Concise titles; descriptions add, don't restate
- **DO shows**: list item — multicolor bar-chart icon, title link "Customer Scorecard" #1d659c (est.), description "Consolidated data on all active customers".
- **DON'T shows**: identical item whose description opens "A report that consolidates all data on active customers" — spends its first four words restating the object type.
- **Rule**: keep titles self-explanatory; if a description is needed, it must carry only information the title and type don't already convey.
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: list-view/record item title + description templates: description text authored without "A report/record/action that…" prefixes; drop the description entirely when redundant.

## numberFormat_do.png + numberFormat_dont.png

### Principle: Group digits, fix precision, keep it consistent
- **DO shows**: right-aligned label/value column — Seconds Active 1,670.60 · Total Cost $236.90 · Average Cost $200.00; thousands separators, uniform 2-decimal precision even for ".00".
- **DON'T shows**: same fields with Seconds Active 1,670.57833 (5 decimals of false precision) and Average Cost $200 (dropped decimals) beside $236.90 — three formats in three rows.
- **Rule**: use digit group separators (except IDs) and one purpose-appropriate precision applied to every value in the set.
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: format via text() masks — `text(value,"#,##0.00")`, `dollar()` — chosen once per field group, not per value.

## period_usage.png

### Principle: Punctuate only multi-sentence text (solo DO)
- **DO shows**: two link-list items (dark-blue #35527d est. cabinet icons, blue title links): "Appian Software" description = two sentences, both period-terminated; "Resource Library" description = one sentence, no terminal period.
- **DON'T shows**: none provided — the single image contains both cases of the rule.
- **Rule**: single-sentence instructions/descriptions take no ending period; once a second sentence appears, every sentence gets terminal punctuation.
- **Severity**: always
- **Category**: labeling
- **SAIL implication**: applies to authored strings in `instructions`, descriptions, and helper text (e.g., a!textField(instructions:"…") with no trailing period when one sentence).

## readOnlyFormat_do.png + readOnlyFormat_dont.png

### Principle: Strip input affordances from read-only output
- **DO shows**: clean side-by-side pairs — Requestor "Mike Moss", Priority "2 - High" as plain text.
- **DON'T shows**: same data wearing input dress: blue #1d659c (est.) required asterisk on "Requestor", Priority in a disabled dropdown (#f0f0f0 fill, #777777 text, caret) with instruction "Select low priority if unsure" beneath.
- **Rule**: required markers, instructions, and disabled input chrome exist to assist entry — never render them on display-only views; show selected values as text.
- **Severity**: always
- **Category**: forms
- **SAIL implication**: a!textField(readOnly:true) instead of a!dropdownField(disabled:true); set required:false and instructions:null in read-only contexts.
