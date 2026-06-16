# fig_3_2_forktypes.py  ->  fig-3-2-forktypes.pdf / .png
# Figure 3.2: soft fork vs hard fork, as a validity-set relationship + the
# review-period floors. Correct-by-construction from the Glossary and Sec 3:
#   Soft fork  = TIGHTENING: every block valid under the NEW rules is still
#                valid under the OLD (strict subset) -> old nodes keep accepting
#                the upgraded chain; a split happens only if too little hashrate
#                enforces (the Sec 3.4 cliff). Review floor 12 mo / 24 mo.
#   Hard fork  = EXPANDING: the new rules accept blocks the old rules reject ->
#                old nodes reject them -> a split unless all upgrade; needs
#                replay protection. Review floor 5 yr scheduled / emergency.
# NOTE: this depicts the VALIDITY-SET relation only (the textbook definition),
# NOT data capacity -- a soft fork can only tighten, never expand capacity.
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

GREEN, RED, GRAY, ORANGE = "#7bb37b", "#d9534f", "#b9b9b9", "#e8a33d"
INK, EDGE = "#222222", "#555555"

fig, ax = plt.subplots(figsize=(6.4, 3.25))
ax.set_xlim(0, 10); ax.set_ylim(0, 5.2); ax.axis("off"); ax.set_aspect("equal")

# ---------- LEFT: SOFT FORK (subset) ----------
ax.text(2.45, 5.0, "SOFT FORK", ha="center", fontsize=10, fontweight="bold", color=INK)
ax.text(2.45, 4.62, "tightening", ha="center", fontsize=8.2, style="italic", color="#666666")
ax.add_patch(Circle((2.45, 3.05), 1.35, facecolor=GRAY, alpha=0.30, edgecolor=EDGE, lw=1.1))
ax.add_patch(Circle((2.45, 2.72), 0.72, facecolor=GREEN, alpha=0.55, edgecolor=EDGE, lw=1.1))
ax.text(2.45, 4.05, "valid under\nOLD rules", ha="center", va="center", fontsize=7.4, color="#555555")
ax.text(2.45, 2.72, "valid under\nNEW rules", ha="center", va="center", fontsize=7.2, color=INK)
ax.text(2.45, 1.28, "New blocks are a subset of old — old nodes\nstill accept the upgraded chain. A split needs\nminer defection (the §3.4 cliff).",
        ha="center", va="top", fontsize=7.3, color=INK)
ax.text(2.45, 0.28, "Review floor:  12 mo · 24 mo (high-risk)",
        ha="center", va="center", fontsize=7.6, fontweight="bold", color="#3a6b3a")

# ---------- RIGHT: HARD FORK (expanding / non-nested) ----------
ax.text(7.55, 5.0, "HARD FORK", ha="center", fontsize=10, fontweight="bold", color=INK)
ax.text(7.55, 4.62, "expanding", ha="center", fontsize=8.2, style="italic", color="#666666")
ax.add_patch(Circle((7.05, 3.05), 1.12, facecolor=GRAY, alpha=0.30, edgecolor=EDGE, lw=1.1))
ax.add_patch(Circle((8.15, 3.05), 1.12, facecolor=RED, alpha=0.40, edgecolor=EDGE, lw=1.1))
ax.text(6.62, 3.05, "OLD\nrules", ha="center", va="center", fontsize=7.4, color="#555555")
ax.text(8.58, 3.05, "NEW\nrules", ha="center", va="center", fontsize=7.4, color=INK)
ax.text(8.95, 4.16, "blocks old nodes\nreject — they split off", ha="center", va="center", fontsize=6.9, color=RED)
ax.annotate("", xy=(8.78, 3.55), xytext=(9.0, 3.95),
            arrowprops=dict(arrowstyle="-", color=RED, lw=0.7))
ax.text(7.55, 1.28, "New rules accept blocks old rules reject — old\nnodes reject them. A split unless all upgrade;\nneeds replay protection.",
        ha="center", va="top", fontsize=7.3, color=INK)
ax.text(7.55, 0.28, "Review floor:  5 yr scheduled · emergency fast-track",
        ha="center", va="center", fontsize=7.6, fontweight="bold", color="#9c3a37")

# divider
ax.plot([5.0, 5.0], [0.15, 4.55], color="#dddddd", lw=0.8)

fig.tight_layout()
fig.savefig("fig-3-2-forktypes.pdf", bbox_inches="tight")
fig.savefig("fig-3-2-forktypes.png", dpi=200, bbox_inches="tight")
print("fig 3.2 forktypes done")
