# Tags (a!tagField / a!tagItem)

Small colored chips that flag notable attributes of an item. Reach for one to surface the attribute that changes handling (REFERRAL, NEW, VIP, escalated) at identity level, or for scannable keyword sets on list rows; NOT for actions (buttons), sentence-length information (body text/tooltips), or facts that belong in the detail grid.

## Variants

- **Single saturated flag** — one tag whose color stands out: magenta #A93193 (est.) REFERRAL beside a new hire's name; green #598039 (est.) NEW on a portal link row. Works because each host page is otherwise one-hue — the tag is the only chromatic outlier, unmissable without a banner.
- **Muted multiples** — 2–3+ tags per item in one uniform quiet color; the page's own caption: "Secondary" background color is most often the best choice when displaying multiple tags. Faculty publications carry 12 gray #DCDCDC (est.) chips (#595959 (est.) text, ≈4.9:1) so links and rating stars remain the page's only signal colors.
- **Casing** — mixed-case and ALL-CAPS are both legal; all-caps looks more balanced (every letter the same height). Pick one casing for all tags across the interface.

## Styling hooks

- `a!tagItem(text:, backgroundColor:)` — "SECONDARY" or a hex; text renders white on saturated fills, near-black on the gray chip (params INFERRED; no SAIL on page).
- `size: "SMALL"` observed on dense publication rows (INFERRED).
- Tags never wrap — long text truncates with an ellipsis, so text is a 1–2 word keyword by construction.
- Placement: a side-by-side layout puts the tag beside the item it describes (the Inline Tags pattern); rich text icons can join the same row. Right-aligned tags can wrap under their link at narrow widths — see [Side by Side Layout](side-by-side-layout.md).

## Idioms

1. Identity-level flag (new-hire record): dark #404E64 (est.) banner holds avatar + name + `a!tagField(tags: a!tagItem(text: "REFERRAL", backgroundColor: "#A93193"))` in a side-by-side — the one handling-changing attribute promoted out of a 12-field detail grid, instead of a buried "Referral: Yes" row.
2. Launch announcement (services portal): a NEW tag right-aligned via side-by-side on the "Submit Expense Report" link row — new-feature discoverability with zero layout cost; the page's strict #316598 (est.) monochrome is what makes the single green chip land.
3. Topic chips per row (faculty publications): `a!tagField(size: "SMALL")` with 2–3 SECONDARY tags under each title link (HISTORY / LITERATURE / REVIEW) — classification whispers while links speak.

## Top don't

Tag with keywords, never phrases. The DON'T chips — 'Featured in "Staff Favorites" for Septem…' — truncate mid-word and balloon to sentence width, reading as buttons or messages rather than attributes. Keep `a!tagItem` text to one or two words and move detail to adjacent rich text or the record view; and when many tags show at once, don't mix varied saturated colors — reserve the loud hex for the singular flag.
