# v2 Changes — Consensus Change Standards, Second Edition (May 2026)

**Status:** Master change document. Every v2 modification to the First Edition (`consensus_change_standards.docx`) is specified here with before/after text. Applied via Word COM script (`References/_build_v2.ps1`); this document is the canonical source if any script-applied edit needs review.

**Decisions made in this revision cycle (override-able by author):**
- Version: **Second Edition · May 2026**
- §3.7 subtype 4a deployment-horizon floor: **5 years** (anchored to Lopp's upgrade-rate analysis)
- §3.7 subtype 4b scoring approach: **separate short checklist** (harder to game than shared overrides)
- §6.7 rule-lawyering: **folded into §6.6** (single dialectic subsection)
- §4.0 defensive preface: tentative — may refine after Chervinsky's Tier 2 read

---

## Edit 1 — Title page version line

**Location:** Title page block (currently reads "First Edition — April 2026 (Revised May 2026)")

**Before:**
> First Edition — April 2026 (Revised May 2026)

**After:**
> Second Edition — May 2026

**Location 2:** Closing publication line at end of Section 7 Conclusion / before References

**Before:**
> Published by The Forum Press, a Fulks, Inc. company | April 2026 · Revised May 2026

**After:**
> Published by The Forum Press, a Fulks, Inc. company | Second Edition · May 2026

---

## Edit 2 — Insert new §1.0 "How to Read This Paper" before §1.1

**Location:** Insert immediately before the heading "1.1 The Absence of Standards"

**New content:**

> **1.0 How to Read This Paper**
>
> The framework proposed here is not an attempt to centralize authority over Bitcoin consensus. It is an attempt to give Bitcoin's existing decentralized governance process a shared vocabulary for evaluating proposals.
>
> The framework evaluates the ecosystem behavior surrounding a consensus-change proposal — the activation clients built around it, the review process applied to its code, the support evidence assembled in its favor, and the operational coordination preceding any deployment. It does not evaluate, and cannot evaluate, the editorial status of any BIP document. A BIP is a proposal; this framework asks which proposals merit activation, not which proposals merit filing.
>
> Readers concerned with the question of authority itself — who decides? what makes one threshold "wrong" and another "right"? — are encouraged to read §6.2 and §6.4 before §3. The framework is a tool, not a rule; if that distinction does not hold for a given reader, the standards that follow will read as something they are not.
>
> Different sections serve different audiences. Protocol developers will find §3 and §5 most directly applicable. Businesses, exchanges, and custodians will find §3.5 and §4 most operationally relevant. Node operators and users will find §6 most useful for evaluating what the framework asks of them and what it does not.

---

## Edit 3 — Append §1.2 forward-reference paragraphs (before §1.3)

**Location:** Immediately before the heading "1.3 The Stakes"

**New content:**

> The "BIP-110" addressed throughout this paper refers to the activation attempt — the RDTS client, the surrounding ecosystem campaign, and the operational coordination assembled around the proposal — not to the BIP-110 document filed in the BIPs repository. A BIP is a proposal; the framework's evaluative scope is the ecosystem behavior that would convert a proposal into network state.
>
> The question of how any single threshold could be "set" in a network with no central authority is foundational and is addressed in §6.2 and §6.4. The short answer: it cannot, in any binding sense. BIP-110's proponents proposed 55%; whether the network adopted it was determined by tens of thousands of independent operator decisions, which collectively yielded ≤0.15% signaling (peak observed share of blocks signaling readiness during the activation window).

---

## Edit 4 — Insert new §1.4 "Relation to Prior Work"

**Location:** After the last paragraph of §1.3 ("Fortune is not a governance strategy."), before "SECTION 2: HISTORICAL PRECEDENT"

**New content (from `v2_prior_work_draft.md` §1.4):**

> **1.4 Relation to Prior Work**
>
> The framework proposed in this paper builds on, and is intended to be read alongside, the most developed prior analysis of Bitcoin's consensus-change dynamics: Ren Crypto Fish, Steve Lee & Lyn Alden, *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades* (Nov. 2024) [hereinafter *BCAP*]. *BCAP* categorizes participants in consensus changes into six stakeholder groups — Economic Nodes, Investors, Media Influencers, Miners, Protocol Developers, and Users/Application Developers — and analyzes how the relative power of each group fluctuates across the phases of a proposal's lifecycle. It introduces a "State of Mind" framework distinguishing degrees of stakeholder engagement, develops a detailed scenario analysis of consensus changes deployed through alternative clients, and concludes with thirteen evaluation questions and twelve indicators stakeholders may use to assess proposals in real time. *BCAP*'s draft was reviewed by a substantial cross-section of Bitcoin's protocol-development and analytical community.
>
> *BCAP* and the present framework address the same problem from different vantages. *BCAP* is descriptive: it explains how Bitcoin consensus emerges from the iterated interactions of stakeholders with shifting powers and divergent incentives. This paper is normative: it proposes the minimum standards a proposal should meet before stakeholders rationally engage with its activation. The two works converge on several substantive points. Both treat sub-overwhelming Economic Node adoption as the central failure mode in contested soft-fork scenarios — *BCAP* through its bounty-claim and chain-split risk analysis (§3.5.2), this paper through its activation-threshold standards (§3.4) and chain-split risk-assessment requirement (§3.5). Both treat miner signaling as a necessary but insufficient indicator of community consensus. Both reject naïve majoritarianism as a consensus-determination heuristic. And both identify Economic-Node coordination as the operative remedy when an activation proceeds without genuine consensus: *BCAP* describes that coordination descriptively, as the mechanism by which markets re-equilibrate after a contested split; this paper prescribes it normatively, as the recommended response to a proposal classified as Red under §5.2.
>
> This paper extends *BCAP*'s analytical framework in four respects. First, it operationalizes qualitative recommendations into numerical floors: minimum activation thresholds (90% MASF, with sub-80% presumptively dangerous and sub-60% reckless); minimum review periods tied to risk category (twelve months for moderate-risk soft forks, twenty-four months for high-risk soft forks, thirty-six for hard forks); and minimum testnet deployment duration (three months). Second, it quantifies the relationship between activation threshold and chain-split exposure: §3.4 models post-activation hashrate as a Bernoulli process and derives concrete reorganization probabilities — approximately thirty percent at E = 0.55 over a six-block horizon, falling to roughly 2×10⁻⁸ at E = 0.95. This quantification is consistent with *BCAP*'s qualitative conclusion that low and high Economic Node adoption produce categorically different risk profiles, but supplies the order-of-magnitude estimates that the qualitative analysis leaves open. Third, it develops a legal-liability framework — negligence (with explicit attention to the economic-loss rule and the available routes around it), tortious interference, fiduciary duty, mining-pool contract obligations, and regulatory consequences. *BCAP* does not address legal exposure; this paper offers it as a distinct analytical layer whose conclusions are relevant to every stakeholder group *BCAP* identifies. Fourth, it consolidates the foregoing into a binary twenty-point scoring rubric with classification bands (§5), enabling structured evaluation in place of free-form weighing of considerations.
>
> Several elements of *BCAP* the present paper does not duplicate. The stakeholder taxonomy and the power-over-time analysis (*BCAP* §§3.2, 3.3.2), the State of Mind framework (*BCAP* §3.1), the investor-segment analysis distinguishing self-custodying holders from institutional, corporate-treasury, and exchange-traded-fund segments (*BCAP* §3.2.2), and the alternative-client adoption-pathway analysis (*BCAP* §3.5.1) all remain the more developed treatments of their respective subjects. This paper refers readers to *BCAP* for those questions. The two frameworks are intended to function together: *BCAP* supplies the theory of how stakeholders shape consensus; this paper supplies the standards by which stakeholders may judge whether a particular proposal is ready for that process to begin.
>
> The minimum-review-period floors proposed in §3.2 are anchored in empirical observation rather than aesthetic preference. Jameson Lopp's longitudinal analysis of Bitcoin Core node-software adoption documents median upgrade times measured in months — historically on the order of forty weeks for routine releases, with recent versions trending longer still. *See* Jameson Lopp, *When Do Bitcoin Node Operators Upgrade?*, blog.lopp.net/when-do-bitcoin-node-operators-upgrade/. A twelve-month minimum review period for a moderate-risk soft fork accommodates a single such upgrade cycle plus a meaningful interval for review; a twenty-four-month minimum for a high-risk soft fork accommodates two. The review-period floors proposed in this framework are thus not arbitrary durations but the durations the network's own observed upgrade dynamics require for activation signaling to begin from a position of broad enforcement readiness rather than speculative anticipation.
>
> The legal analysis in Section 4 engages a smaller but distinct body of prior work. Angela Walch's argument that core protocol developers exercise discretionary authority over property interests sufficient to trigger fiduciary obligations is the central academic contribution to the question and is engaged directly in the fiduciary-duty analysis below. The Tulip Trading litigation (Tulip Trading Ltd v van der Laan [2023] EWCA Civ 83) is the most developed common-law treatment and frames the standard against which a developer's conduct would be evaluated. The other legal questions raised by chain splits — contract interpretation of "Bitcoin," tax cost-basis allocation under IRS Revenue Ruling 2019-24, exchange custodial obligations during a fork — have received episodic treatment but no consolidated analysis. The legal-analysis section of this paper is offered as a starting point, not a final synthesis.
>
> This paper occupies the operational and legal layer of an emerging body of work on Bitcoin governance. It is most useful when read alongside *BCAP*, not in place of it.

---

## Edit 5 — Replace §3.1.E (rollback procedure narrowing per Murch Critique 4)

**Location:** §3.1 item E

**Before:**
> E. Rollback Procedure. A defined procedure for deactivating the change if it produces unintended consequences. For proposals described as "temporary," this must include a self-executing sunset mechanism that does not require further community coordination to trigger.

**After:**
> E. Rollback Procedure. For proposals self-described as "temporary," a self-executing sunset mechanism is required (see §3.6). For other soft-fork proposals, no rollback procedure is required, but the proposal should not affirmatively obstruct future reversal — the consensus rules should remain technically reversible via standard soft-fork or hard-fork mechanisms.

---

## Edit 6 — Replace §3.3.A (diversity rewrite per Lopp Critique 3)

**Location:** §3.3 item A

**Before:**
> A. Independent review. The reference implementation must be reviewed by a minimum of three developers who are not affiliated with the proposal's authors. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation.

**After:**
> A. Diverse independent review. The reference implementation must be reviewed by a minimum of three developers whose primary organizational affiliations differ from each other and from the proposal's authors. "Organizational affiliation" for this purpose means current or recent (past 24 months) employer or material funding source. Reviewers must publicly disclose any prior collaboration with the proposal's authors — co-authorship on prior BIPs or papers, joint employment, or shared funding. Disclosure does not disqualify; it makes the relationship legible. The standard is diverse independent perspectives, not pristine isolation, which is unachievable in a small developer community and weaponizable when claimed. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation.

---

## Edit 7 — Replace §3.3.E (reviewer comprehension reframe per Lopp Critique 4)

**Location:** §3.3 item E

**Before:**
> E. No AI-generated code without disclosure and review. The use of AI coding assistants in developing activation clients is not inherently problematic, but it must be disclosed and the resulting code must receive heightened scrutiny. AI-generated code in consensus-critical software is analogous to AI-generated legal filings — the tool can accelerate production, but the professional remains responsible for the output's correctness.

**After:**
> E. Reviewer comprehension. Every change to consensus-critical code must be reviewed by at least one named human reviewer who publicly attests that they understand the change and can defend its correctness against technical challenge. This requirement applies regardless of the code's origin — whether authored by humans, generated by AI tools, or adapted from prior proposals. AI-generated code in consensus-critical software is analogous to AI-generated legal filings: the tool can accelerate production, but the professional remains responsible for the output's correctness. The framework does not attempt to police the origin of code, which is undetectable on inspection; it requires the comprehension of code by named accountable reviewers, which is testable in any review forum. Authors and reviewers are welcomed to disclose AI involvement voluntarily as a matter of transparency, but the load-bearing requirement is reviewer comprehension, not origin disclosure.

---

## Edit 8 — Append BCAP cross-reference to §3.4 "The 55% Problem"

**Location:** Append to the end of the "The 55% Problem" subsection (after "The standards must change with them.") and before the "Quantifying the Risk" subsection heading.

**New content:**

> This conclusion is consistent with the qualitative analysis in *BCAP* §3.5.2, which identifies a low percentage of Economic Node enforcement as producing the highest risk of chain split and which describes the mechanism — sub-overwhelming enforcement permitting unupgraded blocks to extend the chain — by which that risk is realized.

---

## Edit 9 — Update §3.4 BIP-148 framing per Lopp Affirmation 1

**Location:** §3.4 Activation Mechanism Design Space → BIP-148 paragraph

**Before:**
> BIP-148 (User Activated Soft Fork). A flag-day mechanism: BIP-148-enforcing nodes would begin rejecting non-SegWit-signaling blocks on August 1, 2017, regardless of miner readiness. BIP-148 transferred activation authority from miners to economic nodes. Its credible threat is widely credited with motivating the miner capitulation that produced BIP-91. The mechanism is structurally riskier than miner-activated alternatives — if miners refuse to comply, the BIP-148 chain splits from the legacy chain — and is appropriate only where the underlying proposal has overwhelming economic support.

**After:**
> BIP-148 (User Activated Soft Fork). A flag-day mechanism: BIP-148-enforcing nodes would begin rejecting non-SegWit-signaling blocks on August 1, 2017, regardless of miner readiness. BIP-148 transferred activation authority from miners to economic nodes. BIP-148 worked because overwhelming community support produced miner capitulation; the mechanism's credible threat is widely credited with motivating the capitulation that produced BIP-91. UASF without that prior support yields the BIP-110 outcome. The mechanism is structurally riskier than miner-activated alternatives — if miners refuse to comply, the BIP-148 chain splits from the legacy chain — and is appropriate only where the underlying proposal has overwhelming economic support.

---

## Edit 10 — Update §3.4 LOT discussion per Murch Critique 5

**Location:** §3.4 Activation Mechanism Design Space → LOT paragraph

**Before:**
> LOT=true / LOT=false. A parameter that arose in BIP-8 during Taproot's activation debates. Lockin On Timeout (LOT) specifies whether a deployment that fails to achieve miner signaling within its window should nevertheless activate by user mandate at timeout. LOT=true converts a deployment into an effective UASF if miners do not cooperate; LOT=false makes it a clean Speedy Trial-style timeout. The LOT debate of early 2021 surfaced the central question of every activation mechanism: who holds final authority over consensus rule changes, and what happens when they disagree?

**After:**
> LOT=true / LOT=false. A parameter that arose in BIP-8 during Taproot's activation debates. Lockin On Timeout (LOT) specifies whether a deployment that fails to achieve miner signaling within its window should nevertheless activate by user mandate at timeout. LOT=true converts a deployment into an effective UASF if miners do not cooperate; LOT=false makes it a clean Speedy Trial-style timeout. LOT=true is unreliable in a first attempt and disfavored even on repeat attempts. The LOT debate of early 2021 surfaced the central question of every activation mechanism: who holds final authority over consensus rule changes, and what happens when they disagree?

---

## Edit 11 — Insert BCAP cross-reference at start of §3.5

**Location:** §3.5 Chain Split Risk Assessment — insert as new opening paragraph after the section heading and before "Every consensus change proposal should include..." (the existing first paragraph).

Actually, per `v2_prior_work_draft.md`: insert **before subsection A** (hashrate distribution analysis). The cleanest placement: insert immediately after the existing opening paragraph ("Every consensus change proposal should include a formal chain split risk assessment addressing, at minimum:") and before "A. Hashrate distribution analysis".

**New content:**

> The chain-split mechanisms this assessment must address are developed in detail in *BCAP* §3.5.2, including the bounty-claim scenario in which assets locked into scripts using newly proposed rules generate incentives for miners to mine an unupgraded block that voids the new-rule protection. Proposals that introduce new opcodes or new spending paths through OP_SUCCESS substitution warrant particular attention to that risk. The risk-assessment requirements that follow are the documentary correlates of that mechanism — questions a proponent must answer in writing before the community can rationally evaluate exposure.

---

## Edit 12 — Replace §3.5.C (replay protection light reframe per Lopp Critique 5)

**Location:** §3.5 item C

**Before:**
> C. Replay protection. If a chain split occurs, does the proposal include replay protection to prevent transactions from being valid on both chains? If not, what is the expected impact on users who are unaware of the split?

**After:**
> C. Replay protection. If the proposal would require explicit replay protection to prevent transactions from being valid on both chains in the event of a split, the proposal has crossed into hard-fork territory under Category 4 (see §3.7 on hard-fork subtypes) — reassess the classification before continuing the chain-split risk assessment. If the proposal is a soft fork that cannot produce a chain split absent miner defection, document the rationale for the absence of replay protection and address the expected impact on users in the residual miner-defection scenario.

---

## Edit 13 — Append diagnostic framing to Category 4 (Hard Forks)

**Location:** End of the existing Category 4 (Hard Forks) paragraph in §3.2, after "...has historically left proponents free to define their own."

**New content (append as a new paragraph):**

> The necessity of replay protection is itself the diagnostic of hard-fork status. A proposal whose safe deployment requires the ecosystem to modify its transaction format to prevent cross-chain replay has, by that requirement, made the case for its hard-fork classification — and should be evaluated against the standards of this category rather than treated as a soft fork with a safety net bolted on. The standards that follow in §3.7 distinguish between scheduled and emergency hard forks, which have opposite governance properties despite sharing this category.

---

## Edit 14 — Insert new §3.7 "Hard Fork Subtypes: Scheduled vs. Emergency"

**Location:** Insert immediately after §3.6 (the last sentence of §3.6 is "It is permanent with a stated aspiration.") and before "SECTION 4: LEGAL ANALYSIS"

**New content:**

> **3.7 Hard Fork Subtypes: Scheduled vs. Emergency**
>
> Category 4 (Hard Forks) is treated by the framework's general standards as a single category requiring the highest scrutiny. In practice, hard forks fall into two extremes with opposite governance properties, and a single set of standards cannot accommodate both. The framework therefore distinguishes them: subtype 4a, the *scheduled* hard fork, and subtype 4b, the *emergency* hard fork. Each carries its own standards. The Category 4 text gestures at the emergency case by example ("a critical security vulnerability discovered in the deployed protocol") but, applied uniformly, would impose a thirty-six-month review period on a vulnerability that cannot wait three years. The subtype distinction resolves that tension.
>
> **4a — Scheduled Hard Fork.** A scheduled hard fork has a deployment horizon measured in years from initial proposal to activation. The defining property is that time is the principal asset: organic node-upgrade cycles can do most of the coordination work if the deployment window is long enough. Empirical analysis of historical node-upgrade rates (see §1.4) suggests that windows of approximately five years or longer produce near-universal upgrade in the absence of active opposition. A scheduled hard fork that takes advantage of this property can be deployed with substantially less coordination burden than an accelerated hard fork attempt, because the upgrade arrives organically through routine maintenance cycles.
>
> The standards for subtype 4a follow Category 4 generally, with refinements:
>
> A. Minimum review period: five years from publication of a complete technical specification and reference implementation. This is longer than Category 3's twenty-four-month floor; the additional review window reflects the deployment horizon's premium on getting the change right the first time.
>
> B. Broad consensus required prior to code freeze, not merely prior to activation. The deployment window operates only as designed if the code shipped at the start of the window is the code that will be enforced at the end.
>
> C. Explicit deployment timeline published in advance with each milestone identified: specification freeze, code freeze, infrastructure-test deployment, and mainnet activation block height.
>
> D. Replay protection may be unnecessary if the upgrade window genuinely absorbs the change — that is, if the organic upgrade rate at the activation height is sufficient that no meaningful minority continues to enforce the prior rules. Replay protection becomes necessary only if the active-coordination component re-enters as a fallback.
>
> **4b — Emergency Hard Fork.** An emergency hard fork is triggered by a critical vulnerability or imminent failure mode in the deployed protocol that cannot wait for a multi-year deployment window. Examples include the 2013 chain split that produced BIP-50, an inflation bug analogous to CVE-2018-17144 for which the soft-fork mitigation path is unavailable, or a cryptographic primitive becoming compromised in a way that affects existing UTXOs. The defining property is that time is the principal enemy: the alternative to a fast hard fork is running broken software.
>
> The standards for subtype 4b are not lenient versions of Category 4's standards. They are different standards, calibrated to a different problem. Imposing the scheduled-HF standards on an emergency case would be actively dangerous; imposing the emergency standards on a scheduled case would be reckless. The 4b standards are:
>
> A. Documented evidence of the trigger. The proposal must identify the specific failure mode, the timeline within which the failure becomes operational, and the technical basis for the timeline. "Critical vulnerability" without published technical detail is not sufficient.
>
> B. Compressed expert-led review. The review timeline is calibrated to the threat. The standards of §3.3 (Code Audit Requirements) apply — at least three reviewers from distinct organizational affiliations, named human comprehension attestation, testnet deployment — and the required duration is the minimum that allows these standards to be satisfied, typically weeks to months depending on the threat's timeline.
>
> C. Near-unanimous infrastructure coordination at the activation moment. Major exchanges, custodians, payment processors, and mining pools must commit to the activation timeline together. Soft commitments are insufficient; the coordination must be sufficient that a chain split does not produce a viable competing chain.
>
> D. Replay protection where a meaningful minority will continue running the prior rules. In emergency-HF cases, the choice not to upgrade is itself often a principled position — an operator who disagrees that the trigger justifies the fork — and the prior-rules chain may persist with non-trivial economic activity. Replay protection in this scenario is not a category error; it is necessary user protection.
>
> E. Transparent post-hoc disclosure of the decision process. The compressed timeline necessarily limits the breadth of pre-deployment consultation. The legitimacy of an emergency hard fork is established afterward by publishing what was decided, by whom, on what evidence, and with what dissents — making the process accountable in retrospect even where it could not be open in real time.
>
> The framework does not anticipate emergency hard forks being common. Bitcoin's deployed protocol is exceptionally well-reviewed, and the post-2009 record contains no inflation-bug-level emergencies that required this path. BIP-50 itself was resolved by a coordinated downgrade, not a hard fork. The recognition of subtype 4b is the framework's acknowledgment that some governance needs are inverted under emergency conditions — not that emergency conditions suspend governance. The standards above exist to make the emergency case legible and challengeable, in the same way that the scheduled-HF standards make the planned case legible and challengeable.

---

## Edit 15 — Insert new §4.0 "Purpose of the Legal Analysis" before §4.1

**Location:** Immediately after the existing opening paragraph of Section 4 ("...These regulatory consequences are not hypothetical...") — actually before §4.1 Negligence. The cleanest placement: after the SECTION 4 heading and existing introductory paragraph, before §4.1.

Reviewing the source: Section 4 opens with: "The legal implications of Bitcoin consensus changes are largely unexplored. This is partly because Bitcoin's decentralized nature complicates the application of traditional legal frameworks, and partly because no chain split has yet produced litigation with reported opinions. But the absence of precedent does not mean the absence of liability. The following analysis applies established tort and contract principles to the specific risks created by reckless consensus change activation."

The §4.0 preface should sit between that intro and §4.1 Negligence.

**New content:**

> **4.0 Purpose of the Legal Analysis**
>
> This section analyzes the legal-risk landscape that already exists, whether developers acknowledge it or not. It is not an invitation to litigation. It is a map of the terrain — drawn so that participants, including developers, can navigate it with informed caution rather than unknowing exposure.
>
> A developer who follows the standards proposed in Section 3 has a strong defense against every theory analyzed below. The legal analysis is best read in that light: as a description of what good-faith developers can demonstrate they have met, not as a catalog of theories under which they might be pursued. Section 3 is the safety standard; Section 4 is the case for why following the standard is itself the most effective protection against the liability theories that already exist in tort and contract law.
>
> This section serves the network as a whole by making the legal landscape legible to every stakeholder — operators, exchanges, custodians, and developers — who must navigate it without specialized training. Litigation against developers acting in good faith would harm the protocol and the community; the framework's purpose is to make such litigation less likely by establishing a documented standard of care that good-faith developers can demonstrably satisfy.

---

## Edit 16 — Replace §5.1 criterion 6 (diversity-aware)

**Location:** §5.1 Section B Code Quality, criterion 6

**Before:**
> 6. Has the reference implementation been reviewed by at least three independent developers with demonstrated Bitcoin protocol expertise?

**After:**
> 6. Has the reference implementation been reviewed by at least three developers with demonstrated Bitcoin protocol expertise, drawn from distinct organizational affiliations, with any prior collaboration with the proposal's authors publicly disclosed?

---

## Edit 17 — Replace §5.1 criterion 10 (comprehension-based)

**Location:** §5.1 Section B Code Quality, criterion 10

**Before:**
> 10. If AI coding tools were used, has this been disclosed and has the code received heightened review?

**After:**
> 10. Has every change to consensus-critical code been attested as understood by at least one named human reviewer who can defend its correctness?

---

## Edit 18 — Insert new §5.3 "On the Measurability of the Criteria"

**Location:** Immediately after §5.2 Scoring (which ends with the BIP-110 and Taproot scoring example) and before "SECTION 6: OBJECTIONS AND RESPONSES"

**New content:**

> **5.3 On the Measurability of the Criteria**
>
> Several criteria in §5.1 — particularly those concerning broad community support, sustained opposition, and adequate review — are not amenable to mechanical measurement. There is no canonical metric for "broad support among economic nodes" or "sustained public objection" or "discussion in a diverse cross-section of the community." Reasonable evaluators can score the same proposal differently.
>
> This is intentional. The framework's authority is its defensibility, not its precision. A score arrived at by counting blocks or polling exchanges would be precise but easily gamed; a score arrived at by transparent evaluation against published criteria, where reviewers must justify their scoring choices, is defensible against challenge in a way that algorithmic scoring cannot be. The fuzzy criteria force the conversation onto the right ground: what counts as evidence of broad support? What counts as sustained opposition? Who has objected, and have those objections been addressed? Those questions are themselves what the framework is asking the community to think about systematically.
>
> For the fuzziest criteria, the following heuristics are illustrative anchors — not algorithmic rules. A proposal that satisfies the spirit of the criterion may not satisfy the literal heuristic and vice versa; the heuristic is a starting point for evaluators, not a substitute for evaluation.
>
> "Broad support among economic nodes" (criterion 18) is reasonably evidenced by explicit public statements supporting the proposal from at least three of the top five exchanges by Bitcoin trading volume, plus comparable statements from at least two custodians serving institutional clients. Statements specifically endorsing the consensus change — not merely acknowledging it — count; silence does not count as support.
>
> "Sustained opposition" (a factor in §3.4 threshold selection) is reasonably evidenced by at least two prior public objections from independent stakeholders that have not been substantively addressed in subsequent proposal updates. "Independent" for this purpose follows the diverse-affiliation standard of §3.3.A: objectors should not all share the same employer or material funding source.
>
> "Adequate community discussion" (criterion 17) is reasonably evidenced by archived discussion in at least two distinct venues over the full minimum review period for the proposal's risk category — typically the bitcoin-dev mailing list plus at least one of: a public forum thread, a recorded video discussion, or a working group with published minutes.
>
> These heuristics are illustrative because the framework's binary scoring is meant to be defensible against challenge, not bright-line. A reviewer who scores a criterion "met" using a different evidentiary basis than the heuristic above can defend that scoring by publishing the basis. A reviewer who scores a criterion "not met" can do the same. What the framework asks is not algorithmic agreement; it is that scoring choices be legible and challengeable. That is what makes the resulting evaluation defensible in any forum — technical, commercial, or legal — where the proposal's readiness must be assessed.

---

## Edit 19 — Append BCAP cross-reference to §6.1

**Location:** §6.1 "Bitcoin has no governance." — append to the existing paragraph after "...minimum standards for evaluating proposals within Bitcoin's existing decentralized governance structure."

**New content (append):**

> The descriptive thesis of *BCAP* — that Bitcoin consensus emerges from the iterated, multi-party interactions of stakeholders with shifting powers and incentives — is correct and is not contested by this framework. The framework's claim is narrower and consistent with it: that minimum standards, publicly available and applied consistently, make the iterated process safer and more efficient by giving every stakeholder a shared vocabulary for declining engagement with proposals that are not ready.

---

## Edit 20 — Insert new §6.6 (dialectic addressing Murch Critique 2 + Lopp Affirmation 1; folds Murch Critique 6 rule-lawyering)

**Location:** Immediately after §6.5 "The legal analysis is speculative." (which ends with "This paper offers an analysis, not a prediction.") and before "SECTION 7: CONCLUSION"

**New content:**

> **6.6 "If the standards are not enforceable, what does the framework add?"**
>
> This objection has two forms. The strong form: a benign proposal would already meet the framework's criteria, and an ill-considered proposal will be resisted by the same stakeholders for the same reasons whether the framework exists or not — so the framework adds nothing operational. The weak form: the framework may *legitimize* rule-lawyering — proposals that satisfy the criteria in form but not in spirit.
>
> The strong form misreads where the framework's value sits. The value is not in *creating* coordinated resistance to ill-considered proposals — that coordination exists, however imperfectly, in the form of Bitcoin's distributed governance. BIP-110's failure to attract more than 0.15% of signaling demonstrates the existing coordination's capacity. The framework's value is in *lowering the coordination cost* of principled refusal. Without the framework, every individual stakeholder objection requires custom argumentation: an exchange operator who refuses to recognize a chain must justify the refusal from first principles, against the rhetorical pressure of proponents who can frame the refusal as arbitrary. With the framework, "this proposal fails criteria 1, 8, 11, and 14" is a complete justification: cheap to invoke, costly to rebut. Distributed enforcement works — BIP-110's failure is the existence proof — but it works at a cost. The framework lowers that cost without claiming authority it does not have.
>
> This matters most at the margins, where stakeholders are uncertain whether their objection rises to the level of public dissent. A single skeptical infrastructure operator, holding the framework's criteria, can invoke it without first organizing a coalition. The framework converts what would otherwise be a coordination problem — every stakeholder waiting to see whether others will refuse — into a documentation problem: anyone can point to the criteria and say *here is the standard; here is the gap*. The credibility of the resulting refusal does not depend on the refuser's individual standing but on the criteria's defensibility.
>
> The weak form — that the framework legitimizes rule-lawyering — assumes that a proposal which games the letter of the criteria thereby earns approval. It does not. Binary criteria and classification bands leave judgment intact; partial gaming is itself progress (a rule-lawyered proposal is at least *better documented* than an ad-hoc one); the framework can be revised adversarially as bad-faith actors expose loopholes; and §5.2's Red classification remains available for proposals that satisfy the letter but fail the spirit — which is itself observable evidence in the scoring record.
>
> A more honest statement of the weak form is: any standard can be gamed. That is true of every standard humans have ever written. It is not a reason to write none; it is a reason to write standards that produce useful documentation of the gaming when it happens. This framework does that. BIP-110, evaluated against the framework, would score 3/20 — a documented Red. That documentation, available to any stakeholder, makes a future rule-lawyered variant easier to evaluate against than the original, not harder. The framework's effect is therefore cumulative: each evaluation makes the next one more efficient, because the prior scoring is in the record.

---

## Edit 21 — Add italic caption note under §2.5 Summary of Activation Parameters table

**Location:** Immediately below the §2.5 table, before "The pattern is clear" paragraph (if present) or before §3 begins.

**New content (italic):**

> *Note: percentages in the Outcome column for stalled or failed proposals reflect the peak observed share of blocks signaling readiness for the proposal during its activation window. BIP-110's 55% lock-in threshold was never approached.*

---

## Edit 22 — Add "Industry and Academic Analysis" subsection to References

**Location:** References section, between "Legal Authorities" and "Software Releases" subsections.

**New content:**

> **Industry and Academic Analysis**
>
> Crypto Fish, Ren, Steve Lee, and Lyn Alden. *Analyzing Bitcoin Consensus: Risks in Protocol Upgrades.* November 2024. github.com/bitcoin-cap/bcap; also available at bitcoinnews.ch/wp-content/uploads/2024/11/bcap_v1.0.pdf.
>
> Lopp, Jameson. *When Do Bitcoin Node Operators Upgrade?* blog.lopp.net/when-do-bitcoin-node-operators-upgrade/.

---

## Notes for the user after v2 generation

1. **Heading styles**: Inserted subsection headings (§1.0, §1.4, §3.7, §4.0, §5.3, §6.6) may need style application to match the document's existing heading styles. Open in Word, select each new heading, apply the appropriate heading style.

2. **Cross-reference renumbering**: The new §3.7 should not affect §4 (Section 4 is already its own top-level section). The new §5.3 sits between §5.2 and §6, no renumbering required. New §6.6 sits between §6.5 and §7, no renumbering required.

3. **§1.4 footnote conversion**: The Lopp blog citation in §1.4 reads as inline citation. If the paper uses footnote-style references elsewhere, convert accordingly during the v2 visual cleanup pass.

4. **Acknowledgments block**: Not yet drafted; needs reviewer consent first. Add after consent received from Murch and Lopp.

5. **Score example update**: §5.2 currently includes "BIP-110 would score approximately 3/20" — this remains valid after v2 changes. Taproot's 18/20 also remains valid (the new comprehension criterion replaces the AI disclosure criterion at the same scoring slot).
