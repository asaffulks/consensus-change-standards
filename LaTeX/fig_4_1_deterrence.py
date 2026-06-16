# fig_4_1_deterrence.py  ->  fig-4-1-deterrence.pdf / .png
# Figure 4.1: how a readiness score becomes legal consequence.
# A faithful diagram of the paper's own thesis (Sec 4.0, Sec 5.2, Sec 6.5):
# the framework's teeth are DETERRENCE, not enforcement -- the score documents,
# and the documentation is what the law can act on. Two paths from one score:
#   Red  -> public record of deficiencies -> notice + foreseeability (Sec 4.1)
#        -> if activated anyway and loss follows, EXPOSURE (negligent misrep
#           Sec 4.1/Rest. 552, negligence, tortious interference Sec 4.2)
#   Green/compliance -> diligence on the record -> a DEFENSE.
# Language is kept conditional ("can establish," "exposure," "a defense") to
# match the paper's hedged framing -- the figure asserts no liability outcome.
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

RED, GREEN, ORANGE = "#d9534f", "#7bb37b", "#e8a33d"
INK, EDGE = "#222222", "#555555"

fig, ax = plt.subplots(figsize=(6.4, 3.5))
ax.set_xlim(0, 10); ax.set_ylim(0, 6); ax.axis("off")

def box(x, y, w, h, text, edge, fill, fs=8.2, bold=False):
    ax.add_patch(FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.04,rounding_size=0.10",
                                linewidth=1.1, edgecolor=edge, facecolor=fill, alpha=0.95))
    ax.text(x + w / 2, y + h / 2, text, ha="center", va="center", fontsize=fs,
            color=INK, fontweight=("bold" if bold else "normal"))

def arrow(x0, y0, x1, y1, color=EDGE):
    ax.add_patch(FancyArrowPatch((x0, y0), (x1, y1), arrowstyle="-|>", mutation_scale=12,
                                 lw=1.2, color=color, shrinkA=2, shrinkB=2))

# central score node
box(0.15, 2.35, 2.25, 1.3, "Proposal scored\non the 20 criteria\n(§5.1–§5.2)", ORANGE, "#fdf1de", fs=8.4, bold=True)

# RED path (top)
arrow(2.45, 3.25, 3.05, 4.35, RED)
box(3.05, 3.85, 2.35, 1.3, "Red score:\ndeficiencies\ndocumented & public", RED, "#f7dcdb")
arrow(5.45, 4.5, 5.95, 4.5, RED)
box(5.95, 3.85, 1.85, 1.3, "Notice &\nforeseeability\nof harm (§4.1)", RED, "#f7dcdb")
arrow(7.85, 4.5, 8.05, 4.5, RED)
box(8.05, 3.7, 1.85, 1.6, "Exposure if shipped\nanyway & loss follows:\nneg. misrep. (§552),\nnegligence, interference\n(§4.2)", RED, "#f7dcdb", fs=7.3)

# GREEN path (bottom)
arrow(2.45, 2.75, 3.05, 1.65, GREEN)
box(3.05, 0.95, 2.35, 1.3, "Standard met / Green:\ndiligence on the record\n(§5.4)", GREEN, "#dcecdc")
arrow(5.45, 1.6, 5.95, 1.6, GREEN)
box(5.95, 0.95, 3.95, 1.3, "A documented defense — activation\nproceeds on a sound footing.\nThe teeth are deterrence, not enforcement.", GREEN, "#dcecdc", fs=7.8)

ax.set_title("How a readiness score becomes legal consequence",
             fontsize=10.5, fontweight="bold", color=INK, y=1.02)

fig.tight_layout()
fig.savefig("fig-4-1-deterrence.pdf", bbox_inches="tight")
fig.savefig("fig-4-1-deterrence.png", dpi=200, bbox_inches="tight")
print("fig 4.1 deterrence done")
