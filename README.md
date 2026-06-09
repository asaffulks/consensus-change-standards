# Consensus Change Standards

**A Legal and Technical Framework for Bitcoin Protocol Governance**

*By Asaf Fulks, J.D. — California State Bar No. 343622*

**Third Edition · June 2026**

---

Bitcoin has no formal process for evaluating proposed changes to its consensus rules. The BIP system provides a mechanism for proposing changes, but establishes no minimum standards that a proposal must meet before the community considers activation. There are no required review periods, no mandatory code audit standards, no agreed-upon activation thresholds, and no framework for evaluating the legal and economic consequences of a failed activation.

This paper proposes a comprehensive framework — including a 20-point Consensus Change Readiness Checklist — for evaluating Bitcoin consensus change proposals. It draws on the history of Bitcoin's prior consensus changes, established principles of software engineering governance, and legal analysis of the liabilities created by reckless activation.

## What's Inside

- **Section 1 — The Problem:** BIP-110 as a case study for every failure mode a governance framework should prevent
- **Section 2 — Historical Precedent:** P2SH, SegWit, SegWit2x, and Taproot analyzed for activation parameters and outcomes
- **Section 3 — The Framework:** Proposal submission requirements, tiered minimum review periods, code audit standards, activation threshold minimums, and sunset clause requirements
- **Section 4 — Legal Analysis:** Negligence, tortious interference, fiduciary duties, mining pool operator liability, and regulatory implications of chain splits
- **Section 5 — Proposed Standards:** The 20-point Consensus Change Readiness Checklist with a scoring system (BIP-110: ~3/20 | Taproot: ~18/20)
- **Section 6 — Objections and Responses**

## Downloads

**Current — Third Edition (June 2026):**

- [**Consensus Change Standards, Third Edition** (PDF)](consensus_change_standards_v3.pdf) — citation target
- [LaTeX source](LaTeX/consensus_change_standards.tex) — for redline contributions and direct editing

The Third Edition integrates pre-publication review feedback from Mark "Murch" Erhardt (Chaincode Labs) and Jameson Lopp (Casa), and incorporates BCAP (Crypto Fish, Lee & Alden, *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades*, Nov. 2024) as the canonical prior work in the field. It adds a third worked example to the scorecard (SegWit2x), ties a documented Red score to the legal-exposure analysis as a deterrence mechanism (§4.0, §5.2, §6.5), corrects the *Tulip Trading* holding (§4.3, §4.6), and reframes the BIP-110 reception around its pending LOT=true activation. Case citations and book/internet-source titles follow Bluebook conventions throughout.

Earlier editions (First, April 2026; Second, May 2026) are preserved in git history and archived in `Old/`; check the commit log if a prior-edition citation needs to be resolved.

## About the Author

Asaf Fulks is a practicing litigator (California State Bar No. 343622), solo Bitcoin miner, full node operator, and computer scientist (B.A. Computer Science, J.D. magna cum laude). He is admitted to the United States District Court for the Central District of California.

- **Website:** [asaffulkslaw.com](https://asaffulkslaw.com)
- **Publisher:** [The Forum Press](https://theforumpress.com), a Fulks, Inc. company

## Contributing

This framework is designed to be improved. If you identify factual errors, propose amendments, or want to extend the framework, open an issue or submit a pull request. The framework's authority derives from its usefulness — if it can be improved, it should be improved.

## License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

You are free to share, adapt, and build upon this work for any purpose, including commercial use, provided you give appropriate credit to the author.
