# Analysis: ux-images

Source page: `corpus/pages/ux-images.md` (section: components) — image styles, sizes, quality, stock photography, images vs. icons. No SAIL source on this page, so all component params are INFERRED from the a!imageField API and every hex is a pixel estimate.

**Tier overrides**: `standard_image_style.png`, `avatar_image_style.png`, `avatar_image_style2.png`, and `image_quality.png` were suggested tier A by dimensions, but all four are cropped component/principle illustrations rather than full-page UI screenshots → analyzed as tier B per protocol rule 4.

## standard_image_style.png

Tier B (overridden from A: labeled variant strip, not a full-page UI). Marker: neutral. Heading: Styles (the image itself demonstrates the size ladder applied to Standard style).

- **Produces it**: a!imageField(style: "STANDARD", size: "ICON"|"TINY"|"SMALL"|"MEDIUM"|"LARGE"|"FIT") — INFERRED
- **Looks like**: one wide mountain-lake panorama repeated under six bold labels (Icon, Tiny, Small, Medium, Large, Fit) OBSERVED; aspect ratio is identical at every size — never distorted or cropped; FIT spans the full container width, dwarfing the rest
- **Use when**: photos, logos, or icons must keep their natural proportions | **Avoid when**: a group must align to uniform tiles (use GALLERY) or you want circular people photos (AVATAR)
- **Styling hooks**: `size`; STANDARD is the default style
- **Pairs well with**: hero/billboard imagery, logo display, document previews
- **Hexes**: none — color is not the variant dimension

## avatar_image_style.png

Tier B (overridden from A: cropped grid fragment — bottom row is cut off, not a full page). Marker: neutral. Heading: Styles.

- **Produces it**: a!gridField with a narrow unlabeled image column of a!imageField(style: "AVATAR", size ≈ "SMALL") beside link-styled Name and plain Title columns — INFERRED
- **Looks like**: 3-column people directory (avatar | Name | Title), 4 rows visible OBSERVED; circular headshots with a thin light ring; names as blue links #2d6da8 (est.); subtle zebra rows #f8f8f8 (est.) and light gridlines #e0e0e0 (est.)
- **Use when**: people lists need instant face recognition next to identity data | **Avoid when**: row subjects are not people/faces
- **Styling hooks**: style: "AVATAR", `size`, grid column width
- **Pairs well with**: read-only grids, comment feeds, record headers
- **Hexes**: not the variant dimension (incidental estimates above)

## avatar_image_style2.png

Tier B (overridden from A: labeled variant strip, not a UI). Marker: neutral. Heading: Styles.

- **Produces it**: a!imageField(style: "AVATAR", size: "ICON"|"TINY"|"SMALL"|"MEDIUM"|"LARGE") — INFERRED
- **Looks like**: a portrait "Original" tiger photo, then five circles of fixed increasing diameter (Icon → Large) OBSERVED; each circle is the same center-square crop of the portrait source — top/bottom lost, face preserved; the Large circle shows a faint #d9d9d9 (est.) ring. Per page text, every avatar at a given size renders at exactly the same on-screen diameter (small sources are stretched to fill)
- **Use when**: profile imagery must be uniform regardless of source aspect ratio | **Avoid when**: image edges carry meaning (logos, documents, landscapes)
- **Styling hooks**: `size` only; the circular mask is not configurable
- **Pairs well with**: user cards, people grids, activity feeds
- **Hexes**: none — color is not the variant dimension

## gallery_size_image.png

Tier B. Marker: neutral. Heading: Sizes.

- **Produces it**: multiple adjacent a!imageField(size: "GALLERY") images — INFERRED
- **Looks like**: six wildlife photos in one row at identical height OBSERVED; widths vary with each source's aspect ratio (portrait crops narrow, landscapes wide); tight even gaps, no borders or captions — reads as one aligned strip
- **Use when**: grouped photo collections must line up evenly | **Avoid when**: showing a single image, or when uniform width matters more than uniform height
- **Styling hooks**: size: "GALLERY"; very wide sources render shorter to constrain overall size (page text)
- **Pairs well with**: attachment galleries, photo-evidence rows, product shots
- **Hexes**: none — color is not the variant dimension

## image_size.png

Tier B. Marker: neutral. Heading: Sizes.

- **Produces it**: two a!imageField(size: "SMALL") images with different source aspect ratios — INFERRED
- **Looks like**: a landscape fox photo renders as a short wide box; a portrait fox renders taller and visually larger OBSERVED — same size setting, different on-screen boxes
- **Use when**: reasoning about sizes as max-height/width caps, not fixed frames; sub-cap images are never stretched, avoiding blurriness (page text)
- **Avoid when**: the layout needs identical tiles — reach for GALLERY (uniform height) or AVATAR (uniform circle) instead
- **Styling hooks**: the size ladder ICON → FIT
- **Pairs well with**: mixed-source content imagery in cards and records
- **Hexes**: none — color is not the variant dimension

## image_quality.png

Tier B (overridden from A: split-frame asset-quality illustration, not a UI). Marker: neutral — but the halves read as an implicit DO (left) / DON'T (right).

- **Produces it**: a!imageField rendering an SVG source document (left) vs. a low-resolution PNG/JPG upscaled to the same display size (right) — INFERRED
- **Looks like**: one "appian" wordmark in brand blue #3a0ce5 (est.) split by a vertical gray bar #6e6e6e (est.); left letterforms are razor-crisp vector edges, right letterforms are visibly blurred and halo-antialiased OBSERVED
- **Use when**: icons, logos, simple shapes → SVG (or uncompressed PNG); detailed photos → JPEG for compression (page text)
- **Avoid when**: never upscale low-res rasters into LARGE/FIT slots
- **Styling hooks**: source file format × display `size` interaction
- **Pairs well with**: logo headers, billboard backgrounds, site branding
- **Hexes**: #3a0ce5 (est.) logo, #6e6e6e (est.) divider

## icons_do.png + icons_dont.png (DO/DON'T pair)

### Principle: Identify options with icons, not photos
- **DO shows**: three equal link cards (white bg, thin #d9d9d9 (est.) border, generous centered padding), each a single solid-blue glyph #2c6ba5 (est.) — grad cap, people, book — above a matching blue label OBSERVED; one shape + one color per option makes differentiation instant
- **DON'T shows**: the same three cards with rectangular stock photos above the labels OBSERVED; varied lighting, faces, and detail pull the eye into the pictures, and options read as content instead of controls
- **Rule**: for navigation/selection controls, one simple same-style glyph per option beats any photograph
- **Severity**: usually
- **Category**: labeling
- **SAIL implication**: a!cardLayout(link: …) containing a!richTextIcon (single accent color, LARGE) + a text label, instead of a!imageField photos inside the cards — INFERRED

## stock_photography_dont.png (unpaired DON'T)

### Principle: Use authentic photos, not stock
No DO sibling image under this heading; the page text supplies the DO — photos of actual employees or customers, with permission.

- **DON'T shows**: a record billboard header whose background is a staged business stock photo (suits, calculator, pen-on-chart, lens flare) OBSERVED; a bottom translucent dark bar #1f2d38 (est.) carries five icon + bold-label/value fields in white (Request Type: Information Request · Initiated By: Elizabeth Ward · Initiated On: 01/12/2020 · Due On: 02/24/2020 · Status: In Progress). The photo says nothing about this request and competes with the data for attention
- **Rule**: generic staged photography distracts from page content and erodes user trust; use authentic photos or none
- **Severity**: usually
- **Category**: data-display
- **SAIL implication**: the structure is fine — a!billboardLayout with a!barOverlay(position: "BOTTOM", dark style) INFERRED; swap the background a!documentImage for an authentic photo (or drop the image entirely)

## Page rollup (image component)

Official vocabulary: styles STANDARD | AVATAR; sizes ICON | TINY | SMALL | MEDIUM | LARGE | FIT | GALLERY — INFERRED names from a!imageField, matching the page's labels OBSERVED in the variant strips.

Default choice for most cases is STANDARD style at SMALL/MEDIUM because it never distorts or crops and caps (not stretches) small sources. Switch to AVATAR for people, GALLERY for evenly aligned collections, SVG sources for icons/logos, JPEG for photos — and prefer icons over photos for option controls, authentic photos over stock everywhere else.
