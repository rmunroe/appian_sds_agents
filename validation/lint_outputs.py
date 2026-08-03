#!/usr/bin/env python3
"""Layer 1 + Layer 2 mechanical checks on producer outputs in validation/outputs/*.md.

Usage: python3 validation/lint_outputs.py [case-id ...]   (default: all T*.md files)
Rosters are read live from guidance/ so this runs only after Stage 4.
"""
import colorsys, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "validation", "outputs")
GUID = os.path.join(ROOT, "guidance")

# Known-good SAIL functions that are not UI components (logic/data), allowed without roster entry.
CORE_FNS = {
    "a!localVariables", "a!isPageWidth", "a!save", "a!refreshVariable", "a!map", "a!forEach",
    "a!flatten", "a!update", "a!defaultValue", "a!currentUser", "a!isNullOrEmpty", "a!listType",
    "a!queryFilter", "a!queryLogicalExpression", "a!pagingInfo", "a!sortInfo",
}


def load_rosters():
    patterns = {os.path.splitext(f)[0] for f in os.listdir(os.path.join(GUID, "patterns")) if f.endswith(".md")}
    recipes = set(re.findall(r"^##+\s+(?:Recipe:\s*)?([A-Z][A-Za-z ]+?)\s*$",
                             open(os.path.join(GUID, "styling", "recipes.md")).read(), re.M))
    comp_text = " ".join(open(os.path.join(GUID, "components", f)).read()
                         for f in os.listdir(os.path.join(GUID, "components")))
    cookbook = open(os.path.join(GUID, "sail", "cookbook.md")).read()
    cases = " ".join(open(os.path.join(GUID, "case-studies", f)).read()
                     for f in os.listdir(os.path.join(GUID, "case-studies")) if f.endswith(".md"))
    known_fns = (set(re.findall(r"a![a-zA-Z]+", comp_text)) | set(re.findall(r"a![a-zA-Z]+", cookbook))
                 | set(re.findall(r"a![a-zA-Z]+", cases)) | CORE_FNS)
    return patterns, recipes, known_fns


def hue(hexcode):
    h = hexcode.lstrip("#")
    r, g, b = (int(h[i:i + 2], 16) / 255 for i in (0, 2, 4))
    return colorsys.rgb_to_hsv(r, g, b)[0] * 360


def lint_case(path, patterns, recipes, known_fns):
    cid = os.path.splitext(os.path.basename(path))[0]
    text = open(path).read()
    fails, warns = [], []

    brief = re.search(r"#+.*Design Brief(.*?)(?=\n#|\Z)", text, re.S | re.I)
    if not brief:
        fails.append("no Design Brief section")
        brief_text = ""
    else:
        brief_text = brief.group(1)
        for field in ["pattern", "recipe", "density", "signature", "omit"]:
            if not re.search(field, brief_text, re.I):
                fails.append(f"Design Brief missing field: {field}")
    hexes = set(h.lower() for h in re.findall(r"#[0-9a-fA-F]{6}\b", text))
    if len(set(re.findall(r"#[0-9a-fA-F]{6}\b", brief_text))) < 5:
        warns.append(f"Design Brief lists <5 hexes")
    if len(hexes) < 3:
        fails.append(f"only {len(hexes)} distinct hexes in output")
    styling_tokens = len(re.findall(
        r'#[0-9a-fA-F]{6}\b|"(?:SMALL|STANDARD|MEDIUM|MEDIUM_PLUS|LARGE|LARGE_PLUS|EXTRA_LARGE|'
        r'NONE|EVEN_LESS|LESS|MORE|EVEN_MORE)"', text))
    if styling_tokens < 6:
        fails.append(f"only {styling_tokens} exact styling decisions")

    declared_pattern = re.search(r"pattern[^:\n]*:\s*\**([a-z0-9-]+)", text, re.I)
    if declared_pattern and not any(declared_pattern.group(1).startswith(p) or p.startswith(declared_pattern.group(1))
                                    for p in patterns):
        fails.append(f"pattern '{declared_pattern.group(1)}' not in roster {sorted(patterns)}")
    declared_recipe = None
    m = re.search(r"recipe[^:\n]*:\s*\**([A-Z][A-Za-z][^\n*·(,;—-]*)", text, re.I)
    if m:
        declared_recipe = m.group(1).strip()
        match = next((r for r in recipes if declared_recipe.lower().startswith(r.lower())), None)
        if match:
            declared_recipe = match
        else:
            fails.append(f"recipe '{declared_recipe}' not in roster {sorted(recipes)}")
    else:
        fails.append("no recipe declared")

    code_blocks = "\n".join(re.findall(r"```[a-z]*\n(.*?)```", text, re.S))
    used_fns = set(re.findall(r"a![a-zA-Z]+\s*\(", code_blocks))
    used_fns = {f.rstrip("( \t") for f in used_fns}
    unknown = used_fns - known_fns
    if unknown:
        fails.append(f"unknown SAIL functions: {sorted(unknown)}")

    if cid == "T2" and "a!isPageWidth" not in text and not re.search(r"stack", text, re.I):
        fails.append("T2 lacks a!isPageWidth / stacking design")

    for vague in ["clean", "modern", "user-friendly", "visually appealing"]:
        for m in re.finditer(rf"\b{vague}\b", text, re.I):
            ctx = text[max(0, m.start() - 150):m.end() + 150]
            if not re.search(r"#[0-9a-fA-F]{6}|\"(?:MEDIUM|LARGE|SMALL|STANDARD)", ctx):
                warns.append(f"vague phrase '{vague}' without nearby concrete value")
                break

    density = re.search(r"density[^:\n]*:\s*\**(\d)", text, re.I)
    return {"case": cid, "fails": fails, "warns": warns, "hexes": hexes,
            "pattern": declared_pattern.group(1) if declared_pattern else None,
            "recipe": declared_recipe, "density": int(density.group(1)) if density else None}


def main():
    patterns, recipes, known_fns = load_rosters()
    files = ([os.path.join(OUT, a + ".md") for a in sys.argv[1:]] if sys.argv[1:]
             else sorted(f.path for f in os.scandir(OUT) if f.name.endswith(".md")))
    results = [lint_case(f, patterns, recipes, known_fns) for f in files]
    ok = True
    for r in results:
        status = "PASS" if not r["fails"] else "FAIL"
        ok &= not r["fails"]
        print(f"\n== {r['case']}: {status} (pattern={r['pattern']}, recipe={r['recipe']}, density={r['density']})")
        for f in r["fails"]:
            print(f"   FAIL: {f}")
        for w in r["warns"]:
            print(f"   warn: {w}")

    # Layer 2 gates (only when full suite)
    if len(results) >= 5:
        print("\n== Layer 2 differentiation gates ==")
        combos = [(r["pattern"], r["recipe"]) for r in results]
        if len(set(combos)) != len(combos):
            print("   FAIL: two outputs share pattern+recipe"); ok = False
        prim = []
        for r in results:
            if r["hexes"]:
                sat = [(h, hue(h)) for h in r["hexes"] if len(set(h[1:])) > 1]
                if sat:
                    prim.append(sat[0][1])
        distinct = sum(1 for i, a in enumerate(prim) if all(
            min(abs(a - b), 360 - abs(a - b)) > 30 for b in prim[:i]))
        if distinct + (1 if prim else 0) < 4:
            print(f"   warn: primary hue diversity low (heuristic; verify by eye)")
        t1 = next((r for r in results if r["case"] == "T1"), None)
        t3 = next((r for r in results if r["case"] == "T3"), None)
        if t1 and t3 and t1["density"] and t3["density"] and abs(t1["density"] - t3["density"]) < 2:
            print(f"   FAIL: T1/T3 density delta {abs(t1['density'] - t3['density'])} < 2"); ok = False
    print("\nOVERALL:", "PASS" if ok else "FAIL")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
