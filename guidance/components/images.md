# Images (a!imageField)

Displays photos, logos, and illustrations — use it when the picture IS content (people, products, evidence, brand art). NOT for identifying options or controls: one simple `a!richTextIcon` glyph per option beats any photograph (icons_do: three link cards, each a single solid-blue #2c6ba5 est. glyph over a matching label). No SAIL source exists on the docs page, so param names below are inferred from the a!imageField API and all hexes are pixel estimates.

## Variants
- **STANDARD** (default style) — preserves the natural aspect ratio; never distorted, never cropped. Use for photos, logos, document previews.
- **AVATAR** style — circular center-crop; portions outside the circle are lost, and every avatar at a given size renders at exactly the same on-screen diameter (small sources are stretched to fill). Use for people; avoid when image edges carry meaning (logos, documents, landscapes).
- **Sizes** `ICON | TINY | SMALL | MEDIUM | LARGE | FIT` — for STANDARD style these are max height/width CAPS, not frames: sub-cap sources are never stretched (avoids blur), so two SMALL images with different aspect ratios render at different box sizes. FIT spans the full container width.
- **GALLERY** size — uniform height across adjacent images so a group lines up as one strip; widths vary with each source's aspect ratio; very wide sources render shorter to constrain overall size.

Default choice: STANDARD at SMALL/MEDIUM. Switch to AVATAR for people, GALLERY for aligned collections.

## Styling hooks
- `style` and `size` are the appearance params; the AVATAR circle mask is not configurable.
- Source format is a styling decision: SVG (or uncompressed PNG) for icons, logos, and simple shapes — crisp at any display size; JPEG for detailed photos (compression pays for itself). Never upscale a low-res raster into a LARGE/FIT slot — the image_quality figure shows blurred, halo-antialiased letterforms next to the razor-crisp SVG twin.
- Size choice trades density for recognizability: too large wastes space and crowds controls; too small makes logos and faces unreadable.

## Idioms
1. People directory (avatar_image_style): a [grid](grids.md) with a narrow unlabeled image column of `style: "AVATAR"` (≈SMALL) beside a link-styled Name column and plain Title — faces make rows instantly recognizable; keep a column header for screen readers even on the icon-only column.
2. Evidence strip (gallery_size_image): adjacent GALLERY-size images form one evenly aligned row with tight gaps — attachment galleries, photo evidence, product shots.
3. Option cards (icons_do): `a!cardLayout(link: ...)` containing a LARGE single-accent `a!richTextIcon` + text label — NOT `a!imageField` photos inside the cards. In the DON'T twin, varied lighting and faces pull the eye into the pictures and the options read as content instead of controls.

## Top don't
No stock photography (stock_photography_dont): a staged business photo — suits, calculator, lens flare — behind a request record's billboard says nothing about the data, competes with the overlay fields for attention, and erodes user trust. Use photos of actual employees or customers (with permission) or drop the image; the structure itself (billboard + bottom `a!barOverlay` carrying icon+label fields) is fine to keep.
