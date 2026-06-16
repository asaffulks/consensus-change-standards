# fig_5_1_antitrust.py  ->  fig-5-1-antitrust.pdf / .png
# Figure (placed in §5.2, displays as Figure 5.1): the antitrust line at a glance.
# A faithful 10-second decision strip for the dense §5.2 antitrust paragraph.
# Logic taken verbatim from that paragraph: the framework publishes non-binding
# criteria each operator applies UNILATERALLY; the dividing line is AGREEMENT.
#   NO agreement  -> parallel independent conduct on published criteria is LAWFUL
#                    (Twombly: parallel conduct w/o agreement is no §1 claim;
#                     Colgate: a unilateral refusal to deal is lawful).
#   YES agreement -> an actual agreement to boycott is antitrust risk (Klor's per se
#                    group boycott; Superior Court Trial Lawyers: expressive character
#                    no defense; Indiana Federation of Dentists: quick-look).
# The figure does NOT assert the framework is immune; it traces the §5.2 argument.
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

GREEN, RED, ORANGE, INK, EDGE = "#7bb37b", "#d9534f", "#e8a33d", "#222222", "#555555"

fig, ax = plt.subplots(figsize=(6.4, 4.35))
ax.set_xlim(0, 10); ax.set_ylim(0.3, 7.0); ax.axis("off")

def arrow(x0, y0, x1, y1, color=EDGE):
    ax.add_patch(FancyArrowPatch((x0, y0), (x1, y1), arrowstyle="-|>", mutation_scale=13,
                                 lw=1.3, color=color, shrinkA=2, shrinkB=2))

# top framework node (wider + 3 clean lines so nothing runs to the edge)
ax.add_patch(FancyBboxPatch((1.4, 5.55), 7.2, 1.3, boxstyle="round,pad=0.04,rounding_size=0.10",
                            linewidth=1.1, edgecolor=ORANGE, facecolor="#fdf1de", alpha=0.95))
ax.text(5.0, 6.20,
        "The framework publishes non-binding criteria;\neach operator applies them UNILATERALLY.\nIt binds no one and asks for no agreement.",
        ha="center", va="center", fontsize=8.2, fontweight="bold", color=INK)

# split question — sits BELOW the box and ABOVE the arrows, so nothing crosses it
ax.text(5.0, 5.18, "Is there an agreement among operators to refuse?", ha="center",
        va="center", fontsize=8.2, style="italic", color="#444444")
arrow(4.1, 4.85, 2.9, 4.10, GREEN)
arrow(5.9, 4.85, 7.1, 4.10, RED)

# NO branch (green, left)
ax.add_patch(FancyBboxPatch((0.25, 0.55), 4.45, 3.45, boxstyle="round,pad=0.04,rounding_size=0.10",
                            linewidth=1.1, edgecolor=GREEN, facecolor="#dcecdc", alpha=0.95))
ax.text(2.475, 3.60, "NO", ha="center", va="center", fontsize=13, fontweight="bold", color="#3a6b3a")
ax.text(2.475, 3.10,
        "— independent, parallel conduct\non published criteria\n\nLawful. Parallel conduct without\nagreement is no §1 claim (Twombly);\na unilateral refusal is lawful (Colgate).\n\nThe branch the framework is built for;\nApp. B is drafted for unilateral adoption.",
        ha="center", va="top", fontsize=8.5, color=INK)

# YES branch (red, right)
ax.add_patch(FancyBboxPatch((5.30, 0.55), 4.45, 3.45, boxstyle="round,pad=0.04,rounding_size=0.10",
                            linewidth=1.1, edgecolor=RED, facecolor="#f7dcdb", alpha=0.95))
ax.text(7.525, 3.60, "YES", ha="center", va="center", fontsize=13, fontweight="bold", color="#9c3a37")
ax.text(7.525, 3.10,
        "— an actual agreement to boycott\n\nAntitrust risk. A group boycott can be\nper se illegal (Klor's); its expressive\ncharacter is no defense (Trial Lawyers);\neven a \"quick look\" can condemn it\n(Indiana Dentists).\n\nThe posture the framework never forms.",
        ha="center", va="top", fontsize=8.5, color=INK)

fig.tight_layout()
fig.savefig("fig-5-1-antitrust.pdf", bbox_inches="tight")
fig.savefig("fig-5-1-antitrust.png", dpi=200, bbox_inches="tight")
print("fig 5.1 antitrust done")
