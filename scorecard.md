# Consensus Change Readiness Checklist — Scorecard

From Asaf Fulks, *Consensus Change Standards: A Legal and Technical Framework
for Bitcoin Protocol Governance* (3d ed. v3.1 2026), §5.1. A fillable PDF
version is available in this repository as `scorecard.pdf`.

**Proposal evaluated:** ____________________
**Evaluator:** ____________________
**Date:** ____________________
**Edition evaluated against:** 3d ed. v3.1 (2026)

> **Scope note.** The checklist evaluates scheduled consensus-change
> proposals. A genuine emergency hard fork (§3.7, subtype 4b) cannot, by
> construction, satisfy criteria 8, 15, or 16; it is evaluated directly
> against the subtype 4b standards, not scored here.

Mark each criterion **Met** or **Not met**. Two narrow classes of criterion
are excluded from both numerator and denominator (§5.2): **temporal**
(criteria 19 and 20 cannot fairly be applied to a proposal that activated
before any published readiness standard existed) and **structural**
(criterion 12 applies only where a UASF mechanism is used; criterion 11
applies only where the deployment includes a miner-signaling threshold).
No other not-applicable scoring is permitted.

## A. Proposal Quality

| # | Criterion | Met | Not | N/A |
|---|-----------|:---:|:---:|:---:|
| 1 | Clear, empirically supported problem statement. | ☐ | ☐ | — |
| 2 | Complete technical specification; independently implementable. | ☐ | ☐ | — |
| 3 | Backward-compatibility analysis covering all affected transaction types, scripts, and use cases. | ☐ | ☐ | — |
| 4 | Fully specified activation mechanism (threshold, timeline, failure mode). | ☐ | ☐ | — |
| 5 | Rollback procedure; self-executing sunset if labeled "temporary." | ☐ | ☐ | — |

## B. Code Quality

| # | Criterion | Met | Not | N/A |
|---|-----------|:---:|:---:|:---:|
| 6 | ≥ 3 expert reviewers from distinct organizations; prior collaboration disclosed. | ☐ | ☐ | — |
| 7 | Comprehensive unit, integration, and regression tests. | ☐ | ☐ | — |
| 8 | Testnet deployment ≥ 3 months; deactivation tested if sunset included. | ☐ | ☐ | — |
| 9 | Fuzzing and adversarial testing performed. | ☐ | ☐ | — |
| 10 | Named human reviewer attests comprehension of consensus-critical code. | ☐ | ☐ | — |

## C. Activation Safety

| # | Criterion | Met | Not | N/A |
|---|-----------|:---:|:---:|:---:|
| 11 | Miner-signaling threshold (where used) ≥ 90%. | ☐ | ☐ | ☐ |
| 12 | UASF (if used) has completed full review and broad economic-node support. | ☐ | ☐ | ☐ |
| 13 | Chain-split risk assessment completed and published. | ☐ | ☐ | — |
| 14 | Replay protection, or documented rationale where soft fork cannot split absent defection. | ☐ | ☐ | — |
| 15 | Signaling only after the review floor elapses; enforcement ≥ 6 months after final client. | ☐ | ☐ | — |

## D. Community Process

| # | Criterion | Met | Not | N/A |
|---|-----------|:---:|:---:|:---:|
| 16 | Minimum review period for risk category (12 / 24 months; §3.7 floors for hard forks). | ☐ | ☐ | — |
| 17 | Public discussion across diverse stakeholders. | ☐ | ☐ | — |
| 18 | Major exchanges and infrastructure providers consulted. | ☐ | ☐ | — |
| 19 | Chain-split contingency plan published by proposal author. | ☐ | ☐ | ☐ |
| 20 | Structured evaluation against a published readiness standard, published or answered by proponents. | ☐ | ☐ | ☐ |

## Scoring

**Total: ____ met / ____ applicable**

Classification (§5.2), by share of applicable criteria met:

| Share met | Classification |
|-----------|----------------|
| 100% | **Green** — met all applicable minimum standards; ready for activation signaling |
| 75–99% | **Yellow** — gaps to address before activation |
| 50–74% | **Orange** — significant deficiencies; do not proceed to signaling |
| Below 50% | **Red** — not ready; see §5.2 for the economic-node response |

For a proposal to which all twenty criteria apply, these bands correspond to
the original cut points: 20, 15–19, 10–14, and below 10.

Scoring choices should be published with their evidentiary basis (§5.3) —
the framework asks that evaluations be legible and challengeable, not
algorithmic. Cite the edition and version evaluated against (Appendix B.4).

---

Licensed CC BY 4.0. Reference scorings (§5.4): Taproot 17/17 applicable
(Green); BIP-110 3/20 (Red); SegWit2x ≈ 6/17 applicable (Red).
