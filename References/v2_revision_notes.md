# v2 Revision Notes — Consensus Change Standards

**Purpose:** Master tracker for v2 revision. Consolidates reviewer feedback, integration plans, and open strategic questions.
**Status:** Tier 1 outreach in progress. Holding integration until Tier 1 collection completes, then revising in a single cycle with reviewer attribution.

**Related working files:**
- `v2_prior_work_draft.md` — clean drop-in §1.4 Prior Work text + References additions + three cross-references (BCAP integration, ready to deploy)
- `bcap_v1.0.pdf` — source for Prior Work integration

---

## Sequencing

1. **Tier 1 collection** — Murch ✓ (2026-05-14) · Lopp (review next week per 2026-05-14 reply) · jamesob (silent) · ajtowns (silent)
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
- **Lopp's pending review** includes §4.4 — high probability of related concern, particularly on pool-liability framing.
- **Chervinsky (Tier 2)** is a regulatory lawyer who'd have an opposite vantage on §4 — worth holding for cross-perspective before finalizing the §4 strategy.
- **jamesob review:** §4 may or may not surface depending on his focus (his outreach focus was §1.2 + §3.3).
- **ajtowns review:** less likely to engage §4; his focus is §3.4 mechanism design.

**Status:** HOLDING — finalize §4.0 preface language after Lopp + Chervinsky reads land. Defensive preface is the most likely path.

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

### Lopp (Jameson Lopp) — Casa CSO — review pending next week

**Channel:** lopp.net/contact.php · X DM @lopp
**Tier:** 1
**Original outreach focus:** §3.5 + §5.2 operator response + §4.4 pool liability
**Status:** 2026-05-14 reply pointed to BCAP; will review next week. Reply sent same day (`emails/07_lopp_reply.md`).
**Predicted intersections with Murch:**
- §4.4 pool liability — high probability of related allergic-reaction concern
- §3.5 chain-split risk — Casa operational relevance, likely substantive engagement
- §6.4 / governance authority — possible engagement with the framework's enforceability question

### jamesob (James O'Beirne) — Bitcoin Core / OpenSats — silent

**Tier:** 1
**Original outreach focus:** §1.2 BIP-110 accuracy + §3.3 code-audit tractability
**Status:** No response as of 2026-05-14. Per README: 10-day silence threshold before ping/Tier 2.

### ajtowns (Anthony Towns) — Speedy Trial co-designer — silent

**Tier:** 1
**Original outreach focus:** §3.4 mechanism design + random-walk math
**Status:** No response as of 2026-05-14. Per README: 10-day silence threshold before ping/Tier 2.

---

## Section 3: Open Strategic Questions for v2

1. **§4 strategy** — Defensive preface (preferred), appendix relocation, or two-version split? Hold until Lopp + Chervinsky reads land for cross-perspective.
2. **Acknowledgments structure** — Single block at end vs. distributed inline attribution? Most academic conventions are single block; consider matching.
3. **Versioning** — README references v1.5 as next ship target. Current paper is "First Edition · April 2026 · Revised May 2026." Decide whether the BCAP/Murch integration ships as Second Revision May 2026, v1.5, or v2.0. Recommend: Second Revision [Month] 2026 to preserve the First Edition framing; reserve v2.0 for any structural rewrite.
4. **Audience separation** — Murch's "developers vs. businesses" observation has merit. Without splitting versions, can the v2 frontmatter or §1 signal that different audiences will find different sections most useful? A short "How to Read This Paper" subsection in §1 could help.
5. **Reviewer engagement protocol** — When v2 ships, individual item-by-item responses go to each engaged reviewer. Consider whether to also publish a "Response to Reviewers" document alongside the paper, or keep responses private (one-on-one is the README default).

---

## Section 4: Integration Sequence (operational checklist)

When v2 cycle begins:

1. Draft §4.0 defensive preface (resolve after Lopp + Chervinsky)
2. Draft §6.6 self-enforcement-redundancy response (after Tier 1 collection)
3. Draft §5.3 measurability subsection + inline heuristics
4. Edit §3.1E narrowing per Murch
5. Light edit §3.4 LOT discussion per Murch
6. Drop in §1.4 Prior Work text from `v2_prior_work_draft.md`
7. Add References "Industry and Academic Analysis" subsection
8. Add three cross-references (§3.4, §3.5, §6.1) per `v2_prior_work_draft.md`
9. Consider §6.7 rule-lawyering response (or fold into §6.6)
10. Update §5.1 criterion 5 if §3.1E narrowing changes the scoring criterion
11. Draft acknowledgments block; request consent from each engaged reviewer
12. Regenerate PDF; update website canonical version; send item-by-item responses to each engaged reviewer

---

*Last updated: 2026-05-14 — Murch and Lopp replies sent. Awaiting full Tier 1 collection (Lopp review pending next week; jamesob and AJ Towns silent through follow-up window 2026-05-28).*
