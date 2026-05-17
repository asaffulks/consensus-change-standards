# Consensus Change Standards — v2 Revision Spec

**For:** Claude Code session
**Source paper:** `consensus_change_standards.docx` (First Edition — April 2026, Revised May 2026)
**Author:** Asaf Fulks
**Publisher:** The Forum Press, a Fulks, Inc. company
**License:** CC BY 4.0 (preserve in revision)

## Purpose

One precision improvement to the framework, identified through post-publication critique. It does not concede any substantive claim in the existing paper. It closes a rhetorical attack surface that a sophisticated reader could exploit and that one Nostr critic already attempted.

A second proposed change — a new §3.7 on evaluating decisions not to propose — was considered and deferred to Tier 1 review. See "Deferred to Tier 1 review" near the end of this document for the rationale and the abbreviated form that would land in v2 only if a Tier 1 reviewer surfaces the asymmetry independently.

This document specifies exactly what to add, where to add it, what to preserve, and what to avoid.

---

## What NOT to change

Before listing additions, the following must be preserved verbatim or in substance:

- All 20 criteria in §5.1 (the Consensus Change Readiness Checklist). Numbering and content unchanged.
- The scoring rubric in §5.2 (Green/Yellow/Orange/Red bands, BIP-110 at 3/20, Taproot at 18/20).
- The legal analysis in §4. The case law citations (Aas, Biakanja, Della Penna, Korea Supply, Pacific Gas, Robinson Helicopter, Tulip Trading, Walch) are correct and must not be replaced or "modernized."
- The threshold quantification in §3.4 (the 0.30 / 1.9×10⁻⁶ / 2.1×10⁻⁸ figures at E=0.55/0.90/0.95).
- The historical activation table in §2.5.
- The abstract's framing that the paper "does not recommend for or against any particular consensus change proposal, including BIP-110."
- The disclaimer's no-attorney-client-relationship language.

The framework's authority depends on its neutrality as a method. Do not introduce hedging that softens scoring, and do not introduce stronger claims that make the paper sound like advocacy.

---

## Change 1: BIP-110 Four-Phase Lifecycle Paragraph

### Where

Add as a new paragraph at the opening of §3.4 (Activation Threshold Standards), positioned to clarify what "activation" means before the threshold analysis begins.

In §1.2 (BIP-110 as Case Study), add a single forward-reference sentence at the end of the section:

> BIP-110's consensus properties vary across its activation lifecycle — see §3.4.

The §3.4 placement is preferred because the "you're conflating relay policy with consensus" attack lands on the threshold analysis specifically. The §1.2 forward reference pre-conditions the reader without front-loading mechanism detail before they have seen what would be conflated.

### Why

The paper currently treats BIP-110 as a "consensus change" throughout, which is correct. But the term obscures that BIP-110 has different consensus properties at different phases of its activation lifecycle. A reader (or critic) can exploit this by claiming the paper conflates relay policy with consensus enforcement.

The four phases are:

1. **Pre-lock-in (signaling only).** Nodes running the activation client signal readiness via version bits. No consensus enforcement. Activation client behavior is policy-equivalent at the validation layer — signaling nodes accept all blocks the legacy chain would accept — but the signaling threshold is coordination-bearing for the activation transition that follows.
2. **Locked in, awaiting activation.** Signaling threshold met. Activation client is committed to enforce new rules at a defined block height. Still no enforcement. Network is in a coordination-committed state but identical to legacy at the validation layer.
3. **Active.** New consensus rules enforced. Activated nodes reject blocks that violate the new rules. This is consensus enforcement, not relay policy. A block valid under the legacy rules but invalid under the new rules is rejected at the validation layer, not the mempool layer. This is the phase at which chain-split risk materializes.
4. **Post-sunset.** Self-executing expiry returns nodes to legacy consensus rules. Activation client effectively reverts to legacy behavior. New rules cease to be enforced.

The coordination-bearing clause in phase 1 is load-bearing for the paragraph. Without it, the lifecycle framing reads as "signaling is just policy, so don't worry about it" — which undercuts §3.4's threshold analysis instead of clarifying it. The signaling threshold has predictive value precisely because it forecasts economic enforcement at activation. Preserve that link.

### What to write

One paragraph, approximately 120 words. Four short declarative sentences, one per phase, with a brief lead-in. Plain prose, no bullet list. The model:

> BIP-110's consensus properties vary across four phases of its activation lifecycle. In the signaling phase, signaling nodes accept the same blocks legacy nodes accept; activation client behavior is policy-equivalent at the validation layer but coordination-bearing for the activation transition that follows. After lock-in, the activation client is committed to enforce new rules at a defined block height but remains validation-identical to legacy nodes until that height. At activation, activated nodes reject blocks legacy nodes would accept; chain-split risk materializes, and §3.4's threshold analysis is calibrated to this phase. The post-sunset phase returns activated nodes to legacy rules, contingent on the deactivation mechanism functioning as specified.

This is a draft. The author will refine the prose. Preserve the substance: four phases, validation-identical until activation, chain-split risk only at activation, signaling is coordination-bearing for activation, framework calibrated to activation phase.

### Constraints

- Do not introduce new defined terms unless necessary. "Signaling phase," "lock-in," "activation," "sunset" are already used in the paper.
- Do not soften the claim that activation is a consensus change. The whole point is to preserve that claim while clarifying scope.
- Do not write in long compound sentences. The previous draft of this paragraph violated the paper's voice guide by packing four phases into one ~200-word run-on; that version is superseded. Match §3's existing cadence: short, declarative, one idea per sentence.
- Do not add a footnote citing the Nostr exchange. The paper is the canonical record. The exchange is not.

---

## Style and voice

The paper's voice is plain, direct, and analytical. Specific patterns:

- Short declarative sentences. Avoid hedges ("it could be argued that," "one might consider," "perhaps").
- Concrete examples over abstract principle. Where a principle is stated, follow with an example.
- Numbers and citations carry weight. Where a claim can be quantified, quantify it. Where a legal claim is made, cite the case.
- No emojis, no headers screaming for attention, no exhortations. The conclusion sells itself.
- "I" appears rarely. The framework speaks; the author does not editorialize.

Match this voice in the §3.4 addition. If a draft sentence sounds like a tech blog or a Twitter thread, rewrite it.

---

## Edition labeling

If Change 1 lands, update the cover metadata:

- **Edition:** "Second Edition — May/June 2026" (replace the existing "First Edition — April 2026, Revised May 2026" label with a Second Edition label appropriate to the actual completion date). Second Edition rather than Second Revision because the broader v2 cycle (BCAP §1.4, §4.0 defensive preface, §5.3 measurability, §6.6 self-enforcement-redundancy, plus the §3.4 lifecycle paragraph specified here) introduces five or more new sections. Honest edition labeling matters for citation stability — third parties citing v1 section numbers should not silently find their citations broken under a "revision" label.
- **Changelog page:** Add a brief changelog at the end of the front matter or as an appendix (appendix preferred — keeps front matter clean). One entry for this spec:
  1. Added phase-lifecycle clarification at the opening of §3.4 plus a one-sentence forward reference in §1.2. No substantive change to scoring.

Other v2 changelog entries (BCAP §1.4, §4.0 preface, §5.3 measurability, §6.6 redundancy) are tracked separately in `v2_revision_notes.md` and will be folded into the same changelog at v2 export.

Preserve the CC BY 4.0 license and Forum Press imprint exactly as in v1.

---

## Verification checklist (run before final export)

- [ ] All 20 criteria in §5.1 unchanged
- [ ] Scoring rubric unchanged (Green/Yellow/Orange/Red, BIP-110 = 3/20, Taproot = 18/20)
- [ ] §4 legal citations unchanged
- [ ] §3.4 threshold quantification unchanged (the 0.30 / 1.9×10⁻⁶ / 2.1×10⁻⁸ figures and the E=0.55/0.90/0.95 bounds)
- [ ] Abstract still includes "does not recommend for or against any particular consensus change proposal"
- [ ] New §3.4 opening paragraph reads as plain analytical prose, no rhetorical defensiveness, four short declarative sentences (one per phase) with a lead-in
- [ ] New §3.4 paragraph preserves the coordination-bearing clause for the signaling phase — without it the paragraph undercuts the threshold analysis rather than clarifying it
- [ ] §1.2 ends with the single forward-reference sentence ("BIP-110's consensus properties vary across its activation lifecycle — see §3.4")
- [ ] No reference to the Sentra exchange anywhere in the document
- [ ] Edition relabeled to Second Edition (not Second Revision) on cover and title page
- [ ] Changelog appendix updated to reflect Second Edition and the §3.4 / §1.2 additions
- [ ] CC BY 4.0 license preserved
- [ ] Forum Press imprint preserved
- [ ] Final pass: read aloud the new paragraph. If any sentence sounds defensive, performative, or self-referential, rewrite.

---

## Deferred to Tier 1 review

A new subsection on "Decisions Not to Propose" (provisionally §3.7) was considered and deferred. The principle is sound: a governance framework that scores only action incentivizes premature action by failing to credit considered inaction. The framework currently has no analytical slot for decisions not to propose a consensus change in response to identified network issues, and the recurring "Core chose inaction, therefore Core is not neutral" attack has no place to land within the framework.

### Why deferred

- **Category shift.** §3.1–§3.6 evaluate events with defined timestamps (proposal, lock-in, activation). A "decision not to propose" is an ongoing absence with no defined moment — legible only in retrospective contestation. The framework's existing tools do not transfer cleanly; importing them as a "parallel" set would be inventing a different analytical object under the same label.
- **Neutrality cost of a worked example.** A worked application to the 2022–2023 inscription question (the natural example) drops the paper into the most contested recent governance event. The "do not name individual developers" guard is too thin: the participants in the 2022–2023 mailing-list threads are publicly identifiable, and any conclusion about whether the documentation was thin or thick reads as criticism (or cover) of identifiable people. Both Core-defenders and Core-critics will find a grievance.
- **Existing inoculation.** §6.1 ("Bitcoin has governance, this framework does not propose centralized governance"), §6.2 (anyone can run whatever software they want), and §6.4 (anyone can score, framework's authority is its usefulness) already address the proximate attacks. §3.7 picks the fight back up after it has been settled elsewhere.
- **Sequencing.** Tier 1 reviewers (Lopp, jamesob, ajtowns) have not all returned feedback. Letting one Nostr critic's pressure drive scope additions before invited reviewers finish is the wrong order of operations.

### What would land in v2 if a Tier 1 reviewer surfaces the asymmetry independently

A short §3.7 of approximately 200–300 words. Structure:

- **Opening paragraph (~100 words):** establish the symmetry principle — not-acting is a choice, a framework that scores only action creates an analytical asymmetry, considered inaction deserves the same documentation rigor as considered action.
- **Five-item parallel checklist:** problem documentation, alternatives considered, cost-benefit analysis, decision rationale published, re-evaluation trigger. Presented as a brief checklist (not prose), matching §5.1's structural pattern more than §3's narrative pattern.
- **Closing sentence:** the framework remains weighted toward scrutinizing action more heavily than inaction, because consensus changes carry chain-split risk and the burden of proof rests on proponents of change.

No worked example. The 2022–2023 inscription analysis deserves a standalone piece rather than being packed into a standards paper as an illustrative case — packing it in is precisely what creates the neutrality exposure that motivates the deferral. The standalone piece can do the historical analysis justice without dragging the framework's authority along for the ride.

### Trigger for inclusion

Include the abbreviated §3.7 in v2 only if a Tier 1 reviewer raises the symmetry/asymmetry question independently. Otherwise hold for v3, where it can be drafted after the standalone inscription piece exists and can be referenced rather than reproduced.

### Contingent draft location

The abbreviated §3.7 text is pre-drafted and staged at `References/consensus_change_standards_v2_section_3_7_contingent.md`. If the trigger condition fires, that file is the drop-in source — author refinement only, not a fresh draft. The pre-draft exists so that a Tier 1 email arriving with the symmetry question does not force a scramble during the v2 integration cycle. If the trigger does not fire, the file persists in `References/` as v3 starter material; it is not deleted on v2 ship.

---

## Out of scope for this revision

The following came up during the same exchange but are not worth addressing in v2:

- The "BIP-110 is just relay policy" rhetorical framing — already addressed by Change 1.
- The "you took a side" accusation — already addressed by §6.1 (Bitcoin has governance, this framework does not propose centralized governance) and §6.4 (anyone can score, framework's authority is its usefulness).
- The "egotistical legal nonsense" tantrum — already addressed by §6.2 (anyone can run whatever software they want; legal analysis in §4 concerns developer liability, not node operator authority).
- Updates to BIP-110's current activation percentage — the §2.5 table value is correct as of publication; do not chase the moving number.

These are noise. The framework is stronger by not chasing every objection.
