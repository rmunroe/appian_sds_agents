# Tier A — Full-Page Example UI Analysis (≤1000 words per image)

Deep reverse-engineering of a complete example UI. This is the most valuable analysis tier: you are recovering the design reasoning that the original designer never wrote down. All fields mandatory; write `none` rather than omit.

```markdown
## <image-filename>

### Identification
- **Image**: <file> | **Source page**: <page> | **Alt/caption**: <text>
- **Device frame**: desktop | tablet | phone
- **Marker**: do | dont | neutral
- **UI type**: dashboard-operational | dashboard-analytical | dashboard-executive | landing-page | home-page | form | wizard-step | record-view | list | portal | case-study-detail | other

### Use-case reconstruction (INFERRED)
- **Persona**: <role + seniority + cadence: daily-operator | weekly-manager | monthly-exec | occasional-customer | first-time-public>
- **Domain & brand context**: <industry, org type, brand feel>
- **Top 3 user tasks (ranked)**: 1. … 2. … 3. …
- **Implied requirements** (3–6, phrased as requirements): "Must surface overdue claims without scrolling", …
- **Data model sketch**: entities, key fields visible on screen, cardinalities — read them off labels/values in the pixels

### Layout anatomy (OBSERVED)
- **Skeleton**: (standard notation)
- **Above the fold**: what's visible without scrolling
- **Reading order**: F | Z | single-column | hub-and-spoke
- **Hierarchy rationale** (≤3 bullets): what is biggest/first and WHY, tied to the ranked tasks
- **Density**: <1–5> — evidence
- **Ratios & spacing**: column ratios, card padding class, section gaps

### Styling specifics (OBSERVED; CODE-VERIFIED when SAIL present)
- **Palette**: page bg #…, card bg #…, primary #…, accent(s) #…, semantic #…, neutrals #…
- **Color application points** (enumerate): header bar? card accents? chart series? icons? tags? big numbers? buttons?
- **Typography moves** (size ladder): title, section headers, body, numbers; weight/color plays; all-caps labels?
- **Imagery stance**: photos | styled icons (color+size) | illustrations | none
- **Card treatment**: border | shadow | flat | filled (style values if inferable)
- **Signature moves** (2–5): each phrased "instead of default X, they did Y via <SAIL lever>"

### Component inventory (OBSERVED → CODE-VERIFIED)
- SAIL constructs with key params guessed/verified: a!kpiField(template:"STACKED"), a!cardLayout(style:"#274e13", showBorder:false), …
- Chart types + custom colorScheme yes/no
- Interactive affordances: filters, search, record actions, cards-as-links, tabs

### Character & judgment
- **Register** (≤2 tags): … — one sentence why
- **Why it works** (≤3 bullets, each citing a specific observable)
- **Why not boring** (2–4 concrete choices that prevent generic feel) ← most valuable field
- **Boring twin** (2–3 sentences): describe the lazy default version of this same page a mediocre designer would build
- **What to steal** (1–3 imperatives)
- **Risks**: contrast/a11y/mobile concerns

### Code cross-check (only when the page has SAIL source)
- **Code-verified palette**: (overrides pixel estimates)
- **Notable techniques** (3–5, with approx line refs)
- **Corrections**: params that contradicted pixel guesses
```
