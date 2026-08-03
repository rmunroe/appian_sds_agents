# Side by Side Layout (a!sideBySideLayout / a!sideBySideItem)

Places small related components in one precisely spaced horizontal row (name fields, avatar+name, link clusters). Reach for it for fine-grained arrangement INSIDE a zone; NOT for page structure — large component groups (dashboard bodies) belong to [Columns](columns-layout.md) or [Pane](pane-layout.md) layouts.

## Variants

Per-item `width` — the main dimension (param spellings INFERRED; option names from page text):

- **Automatically distribute (default)** — equal item widths that stay equal as the window resizes. For peer fields of similar importance/length.
- **Set Relative Width** — `width: "3X"/"1X"…` (1X–10X); proportions hold constant on resize. For predictable length differences: First/M.I./Last at 3X/1X/3X, Email/Phone at 2X/1X.
- **Use only as much space as necessary** — `width: "MINIMIZE"`; the item hugs its content, remaining items split the rest evenly. Fixed-width content only: fixed-size images, static text/links, buttons, tags. Never on every item in a layout.

Layout-level params: `spacing` "STANDARD" (default) | "NONE" (adjacent borders touch and fuse) | "DENSE" | "SPARSE" (~48px gutters); `marginAbove`/`marginBelow` "NONE" (default) → "EVEN_MORE" (~90px isolating voids); `alignVertical` "TOP" (default) | "MIDDLE" | "BOTTOM"; `stackWhen` — Never stack (default), Phone only, up through Desktop or narrower, or a custom breakpoint set.

## Styling hooks

- Width assignments encode expected content length — that is the visible design move: M.I. and Phone narrow, Email wide.
- `spacing: "NONE"` is a compositing tool (input + button reading as one segmented control); `"SPARSE"` suits airy low-density rows; both are exceptional, defaults are right for forms.
- `alignVertical: "MIDDLE"` for avatar+name lockups — the docs' Top/Bottom demo shows a single-line name pinned to either edge of a tall avatar reading misaligned.
- Always set `stackWhen: {"PHONE"}` (or wider) on multi-item rows — rows of thirds are unusable at ~400px. Stacked items go full-width, label-above-input, in source order.

## Idioms

1. Name row (Contact Us form): three text inputs in one `a!sideBySideLayout` at 3X/1X/3X — semantically-one-unit fields read as one row, ~16px gutters, labels above thin-bordered inputs.
2. Fixed media + flexible text (professor billboard header): `a!sideBySideItem(a!imageField(style: "AVATAR", size: "LARGE"), width: "MINIMIZE")` + a rich-text item taking all remaining width; shrinking the image to "SMALL" auto-contracts the column with no manual re-layout.
3. Feed row (activity feed DO): avatar, right-aligned timestamp, and short static links Comment / Track Case / Delete (#205b87 est.) all at MINIMIZE, so the event sentence gets every remaining pixel.

## Top don't

Never MINIMIZE an item whose rendered width follows user interaction. The DON'T gif: a minimal-width Symptoms multiselect widens ~5× as selections accumulate, shoving the SUBMIT button around on every click. Dropdowns, pickers, text fields, and "Fit" images keep automatic or relative widths.
