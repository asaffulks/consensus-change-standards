# Changelog

## v5 — July 2026 (Fifth Edition)

Fifth Edition. Delivers the §3.4 rationale publicly promised in the paper's
discussion threads, adds new split-harm analysis, and applies a six-lane
pre-republication audit: two factual corrections, a set of technical-precision
fixes, and all BIP-110 status language re-anchored to its block schedule.

### New content

- §3.4: the standard computes its activation floor on the pre-activation
  signaling snapshot *by design* — the one input observable before the network
  commits — with the Bitcoin Cash EDA oscillation (Aug–Nov 2017) and
  minority-chain persistence (ETC since 2016, BCH since 2017) as evidence that
  post-activation corrections are not guaranteed to run smooth or one way. The
  §3.4 recap box carries a one-line echo.
- §1.4: the split-harm gradient — non-monetary data survives a split but gets
  harder to use; fungible value breaks outright; nothing comes through better
  off — and a concrete evidence-anchoring case: after a split, a Bitcoin
  timestamp proof invites a which-chain-counts dispute before the tribunal
  reaches the proof, and both successor chains' histories get cheaper to
  rewrite (Ethereum Classic was 51%-attacked three times in August 2020, the
  deepest attack reorganizing more than 7,000 blocks). The author's
  timestamping interest is disclosed alongside the §5.4 mining disclosure.
- §2.2: Jameson Lopp's 2026 block-size retrospective quoted as participant
  corroboration — his distillation of Bier's answer on who sets the rules, and
  his private-channels admission; the Conclusion carries his expect-more-battles
  close. (Acknowledgments note the quotation.)

### Corrections (pre-republication audit)

- The witness-data fee discount is SegWit's (BIP-141 weight accounting), not
  Taproot's — corrected in §1.2 and the Glossary.
- §1.4's "most recent significant chain split" superlative corrected to "most
  damaging," with the July 2015 BIP-66 forks acknowledged.
- §3.4 precision: most-work (not longest) chain selection; the upper-bound
  claim scoped to the model's single-race idealization, with fork renewal
  added to the stated simplifications (a correction that runs against low
  thresholds); validity vs. chain selection fixed in "The 55% Problem"; k = 6
  restated as the conventional finality depth.
- Glossary: the soft-fork entry (valid-block subset; majority-enforcement
  condition) and the reorganization entry (node behavior, not miner behavior)
  aligned to the body's usage.
- §3.2 Category 2 examples reworded to the tightening mechanics; §2.5's
  SegWit2x threshold cell scoped to the SegWit leg (the 2x fork itself was
  unconditional); BIP-9 lock-in vs. activation distinguished; the Abstract's
  BIP-148 credit hedged to match the body; RFC 6410's consolidation noted in
  §1.5; the "rough consensus and running code" credo credited to David Clark
  (1992) as RFC 7282 records it.
- §5.4 and §6.8 aligned to the framework's options-not-instructions posture;
  §6.8's manufactured-Red guarantee restated (absent support or unaddressed
  opposition); the copyright-page disclaimer states the process/merits split.
- Northwest Wholesale gloss, Robinson/Rattagan privity context, and the
  Rev. Rul. 2019-24 parenthetical tightened to their holdings.

### BIP-110 status (re-anchored, not resolved)

- Every "pending as of this writing" formulation replaced with the block
  schedule: mandatory signaling at blocks 961,632–963,647 (August 2026),
  lock-in at 963,648, forced activation at block 965,664 (early September
  2026); voluntary signaling stayed under one percent through July 2026
  (fresh tracker capture archived 12 July 2026, Appendix A.9). The outcome
  itself will be recorded in the post-activation revision, not this one.
- The Abstract no longer says the paper "is not a BIP": a process-track
  adaptation of Section 3 is being prepared as a separate document.

## v4 — June 2026 (Fourth Edition)

Fourth Edition. A scholarship-and-rigor pass closing the gaps a hostile expert
reviewer would flag, plus a positioning upgrade. No change to the BIP-110
forced-activation analysis, which remains pending its Aug/Sep 2026 window.

### The quantitative model (§3.4)

- Anchored the chain-split model in the literature it had reinvented: the
  closed form `P = ((1−E)/E)^k` is the gambler's-ruin / first-passage result
  Nakamoto used in §11 of the whitepaper, here repointed from an adversary's
  hashrate `q` to the enforcement share `E`. Added Nakamoto (2008), Rosenfeld
  (2014), and Grunspan & Pérez-Marco (2018) to the references.
- Stated the result as *exact* for the modeled ±1 walk (for E>½), not merely
  "well-approximated"; flagged it as an infinite-horizon first-passage bound
  (a conservative upper bound on any finite activation window); noted the
  negative-binomial refinement makes true catch-up risk at low E somewhat
  *larger*, so the figures understate the danger of a low threshold.
- Abstract reframed: the cliff number is "computable from the standard
  mathematics of chain-race security," not "a number almost no one has
  calculated."

### Historical record (§2.1, §6.3)

- P2SH corrected to its actual 2012 record: the ~55% coinbase poll failed to
  reach threshold on the first attempt, the chain forked between enforcing and
  non-enforcing miners, and the change activated only via a hardcoded flag day
  (timestamp 1333238400 = April 1, 2012; block 173,805). The framework's single
  best empirical bullet — a real 55% activation that produced exactly the
  §3.4-predicted split — now stated straight; the summary table and the §6.3
  rebuttal harmonized to match.

### Positioning (§1.5)

- Added "Governance models in adjacent open protocols": the framework's
  maturity-gate move restates the IETF "rough consensus and running code"
  credo (RFC 7282) and RFC 2026's multiple-interoperable-implementations bar,
  and Bitcoin's BIP process descends PEP-1 → BIP-1 → EIP-1. Situated the
  framework relative to the broader blockchain-governance literature (De
  Filippi & Wright; Buterin; Zamfir; Narayanan et al.). New "Open-Protocol
  Governance" references section.

### Legal analysis (§4, §5.2)

- §4.1: added the controlling modern California authority, *S. Cal. Gas Leak
  Cases*, 7 Cal.5th 391 (2019), and distinguished it; corrected the *Sheen*
  gloss; stated *Rattagan*'s two conditions; noted Restatement (Third) of
  Torts: Liability for Economic Harm §5 (2020) carries §552 forward.
- §4.3: balanced the fiduciary discussion with the developers-are-not-
  fiduciaries counter-scholarship (Haque, Seira, Plummer & Rosario, 2019) and
  tied the Birss LJ "myth of decentralization" hinge to Walch, *Deconstructing
  Decentralization* (Brummer ed., 2019); split the monolith paragraph.
- §5.2: deepened the antitrust note with the group-boycott *per se* line
  (*Klor's*; *Northwest Wholesale Stationers*; *FTC v. Superior Court Trial
  Lawyers*) and resolved the coordination-vs-no-agreement tension — the Red-band
  response now reads "independent decisions by economic nodes," not
  "coordination."

### Framework and self-defense (§5.3, §5.4, §6.8)

- §5.4: added a fourth worked example — a hypothetical rushed *data-liberalizing*
  change scored Red on process despite serving the author's own mining-fee
  interest — as the cleanest test of neutrality, and conceded that the SegWit2x
  Red is over-determined by hard-fork structure.
- §5.3: confronted the closed-loop "author grades his own exam" objection
  directly and reframed the dissent archive as the empirical falsification test.
- §6.8: added an eighth objection — the chilling-effect / litigation-roadmap
  concern — answered on the paper's own materials (the theories pre-exist the
  paper; Section-3 compliance is a complete defense; deterrence runs only
  against shipping past a documented Red finding; liability points at campaign
  actors, not pseudonymous coders).

### Consistency and precision

- Threshold bands stated identically in body and box (80–90% "risky" named);
  abstract/box "one in three" → "thirty percent"/"three in ten" to match the
  derived 0.30; §3.7 node-upgrade ceiling re-hedged to match §1.5 and the Lopp
  source; §3.2 Category-3 residual-exposure boundary keyed to the activation
  height (block 965,664) and the enumeration completed (annex, undefined
  witness/tapleaf versions, oversized control blocks); glossary Speedy Trial /
  BIP-8 LOT framing clarified; BIP-91 lock-in date given as "around July 20–21";
  *COPA v Wright* added to References; minor prose de-duplication (§4.0, the
  abstract BIP-110 sentence, the "cost of refusal" echo).

## v3.1 — June 2026 (revision of the Third Edition)

### Accuracy

- §2.3: corrected SegWit chronology. BIP-91 locked in July 20, 2017 and forced
  universal signaling before the Aug 1 UASF deadline; BIP-141's 95% lock-in
  followed Aug 8, activation Aug 24 (block 481,824).
- §1.1 / refs: BIP-3 (Deployed, 2025) replaced BIP-2 as the governing process
  document; analysis updated — the change strengthens the filing-system point.
- §3.4: "will fall behind" made conditional on sub-half enforcement, matching
  the model; reorg perspective clarified (non-enforcing nodes reorganize;
  enforcing nodes fall behind).
- §4.5: Rev. Rul. 2019-24 corrected — ordinary income at receipt with FMV
  basis; the IRS rejected basis allocation.
- §4.3 / §4.6 / refs: Tulip Trading discontinued 2024 after COPA v Wright;
  holding intact, duty question untried.
- §3.7: BIP-50 emergency resolved by coordinated downgrade; the later flag-day
  fix noted as Bitcoin's one de facto (uncontentious) hard fork.
- Refs: RDTS client v0.1rc1 correctly cited to the proponent's fork
  (dathonohm/bitcoin), not the Bitcoin Knots repository.

### Framework consistency

- Criterion 11 redrafted to reach any deployment with a miner-signaling
  threshold; criterion 15 redrafted (signaling only after the review floor;
  enforcement ≥ 6 months after final client) — as previously drafted, BIP-110
  arguably satisfied it; criterion 16 aligned with §3.7 subtype floors;
  criterion 20 generalized to any published readiness standard.
- §5.2: classification bands restated as percentages of applicable criteria;
  narrow not-applicable rule added (temporal: 19–20; structural: 11–12).
  Taproot now 17/17 applicable (Green); SegWit2x ≈ 6/17 (Red); BIP-110 3/20
  (Red). §5.1 scope note: emergency hard forks (§3.7 4b) evaluated directly
  under 4b standards, not scored.

### Legal analysis

- §4.1: Sheen (2022), J'Aire (1979), Bily (1992), Rattagan (2024) integrated;
  Knots release-notes support assertion analyzed as a § 552 readiness
  representation; § 230 / Lemmon and code-as-speech / Junger defenses named.
- §5.2: antitrust note (Allied Tube) — unilateral application of published
  criteria, no agreement contemplated; §6.7 cross-reference.
- §6.5: T.J. Hooper on voluntary standards and the adoption bootstrap.

### Apparatus

- Figure 3.1 (threshold-risk cliff, log scale) and Figure 2.1 (2012–2026
  governance timeline) added.
- Appendix A: documentary record for the §1.3 case study, with archived
  captures maintained in the repository.
- Appendix B: adoption kit — model recognition, signaling, and distribution
  policy clauses, drafted for unilateral application.
- Ch. 7: framework maintenance and revision process stated.
- Acknowledgments: reviewer-relationship disclosure per §3.3.
- Standalone scorecard added to the repository (scorecard.md and fillable
  scorecard.pdf).

### Voice

- Repeated constructions varied; "governance-consequentially significant"
  retired.

## v3 — June 2026 (Third Edition)

Initial Third Edition release. Authority pass over the Second Edition:
corrected the Tulip Trading holding (the Court of Appeal reinstated both the
fiduciary and tortious claims; neither decided on the merits), reframed
BIP-110's reception around its pending LOT=true activation, added the SegWit2x
worked example (§5.4), led the abstract with the computable-split-risk thesis,
and connected the scorecard to the legal analysis as a deterrence mechanism
(§4.0, §5.2, §6.5).

## Earlier editions

First Edition (April 2026, revised May 2026) and Second Edition (May 2026,
v2.1–v2.6) are preserved in git history and archived in `Old/`.
