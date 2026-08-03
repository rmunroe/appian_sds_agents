# Analysis: sail-design

Page context: "How to Design with SAIL" (section: overview). Both images document the design-mode workflow around `a!textField`; the page carries the matching SAIL snippets, so component params are CODE-VERIFIED even though the screenshots show the designer tool.

## component_configuration_updates.png

### Identification
- **Image**: component_configuration_updates.png | **Source page**: sail-design | **Alt/caption**: "updating component configuration"
- **Device frame**: desktop (cropped designer view: canvas strip + configuration pane; kept tier A — it is the page's primary teaching screenshot, not a component crop)
- **Marker**: neutral
- **UI type**: other — Interface Designer configuration pane

### Use-case reconstruction (INFERRED)
- **Persona**: Appian designer/low-code developer, daily cadence, mid-build configuring a form field
- **Domain & brand context**: Appian platform tooling; utilitarian, light-chrome IDE feel
- **Top 3 user tasks (ranked)**: 1. Edit the selected component's params without touching code 2. Confirm the canvas preview matches intent 3. Navigate between component/data/behavior/styling concerns
- **Implied requirements**: "Must show live preview of every param change"; "Must group dozens of params into scannable tabs"; "Must make the selected component's identity/type unambiguous"; "Must keep expression escape hatch one click away (edit icon in breadcrumb bar)"
- **Data model sketch**: component instance (type: Text, parent: List of Any Type) with params label, labelPosition, helpTooltip, placeholder, instructions — values mirror the page's SAIL: `a!textField(label:"Street Address", instructions:"Enter a street address", helpTooltip:"Do not include the city or state", placeholder:"123 Main St.")` (CODE-VERIFIED)

### Layout anatomy (OBSERVED)
- **Skeleton**:
```
COLUMNS [canvas:config-pane ≈1:1]
├─ PANE[left] canvas
│  └─ selected TEXT component: chip "Text" + label "Street Address"+? icon, italic placeholder, instructions line
└─ PANE[right] "Component Configuration"
   ├─ SECTION "Rule Inputs" (collapsed, + add)
   ├─ SECTION "Local Variables" (collapsed, + add)
   ├─ breadcrumb bar "List of Any Type / Text" (dark indigo) + swap/edit icons
   ├─ search "Search parameters"
   ├─ TABS ×4 [Content|Data|Behavior|Styling] — Content active
   └─ FORM: Label, Label Position (4 icon radios), Help Tooltip, Placeholder, Instructions
```
- **Above the fold**: everything (single viewport crop)
- **Reading order**: Z — canvas preview left, then top-down through the config form
- **Hierarchy rationale**: breadcrumb bar is the strongest color block → anchors "what am I editing" (task 3); form fields dominate area → param editing is the job (task 1); canvas preview kept adjacent for verification (task 2)
- **Density**: 3 — one form of 5 fields + 3 accordion headers per pane; comfortable padding
- **Ratios & spacing**: panes ≈ equal; config fields full-width with ~24px vertical rhythm; accordion rows ~56px tall

### Styling specifics (OBSERVED)
- **Palette**: pane bg #ffffff, accordion header bg #f1f0fa (est.), breadcrumb bar #34307a (est.) with white text, field borders #d7d7de (est.), primary/selection blue #2322f0 (est.), component chip lavender #7b78e0 (est.), canvas selection border #4a49e0 (est.), text #1a1a1a (est.)
- **Color application points**: breadcrumb bar (type identity), add "+" icons and active-tab underline in indigo/blue, Label Position selected option outlined blue, help "?" icon filled blue circle; everything else neutral
- **Typography moves**: pane headers ≈ MEDIUM semibold; field labels ≈ STANDARD semibold; tabs STANDARD; no all-caps anywhere; placeholder italic gray in both canvas and search box
- **Imagery stance**: none (icon-only affordances: swap, edit, add, help)
- **Card treatment**: flat panes separated by 1px rules; no shadows
- **Signature moves**: instead of a property *grid*, params are grouped into 4 concern tabs with a search box (scales to long param lists); instead of abstract param names, friendly labels ("Help Tooltip" → helpTooltip) mapping 1:1 to SAIL; instead of a separate preview app, the canvas itself is the live preview with a type chip on the selection

### Component inventory (OBSERVED → CODE-VERIFIED)
- Canvas renders `a!textField(label:"Street Address", helpTooltip:…, placeholder:"123 Main St.", instructions:"Enter a street address")` — all four params visible in pane and in page code (CODE-VERIFIED)
- Label Position control = labelPosition values (COLLAPSED | ABOVE | ADJACENT | JUSTIFIED) as icon radios; ABOVE selected (INFERRED mapping)
- Interactive affordances: accordions, tabbed pane, param search, breadcrumb swap/edit-as-expression icons

### Character & judgment
- **Register**: utilitarian-ops — dense-but-quiet IDE chrome that defers color to meaning
- **Why it works**: single accent hue reserved for "editable/selected" (blue outline, active tab, chip) makes state legible; form mirrors code param names so Design↔Expression mode round-trips are lossless; live preview sits in the same eyeline as the form
- **Why not boring**: indigo breadcrumb bar gives the pane a strong identity anchor; icon-radio Label Position control previews geometry instead of naming it; lavender type chip on the canvas ties selection to pane context
- **Boring twin**: a flat alphabetical property sheet in a modal, no canvas preview, "labelPosition: dropdown[ABOVE]" — accurate but unverifiable until save.
- **What to steal**: reserve one hue exclusively for selection/editing state; name UI controls exactly after their code params; keep preview and editor in one viewport
- **Risks**: gray placeholder text in inputs ~3:1 contrast (est.); icon-only swap/edit actions rely on tooltips; dense pane may crowd at tablet widths

### Code cross-check
- **Code-verified palette**: none in code (tool chrome, not SAIL styling)
- **Notable techniques**: page shows the before/after expressions — adding pane values appends `instructions`, `helpTooltip`, `placeholder` params (page code blocks 1–2); later blocks add `value/saveInto` locals and `showWhen`
- **Corrections**: none — pane values match code exactly

## street_address.png

### street-address default text field (page: sail-design)
- **Produces it**: `a!textField(label: "Street Address")` (CODE-VERIFIED)
- **Looks like**: bold near-black label above empty full-width input, 1px light-gray border (#ccc est.), white fill
- **Use when**: zero-config baseline input | **Avoid when**: format is ambiguous — add placeholder/instructions
- **Styling hooks**: labelPosition, placeholder, instructions, helpTooltip (added later on this page)
- **Pairs well with**: the configuration-pane demo above; forms
- **Hexes**: none — color is not the variant dimension
- **Marker**: neutral

### Page rollup
Default is the bare labeled `a!textField`; layer instructions/helpTooltip/placeholder only when format is genuinely ambiguous.
