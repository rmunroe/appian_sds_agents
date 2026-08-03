# Analysis: popular-patterns

Tier override: the batch suggested tier A for `dual_picklist_grids.png` (2498x904) and `dual_picklist_simple.png` (2442x758), but both are cropped component fragments on a bare canvas (no site nav, no page chrome), so they are analyzed as tier B variants of one component. `image84.png` stays tier B as suggested.

## Component: Dual picklist (page: popular-patterns)
Official variant vocabulary (page headings): **simple** · **grids**

### dual_picklist_simple.png
- **Produces it**: `a!checkboxField(choiceStyle:"CARDS", choiceLayout:"STACKED")` in scrolling `a!cardLayout(height:"MEDIUM_PLUS")` ×2; NARROW middle column of `a!buttonWidget(style:"OUTLINE", color:"SECONDARY", width:"FILL")` ×4 (CODE-VERIFIED)
- **Looks like**: two bordered scroll boxes of checkbox cards; chosen cards accent-bordered with filled check (#2D2DE0 est., default accent); bold counts "(17)"/"(3)"; Add/Remove buttons disable when inapplicable
- **Use when**: moderately long single-attribute lists | **Avoid when**: short lists (checkboxes) or huge lists (pickers)
- **Styling hooks**: card `height`; responsive button `icon` via `a!isPageWidth("PHONE")`; disabled logic
- **Pairs well with**: forms assigning scopes (states, roles)
- **Marker**: neutral

### dual_picklist_grids.png
- **Produces it**: `a!gridField(selectable:true, selectionStyle:"ROW_HIGHLIGHT", pageSize:50, height:"MEDIUM")` ×2 with same 4-button middle column (CODE-VERIFIED)
- **Looks like**: two 3-column grids (Name link, Unit Price, Total Units right-aligned); selected rows flood solid accent indigo, white text; "10 items" footer
- **Use when**: large sets needing extra attributes/sorting to decide | **Avoid when**: one attribute suffices — simple variant is lighter
- **Styling hooks**: `selectionStyle`; `a!safeLink` name cells; disabled states driven by `fv!selectedRows` saves
- **Pairs well with**: product/record assignment forms, admin consoles
- **Marker**: neutral

### Page rollup
Default choice for most cases is the **simple** checkbox-cards variant because one label per item is usually enough and it costs far less layout; escalate to **grids** only when users need columns (price, stock) to make the pick. Both variants share the same four-verb middle column (Add/Remove × Selected/All) with OUTLINE SECONDARY buttons and state-driven disabling — keep that grammar intact.

## Component: Vertical timeline (page: popular-patterns)

### image84.png
- **Produces it**: `a!forEach` milestones → `a!columnsLayout([EXTRA_NARROW, AUTO], spacing:"NONE")`: `a!stampField(size:"TINY", backgroundColor: done ? "POSITIVE" : "#d9d9d9", contentColor: done ? "STANDARD" : "#666666")` + rich text; `a!imageField` vertical-connector rows between (CODE-VERIFIED)
- **Looks like**: 6 stamps down a thin gray line — 3 green done (first keeps event icon, later swap to `check-circle-o`), STRONG labels + SMALL dates; future steps gray, plain, dateless (`showWhen`)
- **Use when**: variable-count milestones incl. future | **Avoid when**: few fixed steps fit horizontally (image24 twin)
- **Styling hooks**: color thresholds vs `local!currentMilestone`; conditional `style:"STRONG"`; per-milestone icon list
- **Pairs well with**: record-view left rail (image34/image66)
- **Marker**: neutral

### Page rollup
The timeline's teaching point: encode state three ways at once — stamp color (green/gray), label weight (STRONG/plain), and date presence — so progress reads even in grayscale.
