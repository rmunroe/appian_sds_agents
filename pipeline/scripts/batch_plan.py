#!/usr/bin/env python3
"""Stage 3 planning: group pages into analysis batches, emit per-batch instruction files."""
import json, os

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
BATCH_DIR = os.path.join(ROOT, "pipeline", "batches")
os.makedirs(BATCH_DIR, exist_ok=True)

manifest = json.load(open(os.path.join(ROOT, "corpus", "manifest.json")))
pages, images = manifest["pages"], manifest["images"]

# per-page primary images
by_page = {}
for fname, m in images.items():
    by_page.setdefault(m["primary_page"], []).append((fname, m))
for lst in by_page.values():
    lst.sort()


def tier(fname, m, section):
    if m["is_gif"]:
        return "GIF"
    if m["marker"] in ("do", "dont"):
        return "C"
    if section == "inspiration":
        return "A"
    if m.get("width", 0) >= 880 and m.get("height", 0) >= 520:
        return "A"
    return "B"


def page_spec(page):
    rec = pages[page]
    lines = [f"### Page: `{page}` (section: {rec['section']})",
             f"- Page text: `corpus/pages/{page}.md` — READ IT FIRST for context.",
             f"- Write your analysis to: `corpus/analysis/{page}.md`"]
    sail_path = os.path.join(ROOT, "guidance", "sail", "sources", f"{page}.sail")
    if os.path.exists(sail_path):
        kb = os.path.getsize(sail_path) // 1024
        lines.append(f"- Full SAIL source: `guidance/sail/sources/{page}.sail` ({kb} KB) — REQUIRED for the "
                     f"code cross-check; palette/params must be CODE-VERIFIED from it. If large, read in "
                     f"chunks; at minimum harvest all hex colors, layout skeleton, and notable techniques.")
    lines.append("")
    lines.append("| image (corpus/images/) | WxH | tier | marker | alt | nearest heading |")
    lines.append("|---|---|---|---|---|---|")
    n_analyzed = 0
    for fname, m in by_page.get(page, []):
        t = tier(fname, m, rec["section"])
        n_analyzed += 1
        alt = (m["alt"] or "")[:60].replace("|", "/")
        head = (m["nearest_heading"] or "")[:50].replace("|", "/")
        frames = " frames: " + ", ".join(m["frame_files"]) if m.get("frame_files") else ""
        lines.append(f"| {fname}{frames} | {m.get('width','?')}x{m.get('height','?')} | {t} "
                     f"| {m['marker']} | {alt} | {head} |")
    # secondary images (analyzed elsewhere)
    sec = [f for f, m in images.items() if page in m["pages"] and m["primary_page"] != page]
    if sec:
        lines.append(f"\nAlso on this page but analyzed under their primary page (just note cross-refs if "
                     f"relevant): {', '.join(sorted(sec)[:12])}{' …' if len(sec) > 12 else ''}")
    return "\n".join(lines), n_analyzed


HEADER = """# Analysis batch {bid}

You are an expert UI/UX analyst reverse-engineering the Appian SAIL Design System example images.
Work from repo root: /home/robert/Development/appian_sds_agents

## Protocol (follow exactly)
1. Read `pipeline/templates/CONVENTIONS.md` — vocabulary, evidence marks, skeleton notation, density scale.
2. Read the template(s) you need: `pipeline/templates/tier-a-template.md` for tier A,
   `pipeline/templates/tier-bcg-template.md` for tiers B, C, and GIF.
3. For EACH page below: read its page text, then Read each image listed (they are real image files —
   look at them carefully), then write ONE analysis file per page at the given path.
4. The `tier` column is a suggestion from dimensions/markers. Override with judgment: a full-page UI
   screenshot = tier A even if smaller; a cropped fragment = tier B even if large. Say when you override.
5. For GIFs: Read the extracted frame PNGs listed (corpus/images/frames/...), not the .gif itself.
6. Group tier-C images into DO/DON'T pairs when they are siblings under the same heading.
7. Evidence discipline: OBSERVED / INFERRED / CODE-VERIFIED marks as per conventions. Hexes for every
   color claim (est. suffix when pixel-guessed). No vague adjectives without the concrete choice.
8. Word budgets: tier A ≤1000 words/image; tier B ≤60 words/variant; tier C ≤120 words/pair; GIF ≤120 words.
9. Structure each analysis file: `# Analysis: <page>` then one `## <image-filename>` section per analyzed
   image (or per DO/DON'T pair, or per GIF interaction), using the tier template fields.
10. Your final message: just list the analysis files written and any images you skipped with reasons.

"""


def emit(bid, batch_pages, total_imgs):
    parts = [HEADER.format(bid=bid)]
    for p in batch_pages:
        spec, _ = page_spec(p)
        parts.append(spec)
        parts.append("")
    path = os.path.join(BATCH_DIR, f"batch-{bid:02d}.md")
    with open(path, "w") as f:
        f.write("\n".join(parts))
    print(f"batch-{bid:02d}: {len(batch_pages)} pages, {total_imgs} images -> {path}")


# ---- build batches ----
bid = 1
plan = []
# inspiration pages: solo batches
insp = sorted(p for p in by_page if pages[p]["section"] == "inspiration" and not pages[p]["is_hub"])
for p in insp:
    emit(bid, [p], len(by_page[p]))
    plan.append({"batch": bid, "pages": [p], "images": len(by_page[p])})
    bid += 1

# everything else: pack to <=18 images, big pages solo
rest = sorted((p for p in by_page if p not in insp),
              key=lambda p: (pages[p]["section"], p))
cur, cur_n = [], 0
for p in rest:
    n = len(by_page[p])
    if n == 0:
        continue
    if n > 18:
        if cur:
            emit(bid, cur, cur_n); plan.append({"batch": bid, "pages": cur, "images": cur_n}); bid += 1
            cur, cur_n = [], 0
        emit(bid, [p], n); plan.append({"batch": bid, "pages": [p], "images": n}); bid += 1
        continue
    if cur_n + n > 18 and cur:
        emit(bid, cur, cur_n); plan.append({"batch": bid, "pages": cur, "images": cur_n}); bid += 1
        cur, cur_n = [], 0
    cur.append(p); cur_n += n
if cur:
    emit(bid, cur, cur_n); plan.append({"batch": bid, "pages": cur, "images": cur_n})

json.dump(plan, open(os.path.join(BATCH_DIR, "plan.json"), "w"), indent=1)
no_img = sorted(p for p in pages if p not in by_page or not by_page[p])
print(f"\nTotal batches: {len(plan)}; images covered: {sum(b['images'] for b in plan)}")
print(f"Pages with no primary images (text-only, no analysis needed): {len(no_img)}: {', '.join(no_img)}")
