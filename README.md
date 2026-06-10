# Consensus Change Standards

**A Legal and Technical Framework for Bitcoin Protocol Governance**

*By Asaf Fulks, J.D. — California State Bar No. 343622*

**Third Edition (v3.1) · June 2026**

---

Bitcoin has no formal process for evaluating proposed changes to its consensus rules. The BIP system provides a mechanism for proposing changes, but establishes no minimum standards that a proposal must meet before the community considers activation. There are no required review periods, no mandatory code audit standards, no agreed-upon activation thresholds, and no framework for evaluating the legal and economic consequences of a failed activation.

This paper proposes a comprehensive framework — including a 20-point Consensus Change Readiness Checklist — for evaluating Bitcoin consensus change proposals. It draws on the history of Bitcoin's prior consensus changes, established principles of software engineering governance, and legal analysis of the liabilities created by reckless activation.

## What's Inside

- **Section 1 — The Problem:** BIP-110 as a case study for every failure mode a governance framework should prevent
- **Section 2 — Historical Precedent:** P2SH, SegWit, SegWit2x, and Taproot analyzed for activation parameters and outcomes
- **Section 3 — The Framework:** Proposal submission requirements, tiered minimum review periods, code audit standards, activation threshold minimums, and sunset clause requirements
- **Section 4 — Legal Analysis:** Negligence, tortious interference, fiduciary duties, mining pool operator liability, and regulatory implications of chain splits
- **Section 5 — Proposed Standards:** The 20-criterion Consensus Change Readiness Checklist with a scoring system (BIP-110: 3/20, Red | Taproot: 17/17 applicable, Green | SegWit2x: ≈6/17, Red)
- **Section 6 — Objections and Responses**
- **Appendix A — Documentary Record** for the BIP-110 case study; **Appendix B — Adoption Kit** with model policy language for exchanges, pools, and node-software platforms

## Downloads

**Current — Third Edition, v3.1 (June 2026):**

- [**Consensus Change Standards, Third Edition v3.1** (PDF)](consensus_change_standards_v3.1.pdf) — citation target
- [LaTeX source](LaTeX/consensus_change_standards.tex) — for redline contributions and direct editing
- [Standalone scorecard](scorecard.md) ([fillable PDF](scorecard.pdf)) — the §5.1 readiness checklist, ready to apply
- [Changelog](CHANGELOG.md) — per-revision change record

The Third Edition integrates pre-publication review feedback from Mark "Murch" Erhardt (Chaincode Labs) and Jameson Lopp (Casa), and incorporates BCAP (Crypto Fish, Lee & Alden, *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades*, Nov. 2024) as the canonical prior work in the field. It adds a third worked example to the scorecard (SegWit2x), ties a documented Red score to the legal-exposure analysis as a deterrence mechanism (§4.0, §5.2, §6.5), corrects the *Tulip Trading* holding (§4.3, §4.6), and reframes the BIP-110 reception around its pending LOT=true activation. Case citations and book/internet-source titles follow Bluebook conventions throughout.

The v3.1 revision corrects the SegWit lock-in chronology (§2.3), updates the BIP process discussion to BIP-3 (§1.1), brings the California economic-loss-rule analysis current through *Sheen* (2022) and *Rattagan* (2024), restates Rev. Rul. 2019-24 accurately, notes *Tulip Trading*'s 2024 discontinuance, redrafts scorecard criteria 11/15/16/20, restates the classification bands as percentages of applicable criteria with a narrow not-applicable rule, adds two figures (the threshold-risk cliff and the 2012–2026 governance timeline), and adds Appendices A and B. See [CHANGELOG.md](CHANGELOG.md) for the full record.

Earlier editions (First, April 2026; Second, May 2026) are preserved in git history and archived in `Old/`; check the commit log if a prior-edition citation needs to be resolved.

## Citing This Work

> Asaf Fulks, *Consensus Change Standards: A Legal and Technical Framework for Bitcoin Protocol Governance* (3d ed. v3.1 2026), asaffulkslaw.com.

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
