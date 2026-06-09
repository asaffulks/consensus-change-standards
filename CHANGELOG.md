# Changelog

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
