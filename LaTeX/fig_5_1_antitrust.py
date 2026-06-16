# fig_5_1_antitrust.py  ->  fig-5-1-antitrust.pdf / .png
# Figure (placed in §5.2, displays as Figure 5.1): the antitrust line at a glance.
# A faithful 10-second decision strip for the dense §5.2 antitrust paragraph.
# Logic is taken verbatim from that paragraph: the framework publishes non-binding
# criteria each operator applies UNILATERALLY; the dividing line is AGREEMENT.
#   NO agreement  -> parallel independent conduct on published criteria is LAWFUL
#                    (Twombly: parallel conduct w/o agreement is no §1 claim;
#                     Colgate: a unilateral refusal to deal is lawful). The branch
#                    the framework is built for; Appendix B is drafted this way.
#   YES agreement -> an actual agreement to boycott is antitrust risk (Klor's per se
#                    group boycott; Superior Court Trial Lawyers: expressive character
#                    is no defense; Indiana Federation of Dentists: quick-look). The
#                    posture the framework never forms.
# The figure does NOT assert the framework is immune; it traces the §5.2 argument.
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

GREEN, RED, ORANGE, INK, EDGE = "#7bb37b", "#d9534f", "#e8a33d", "#222222", "#555555"

fig, ax = plt.subplots(figsize=(6.4, 3.7))
ax.set_xlim(0, 10); ax.set_ylim(0, 6.2); ax.axis("off")

def box(x, y, w, h, text, edge, fill, fs=7.6, bold=False, align="center"):
    ax.add_patch(FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.04,rounding_size=0.10",
                                linewidth=1.1, edgecolor=edge, facecolor=fill, alpha=0.95))
    ax.text(x + w / 2, y + h / 2, text, ha=align, va="center", fontsize=fs, color=INK,
            fontweight=("bold" if bold else "normal"))

def arrow(x0, y0, x1, y1, color=EDGE):
    ax.add_patch(FancyArrowPatch((x0, y0), (x1, y1), arrowstyle="-|>", mutation_scale=12,
                                 lw=1.2, color=color, shrinkA=2, shrinkB=2))

# top framework node
box(2.0, 5.05, 6.0, 1.0,
    "The framework publishes non-binding criteria. Each operator applies them\nUNILATERALLY — it binds no one and asks for no agreement.",
    ORANGE, "#fdf1de", fs=7.9, bold=True)

# split question
ax.text(5.0, 4.62, "Is there an agreement among operators to refuse?", ha="center",
        va="center", fontsize=7.8, style="italic", color="#444444")
arrow(4.0, 5.0, 2.9, 3.95, GREEN)
arrow(6.0, 5.0, 7.1, 3.95, RED)

# NO branch (green, left)
box(0.25, 0.55, 4.45, 3.35,
    "\n— independent, parallel conduct\non published criteria\n\nLawful.  Parallel conduct without\nagreement is no §1 claim (Twombly);\na unilateral refusal is lawful (Colgate).\n\nThis is the branch the framework is\nbuilt for — Appendix B is drafted\nfor unilateral adoption.",
    GREEN, "#dcecdc", fs=7.7)
ax.text(2.47, 3.62, "NO", ha="center", va="center", fontsize=12, fontweight="bold", color="#3a6b3a")

# YES branch (red, right)
box(5.30, 0.55, 4.45, 3.35,
    "\n— an actual agreement to boycott\n\nAntitrust risk.  A group boycott can be\nper se illegal (Klor's); its expressive\ncharacter is no defense (Trial Lawyers);\neven a \"quick look\" can condemn it\n(Indiana Dentists).\n\nThe posture the framework never forms.",
    RED, "#f7dcdb", fs=7.7)
ax.text(7.52, 3.62, "YES", ha="center", va="center", fontsize=12, fontweight="bold", color="#9c3a37")

fig.tight_layout()
fig.savefig("fig-5-1-antitrust.pdf", bbox_inches="tight")
fig.savefig("fig-5-1-antitrust.png", dpi=200, bbox_inches="tight")
print("fig 5.1 antitrust done")
