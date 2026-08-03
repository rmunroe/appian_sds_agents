#!/usr/bin/env python3
"""Stage 3 verification: every manifest image is analyzed (mentioned in its primary page's
analysis file) or explicitly skip-flagged. Also reports missing/empty analysis files."""
import json, os, sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ANALYSIS = os.path.join(ROOT, "corpus", "analysis")
manifest = json.load(open(os.path.join(ROOT, "corpus", "manifest.json")))
pages, images = manifest["pages"], manifest["images"]

by_page = {}
for fname, m in images.items():
    by_page.setdefault(m["primary_page"], []).append(fname)

missing_files, uncovered, covered, skipped = [], [], 0, 0
for page, imgs in sorted(by_page.items()):
    path = os.path.join(ANALYSIS, page + ".md")
    if not os.path.exists(path) or os.path.getsize(path) < 200:
        missing_files.append((page, len(imgs)))
        continue
    text = open(path).read()
    for f in imgs:
        base = os.path.splitext(f)[0]
        if f in text or base in text:
            if "SKIPPED" in text.split(f)[-1][:200] if f in text else False:
                skipped += 1
            covered += 1
        else:
            uncovered.append((page, f))

print(f"analysis files present: {len(by_page) - len(missing_files)}/{len(by_page)}")
print(f"images covered: {covered}/{sum(len(v) for v in by_page.values())}")
if missing_files:
    print("\nMISSING/EMPTY analysis files:")
    for p, n in missing_files:
        print(f"  {p} ({n} images)")
if uncovered:
    print("\nUNCOVERED images (page, file):")
    for p, f in uncovered:
        print(f"  {p}: {f}")
sys.exit(1 if (missing_files or uncovered) else 0)
