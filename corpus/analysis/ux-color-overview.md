# Analysis: ux-color-overview

All colors pixel-estimated (no SAIL source on this page). Tier assignments follow the batch suggestions: the do/don't screenshots are full pages but function as principle illustrations, so tier C is kept; `color_in_content.png` is a cropped fragment, tier B.

## color_palette_do.png + color_palette_dont.png

### Principle: One brand hue plus semantic colors only
- **DO shows**: "PIAPAN" franchise dashboard. One dark-green brand color carries identity: nav bar `#194f47 (est.)`, section headings and links `#004e46 (est.)`. The only other hues are semantic — KPI values on the photo billboard in green `#3cf551 (est.)` / red `#ff323d (est.)` — plus neutral `#f0f0f0 (est.)` box headers on white. OBSERVED
- **DON'T shows**: identical page plus mint selected tab and chart frame `#7cafa6 (est.)`, mint/cream KPI tiles `#deffd9`/`#feffd5 (est.)`, black box headers `#000000`, pure-blue and red list icons `#0600fa`/`#ff001e (est.)`. Attention scatters; green/red KPIs no longer read as status. OBSERVED
- **Rule**: cap the palette at one brand hue + neutrals + a small fixed semantic set.
- **Severity**: always
- **Category**: color
- **SAIL implication**: leave boxes/cards on STANDARD styles; spend `style`/color params only on the brand hex and positive/negative text.

## color_block_do.png + color_block_dont.png

### Principle: Color blocks belong on the page perimeter
- **DO shows**: university student record (same UI as the density-3 anchor). A muted gray-blue card `#e2e6ed (est.)` spans the full top edge holding photo, name, Major/Year/Home Town — a visually distinct page header. Body stays white, so the green status accents `#00c227 (est.)` (ON-TRACK banner, GPA numbers, checkmarks) carry the meaning. OBSERVED
- **DON'T shows**: same page with a white header; the same `#e2e6ed` block instead wraps the mid-page KPI strip (Credits/GPAs). The eye lands on an arbitrary interior band and the page loses its header anchor. OBSERVED
- **Rule**: solid background blocks establish structure only along page edges; never spotlight random interior sections.
- **Severity**: usually
- **Category**: color
- **SAIL implication**: `a!cardLayout(style: <muted hex>)` as the first element under the site header; interior groupings use plain sections/boxes.

## color_header_flush.png

### Principle: Flush colored headers must pair with the bar above
- **DO shows**: the same student record built as a header-content layout: the `#e2e6ed (est.)` header band runs flush against the `#005298 (est.)` site nav (no white gap; the "Back to all students" breadcrumb moves inside the band). The muted, low-saturation shade sits comfortably under the saturated blue bar and does not out-shout content. OBSERVED
- **DON'T shows**: none provided — page text warns the anti-pattern is a bright, intense flush header that pulls the eye and clashes with the header bar directly above. INFERRED
- **Rule**: for flush headers, choose a "Standard"-intensity shade evaluated together with the chrome above it.
- **Severity**: contextual
- **Category**: color
- **SAIL implication**: `a!headerContentLayout` header background (or record view header background) with a muted hex; keep intensity at STANDARD box-style level.

## color_opacity_do.png

### Principle: Translucent fills layer content without hiding context
- **DO shows**: INSURECORP dark quote page — near-black bg `#000014 (est.)` with glowing gradient waves `#006aff → #001ab5 (est.)`. The "Your coverage details" card uses a transparent blue `style` hex: the wave visibly continues through the card, dimmed (wave beside card `#0025be` vs through it `#01023d`, both est.) — so the card reads as a forward layer while brand motion stays behind. Discount cards use opaque accent bars `#674ea7`/`#e69138`/`#6aa84f (est.)`. OBSERVED
- **DON'T shows**: none provided.
- **Rule**: use 8-digit `#RRGGBBAA` fills to spotlight a region while keeping the background visible and hierarchy layered.
- **Severity**: contextual
- **Category**: color
- **SAIL implication**: `a!cardLayout(style: "#RRGGBBAA")`; final `AA` pair 00 (transparent) → FF (opaque).

## color_info_do.png + color_info_dont.png

### Principle: A highlight color must mean something
- **DO shows**: Fall Rock Capital onboarding record. Structure is neutral — slate nav `#50708a (est.)`, phase/box headers `#f0f0f0 (est.)`, links `#336598 (est.)`. Color appears only as state: green completed `#5bbd38 (est.)`, orange behind-schedule `#f19d39 (est.)`, red OVERDUE text `#cc2b3e (est.)` on pale-pink alert cards `#fdf0f0 (est.)`. Overdue items win first glance. OBSERVED
- **DON'T shows**: same page plus pale-yellow phase headers `#ffffd7 (est.)`, blue-filled box headers `#3983c5 (est.)`, and yellow/green calendar icons on the Days KPIs — decoration that competes with, and dilutes, the red alerts. OBSERVED
- **Rule**: every non-neutral hue must encode a nameable state (green=done, red=alert); otherwise stay gray.
- **Severity**: always
- **Category**: color
- **SAIL implication**: keep section/box headers default; apply color via status icons and text (`POSITIVE`/`NEGATIVE`/accent) only.

## color_in_content.png

## Component: colorful imagery inside content (page: ux-color-overview)
Official variant vocabulary: none

### color_in_content.png
- **Produces it**: `a!boxLayout("Launch Countries")` holding rows of flag images (`a!imageField`/icon set) each paired with a green check `a!richTextIcon`; below, a "Discussion" box with comment feed (avatars, timestamped entries, photo thumbnails). INFERRED
- **Looks like**: 10 flag+check pairs in a 5-across grid; comment thread with two attached sofa photos.
- **Use when**: diverse colors ARE the content (flags, product photos) and users know what they represent.
- **Avoid when**: color is decorative chrome untied to meaning.
- **Styling hooks**: box headers `#f0f0f0 (est.)`, check green `#5bbd38 (est.)`, author links `#336598 (est.)`.
- **Pairs well with**: record summary views, activity/discussion feeds.
- **Hexes**: none — imagery colors are content, not configuration.
- **Marker**: neutral

### Page rollup
Default choice is neutral chrome (gray headers, one link color) so that content imagery — flags, photos, avatars — can be as colorful as reality without the page feeling messy.
