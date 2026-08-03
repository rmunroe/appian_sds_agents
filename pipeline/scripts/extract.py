#!/usr/bin/env python3
"""Stage 2: Convert mirrored SDS HTML to faithful markdown + extract inspiration SAIL sources.

Output: corpus/pages/<page>.md, guidance/sail/sources/*.sail, updated manifest sail counts.
"""
import json, os, re
from html.parser import HTMLParser

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
HTML_DIR = os.path.join(ROOT, "corpus", "html")
PAGES_DIR = os.path.join(ROOT, "corpus", "pages")
SOURCES_DIR = os.path.join(ROOT, "guidance", "sail", "sources")

SKIP_TAGS = {"script", "style", "svg", "button", "noscript", "iframe", "form", "nav", "footer"}


class MdConverter(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.out = []            # list of markdown block strings
        self.buf = []            # inline text accumulator for current block
        self.in_main = False
        self.skip_depth = 0      # >0 => inside skipped subtree
        self.tag_stack = []      # (tag, classes, flags)
        self.list_stack = []     # 'ul' | 'ol' with counter
        self.marker_stack = []   # 'do' | 'dont'
        self.sail_depth = None   # div depth where sail block started
        self.sail_buf = []
        self.in_rouge_code = False
        self.sail_blocks = []
        self.table = None        # rows accumulator
        self.row = None
        self.cell = None
        self.heading = None
        self.pending_prefix = ""

    # ---------- helpers ----------
    def flush(self):
        text = "".join(self.buf)
        text = re.sub(r"[ \t]+", " ", text).strip()
        self.buf = []
        if text:
            self.out.append(self.pending_prefix + text)
        self.pending_prefix = ""

    def depth(self):
        return len(self.tag_stack)

    # ---------- tag handling ----------
    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        classes = (a.get("class") or "").split()
        self.tag_stack.append((tag, classes))

        if tag == "main":
            self.in_main = True
            return
        if not self.in_main:
            return
        if self.skip_depth:
            return
        # skip subtrees
        if (tag in SKIP_TAGS or a.get("data-ignore") == "true"
                or "code-box-toolbar" in classes or "share-menu-item" in classes
                or "info-container" in classes or "docs-header" in classes
                or "bs-docs-sidebar" in classes or a.get("id") == "feedback"):
            self.skip_depth = self.depth()
            return
        # SAIL code block wrapper
        if tag == "div" and any(c.startswith("language-") for c in classes) and self.sail_depth is None:
            self.flush()
            self.sail_depth = self.depth()
            self.sail_buf = []
            return
        if self.sail_depth is not None:
            if tag == "td" and "rouge-code" in classes:
                self.in_rouge_code = True
            return

        if tag == "div" and "do" in classes:
            self.marker_stack.append("do")
        elif tag == "div" and "dont" in classes:
            self.marker_stack.append("dont")
        elif tag in ("h1", "h2", "h3", "h4", "h5"):
            self.flush()
            self.heading = tag
        elif tag == "p":
            self.flush()
        elif tag in ("ul", "ol"):
            self.flush()
            self.list_stack.append([tag, 0])
        elif tag == "li":
            self.flush()
            if self.list_stack:
                t, n = self.list_stack[-1]
                self.list_stack[-1][1] += 1
                indent = "  " * (len(self.list_stack) - 1)
                self.pending_prefix = f"{indent}- " if t == "ul" else f"{indent}{n + 1}. "
        elif tag == "table":
            self.flush()
            self.table = []
        elif tag == "tr" and self.table is not None:
            self.row = []
        elif tag in ("td", "th") and self.row is not None:
            self.cell = []
        elif tag == "img":
            src = a.get("src", "")
            if "ds-images/" in src:
                fname = src.split("ds-images/")[-1]
                alt = a.get("alt", "").strip()
                marker = self.marker_stack[-1] if self.marker_stack else None
                note = {"do": " **[DO example]**", "dont": " **[DON'T example]**"}.get(marker, "")
                gif = " *(animated GIF)*" if fname.lower().endswith(".gif") else ""
                self.flush()
                self.out.append(f"![{alt}](../images/{fname}){note}{gif}")
        elif tag in ("strong", "b"):
            self.buf.append("**")
        elif tag in ("em", "i"):
            self.buf.append("*")
        elif tag == "code":
            self.buf.append("`")
        elif tag == "br":
            self.buf.append(" ")

    def handle_endtag(self, tag):
        # pop stack to matching tag
        for i in range(len(self.tag_stack) - 1, -1, -1):
            if self.tag_stack[i][0] == tag:
                popped_classes = self.tag_stack[i][1]
                del self.tag_stack[i:]
                break
        else:
            popped_classes = []

        if tag == "main":
            self.in_main = False
            return
        if not self.in_main:
            return
        if self.skip_depth:
            if self.depth() < self.skip_depth:
                self.skip_depth = 0
            return
        if self.sail_depth is not None:
            if tag == "td" and self.in_rouge_code:
                self.in_rouge_code = False
            if self.depth() < self.sail_depth:
                code = "".join(self.sail_buf).rstrip("\n")
                self.sail_blocks.append(code)
                self.out.append("```sail\n" + code + "\n```")
                self.sail_depth = None
            return

        if tag == "div" and popped_classes and ("do" in popped_classes or "dont" in popped_classes):
            if self.marker_stack:
                self.marker_stack.pop()
        elif tag in ("h1", "h2", "h3", "h4", "h5") and self.heading:
            text = "".join(self.buf).strip()
            self.buf = []
            level = int(tag[1])
            if text:
                self.out.append("#" * level + " " + text)
            self.heading = None
        elif tag == "p":
            self.flush()
        elif tag in ("ul", "ol"):
            self.flush()
            if self.list_stack:
                self.list_stack.pop()
        elif tag == "li":
            self.flush()
        elif tag in ("td", "th") and self.cell is not None:
            self.row.append(re.sub(r"[ \t\n]+", " ", "".join(self.cell)).strip())
            self.cell = None
        elif tag == "tr" and self.table is not None and self.row is not None:
            self.table.append(self.row)
            self.row = None
        elif tag == "table" and self.table is not None:
            rows = [r for r in self.table if any(c for c in r)]
            if rows:
                md = ["| " + " | ".join(rows[0]) + " |",
                      "| " + " | ".join("---" for _ in rows[0]) + " |"]
                md += ["| " + " | ".join(r) + " |" for r in rows[1:]]
                self.out.append("\n".join(md))
            self.table = None
        elif tag in ("strong", "b"):
            self.buf.append("**")
        elif tag in ("em", "i"):
            self.buf.append("*")
        elif tag == "code":
            self.buf.append("`")

    def handle_data(self, data):
        if not self.in_main or self.skip_depth:
            return
        if self.sail_depth is not None:
            if self.in_rouge_code:
                self.sail_buf.append(data)
            return
        if self.cell is not None:
            self.cell.append(data)
            return
        self.buf.append(data)


def convert(page):
    html = open(os.path.join(HTML_DIR, page + ".html")).read()
    c = MdConverter()
    c.feed(html)
    c.flush()
    # de-noise: drop "Copy expression" leftovers and empty emphasis
    blocks = [b for b in c.out if b.strip() not in {"", "****", "**"}]
    return blocks, c.sail_blocks


def main():
    manifest = json.load(open(os.path.join(ROOT, "corpus", "manifest.json")))
    total_sail = 0
    insp_sources = 0
    for page, rec in sorted(manifest["pages"].items()):
        blocks, sail = convert(page)
        rec["sail_block_count"] = len(sail)
        total_sail += len(sail)
        header = (f"# {rec['title']}\n\n"
                  f"*Section: {rec['section']} | source: {manifest['base_url']}{page}.html | "
                  f"images referenced live in corpus/images/*\n")
        with open(os.path.join(PAGES_DIR, page + ".md"), "w") as f:
            f.write(header + "\n" + "\n\n".join(blocks) + "\n")
        # inspiration SAIL sources (non-hub pages)
        if rec["section"] == "inspiration" and not rec["is_hub"] and sail:
            big = [s for s in sail if len(s) > 500]
            for i, code in enumerate(big):
                suffix = "" if len(big) == 1 else f"-{i + 1}"
                with open(os.path.join(SOURCES_DIR, f"{page}{suffix}.sail"), "w") as f:
                    f.write(code + "\n")
                insp_sources += 1
        print(f"  {page}: {len(blocks)} blocks, {len(sail)} sail")
    manifest["counts"]["sail_blocks"] = total_sail
    json.dump(manifest, open(os.path.join(ROOT, "corpus", "manifest.json"), "w"), indent=1)
    print(f"TOTAL sail blocks: {total_sail}; inspiration sources extracted: {insp_sources}")


if __name__ == "__main__":
    main()
