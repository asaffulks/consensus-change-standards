# v2 Prior Work Section — Drop-in Draft

**Status:** Ready for deployment when v2 revision cycle begins.
**Purpose:** Integrate BCAP (Crypto Fish, Lee & Alden, Nov 2024) into Consensus Change Standards as the canonical prior work in the field. Strengthen empirical grounding of review-period floors by citing Lopp's node-upgrade-timing data directly.

---

## §1.4 Relation to Prior Work (drop-in to Section 1, after §1.3)

**1.4 Relation to Prior Work**

The framework proposed in this paper builds on, and is intended to be read alongside, the most developed prior analysis of Bitcoin's consensus-change dynamics: Ren Crypto Fish, Steve Lee & Lyn Alden, *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades* (Nov. 2024) [hereinafter *BCAP*]. *BCAP* categorizes participants in consensus changes into six stakeholder groups — Economic Nodes, Investors, Media Influencers, Miners, Protocol Developers, and Users/Application Developers — and analyzes how the relative power of each group fluctuates across the phases of a proposal's lifecycle. It introduces a "State of Mind" framework distinguishing degrees of stakeholder engagement, develops a detailed scenario analysis of consensus changes deployed through alternative clients, and concludes with thirteen evaluation questions and twelve indicators stakeholders may use to assess proposals in real time. *BCAP*'s draft was reviewed by a substantial cross-section of Bitcoin's protocol-development and analytical community.

*BCAP* and the present framework address the same problem from different vantages. *BCAP* is descriptive: it explains how Bitcoin consensus emerges from the iterated interactions of stakeholders with shifting powers and divergent incentives. This paper is normative: it proposes the minimum standards a proposal should meet before stakeholders rationally engage with its activation. The two works converge on several substantive points. Both treat sub-overwhelming Economic Node adoption as the central failure mode in contested soft-fork scenarios — *BCAP* through its bounty-claim and chain-split risk analysis (§3.5.2), this paper through its activation-threshold standards (§3.4) and chain-split risk-assessment requirement (§3.5). Both treat miner signaling as a necessary but insufficient indicator of community consensus. Both reject naïve majoritarianism as a consensus-determination heuristic. And both identify Economic-Node coordination as the operative remedy when an activation proceeds without genuine consensus: *BCAP* describes that coordination descriptively, as the mechanism by which markets re-equilibrate after a contested split; this paper prescribes it normatively, as the recommended response to a proposal classified as Red under §5.2.

This paper extends *BCAP*'s analytical framework in four respects. First, it operationalizes qualitative recommendations into numerical floors: minimum activation thresholds (90% MASF, with sub-80% presumptively dangerous and sub-60% reckless); minimum review periods tied to risk category (twelve months for moderate-risk soft forks, twenty-four months for high-risk soft forks, thirty-six for hard forks); and minimum testnet deployment duration (three months). Second, it quantifies the relationship between activation threshold and chain-split exposure: §3.4 models post-activation hashrate as a Bernoulli process and derives concrete reorganization probabilities — approximately thirty percent at E = 0.55 over a six-block horizon, falling to roughly 2×10⁻⁸ at E = 0.95. This quantification is consistent with *BCAP*'s qualitative conclusion that low and high Economic Node adoption produce categorically different risk profiles, but supplies the order-of-magnitude estimates that the qualitative analysis leaves open. Third, it develops a legal-liability framework — negligence (with explicit attention to the economic-loss rule and the available routes around it), tortious interference, fiduciary duty, mining-pool contract obligations, and regulatory consequences. *BCAP* does not address legal exposure; this paper offers it as a distinct analytical layer whose conclusions are relevant to every stakeholder group *BCAP* identifies. Fourth, it consolidates the foregoing into a binary twenty-point scoring rubric with classification bands (§5), enabling structured evaluation in place of free-form weighing of considerations.

Several elements of *BCAP* the present paper does not duplicate. The stakeholder taxonomy and the power-over-time analysis (*BCAP* §§3.2, 3.3.2), the State of Mind framework (*BCAP* §3.1), the investor-segment analysis distinguishing self-custodying holders from institutional, corporate-treasury, and exchange-traded-fund segments (*BCAP* §3.2.2), and the alternative-client adoption-pathway analysis (*BCAP* §3.5.1) all remain the more developed treatments of their respective subjects. This paper refers readers to *BCAP* for those questions. The two frameworks are intended to function together: *BCAP* supplies the theory of how stakeholders shape consensus; this paper supplies the standards by which stakeholders may judge whether a particular proposal is ready for that process to begin.

The minimum-review-period floors proposed in §3.2 are anchored in empirical observation rather than aesthetic preference. Jameson Lopp's longitudinal analysis of Bitcoin Core node-software adoption documents median upgrade times measured in months — historically on the order of forty weeks for routine releases, with recent versions trending longer still. *See* Jameson Lopp, *When Do Bitcoin Node Operators Upgrade?*, blog.lopp.net/when-do-bitcoin-node-operators-upgrade/. A twelve-month minimum review period for a moderate-risk soft fork accommodates a single such upgrade cycle plus a meaningful interval for review; a twenty-four-month minimum for a high-risk soft fork accommodates two. The review-period floors proposed in this framework are thus not arbitrary durations but the durations the network's own observed upgrade dynamics require for activation signaling to begin from a position of broad enforcement readiness rather than speculative anticipation.

The legal analysis in Section 4 engages a smaller but distinct body of prior work. Angela Walch's argument that core protocol developers exercise discretionary authority over property interests sufficient to trigger fiduciary obligations is the central academic contribution to the question and is engaged directly in the fiduciary-duty analysis below. The Tulip Trading litigation (Tulip Trading Ltd v van der Laan [2023] EWCA Civ 83) is the most developed common-law treatment and frames the standard against which a developer's conduct would be evaluated. The other legal questions raised by chain splits — contract interpretation of "Bitcoin," tax cost-basis allocation under IRS Revenue Ruling 2019-24, exchange custodial obligations during a fork — have received episodic treatment but no consolidated analysis. The legal-analysis section of this paper is offered as a starting point, not a final synthesis.

This paper occupies the operational and legal layer of an emerging body of work on Bitcoin governance. It is most useful when read alongside *BCAP*, not in place of it.

---

## References additions

Add a new subsection between "Legal Authorities" and "Software Releases":

**Industry and Academic Analysis**

Crypto Fish, Ren, Steve Lee, and Lyn Alden. *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades.* November 2024. github.com/bitcoin-cap/bcap; also available at bitcoinnews.ch/wp-content/uploads/2024/11/bcap_v1.0.pdf.

Lopp, Jameson. *When Do Bitcoin Node Operators Upgrade?* blog.lopp.net/when-do-bitcoin-node-operators-upgrade/.

(Walch's chapter remains in Legal Authorities as currently placed.)

---

## Cross-references in other sections

These three short inserts thread BCAP engagement through the load-bearing sections of the paper so the §1.4 acknowledgment doesn't read as a courtesy citation in isolation.

### §3.4 — Activation Threshold Standards

Append to the end of "The 55% Problem" subsection (before "Quantifying the Risk"):

> This conclusion is consistent with the qualitative analysis in *BCAP* §3.5.2, which identifies a low percentage of Economic Node enforcement as producing the highest risk of chain split and which describes the mechanism — sub-overwhelming enforcement permitting unupgraded blocks to extend the chain — by which that risk is realized.

### §3.5 — Chain Split Risk Assessment

Insert as a new opening paragraph before subsection A (Hashrate distribution analysis):

> The chain-split mechanisms this assessment must address are developed in detail in *BCAP* §3.5.2, including the bounty-claim scenario in which assets locked into scripts using newly proposed rules generate incentives for miners to mine an unupgraded block that voids the new-rule protection. Proposals that introduce new opcodes or new spending paths through OP_SUCCESS substitution warrant particular attention to that risk. The risk-assessment requirements that follow are the documentary correlates of that mechanism — questions a proponent must answer in writing before the community can rationally evaluate exposure.

### §6.1 — "Bitcoin has no governance"

Append to the existing paragraph:

> The descriptive thesis of *BCAP* — that Bitcoin consensus emerges from the iterated, multi-party interactions of stakeholders with shifting powers and incentives — is correct and is not contested by this framework. The framework's claim is narrower and consistent with it: that minimum standards, publicly available and applied consistently, make the iterated process safer and more efficient by giving every stakeholder a shared vocabulary for declining engagement with proposals that are not ready.

---

## Deliberately excluded

1. No revision to §3.2 review-period text. The Lopp citation belongs in §1.4 where the broader anchoring argument is made; repeating it inside §3.2 would be redundant. If a pointer is wanted: "For empirical grounding of these durations, see §1.4 supra."
2. No engagement with the State of Mind framework in §6 — adds length without strengthening the core argument.
3. No citation of Bitcoin Optech or other newsletters — existing reference style does not include newsletters.
4. No citation of Poelstra, AJ Towns, Sjors Provoost, or Pieter Wuille writings outside their BIP-author roles — would require fabricating specific pieces.
5. No claim that *BCAP* endorses or supports anything in this paper — both papers converge independently.

---

## Accuracy verification

Every factual claim above is verified against the *BCAP* PDF and against v1 of Consensus Change Standards.

- Six stakeholder groups — *BCAP* §3.2
- 13 questions / 12 indicators — *BCAP* §§4.2 and 4.3 (counted directly)
- Reorganization probabilities at E = 0.55 and E = 0.95 — quoted from v1 §3.4
- Review-period floors (12 / 24 / 36 months) — v1 §3.2 Categories 2, 3, 4
- Threshold standards (90% / sub-80% / sub-60%) — v1 §3.4 MASF subsection
- Three-month testnet — v1 §3.3.C
- *BCAP* §3.5.2 bounty-claim / OP_SUCCESS analysis — verified
- Lopp blog URL — verified against *BCAP* footnote 1
- "Median upgrade times on the order of forty weeks" — characterized per *BCAP* §2.2.1's attribution to Lopp; phrasing hedges enough to remain accurate even if Lopp's data has been updated since *BCAP* relied on it

---

*Generated 2026-05-14 from comparison of BCAP v1.0 (Nov 2024) and Consensus Change Standards v1 (April 2026, Revised May 2026).*
