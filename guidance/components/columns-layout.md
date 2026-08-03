# Columns Layout (a!columnsLayout / a!columnLayout)

Establishes the primary structure of a page by organizing large component groups into vertical columns. NOT for small precise groupings (avatar + name → a!sideBySideLayout inside a column) and NOT when each column must scroll independently (filter rail beside an unbounded list → pane layout). Never use columns to center form content — a!formLayout contentsWidth does that ([form-layout.md](form-layout.md)).

## Variants (width types, per a!columnLayout)
- **Automatic** — width:"AUTO" (default "Automatically Distribute"): columns split available width evenly and re-distribute on every resize. Use for peer columns of equal importance.
- **Relative** — width:"2X" beside "1X": proportional; the ratio holds at every window size. Best when the window is resized often; verify hierarchy survives narrowing (corpus 2X coverage pane vs 1X discounts kept its composition through a full resize sweep).
- **Fixed** — constant width words regardless of viewport; corpus shows width:"MEDIUM" (≈250px est.) and width:"WIDE"; the neighboring AUTO column absorbs the entire resize delta. Use for control clusters/rails that must keep a constant measure. Never make ALL columns fixed — they won't fit every user's screen.

## Styling hooks
- **stackWhen**: "Phone only" (default) · "Portrait Tablet or narrower" · "Landscape Tablet or narrower" · "Narrow Desktop or narrower" · "Desktop or narrower" · "Never stack" · custom set. Right/later columns drop BELOW left ones, so column order = mobile vertical order — put the must-see-first column leftmost. Any multi-column page reachable from tablet/phone needs a deliberate value.
- **spacing**: "STANDARD" (default) · "NONE" · "DENSE" · "SPARSE" (≈48px est. gutter). NONE only for flush composites — text columns crowd; SPARSE for airy low-density pages.
- **marginAbove / marginBelow**: "NONE" (default) · "EVEN_LESS" · "LESS" · "STANDARD" (≈20px est.) · "MORE" · "EVEN_MORE" (≈64px est.). Shipped defaults suffice for forms/dashboards — section structure already separates; big margins are editorial-page tools that push content toward the fold.
- **alignVertical** (per columns layout): "TOP" (default) · "MIDDLE" · "BOTTOM" — bottom baseline-anchors a short column against a taller neighbor, at the cost of fields dropping below their entry point.

## Idioms
1. **Empty-column centering** (fixauto DO example): cap content width with empty automatic flanks —
   ```
   a!columnsLayout(columns: {
     a!columnLayout(width: "AUTO"),   /* empty */
     /* fixed-width content column(s) */
     a!columnLayout(width: "AUTO")    /* empty */
   })
   ```
   The corpus band holds ≈70% viewport and ~55–60-char lines. Never fill the screen just because space exists.
2. **Fixed rails, AUTO workspace** (autofixedCal example): fixed-width task rail | AUTO calendar | fixed-width actions rail — side tools never reflow; only the center workspace compresses, so it stays the focus.
3. **[2:3] record overview** (INSURECORP account page): short money facts top-left (NEXT PAYMENT card with AUTOPAY tag), long label-dense coverage stacks in the wider right column; inside the left column, a!sideBySideLayout rows (avatar : name + all-caps role kicker : Edit link) — columns for structure, side-by-side for the small stuff.

## Top don't
Making every column fixed width (fullfix DON'T): the layout overflows any screen narrower than the designer's, and edge-to-edge stretching nearly doubles line measure while the band loses its focal center. Keep at least one AUTO column — the content itself or the flanking whitespace.
