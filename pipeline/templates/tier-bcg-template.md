# Tier B / C / GIF Analysis Templates

## Tier B — Component variant crops (one rollup per page; ≤60 words per variant)

For pages showing component variants/configurations (e.g., 17 KPI crops). Anchor to the page's OFFICIAL variant vocabulary when it names one (e.g., KPI templates COMPACT / STACKED / ADJACENT).

```markdown
## Component: <name> (page: <page>)
Official variant vocabulary: <list, if the page names one>

### <variant/image-name>
- **Produces it**: <SAIL construct + the 1–3 params>
- **Looks like**: <1–2 lines>
- **Use when**: <1 line> | **Avoid when**: <1 line>
- **Styling hooks**: <params that change the look>
- **Pairs well with**: <components/contexts>
- **Hexes**: only if color IS the variant dimension
- **Marker**: do | dont | neutral

### Page rollup
Default choice for most cases is ___ because ___.
```

## Tier C — Do/Don't pairs (≤120 words per pair)

```markdown
### Principle: <imperative name, e.g. "Lead with the number, not the label">
- **DO shows**: <what + the specific technique>
- **DON'T shows**: <what + the visible consequence>
- **Rule**: <1 generalized line>
- **Severity**: always | usually | contextual
- **Category**: layout | color | typography | density | labeling | forms | data-display | mobile | a11y
- **SAIL implication**: <which params/structure implement the DO>
```

## GIF tier — Interaction demos (≤120 words; analyze provided frames)

```markdown
### Interaction: <name> (gif: <file>)
- **State chart**: trigger → intermediate → result (3–6 steps)
- **SAIL mechanism**: showWhen toggle | wizard step advance | pane transition | selected-card state | grid refresh | other
- **UX purpose**: progressive disclosure | feedback | orientation | delight
- **Replicate when**: <1 line> | **Cost**: <complexity note>
```
Skip-flag: if a GIF is decorative with no interaction teaching content, write `SKIPPED: <reason>` and move on. Prioritize GIFs on record-actions, wizard, pane, and tab pages.
