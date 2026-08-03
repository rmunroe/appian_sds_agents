# Billboard Layout (a!billboardLayout)

Overlays content on a decorative background color, photo, or video — hero headers, record identity strips, branded landing zones. NOT for images/diagrams users must inspect: fixed heights crop them and overlays obscure them — use a!imageField (or a video component) shown whole. Corpus default: fixed height (SHORT–MEDIUM) + SEMI_DARK bar overlay + marginBelow "STANDARD" for in-app record headers; reserve AUTO height + full DARK overlay for marketing heroes where the whole photo is the message.

## Variants

Overlay styles (all overlay types): "DARK" / "SEMI_DARK" / "LIGHT" / "SEMI_LIGHT" / "NONE".

- **Bar overlay** (a!barOverlay, position "BOTTOM"/"CENTER"): one horizontal scrim strip, photo visible above/below. Use for uniform one-liners — the real-estate hero carries "24450 Country Club Dr" + Price/Sq. Ft./Beds/Baths pairs in a bottom SEMI_DARK bar. Avoid for multi-line text: bars grow with content, so sibling billboards get misaligned stripes.
- **Full overlay** (a!fullOverlay, alignVertical e.g. "TOP"): even scrim over all media. Use when overlay content covers most of the background — the three comms billboards ("When are we moving?" etc.) read as tidy equal rectangles with full DARK; keep sibling billboards' overlay type and height identical.
- **Column overlay** (at "START"): vertical scrim block owning the left third, media visible right. Use when the header must stay short but text stacks vertically (hotel logo + title, overview_billboard_styles.png).
- **Height AUTO**: whole background visible; height grows with width (careers hero ≈85% of landscape viewport). **Fixed heights** "EXTRA_SHORT"/"SHORT"/"SHORT_PLUS"/"MEDIUM"/"MEDIUM_PLUS"/"TALL"/"TALL_PLUS"/"EXTRA_TALL": identical height on every screen, media auto-cropped (student profile header stays ≈1/3 viewport in both orientations).

## Styling hooks

- `height`: AUTO vs fixed ladder. AUTO risk: on wide screens the hero grows past the fold and hides all content (OBSERVED in the careers demo).
- `overlay`: a!fullOverlay / a!barOverlay + style values above. "NONE" (transparent) only when background contrast is known-sufficient.
- Automatic text color: DARK/SEMI_DARK flip standard text white; LIGHT/SEMI_LIGHT flip it dark gray; "NONE" derives from the background color (light → dark gray, dark → white), even when media is set. Pair Light styles with light media, Dark with dark; busy high-contrast media is hardest to keep legible.
- `backgroundMedia` (e.g. a!webImage) + `backgroundColor`: the color shows before media loads — a "#f0f0f0" placeholder is CODE-VERIFIED in the listing-card example. Keep files small; bandwidth-constrained users otherwise see an empty band.
- Background media position (horizontal + vertical, e.g. "LEFT"+"TOP"): decides what survives a fixed-height crop — keep the logo corner or shoreline visible.
- `marginBelow`: NONE…STANDARD…MORE ladder; "STANDARD" before following content (overview_section_spacing.png); "NONE" when nesting inside a padding-NONE card.
- Hexes go only in `backgroundColor` and overlay contents (tags, richText); scrims are fixed styles, not hex-tunable.

## Idioms

1. Record identity strip (billboard_fixed_height.png, student profile):
```
a!billboardLayout(height: "SHORT_PLUS", backgroundMedia: campus photo,
  overlay: a!barOverlay(position: "CENTER", overlayStyle: "SEMI_DARK",
    contents: [circle avatar | "Belinda Ana GUZMAN" ≈LARGE | Major·Year·Campus icon+label+value ×3]))
```
A fixed-height bar replaces a gray toolbar: identity + three facts in one glance, chrome identical on every device.
2. Marketing hero (billboard_auto_height.png, careers): height:"AUTO" + a!fullOverlay(style dark) + one centered all-caps ≈EXTRA_LARGE word ("CAREERS"). AUTO keeps the whole photo; the dark scrim guarantees white-type legibility anywhere the title sits.
3. Card media zone (CODE-VERIFIED, card_nested.png): inside a!cardLayout(padding:"NONE") — a!billboardLayout(height:"SHORT_PLUS", marginBelow:"NONE", backgroundColor:"#f0f0f0", overlay: a!fullOverlay(alignVertical:"TOP", style:"NONE", contents: a!tagItem("NEW LISTING", backgroundColor:"#ff9900"))). See [card-layout](card-layout.md).

## Top don't

Never use a billboard for informational images or videos users need to review (severity: always). The corpus DON'T puts a network-architecture diagram behind a billboard: the fixed height crops its edges and legend, and the title-bar scrim blanks the middle band of nodes — the artifact users came to inspect is illegible. Billboard media is purely decorative; informational graphics get a!imageField, whole, uncropped, no overlay.
