# Buttons (a!buttonWidget)

Action trigger. Default recipe: style:"OUTLINE", accent color, size:"STANDARD", minimize width, squared shape, uppercase label — every other variant is a deliberate escalation (SOLID, LARGE), demotion (SECONDARY, LINK), or semantic signal (NEGATIVE). Label with a verb ("Approve", not "Submit"; "Next"/"Continue" in wizards); never rely on style/color alone for meaning. For stacked record actions, don't hand-build button lists — a!recordActionField(style:"SIDEBAR") formats them automatically.

## Variants

- **style** — "OUTLINE" (default): accent border+text, white fill. "SOLID": accent fill, white text — the ONE most common action per interface. "GHOST": rests identical to outline, fills solid on focus — key action where solid is too disruptive; pair with NEGATIVE to emphasize a destructive action. "LINK": bare text — demotion tool, ≤1 per group or nothing reads as the submit action.
- **color** — "ACCENT" default (site-branded; recurring corpus hex #2e6da3 (est.)). "SECONDARY": gray (text #6d6d6d, border #c9c9c9, est.) — inline body actions, grid toolbars, neighbors of a destructive action. "NEGATIVE": red #d03a4b (est.) — loss of persisted data ONLY, never reset/cancel of unsaved input. ≤1 custom color per interface.
- **size** — "SMALL": toolbars; matches text-box height beside inputs in sideBySide/columns. "STANDARD" (default). "LARGE": the lone page CTA (the 3-field "SIGN UP" landing form, buttons_largeSize_do.png). Mobile renders one size only.
- **width** — "MINIMIZE" (desktop default): hugs the label; compact segmented filter rows (minimizeButtonWidth.gif). "FILL" (mobile default): fills container; required for stacked lists with unequal labels — MINIMIZE there leaves a ragged, accidental-looking edge.
- **Shape & capitalization** — Squared (default) / Semi-rounded / Rounded (full pill) and the uppercase-label toggle live in site/portal Branding, not per-button params; keep casing consistent across the whole site.

## Styling hooks

- `style`, `color`, `size`, `width` as above. Emphasis comes from style — one `size` and one `width` per button group, always (a taller LARGE beside a STANDARD reads as broken, and area falsely signals importance).
- `loadingIndicator: true` on buttons firing integrations, large writes, slow queries — label swaps to a spinner on a disabled fill, preventing double-clicks.
- `disabled`: state-dependent buttons disable, don't hide (stable position, discoverable — button_availability.png greys "REQUEST 360 FEEDBACK" at #b9b9b9 text / #f5f5f5 fill, est.); hide only when many buttons toggle at once.
- Icons: optional, positioned at label start; at the end only for forward navigation (wizard "Next"); icon-only buttons need accessibility text.
- Record-action shortcuts: concise verb-phrase titles (elaboration goes in description) and ≤3 shortcuts, or labels truncate mid-word ("UPDATE MY PERSONAL INFORMA...").
- No per-button hex in the corpus: color is the semantic enum; the accent hue itself comes from site/portal Branding.

## Idioms

1. Three-tier form footer (buttons_linkStyle.png + button_position.png):
```
a!formLayout(buttons: a!buttonLayout(
  primaryButtons: {  /* renders right; most-used first, solid */
    a!buttonWidget(label: "SAVE & PUBLISH", style: "SOLID"),
    a!buttonWidget(label: "SAVE DRAFT", style: "OUTLINE") },
  secondaryButtons: {  /* renders left; back outermost */
    a!buttonWidget(label: "GO BACK", style: "OUTLINE"),
    a!buttonWidget(label: "CANCEL", style: "LINK") }))
```
Footer = whole-form submit/exit ONLY; content actions (PREVIEW FORM, ADD ITEM) go inline in the body as SECONDARY (buttons_location_do.png).
2. Grid toolbar (buttons_gridToolbar.png): a!buttonArrayLayout of a!buttonWidget(size:"SMALL", color:"SECONDARY", style:"OUTLINE") directly above a!gridField(selectable:true), with disabled: not(<selection test>) — gray+small keeps bulk actions from impersonating form submission.
3. Destructive confirm (buttons_secondary_do.png, "Delete Photo?"): a!buttonWidget(label:"DELETE", color:"NEGATIVE", style:"OUTLINE") + a!buttonWidget(label:"CANCEL", color:"SECONDARY") — the neighbor goes gray so red #d03a4b (est.) is the only saturated hue on screen.

## Top don't

Never show more than one SOLID button per interface, and never put SOLID on cancel/delete (severity: always). The corpus DON'T (primary_buttons.png) stacks two solid SAVE DRAFT + SUBMIT — competing calls to action — and a solid CANCEL beside an outline SUBMIT, where the abandon action outshouts submission. Users are biased toward clicking the solid button; a misplaced solid steers them into abandoning or mis-submitting the form.
