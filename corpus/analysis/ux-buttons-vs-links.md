# Analysis: ux-buttons-vs-links

Component: button-vs-link choice (page: ux-buttons-vs-links). Official vocabulary (from page): **buttons = actions, links = navigation**, with two sanctioned exceptions — form-footer buttons for *submission / cancellation / stepping back*, and links for *localized actions*.

## ux_buttons_vs_links.png

Tier override: batch suggests A (1071x573), but this is an annotated teaching graphic — two UI crops with hand-drawn orange callout circles, not a full page → tier B per protocol rule 4.

- **Produces it**: a!buttonWidget(label:"BUY NOW", style:"OUTLINE") for the action; a plain blue link for "www.appian.com".
- **Looks like**: two crops with orange #f47b20 (est.) callout ellipses — checkbox "Add trip protection insurance for only $99" beside an outlined all-caps BUY NOW button (blue #20629b est. border+label); label/value list whose Website value is a blue link.
- **Use when**: mutates state / commits purchase → button. | **Avoid when**: mere navigation dressed as a button.
- **Styling hooks**: buttonWidget style/size; link color fixed.
- **Hexes**: n/a — semantics, not color, is the dimension.
- **Marker**: neutral

## link_vs_button_2.png

Tier override: batch suggests A (1660x524), but this is a form-footer crop with the fields above intentionally faded (~35% opacity State/ZIP inputs) to spotlight the buttons → tier B per protocol rule 4.

- **Produces it**: a!buttonLayout — primary: CONTINUE a!buttonWidget(style:"SOLID", submit:true) + CANCEL (style:"LINK", validate:false); secondary: GO BACK (style:"OUTLINE").
- **Looks like**: footer under a hairline divider — outlined amber #f0a000 (est.) GO BACK far left; bare-text CANCEL beside solid amber #f5a300 (est.) CONTINUE (white all-caps) far right.
- **Use when**: submit / cancel / step back — buttons despite the navigation result (the page's exception). | **Avoid when**: mid-form navigation that neither submits nor discards.
- **Styling hooks**: SOLID/OUTLINE/LINK encodes primacy; left/right placement encodes direction.
- **Marker**: neutral

## ux_buttons_links.png

- **Produces it**: "Clear Filters" as a rich-text a!dynamicLink; SEARCH stays a!buttonWidget(style:"OUTLINE").
- **Looks like**: "Support Cases" list header — EXTRA_LARGE title, search box + outlined SEARCH button, filter dropdowns ("OPEN/CLOSED | Open" with blue clear-⊗); top-right blue #2b6cb5 (est.) dashed-underline "Clear Filters" link in an orange callout circle.
- **Use when**: localized low-stakes actions where a button would out-shout real actions. | **Avoid when**: primary actions — SEARCH remains a button one control away.
- **Styling hooks**: rich-text link color/underline.
- **Marker**: neutral

### Page rollup
Default rule: writes data or advances a process → a!buttonWidget; changes location → link. The two exceptions are directional — form footers promote navigation-ish acts (submit/cancel/back) up to buttons, while trivial localized actions demote down to links; prominence tracks consequence, not mechanism.
