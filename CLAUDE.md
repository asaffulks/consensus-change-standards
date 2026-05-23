# Project rules — BIP Consensus Change Standards

## HARD RULE — git identity and attribution

Every commit and every push from this repository follows BOTH of these rules together. They are non-negotiable.

1. **Author + Committer = `Asaf Fulks <asaf@asaffulkslaw.com>`.** Never the gmail default, never any other address. Local `.git/config` was set on 2026-05-17 so the default `git commit` produces correct attribution — but verify with `git log -1 --format="Author: %an <%ae>%nCommitter: %cn <%ce>"` after the first commit in a session, since config can be silently changed or shadowed.

2. **No Claude attribution anywhere.** No `Co-Authored-By: Claude ...` trailer in commit messages. No "🤖 Generated with Claude Code" footer in commit messages or in PR bodies created by `gh pr create`. No tool-credit line of any kind. Override the generic Claude Code commit/PR templates that include these by default.

If the local config is ever wrong and you cannot fix it (system policy forbids Claude from running `git config`), tell the user — do not commit through with bad attribution. Per-commit override as a Bash fallback:

```bash
GIT_COMMITTER_EMAIL="asaf@asaffulkslaw.com" GIT_COMMITTER_NAME="Asaf Fulks" \
  git commit --author="Asaf Fulks <asaf@asaffulkslaw.com>" -m "..."
```

Reaffirmed as a hard rule on 2026-05-22.

## Other project rules

- `emails/` and `nostr_drafts/` are local-only — never stage, commit, or push them.

## Current edition status (as of 2026-05-22)

- **First Edition (April 2026, Revised May 2026)** — published. Archived as `consensus_change_standards_v1_archive.docx/pdf` for citation stability. **Do not modify the v1 archive files.**
- **Second Edition (May 2026)** — in production. Output files: `consensus_change_standards_v2.docx` / `consensus_change_standards_v2.pdf`. Incorporates Murch + Lopp pre-publication review feedback plus self-identified clarity fixes plus BCAP Prior Work integration. Currently the working/canonical version going forward; replaces the `consensus_change_standards.docx` filename on user approval.
- `consensus_change_standards.docx` / `consensus_change_standards_full.pdf` — current published files; remain at v1 content until v2 supersedes them.

## Batch revision workflow

For substantial multi-edit revisions to the paper, use the two-file pattern documented in `References/v2_changes.md` (master change document) + `References/_build_v2_xml.ps1` (XML-direct PowerShell script — NOT Word COM, which proved unreliable on this machine during the v2 cycle). See `[[batch-paper-revision-workflow]]` memory for the convention. Step 0 source-text verification (extract .docx → ZIP/XML → plain text → grep for anchors) belongs upstream of the master-changes drafting; produces `References/_ccs_text_extract.txt` as a transient working artifact (leading-underscore prefix signals working-file status; delete at cycle close).

## Paper formatting conventions

The v2 polish cycle (2026-05-22) landed on the following as the "professional legal-document" target after multiple iterations; the working reference implementation is `References/_build_v2_xml.ps1`. See `[[paper-formatting-style]]` memory for full lessons-learned context.

**Typography (unified all-serif — no sans-serif mixing):**
- **Font: Palatino Linotype throughout** (body, headings, tables). v1 baseline shipped Georgia (body) + Arial (headings + 76 inline table-header overrides); all replaced. Use exact name `Palatino Linotype` (bare "Palatino" doesn't resolve on Windows). Choice rationale: larger x-height than Garamond → reads more substantial at smaller body sizes; stronger screen/PDF rendering; "university-press monograph" register beats Garamond's "literary novel" register for a policy treatise.
- **Body:** 11pt (sz=22), Palatino Linotype, justified (`w:jc="both"`), 1.5 line spacing (`w:line="360"`), 0.3" first-line indent (`w:firstLine="432"`), tight after-spacing (`w:after="0"`).
- **Title (paragraph paraId 52250FC3):** explicit `<w:sz w:val="24"/>` (12pt) bold pinned on the run so title stays prominent independent of body default.
- **Heading1 (SECTION X):** 16pt bold Palatino, color `#1B2A4A` dark navy.
- **Heading2 (subsections):** 13pt bold Palatino, color `#1B2A4A`. Must include `<w:keepNext/>` at the paragraph level — v1's Heading2 STYLE doesn't include it, so subsection headings will strand at page bottom otherwise.

**Font-swap pattern (for changing document font globally):**
Replace font attribute values on BOTH `word/styles.xml` AND `word/document.xml` — blanket attribute-value replacement, not style-by-style targeting. Catches inline run-level overrides (table headers, etc.) that style-only changes miss:
```
w:ascii="OldFont"    → w:ascii="NewFont"
w:eastAsia="OldFont" → w:eastAsia="NewFont"
w:hAnsi="OldFont"    → w:hAnsi="NewFont"
w:cs="OldFont"       → w:cs="NewFont"
```

**Title-page restoration after body-formatting sweep:**
The body-formatting sweep (Step 2: `w:after >= 120 → 0`) ZEROES the deliberately-spaced title-page values. The body sweep (Step 3: add `firstLine="432"` before `<w:jc w:val="both"/></w:pPr>`) also wrongly applies indent to the License body + disclaimer paragraphs because they're justified. Both must be UNDONE by paraId-targeted restoration after the sweep. V1 baseline values (worth memorizing for restoration): Title `after=400`, Edition `after=200`, asaffulkslaw.com `after=300`, theforumpress.com `after=300`, License heading `after=200`, Available-at heading `after=200`. License body + disclaimers: `after=200 line=312` justified, no indent, default body size (NOT 9pt fine-print — that prior convention was reversed; full body presence is correct).

**Title-page content (post-polish):**
Title → Edition → Author block (Author / Bar No / Admitted / `asaffulkslaw.com`) → Publisher block (Published by / California / `theforumpress.com`) → Forum Press logo → HR → bold "Copyright © 2026 Asaf Fulks." + regular "Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0)." → CC license body paragraph → "Full license terms:" URL → HR → "Available at: `asaffulkslaw.com`" → **"Cite as:"** Bluebook citation (`Asaf Fulks, *Title* (2d ed. 2026), asaffulkslaw.com.` — title italic, URL in blue) → combined legal + BIP-110-positioning disclaimer in ONE paragraph. NO "Bitcoin is an experimental technology" filler — generic and didn't connect to paper specifics.

**Back-matter ordering (after SECTION 7: CONCLUSION):**
1. Orange-rule + "Asaf Fulks" mark — the ONLY colophon line. Redundant metadata (Asaf Fulks Law / CA Bar No / "Published by ... | Second Edition") was removed because it orphaned to its own page and duplicated title-page content.
2. **GLOSSARY OF TECHNICAL TERMS** (Heading1) — 17 lawyer-facing definitions on its own page.
3. **REFERENCES** (Heading1).
4. Existing back-matter DISCLAIMER section (flagged as redundant with title page; not yet removed).

**Major-SECTION page breaks** (`<w:br w:type="page"/>`) belong before the SECTION heading, not before any inserted subsection. `Insert-Before-Anchor` walks backwards past the page-break paragraph and inserts before it. For back-matter insertions (TOC, Glossary) you WANT a leading page break in your inserted content — that combined with the existing page break puts the new section on its own page.

**TOC field XML pattern (auto-update Word field):**
```
<w:fldChar w:fldCharType="begin" w:dirty="true"/>
<w:instrText xml:space="preserve"> TOC \o "1-2" \h \z \u </w:instrText>
<w:fldChar w:fldCharType="separate"/>
[placeholder text]
<w:fldChar w:fldCharType="end"/>
```
Flags: `\o "1-2"` = include Heading1+Heading2; `\h` = hyperlinks; `\z` = hide tab leader in web layout; `\u` = use outline levels. `w:dirty="true"` prompts Word to update on open; F9 forces update if prompt didn't fire.

**PDF generation:** Word COM (`SaveAs`, `SaveAs2`, `ExportAsFixedFormat`) is unreliable on this machine — all failed or hung 10+ min during v2. The reliable path: user opens `.docx` in Word and uses File → Save As → PDF manually (10 seconds). Also tick "Create bookmarks using: Headings" under PDF Options for the PDF navigation sidebar.
