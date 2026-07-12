# Consensus Change Standards

**A Legal and Technical Framework for Bitcoin Protocol Governance**

*By Asaf Fulks, J.D. — California State Bar No. 343622*

**Fifth Edition · July 2026**

[![DOI](https://zenodo.org/badge/1201730460.svg)](https://doi.org/10.5281/zenodo.20651832)

### 🟢 [Try the interactive scorecard →](https://asaffulks.github.io/consensus-change-standards/scorecard/)

Score any proposed Bitcoin consensus change against the 20-criterion §5.1 readiness standard, live in your browser — Green/Yellow/Orange/Red classification, Taproot and BIP-110 preloaded. *(Source: [`docs/scorecard/index.html`](docs/scorecard/index.html).)*

---

Bitcoin has no formal process for evaluating proposed changes to its consensus rules. The BIP system provides a mechanism for proposing changes, but establishes no minimum standards that a proposal must meet before the community considers activation. There are no required review periods, no mandatory code audit standards, no agreed-upon activation thresholds, and no framework for evaluating the legal and economic consequences of a failed activation.

This paper proposes a comprehensive framework — including a 20-point Consensus Change Readiness Checklist — for evaluating Bitcoin consensus change proposals. It draws on the history of Bitcoin's prior consensus changes, established principles of software engineering governance, and legal analysis of the liabilities created by reckless activation.

## What's Inside

- **Section 1 — The Problem:** BIP-110 as a case study for every failure mode a governance framework should prevent
- **Section 2 — Historical Precedent:** P2SH, SegWit, SegWit2x, and Taproot analyzed for activation parameters and outcomes
- **Section 3 — The Framework:** Proposal submission requirements, tiered minimum review periods, code audit standards, activation threshold minimums, and sunset clause requirements
- **Section 4 — Legal Analysis:** Negligence, tortious interference, fiduciary duties, mining pool operator liability, and regulatory implications of chain splits
- **Section 5 — Proposed Standards:** The 20-criterion Consensus Change Readiness Checklist with a scoring system (Taproot: 17/17 applicable, Green | BIP-110: 3/20, Red | SegWit2x: ≈5/17, Red), plus a fourth, hypothetical *data-liberalizing* example scored Red on process as the cleanest test of the framework's neutrality
- **Section 6 — Objections and Responses**
- **Appendix A — Documentary Record** for the BIP-110 case study; **Appendix B — Adoption Kit** with model policy language for exchanges, pools, and node-software platforms

## Downloads

**Current — Fifth Edition (July 2026):**

- [**Consensus Change Standards, Fifth Edition** (PDF)](consensus_change_standards_v5.pdf) — citation target; the front-matter *Summary for Policymakers* gives the gist up front
- [LaTeX source](LaTeX/consensus_change_standards.tex) — for redline contributions and direct editing
- [Standalone scorecard](scorecard.md) ([fillable PDF](scorecard.pdf)) — the §5.1 readiness checklist, ready to apply
- [Changelog](CHANGELOG.md) — per-revision change record

The Fifth Edition states the design rationale for computing the §3.4 activation floor on the pre-activation signaling snapshot — the one input observable before the network commits — with the Bitcoin Cash difficulty-oscillation record and minority-chain persistence as evidence that post-activation corrections are not guaranteed to run smooth or one way (§3.4); adds the split-harm gradient (non-monetary data survives a split but gets harder to use; fungible value breaks outright; nothing comes through better off) and a concrete evidence-anchoring case — after a split, a Bitcoin timestamp proof invites a which-chain-counts dispute before a tribunal ever reaches the proof, and both successor chains' histories get cheaper to rewrite (Ethereum Classic's August 2020 51%-attack series) — with the author's own timestamping interest disclosed alongside the §5.4 mining disclosure (§1.4); quotes Jameson Lopp's 2026 block-size retrospective as participant corroboration on economic-node authority and off-public coordination (§2.2); corrects the witness-discount attribution (SegWit, not Taproot) and the March-2013 "most recent split" superlative against the July 2015 BIP-66 forks; tightens the §3.4 model language (most-work chain selection, single-race scoping with fork renewal named among the simplifications) and the soft-fork/reorganization Glossary entries; aligns §5.4/§6.8 wording to the framework's options-not-instructions posture; and re-anchors all BIP-110 status language to its block schedule (mandatory signaling from block 961,632 ≈ August 7; forced activation at block 965,664 ≈ September 4, 2026). See [CHANGELOG.md](CHANGELOG.md) for the full record.

The prior **Fourth Edition** remains available at [consensus_change_standards_v4.pdf](consensus_change_standards_v4.pdf), and the **Third Edition (v3.1)** at [consensus_change_standards_v3.1.pdf](consensus_change_standards_v3.1.pdf), for citations pinned to them. Earlier editions (First, April 2026; Second, May 2026) are preserved in git history and archived in `Old/`; check the commit log if a prior-edition citation needs to be resolved.

## Citing This Work

> Asaf Fulks, *Consensus Change Standards: A Legal and Technical Framework for Bitcoin Protocol Governance* (5th ed. 2026), asaffulkslaw.com.

Every tagged release is archived on Zenodo. Concept DOI (always resolves to the latest version): [10.5281/zenodo.20651832](https://doi.org/10.5281/zenodo.20651832). This edition's version DOI: [10.5281/zenodo.21327195](https://doi.org/10.5281/zenodo.21327195); the Fourth Edition's is [10.5281/zenodo.20685221](https://doi.org/10.5281/zenodo.20685221).

Machine-readable citation metadata lives in [`CITATION.cff`](CITATION.cff) (GitHub's "Cite this repository" button reads it). Scorings published against this framework should cite the edition and version evaluated against (see Appendix B.4 of the paper), so that results remain comparable as the framework is revised.

## About the Author

Asaf Fulks is a practicing litigator (California State Bar No. 343622), solo Bitcoin miner, full node operator, and computer scientist (B.A. Computer Science, J.D. magna cum laude). He is admitted to the United States District Court for the Central District of California.

- **Website:** [asaffulkslaw.com](https://asaffulkslaw.com)
- **Publisher:** [The Forum Press](https://theforumpress.com), a Fulks, Inc. company

## Contributing

This framework is designed to be improved. If you identify factual errors, propose amendments, or want to extend the framework, open an issue or submit a pull request. The framework's authority derives from its usefulness — if it can be improved, it should be improved.

## License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

You are free to share, adapt, and build upon this work for any purpose, including commercial use, provided you give appropriate credit to the author.
