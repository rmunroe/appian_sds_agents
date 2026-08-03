# Analysis batch 49

You are an expert UI/UX analyst reverse-engineering the Appian SAIL Design System example images.
Work from repo root: /home/robert/Development/appian_sds_agents

## Protocol (follow exactly)
1. Read `pipeline/templates/CONVENTIONS.md` — vocabulary, evidence marks, skeleton notation, density scale.
2. Read the template(s) you need: `pipeline/templates/tier-a-template.md` for tier A,
   `pipeline/templates/tier-bcg-template.md` for tiers B, C, and GIF.
3. For EACH page below: read its page text, then Read each image listed (they are real image files —
   look at them carefully), then write ONE analysis file per page at the given path.
4. The `tier` column is a suggestion from dimensions/markers. Override with judgment: a full-page UI
   screenshot = tier A even if smaller; a cropped fragment = tier B even if large. Say when you override.
5. For GIFs: Read the extracted frame PNGs listed (corpus/images/frames/...), not the .gif itself.
6. Group tier-C images into DO/DON'T pairs when they are siblings under the same heading.
7. Evidence discipline: OBSERVED / INFERRED / CODE-VERIFIED marks as per conventions. Hexes for every
   color claim (est. suffix when pixel-guessed). No vague adjectives without the concrete choice.
8. Word budgets: tier A ≤1000 words/image; tier B ≤60 words/variant; tier C ≤120 words/pair; GIF ≤120 words.
9. Structure each analysis file: `# Analysis: <page>` then one `## <image-filename>` section per analyzed
   image (or per DO/DON'T pair, or per GIF interaction), using the tier template fields.
10. Your final message: just list the analysis files written and any images you skipped with reasons.


### Page: `forms` (section: patterns)
- Page text: `corpus/pages/forms.md` — READ IT FIRST for context.
- Write your analysis to: `corpus/analysis/forms.md`

| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |
|---|---|---|---|---|---|
| approval-form.png | 758x962 | B | neutral |  | Review and approve form |
| auto_insurance_quote_wizard_about_you.png | 3420x1740 | A | neutral | Example of an insurance quote form step that asks for user i | Creating a custom wizard |
| auto_insurance_quote_wizard_bundled_savings.png | 3420x1740 | A | neutral |  | Creating a custom wizard |
| auto_insurance_quote_wizard_confirmation.png | 3420x1902 | A | neutral |  | Review page |
| form_submission_confirmation.png | 932x506 | B | neutral |  | Confirmation page |
| forms-dialog-company-event.png | 1436x1740 | A | neutral | Example of a form dialog with fields that collect informatio | Single-step form |
| forms-donation.png | 2426x1276 | A | neutral | Example of a donation form allowing user to select the amoun | Creating a custom wizard |
| forms-sidebar-for-contact-information-and-faqs.png | 1581x967 | A | neutral |  | Sidebar for contact information and FAQs |
| forms-sidebar-for-contextual-information-simple.png | 1999x1089 | A | neutral |  | Sidebar for contextual information (simple) |
| forms-sidebar-for-decoration.png | 1999x1089 | A | neutral |  | Sidebar for decoration |
| forms-sidebar-for-eligibility-information.png | 1999x1135 | A | neutral |  | Sidebar for eligibility information |
| forms-sidebar-with-contextual-form-pane.png | 1999x973 | A | neutral |  | Sidebar with contextual form pane |
| image35.png | 1367x1182 | A | neutral |  | Multi-step form: Single page |
| image51.png | 1207x811 | A | neutral |  | Using the wizard layout |
| image60.png | 1999x1250 | A | neutral |  | Creating a custom wizard |
| wizard-sidebar-step-indicator-simple.png | 1012x679 | A | neutral |  | Creating a custom wizard |

Also on this page but analyzed under their primary page (just note cross-refs if relevant): ESG_conference_registration_portal.png
