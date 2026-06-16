# fig_4_2_routes.py  ->  fig-4-2-routes.pdf / .png
# Figure 4.2: the legal-exposure landscape of Chapter 4, at a glance.
# Lifted faithfully from the validated "Chapter 4 in brief" box: the five
# exposure routes, each with its hedged trigger, unified by the §3-compliance
# defense (§4.0: "Compliance is the defense; the score is the exposure").
# Conditional language is preserved ("can," "reachable on," "unsettled") so the
# figure asserts no liability outcome -- it maps the terrain the chapter analyzes.
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, Rectangle

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

AMBER, GREEN, INK, EDGE = "#e8a33d", "#7bb37b", "#222222", "#555555"

# (theme label, section, trigger lines)
ROUTES = [
    ("Negligence /\nneg. misrep.", "§4.1",
     "Releasing activation code with known bugs and promoting its adoption;\n§552 is the cleaner route around the economic-loss rule (Biakanja on contested facts)."),
    ("Tortious\ninterference", "§4.2",
     "A proponent with documented economic exposure who pushes a change that splits\nchains — especially if the promotion looks instrumental rather than principled."),
    ("Fiduciary\nduty", "§4.3",
     "Unsettled, but Tulip Trading (UK Court of Appeal, 2023) confirmed the question is\njusticiable (claim discontinued 2024); the developer's process determines the answer."),
    ("Pool\noperators", "§4.4",
     "Pools owe care over signaling, but broad-discretion pool terms blunt the\ncontract/covenant route; exposure runs through what the pool tells its miners."),
    ("Regulatory &\nexchange", "§4.5",
     "Splits trigger income recognition on forked coins (Rev. Rul. 2019-24), custodial\nconflicts, and exchange listing calls — not hypothetical; this happened in 2017."),
]

fig, ax = plt.subplots(figsize=(6.5, 4.5))
ax.set_xlim(0, 10); ax.set_ylim(0, 10.4); ax.axis("off")

ax.text(5.0, 10.1, "The legal-exposure landscape", ha="center", va="top",
        fontsize=11, fontweight="bold", color=INK)
ax.text(5.0, 9.45, "When a negligently activated change splits the chain and people lose money,\nmore parties are exposed than most realize:",
        ha="center", va="top", fontsize=8.0, style="italic", color="#555555")

row_h = 1.28
y0 = 8.35
for i, (theme, sec, trig) in enumerate(ROUTES):
    y = y0 - i * row_h
    ax.add_patch(Rectangle((0.15, y - row_h + 0.16), 9.7, row_h - 0.18,
                           facecolor=AMBER, alpha=0.12, edgecolor=EDGE, lw=0.6))
    ax.add_patch(Rectangle((0.15, y - row_h + 0.16), 0.10, row_h - 0.18,
                           facecolor=AMBER, alpha=0.9, edgecolor="none"))  # left accent
    ax.text(0.45, y - row_h / 2 + 0.07, theme, ha="left", va="center",
            fontsize=8.7, fontweight="bold", color=INK)
    ax.text(2.55, y - row_h / 2 + 0.07, sec, ha="left", va="center",
            fontsize=8.0, color="#9c6a1d")
    ax.text(3.35, y - row_h / 2 + 0.07, trig, ha="left", va="center",
            fontsize=7.5, color=INK)

# green defense footer bar
yb = y0 - len(ROUTES) * row_h
ax.add_patch(FancyBboxPatch((0.15, yb - 0.78), 9.7, 0.86,
                            boxstyle="round,pad=0.02,rounding_size=0.08",
                            facecolor=GREEN, alpha=0.30, edgecolor=GREEN, lw=1.1))
ax.text(5.0, yb - 0.35,
        "Following the Section 3 standards is a strong defense against every route.\nCompliance is the defense; the score is the exposure (§4.0).",
        ha="center", va="center", fontsize=8.2, fontweight="bold", color="#2f5d2f")

fig.tight_layout()
fig.savefig("fig-4-2-routes.pdf", bbox_inches="tight")
fig.savefig("fig-4-2-routes.png", dpi=200, bbox_inches="tight")
print("fig 4.2 routes done")
