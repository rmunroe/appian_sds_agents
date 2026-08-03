# Analysis: ux-progressive-disclosure

No SAIL source on page; hexes pixel-estimated. Cross-ref: filterControls_do.png ("Show advanced options" link pattern, "disclose based on user action" section) is analyzed under its primary page, not here.

## Component: Progressive disclosure patterns — progressiveDisclosure_do.png, progressive_disable_sequence.png (tier B)

Official vocabulary from page: disclose on **user selection**; disclose on **user action** ("Show advanced options"); **sequential flow** → disable, don't hide.

### progressiveDisclosure_do.png
- **Produces it**: showWhen on dependent fields bound to a checkbox — before/after composite: unchecked "Expire passwords" shows only heading + checkbox; checked state reveals "Maximum Password Age" input (with instruction line) plus side-by-side checkboxes "Warn users before password expiration" and "Expire temporary passwords".
- **Looks like**: blue #1a6b9f (est.) section heading; green dashed boxes + connector are docs annotations.
- **Use when**: fields matter only after an opt-in selection. | **Avoid when**: fields are steps of a known sequence.
- **Styling hooks**: showWhen; instructions text.
- **Marker**: do

### progressive_disable_sequence.png
- **Produces it**: a!dropdownField(disabled: true) on "Model" until "Year" and "Make" hold values — Year shows "2017", Make shows placeholder "--- Select Vehicle Make ---" enabled, Model sits inert.
- **Looks like**: three stacked labeled dropdowns; disabled Model has gray fill #e4e4e4 (est.), gray italic placeholder; enabled ones white with 1px #cfcfcf (est.) border.
- **Use when**: dependent choices in a fixed, known sequence — keep the flow's full shape visible. | **Avoid when**: content is optional/conditional (hide instead).
- **Styling hooks**: disabled; placeholderLabel.
- **Marker**: neutral (illustrates the page's DO: disable, don't hide)

### Page rollup
Default: hide via showWhen for conditional or opt-in content (simpler first paint); switch to disabled-but-visible the moment fields form a sequential flow, so users can preview all steps ahead.
