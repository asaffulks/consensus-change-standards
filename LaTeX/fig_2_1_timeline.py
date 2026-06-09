# fig_2_1_timeline.py  ->  fig-2-1-timeline.pdf / .png
# Figure 2.1: consensus-change governance timeline, 2012-2026.
# Event markers on the line, labels staggered above; review-interval bars below.
import matplotlib.pyplot as plt

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

# (decimal year, label, stem height tier 1-3, marker style, horizontal alignment)
EVENTS = [
    (2012.30, "P2SH activates (55%)",            1, "filled", "center"),
    (2015.92, "SegWit proposed",                 2, "filled", "right"),
    (2017.60, "SegWit activates (95%);\nBCH fork", 1, "filled", "center"),
    (2017.87, "SegWit2x canceled",               3, "filled", "center"),
    (2018.04, "Taproot proposed",                2, "filled", "left"),
    (2021.87, "Taproot activates (90%)",         1, "filled", "center"),
    (2023.04, "Ordinals released",               2, "filled", "center"),
    (2025.79, "Core v30 (relay policy)",         3, "filled", "right"),
    (2025.94, "BIP-110 client",                  1, "filled", "center"),
    (2026.36, "Knots bundles RDTS",              2, "filled", "center"),
    (2026.70, "Forced-activation\nwindow (pending)", 3, "open", "left"),
]

# (start, end, label, label x-position or None for centered, leader line bool)
SPANS = [
    (2015.92, 2017.60, "20 months", None, False),
    (2018.04, 2021.87, "≈4 years", None, False),
    (2025.82, 2025.94, "6 weeks", 2024.55, True),
]

HEIGHTS = {1: 0.22, 2: 0.46, 3: 0.70}

fig, ax = plt.subplots(figsize=(6.1, 2.9))

# baseline
ax.axhline(0, color="black", lw=1.2, zorder=1)

for x, lab, tier, style, ha in EVENTS:
    y = HEIGHTS[tier]
    ax.plot([x, x], [0, y], color="#888888", lw=0.6, zorder=2)
    if style == "open":
        ax.plot(x, 0, "o", mfc="white", mec="black", ms=5, zorder=3)
    else:
        ax.plot(x, 0, "o", color="black", ms=4.5, zorder=3)
    ax.text(x, y + 0.03, lab, ha=ha, va="bottom", fontsize=7.2)

# review-interval bars below the line
y_span = -0.28
for x0, x1, lab, labx, leader in SPANS:
    ax.plot([x0, x1], [y_span, y_span], color="black", lw=2.2,
            solid_capstyle="butt", zorder=2)
    for xe in (x0, x1):
        ax.plot([xe, xe], [y_span - 0.035, y_span + 0.035], color="black", lw=1.0)
    if leader:
        ax.annotate(lab, xy=((x0 + x1) / 2, y_span), xytext=(labx, y_span - 0.02),
                    fontsize=7.5, ha="right", va="center",
                    arrowprops=dict(arrowstyle="-", lw=0.6, color="#666666"))
    else:
        ax.text((x0 + x1) / 2, y_span - 0.09, lab, ha="center", va="top", fontsize=7.5)

ax.text(2011.95, y_span, "review\nintervals", ha="left", va="center",
        fontsize=7.0, color="#444444", style="italic")

ax.set_xlim(2011.8, 2027.4)
ax.set_ylim(-0.55, 1.05)
ax.set_xticks(range(2012, 2027, 2))
ax.set_yticks([])
for s in ["top", "right", "left"]:
    ax.spines[s].set_visible(False)
ax.spines["bottom"].set_position(("data", -0.55))
ax.tick_params(axis="x", labelsize=8)

fig.tight_layout()
fig.savefig("fig-2-1-timeline.pdf")
fig.savefig("fig-2-1-timeline.png", dpi=200)
print("fig 2.1 done")
