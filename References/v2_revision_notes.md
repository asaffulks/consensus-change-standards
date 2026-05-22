# v2 Revision Notes — Consensus Change Standards

**Purpose:** Master tracker for v2 revision. Consolidates reviewer feedback, integration plans, and open strategic questions.
**Status:** Tier 1 outreach in progress. Holding integration until Tier 1 collection completes, then revising in a single cycle with reviewer attribution.

**Related working files:**
- `v2_prior_work_draft.md` — clean drop-in §1.4 Prior Work text + References additions + three cross-references (BCAP integration, ready to deploy)
- `bcap_v1.0.pdf` — source for Prior Work integration

---

## Sequencing

1. **Tier 1 collection** — Murch ✓ (2026-05-14) · Lopp ✓ (2026-05-22) · jamesob (silent) · ajtowns (silent)
2. **After Tier 1 collected:** integrate all feedback in single v2 cycle so reviewers see fingerprints throughout. Reviewer acknowledgment is opt-in per `emails/README.md`.
3. **Tier 1 silence (10+ days) triggers Tier 2** outreach to remaining recipients (Santori, Wall, Sjors, Hasu, Chervinsky).
4. **v2 ships with item-by-item response** to each engaged reviewer; quick ack now, substantive response with v2.

---

## Section 1: BCAP / Prior Work Integration

Triggered by Lopp's 2026-05-14 pointer to BCAP (Crypto Fish, Lee & Alden, Nov 2024). Full drop-in text staged in `v2_prior_work_draft.md`. Summary of planned changes:

- **New §1.4 Relation to Prior Work** — situates the paper as the operational/legal layer alongside BCAP's descriptive game theory; cites Lopp's node-upgrade-time blog post to anchor the 12/24/36-month review-period floors empirically; engages Walch + Tulip Trading from the legal-prior-work angle.
- **New References subsection "Industry and Academic Analysis"** between Legal Authorities and Software Releases (BCAP + Lopp blog).
- **Three cross-references** in §3.4 (the 55% problem ↔ BCAP §3.5.2), §3.5 (chain-split risk assessment ↔ BCAP bounty-claim/OP_SUCCESS), §6.1 ("Bitcoin has no governance" ↔ BCAP's descriptive thesis).

---

## Section 2: Reviewer Feedback Integration

### Murch (Mark Erhardt) — Chaincode Labs / Localhost Research — received 2026-05-14

**Channel:** email (murch@murch.one)
**Tier:** 1 (must-have technical review)
**Original outreach focus:** §3.4 + §5 operational tractability
**Reply sent:** 2026-05-14 (`emails/01_murch_reply.md`) — spare signature per [[bitcoin-community-correspondence-spare]] convention
**Overall posture:** Sympathetic, substantive. Quantitative and structural core survived intact. Disagreements are framing, scope, and §4 specifically. Signed off with humor ("This is not legal advice. ;)") — relationship warm.

---

#### Critique 1 — §4 (Legal Analysis) and open-source allergic reaction

**Verbatim:**
> "Regarding Section 4, obviously IANAL, but many opensource projects react allergically to any contributors threatening other contributors with lawsuits. As reckless as the BIP110 proposal is being advanced, I would prefer if it were not necessary to come to lawsuits against developers again."

And in his conclusion:
> "I would expect that most of your write-up to be well-received by Bitcoin protocol developers (perhaps more so if published without section 4 in that context) and I could see especially Bitcoin businesses get value out of your evaluation framework."

**Significance:** Strongest strategic flag. Echoes Wright litigation + Tulip Trading developer-community memory. Real risk: protocol-dev audience reads §4 as a threat list, paper loses key audience for its operational sections.

**v2 plan — preferred path (Option A, "defensive preface"):**
- Keep §4 as core distinctive contribution (the legal layer is what no other prior work supplies)
- Add a new **§4.0 preface** explicitly positioning the legal analysis as a map of existing terrain, not advocacy for litigation
- Draft preface language (tentative):
  > "This section analyzes the legal-risk landscape that already exists, whether developers acknowledge it or not. It is not an invitation to litigation. It is a map of the terrain — drawn so that participants, including developers, can navigate it with informed caution rather than unknowing exposure. A developer who follows the standards proposed in Section 3 has a strong defense against every theory analyzed below. The legal analysis serves good-faith developers by establishing the standard of care they can demonstrate they have met; it serves the network by making the risk landscape legible to every stakeholder."
- Soften §4 conclusions to emphasize: §3 compliance is the defense; the legal analysis exists to map what good-faith developers can demonstrate they have met.
- Possibly soften §4.4 specifically (mining/pool liability) — Lopp will also be reviewing §4.4, so the framing question intersects.

**Alternatives considered (not preferred):**
- *Option B — move §4 to appendix.* Preserves contribution but reduces prominence and signals retreat.
- *Option C — two-version publish (devs without §4, businesses/lawyers with §4).* Multiplies maintenance, undermines unity of framework.

**Cross-reference notes:**
- **Lopp's review (2026-05-22):** did NOT engage §4 at all, despite §4.4 being his original outreach focus. The predicted pool-liability concern did not materialize. This is meaningful audience signal — strengthens defensive-preface path over appendix relocation. Reply (`emails/07_lopp_reply_2.md`) includes a soft follow-up ask on §4.4 in case he has a deferred view; not pressing.
- **Chervinsky (Tier 2)** remains the key outstanding cross-perspective — regulatory lawyer with opposite vantage on §4. Worth holding final §4.0 preface language until his read lands.
- **jamesob review:** §4 may or may not surface depending on his focus (his outreach focus was §1.2 + §3.3).
- **ajtowns review:** less likely to engage §4; his focus is §3.4 mechanism design.

**Status:** Leaning A (defensive preface). Lopp's non-flag on §4 is the strongest signal yet that Option B (appendix relocation) is unnecessary. Finalize §4.0 preface language after Chervinsky's read; see Open Strategic Q1.

---

#### Critique 2 — Self-enforcement tension

**Verbatim:**
> "It seems to me that benign and well-considered soft forks already generally fulfill the criteria you propose, but ill-considered soft fork attempts would likely not be dissuaded by the existence of a standard as the one proposed by you — as the criteria for enforcing the standard are similar to those for resisting the soft fork attempt in the first place."

Partially walked back in footnote:
> "Having meanwhile finished the document, I realize that the later sections take a similar stance."

**Significance:** Deepest critique. Questions the marginal value of the framework. Existing §6 partially addresses but doesn't engage Murch's specific argument head-on.

**v2 plan:**
- Add new **§6.6 "On the apparent redundancy of the standard"**
- Core argument: framework's value is *asymmetric coordination cost*
  - Without framework: every individual defection requires custom argumentation, which is expensive for each stakeholder
  - With framework: "fails criteria 6, 8, 11" is a complete justification — cheap to invoke, hard to rebut
  - Framework lowers activation energy for principled refusal
  - Matters most at the margins, where stakeholders are uncertain whether their objection rises to the level of public dissent
- Draft §6.6 to engage Murch's specific framing directly (quote the critique, then address)
- Tie to §6.4 ("Who decides whether the standards are met?") — the answer is "anyone with the criteria," which means a single skeptical infrastructure operator can invoke the framework without first organizing a coalition

**Cross-reference notes:**
- ajtowns and jamesob may surface similar concerns; integrate all responses into one §6.6 if multiple reviewers raise.

**Status:** Queued for v2.

---

#### Critique 3 — Measurability / objectivity

**Verbatim:**
> "The main issue remains that many of the proposed criteria such as, e.g., '(2) the proposal has demonstrated broad support among economic nodes, exchanges, and major holders' are difficult to impossible to objectively measure."

**Significance:** Real critique. Framework's binary scoring presumes measurability. Several criteria are genuinely fuzzy (broad support, sustained opposition, adequate review).

**v2 plan:**
- Add new **§5.3 "On Measurability"** subsection in Section 5
- Frame fuzziness as a *feature*, not a bug: the framework forces conversation about evidence, not algorithmic scoring. Binary classification is meant to be defensible against challenge, not bright-line.
- Add inline measurability heuristics for the fuzziest criteria. Tentative anchors:
  - "Broad support among economic nodes" → explicit public statements from at least three of the top-five exchanges by Bitcoin trading volume, plus comparable statements from at least two custodians serving institutional clients
  - "Sustained opposition" → at least two prior public objections from independent stakeholders that have not been substantively addressed in proposal updates
  - "Adequate community discussion" → archived discussion in at least two distinct venues (bitcoin-dev list + one other) over the full minimum review period
- Heuristics should be illustrative, not prescriptive — the framework's authority is its defensibility, not its precision.

**Status:** Queued for v2. Specific heuristic language can be drafted after Lopp/jamesob input — they may push back on what counts as evidence.

---

#### Critique 4 — §3.1E Rollback Procedure unnecessary

**Verbatim:**
> "I don't think that 3.1E 'Rollback Procedure' is necessary. Proposals should be well-enough understood that such consequences are considered unlikely, or they should not be considered ready for adoption. Beyond that, truly unforeseen negative side effects would likely call for more precise mitigation than a complete rollback of the soft fork. Similarly, temporary soft forks generally strike me as an unattractive concept."

**Significance:** Tactical. His reasoning is sound for non-temporary soft forks. But the framework was partly motivated by BIP-110, an explicitly temporary soft fork — need to retain rollback for that case.

**v2 plan:**
- Narrow §3.1E to apply only to proposals self-described as "temporary"
- Existing §3.6 (Sunset and Reversibility Requirements) already specifies the temporary-soft-fork sunset requirements; trim §3.1E to cross-reference §3.6 rather than impose universal rollback
- Tentative revised §3.1E text:
  > "E. Rollback Procedure. For proposals self-described as 'temporary,' a self-executing sunset mechanism is required (see §3.6). For other soft-fork proposals, no rollback procedure is required, but the proposal should not affirmatively obstruct future reversal — the consensus rules should remain technically reversible via standard soft-fork or hard-fork mechanisms."
- Update §5.1 criterion 5 to track this narrowing

**Status:** Pure refinement. Will go straight in for v2.

---

#### Critique 5 — LOT=true skepticism

**Verbatim:**
> "Regarding Activation Mechanisms, I remain a big fan of Speedy Trial, although different activation mechanisms might be a better fit for some types of proposals. `LOT=true` generally strikes me as an unreliable and dangerous approach that I do not support at all in a first attempt and would be skeptical of in a repeat attempt."

**Significance:** Confirms current direction. §3.4 already characterizes LOT=true as "the central question of every activation mechanism" without endorsing.

**v2 plan:**
- Minor strengthening of §3.4 LOT discussion possible: characterize LOT=true as "unreliable in a first attempt and disfavored even on repeat attempts" — cite Murch in acknowledgments if consent given
- Verify whether this is Murch's view or a broader developer consensus; if broader, attribute appropriately to community position rather than single reviewer

**Status:** Minor. Light edit at most.

---

#### Critique 6 (latent) — Rule-lawyering concern

**Verbatim:**
> "I would not necessarily expect protocol developers to support formal adoption of such a framework as it may give more power to 'rule lawyer'-soft fork attempts that fulfill the criteria in numbers but not in spirit, but a proposer that were to follow your recommendations would certainly benefit from that."

**Significance:** Worth addressing in §6 (objections). Could fold into §6.6 (above) or stand as separate §6.7.

**v2 plan (if not absorbed into §6.6):**
- Add **§6.7 "On rule-lawyering and adversarial compliance"**
- Argument: binary criteria + classification bands leave judgment intact; partial gaming is itself progress (a rule-lawyered proposal is at least *better documented* than an ad-hoc one); the framework can be revised adversarially as bad-faith actors expose loopholes; the §5.2 Red-class response remains available for proposals that game the letter but fail the spirit (which is itself observable evidence)

**Status:** Queued for v2. Likely folded into §6.6.

---

#### Items Murch did NOT flag

The quantitative and structural core of the framework survived his read intact. No pushback on:
- Random-walk math at E = 0.55 / 0.90 / 0.95 (§3.4)
- 90% / 80% / 60% threshold tiers (§3.4)
- 12 / 24 / 36-month review periods (§3.2)
- BIP-110 case study (§1.2) — including the specific factual claims
- Historical precedent analysis: P2SH, SegWit, SegWit2x, Taproot (§2)
- 20-point checklist itself (§5.1)
- Chain-split risk assessment requirements (§3.5)
- Code audit requirements (§3.3) including AI-tool disclosure (§3.3.E)
- Activation mechanism design space framing — explicitly endorsed Speedy Trial preference

**Implication:** Disagreements are framing/scope/§4, not foundations. Strong signal of core integrity.

---

#### Acknowledgment plan

- Per `emails/README.md`: "Acknowledgments only with consent."
- When v2 ships, ask Murch whether he wants attribution in acknowledgments. He may decline (Chaincode reviewers sometimes prefer informal credit only); if so, the item-by-item response itself is the acknowledgment.

---

### Lopp (Jameson Lopp) — Casa CSO — received 2026-05-22

**Channel:** lopp.net/contact.php · X DM @lopp
**Tier:** 1 (must-have technical review)
**Original outreach focus:** §3.5 + §5.2 operator response + §4.4 pool liability
**Reply history:**
- 2026-05-14 (`emails/07_lopp_reply.md`) — BCAP pointer acknowledged; full review received eight days later, on the timeline he indicated.
- 2026-05-22 (`emails/07_lopp_reply_2.md`) — substantive item-by-item response to his full review; includes two specific HF-subtype questions (deployment-horizon floor for 4a; scoring approach for 4b) and a soft follow-up ask on §4.4. Drafted same-day as receipt; pending send.
**Overall posture:** Constructive and collaborative. Closes with explicit endorsement ("well thought out... particularly like how there is a scoring framework... good to have all of these quantitative attributes compiled in one place"). Substantive critiques are scope clarifications and one real content gap (HF subtypes), not foundational. Quantitative and structural core survived his read intact, mirroring Murch's signal.

**Actual vs. predicted intersections with Murch:**
- §4.4 pool liability — **did NOT materialize.** Lopp engaged the legal-framework scope question only indirectly (replay-protection comment touches §3.5, not §4.4). His silence on §4.4 is meaningful given audience-awareness; differs from Murch's allergic-reaction concern.
- §3.5 chain-split risk — engaged obliquely via replay-protection critique (Critique 5 below), not directly on Casa-side operational concerns.
- §6.4 / governance authority — engaged directly via the BIP-vs-ecosystem scope critique (Critique 1 below) and the "there can't be one... informal framework" framing.

---

#### Critique 1 — BIP-as-document vs. activation-client scope

**Verbatim:**
> "This is an interesting expansion of scope, given that BIPs have no insight or control over code quality or activation clients - anyone can write whatever code they want, regardless of what may be in the BIPs repository.
>
> I think it's important to remember that a BIP is a proposal, and has nothing to do with anyone agreeing with it. Just look at my BIP-361 which is highly contentious and doesn't even have any implementation code yet."

And the opening framing:
> "Yeah, there can't be one... at least, in the sense that there is no authority that can set a standard that can be enforced. From your conclusion it sounds like you understand that the best case is this being adopted as an informal framework."

**Significance:** Most underappreciated point in the review. Lopp identifies a layered-governance reality the current text elides: the BIPs repository controls only the editorial process; activation clients, ecosystem coordination, and code quality are governed (if at all) by separate norms operating at separate layers. If a reader does what Lopp narrowly avoided — read the paper's BIP-110 critique as critique of the BIP *document* — the framework appears to claim authority it cannot have. The framework's actual evaluative scope is the ecosystem behavior surrounding a proposal: activation client review, support evidence, operational coordination. Naming this explicitly closes the misread.

**v2 plan:**
- Extend the already-drafted §1.0 "How to Read This Paper" (see the self-identified clarity fixes subsection below — "How to Read This Paper subsection + §1.2 forward reference") with an explicit scope disambiguation
- Tentative §1.0 addition (extending the existing draft):

  > "The framework evaluates the ecosystem behavior surrounding a consensus-change proposal — the activation clients built around it, the review process applied to its code, the support evidence assembled in its favor, and the operational coordination preceding any deployment. It does not evaluate, and cannot evaluate, the editorial status of any BIP document. A BIP is a proposal; this framework asks which proposals merit activation, not which proposals merit filing."

- Add §1.2 forward-reference note disambiguating "BIP-110" as used in the paper:

  > "The 'BIP-110' addressed throughout this paper refers to the activation attempt — the RDTS client, the surrounding ecosystem campaign, and the operational coordination assembled around the proposal — not to the BIP-110 document filed in the BIPs repository. A BIP is a proposal; the framework's evaluative scope is the ecosystem behavior that would convert a proposal into network state."

- Optional: a one-line acknowledgment in §6 that the framework is, by design, *voluntary and informal* — picking up Lopp's "there can't be [a formal standard]" framing directly. This pre-empts the regulatory-proposal misread Lopp gestured at.

**Cross-reference notes:**
- Intersects existing §1.0 draft in the self-identified clarity fixes subsection — additive, not conflicting.
- Defensive value: makes the legal-analysis section (§4) and §4.4 pool-liability material harder to misread as a litigation roadmap, because the framework's scope is already named as ecosystem-behavior evaluation, not document-status policing.
- Intersects Murch Critique 1 (§4 allergic-reaction concern) — both critiques resolve partially through the same §1.0 framing work. Tighter scope statement upstream reduces downstream pressure on §4.

**Status:** Queued for v2. §1.0 extension drop-in ready. §1.2 forward-reference drop-in ready. **Step 0 confirmed** current §1.2 prose does *not* distinguish "BIP-110 the document" from "BIP-110 the activation attempt" — the section refers to "the proposal" and "the activation client" without naming the scope distinction. Drop-in is not redundant; it adds a layer the existing prose elides.

---

#### Critique 2 — Hard fork sub-categorization

**Verbatim:**
> "Interestingly, I expect these will fall in two extremes. I've postulated that a hard fork set a decade in the future can be pulled off fairly seamlessly if it's not controversial, simply due to known statistics for how frequently node operators upgrade their software. On the flip side, a hard fork could be due to an unexpected critical vulnerability or failure that can't wait for several years to be addressed."

**Significance:** **The single substantive content gap surfaced by Lopp.** Category 4 (Hard Forks) is currently treated as one monolithic "highest scrutiny" bucket. Lopp identifies two extremes with opposite governance properties: scheduled/long-runway HFs where time is the principal asset (organic upgrade cycles do the coordination work), and emergency HFs where time is the principal enemy (the alternative is running broken software). A uniform Category 4 either over-burdens emergency HFs or under-burdens scheduled HFs. This is the largest content addition in v2.

**Internal contradiction surfaced by Step 0:** The current Category 4 text already names emergency HFs by example — "Hard forks ... should be avoided except in extraordinary circumstances, such as a critical security vulnerability discovered in the deployed protocol." But it then applies a uniform 36-month review period to all HFs, which is actively dangerous when the trigger is a critical security vulnerability that cannot wait three years. The paper as-written carries an internal contradiction: it *acknowledges* the emergency case in prose and *misapplies* the scheduled-HF standards to it. Lopp's subtype split is therefore not just an addition; it resolves an existing inconsistency. Worth naming explicitly in the subsection prose so reviewers see the fix, not just the addition.

**v2 plan:**
- Add a new subsection within Category 4 — tentatively §3.X "Hard Fork Subtypes — Scheduled vs. Emergency" (final numbering TBD; may sit as 3.7 or 3.8 depending on existing structure)
- Two sub-categories with differentiated requirements:
  - **4a — Scheduled Hard Fork.** Deployment horizon measured in years from initial proposal. Time is the asset: organic node-upgrade cycles substitute for active coordination if the window is long enough. Empirical anchor: Lopp's own upgrade-rate analysis (already cited in §1.4 Prior Work draft) suggests a 5+ year window produces near-universal upgrade absent active opposition. Requirements: minimum review period ≥ 5 years; broad consensus required prior to code freeze; explicit deployment timeline published in advance; replay protection may be unnecessary if the upgrade window genuinely absorbs the change.
  - **4b — Emergency Hard Fork.** Triggered by critical vulnerability or imminent failure that cannot wait. Time is the enemy. Requirements: documented evidence of the trigger (exploit, demonstrated failure, near-term protocol break); compressed expert-led review on a timeline matched to the threat; near-unanimous coordination across infrastructure layers (Core release, major exchanges, major custodians, major mining pools); transparent post-hoc disclosure of the decision process; replay protection where any meaningful minority continues running prior rules.
- Tentative subsection drop-in:

  > ### 3.X Hard Fork Subtypes — Scheduled vs. Emergency
  >
  > Category 4 (Hard Fork) contains two extremes with opposite governance properties. The framework distinguishes them.
  >
  > **4a — Scheduled Hard Fork.** A hard fork with a deployment horizon of years from initial proposal. The defining property is that time is the principal asset: organic node upgrade cycles can substitute for active coordination if the deployment window is long enough. Empirical anchor: historical node-upgrade analysis suggests deployment windows of 5+ years produce near-universal upgrade absent active opposition. Requirements: minimum review period of 5 years; broad consensus prior to code freeze; explicit deployment timeline published in advance; replay protection unnecessary if the upgrade window genuinely absorbs the change.
  >
  > **4b — Emergency Hard Fork.** A hard fork triggered by a critical vulnerability or imminent failure mode that cannot wait for a multi-year deployment window. The defining property is that time is the principal enemy. Requirements: documented evidence of the trigger (exploit, demonstrated failure, near-term protocol break); compressed expert-led review on a timeline matched to the threat; near-unanimous coordination across infrastructure layers (Core release, major exchanges, major custodians, major mining pools); transparent post-hoc disclosure of the decision process; replay protection where any meaningful minority will continue running the prior rules.
  >
  > The framework does not anticipate emergency hard forks being common. It anticipates that when one is needed, the standard scheduled-HF requirements would be actively dangerous to apply. Subtype 4b is the framework's recognition that some governance needs are inverted under emergency conditions — not that emergency conditions suspend governance.

- **Open question:** does this require a parallel update to §5.1 (20-point checklist)? Subtype 4a is consistent with Category 4's current criteria, but subtype 4b inverts several (broad pre-deployment support, multi-year review window). Two options:
  - (i) Subtype 4b has its own short checklist (5-7 criteria emphasizing trigger documentation, expert review compression, and coordination breadth)
  - (ii) Shared Category 4 checklist with explicit override criteria for items 1-3 under documented emergency conditions
  - Lean toward (i) — clearer, harder to game. But (ii) preserves the unified scoring instrument.

**Cross-reference notes:**
- Intersects §1.4 Prior Work draft — Lopp's upgrade-rate blog post is already cited; subsection 4a deepens that citation rather than introducing it.
- Intersects §3.5 chain-split risk: emergency HF (4b) is the case where chain-split risk is by definition the lesser evil. §3.5 framing may need a brief acknowledgment of the emergency-case override.
- Intersects §3.6 sunset/reversibility: emergency HFs may not have reversible exits; §3.6 may need a subtype-aware caveat.
- Intersects Critique 5 below (replay protection) — subtype 4a may not need replay protection; subtype 4b likely does. The replay-protection framing and the HF-subtype framing co-resolve.
- Chervinsky (Tier 2 regulatory lawyer) may have separate disclosure/compliance angles on emergency HF — worth holding for his read before finalizing.

**Status:** Queued for v2. Subsection draft above is tentative; finalize after Tier 1 collection completes (ajtowns/jamesob may have views on emergency-case activation mechanics). This is the largest content addition in v2. Lean toward full-subsection treatment (per draft above) over light-touch footnote — Lopp's two-extremes framing only resolves at subsection depth.

---

#### Critique 3 — "Unaffiliated reviewer" definitional ambiguity

**Verbatim:**
> "The definition of 'not affiliated' could be tricky. I had conspiracy theorists claiming my BIP was unfairly reviewed because I worked with one of the BIP editors a decade ago."

**Significance:** "Unaffiliated" is unwinnable as a bright-line standard in a small community where everyone has eventually worked with everyone. The current language invites the exact bad-faith attack Lopp describes — a decade-old collaboration weaponized to smear a review. The framework needs a definition that is achievable and that resists weaponization. The fix is to shift framing from "isolation from author" to "diversity of affiliation among reviewers" plus disclosure.

**v2 plan:**
- Shift framing from "unaffiliated reviewers" to "reviewers with diverse affiliations" — drop the isolation framing in favor of an independence-by-diversity framing
- Operational criterion: required reviewers must represent at least three distinct organizational affiliations (employer or material funding source within past 24 months); reviewers must publicly disclose any known prior collaboration with the proposer; community has standing to object within a defined window; disclosure does not disqualify
- **Step 0 verified two locations** that must be updated together: §3.3.A ("not affiliated") and §5.1.6 ("independent" without definition). Final drop-in language for both is staged in **Section 2A Verification 1** above.
- Attach a rationale paragraph quoting Lopp's anecdote (with consent) — it makes the case for the change more vivid than abstract reasoning.

**Cross-reference notes:**
- The disclosure-not-disqualification framing aligns with §6 spirit (the framework gives vocabulary, not verdicts) and with [[no-claude-attribution]]-adjacent norms (transparent attribution, not policing of origin).
- Pairs naturally with Critique 4 below — both shift the framework from "claimed properties of reviewers" to "demonstrable properties of the review process."
- Item 10 (§5.1 update) confirmed required by Step 0 — see updated checklist scope.

**Status:** Drop-in ready (Section 2A Verification 1). Awaiting v2 integration cycle.

---

#### Critique 4 — AI-generated code disclosure unenforceable

**Verbatim:**
> "Not sure how you'd detect or enforce that..."

**Significance:** Lopp is right. There is no reliable AI-code detector; watermarking is unreliable and unevenly applied; voluntary disclosure assumes good faith from precisely the actors most likely to defect. §3.3.E in its current form depends on a detection capability that does not exist. The provision is normative-but-unenforceable, which is worse than absent: it gives bad actors a paper rule to point to ("nobody disclosed because nobody used AI") without providing meaningful protection. **The fix is not to drop the concern but to reframe it so it doesn't depend on detection.** Murch did not flag §3.3.E; Lopp's flag is the first signal that the provision in its current form is enforcement-theatrical.

**v2 plan:**
- Reframe §3.3.E from "no AI without disclosure" to a comprehension-based requirement: every line of consensus-change code must be reviewed by a named human reviewer who attests they understand the change and can defend its correctness on technical review
- This catches AI-generated code, human-written-but-not-understood code, copy-paste-from-prior-BIP code, and any other slop uniformly — without requiring detection
- AI disclosure remains welcomed but optional; the load-bearing requirement becomes reviewer comprehension
- **Step 0 verified two paired locations** that must be updated together: §3.3.E (the prose requirement) and §5.1 criterion 10 (the scored counterpart). Final drop-in language for both — preserving the legal-filings analogy in the prose — is staged in **Section 2A Verification 2** above.

**Cross-reference notes:**
- The reframe strengthens the framework: comprehension is a higher and more useful bar than disclosure. A bad-faith author can decline to disclose AI involvement; they cannot fabricate a named reviewer publicly attesting comprehension without that reviewer being subject to challenge.
- Pairs with Critique 3 (affiliation) — both shift from claimed-properties to demonstrable-properties framing.
- Flag for jamesob cross-review when his read lands — his original outreach focus was code-audit tractability (see his stub in this Section 2), making him the natural audience for this reframe.

**Status:** Drop-in ready (Section 2A Verification 2). Awaiting v2 integration cycle; would benefit from jamesob cross-review on the technical phrasing if his read lands first.

---

#### Critique 5 — Replay protection as HF admission

**Verbatim:**
> "I'd note that adding replay protection to one's proposal is basically an automatic admission of defeat; it's analogous to doing a hard fork because it means that the entire ecosystem will have to take action to modify their transactions and related infrastructure to support the new anti-replay transaction format."

**Significance:** Lopp's framing is that replay protection is a *property of* hard forks, not a layered safety requirement that can be added to soft forks. If the framework treats replay protection as a soft-fork safety net, that's category-confused. If it treats it as an HF-only requirement, Lopp's critique is restating what the paper already implies — and the framing is worth picking up as a definitional anchor.

**v2 plan:**
- **Step 0 verified four locations** of replay-protection language in current text — and the picture is more nuanced than the "two cases" framing originally presumed. The current §5.1 criterion 14 already carries a soft-fork carveout consistent with Lopp's framing ("where the proposal is a soft fork that cannot produce a chain split absent miner defection, a documented rationale for its absence"); Lopp's "diagnostic" framing is therefore **additive, not corrective** — it supplies the *why* behind the existing carveout's logic rather than rewriting the structure.
- Final drop-ins staged in **Section 2A Verification 3**:
  - **Append** a diagnostic-framing paragraph to Category 4 (Hard Forks)
  - **Light reframe** of §3.5.C to invoke Category 4 reassessment when replay protection is required
  - **No change** to §1.3 (descriptive framing — Lopp didn't engage)
  - **No change** to §5.1 criterion 14 (the carveout already aligns with Lopp's framing)

**Cross-reference notes:**
- Intersects HF subtype expansion (Critique 2 above): subtype 4a (scheduled HF, long upgrade window) may dispense with replay protection if the window absorbs the change; subtype 4b (emergency HF, chain-split risk) likely cannot. The replay-protection framing and the HF-subtype framing co-resolve.
- Intersects §3.5 chain-split risk assessment — replay-protection is the locus of Lopp's §3.5-adjacent engagement (he otherwise did not engage §3.5 directly).
- May also clarify the framework's posture on BCH-style contested-split scenarios where replay protection was a battleground (worth a footnote in the Category 4 diagnostic addition).

**Status:** Drop-in ready (Section 2A Verification 3). Sequencing note: **depends on item 5f** — the diagnostic addition cross-references subtype 4a/4b language that lives in the new HF-subtypes subsection. Draft 5f first, then 5i.

---

#### Affirmation 1 (not change) — BIP-148 contingent on miner capitulation

**Verbatim:**
> "Yes, though I expect that BIP-148 would have failed if miners hadn't capitulated. I also think it's good that BIP-110 will fail to show that UASF only works with overwhelming support. AKA this will be another precedent setting event for governance."

**Significance:** Lopp agrees with the paper's BIP-148 analysis and adds analytical nuance. Two points: (1) BIP-148 success was contingent on miner capitulation, not guaranteed by support level alone; (2) BIP-110 failure is *useful* governance precedent (negative example). Neither requires a content change; both sharpen v2 framing.

**v2 plan:**
- Light edit to §3.4 BIP-148 discussion: from "BIP-148 worked because SegWit had overwhelming community support" to "BIP-148 worked because overwhelming community support produced miner capitulation; UASF without that prior support yields the BIP-110 outcome." Quote Lopp directly if acknowledgment consent obtained.
- Possible §1.2 or §6 acknowledgment of BIP-110's failure as constructive precedent:

  > "BIP-110's failure to attract material signaling — peak ≤0.15% per the §2.5 outcomes table — is itself useful evidence: it establishes that the network's distributed governance can reject a soft-fork proposal that lacks broad support, even when proponents adopt reduced thresholds and compressed timelines. The framework's task is to make that rejection cheaper, faster, and better-documented."

**Cross-reference notes:**
- Intersects Murch Critique 2 (self-enforcement tension; see §6.6 v2 plan in the Murch Critique 2 block above). BIP-110's failure is itself an existence proof of distributed enforcement — exactly Murch's concern about framework redundancy. Integration checklist item 2 now treats §6.6 as a **dialectic** between Murch's question and Lopp's BIP-110 answer; Lopp's "precedent setting event for governance" framing supplies the phrase.

**Status:** Light edit + §6.6 enrichment.

---

#### Affirmation 2 (not change) — Scoring framework explicitly praised

**Verbatim:**
> "In general I think this is well thought out. I particularly like how there is a scoring framework. In the past we've kind of had to go with 'gut feeling' of certain aspects of a proposal being flawed or incomplete, but it's good to have all of these quantitative attributes compiled in one place."

**Significance:** Strongest endorsement Lopp provides. Validates the §5.1 checklist — the operational core of the paper — as load-bearing contribution. Confirms that the quantitative framing is the paper's most defensible feature and should be preserved across any v2 restructuring.

**v2 plan:**
- Add to acknowledgments draft list once consent confirmed.
- Verbatim pull-quote candidate for paper-promotion material per [[paper-promotion-post-style]] (Nostr/X) — clears the visual-quote bar (concrete, specific praise of a specific contribution).
- No content change required.

**Status:** Affirmation captured. No action for v2 content; consider for v2 framing emphasis and post-publication promotion.

---

#### Items Lopp did NOT flag

The quantitative and structural core survived his read intact. No pushback on:
- BIP-110 case study factual claims (§1.2) — including the specific ≤0.15% signaling figure
- Random-walk math at E = 0.55 / 0.90 / 0.95 (§3.4)
- 90% / 80% / 60% threshold tiers (§3.4)
- 12 / 24 / 36-month review periods (§3.2)
- 20-point checklist itself (§5.1) — **explicitly praised** (see Affirmation 2)
- Activation mechanism design space (§3.4) — implicitly endorsed via the BIP-148/UASF concession
- §4 legal analysis broadly — no allergic-reaction concern (contrasting with Murch Critique 1)
- §4.4 pool liability specifically — original outreach focus area; Lopp did not engage
- §3.5 chain-split risk assessment as a whole — original outreach focus area; engaged only obliquely via replay-protection comment

**Implication:** Lopp's read reinforces Murch's signal that the quantitative and structural core is intact. Disagreements are scope (BIP-vs-ecosystem), definitions (unaffiliated, AI disclosure), and one genuine content gap (HF subtypes). The §4 legal-analysis "allergic reaction" concern remains Murch's alone — Lopp's silence on §4 is meaningful given Lopp's audience awareness and original outreach focus on §4.4. This weakens the case for relocating §4 to an appendix (Murch's Option B alternative); the defensive preface (Option A) is increasingly favored.

**Notable absence:** §4.4 pool liability was explicitly flagged in original outreach as Lopp's focus area. His full review did not engage it. Possibilities: (a) no substantive concern; (b) deferred to allow other reviewers; (c) topic didn't make it into his read. Worth a one-line follow-up in the reply if the conversational opening warrants, but not pressing.

---

#### Acknowledgment plan

- Per `emails/README.md`: "Acknowledgments only with consent."
- When v2 ships, ask Lopp whether he wants attribution in acknowledgments. High likelihood of consent given collaborative tone and explicit positive framing.
- Pull-quote candidate for paper-promotion material: Affirmation 2 (scoring framework praise) — verbatim per [[paper-promotion-post-style]].
- Direct quotes elsewhere (Affirmation 1 on BIP-148/precedent setting, Critique 3 anecdote on weaponized review affiliation) are candidates for inline attribution within v2 prose if consent obtained.

### jamesob (James O'Beirne) — Bitcoin Core / OpenSats — silent

**Tier:** 1
**Original outreach focus:** §1.2 BIP-110 accuracy + §3.3 code-audit tractability
**Status:** No response as of 2026-05-22 (8 days since initial send, ~2 days before the 2026-05-28 follow-up window closes). His outreach focus is the natural audience for Lopp Critique 4's §3.3.E reframe — if he engages, prioritize a cross-review ask before v2 §3.3.E language ships.

### ajtowns (Anthony Towns) — Speedy Trial co-designer — silent

**Tier:** 1
**Original outreach focus:** §3.4 mechanism design + random-walk math
**Status:** No response as of 2026-05-22 (8 days since initial send, ~2 days before the 2026-05-28 follow-up window closes). His outreach focus is the natural audience for Lopp Critique 2's HF-subtype scoring question (separate 4b checklist vs. shared with overrides) — if he engages, route that open question to him.

---

### Self-identified clarity fixes (non-reviewer)

#### Table 2.5 — "Stalled (≤0.15%)" cell is undefined

**Issue:** The Outcome column on the §2.5 Summary of Activation Parameters table contains `Stalled (≤0.15%)` for the BIP-110 row, but the figure is never defined in the body. A reader encountering the table cold cannot tell what the percentage measures, what it's a percentage *of*, or how it relates to the 55% threshold in the adjacent column. Verified 2026-05-17 via full-PDF text search: `0.15` appears exactly once in the paper (in the cell itself).

**Significance:** This is the most damning data point in the BIP-110 case study. The proposal didn't fall short of an ambitious bar — it fell ~365x short of an already-reckless one. Leaving it undefined in the table buries the story.

**v2 plan — proposed addition (italic note immediately below the table, before the "The pattern is clear" paragraph):**

> *Note: percentages in the Outcome column for stalled or failed proposals reflect the peak observed share of blocks signaling readiness for the proposal during its activation window. BIP-110's 55% lock-in threshold was never approached.*

**Alternative (stronger): add a sentence to the "The pattern is clear" paragraph** drawing out the ratio explicitly — e.g., "BIP-110's outcome is instructive in a second way: a proposal that set its threshold dangerously low still failed to attract material signaling — peak observed signaling was below 0.15% of blocks, more than two orders of magnitude short of even the reduced 55% bar."

**Status:** Pure clarity fix. Drop in for v2. Lean toward the italic-note version (less argumentative, lets the table do the work); reserve the stronger paragraph version for later if a reviewer flags the table's opacity independently. Note: if the §1.2 forward-reference fix (below) ships, this caption is partially redundant — the forward reference defines ≤0.15% in prose. Keep both: caption answers "what does this number measure?" (mechanical); forward reference answers "how did this number come to be?" (conceptual).

---

#### "How to Read This Paper" subsection + §1.2 forward reference

**Issue (surfaced in author re-read 2026-05-17):** The paper's foundational impartiality framing — "this framework is a tool, not an authority" (§6.2) and "Everyone. And no one." on who decides (§6.4) — lives in the Objections section, 26 pages in. Readers encountering §1.2 (BIP-110 case study) and §2.5 (activation parameters table) naturally form the question "but who has authority to set a threshold at all, in a network with no central authority?" — and the paper does answer it, but the reader has to dig 20+ pages forward. By the time they get there, many will already have read the framework as a quasi-regulatory proposal rather than as a shared evaluation vocabulary. That misreading is preventable.

**Significance:** Bigger than the ≤0.15% caption fix. Caption fix helps readers parse one cell; this fix helps every reader of every section orient themselves before encountering the framework. Also closes Open Strategic Q4 (audience separation; see §3 below) without splitting versions.

**v2 plan — two complementary additions:**

**(a) New §1.0 "How to Read This Paper" subsection,** inserted between the Abstract and §1.1. Tentative drop-in:

> ### 1.0 How to Read This Paper
>
> The framework proposed here is not an attempt to centralize authority over Bitcoin consensus. It is an attempt to give Bitcoin's existing decentralized governance process a shared vocabulary for evaluating proposals.
>
> Readers concerned with the question of *authority itself* — who decides? what makes one threshold "wrong" and another "right"? — are encouraged to read §6.2 and §6.4 before §3. The framework is a tool, not a rule; if that distinction does not hold for a given reader, the standards that follow will read as something they are not.
>
> Different sections serve different audiences. Protocol developers will find §3 and §5 most directly applicable. Businesses, exchanges, and custodians will find §3.5 and §4 most operationally relevant. Node operators and users will find §6 most useful for evaluating what the framework asks of them and what it does not.

**(b) One-line forward reference at end of §1.2 (BIP-110 case study).** Tentative drop-in:

> The question of how any single threshold could be "set" in a network with no central authority is foundational and is addressed in §6.2 and §6.4. The short answer: it cannot, in any binding sense. BIP-110's proponents proposed 55%; whether the network adopted it was determined by tens of thousands of independent operator decisions, which collectively yielded ≤0.15% signaling.

**Side benefits:**
- Defines ≤0.15% in the prose where the reader first encounters BIP-110, not buried in a table caption 5 pages later
- Resolves Open Strategic Q4 (audience separation) without splitting versions
- Murch's "developers vs. businesses" observation is honored explicitly via the audience-specific paragraph in §1.0
- Makes the paper's impartial framing visible from page 1, which is a defensive bonus against §4 "allergic reaction" misreads (Murch Critique 1)

**Status:** High priority. Drop in for v2. The §1.0 subsection language may benefit from refinement after Tier 1 input lands (especially Lopp/jamesob on the audience-segmentation phrasing). The §1.2 forward reference is drop-in ready.

---

## Section 2A: Step 0 Source Verification Output (2026-05-22)

Produced per Integration Sequence item 0 (Step 0). Verbatim current text plus proposed v2 drop-in language for the items where Lopp's critiques required source verification before drafting. Where the verification surfaced a second location not anticipated in the original critique (e.g., §5.1.6 mirrors §3.3.A), both are documented here so drafting items 5g/5h/5i and item 10 can proceed from a complete picture rather than the original critique's narrower frame.

---

### Verification 1 — Reviewer-independence language (feeds 5g and item 10)

**Current §3.3.A (Code Audit Requirements, item A "Independent review"):**
> "The reference implementation must be reviewed by a minimum of three developers who are not affiliated with the proposal's authors. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation."

**Current §5.1 criterion 6 (Section B Code Quality):**
> "6. Has the reference implementation been reviewed by at least three independent developers with demonstrated Bitcoin protocol expertise?"

**Observation:** Two locations carry partially-overlapping reviewer-independence language. §3.3.A uses "not affiliated"; §5.1.6 uses "independent" without defining the term. Both are vulnerable to Lopp's weaponization critique (Lopp Critique 3). The diversity rewrite must therefore touch both — confirming F3's contingent concern in the prior QC pass: item 10 does need a Critique-3 update.

**Proposed v2 drop-in — §3.3.A:**

> "A. Diverse independent review. The reference implementation must be reviewed by a minimum of three developers whose primary organizational affiliations differ from each other and from the proposal's authors. 'Organizational affiliation' for this purpose means current or recent (past 24 months) employer or material funding source. Reviewers must publicly disclose any prior collaboration with the proposal's authors — co-authorship on prior BIPs or papers, joint employment, or shared funding. Disclosure does not disqualify; it makes the relationship legible. The standard is diverse independent perspectives, not pristine isolation, which is unachievable in a small developer community and weaponizable when claimed. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation."

**Proposed v2 drop-in — §5.1 criterion 6:**

> "6. Has the reference implementation been reviewed by at least three developers with demonstrated Bitcoin protocol expertise, drawn from distinct organizational affiliations, with any prior collaboration with the proposal's authors publicly disclosed?"

**Status:** Drop-in ready; awaiting v2 integration cycle.

---

### Verification 2 — Current §3.3.E text + §5.1.10 (feeds 5h and item 10)

**Current §3.3.E (Code Audit Requirements, item E):**
> "E. No AI-generated code without disclosure and review. The use of AI coding assistants in developing activation clients is not inherently problematic, but it must be disclosed and the resulting code must receive heightened scrutiny. AI-generated code in consensus-critical software is analogous to AI-generated legal filings — the tool can accelerate production, but the professional remains responsible for the output's correctness."

**Current §5.1 criterion 10 (Section B Code Quality):**
> "10. If AI coding tools were used, has this been disclosed and has the code received heightened review?"

**Observation:** §3.3.E has two components — disclosure (the part Lopp critiques as unenforceable) and "heightened scrutiny" (already compatible with a comprehension reframe). The legal-filings analogy is well-formed and worth preserving in v2; it carries the right professional-responsibility connotation. The reframe shifts the load-bearing requirement from disclosure (undetectable on inspection) to comprehension (publicly testable in review forums), while keeping the analogy intact.

**Proposed v2 drop-in — §3.3.E:**

> "E. Reviewer comprehension. Every change to consensus-critical code must be reviewed by at least one named human reviewer who publicly attests that they understand the change and can defend its correctness against technical challenge. This requirement applies regardless of the code's origin — whether authored by humans, generated by AI tools, or adapted from prior proposals. AI-generated code in consensus-critical software is analogous to AI-generated legal filings: the tool can accelerate production, but the professional remains responsible for the output's correctness. The framework does not attempt to police the origin of code, which is undetectable on inspection; it requires the comprehension of code by named accountable reviewers, which is testable in any review forum. Authors and reviewers are welcomed to disclose AI involvement voluntarily as a matter of transparency, but the load-bearing requirement is reviewer comprehension, not origin disclosure."

**Proposed v2 drop-in — §5.1 criterion 10:**

> "10. Has every change to consensus-critical code been attested as understood by at least one named human reviewer who can defend its correctness?"

**Status:** Drop-in ready; awaiting v2 integration cycle. Flag for jamesob cross-review on the technical phrasing if his read lands before the v2 cycle closes (his original outreach focus was code-audit tractability).

---

### Verification 3 — Replay protection scope (feeds 5i)

**Four locations in current text:**

1. **§1.3 The Stakes** (descriptive framing):
   > "When a chain split occurs without replay protection, transactions valid on one chain may be valid on the other. Users can lose funds. Exchanges must choose which chain to list. Contracts denominated in Bitcoin become ambiguous. The economic damage is real, quantifiable, and potentially irreversible."
   > "The most recent significant chain split without replay protection occurred in March 2013..."

2. **Category 4 (Hard Forks)** — explicit HF requirement:
   > "(2) explicit replay protection or a published rationale for its absence"

3. **§3.5.C (Chain-split risk assessment)** — question for proposals with chain-split risk:
   > "C. Replay protection. If a chain split occurs, does the proposal include replay protection to prevent transactions from being valid on both chains? If not, what is the expected impact on users who are unaware of the split?"

4. **§5.1 criterion 14 (scored, with soft-fork carveout):**
   > "14. Does the proposal include replay protection or, where the proposal is a soft fork that cannot produce a chain split absent miner defection, a documented rationale for its absence?"

**Observation:** The current treatment is more nuanced than Lopp's critique presumes. §5.1.14 already carves out the soft-fork case (no replay protection needed if the proposal cannot produce a chain split absent miner defection); §3.5.C asks the question in a generalized form that doesn't require replay protection of soft forks. Lopp's framing — "the necessity of replay protection is the diagnostic of HF status" — is **additive**, not corrective: it supplies the *why* behind the existing carveout's logic. The v2 update is therefore mostly sentence-level additions explaining the diagnostic, not a structural rewrite.

**Proposed v2 drop-in — append to Category 4 (Hard Forks):**

> "The necessity of replay protection is itself the diagnostic of hard-fork status. A proposal whose safe deployment requires the ecosystem to modify its transaction format to prevent cross-chain replay has, by that requirement, made the case for its hard-fork classification — and should be evaluated against the standards of this category rather than treated as a soft fork with a safety net bolted on."

**Proposed v2 drop-in — §3.5.C (light reframe):**

> "C. Replay protection. If the proposal would require explicit replay protection to prevent transactions from being valid on both chains in the event of a split, the proposal has crossed into hard-fork territory under Category 4 — reassess the classification before continuing the chain-split risk assessment. If the proposal is a soft fork that cannot produce a chain split absent miner defection, document the rationale for the absence of replay protection and address the expected impact on users in the residual miner-defection scenario."

**Proposed v2 changes — §5.1 criterion 14:**

No change required. Current language with the soft-fork carveout is consistent with Lopp's framing; the diagnostic explanation belongs in Category 4 and §3.5.C (the prose), not in the scored criterion.

**Proposed v2 changes — §1.3 The Stakes:**

No change required. Current descriptive framing of historical chain splits is appropriate and Lopp did not engage it.

**Status:** Drop-in ready; awaiting v2 integration cycle. Cross-reference with subtype 4a/4b distinction (item 5f): subtype 4a (scheduled HF with multi-year deployment window) may dispense with replay protection if the window genuinely absorbs the change; subtype 4b (emergency HF) likely cannot.

---

### Cleanup note

The extracted plain-text working file (`References/_ccs_text_extract.txt`) is a transient artifact of Step 0. It is not a deliverable; delete after the v2 integration cycle closes, or earlier if disk hygiene is preferred. The file is leading-underscore-prefixed to signal its working-file status.

---

## Section 3: Open Strategic Questions for v2

1. **§4 strategy** — Defensive preface (Option A) is now the preferred path; appendix relocation (Option B) and two-version split (Option C) are downgraded. Lopp's read (2026-05-22) did not flag §4 at all, despite §4.4 being an original outreach focus — meaningful signal given his audience awareness. **Status: leaning A; confirm with Chervinsky's regulatory-lawyer perspective when his read lands.**
2. **Acknowledgments structure** — Single block at end vs. distributed inline attribution? Most academic conventions are single block; consider matching.
3. **Versioning** — README references v1.5 as next ship target. Current paper is "First Edition · April 2026 · Revised May 2026." Decide whether the BCAP/Murch integration ships as Second Revision May 2026, v1.5, or v2.0. Recommend: Second Revision [Month] 2026 to preserve the First Edition framing; reserve v2.0 for any structural rewrite.
4. **Audience separation** — Murch's "developers vs. businesses" observation has merit. Without splitting versions, can the v2 frontmatter or §1 signal that different audiences will find different sections most useful? A short "How to Read This Paper" subsection in §1 could help. **(Largely resolved 2026-05-17 by the §1.0 "How to Read This Paper" drop-in drafted in §2 self-identified clarity fixes above. Finalize phrasing after Tier 1 input.)**
5. **Reviewer engagement protocol** — When v2 ships, individual item-by-item responses go to each engaged reviewer. Consider whether to also publish a "Response to Reviewers" document alongside the paper, or keep responses private (one-on-one is the README default).

---

## Section 4: Integration Sequence (operational checklist)

When v2 cycle begins:

0. ~~Source verification pass (Step 0)~~ **DONE 2026-05-22.** Output integrated into Section 2A above. Confirmed: reviewer-isolation language exists in *two* locations (§3.3.A "not affiliated" + §5.1.6 "independent"); §3.3.E and §5.1.10 paired (both need the comprehension reframe); replay protection appears in four locations with the existing soft-fork carveout in §5.1.14 already partially anticipating Lopp's framing. Item 10's Critique-3 contingency (F3's hedge in prior QC pass) is confirmed required.
1. Draft §4.0 defensive preface (resolve after Chervinsky read; **defensive-preface path strengthened** by Lopp's non-flag on §4 — appendix relocation is now lower-priority alternative; see Open Strategic Q1 status)
2. Draft §6.6 as a **dialectic** between Murch Critique 2 ("what does the framework add over existing distributed enforcement?") and Lopp Affirmation 1 (BIP-110's failure is itself the existence proof that distributed enforcement *works* — at high coordination cost; the framework lowers that cost without claiming authority that does not exist). After Tier 1 collection.
3. Draft §5.3 measurability subsection + inline heuristics
4. Edit §3.1E narrowing per Murch
5. Light edit §3.4 — LOT discussion per Murch Critique 5; BIP-148 framing per Lopp Affirmation 1 (success contingent on miner capitulation, not support alone)
5a. Add italic clarification note under §2.5 Summary table defining the "≤0.15%" figure (self-identified clarity fix)
5b. Insert new §1.0 "How to Read This Paper" subsection between Abstract and §1.1 (self-identified clarity fix; resolves Open Strategic Q4) — **draft together with 5d as one unified §1.0 subsection**
5c. Append §1.2 forward-reference paragraph pointing to §6.2/§6.4 and defining ≤0.15% in prose (self-identified clarity fix) — **draft together with 5e as one §1.2 additions block**
5d. Extend §1.0 draft with BIP-as-document vs. ecosystem-behavior scope statement per Lopp Critique 1 (**drafted together with 5b**)
5e. Add §1.2 BIP-110 ecosystem-scope footnote per Lopp Critique 1 (**drafted together with 5c**)
5f. New §3.X "Hard Fork Subtypes — Scheduled vs. Emergency" subsection per Lopp Critique 2 (**largest content addition; subtype 4a / 4b distinction**)
5g. Rewrite §3.3.A + §5.1.6 → diversity-based language per Lopp Critique 3 (**drop-in ready in Section 2A Verification 1**)
5h. Rewrite §3.3.E + §5.1.10 → reviewer-comprehension requirement per Lopp Critique 4 (**drop-in ready in Section 2A Verification 2**)
5i. Add diagnostic framing for replay protection to Category 4 + light reframe of §3.5.C per Lopp Critique 5 (**drop-in ready in Section 2A Verification 3**; §1.3 and §5.1.14 require no change; **depends on 5f** for subtype 4a/4b cross-reference)
6. Drop in §1.4 Prior Work text from `v2_prior_work_draft.md`
7. Add References "Industry and Academic Analysis" subsection
8. Add three cross-references (§3.4, §3.5, §6.1) per `v2_prior_work_draft.md`
9. Consider §6.7 rule-lawyering response (or fold into §6.6)
10. Update §5.1 to absorb downstream effects (most drop-ins ready in Section 2A): criterion 5 (§3.1E narrowing per Murch); criterion 6 reviewer-diversity update per Lopp Critique 3 — **confirmed required by Step 0** (drop-in in Section 2A Verification 1); criterion 10 reviewer-comprehension rewrite per Lopp Critique 4 (drop-in in Section 2A Verification 2); HF subtype-aware scoring per Lopp Critique 2 (open question: subtype 4b separate checklist vs. shared with override criteria); §5.1.14 needs no change (already carries the soft-fork carveout consistent with Lopp's framing — confirmed by Step 0).
11. Draft acknowledgments block; request consent from each engaged reviewer
12. Regenerate PDF; update website canonical version; send item-by-item responses to each engaged reviewer

---

*Last updated: 2026-05-22 — **v2 cycle EXECUTED + COMPREHENSIVE QC PASS (×3) COMPLETE.** Third pass added Bluebook-style italicization for case names + book/internet-source titles + citation signal "See" (per user pushback "you sure we shouldnt italicize courts cases???"). v1 paper did not italicize case names; v2 now correctly does per Bluebook Rules 1.2 (signals), 2.1(a) (cases), 15 (books), 18 (internet sources). 26 italic runs in final v2 (was 1 — only the §2.5 caption was italic before this pass). All 7 case names (*Aas*, *Robinson Helicopter*, *Biakanja*, *Della Penna*, *Korea Supply*, *Pacific Gas*, *Tulip Trading*), both book titles (*Analyzing Bitcoin Consensus*, *Regulating Blockchain*), the Lopp blog post title (*When Do Bitcoin Node Operators Upgrade?*), and all 4 citation-signal "See"s are now italicized. Final output: `consensus_change_standards_v2.docx`, 39 pages, 12,431 words, 349 KB; opens cleanly in Word; 22 of 22 planned edits applied; **42-of-42 final omnibus check pass / 0 fail**; all v1 content preserved; 4a/4b bold prefix runs verified; all internal cross-references (§3.6, §3.7, §4.0, §5.3, §6.6, §6.2, §6.4) resolve. **Four rounds were required end-to-end:** (1) Word COM failed (PS 5.1 mojibake without UTF-8 BOM); (2) XML-direct rebuild worked but PS positional-args bug truncated 3 §3.7 paragraphs at unparenthesized `+ $apos +` continuations after func args; (3) script fixed (parens-wrapped) + Edit 21 §2.5 italic caption folded into main script, clean rebuild succeeded — appeared 100% complete; (4) requested second deep QC pass caught two residual issues — `naïve` had become `naive` (PS source was pure-ASCII; needed `[char]0x00EF` constant for the diaeresis) and §3.5 had a colon-then-paragraph-then-list grammatical awkwardness (new BCAP paragraph sat between "addressing, at minimum:" and "A. Hashrate distribution analysis"). Both fixed: added `$idia` constant for ï, repositioned the BCAP paragraph to be §3.5's new opening paragraph (right after the section heading, before "Every consensus change proposal..."). Final rebuild verified. PDF intentionally deferred per user "docx only" directive. Lopp delivery: `emails/07_lopp_reply_2.md` + `.eml` (488 KB, current v2.docx attached, To: placeholder needs replacement). Lessons captured in [[batch-paper-revision-workflow]]. Earlier session work: Lopp full review received and integrated; integration-sequence QC pass applied; Step 0 source verification complete; Open Strategic Q1 promoted to "leaning A". Tier 1 status: Murch ✓ (2026-05-14), Lopp ✓ (2026-05-22), jamesob silent, ajtowns silent. Follow-up window for the two silent reviewers closes 2026-05-28; Tier 2 outreach triggers thereafter per `emails/README.md`.*
