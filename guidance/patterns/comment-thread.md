# Comment Thread

## When this pattern
Users need to post, read, and respond to discussion inside an application context — a case, record, or campaign (official page purpose). Signals: human-authored free text, a composer, per-entry author + timestamp. Nearest alternatives: an event-history feed when entries are system-generated and there is no composer (see [event-history-list](../components/event-history-list.md)); a [record view](record-views.md) tab or rail is the usual host — discussion rarely stands alone.

## Anatomy
Canonical = the **Full page** variant (official vocabulary: Full page · With replies and attachments · Widget):
```
HEADER-CONTENT (host record chrome: title + TABS, Discussion selected)
└─ COLUMNS [empty : WIDE : empty]   ← empty flanks exist only to cap line length
   └─ SECTION "<topic title>" (labelSize LARGE)
      ├─ back-link "‹ Back to all topics" (a!safeLink, linkStyle STANDALONE)
      ├─ SBS [EXTRA_NARROW : AUTO]: avatar SMALL · author STRONG + relative
      │  timestamp SECONDARY · post body at MEDIUM
      ├─ "n Comments" count (MEDIUM STRONG)
      ├─ COMPOSER: avatar TINY + a!paragraphField + POST button (SOLID, align END)
      └─ comment rows ×n: avatar TINY + name STRONG + timestamp SECONDARY + body
```
Zone purposes: the topic post reads louder than replies (MEDIUM body vs default; SMALL avatar vs TINY) — role is encoded by scale, not boxes. The composer sits ABOVE the list so posting outranks lurking, and its avatar mirrors "you" into the thread before typing. Long comments clamp behind a STRONG "...more" link. Separation between entries is whitespace (`marginAbove/Below:"MORE"`), not borders. Above the fold: topic title, full post, count, composer, first comment.

## Variants
| Variant | Skeleton delta | Select when |
| --- | --- | --- |
| Full page | canonical above; may also sit at the bottom of a page below other content | default; longer posts, long threads skimmed by scrolling (page rule) |
| With replies and attachments | each comment becomes CARD(bordered, ROUNDED); inside it a collapsible SECTION "Replies (n)" (labelSize EXTRA_SMALL) holding tinted borderless reply cards; attachments as a card group (cardWidth NARROW_PLUS, spacing DENSE) of icon-tile + "TYPE – SIZE" chips; composer gains a compact file drop zone (`dropZoneStyle:"COMPACT"`) and a post button disabled until input | users reply to specific comments or attach evidence; keeps the thread readable while surfacing response context on demand |
| Widget | the SECTION alone (no host chrome), placed in a narrow rail column (~[2:1] main:rail) beside related content; `divider:"BELOW"` separates composer from list | conversation must stay visible while users work the main content (dashboard/summary rail) |

Selection rule from the page: give comments their own column or the bottom of the page so users skim by scrolling; a flat stream (Full page) suffices unless threading/evidence is required — then and only then pay the chrome cost of the replies variant.

## Component roster
- [`a!sectionLayout`](../components/section-layout.md) — thread container, collapsible "Replies (n)", `divider:"BELOW"` under composers
- [`a!imageField`](../components/images.md) — `style:"AVATAR"`; size encodes role (SMALL topic author, TINY commenters)
- `a!stampField` — TINY initials fallback when a user has no photo
- [`a!paragraphField`](../components/inputs.md) — composer (`height:"MEDIUM"`, `refreshAfter:"UNFOCUS"`)
- [`a!buttonArrayLayout` + `a!buttonWidget`](../components/buttons.md) — one SOLID post action, `align:"END"`; disabled until input in the replies variant
- [`a!richTextDisplayField`](../components/rich-text.md) — names STRONG, relative timestamps `SECONDARY`, "...more" clamp links, `char(10)` paragraph breaks
- [`a!cardLayout` / card group](../components/card-layout.md) — replies-variant comment cards, nested tinted reply cards, attachment chips
- [`a!fileUploadField`](../components/inputs.md) — compact drop zone in the replies-variant composer

## Layout decisions by data shape
- **Thread length**: skim by scrolling, never paginate by default; if paging controls must exist, minimize the need to use them (page rule). Density 2 — one reading column.
- **Comment length**: clamp long bodies behind "...more"; keep the reading column at WIDE between empty flanks (~46% of viewport) so measure stays readable.
- **Replies count**: collapsible "Replies (n)" per comment — collapsed by default keeps the top-level stream scannable.
- **Attachments**: chips with an icon tile + type/size caption, in a DENSE NARROW_PLUS card group — never inline previews that balloon the thread.
- **Avatar availability**: photo avatar first, initials stamp fallback — every entry keeps a visual anchor for scanning.
- **Timestamps**: relative ("4 days ago"), `SECONDARY`, beside the STRONG author name — the name/time pair is the scan rhythm.
- **Rail width** (widget): main:rail ≈ 2:1; the thread column scrolls independently of the data it annotates.

## Mobile behavior
- Already single-column; the empty flanking columns collapse first, letting the thread take full width.
- Widget rails stack below the main content — the page-sanctioned fallback is bottom-of-page placement, so source-order the widget after the primary content.
- Composer and post button stack full-width; attachment chips wrap.

## Top 3 don'ts
1. **Paginating the thread** (page rule): users skim by scrolling; paging hides context and adds clicks — aim to minimize any need to paginate.
2. **Boxing every comment in bordered cards in a flat stream**: card chrome per entry is the boring twin of the Full page variant; reserve cards for the replies+attachments variant where nesting needs boundaries. Whitespace + avatar rhythm does the separation.
3. **Burying the composer below the list / uncapped line length**: composer-last demotes posting to an afterthought, and full-width comment text breaks measure — keep the composer above the list inside a width-capped column.

## Exemplars
| case study | what to steal |
| --- | --- |
| [nonprofit-fundraise-campaign-dashboard](../case-studies/nonprofit-fundraise-campaign-dashboard.md) | the same app family that hosts all three thread variants on its campaign record: section-header rhythm, neutral page ground, and rail-friendly column grid to seat a Widget thread beside data |
| [ins-claim-case-study](../case-studies/ins-claim-case-study.md) | consumer case record where a replies+attachments thread slots naturally: evidence-chip styling, stamp/avatar identity recipe, tab structure with a discussion sibling |
