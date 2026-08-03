#!/usr/bin/env python3
"""Stage 1: Mirror the SDS site — pages, images, GIF frames, manifest.json."""
import json, os, re, subprocess, sys, time
from concurrent.futures import ThreadPoolExecutor, as_completed
from html.parser import HTMLParser
from urllib.request import Request, urlopen

BASE = "https://docs.appian.com/suite/help/26.7/sail/"
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
HTML_DIR = os.path.join(ROOT, "corpus", "html")
IMG_DIR = os.path.join(ROOT, "corpus", "images")
FRAME_DIR = os.path.join(IMG_DIR, "frames")

PAGES = {
    "overview": ["sail-design-system-overview", "sail-benefits", "sail-design", "home"],
    "patterns": ["introduction", "calendar", "comment-thread", "content-structure", "dashboards",
                 "data-value-display", "employee-home-pages", "forms", "kanban", "lists",
                 "online-shopping-journey", "page-headers", "page-titles", "popular-patterns",
                 "record-views", "secondary-navigation", "tabular-data-display", "visitor-landing-pages"],
    "components": ["components", "ux-billboard-layout", "ux-box-layout", "ux-buttons", "ux-card-layout",
                   "ux-charts", "ux-columns-layout", "ux-event-history-list", "ux-form-layout", "ux-gauge",
                   "ux-grids", "ux-header-content-layout", "ux-images", "ux-kpi", "ux-pane-layout",
                   "ux-record-actions", "ux-rich-text", "ux-section-layout", "ux-side-by-side-layout",
                   "ux-styled-icons", "ux-tab-layout", "ux-tags", "ux-wizard-layout"],
    "guidance": ["guidance", "ux-accessibility", "ux-avoiding-clutter", "ux-buttons-vs-links",
                 "ux-color-overview", "ux-columns-and-side-by-side", "ux-designing-for-your-users",
                 "ux-example-walkthrough", "ux-formatting-and-punctuation", "ux-inputs", "ux-labels",
                 "ux-mobile-considerations", "ux-page-width", "ux-pane-layout", "ux-portals",
                 "ux-presenting-information-clearly", "ux-progressive-disclosure", "ux-site-branding"],
    "inspiration": ["inspiration", "conference-home-page", "conference-registration-portal",
                    "customer-acct-management", "ins-agent-home-page", "ins-claim-case-study",
                    "ins-quote-review", "ins-quote-wizard-1", "ins-quote-wizard-2",
                    "mobile-incident-reporting", "my-health-site", "nonprofit-fundraise-campaign-dashboard",
                    "nonprofit-fundraise-campaign-overview", "portal-home-page", "real-estate-property-list",
                    "restaurant-order", "sales-perform-dashboard", "sustainability-dashboard",
                    "university-student-dashboard"],
}
HUBS = {"home", "introduction", "components", "guidance", "inspiration", "sail-design-system-overview"}
SECTION_PRIORITY = {"inspiration": 0, "patterns": 1, "components": 2, "guidance": 3, "overview": 4}

# dedupe pages (ux-pane-layout listed in two nav sections); keep first section encountered
page_section = {}
for sec, pages in PAGES.items():
    for p in pages:
        page_section.setdefault(p, sec)
ALL_PAGES = sorted(page_section)


def fetch(url, binary=False, retries=3):
    for attempt in range(retries):
        try:
            req = Request(url, headers={"User-Agent": "Mozilla/5.0 (internal design-research mirror)"})
            with urlopen(req, timeout=60) as r:
                data = r.read()
            return data if binary else data.decode("utf-8", "replace")
        except Exception as e:
            if attempt == retries - 1:
                raise
            time.sleep(2 * (attempt + 1))


class PageParser(HTMLParser):
    """Collect <img> refs with context: alt, do/dont ancestry, nearest heading; count SAIL blocks."""
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.images = []
        self.class_stack = []          # (tag, classes)
        self.heading = None
        self._in_heading = None
        self._heading_buf = []
        self.title = None
        self._in_title = False
        self._title_buf = []
        self.pre_blocks = 0

    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        classes = (a.get("class") or "").split()
        self.class_stack.append((tag, classes))
        if tag in ("h1", "h2", "h3", "h4"):
            self._in_heading = tag
            self._heading_buf = []
        elif tag == "title":
            self._in_title = True
        elif tag == "pre":
            self.pre_blocks += 1
        elif tag == "img":
            src = a.get("src", "")
            if "ds-images/" in src:
                marker = "neutral"
                for _, cs in self.class_stack:
                    if "dont" in cs:
                        marker = "dont"
                        break
                    if "do" in cs:
                        marker = "do"
                self.images.append({
                    "file": src.split("ds-images/")[-1],
                    "alt": a.get("alt", ""),
                    "marker": marker,
                    "nearest_heading": self.heading,
                })

    def handle_endtag(self, tag):
        for i in range(len(self.class_stack) - 1, -1, -1):
            if self.class_stack[i][0] == tag:
                del self.class_stack[i:]
                break
        if tag == self._in_heading:
            self.heading = " ".join("".join(self._heading_buf).split())
            self._in_heading = None
        elif tag == "title":
            self._in_title = False
            self.title = " ".join("".join(self._title_buf).split())

    def handle_data(self, data):
        if self._in_heading:
            self._heading_buf.append(data)
        elif self._in_title:
            self._title_buf.append(data)


def mirror_pages():
    results = {}
    def one(page):
        html = fetch(BASE + page + ".html")
        with open(os.path.join(HTML_DIR, page + ".html"), "w") as f:
            f.write(html)
        p = PageParser()
        p.feed(html)
        # SAIL blocks: pre blocks come in pairs (line numbers + code) inside highlight tables
        sail_blocks = len(re.findall(r'<td class="code">', html)) or p.pre_blocks
        return page, {
            "section": page_section[page],
            "title": (p.title or page).replace(" - Appian 26.7", ""),
            "is_hub": page in HUBS,
            "images": p.images,
            "sail_block_count": sail_blocks,
            "bytes": len(html),
        }
    with ThreadPoolExecutor(8) as ex:
        futs = {ex.submit(one, p): p for p in ALL_PAGES}
        for f in as_completed(futs):
            page, rec = f.result()
            results[page] = rec
            print(f"  page {page}: {len(rec['images'])} imgs, {rec['sail_block_count']} sail blocks")
    return results


def mirror_images(pages):
    # unique image -> list of (page, entry), pick primary page
    usage = {}
    for page, rec in pages.items():
        for entry in rec["images"]:
            usage.setdefault(entry["file"], []).append((page, entry))

    def prio(page):
        rec = pages[page]
        return (rec["is_hub"], SECTION_PRIORITY[rec["section"]], page)

    failures, meta = [], {}
    def one(fname):
        url = BASE + "ds-images/" + fname
        try:
            data = fetch(url, binary=True)
        except Exception as e:
            return fname, None, str(e)
        with open(os.path.join(IMG_DIR, fname), "wb") as f:
            f.write(data)
        return fname, len(data), None

    with ThreadPoolExecutor(8) as ex:
        futs = {ex.submit(one, f): f for f in usage}
        done = 0
        for fut in as_completed(futs):
            fname, size, err = fut.result()
            done += 1
            if err:
                failures.append((fname, err))
                continue
            pgs = sorted(usage[fname], key=lambda pe: prio(pe[0]))
            primary_page, primary_entry = pgs[0]
            meta[fname] = {
                "bytes": size,
                "pages": [p for p, _ in pgs],
                "primary_page": primary_page,
                "alt": primary_entry["alt"],
                "marker": primary_entry["marker"],
                "nearest_heading": primary_entry["nearest_heading"],
                "is_gif": fname.lower().endswith(".gif"),
            }
            if done % 100 == 0:
                print(f"  images: {done}/{len(usage)}")
    return meta, failures


def add_dimensions(meta):
    files = sorted(meta)
    # magick identify in chunks; GIFs report one line per frame
    for i in range(0, len(files), 40):
        chunk = files[i:i + 40]
        out = subprocess.run(
            ["magick", "identify", "-format", "%f %w %h\\n"] + [os.path.join(IMG_DIR, f) for f in chunk],
            capture_output=True, text=True)
        frame_counts = {}
        for line in out.stdout.strip().splitlines():
            parts = line.split()
            if len(parts) != 3:
                continue
            f, w, h = parts[0], int(parts[1]), int(parts[2])
            if f in meta:
                meta[f].setdefault("width", w)
                meta[f].setdefault("height", h)
                frame_counts[f] = frame_counts.get(f, 0) + 1
        for f, n in frame_counts.items():
            if meta[f]["is_gif"]:
                meta[f]["gif_frames"] = n


def extract_gif_frames(meta):
    for fname, m in sorted(meta.items()):
        if not m["is_gif"]:
            continue
        n = m.get("gif_frames", 1)
        picks = sorted({0, n // 2, max(0, n - 1)} | ({n // 4, 3 * n // 4} if n >= 8 else set()))
        frames = []
        for idx in picks:
            outname = f"{os.path.splitext(fname)[0]}_f{idx}.png"
            r = subprocess.run(
                ["magick", f"{os.path.join(IMG_DIR, fname)}[{idx}]", "-coalesce",
                 os.path.join(FRAME_DIR, outname)],
                capture_output=True, text=True)
            if r.returncode == 0:
                frames.append("frames/" + outname)
        m["frame_files"] = frames


def main():
    print("== mirroring pages ==")
    pages = mirror_pages()
    print(f"pages: {len(pages)}")
    print("== mirroring images ==")
    meta, failures = mirror_images(pages)
    print(f"images ok: {len(meta)}, failures: {len(failures)}")
    for f, e in failures:
        print(f"  FAIL {f}: {e}")
    print("== dimensions ==")
    add_dimensions(meta)
    print("== gif frames ==")
    extract_gif_frames(meta)
    gifs = sum(1 for m in meta.values() if m["is_gif"])
    manifest = {
        "base_url": BASE, "version": "26.7",
        "counts": {"pages": len(pages), "images": len(meta), "gifs": gifs,
                   "sail_blocks": sum(r["sail_block_count"] for r in pages.values()),
                   "image_failures": len(failures)},
        "pages": pages, "images": meta,
        "failures": failures,
    }
    with open(os.path.join(ROOT, "corpus", "manifest.json"), "w") as f:
        json.dump(manifest, f, indent=1)
    print("== manifest written ==")
    print(json.dumps(manifest["counts"], indent=2))


if __name__ == "__main__":
    main()
