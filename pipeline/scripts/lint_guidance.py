#!/usr/bin/env python3
"""Pre-flight lints for guidance/ before validation. Exit 1 on hard failures."""
import os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
G = os.path.join(ROOT, "guidance")
fails, warns = [], []

BUDGETS = {"components": 5.5 * 1024, "patterns": 11 * 1024, "case-studies": 16 * 1024}
EXPECT = {
    "components": 22, "patterns": 14, "case-studies": 18,
}

# 1. presence + budgets
for sub, n in EXPECT.items():
    d = os.path.join(G, sub)
    files = [f for f in os.listdir(d) if f.endswith(".md")]
    if len(files) < n:
        fails.append(f"{sub}/: {len(files)} files, expected {n}")
    for f in files:
        size = os.path.getsize(os.path.join(d, f))
        cap = BUDGETS[sub]
        if size > cap * 1.3:
            fails.append(f"{sub}/{f}: {size}B far over budget {int(cap)}B")
        elif size > cap:
            warns.append(f"{sub}/{f}: {size}B over budget {int(cap)}B")

for req in ["README.md", "use-case-selector.md", "anti-patterns.md",
            "styling/recipes.md", "styling/anti-corporate.md", "styling/styling-mechanics.md",
            "core/design-philosophy.md", "core/layout-foundations.md", "core/mobile.md",
            "sail/cookbook.md"]:
    if not os.path.exists(os.path.join(G, req)):
        fails.append(f"missing required file: {req}")

# 2. link integrity (relative md links)
for dirpath, _, files in os.walk(G):
    if "sources" in dirpath or "_meta" in dirpath:
        continue
    for f in files:
        if not f.endswith(".md"):
            continue
        p = os.path.join(dirpath, f)
        text = open(p).read()
        for m in re.finditer(r"\]\(([^)#\s]+?\.(?:md|sail))(?:#[^)]*)?\)", text):
            target = m.group(1)
            if target.startswith("http"):
                continue
            resolved = os.path.normpath(os.path.join(dirpath, target))
            if not os.path.exists(resolved):
                fails.append(f"broken link in {os.path.relpath(p, G)}: {target}")

# 3. no hexes in patterns/ (allow inside code fences? no — patterns are palette-neutral)
for f in os.listdir(os.path.join(G, "patterns")):
    text = open(os.path.join(G, "patterns", f)).read()
    hexes = re.findall(r"#[0-9a-fA-F]{6}\b", text)
    if hexes:
        warns.append(f"patterns/{f}: contains {len(hexes)} hex codes (should be palette-neutral): {hexes[:4]}")

# 4. vague phrases without nearby concrete value
VAGUE = ["clean ", "modern ", "user-friendly", "visually appealing", " nice "]
for dirpath, _, files in os.walk(G):
    if "sources" in dirpath:
        continue
    for f in files:
        if not f.endswith(".md"):
            continue
        text = open(os.path.join(dirpath, f)).read()
        for v in VAGUE:
            for m in re.finditer(re.escape(v), text, re.I):
                ctx = text[max(0, m.start() - 200):m.end() + 200]
                if not re.search(r'#[0-9a-fA-F]{6}|"(?:SMALL|STANDARD|MEDIUM|LARGE|NONE|MORE|LESS)', ctx):
                    warns.append(f"{os.path.relpath(os.path.join(dirpath, f), G)}: vague '{v.strip()}' w/o concrete value nearby")
                    break

# 5. every case study referenced from selector or a pattern exemplar table
sel = open(os.path.join(G, "use-case-selector.md")).read()
pat_all = " ".join(open(os.path.join(G, "patterns", f)).read() for f in os.listdir(os.path.join(G, "patterns")))
for f in os.listdir(os.path.join(G, "case-studies")):
    if f.endswith(".md") and f not in sel and f not in pat_all:
        warns.append(f"case-studies/{f}: not referenced by selector or any pattern")

# 6. every pattern has an exemplar section
for f in os.listdir(os.path.join(G, "patterns")):
    text = open(os.path.join(G, "patterns", f)).read()
    if "case-studies/" not in text:
        warns.append(f"patterns/{f}: no case-study exemplar links")

print(f"=== guidance lint: {len(fails)} failures, {len(warns)} warnings")
for x in fails:
    print(f"  FAIL: {x}")
for x in warns:
    print(f"  warn: {x}")
sys.exit(1 if fails else 0)
