# Analysis: ux-billboard-layout

## overview_billboard_styles.png

Component: billboard layout (page: ux-billboard-layout). Official variant vocabulary: overlay styles DARK / SEMI_DARK / LIGHT / SEMI_LIGHT / NONE; heights AUTO, EXTRA_SHORT … EXTRA_TALL; overlay position; background media position. Tier B — two configurations of the same hotel header shown side by side.

### Variant: tall + bottom bar overlay (left screen)
- **Produces it**: a!billboardLayout(height ≈ "TALL", overlay: bar at BOTTOM, style SEMI_DARK)
- **Looks like**: cinematic night-skyline hero; CITYHOTEL logo tile + "Chicago Downtown The Loop" in one white line along the bottom scrim.
- **Use when**: hero real estate is available and the title fits one line. | **Avoid when**: vertical space is scarce.
- **Styling hooks**: height, overlay position/style.
- **Pairs well with**: property/brand record headers.
- **Hexes**: nav chrome #908b7c (est.); scrim ≈ semi-transparent black.
- **Marker**: neutral

### Variant: short + start column overlay (right screen)
- **Produces it**: same billboard, shorter fixed height, column overlay at START (SEMI_DARK), logo + title stacked.
- **Looks like**: compact banner; text block owns the left third, skyline stays visible right.
- **Use when**: header must stay short but text needs a vertical block. | **Avoid when**: overlay text would span the width.
- **Styling hooks**: overlay position (bar vs column), height.
- **Pairs well with**: dashboards needing content above the fold.
- **Hexes**: none variant-relevant.
- **Marker**: neutral

## billboard_do.png + billboard_dont.png (DO/DON'T pair)

### Principle: Billboard backgrounds decorate — never carry content users must read
- **DO shows**: real-estate hero — calm interior photo behind a bottom SEMI_DARK bar that carries the actual data: "24450 Country Club Dr / Great Falls, VA 22066" (LARGE white) + Price $925,000 / Sq. Ft. 2,480 / Bedrooms 3 / Bathrooms 2.5 label-value pairs. Nothing in the photo must be read.
- **DON'T shows**: a dense "Network Architecture Diagram" used as background — the fixed height crops its edges and legend, and the title-bar scrim blanks the middle band of nodes and arrows; the artifact users came to review is illegible.
- **Rule**: if users need to inspect the media, use an image/video component — billboard media is purely decorative.
- **Severity**: always
- **Category**: data-display
- **SAIL implication**: a!billboardLayout for ambiance only; informational graphics → a!imageField shown whole, uncropped, no overlay.

## billboard_overlay_do.png + billboard_overlay_dont.png (DO/DON'T pair)

### Principle: Use the full overlay when content covers most of the background; bars only for uniform one-liners
- **DO shows**: three sibling comms billboards ("When are we moving?", "Want to know more?", "New Company Perks") with full DARK overlays — one even scrim per card, centered white text, three tidy equal rectangles in a row.
- **DON'T shows**: the same three with bar overlays — each bar grows with its text (2–4 lines), so dark stripes land at different heights with photo slivers above/below; the row reads misaligned and cluttered.
- **Rule**: when overlay text fills most of the billboard, switch to the full overlay; bars suit short captions of equal length across siblings.
- **Severity**: usually
- **Category**: layout
- **SAIL implication**: a!billboardLayout(overlay: a!fullOverlay(overlayStyle:"DARK")); keep sibling billboards' overlay type and height identical.

## billboard_auto_height.png

Tier A kept per batch (full-page screenshots in two tablet frames); note the body content is wireframe placeholder — this is a height-configuration demo.

### Identification
- **Image**: billboard_auto_height.png | **Source page**: ux-billboard-layout | **Alt/caption**: "ds-images/billboard_auto_height.png" — '"Auto" height varies across different screen widths'
- **Device frame**: tablet ×2 (same page, landscape and portrait mockup frames)
- **Marker**: neutral
- **UI type**: landing-page (careers hero)

### Use-case reconstruction (INFERRED)
- **Persona**: prospective applicant browsing a company careers portal — first-time-public, brand-impression first.
- **Domain & brand context**: tech/startup employer brand; candid team-at-work photo (laptops around a wooden table) signals informal, collaborative culture.
- **Top 3 user tasks (ranked)**: 1. Absorb the employer brand at a glance. 2. Scroll into openings/content below. 3. Follow through toward applying.
- **Implied requirements**: "Hero must show the entire team photo uncropped at any width"; "Title legible on every width"; "Content follows immediately below the hero"; "One message per viewport".
- **Data model sketch**: thin — JobPosting/content list implied by two skeleton cards (title block + text lines); no real fields OBSERVED (placeholder wireframe).

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
BILLBOARD h=AUTO overlay=full,dark content="CAREERS" centered both axes
└─ COLUMNS [1:1] CARD(skeleton) ×2      ← landscape: card tops just peek above fold
   (portrait: 1-col stack; hero shrinks to ≈40% of viewport height)
```
- **Above the fold**: landscape — the hero effectively IS the fold (≈85% of viewport height); portrait — full hero + most of one skeleton card.
- **Reading order**: single-column.
- **Hierarchy rationale**: one all-caps word carries the screen (task 1); AUTO height keeps the whole photo because the photo is the message; content cards are deliberately subordinate.
- **Density**: 1 — marketing-airy: one word on one photo per viewport.
- **Ratios & spacing**: hero keeps the photo's intrinsic ≈16:10 ratio at both widths — height tracks width (the teaching point); hero-to-card gap ≈STANDARD.

### Styling specifics (OBSERVED)
- **Palette**: full dark overlay blends the photo to ≈#1a202b average (est.) — scrim ≈55% black (est.); title #ffffff; skeleton fills #f4f6f8 (est.) on white; device chrome black.
- **Color application points**: scrim + white display text only; zero accent colors — warmth comes from the photo's wood tones (#8a6a4a est.).
- **Typography moves**: "CAREERS" all-caps ≈EXTRA_LARGE, regular weight, dead-center; no other live text.
- **Imagery stance**: photography as the entire surface; no icons.
- **Card treatment**: flat wireframe placeholders.
- **Signature moves**: instead of a fixed banner that crops heads at odd widths, height:"AUTO" preserves the full photo and lets the hero grow taller as the screen widens; instead of positioned text boxes, a full dark overlay guarantees contrast wherever the title sits; instead of a sentence, a single word.

### Component inventory (OBSERVED)
a!billboardLayout(height:"AUTO", backgroundMedia: photo, overlay: a!fullOverlay(overlayStyle:"DARK", contents: centered richText "CAREERS")); a!columnsLayout + placeholder cards below. Charts: none. Affordances: none visible (demo).

### Character & judgment
- **Register**: energetic-consumer + warm-community — recruiting warmth via candid photo and single-word confidence.
- **Why it works**: AUTO removes crop decisions — the photo's composition survives at both widths (OBSERVED: full image visible in both frames); the dark scrim keeps regular-weight white type legible over a busy mid-contrast scene; the two frames teach the responsive behavior at a glance.
- **Why not boring**: full-bleed uncropped photo instead of a letterboxed strip; one-word EXTRA_LARGE title; no chrome between hero and content.
- **Boring twin**: a SHORT fixed banner cropping the photo to a strip of tabletop, left-aligned "Careers at Acme" in MEDIUM with no overlay, then a bulleted list of links.
- **What to steal**: AUTO height whenever the background photo's full composition matters; full DARK overlay + white display type as the default legibility recipe.
- **Risks**: on wide screens AUTO grows the hero past the fold and hides all content (nearly total in the landscape frame — OBSERVED); page text warns of load-time blanks for heavy media; single-word hero gives no scroll cue.

### Code cross-check
- none (no SAIL source on this page)

## billboard_fixed_height.png

Tier A kept per batch (full-page screenshots in two tablet frames); body content is wireframe placeholder — a height-configuration demo with a real record header.

### Identification
- **Image**: billboard_fixed_height.png | **Source page**: ux-billboard-layout | **Alt/caption**: "ds-images/billboard_fixed_height.png" — "A fixed height remains the same across different screen widths"
- **Device frame**: tablet ×2 (landscape + portrait frames of the same record)
- **Marker**: neutral
- **UI type**: record-view (student profile header)

### Use-case reconstruction (INFERRED)
- **Persona**: university student ("Belinda Ana Guzman") or her advisor opening the profile — occasional viewer; identity confirmation first.
- **Domain & brand context**: university system (Tampa campus; sunny coastal aerial as campus branding) — institutional but warm.
- **Top 3 user tasks (ranked)**: 1. Confirm the right student (photo + name). 2. Read the three key facts: Major / Year / Campus. 3. Continue into the profile cards below.
- **Implied requirements**: "Header height identical on every device (stable chrome)"; "Identity + key facts visible without scrolling"; "Background must crop gracefully, never distort"; "The bar must survive text wrap at narrow widths".
- **Data model sketch** (OBSERVED off labels): Student(photo, first "Belinda", middle "Ana", surname "GUZMAN", major=Accounting, year=JUNR, campus=Tampa); profile sub-records implied by 4 skeleton cards.

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
BILLBOARD h=fixed(≈SHORT_PLUS est.) overlay=bar,center,semi-dark
├─ avatar(circle) + "Belinda Ana GUZMAN" (left)
└─ labeled trio right: Major→Accounting · Year→JUNR · Campus→Tampa (icon+value)
COLUMNS [1:1] CARD(skeleton) ×4   (portrait: 1-col; same billboard height, bar wraps taller)
```
- **Above the fold**: hero bar + first card row in both orientations — fixed height guarantees content surfaces early.
- **Reading order**: Z — avatar/name left, facts right, then down into cards.
- **Hierarchy rationale**: the name is the largest text (identity = task 1); the three facts share the same bar, one glance away (task 2); the billboard stays ≈1/3 of viewport so record content wins the fold.
- **Density**: 2 — a header plus a 2×2 wireframe card grid, editorial spacing.
- **Ratios & spacing**: billboard ≈33% of landscape viewport height and the same absolute height in portrait (OBSERVED — the crop changes, not the band); bar vertically centered; facts as three even mini-columns.

### Styling specifics (OBSERVED)
- **Palette**: aerial photo teal/sand (water ≈#2e8fa0 est.); bar scrim SEMI_DARK — blend reads ≈#101a1e (est.), ≈60% black (est.); text #eeeeee (auto-switched white per overlay rules); glyph icons white.
- **Color application points**: only the scrim and white text — the photo carries all color.
- **Typography moves**: name ≈LARGE with weight play — "Belinda" STRONG, "Ana" regular, "GUZMAN" caps; fact labels SMALL STRONG above STANDARD icon+value pairs; wraps to two lines in portrait without breaking the bar.
- **Imagery stance**: photo background + circular avatar photo; small glyphs (book/calendar/building) before values.
- **Card treatment**: flat skeleton placeholders.
- **Signature moves**: instead of a gray toolbar, identity rides in a semi-dark bar vertically centered inside the billboard; instead of AUTO, a fixed height turns the photo into a stable branded band that crops rather than rescales across widths; caps surname for roster-style scanning; icon+label+value triplets make the bar a self-contained mini record header.

### Component inventory (OBSERVED)
a!billboardLayout(height fixed e.g. "SHORT_PLUS", backgroundMedia: photo, backgroundPosition tuned to keep the shoreline, overlay: a!barOverlay(position:"CENTER", overlayStyle:"SEMI_DARK")); overlay contents ≈ columns [avatar | name | facts ×3] of a!imageField(circle avatar) + richText; skeleton cards below. Charts: none. Affordances: none visible (demo).

### Character & judgment
- **Register**: institutional + warm-community — university formality warmed by coastal photo and a personable avatar.
- **Why it works**: equal header height in both frames (OBSERVED) keeps chrome predictable while backgroundPosition decides what survives the crop; the SEMI_DARK bar guarantees legibility yet leaves the photo readable above and below it; identity + three facts fit one bar, so no second header row is needed.
- **Why not boring**: record header embedded in imagery instead of a toolbar; typographic weight play inside a single name; centered bar position instead of the default bottom.
- **Boring twin**: white page, avatar + name as an H2 above a three-column field list, the photo shrunk to a side thumbnail or dropped.
- **What to steal**: bar overlay as a record identity strip (avatar + name + labeled facts); fixed height + backgroundPosition for stable, crop-tolerant branded headers.
- **Risks**: portrait wrap doubles the bar height and eats the photo (OBSERVED); white SMALL labels over a semi-transparent scrim depend on photo luminance — SEMI_DARK holds here but must be checked per asset; cropping may cut meaningful photo regions if backgroundPosition is left default.

### Code cross-check
- none (no SAIL source on this page)

## overview_section_spacing.png

Tier override: batch suggests A, but this is an annotated fragment (billboard + thumbnail strip with an instructional arrow, no full page) → analyzed as tier B.

- **Produces it**: a!billboardLayout(marginBelow:"STANDARD")
- **Looks like**: real-estate hero (address, Price $925,000, Sq. Ft. 2,480 in a bottom SEMI_DARK bar); an orange annotation arrow (#f0982b est.) flags the white gap before a 7-thumbnail photo strip.
- **Use when**: any content follows a billboard. | **Avoid when**: intentionally stacking flush billboards (use NONE).
- **Styling hooks**: marginBelow ladder (NONE … STANDARD … MORE).
- **Pairs well with**: galleries, KPI rows directly under heroes.
- **Hexes**: annotation only — none variant-relevant.
- **Marker**: neutral (annotated teaching image)

### Page rollup (tier-B images)
Default for in-app record/property headers: fixed height (SHORT–MEDIUM) + SEMI_DARK bar overlay + marginBelow "STANDARD", because it keeps chrome stable and content above the fold; reserve AUTO height + full DARK overlay for marketing heroes where the whole photo is the message.
