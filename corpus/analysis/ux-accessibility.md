# Analysis: ux-accessibility

## accessibility_text.png

Tier override: batch suggests A (1468x652), but this is a cropped Interface Designer screenshot (design-mode canvas + component configuration panel butted together), not an end-user page → analyzed at tier B per protocol rule 4.

- **Produces it**: `accessibilityText: "For mailing address"` on the "Street Address 2" a!textField (parameter exists on most fields/layouts).
- **Looks like**: split designer view. Left: "Mailing Address" form title in blue #20629b (est.), fields Street Address 1/2, City, State ("--- Select …" dropdown), ZIP; "Street Address 2" selected with blue #2276bd (est.) outline and a "Text" component chip (blue bg, white label). Right: config panel — Masked checkbox, Validations ("List of Text" blue link), Validation Group, Alignment ("Default"), and Accessibility Text input holding "For mailing address" with cursor.
- **Use when**: screen-reader users need context sighted users get from proximity — reader announces label + accessibility text: "Street Address 2, For mailing address" (disambiguates Mailing vs Shipping sections).
- **Avoid when**: it merely repeats the visible label or instructions — redundant chatter for AT users.
- **Styling hooks**: none — non-visual parameter; no on-screen rendering.
- **Pairs well with**: duplicate field sets across sections (mailing/shipping, primary/secondary contact); hidden-label fields.
- **Hexes**: n/a — color is designer chrome, not the teaching.
- **Marker**: neutral

## accessible_headers_do.png + accessible_headers_dont.png

### Principle: Build headers from header components, not styled rich text
- **DO shows**: "Student Details" as a real heading (gray #6b6b6b est., ≈LARGE semibold) and "Contact Information" as an a!boxLayout label in a filled #ececec (est.) title bar — structure that screen readers announce and can jump between.
- **DON'T shows**: the same page mimicked with rich text — "Student Details" inflated to ≈EXTRA_LARGE bold gray, "Contact Information" as gray bold ≈MEDIUM_PLUS text floating inside a plain bordered box (no title bar). OBSERVED: to sighted users the two are near-identical — the harm is invisible in pixels; AT users get zero structure, plus sizes drift arbitrarily without the ladder's discipline.
- **Rule**: if text names a content group, it must be a section/box label or heading field with a correct accessibilityHeadingTag (H1–H6 matching actual hierarchy, overriding size-based defaults).
- **Severity**: always
- **Category**: a11y
- **SAIL implication**: a!sectionLayout(label)/a!boxLayout(label)/a!headingField(size, headingTag) — a!headingField exposes the same color/size/weight styling the rich-text mimic was reaching for.
