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

For substantial multi-edit revisions to the paper, use the two-file pattern documented in `References/v2_changes.md` (master change document) + `References/_build_v2.ps1` (Word COM PowerShell script). See `[[batch-paper-revision-workflow]]` memory for the convention. Step 0 source-text verification (extract .docx → ZIP/XML → plain text → grep for anchors) belongs upstream of the master-changes drafting; produces `References/_ccs_text_extract.txt` as a transient working artifact (leading-underscore prefix signals working-file status; delete at cycle close).
