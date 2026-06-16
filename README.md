# Consensus Change Standards

**A Legal and Technical Framework for Bitcoin Protocol Governance**

*By Asaf Fulks, J.D. — California State Bar No. 343622*

**Fourth Edition · June 2026**

[![DOI](https://zenodo.org/badge/1201730460.svg)](https://doi.org/10.5281/zenodo.20651832)

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

**Current — Fourth Edition (June 2026):**

- [**Consensus Change Standards, Fourth Edition** (PDF)](consensus_change_standards_v4.pdf) — citation target; the front-matter *Summary for Policymakers* gives the two-page gist
- [LaTeX source](LaTeX/consensus_change_standards.tex) — for redline contributions and direct editing
- [Standalone scorecard](scorecard.md) ([fillable PDF](scorecard.pdf)) — the §5.1 readiness checklist, ready to apply
- [Changelog](CHANGELOG.md) — per-revision change record

The Fourth Edition anchors the §3.4 chain-split model in the established double-spend literature (Nakamoto §11; Rosenfeld; Grunspan & Pérez-Marco) and reframes its contribution as turning that well-understood model on the activation-threshold choice; corrects the P2SH case study to its actual 2012 record (the ~55% poll failed, the chain forked, and activation came only by a hardcoded flag day — the model's own prediction, on a real Bitcoin soft fork); positions the framework against the open-standards governance tradition it descends from (IETF "rough consensus and running code," RFC 2026, the PEP→BIP→EIP lineage) in §1.5; adds an eighth objection answering the chilling-effect/weaponization concern (§6.8); deepens the antitrust analysis with the group-boycott *per se* line (§5.2); brings the negligence analysis current with *S. Cal. Gas Leak Cases* (2019) and balances the fiduciary discussion with the developers-are-not-fiduciaries counter-scholarship (§4.3); adds a fourth worked example — a hypothetical *data-liberalizing* change scored Red on process despite serving the author's own fee interest — as the cleanest test of neutrality (§5.4); and confronts the closed-loop "author grades his own exam" objection directly (§5.3). See [CHANGELOG.md](CHANGELOG.md) for the full record.

The prior **Third Edition (v3.1)** remains available at [consensus_change_standards_v3.1.pdf](consensus_change_standards_v3.1.pdf) for citations pinned to it. Earlier editions (First, April 2026; Second, May 2026) are preserved in git history and archived in `Old/`; check the commit log if a prior-edition citation needs to be resolved.

## Citing This Work

> Asaf Fulks, *Consensus Change Standards: A Legal and Technical Framework for Bitcoin Protocol Governance* (4th ed. 2026), asaffulkslaw.com.

Every tagged release is archived on Zenodo. Concept DOI (always resolves to the latest version): [10.5281/zenodo.20651832](https://doi.org/10.5281/zenodo.20651832). This edition's version DOI: [10.5281/zenodo.20685221](https://doi.org/10.5281/zenodo.20685221).

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
